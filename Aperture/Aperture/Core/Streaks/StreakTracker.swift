// StreakTracker.swift
// Universal streak tracking for daily practices
// Supports Solar Sovereignty, 3-6-9, SATS, and more

import SwiftUI

// MARK: - Streak Entity

struct PracticeStreak: Codable, Identifiable {
  let id: String
  var name: String
  var icon: String
  var colorHex: String
  var currentStreak: Int
  var longestStreak: Int
  var totalCompletions: Int
  var lastCompletedDate: Date?
  var completionHistory: [Date]  // All completion dates
  var streakFreezes: Int  // Get-out-of-jail cards

  var color: Color {
    Color(hex: colorHex)
  }

  var isCompletedToday: Bool {
    guard let last = lastCompletedDate else { return false }
    return Calendar.current.isDateInToday(last)
  }

  var streakStatus: StreakStatus {
    guard let last = lastCompletedDate else { return .notStarted }

    if Calendar.current.isDateInToday(last) {
      return .completedToday
    }

    if Calendar.current.isDateInYesterday(last) {
      return .needsCompletion
    }

    // More than 1 day ago - streak broken unless freeze used
    return .broken
  }

  enum StreakStatus {
    case notStarted
    case completedToday
    case needsCompletion
    case broken

    var message: String {
      switch self {
      case .notStarted: return "Start your streak!"
      case .completedToday: return "Completed today ✓"
      case .needsCompletion: return "Complete today to continue!"
      case .broken: return "Streak broken - restart today"
      }
    }
  }

  mutating func logCompletion() {
    let today = Date()

    // Check if already completed today
    if isCompletedToday { return }

    // Update streak
    if let last = lastCompletedDate {
      if Calendar.current.isDateInYesterday(last) {
        // Continuing streak
        currentStreak += 1
      } else if !Calendar.current.isDateInToday(last) {
        // Streak broken, starting fresh
        currentStreak = 1
      }
    } else {
      // First completion
      currentStreak = 1
    }

    // Update records
    if currentStreak > longestStreak {
      longestStreak = currentStreak
    }

    totalCompletions += 1
    lastCompletedDate = today
    completionHistory.append(today)
  }

  mutating func useStreakFreeze() -> Bool {
    guard streakFreezes > 0 else { return false }
    guard streakStatus == .broken else { return false }

    streakFreezes -= 1
    // Restore streak by pretending yesterday was completed
    lastCompletedDate = Calendar.current.date(byAdding: .day, value: -1, to: Date())
    return true
  }
}

// MARK: - Streak Manager

class StreakManager: ObservableObject {
  static let shared = StreakManager()

  @Published var streaks: [PracticeStreak] = []

  private let storageKey = "practice_streaks"

  init() {
    load()
    initializeDefaultStreaks()
  }

  private func initializeDefaultStreaks() {
    let defaults: [PracticeStreak] = [
      PracticeStreak(
        id: "solar_sovereignty",
        name: "Solar Sovereignty",
        icon: "sun.max.fill",
        colorHex: "#FFD700",
        currentStreak: 0,
        longestStreak: 0,
        totalCompletions: 0,
        lastCompletedDate: nil,
        completionHistory: [],
        streakFreezes: 3
      ),
      PracticeStreak(
        id: "three_six_nine",
        name: "3-6-9 Practice",
        icon: "rotate.3d",
        colorHex: "#9C27B0",
        currentStreak: 0,
        longestStreak: 0,
        totalCompletions: 0,
        lastCompletedDate: nil,
        completionHistory: [],
        streakFreezes: 3
      ),
      PracticeStreak(
        id: "sats_session",
        name: "SATS Session",
        icon: "moon.zzz.fill",
        colorHex: "#3F51B5",
        currentStreak: 0,
        longestStreak: 0,
        totalCompletions: 0,
        lastCompletedDate: nil,
        completionHistory: [],
        streakFreezes: 3
      ),
      PracticeStreak(
        id: "mental_diet",
        name: "Mental Diet",
        icon: "brain.head.profile",
        colorHex: "#00BCD4",
        currentStreak: 0,
        longestStreak: 0,
        totalCompletions: 0,
        lastCompletedDate: nil,
        completionHistory: [],
        streakFreezes: 3
      ),
      PracticeStreak(
        id: "meditation",
        name: "Meditation",
        icon: "figure.mind.and.body",
        colorHex: "#4CAF50",
        currentStreak: 0,
        longestStreak: 0,
        totalCompletions: 0,
        lastCompletedDate: nil,
        completionHistory: [],
        streakFreezes: 3
      ),
    ]

    // Only add streaks that don't exist
    for defaultStreak in defaults {
      if !streaks.contains(where: { $0.id == defaultStreak.id }) {
        streaks.append(defaultStreak)
      }
    }

    save()
  }

  func logCompletion(for practiceId: String) {
    guard let index = streaks.firstIndex(where: { $0.id == practiceId }) else { return }
    streaks[index].logCompletion()
    save()
  }

  func useFreeze(for practiceId: String) -> Bool {
    guard let index = streaks.firstIndex(where: { $0.id == practiceId }) else { return false }
    let success = streaks[index].useStreakFreeze()
    if success { save() }
    return success
  }

  func streak(for practiceId: String) -> PracticeStreak? {
    streaks.first { $0.id == practiceId }
  }

  func load() {
    guard let data = UserDefaults.standard.data(forKey: storageKey),
      let decoded = try? JSONDecoder().decode([PracticeStreak].self, from: data)
    else {
      return
    }
    streaks = decoded
  }

  func save() {
    if let encoded = try? JSONEncoder().encode(streaks) {
      UserDefaults.standard.set(encoded, forKey: storageKey)
    }
  }
}

// MARK: - Streak Card View

struct StreakCardView: View {
  let streak: PracticeStreak
  var onComplete: () -> Void

  @State private var flameScale: CGFloat = 1.0

  var body: some View {
    VStack(spacing: 16) {
      HStack {
        // Icon with flame indicator
        ZStack {
          Circle()
            .fill(streak.color.opacity(0.2))
            .frame(width: 50, height: 50)

          Image(systemName: streak.icon)
            .font(.system(size: 22))
            .foregroundColor(streak.color)

          // Streak flame
          if streak.currentStreak > 0 {
            Image(systemName: "flame.fill")
              .font(.system(size: 14))
              .foregroundColor(.orange)
              .offset(x: 18, y: -18)
              .scaleEffect(flameScale)
          }
        }

        VStack(alignment: .leading, spacing: 4) {
          Text(streak.name)
            .font(.system(size: 16, weight: .bold))
            .foregroundColor(.white)

          Text(streak.streakStatus.message)
            .font(.system(size: 11))
            .foregroundColor(statusColor)
        }

        Spacer()

        // Streak count
        VStack(alignment: .trailing, spacing: 2) {
          HStack(spacing: 4) {
            if streak.currentStreak > 0 {
              Image(systemName: "flame.fill")
                .font(.system(size: 14))
                .foregroundColor(.orange)
            }
            Text("\(streak.currentStreak)")
              .font(.system(size: 28, weight: .black, design: .rounded))
              .foregroundColor(streak.currentStreak > 0 ? streak.color : .white.opacity(0.4))
          }
          Text("day streak")
            .font(.system(size: 9))
            .foregroundColor(.white.opacity(0.5))
        }
      }

      // Stats row
      HStack(spacing: 20) {
        statItem("Best", "\(streak.longestStreak)", "trophy.fill", .yellow)
        statItem("Total", "\(streak.totalCompletions)", "checkmark.circle.fill", .green)
        statItem("Freezes", "\(streak.streakFreezes)", "snowflake", .cyan)

        Spacer()

        // Complete button
        if !streak.isCompletedToday {
          Button {
            onComplete()
          } label: {
            HStack(spacing: 6) {
              Image(systemName: "checkmark")
                .font(.system(size: 12, weight: .bold))
              Text("Log")
                .font(.system(size: 12, weight: .bold))
            }
            .foregroundColor(.black)
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background(
              Capsule()
                .fill(streak.color)
            )
          }
        } else {
          HStack(spacing: 4) {
            Image(systemName: "checkmark.circle.fill")
            Text("Done")
          }
          .font(.system(size: 12, weight: .semibold))
          .foregroundColor(.green)
        }
      }
    }
    .padding(16)
    .background(
      RoundedRectangle(cornerRadius: 16)
        .fill(Color.white.opacity(0.05))
        .overlay(
          RoundedRectangle(cornerRadius: 16)
            .stroke(
              streak.isCompletedToday ? Color.green.opacity(0.3) : streak.color.opacity(0.2),
              lineWidth: 1)
        )
    )
    .onAppear {
      if streak.currentStreak > 0 {
        withAnimation(.easeInOut(duration: 0.5).repeatForever(autoreverses: true)) {
          flameScale = 1.2
        }
      }
    }
  }

  private func statItem(_ label: String, _ value: String, _ icon: String, _ color: Color)
    -> some View
  {
    VStack(spacing: 2) {
      HStack(spacing: 4) {
        Image(systemName: icon)
          .font(.system(size: 10))
          .foregroundColor(color)
        Text(value)
          .font(.system(size: 13, weight: .bold))
          .foregroundColor(.white)
      }
      Text(label)
        .font(.system(size: 8))
        .foregroundColor(.white.opacity(0.5))
    }
  }

  private var statusColor: Color {
    switch streak.streakStatus {
    case .completedToday: return .green
    case .needsCompletion: return .orange
    case .broken: return .red
    case .notStarted: return .white.opacity(0.5)
    }
  }
}

// MARK: - Streak Hub View

struct StreakHubView: View {
  @ObservedObject var manager = StreakManager.shared
  @Environment(\.dismiss) private var dismiss
  @State private var showCompletionCelebration = false
  @State private var celebratingStreak: PracticeStreak?

  var body: some View {
    NavigationStack {
      ZStack {
        LinearGradient(
          colors: [Color(hex: "#0A0805"), Color(hex: "#1A1510")],
          startPoint: .top,
          endPoint: .bottom
        )
        .ignoresSafeArea()

        ScrollView(showsIndicators: false) {
          VStack(spacing: 20) {
            // Header stats
            overviewCard

            // Calendar heatmap
            calendarHeatmap

            // Individual streaks
            ForEach(manager.streaks) { streak in
              StreakCardView(streak: streak) {
                HapticManager.shared.success()
                manager.logCompletion(for: streak.id)
                celebratingStreak = streak
                showCompletionCelebration = true
              }
            }

            Spacer(minLength: 100)
          }
          .padding(.horizontal, 20)
          .padding(.top, 20)
        }
      }
      .navigationTitle("Daily Practices")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .topBarTrailing) {
          Button {
            dismiss()
          } label: {
            Image(systemName: "xmark.circle.fill")
              .foregroundColor(.white.opacity(0.6))
          }
        }
      }
      .sheet(isPresented: $showCompletionCelebration) {
        if let streak = celebratingStreak {
          StreakCelebrationView(streak: streak)
        }
      }
    }
  }

  private var overviewCard: some View {
    VStack(spacing: 16) {
      HStack {
        VStack(alignment: .leading, spacing: 4) {
          Text("TOTAL STREAKS")
            .font(.system(size: 10, weight: .bold))
            .foregroundColor(.orange)
            .tracking(1)

          Text("\(totalActiveStreaks) Active")
            .font(.system(size: 20, weight: .bold))
            .foregroundColor(.white)
        }

        Spacer()

        // Combined streak fire
        ZStack {
          Circle()
            .fill(
              RadialGradient(
                colors: [.orange.opacity(0.4), Color.clear],
                center: .center,
                startRadius: 10,
                endRadius: 40
              )
            )
            .frame(width: 80, height: 80)

          VStack(spacing: 0) {
            Image(systemName: "flame.fill")
              .font(.system(size: 30))
              .foregroundColor(.orange)
            Text("\(combinedStreak)")
              .font(.system(size: 16, weight: .black))
              .foregroundColor(.white)
          }
        }
      }

      // Today's status
      HStack(spacing: 12) {
        ForEach(manager.streaks.prefix(5)) { streak in
          ZStack {
            Circle()
              .fill(streak.isCompletedToday ? streak.color.opacity(0.3) : Color.white.opacity(0.1))
              .frame(width: 36, height: 36)

            Image(systemName: streak.isCompletedToday ? "checkmark" : streak.icon)
              .font(.system(size: 14))
              .foregroundColor(streak.isCompletedToday ? .green : streak.color.opacity(0.5))
          }
        }

        Spacer()

        Text("\(completedToday)/\(manager.streaks.count) today")
          .font(.system(size: 12))
          .foregroundColor(.white.opacity(0.6))
      }
    }
    .padding(16)
    .background(
      RoundedRectangle(cornerRadius: 16)
        .fill(Color.white.opacity(0.05))
        .overlay(
          RoundedRectangle(cornerRadius: 16)
            .stroke(Color.orange.opacity(0.3), lineWidth: 1)
        )
    )
  }

  private var calendarHeatmap: some View {
    VStack(alignment: .leading, spacing: 12) {
      Text("LAST 30 DAYS")
        .font(.system(size: 10, weight: .bold))
        .foregroundColor(.white.opacity(0.5))
        .tracking(1)

      LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 4), count: 7), spacing: 4)
      {
        ForEach(0..<30, id: \.self) { dayOffset in
          let date = Calendar.current.date(byAdding: .day, value: -29 + dayOffset, to: Date())!
          let completions = completionsOn(date)

          RoundedRectangle(cornerRadius: 4)
            .fill(heatmapColor(for: completions))
            .frame(height: 20)
        }
      }

      // Legend
      HStack(spacing: 4) {
        Text("Less")
          .font(.system(size: 8))
          .foregroundColor(.white.opacity(0.5))

        ForEach(0..<5, id: \.self) { level in
          RoundedRectangle(cornerRadius: 2)
            .fill(heatmapColor(for: level))
            .frame(width: 12, height: 12)
        }

        Text("More")
          .font(.system(size: 8))
          .foregroundColor(.white.opacity(0.5))
      }
    }
    .padding(16)
    .background(
      RoundedRectangle(cornerRadius: 16)
        .fill(Color.white.opacity(0.03))
    )
  }

  private func completionsOn(_ date: Date) -> Int {
    manager.streaks.filter { streak in
      streak.completionHistory.contains { completion in
        Calendar.current.isDate(completion, inSameDayAs: date)
      }
    }.count
  }

  private func heatmapColor(for completions: Int) -> Color {
    switch completions {
    case 0: return Color.white.opacity(0.05)
    case 1: return Color.green.opacity(0.2)
    case 2: return Color.green.opacity(0.4)
    case 3: return Color.green.opacity(0.6)
    default: return Color.green.opacity(0.8)
    }
  }

  private var totalActiveStreaks: Int {
    manager.streaks.filter { $0.currentStreak > 0 }.count
  }

  private var combinedStreak: Int {
    manager.streaks.reduce(0) { $0 + $1.currentStreak }
  }

  private var completedToday: Int {
    manager.streaks.filter { $0.isCompletedToday }.count
  }
}

// MARK: - Celebration View

struct StreakCelebrationView: View {
  let streak: PracticeStreak
  @Environment(\.dismiss) private var dismiss
  @State private var showContent = false

  var body: some View {
    ZStack {
      Color.black.opacity(0.95).ignoresSafeArea()

      VStack(spacing: 24) {
        Spacer()

        if showContent {
          // Flame animation
          ZStack {
            Circle()
              .fill(
                RadialGradient(
                  colors: [streak.color.opacity(0.4), Color.clear],
                  center: .center,
                  startRadius: 20,
                  endRadius: 80
                )
              )
              .frame(width: 160, height: 160)

            Image(systemName: "flame.fill")
              .font(.system(size: 70))
              .foregroundStyle(
                LinearGradient(
                  colors: [.yellow, .orange, .red],
                  startPoint: .top,
                  endPoint: .bottom
                )
              )
          }

          Text("STREAK!")
            .font(.system(size: 32, weight: .black, design: .rounded))
            .foregroundColor(.white)

          HStack(spacing: 4) {
            Text("\(streak.currentStreak)")
              .font(.system(size: 48, weight: .black))
              .foregroundColor(streak.color)
            Text("days")
              .font(.system(size: 20, weight: .medium))
              .foregroundColor(.white.opacity(0.6))
          }

          Text(streak.name)
            .font(.system(size: 16))
            .foregroundColor(.white.opacity(0.6))

          // Milestone badges
          if streak.currentStreak == 7 {
            milestoneBadge("🔥 WEEK WARRIOR")
          } else if streak.currentStreak == 30 {
            milestoneBadge("🏆 MONTHLY MASTER")
          } else if streak.currentStreak == 100 {
            milestoneBadge("👑 CENTURION")
          }
        }

        Spacer()

        Button {
          dismiss()
        } label: {
          Text("Keep Going!")
            .font(.system(size: 16, weight: .bold))
            .foregroundColor(.black)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .background(
              RoundedRectangle(cornerRadius: 12)
                .fill(streak.color)
            )
        }
        .padding(.horizontal, 40)
        .padding(.bottom, 40)
      }
    }
    .onAppear {
      withAnimation(.spring(response: 0.6, dampingFraction: 0.7)) {
        showContent = true
      }
    }
  }

  private func milestoneBadge(_ text: String) -> some View {
    Text(text)
      .font(.system(size: 14, weight: .bold))
      .foregroundColor(.white)
      .padding(.horizontal, 16)
      .padding(.vertical, 8)
      .background(
        Capsule()
          .fill(
            LinearGradient(
              colors: [.purple, .pink],
              startPoint: .leading,
              endPoint: .trailing
            )
          )
      )
  }
}

// MARK: - Mini Streak Badge (for nav bars)

struct MiniStreakBadge: View {
  let practiceId: String
  @ObservedObject var manager = StreakManager.shared

  var streak: PracticeStreak? {
    manager.streak(for: practiceId)
  }

  var body: some View {
    HStack(spacing: 4) {
      Image(systemName: "flame.fill")
        .font(.system(size: 12))
        .foregroundColor((streak?.currentStreak ?? 0) > 0 ? .orange : .gray)

      Text("\(streak?.currentStreak ?? 0)")
        .font(.system(size: 14, weight: .bold, design: .rounded))
        .foregroundColor((streak?.currentStreak ?? 0) > 0 ? .orange : .gray)
    }
    .padding(.horizontal, 8)
    .padding(.vertical, 4)
    .background(
      Capsule()
        .fill(Color.orange.opacity((streak?.currentStreak ?? 0) > 0 ? 0.2 : 0.05))
    )
  }
}

#Preview {
  StreakHubView()
}
