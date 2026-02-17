// ScreenTimeTracker.swift
// Aperture
//
// Screen Time Integration
// Track actual app usage vs budgets using iOS Screen Time API
//
// Requirements:
// 1. Add "Family Controls" capability in Xcode
// 2. User must approve Screen Time access
// 3. Works on iOS 16+
//
// Note: Screen Time API is heavily restricted - this provides
// what's possible within Apple's privacy guidelines

import Combine
import Foundation
import SwiftUI

// Import conditionally since these frameworks may not be available in all contexts
#if canImport(FamilyControls)
  import DeviceActivity
  import FamilyControls
  import ManagedSettings
#endif

// MARK: - App Category

enum AppUsageCategory: String, CaseIterable, Codable {
  case socialMedia = "Social Media"
  case entertainment = "Entertainment"
  case productivity = "Productivity"
  case games = "Games"
  case news = "News"
  case other = "Other"

  var icon: String {
    switch self {
    case .socialMedia: return "bubble.left.and.bubble.right.fill"
    case .entertainment: return "tv.fill"
    case .productivity: return "briefcase.fill"
    case .games: return "gamecontroller.fill"
    case .news: return "newspaper.fill"
    case .other: return "app.fill"
    }
  }

  var color: Color {
    switch self {
    case .socialMedia: return .pink
    case .entertainment: return .purple
    case .productivity: return .blue
    case .games: return .orange
    case .news: return .gray
    case .other: return .secondary
    }
  }

  /// Common apps in each category (for manual tracking fallback)
  var commonApps: [String] {
    switch self {
    case .socialMedia:
      return [
        "Instagram", "TikTok", "Twitter", "X", "Facebook", "Snapchat", "LinkedIn", "Threads",
        "BeReal",
      ]
    case .entertainment:
      return [
        "YouTube", "Netflix", "Spotify", "Disney+", "Hulu", "HBO Max", "Twitch", "Prime Video",
      ]
    case .productivity:
      return ["Slack", "Notion", "Trello", "Asana", "Microsoft Teams", "Zoom", "Google Meet"]
    case .games:
      return ["Roblox", "Minecraft", "Fortnite", "Candy Crush", "Clash Royale"]
    case .news:
      return ["Apple News", "Twitter", "Reddit", "Flipboard", "Google News"]
    case .other:
      return []
    }
  }
}

// MARK: - Usage Entry

struct AppUsageEntry: Identifiable, Codable {
  let id: UUID
  var category: AppUsageCategory
  var appName: String?
  var minutesUsed: Int
  var date: Date
  var isManual: Bool  // true if user logged manually

  init(
    id: UUID = UUID(), category: AppUsageCategory, appName: String? = nil, minutesUsed: Int,
    date: Date = Date(), isManual: Bool = true
  ) {
    self.id = id
    self.category = category
    self.appName = appName
    self.minutesUsed = minutesUsed
    self.date = date
    self.isManual = isManual
  }
}

// MARK: - Daily Summary

struct DailyUsageSummary: Identifiable, Codable {
  let id: UUID
  let date: Date
  var entries: [AppUsageEntry]
  var totalMinutes: Int
  var socialMediaMinutes: Int
  var budgetMinutes: Int
  var budgetRemaining: Int

  init(date: Date, entries: [AppUsageEntry] = [], budgetMinutes: Int = 30) {
    id = UUID()
    self.date = date
    self.entries = entries
    totalMinutes = entries.reduce(0) { $0 + $1.minutesUsed }
    socialMediaMinutes = entries.filter { $0.category == .socialMedia }.reduce(0) {
      $0 + $1.minutesUsed
    }
    self.budgetMinutes = budgetMinutes
    budgetRemaining = max(0, budgetMinutes - socialMediaMinutes)
  }

  var isOverBudget: Bool {
    socialMediaMinutes > budgetMinutes
  }

  var budgetPercentUsed: Double {
    guard budgetMinutes > 0 else { return 0 }
    return min(1.0, Double(socialMediaMinutes) / Double(budgetMinutes))
  }
}

// MARK: - Screen Time Tracker

@MainActor
final class ScreenTimeTracker: ObservableObject {
  static let shared = ScreenTimeTracker()

  // MARK: - Published State

  @Published var isAuthorized = false
  @Published var authorizationStatus: ScreenTimeAuthStatus = .notDetermined
  @Published var todaySummary: DailyUsageSummary?
  @Published var weekSummaries: [DailyUsageSummary] = []
  @Published var socialMediaBudget: Int = 30  // minutes
  @Published var currentStreak: Int = 0  // days under budget

  // MARK: - Storage

  private let defaults = UserDefaults.standard
  private let entriesKey = "screentime_entries"
  private let budgetKey = "screentime_budget"
  private let summariesKey = "screentime_summaries"

  // MARK: - Family Controls (iOS 16+)

  #if canImport(FamilyControls)
    private let authCenter = AuthorizationCenter.shared
  #endif

  // MARK: - Initialization

  init() {
    loadData()
    checkAuthorizationStatus()
    generateTodaySummary()
  }

  // MARK: - Authorization

  func requestAuthorization() async {
    #if canImport(FamilyControls)
      do {
        try await authCenter.requestAuthorization(for: .individual)
        await MainActor.run {
          self.isAuthorized = true
          self.authorizationStatus = .authorized
        }
      } catch {
        await MainActor.run {
          self.authorizationStatus = .denied
        }
        print("Screen Time authorization failed: \(error)")
      }
    #else
      // Fallback for simulators or older iOS
      authorizationStatus = .restricted
    #endif
  }

  private func checkAuthorizationStatus() {
    #if canImport(FamilyControls)
      switch authCenter.authorizationStatus {
      case .approved:
        isAuthorized = true
        authorizationStatus = .authorized
      case .denied:
        authorizationStatus = .denied
      case .notDetermined:
        authorizationStatus = .notDetermined
      @unknown default:
        authorizationStatus = .notDetermined
      }
    #else
      authorizationStatus = .restricted
    #endif
  }

  // MARK: - Manual Logging

  /// Log app usage manually (fallback when Screen Time API not available)
  func logUsage(category: AppUsageCategory, appName: String? = nil, minutes: Int) {
    let entry = AppUsageEntry(
      category: category,
      appName: appName,
      minutesUsed: minutes,
      date: Date(),
      isManual: true
    )

    addEntry(entry)
    generateTodaySummary()
    checkBudgetAndNotify()
  }

  /// Quick log for social media
  func logSocialMedia(minutes: Int) {
    logUsage(category: .socialMedia, minutes: minutes)
  }

  private func addEntry(_ entry: AppUsageEntry) {
    var entries = loadEntries()
    entries.append(entry)
    saveEntries(entries)
  }

  // MARK: - Data Management

  private func loadData() {
    socialMediaBudget = defaults.integer(forKey: budgetKey)
    if socialMediaBudget == 0 { socialMediaBudget = 30 }

    loadWeekSummaries()
    calculateStreak()
  }

  func setBudget(_ minutes: Int) {
    socialMediaBudget = minutes
    defaults.set(minutes, forKey: budgetKey)
    generateTodaySummary()
  }

  private func loadEntries() -> [AppUsageEntry] {
    guard let data = defaults.data(forKey: entriesKey),
      let entries = try? JSONDecoder().decode([AppUsageEntry].self, from: data)
    else {
      return []
    }
    return entries
  }

  private func saveEntries(_ entries: [AppUsageEntry]) {
    if let data = try? JSONEncoder().encode(entries) {
      defaults.set(data, forKey: entriesKey)
    }
  }

  private func loadWeekSummaries() {
    guard let data = defaults.data(forKey: summariesKey),
      let summaries = try? JSONDecoder().decode([DailyUsageSummary].self, from: data)
    else {
      weekSummaries = []
      return
    }

    // Keep only last 7 days
    let weekAgo = Calendar.current.date(byAdding: .day, value: -7, to: Date())!
    weekSummaries = summaries.filter { $0.date >= weekAgo }
  }

  private func saveSummaries() {
    if let data = try? JSONEncoder().encode(weekSummaries) {
      defaults.set(data, forKey: summariesKey)
    }
  }

  // MARK: - Summary Generation

  func generateTodaySummary() {
    let calendar = Calendar.current
    let today = calendar.startOfDay(for: Date())

    let entries = loadEntries()
    let todayEntries = entries.filter { calendar.isDate($0.date, inSameDayAs: today) }

    todaySummary = DailyUsageSummary(
      date: today,
      entries: todayEntries,
      budgetMinutes: socialMediaBudget
    )

    // Update week summaries
    if let existing = weekSummaries.firstIndex(where: {
      calendar.isDate($0.date, inSameDayAs: today)
    }) {
      weekSummaries[existing] = todaySummary!
    } else {
      weekSummaries.append(todaySummary!)
    }

    saveSummaries()
  }

  private func calculateStreak() {
    let calendar = Calendar.current
    var streak = 0
    var checkDate = calendar.startOfDay(for: Date())

    // Go back day by day
    for summary in weekSummaries.sorted(by: { $0.date > $1.date }) {
      if calendar.isDate(summary.date, inSameDayAs: checkDate) {
        if !summary.isOverBudget {
          streak += 1
          checkDate = calendar.date(byAdding: .day, value: -1, to: checkDate)!
        } else {
          break
        }
      }
    }

    currentStreak = streak
  }

  // MARK: - Budget Checking

  private func checkBudgetAndNotify() {
    guard let summary = todaySummary else { return }

    // Check if approaching or over budget
    if summary.socialMediaMinutes >= Int(Double(socialMediaBudget) * 0.8) {
      Task {
        await FlowNotificationManager.shared.scheduleSocialMediaReminder(
          budgetMinutes: socialMediaBudget,
          usedMinutes: summary.socialMediaMinutes
        )
      }
    }
  }

  // MARK: - Statistics

  /// Average social media usage over last 7 days
  var weeklyAverageSocialMedia: Int {
    guard !weekSummaries.isEmpty else { return 0 }
    let total = weekSummaries.reduce(0) { $0 + $1.socialMediaMinutes }
    return total / weekSummaries.count
  }

  /// Total screen time today
  var todayTotalMinutes: Int {
    todaySummary?.totalMinutes ?? 0
  }

  /// Days under budget this week
  var daysUnderBudget: Int {
    weekSummaries.filter { !$0.isOverBudget }.count
  }

  /// Get usage by category for today
  func usageByCategory() -> [AppUsageCategory: Int] {
    guard let summary = todaySummary else { return [:] }

    var result: [AppUsageCategory: Int] = [:]
    for entry in summary.entries {
      result[entry.category, default: 0] += entry.minutesUsed
    }
    return result
  }
}

// MARK: - Authorization Status

enum ScreenTimeAuthStatus {
  case notDetermined
  case authorized
  case denied
  case restricted  // Not available (simulator, old iOS)

  var description: String {
    switch self {
    case .notDetermined: return "Not Set Up"
    case .authorized: return "Authorized"
    case .denied: return "Denied"
    case .restricted: return "Not Available"
    }
  }
}

// MARK: - Screen Time View

struct ScreenTimeView: View {
  @StateObject private var tracker = ScreenTimeTracker.shared
  @State private var showLogSheet = false
  @State private var logCategory: AppUsageCategory = .socialMedia
  @State private var logMinutes = 15

  var body: some View {
    NavigationStack {
      ZStack {
        Color(hex: "#0a0a1a")
          .ignoresSafeArea()

        ScrollView {
          VStack(spacing: 24) {
            budgetCard
            todaySummaryCard
            weekOverviewCard
            quickLogSection
          }
          .padding()
        }
      }
      .navigationTitle("Screen Time")
      .navigationBarTitleDisplayMode(.inline)
      .sheet(isPresented: $showLogSheet) {
        logUsageSheet
      }
    }
  }

  // MARK: - Budget Card

  private var budgetCard: some View {
    VStack(spacing: 16) {
      HStack {
        VStack(alignment: .leading, spacing: 4) {
          Text("SOCIAL MEDIA BUDGET")
            .font(.caption.bold())
            .foregroundColor(.white.opacity(0.5))
            .tracking(1)

          Text(
            "\(tracker.todaySummary?.socialMediaMinutes ?? 0) / \(tracker.socialMediaBudget) min"
          )
          .font(.title2.bold())
          .foregroundColor(.white)
        }

        Spacer()

        // Progress ring
        ZStack {
          Circle()
            .stroke(Color.white.opacity(0.1), lineWidth: 8)
            .frame(width: 70, height: 70)

          Circle()
            .trim(from: 0, to: tracker.todaySummary?.budgetPercentUsed ?? 0)
            .stroke(
              budgetColor,
              style: StrokeStyle(lineWidth: 8, lineCap: .round)
            )
            .frame(width: 70, height: 70)
            .rotationEffect(.degrees(-90))

          Text("\(Int((tracker.todaySummary?.budgetPercentUsed ?? 0) * 100))%")
            .font(.caption.bold())
            .foregroundColor(.white)
        }
      }

      // Streak
      HStack {
        Image(systemName: "flame.fill")
          .foregroundColor(.orange)

        Text("\(tracker.currentStreak) day streak")
          .font(.subheadline)
          .foregroundColor(.white.opacity(0.7))

        Spacer()

        if tracker.todaySummary?.isOverBudget == true {
          Text("Over budget!")
            .font(.caption.bold())
            .foregroundColor(.red)
        } else {
          Text("\(tracker.todaySummary?.budgetRemaining ?? 0) min left")
            .font(.caption)
            .foregroundColor(.green)
        }
      }
    }
    .padding()
    .background(
      RoundedRectangle(cornerRadius: 20)
        .fill(Color.white.opacity(0.05))
        .overlay(
          RoundedRectangle(cornerRadius: 20)
            .stroke(budgetColor.opacity(0.5), lineWidth: 1)
        )
    )
  }

  private var budgetColor: Color {
    let percent = tracker.todaySummary?.budgetPercentUsed ?? 0
    if percent >= 1.0 { return .red }
    if percent >= 0.8 { return .orange }
    return .green
  }

  // MARK: - Today Summary

  private var todaySummaryCard: some View {
    VStack(alignment: .leading, spacing: 12) {
      Text("TODAY'S USAGE")
        .font(.caption.bold())
        .foregroundColor(.white.opacity(0.5))
        .tracking(1)

      let usage = tracker.usageByCategory()

      if usage.isEmpty {
        Text("No usage logged yet")
          .font(.subheadline)
          .foregroundColor(.white.opacity(0.5))
          .frame(maxWidth: .infinity)
          .padding()
      } else {
        ForEach(Array(usage.keys.sorted(by: { usage[$0]! > usage[$1]! })), id: \.self) { category in
          HStack {
            Image(systemName: category.icon)
              .foregroundColor(category.color)
              .frame(width: 30)

            Text(category.rawValue)
              .font(.subheadline)
              .foregroundColor(.white)

            Spacer()

            Text("\(usage[category]!) min")
              .font(.subheadline.bold())
              .foregroundColor(category.color)
          }
          .padding(.vertical, 8)
        }
      }
    }
    .padding()
    .background(Color.white.opacity(0.05))
    .cornerRadius(16)
  }

  // MARK: - Week Overview

  private var weekOverviewCard: some View {
    VStack(alignment: .leading, spacing: 12) {
      Text("THIS WEEK")
        .font(.caption.bold())
        .foregroundColor(.white.opacity(0.5))
        .tracking(1)

      HStack(spacing: 16) {
        ScreenTimeStatBox(
          value: "\(tracker.weeklyAverageSocialMedia)",
          label: "Avg Social",
          unit: "min/day",
          color: .pink
        )

        ScreenTimeStatBox(
          value: "\(tracker.daysUnderBudget)",
          label: "Under Budget",
          unit: "days",
          color: .green
        )

        ScreenTimeStatBox(
          value: "\(tracker.currentStreak)",
          label: "Streak",
          unit: "days",
          color: .orange
        )
      }
    }
    .padding()
    .background(Color.white.opacity(0.05))
    .cornerRadius(16)
  }

  // MARK: - Quick Log

  private var quickLogSection: some View {
    VStack(alignment: .leading, spacing: 12) {
      HStack {
        Text("QUICK LOG")
          .font(.caption.bold())
          .foregroundColor(.white.opacity(0.5))
          .tracking(1)

        Spacer()

        Button {
          showLogSheet = true
        } label: {
          Image(systemName: "plus.circle.fill")
            .foregroundColor(Color(hex: "#7C4DFF"))
        }
      }

      HStack(spacing: 12) {
        QuickLogButton(label: "+5 min", category: .socialMedia) {
          tracker.logSocialMedia(minutes: 5)
        }

        QuickLogButton(label: "+15 min", category: .socialMedia) {
          tracker.logSocialMedia(minutes: 15)
        }

        QuickLogButton(label: "+30 min", category: .socialMedia) {
          tracker.logSocialMedia(minutes: 30)
        }
      }
    }
    .padding()
    .background(Color.white.opacity(0.05))
    .cornerRadius(16)
  }

  // MARK: - Log Sheet

  private var logUsageSheet: some View {
    NavigationStack {
      ZStack {
        Color(hex: "#0a0a1a")
          .ignoresSafeArea()

        VStack(spacing: 24) {
          // Category picker
          VStack(alignment: .leading, spacing: 8) {
            Text("Category")
              .font(.subheadline.bold())
              .foregroundColor(.white.opacity(0.7))

            Picker("Category", selection: $logCategory) {
              ForEach(AppUsageCategory.allCases, id: \.self) { cat in
                Text(cat.rawValue).tag(cat)
              }
            }
            .pickerStyle(.segmented)
          }

          // Minutes
          VStack(alignment: .leading, spacing: 8) {
            Text("Minutes Used")
              .font(.subheadline.bold())
              .foregroundColor(.white.opacity(0.7))

            HStack {
              Slider(
                value: Binding(
                  get: { Double(logMinutes) },
                  set: { logMinutes = Int($0) }
                ), in: 1...120, step: 1
              )
              .tint(logCategory.color)

              Text("\(logMinutes) min")
                .font(.headline)
                .foregroundColor(.white)
                .frame(width: 70)
            }
          }

          Spacer()

          Button {
            tracker.logUsage(category: logCategory, minutes: logMinutes)
            showLogSheet = false
          } label: {
            Text("Log Usage")
              .fontWeight(.semibold)
              .foregroundColor(.black)
              .frame(maxWidth: .infinity)
              .padding()
              .background(logCategory.color)
              .cornerRadius(12)
          }
        }
        .padding()
      }
      .navigationTitle("Log Usage")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .topBarLeading) {
          Button("Cancel") {
            showLogSheet = false
          }
          .foregroundColor(.white)
        }
      }
    }
    .presentationDetents([.medium])
  }
}

// MARK: - Supporting Views

struct ScreenTimeStatBox: View {
  let value: String
  let label: String
  let unit: String
  let color: Color

  var body: some View {
    VStack(spacing: 4) {
      Text(value)
        .font(.title2.bold())
        .foregroundColor(color)

      Text(label)
        .font(.caption)
        .foregroundColor(.white.opacity(0.7))

      Text(unit)
        .font(.caption2)
        .foregroundColor(.white.opacity(0.5))
    }
    .frame(maxWidth: .infinity)
  }
}

struct QuickLogButton: View {
  let label: String
  let category: AppUsageCategory
  let action: () -> Void

  var body: some View {
    Button(action: action) {
      Text(label)
        .font(.subheadline.bold())
        .foregroundColor(category.color)
        .frame(maxWidth: .infinity)
        .padding(.vertical, 12)
        .background(category.color.opacity(0.2))
        .cornerRadius(12)
    }
  }
}

#Preview {
  ScreenTimeView()
}
