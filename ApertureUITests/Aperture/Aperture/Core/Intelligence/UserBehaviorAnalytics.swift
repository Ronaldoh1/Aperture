// UserBehaviorAnalytics.swift
// Intelligence Layer - Tracking user patterns for personalization
// ☀️ SunFlow: Reignited

import Combine
import SwiftUI

// MARK: - Behavior Event Types

enum BehaviorEventType: String, Codable, CaseIterable {
  // Content engagement
  case courseStarted = "course_started"
  case courseCompleted = "course_completed"
  case lessonViewed = "lesson_viewed"
  case lessonCompleted = "lesson_completed"
  case practiceStarted = "practice_started"
  case practiceCompleted = "practice_completed"

  // Navigation patterns
  case tabSelected = "tab_selected"
  case screenViewed = "screen_viewed"
  case searchPerformed = "search_performed"
  case deepLinkOpened = "deep_link_opened"

  // Engagement signals
  case contentShared = "content_shared"
  case contentBookmarked = "content_bookmarked"
  case dragonAsked = "dragon_asked"
  case insightLogged = "insight_logged"

  // Session patterns
  case sessionStarted = "session_started"
  case sessionEnded = "session_ended"
  case appBackgrounded = "app_backgrounded"
  case appForegrounded = "app_foregrounded"

  // Feature discovery
  case featureDiscovered = "feature_discovered"
  case godModeUnlocked = "godmode_unlocked"
  case premiumViewed = "premium_viewed"

  var weight: Double {
    switch self {
    case .courseCompleted: return 10.0
    case .lessonCompleted: return 3.0
    case .practiceCompleted: return 5.0
    case .contentShared: return 8.0
    case .contentBookmarked: return 4.0
    case .dragonAsked: return 2.0
    case .insightLogged: return 6.0
    case .courseStarted: return 2.0
    case .lessonViewed: return 1.0
    case .practiceStarted: return 1.5
    default: return 1.0
    }
  }
}

// MARK: - Behavior Event

struct BehaviorEvent: Codable, Identifiable {
  let id: String
  let type: BehaviorEventType
  let timestamp: Date
  let metadata: [String: String]
  let sessionId: String

  init(type: BehaviorEventType, metadata: [String: String] = [:], sessionId: String) {
    id = UUID().uuidString
    self.type = type
    timestamp = Date()
    self.metadata = metadata
    self.sessionId = sessionId
  }
}

// MARK: - User Interest Profile

struct UserInterestProfile: Codable {
  var topicScores: [String: Double] = [:]
  var categoryScores: [String: Double] = [:]
  var difficultyPreference: Double = 0.5  // 0 = beginner, 1 = advanced
  var sessionLengthPreference: Double = 15  // minutes
  var preferredTimeOfDay: Int = 12  // hour (0-23)
  var engagementLevel: Double = 0.5  // 0 = casual, 1 = intense
  var contentTypePreferences: [String: Double] = [:]

  /// Derived interests
  var topInterests: [String] {
    topicScores.sorted { $0.value > $1.value }
      .prefix(5)
      .map { $0.key }
  }

  var preferredCategory: String? {
    categoryScores.max(by: { $0.value < $1.value })?.key
  }

  var isAdvancedUser: Bool {
    difficultyPreference > 0.6
  }
}

// MARK: - Session Data

struct SessionData: Codable {
  let id: String
  let startTime: Date
  var endTime: Date?
  var events: [BehaviorEvent]
  var screenViews: [String]
  var totalDurationSeconds: Int {
    guard let end = endTime else {
      return Int(Date().timeIntervalSince(startTime))
    }
    return Int(end.timeIntervalSince(startTime))
  }
}

// MARK: - User Behavior Analytics Manager

@MainActor
class UserBehaviorAnalytics: ObservableObject {
  static let shared = UserBehaviorAnalytics()

  // Published state
  @Published private(set) var interestProfile = UserInterestProfile()
  @Published private(set) var recentEvents: [BehaviorEvent] = []
  @Published private(set) var currentSession: SessionData?
  @Published private(set) var isAnalyzing = false

  // Storage keys
  private let profileKey = "aperture.analytics.profile.v1"
  private let eventsKey = "aperture.analytics.events.v1"
  private let sessionsKey = "aperture.analytics.sessions.v1"

  // Configuration
  private let maxStoredEvents = 1000
  private let analysisThreshold = 10  // Events before re-analysis
  private var eventsSinceLastAnalysis = 0

  private init() {
    loadProfile()
    loadRecentEvents()
    startSession()
  }

  // MARK: - Session Management

  func startSession() {
    let session = SessionData(
      id: UUID().uuidString,
      startTime: Date(),
      endTime: nil,
      events: [],
      screenViews: []
    )
    currentSession = session

    track(.sessionStarted)
  }

  func endSession() {
    guard var session = currentSession else { return }
    session.endTime = Date()

    track(
      .sessionEnded,
      metadata: [
        "duration_seconds": "\(session.totalDurationSeconds)",
        "event_count": "\(session.events.count)",
      ])

    // Update session length preference
    let minutes = Double(session.totalDurationSeconds) / 60.0
    interestProfile.sessionLengthPreference =
      interestProfile.sessionLengthPreference * 0.8 + minutes * 0.2

    saveProfile()
    currentSession = nil
  }

  // MARK: - Event Tracking

  func track(_ type: BehaviorEventType, metadata: [String: String] = [:]) {
    guard let sessionId = currentSession?.id else { return }

    let event = BehaviorEvent(
      type: type,
      metadata: metadata,
      sessionId: sessionId
    )

    recentEvents.append(event)
    currentSession?.events.append(event)

    // Trim old events
    if recentEvents.count > maxStoredEvents {
      recentEvents = Array(recentEvents.suffix(maxStoredEvents))
    }

    saveEvents()

    // Process event for profile updates
    processEvent(event)

    // Periodic analysis
    eventsSinceLastAnalysis += 1
    if eventsSinceLastAnalysis >= analysisThreshold {
      Task {
        await analyzePatterns()
      }
      eventsSinceLastAnalysis = 0
    }
  }

  // MARK: - Convenience Tracking Methods

  func trackCourseStarted(courseId: String, category: String) {
    track(
      .courseStarted,
      metadata: [
        "course_id": courseId,
        "category": category,
      ])

    // Boost category interest
    boostInterest(category: category, amount: 2.0)
  }

  func trackCourseCompleted(courseId: String, category: String, durationMinutes: Int) {
    track(
      .courseCompleted,
      metadata: [
        "course_id": courseId,
        "category": category,
        "duration_minutes": "\(durationMinutes)",
      ])

    // Strong boost for completion
    boostInterest(category: category, amount: 10.0)
  }

  func trackLessonViewed(lessonId: String, courseId: String, topic: String) {
    track(
      .lessonViewed,
      metadata: [
        "lesson_id": lessonId,
        "course_id": courseId,
        "topic": topic,
      ])

    boostInterest(topic: topic, amount: 1.0)
  }

  func trackLessonCompleted(lessonId: String, courseId: String, topic: String, durationSeconds: Int)
  {
    track(
      .lessonCompleted,
      metadata: [
        "lesson_id": lessonId,
        "course_id": courseId,
        "topic": topic,
        "duration_seconds": "\(durationSeconds)",
      ])

    boostInterest(topic: topic, amount: 3.0)

    // Update difficulty preference based on completion
    updateDifficultyPreference(completed: true)
  }

  func trackScreenViewed(_ screenName: String) {
    track(.screenViewed, metadata: ["screen": screenName])
    currentSession?.screenViews.append(screenName)
  }

  func trackSearch(query: String, resultCount: Int) {
    track(
      .searchPerformed,
      metadata: [
        "query": query,
        "result_count": "\(resultCount)",
      ])

    // Extract topics from search
    let topics = extractTopics(from: query)
    for topic in topics {
      boostInterest(topic: topic, amount: 2.0)
    }
  }

  func trackDragonQuestion(topic: String) {
    track(.dragonAsked, metadata: ["topic": topic])
    boostInterest(topic: topic, amount: 2.0)
  }

  func trackContentShared(contentId: String, contentType: String) {
    track(
      .contentShared,
      metadata: [
        "content_id": contentId,
        "content_type": contentType,
      ])

    // Strong signal - user found this valuable enough to share
    boostInterest(contentType: contentType, amount: 8.0)
  }

  func trackBookmark(contentId: String, contentType: String, topic: String) {
    track(
      .contentBookmarked,
      metadata: [
        "content_id": contentId,
        "content_type": contentType,
        "topic": topic,
      ])

    boostInterest(topic: topic, amount: 4.0)
  }

  // MARK: - Interest Processing

  private func processEvent(_ event: BehaviorEvent) {
    // Update time of day preference
    let hour = Calendar.current.component(.hour, from: event.timestamp)
    interestProfile.preferredTimeOfDay = Int(
      Double(interestProfile.preferredTimeOfDay) * 0.9 + Double(hour) * 0.1
    )

    // Update engagement level based on event weight
    let engagementDelta = event.type.weight / 100.0
    interestProfile.engagementLevel = min(
      1.0,
      interestProfile.engagementLevel * 0.95 + engagementDelta)
  }

  private func boostInterest(topic: String, amount: Double) {
    let normalizedTopic = topic.lowercased()
    let current = interestProfile.topicScores[normalizedTopic] ?? 0
    interestProfile.topicScores[normalizedTopic] = min(100, current + amount)

    // Decay other topics slightly
    for key in interestProfile.topicScores.keys where key != normalizedTopic {
      interestProfile.topicScores[key] = max(0, (interestProfile.topicScores[key] ?? 0) * 0.99)
    }

    saveProfile()
  }

  private func boostInterest(category: String, amount: Double) {
    let current = interestProfile.categoryScores[category] ?? 0
    interestProfile.categoryScores[category] = min(100, current + amount)
    saveProfile()
  }

  private func boostInterest(contentType: String, amount: Double) {
    let current = interestProfile.contentTypePreferences[contentType] ?? 0
    interestProfile.contentTypePreferences[contentType] = min(100, current + amount)
    saveProfile()
  }

  private func updateDifficultyPreference(completed: Bool) {
    if completed {
      // Slightly increase difficulty preference on completion
      interestProfile.difficultyPreference = min(
        1.0,
        interestProfile.difficultyPreference + 0.02)
    } else {
      // Decrease on abandon
      interestProfile.difficultyPreference = max(
        0,
        interestProfile.difficultyPreference - 0.05)
    }
    saveProfile()
  }

  private func extractTopics(from query: String) -> [String] {
    // Simple topic extraction - could be enhanced with NLP
    let keywords = [
      "consciousness", "awakening", "meditation", "gnostic",
      "thoth", "emerald", "dragon", "cosmos", "timeline",
      "ai", "machine", "soul", "spirit", "wisdom", "ancient",
      "forbidden", "gospel", "egypt", "atlantis", "hermetic",
    ]

    let lowercased = query.lowercased()
    return keywords.filter { lowercased.contains($0) }
  }

  // MARK: - Pattern Analysis

  func analyzePatterns() async {
    isAnalyzing = true
    defer { isAnalyzing = false }

    // Analyze recent events for patterns
    let recentWindow = recentEvents.suffix(100)

    // Time pattern analysis
    var hourCounts: [Int: Int] = [:]
    for event in recentWindow {
      let hour = Calendar.current.component(.hour, from: event.timestamp)
      hourCounts[hour, default: 0] += 1
    }
    if let peakHour = hourCounts.max(by: { $0.value < $1.value })?.key {
      interestProfile.preferredTimeOfDay = peakHour
    }

    // Session length analysis (placeholder for future implementation)
    _ = recentWindow.filter {
      $0.type == .sessionStarted || $0.type == .sessionEnded
    }

    // Content type analysis
    var contentCounts: [String: Int] = [:]
    for event in recentWindow {
      if let contentType = event.metadata["content_type"] {
        contentCounts[contentType, default: 0] += 1
      }
    }

    // Category analysis
    var categoryCounts: [String: Int] = [:]
    for event in recentWindow {
      if let category = event.metadata["category"] {
        categoryCounts[category, default: 0] += 1
      }
    }

    // Update profile based on analysis
    for (category, count) in categoryCounts {
      let boost = Double(count) * 0.5
      interestProfile.categoryScores[category] =
        (interestProfile.categoryScores[category] ?? 0) + boost
    }

    saveProfile()
  }

  // MARK: - Querying

  func getTopInterests(limit: Int = 5) -> [String] {
    return Array(interestProfile.topInterests.prefix(limit))
  }

  func getInterestScore(for topic: String) -> Double {
    return interestProfile.topicScores[topic.lowercased()] ?? 0
  }

  func getCategoryScore(for category: String) -> Double {
    return interestProfile.categoryScores[category] ?? 0
  }

  func getRecommendedDifficulty() -> String {
    if interestProfile.difficultyPreference < 0.33 {
      return "Beginner"
    } else if interestProfile.difficultyPreference < 0.66 {
      return "Intermediate"
    } else {
      return "Advanced"
    }
  }

  func getEngagementLevel() -> String {
    if interestProfile.engagementLevel < 0.33 {
      return "Casual"
    } else if interestProfile.engagementLevel < 0.66 {
      return "Regular"
    } else {
      return "Dedicated"
    }
  }

  func getEventCount(for type: BehaviorEventType, inLastDays days: Int = 7) -> Int {
    let cutoff = Calendar.current.date(byAdding: .day, value: -days, to: Date()) ?? Date()
    return recentEvents.filter { $0.type == type && $0.timestamp > cutoff }.count
  }

  // MARK: - Persistence

  private func loadProfile() {
    if let data = UserDefaults.standard.data(forKey: profileKey),
      let profile = try? JSONDecoder().decode(UserInterestProfile.self, from: data)
    {
      interestProfile = profile
    }
  }

  private func saveProfile() {
    if let data = try? JSONEncoder().encode(interestProfile) {
      UserDefaults.standard.set(data, forKey: profileKey)
    }
  }

  private func loadRecentEvents() {
    if let data = UserDefaults.standard.data(forKey: eventsKey),
      let events = try? JSONDecoder().decode([BehaviorEvent].self, from: data)
    {
      recentEvents = events
    }
  }

  private func saveEvents() {
    // Only save recent events to prevent unbounded growth
    let toSave = Array(recentEvents.suffix(maxStoredEvents))
    if let data = try? JSONEncoder().encode(toSave) {
      UserDefaults.standard.set(data, forKey: eventsKey)
    }
  }

  // MARK: - Debug

  #if DEBUG
    func resetAnalytics() {
      interestProfile = UserInterestProfile()
      recentEvents = []
      currentSession = nil
      UserDefaults.standard.removeObject(forKey: profileKey)
      UserDefaults.standard.removeObject(forKey: eventsKey)
      startSession()
    }

    func printDebugInfo() {
      print("=== User Behavior Analytics ===")
      print("Top Interests: \(interestProfile.topInterests)")
      print("Category Scores: \(interestProfile.categoryScores)")
      print("Difficulty Pref: \(interestProfile.difficultyPreference)")
      print("Engagement: \(interestProfile.engagementLevel)")
      print("Events: \(recentEvents.count)")
      print("===============================")
    }
  #endif
}
