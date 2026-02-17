// CourseEngagementTracker.swift
// Aperture
//
// Track course progress and engagement
// Send humorous reminders for abandoned courses
// Allow pick up where left off or course reset

import Combine
import SwiftUI
import UserNotifications

// MARK: - Course Engagement Tracker

@MainActor
final class CourseEngagementTracker: ObservableObject {
  static let shared = CourseEngagementTracker()

  // MARK: - Published State

  @Published var activeCourses: [CourseEngagement] = []
  @Published var abandonedCourses: [CourseEngagement] = []
  @Published var completedCourses: [CourseEngagement] = []

  // MARK: - Storage

  private let defaults = UserDefaults.standard
  private let engagementsKey = "course_engagements"

  // MARK: - Humorous Reminder Messages

  private let abandonmentMessages = [
    // Light and playful
    ("👀 Hey, you there?", "I've got more to teach you... the wisdom is getting dusty over here."),
    ("🐉 Your Dragon misses you", "The sacred knowledge won't decode itself. Ready to continue?"),
    (
      "📚 Books don't read themselves",
      "Well, technically I read them to you, but you still gotta show up!"
    ),
    ("🔮 The mysteries await", "You were this close to the next revelation. Shall we?"),
    ("⏰ Time check!", "It's been a minute. The ancients are getting impatient."),

    // Motivational with humor
    ("🚀 Unfinished business", "You've got wisdom pending. Your higher self filed a complaint."),
    ("🧠 Brain food alert", "Your neurons are hungry for knowledge. Feed them!"),
    ("💡 Illumination awaits", "You stopped right before the good part. Classic move."),
    ("🔥 The flame needs tending", "Your awakening progress is cooling off. Stoke that fire!"),
    ("🌟 Star student status", "...requires actually being present. Just saying."),

    // Gnostic themed
    (
      "👁️ The Archons are pleased", "...that you stopped learning. Don't give them the satisfaction!"
    ),
    ("🐍 Sophia whispers", "\"Where did my student go?\" She's asking about you specifically."),
    ("☀️ Ra notices your absence", "The solar curriculum won't complete itself, sovereign."),
    ("🏛️ The Mystery School called", "They want their initiate back. You left mid-ritual!"),
    ("📿 Your mala beads are dusty", "108 repetitions await. The mantra misses you."),

    // Direct and fun
    (
      "🎯 Quick check-in",
      "Still awakening, or did you fall back asleep? No judgment... okay, a little."
    ),
    ("📱 This is your course speaking", "I feel abandoned. Can we talk about this?"),
    ("🎓 Graduation delayed", "Due to ghost student behavior. Your cap and gown are lonely."),
    ("🗝️ Keys to reality", "Still in your pocket, unused. That's not how keys work."),
    ("🌙 The moon wonders", "Why you started a lunar practice and then vanished. Rude."),
  ]

  private let comebackMessages = [
    "Welcome back! The mysteries were wondering when you'd return.",
    "You're back! The sacred knowledge has been waiting patiently.",
    "The prodigal student returns! Let's pick up where you left off.",
    "Ah, there you are! The universe noted your absence. Ready?",
    "Back in the game! Your higher self just did a little celebration.",
    "Welcome home, seeker. The path has been holding your place.",
  ]

  // MARK: - Initialization

  init() {
    loadEngagements()
    checkForAbandonedCourses()
  }

  // MARK: - Course Tracking

  /// Start tracking a new course
  func startCourse(_ courseId: String, courseName: String, totalLessons: Int) {
    // Check if already exists
    if let existing = activeCourses.first(where: { $0.courseId == courseId }) {
      // Update last accessed
      updateLastAccessed(courseId: courseId)
      return
    }

    let engagement = CourseEngagement(
      courseId: courseId,
      courseName: courseName,
      startDate: Date(),
      lastAccessDate: Date(),
      currentLessonIndex: 0,
      totalLessons: totalLessons,
      completedLessons: [],
      status: .active
    )

    activeCourses.append(engagement)
    saveEngagements()
  }

  /// Update progress in a course
  func updateProgress(courseId: String, lessonIndex: Int, lessonId: String) {
    guard let index = activeCourses.firstIndex(where: { $0.courseId == courseId }) else {
      // Check abandoned courses
      if let abandonedIndex = abandonedCourses.firstIndex(where: { $0.courseId == courseId }) {
        // Move back to active
        var engagement = abandonedCourses.remove(at: abandonedIndex)
        engagement.status = .active
        engagement.lastAccessDate = Date()
        engagement.currentLessonIndex = lessonIndex
        if !engagement.completedLessons.contains(lessonId) {
          engagement.completedLessons.append(lessonId)
        }
        activeCourses.append(engagement)
        saveEngagements()
      }
      return
    }

    activeCourses[index].lastAccessDate = Date()
    activeCourses[index].currentLessonIndex = lessonIndex

    if !activeCourses[index].completedLessons.contains(lessonId) {
      activeCourses[index].completedLessons.append(lessonId)
    }

    // Check for completion
    if activeCourses[index].completedLessons.count >= activeCourses[index].totalLessons {
      completeCourse(courseId: courseId)
    }

    saveEngagements()
  }

  /// Mark last accessed time
  func updateLastAccessed(courseId: String) {
    if let index = activeCourses.firstIndex(where: { $0.courseId == courseId }) {
      activeCourses[index].lastAccessDate = Date()
      saveEngagements()
    }
  }

  /// Complete a course
  func completeCourse(courseId: String) {
    guard let index = activeCourses.firstIndex(where: { $0.courseId == courseId }) else { return }

    var engagement = activeCourses.remove(at: index)
    engagement.status = .completed
    engagement.completionDate = Date()
    completedCourses.append(engagement)
    saveEngagements()

    // Cancel any pending reminders
    cancelReminders(for: courseId)
  }

  /// Reset a course (start from beginning)
  func resetCourse(courseId: String) {
    // Find in any list
    var engagement: CourseEngagement?

    if let index = activeCourses.firstIndex(where: { $0.courseId == courseId }) {
      engagement = activeCourses.remove(at: index)
    } else if let index = abandonedCourses.firstIndex(where: { $0.courseId == courseId }) {
      engagement = abandonedCourses.remove(at: index)
    } else if let index = completedCourses.firstIndex(where: { $0.courseId == courseId }) {
      engagement = completedCourses.remove(at: index)
    }

    guard var eng = engagement else { return }

    // Reset progress
    eng.currentLessonIndex = 0
    eng.completedLessons = []
    eng.status = .active
    eng.lastAccessDate = Date()
    eng.completionDate = nil

    activeCourses.append(eng)
    saveEngagements()
  }

  // MARK: - Abandonment Detection

  /// Check for courses that haven't been accessed recently
  func checkForAbandonedCourses() {
    let calendar = Calendar.current
    let now = Date()

    var newlyAbandoned: [CourseEngagement] = []
    var stillActive: [CourseEngagement] = []

    for engagement in activeCourses {
      let daysSinceAccess =
        calendar.dateComponents([.day], from: engagement.lastAccessDate, to: now).day ?? 0

      if daysSinceAccess >= 7 {
        // Considered abandoned after 7 days
        var abandoned = engagement
        abandoned.status = .abandoned
        newlyAbandoned.append(abandoned)
      } else {
        stillActive.append(engagement)
      }
    }

    activeCourses = stillActive
    abandonedCourses.append(contentsOf: newlyAbandoned)

    // Schedule reminders for newly abandoned
    for engagement in newlyAbandoned {
      scheduleAbandonmentReminder(for: engagement)
    }

    saveEngagements()
  }

  // MARK: - Reminders

  /// Schedule a humorous reminder for an abandoned course
  func scheduleAbandonmentReminder(for engagement: CourseEngagement) {
    guard let message = abandonmentMessages.randomElement() else { return }

    let content = UNMutableNotificationContent()
    content.title = message.0
    content.body = message.1
    content.sound = .default
    content.userInfo = ["courseId": engagement.courseId, "type": "abandonment"]

    // Schedule for a few hours from now
    let trigger = UNTimeIntervalNotificationTrigger(
      timeInterval: 4 * 3600,  // 4 hours
      repeats: false
    )

    let request = UNNotificationRequest(
      identifier: "course_abandon_\(engagement.courseId)",
      content: content,
      trigger: trigger
    )

    UNUserNotificationCenter.current().add(request)

    // Schedule follow-up for next day
    scheduleFollowUpReminder(for: engagement)
  }

  private func scheduleFollowUpReminder(for engagement: CourseEngagement) {
    guard let message = abandonmentMessages.randomElement() else { return }

    let content = UNMutableNotificationContent()
    content.title = message.0
    content.body = "\(engagement.courseName): \(message.1)"
    content.sound = .default
    content.userInfo = ["courseId": engagement.courseId, "type": "followup"]

    // Schedule for next day at a reasonable hour
    var dateComponents = DateComponents()
    dateComponents.hour = 10  // 10 AM
    dateComponents.minute = 0

    let trigger = UNCalendarNotificationTrigger(
      dateMatching: dateComponents,
      repeats: false
    )

    let request = UNNotificationRequest(
      identifier: "course_followup_\(engagement.courseId)",
      content: content,
      trigger: trigger
    )

    UNUserNotificationCenter.current().add(request)
  }

  private func cancelReminders(for courseId: String) {
    UNUserNotificationCenter.current().removePendingNotificationRequests(
      withIdentifiers: [
        "course_abandon_\(courseId)",
        "course_followup_\(courseId)",
      ]
    )
  }

  // MARK: - Queries

  func getEngagement(for courseId: String) -> CourseEngagement? {
    activeCourses.first { $0.courseId == courseId } ?? abandonedCourses.first {
      $0.courseId == courseId
    } ?? completedCourses.first { $0.courseId == courseId }
  }

  func getProgress(for courseId: String) -> Double {
    guard let engagement = getEngagement(for: courseId) else { return 0 }
    guard engagement.totalLessons > 0 else { return 0 }
    return Double(engagement.completedLessons.count) / Double(engagement.totalLessons)
  }

  func canResume(courseId: String) -> Bool {
    guard let engagement = getEngagement(for: courseId) else { return false }
    return engagement.currentLessonIndex > 0 && engagement.status != .completed
  }

  var totalCoursesStarted: Int {
    activeCourses.count + abandonedCourses.count + completedCourses.count
  }

  var totalCoursesCompleted: Int {
    completedCourses.count
  }

  var getWelcomeBackMessage: String {
    comebackMessages.randomElement() ?? "Welcome back!"
  }

  // MARK: - Persistence

  private func loadEngagements() {
    if let data = defaults.data(forKey: engagementsKey),
      let all = try? JSONDecoder().decode(AllEngagements.self, from: data)
    {
      activeCourses = all.active
      abandonedCourses = all.abandoned
      completedCourses = all.completed
    }
  }

  private func saveEngagements() {
    let all = AllEngagements(
      active: activeCourses,
      abandoned: abandonedCourses,
      completed: completedCourses
    )

    if let data = try? JSONEncoder().encode(all) {
      defaults.set(data, forKey: engagementsKey)
    }
  }
}

// MARK: - Models

struct CourseEngagement: Identifiable, Codable {
  var id: String {
    courseId
  }

  let courseId: String
  let courseName: String
  let startDate: Date
  var lastAccessDate: Date
  var currentLessonIndex: Int
  var totalLessons: Int
  var completedLessons: [String]
  var status: CourseStatus
  var completionDate: Date?

  var progressPercentage: Int {
    guard totalLessons > 0 else { return 0 }
    return Int((Double(completedLessons.count) / Double(totalLessons)) * 100)
  }

  var daysSinceLastAccess: Int {
    Calendar.current.dateComponents([.day], from: lastAccessDate, to: Date()).day ?? 0
  }
}

struct AllEngagements: Codable {
  let active: [CourseEngagement]
  let abandoned: [CourseEngagement]
  let completed: [CourseEngagement]
}

enum CourseStatus: String, Codable {
  case active = "Active"
  case abandoned = "Abandoned"
  case completed = "Completed"

  var color: Color {
    switch self {
    case .active: return .green
    case .abandoned: return .orange
    case .completed: return Color(hex: "#FFD700")
    }
  }
}

// MARK: - My Courses View

struct MyCoursesView: View {
  @StateObject private var tracker = CourseEngagementTracker.shared
  @State private var selectedCourse: CourseEngagement?
  @State private var showResetConfirmation = false
  @State private var courseToReset: CourseEngagement?

  var body: some View {
    NavigationStack {
      ZStack {
        Color(hex: "#0a0a1a")
          .ignoresSafeArea()

        ScrollView {
          VStack(spacing: 24) {
            // Stats header
            statsHeader

            // Active courses
            if !tracker.activeCourses.isEmpty {
              courseSection(
                title: "IN PROGRESS", courses: tracker.activeCourses, icon: "play.fill",
                color: .green)
            }

            // Abandoned courses
            if !tracker.abandonedCourses.isEmpty {
              courseSection(
                title: "PICK UP WHERE YOU LEFT OFF", courses: tracker.abandonedCourses,
                icon: "arrow.counterclockwise", color: .orange)
            }

            // Completed courses
            if !tracker.completedCourses.isEmpty {
              courseSection(
                title: "COMPLETED", courses: tracker.completedCourses, icon: "checkmark.seal.fill",
                color: Color(hex: "#FFD700"))
            }

            // Empty state
            if tracker.totalCoursesStarted == 0 {
              emptyState
            }
          }
          .padding()
        }
      }
      .navigationTitle("My Courses")
      .navigationBarTitleDisplayMode(.large)
      .alert("Reset Course?", isPresented: $showResetConfirmation) {
        Button("Cancel", role: .cancel) {}
        Button("Reset", role: .destructive) {
          if let course = courseToReset {
            tracker.resetCourse(courseId: course.courseId)
          }
        }
      } message: {
        Text(
          "This will erase all progress and start from the beginning. Your earned badges will be kept."
        )
      }
    }
  }

  private var statsHeader: some View {
    HStack(spacing: 16) {
      EngagementStatCard(
        value: "\(tracker.activeCourses.count)",
        label: "Active",
        color: .green
      )

      EngagementStatCard(
        value: "\(tracker.abandonedCourses.count)",
        label: "Paused",
        color: .orange
      )

      EngagementStatCard(
        value: "\(tracker.completedCourses.count)",
        label: "Completed",
        color: Color(hex: "#FFD700")
      )
    }
  }

  private func courseSection(title: String, courses: [CourseEngagement], icon: String, color: Color)
    -> some View
  {
    VStack(alignment: .leading, spacing: 12) {
      HStack {
        Image(systemName: icon)
          .foregroundColor(color)

        Text(title)
          .font(.caption.bold())
          .foregroundColor(.white.opacity(0.5))
          .tracking(1)
      }

      ForEach(courses) { course in
        CourseEngagementCard(
          engagement: course,
          onResume: {
            // Navigate to course at current lesson
          },
          onReset: {
            courseToReset = course
            showResetConfirmation = true
          }
        )
      }
    }
  }

  private var emptyState: some View {
    VStack(spacing: 16) {
      Image(systemName: "book.closed.fill")
        .font(.system(size: 50))
        .foregroundColor(.white.opacity(0.3))

      Text("No courses started yet")
        .font(.headline)
        .foregroundColor(.white)

      Text("Begin your awakening journey")
        .font(.subheadline)
        .foregroundColor(.white.opacity(0.6))
    }
    .frame(maxWidth: .infinity)
    .padding(40)
  }
}

struct EngagementStatCard: View {
  let value: String
  let label: String
  let color: Color

  var body: some View {
    VStack(spacing: 4) {
      Text(value)
        .font(.title.bold())
        .foregroundColor(color)

      Text(label)
        .font(.caption)
        .foregroundColor(.white.opacity(0.6))
    }
    .frame(maxWidth: .infinity)
    .padding()
    .background(Color.white.opacity(0.05))
    .cornerRadius(12)
  }
}

struct CourseEngagementCard: View {
  let engagement: CourseEngagement
  let onResume: () -> Void
  let onReset: () -> Void

  var body: some View {
    VStack(alignment: .leading, spacing: 12) {
      HStack {
        VStack(alignment: .leading, spacing: 4) {
          Text(engagement.courseName)
            .font(.headline)
            .foregroundColor(.white)

          HStack(spacing: 8) {
            Text("\(engagement.progressPercentage)% complete")
              .font(.caption)
              .foregroundColor(engagement.status.color)

            if engagement.status == .abandoned {
              Text("• \(engagement.daysSinceLastAccess) days ago")
                .font(.caption)
                .foregroundColor(.white.opacity(0.5))
            }
          }
        }

        Spacer()

        // Status badge
        Text(engagement.status.rawValue)
          .font(.caption2.bold())
          .foregroundColor(.black)
          .padding(.horizontal, 8)
          .padding(.vertical, 4)
          .background(engagement.status.color)
          .cornerRadius(8)
      }

      // Progress bar
      GeometryReader { geo in
        ZStack(alignment: .leading) {
          RoundedRectangle(cornerRadius: 4)
            .fill(Color.white.opacity(0.1))
            .frame(height: 8)

          RoundedRectangle(cornerRadius: 4)
            .fill(engagement.status.color)
            .frame(width: geo.size.width * CGFloat(engagement.progressPercentage) / 100, height: 8)
        }
      }
      .frame(height: 8)

      // Actions
      if engagement.status != .completed {
        HStack(spacing: 12) {
          Button(action: onResume) {
            HStack {
              Image(systemName: "play.fill")
              Text(engagement.status == .abandoned ? "Resume" : "Continue")
            }
            .font(.caption.bold())
            .foregroundColor(.white)
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background(Color(hex: "#7C4DFF"))
            .cornerRadius(8)
          }

          Button(action: onReset) {
            HStack {
              Image(systemName: "arrow.counterclockwise")
              Text("Reset")
            }
            .font(.caption.bold())
            .foregroundColor(.white.opacity(0.6))
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background(Color.white.opacity(0.1))
            .cornerRadius(8)
          }
        }
      } else {
        Button(action: onReset) {
          HStack {
            Image(systemName: "arrow.counterclockwise")
            Text("Take Again")
          }
          .font(.caption.bold())
          .foregroundColor(Color(hex: "#FFD700"))
        }
      }
    }
    .padding()
    .background(Color.white.opacity(0.05))
    .cornerRadius(16)
  }
}

#Preview {
  MyCoursesView()
}
