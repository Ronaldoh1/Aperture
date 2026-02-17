// UserJourneyStore.swift
// Stores the user's awakening journey type and personalization preferences
// Persists across sessions via UserDefaults

import Combine
import SwiftUI

// MARK: - User Journey Type

enum UserJourneyType: String, Codable, CaseIterable {
  case groundMe = "ground_me"  // Crisis Journey → Awakening (grounding)
  case showPatterns = "show_patterns"  // Seeker Journey → Timeline + Cosmos
  case teachPractice = "teach_practice"  // Practitioner → Awakening (courses)
  case giveSources = "give_sources"  // Scholar Journey → Alexandria + Timeline

  var title: String {
    switch self {
    case .groundMe: return "Ground me"
    case .showPatterns: return "Show me patterns"
    case .teachPractice: return "Teach me practice"
    case .giveSources: return "Give me sources"
    }
  }

  var subtitle: String {
    switch self {
    case .groundMe: return "I need stability and peace"
    case .showPatterns: return "I want to understand what's really happening"
    case .teachPractice: return "I want methods to transform"
    case .giveSources: return "I want primary texts and evidence"
    }
  }

  var icon: String {
    switch self {
    case .groundMe: return "🌙"
    case .showPatterns: return "🔍"
    case .teachPractice: return "🧘"
    case .giveSources: return "📚"
    }
  }

  var primaryModule: String {
    switch self {
    case .groundMe: return "Awakening"
    case .showPatterns: return "Timeline"
    case .teachPractice: return "Awakening"
    case .giveSources: return "Alexandria"
    }
  }

  var primaryTabIndex: Int {
    switch self {
    case .groundMe: return 3  // Awakening tab
    case .showPatterns: return 1  // Timeline tab
    case .teachPractice: return 3  // Awakening tab
    case .giveSources: return 4  // More (Alexandria) - but we'll navigate directly
    }
  }

  var recommendedContent: String {
    switch self {
    case .groundMe: return "Start with grounding practices to find your center."
    case .showPatterns: return "Explore hidden history and cosmic patterns."
    case .teachPractice: return "Begin your awakening with guided courses."
    case .giveSources: return "Access primary texts and sacred sources."
    }
  }

  var welcomeMessage: String {
    switch self {
    case .groundMe: return "You're seeking peace. Let's find solid ground together."
    case .showPatterns: return "A seeker of truth! Learn to see what others miss."
    case .teachPractice: return "Ready to transform? Follow the practices that work."
    case .giveSources: return "A scholar's heart! Explore the original sources."
    }
  }

  var color: Color {
    switch self {
    case .groundMe: return .purple
    case .showPatterns: return .cyan
    case .teachPractice: return Palette.accent.gold
    case .giveSources: return .green
    }
  }
}

// MARK: - Quick Access Item

struct QuickAccessItem: Codable, Identifiable, Equatable {
  let id: String
  let title: String
  let icon: String
  let destination: QuickAccessDestination

  static let defaultItems: [QuickAccessItem] = [
    QuickAccessItem(
      id: "practice", title: "Practice", icon: "figure.mind.and.body", destination: .practice),
    QuickAccessItem(id: "course", title: "Course", icon: "book.fill", destination: .currentCourse),
    QuickAccessItem(id: "badges", title: "Badges", icon: "seal.fill", destination: .badges),
  ]
}

enum QuickAccessDestination: String, Codable {
  case practice
  case currentCourse
  case badges
  case timeline
  case cosmos
  case alexandria
  case custom
}

// MARK: - User Journey Store

@MainActor
class UserJourneyStore: ObservableObject {
  static let shared = UserJourneyStore()

  // MARK: - Published Properties

  @Published private(set) var hasCompletedOnboarding: Bool = false
  @Published private(set) var journeyType: UserJourneyType?
  @Published private(set) var quickAccessItems: [QuickAccessItem] = QuickAccessItem.defaultItems

  // Continue tracking
  @Published private(set) var lastViewedScreen: String?
  @Published private(set) var lastCourseId: String?
  @Published private(set) var lastLessonId: String?
  @Published private(set) var lastPracticeId: String?

  // MARK: - Storage Keys

  private let keys = (
    hasCompletedOnboarding: "aperture.onboarding.completed.v1",
    journeyType: "aperture.journey.type.v1",
    quickAccessItems: "aperture.quickaccess.items.v1",
    lastViewedScreen: "aperture.continue.screen.v1",
    lastCourseId: "aperture.continue.course.v1",
    lastLessonId: "aperture.continue.lesson.v1",
    lastPracticeId: "aperture.continue.practice.v1"
  )

  // MARK: - Initialization

  private init() {
    load()
  }

  // MARK: - Load

  private func load() {
    hasCompletedOnboarding = UserDefaults.standard.bool(forKey: keys.hasCompletedOnboarding)

    if let typeString = UserDefaults.standard.string(forKey: keys.journeyType),
      let type = UserJourneyType(rawValue: typeString)
    {
      journeyType = type
    }

    if let data = UserDefaults.standard.data(forKey: keys.quickAccessItems),
      let items = try? JSONDecoder().decode([QuickAccessItem].self, from: data)
    {
      quickAccessItems = items
    }

    lastViewedScreen = UserDefaults.standard.string(forKey: keys.lastViewedScreen)
    lastCourseId = UserDefaults.standard.string(forKey: keys.lastCourseId)
    lastLessonId = UserDefaults.standard.string(forKey: keys.lastLessonId)
    lastPracticeId = UserDefaults.standard.string(forKey: keys.lastPracticeId)
  }

  // MARK: - Onboarding

  /// Complete onboarding with journey selection (from quiz)
  func completeOnboarding(journeyType: UserJourneyType) {
    hasCompletedOnboarding = true
    self.journeyType = journeyType

    // Set default quick access based on journey
    quickAccessItems = defaultQuickAccess(for: journeyType)

    // Save
    UserDefaults.standard.set(true, forKey: keys.hasCompletedOnboarding)
    UserDefaults.standard.set(journeyType.rawValue, forKey: keys.journeyType)

    if let data = try? JSONEncoder().encode(quickAccessItems) {
      UserDefaults.standard.set(data, forKey: keys.quickAccessItems)
    }
  }

  /// Complete onboarding without quiz (after introduction only)
  /// Uses default journey type - user can personalize later in settings
  func completeOnboardingWithDefaults() {
    hasCompletedOnboarding = true
    journeyType = .showPatterns  // Default: seeker journey
    quickAccessItems = QuickAccessItem.defaultItems

    // Save
    UserDefaults.standard.set(true, forKey: keys.hasCompletedOnboarding)
    UserDefaults.standard.set(UserJourneyType.showPatterns.rawValue, forKey: keys.journeyType)
  }

  private func defaultQuickAccess(for journey: UserJourneyType) -> [QuickAccessItem] {
    switch journey {
    case .groundMe:
      return [
        QuickAccessItem(
          id: "practice", title: "Practice", icon: "figure.mind.and.body", destination: .practice),
        QuickAccessItem(id: "badges", title: "Badges", icon: "seal.fill", destination: .badges),
        QuickAccessItem(
          id: "course", title: "Course", icon: "book.fill", destination: .currentCourse),
      ]
    case .showPatterns:
      return [
        QuickAccessItem(
          id: "timeline", title: "Timeline", icon: "clock.arrow.circlepath", destination: .timeline),
        QuickAccessItem(
          id: "cosmos", title: "Cosmos", icon: "globe.americas.fill", destination: .cosmos),
        QuickAccessItem(id: "badges", title: "Badges", icon: "seal.fill", destination: .badges),
      ]
    case .teachPractice:
      return [
        QuickAccessItem(
          id: "course", title: "Course", icon: "book.fill", destination: .currentCourse),
        QuickAccessItem(
          id: "practice", title: "Practice", icon: "figure.mind.and.body", destination: .practice),
        QuickAccessItem(id: "badges", title: "Badges", icon: "seal.fill", destination: .badges),
      ]
    case .giveSources:
      return [
        QuickAccessItem(
          id: "alexandria", title: "Library", icon: "books.vertical.fill", destination: .alexandria),
        QuickAccessItem(
          id: "timeline", title: "Timeline", icon: "clock.arrow.circlepath", destination: .timeline),
        QuickAccessItem(id: "badges", title: "Badges", icon: "seal.fill", destination: .badges),
      ]
    }
  }

  // MARK: - Quick Access

  func updateQuickAccess(_ items: [QuickAccessItem]) {
    quickAccessItems = items
    if let data = try? JSONEncoder().encode(items) {
      UserDefaults.standard.set(data, forKey: keys.quickAccessItems)
    }
  }

  // MARK: - Continue Tracking

  func trackScreen(_ screen: String) {
    lastViewedScreen = screen
    UserDefaults.standard.set(screen, forKey: keys.lastViewedScreen)
  }

  func trackCourseProgress(courseId: String, lessonId: String) {
    lastCourseId = courseId
    lastLessonId = lessonId
    UserDefaults.standard.set(courseId, forKey: keys.lastCourseId)
    UserDefaults.standard.set(lessonId, forKey: keys.lastLessonId)
  }

  func trackPractice(_ practiceId: String) {
    lastPracticeId = practiceId
    UserDefaults.standard.set(practiceId, forKey: keys.lastPracticeId)
  }

  // MARK: - Reset

  func resetForDebug() {
    hasCompletedOnboarding = false
    journeyType = nil
    quickAccessItems = QuickAccessItem.defaultItems
    lastViewedScreen = nil
    lastCourseId = nil
    lastLessonId = nil
    lastPracticeId = nil

    UserDefaults.standard.removeObject(forKey: keys.hasCompletedOnboarding)
    UserDefaults.standard.removeObject(forKey: keys.journeyType)
    UserDefaults.standard.removeObject(forKey: keys.quickAccessItems)
    UserDefaults.standard.removeObject(forKey: keys.lastViewedScreen)
    UserDefaults.standard.removeObject(forKey: keys.lastCourseId)
    UserDefaults.standard.removeObject(forKey: keys.lastLessonId)
    UserDefaults.standard.removeObject(forKey: keys.lastPracticeId)
  }
}
