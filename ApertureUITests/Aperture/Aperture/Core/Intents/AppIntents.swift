// AppIntents.swift
// Siri Shortcuts and App Intents for Aperture
// "Hey Siri, open my courses" / "Hey Siri, show my dragon"

import AppIntents
import SwiftUI

// MARK: - Open Courses Intent

@available(iOS 16.0, *)
struct OpenCoursesIntent: AppIntent {
  static var title: LocalizedStringResource = "Open Courses"
  static var description = IntentDescription("Open the Aperture course library")
  static var openAppWhenRun: Bool = true

  func perform() async throws -> some IntentResult {
    // This will open the app to the courses tab
    await MainActor.run {
      DeepLinkHandler.shared.navigate(to: .course(id: ""))
    }
    return .result()
  }
}

// MARK: - Open Specific Course Intent

@available(iOS 16.0, *)
struct OpenCourseIntent: AppIntent {
  static var title: LocalizedStringResource = "Open Course"
  static var description = IntentDescription("Open a specific course in Aperture")
  static var openAppWhenRun: Bool = true

  @Parameter(title: "Course")
  var course: CourseEntity?

  func perform() async throws -> some IntentResult {
    if let courseId = course?.id {
      await MainActor.run {
        DeepLinkHandler.shared.navigate(to: .course(id: courseId))
      }
    }
    return .result()
  }

  static var parameterSummary: some ParameterSummary {
    Summary("Open \(\.$course)")
  }
}

// MARK: - Course Entity for Siri

@available(iOS 16.0, *)
struct CourseEntity: AppEntity {
  var id: String
  var name: String
  var description: String

  static var typeDisplayRepresentation: TypeDisplayRepresentation = "Course"
  static var defaultQuery = CourseEntityQuery()

  var displayRepresentation: DisplayRepresentation {
    DisplayRepresentation(title: "\(name)", subtitle: "\(description)")
  }
}

@available(iOS 16.0, *)
struct CourseEntityQuery: EntityQuery {
  func entities(for identifiers: [String]) async throws -> [CourseEntity] {
    // Return courses matching the identifiers
    return getCourses().filter { identifiers.contains($0.id) }
  }

  func suggestedEntities() async throws -> [CourseEntity] {
    // Return suggested courses
    return getCourses()
  }

  private func getCourses() -> [CourseEntity] {
    // Return available courses
    return [
      CourseEntity(
        id: "dragonball", name: "Dragon Ball Awakening", description: "DB consciousness teachings"),
      CourseEntity(
        id: "consciousness_phd", name: "PhD Consciousness", description: "The science of mind"),
      CourseEntity(
        id: "sacred_geometry", name: "Sacred Geometry", description: "The language of creation"),
      CourseEntity(
        id: "quantum", name: "Quantum Reality", description: "Physics that changed everything"),
      CourseEntity(
        id: "money-fundamentals", name: "Money Fundamentals", description: "Financial education"),
      CourseEntity(
        id: "anti-scam-awareness", name: "Don't Fall For The Vibes",
        description: "Protection from scams"),
      CourseEntity(
        id: "stock-market-fundamentals", name: "Stock Market Decoded",
        description: "Investing vs gambling"),
      CourseEntity(
        id: "crypto-fundamentals", name: "Crypto Without The Hype",
        description: "Understanding blockchain"),
    ]
  }
}

// MARK: - Show Dragon Intent

@available(iOS 16.0, *)
struct ShowBadgesIntent: AppIntent {
  static var title: LocalizedStringResource = "Show My Badges"
  static var description = IntentDescription(
    "View your Sacred Geometry badge collection in Aperture")
  static var openAppWhenRun: Bool = true

  func perform() async throws -> some IntentResult {
    await MainActor.run {
      DeepLinkHandler.shared.navigate(to: .badges)
    }
    return .result()
  }
}

// MARK: - Open Timeline Intent

@available(iOS 16.0, *)
struct OpenTimelineIntent: AppIntent {
  static var title: LocalizedStringResource = "Open Timeline"
  static var description = IntentDescription("Explore the cosmic timeline in Aperture")
  static var openAppWhenRun: Bool = true

  func perform() async throws -> some IntentResult {
    await MainActor.run {
      DeepLinkHandler.shared.navigate(to: .timeline)
    }
    return .result()
  }
}

// MARK: - Open Cosmos Intent

@available(iOS 16.0, *)
struct OpenCosmosIntent: AppIntent {
  static var title: LocalizedStringResource = "Explore Cosmos"
  static var description = IntentDescription("Explore the cosmos in Aperture")
  static var openAppWhenRun: Bool = true

  func perform() async throws -> some IntentResult {
    await MainActor.run {
      DeepLinkHandler.shared.navigate(to: .cosmos)
    }
    return .result()
  }
}

// MARK: - Open Alexandria Intent

@available(iOS 16.0, *)
struct OpenAlexandriaIntent: AppIntent {
  static var title: LocalizedStringResource = "Open Alexandria Library"
  static var description = IntentDescription("Access the sacred texts library in Aperture")
  static var openAppWhenRun: Bool = true

  func perform() async throws -> some IntentResult {
    await MainActor.run {
      DeepLinkHandler.shared.navigate(to: .alexandria)
    }
    return .result()
  }
}

// MARK: - Get Progress Intent

@available(iOS 16.0, *)
struct GetProgressIntent: AppIntent {
  static var title: LocalizedStringResource = "Get My Progress"
  static var description = IntentDescription("Check your learning progress in Aperture")

  func perform() async throws -> some IntentResult & ReturnsValue<String> {
    // Get progress from UserDefaults or your data store
    let completedCourses = UserDefaults.standard.integer(forKey: "completed_courses_count")
    let completedLessons = UserDefaults.standard.integer(forKey: "completed_lessons_count")

    let message =
      "You've completed \(completedCourses) courses and \(completedLessons) lessons in Aperture."

    return .result(value: message)
  }
}

// MARK: - Daily Wisdom Intent

@available(iOS 16.0, *)
struct DailyWisdomIntent: AppIntent {
  static var title: LocalizedStringResource = "Get Daily Wisdom"
  static var description = IntentDescription("Receive a wisdom quote from Aperture")

  func perform() async throws -> some IntentResult & ReturnsValue<String> {
    let wisdoms = [
      "The observer effect proves that consciousness affects reality.",
      "The 7 Dragon Balls represent the 7 chakras - collecting them activates your full power.",
      "Ultra Instinct is gnosis - moving without thinking because you ARE the awareness.",
      "Money is created from debt. Understanding this is the first step to financial freedom.",
      "Sacred geometry is the architecture of the universe - it's in everything from atoms to galaxies.",
      "The timeline of consciousness is written, but you're the one holding the pen.",
      "Your dragon companion grows as you grow. Feed it with knowledge.",
      "Question everything. Especially this.",
      "The matrix isn't a movie - it's a documentary mistaken for fiction.",
      "Awakening isn't about learning new information. It's about unlearning lies.",
    ]

    let randomWisdom = wisdoms.randomElement() ?? wisdoms[0]

    return .result(value: "💫 \(randomWisdom)")
  }
}

// MARK: - App Shortcuts Provider

@available(iOS 16.0, *)
struct ApertureShortcuts: AppShortcutsProvider {
  static var appShortcuts: [AppShortcut] {
    AppShortcut(
      intent: OpenCoursesIntent(),
      phrases: [
        "Open my courses in \(.applicationName)",
        "Show courses in \(.applicationName)",
        "Open \(.applicationName) courses",
      ],
      shortTitle: "Open Courses",
      systemImageName: "book.fill"
    )

    AppShortcut(
      intent: ShowBadgesIntent(),
      phrases: [
        "Show my badges in \(.applicationName)",
        "Open badge collection in \(.applicationName)",
        "Show my \(.applicationName) badges",
      ],
      shortTitle: "Show Badges",
      systemImageName: "seal.fill"
    )

    AppShortcut(
      intent: OpenTimelineIntent(),
      phrases: [
        "Open timeline in \(.applicationName)",
        "Show the cosmic timeline in \(.applicationName)",
      ],
      shortTitle: "Open Timeline",
      systemImageName: "clock.arrow.circlepath"
    )

    AppShortcut(
      intent: OpenCosmosIntent(),
      phrases: [
        "Explore cosmos in \(.applicationName)",
        "Open cosmos in \(.applicationName)",
      ],
      shortTitle: "Explore Cosmos",
      systemImageName: "sparkles"
    )

    AppShortcut(
      intent: OpenAlexandriaIntent(),
      phrases: [
        "Open Alexandria in \(.applicationName)",
        "Show sacred texts in \(.applicationName)",
      ],
      shortTitle: "Open Alexandria",
      systemImageName: "books.vertical.fill"
    )

    AppShortcut(
      intent: DailyWisdomIntent(),
      phrases: [
        "Get wisdom from \(.applicationName)",
        "Give me daily wisdom from \(.applicationName)",
        "\(.applicationName) wisdom",
      ],
      shortTitle: "Daily Wisdom",
      systemImageName: "lightbulb.fill"
    )

    AppShortcut(
      intent: GetProgressIntent(),
      phrases: [
        "What's my progress in \(.applicationName)",
        "How am I doing in \(.applicationName)",
      ],
      shortTitle: "Check Progress",
      systemImageName: "chart.bar.fill"
    )
  }
}

// MARK: - Usage Notes

/*

 To enable App Intents:

 1. In your App struct, add:
    @main
    struct ApertureApp: App {
        var body: some Scene {
            WindowGroup {
                ContentView()
            }
        }
    }

 2. The AppShortcutsProvider will automatically register shortcuts

 3. Users can say:
    - "Hey Siri, open my courses in Aperture"
    - "Hey Siri, show my dragon in Aperture"
    - "Hey Siri, get wisdom from Aperture"
    - "Hey Siri, what's my progress in Aperture"

 4. Shortcuts will also appear in the Shortcuts app

 */
