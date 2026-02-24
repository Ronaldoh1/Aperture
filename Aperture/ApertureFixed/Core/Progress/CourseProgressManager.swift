// CourseProgressManager.swift
// Aperture
//
// Persistent Course Progress System
// Saves user progress across sessions using UserDefaults (MVP) / CloudKit (v1.1)

import Foundation
import SwiftUI
import Combine

// MARK: - Notification Names

extension NSNotification.Name {
    static let courseCompleted = NSNotification.Name("courseCompleted")
    static let lessonCompleted = NSNotification.Name("lessonCompleted")
    static let practiceCompleted = NSNotification.Name("practiceCompleted")
}


// MARK: - Course Progress Model

struct UserCourseProgress: Codable, Identifiable {
    let id: String  // courseId
    var completedLessonIds: Set<String>
    var currentModuleIndex: Int
    var currentLessonIndex: Int
    var lastAccessedAt: Date
    var startedAt: Date
    var completedAt: Date?
    var totalTimeSpentSeconds: Int
    var practiceCompletions: [String: Int]  // lessonId -> completion count
    
    var isComplete: Bool {
        completedAt != nil
    }
    
    var progressPercentage: Double {
        guard totalLessons > 0 else { return 0 }
        return Double(completedLessonIds.count) / Double(totalLessons)
    }
    
    // Set by manager when loading
    var totalLessons: Int = 0
    
    init(courseId: String) {
        self.id = courseId
        self.completedLessonIds = []
        self.currentModuleIndex = 0
        self.currentLessonIndex = 0
        self.lastAccessedAt = Date()
        self.startedAt = Date()
        self.completedAt = nil
        self.totalTimeSpentSeconds = 0
        self.practiceCompletions = [:]
    }
    
    // Codable conformance
    enum CodingKeys: String, CodingKey {
        case id, completedLessonIds, currentModuleIndex, currentLessonIndex
        case lastAccessedAt, startedAt, completedAt, totalTimeSpentSeconds
        case practiceCompletions
    }
}


// MARK: - Lesson Progress

struct LessonProgress: Codable {
    let lessonId: String
    let courseId: String
    var isCompleted: Bool
    var completedAt: Date?
    var timeSpentSeconds: Int
    var practiceCompletedCount: Int
    var notes: String?
}


// MARK: - Course Progress Manager

@MainActor
final class CourseProgressManager: ObservableObject {
    
    static let shared = CourseProgressManager()
    
    // MARK: - Storage
    
    private let defaults = UserDefaults.standard
    private let progressKey = "course_progress_data"
    private let streakKey = "learning_streak"
    private let lastActivityKey = "last_activity_date"
    
    // MARK: - Published State
    
    @Published private(set) var allProgress: [String: UserCourseProgress] = [:]
    @Published private(set) var currentStreak: Int = 0
    @Published private(set) var longestStreak: Int = 0
    @Published private(set) var totalCoursesStarted: Int = 0
    @Published private(set) var totalCoursesCompleted: Int = 0
    @Published private(set) var totalLessonsCompleted: Int = 0
    
    // MARK: - Session Tracking
    
    private var sessionStartTime: Date?
    private var currentCourseId: String?
    
    
    // MARK: - Initialization
    
    init() {
        loadProgress()
        loadStreakData()
        updateStats()
    }
    
    
    // MARK: - Load/Save
    
    private func loadProgress() {
        guard let data = defaults.data(forKey: progressKey),
              let decoded = try? JSONDecoder().decode([String: UserCourseProgress].self, from: data) else {
            return
        }
        allProgress = decoded
    }
    
    private func saveProgress() {
        guard let encoded = try? JSONEncoder().encode(allProgress) else { return }
        defaults.set(encoded, forKey: progressKey)
        updateStats()
    }
    
    private func loadStreakData() {
        currentStreak = defaults.integer(forKey: streakKey)
        longestStreak = defaults.integer(forKey: "longest_streak")
        
        // Check if streak is still valid
        if let lastActivity = defaults.object(forKey: lastActivityKey) as? Date {
            let daysSinceActivity = Calendar.current.dateComponents([.day], from: lastActivity, to: Date()).day ?? 0
            
            if daysSinceActivity > 1 {
                // Streak broken
                currentStreak = 0
                defaults.set(0, forKey: streakKey)
            }
        }
    }
    
    private func updateStats() {
        totalCoursesStarted = allProgress.count
        totalCoursesCompleted = allProgress.values.filter { $0.isComplete }.count
        totalLessonsCompleted = allProgress.values.reduce(0) { $0 + $1.completedLessonIds.count }
    }
    
    
    // MARK: - Course Progress API
    
    /// Get progress for a specific course
    func progress(for courseId: String) -> UserCourseProgress {
        if let existing = allProgress[courseId] {
            return existing
        }
        return UserCourseProgress(courseId: courseId)
    }
    
    /// Start or resume a course
    func startCourse(_ courseId: String, totalLessons: Int) {
        sessionStartTime = Date()
        currentCourseId = courseId
        
        if allProgress[courseId] == nil {
            var newProgress = UserCourseProgress(courseId: courseId)
            newProgress.totalLessons = totalLessons
            allProgress[courseId] = newProgress
            saveProgress()
        } else {
            allProgress[courseId]?.lastAccessedAt = Date()
            allProgress[courseId]?.totalLessons = totalLessons
            saveProgress()
        }
        
        recordActivity()
    }
    
    /// Mark a lesson as complete
    func completeLesson(courseId: String, lessonId: String, moduleIndex: Int, lessonIndex: Int) {
        guard var progress = allProgress[courseId] else { return }
        
        progress.completedLessonIds.insert(lessonId)
        progress.currentModuleIndex = moduleIndex
        progress.currentLessonIndex = lessonIndex + 1  // Move to next lesson
        progress.lastAccessedAt = Date()
        
        // Add session time
        if let start = sessionStartTime {
            progress.totalTimeSpentSeconds += Int(Date().timeIntervalSince(start))
            sessionStartTime = Date()  // Reset for next lesson
        }
        
        allProgress[courseId] = progress
        saveProgress()
        recordActivity()
        
        // Post notification for UI updates
        NotificationCenter.default.post(
            name: .lessonCompleted,
            object: nil,
            userInfo: ["courseId": courseId, "lessonId": lessonId]
        )
    }
    
    /// Mark a practice as complete
    func completePractice(courseId: String, lessonId: String) {
        guard var progress = allProgress[courseId] else { return }
        
        let currentCount = progress.practiceCompletions[lessonId] ?? 0
        progress.practiceCompletions[lessonId] = currentCount + 1
        progress.lastAccessedAt = Date()
        
        allProgress[courseId] = progress
        saveProgress()
        recordActivity()
    }
    
    /// Mark entire course as complete
    func completeCourse(_ courseId: String) {
        guard var progress = allProgress[courseId] else { return }
        
        progress.completedAt = Date()
        progress.lastAccessedAt = Date()
        
        // Add final session time
        if let start = sessionStartTime {
            progress.totalTimeSpentSeconds += Int(Date().timeIntervalSince(start))
        }
        
        allProgress[courseId] = progress
        saveProgress()
        
        // Post notification
        NotificationCenter.default.post(
            name: .courseCompleted,
            object: nil,
            userInfo: ["courseId": courseId]
        )
    }
    
    /// Update current position in course
    func updatePosition(courseId: String, moduleIndex: Int, lessonIndex: Int) {
        guard var progress = allProgress[courseId] else { return }
        
        progress.currentModuleIndex = moduleIndex
        progress.currentLessonIndex = lessonIndex
        progress.lastAccessedAt = Date()
        
        allProgress[courseId] = progress
        saveProgress()
    }
    
    /// End current session
    func endSession() {
        guard let courseId = currentCourseId,
              var progress = allProgress[courseId],
              let start = sessionStartTime else { return }
        
        progress.totalTimeSpentSeconds += Int(Date().timeIntervalSince(start))
        allProgress[courseId] = progress
        saveProgress()
        
        sessionStartTime = nil
        currentCourseId = nil
    }
    
    
    // MARK: - Streak Management
    
    private func recordActivity() {
        let today = Calendar.current.startOfDay(for: Date())
        
        if let lastActivity = defaults.object(forKey: lastActivityKey) as? Date {
            let lastActivityDay = Calendar.current.startOfDay(for: lastActivity)
            let daysDiff = Calendar.current.dateComponents([.day], from: lastActivityDay, to: today).day ?? 0
            
            if daysDiff == 1 {
                // Consecutive day - extend streak
                currentStreak += 1
            } else if daysDiff > 1 {
                // Streak broken
                currentStreak = 1
            }
            // daysDiff == 0 means same day, don't increment
        } else {
            // First activity ever
            currentStreak = 1
        }
        
        // Update longest streak
        if currentStreak > longestStreak {
            longestStreak = currentStreak
            defaults.set(longestStreak, forKey: "longest_streak")
        }
        
        defaults.set(currentStreak, forKey: streakKey)
        defaults.set(Date(), forKey: lastActivityKey)
    }
    
    
    // MARK: - Query Helpers
    
    /// Get recently accessed courses
    var recentCourses: [UserCourseProgress] {
        allProgress.values
            .sorted { $0.lastAccessedAt > $1.lastAccessedAt }
            .prefix(5)
            .map { $0 }
    }
    
    /// Get courses in progress (started but not completed)
    var coursesInProgress: [UserCourseProgress] {
        allProgress.values
            .filter { !$0.isComplete && !$0.completedLessonIds.isEmpty }
            .sorted { $0.lastAccessedAt > $1.lastAccessedAt }
    }
    
    /// Get completed courses
    var completedCourses: [UserCourseProgress] {
        allProgress.values
            .filter { $0.isComplete }
            .sorted { ($0.completedAt ?? Date()) > ($1.completedAt ?? Date()) }
    }
    
    /// Check if a specific lesson is completed
    func isLessonCompleted(courseId: String, lessonId: String) -> Bool {
        allProgress[courseId]?.completedLessonIds.contains(lessonId) ?? false
    }
    
    /// Get completion count for a module
    func moduleProgress(courseId: String, moduleId: String, lessonIds: [String]) -> (completed: Int, total: Int) {
        let progress = allProgress[courseId]
        let completed = lessonIds.filter { progress?.completedLessonIds.contains($0) ?? false }.count
        return (completed, lessonIds.count)
    }
    
    /// Get time spent on a course (formatted)
    func formattedTimeSpent(courseId: String) -> String {
        let seconds = allProgress[courseId]?.totalTimeSpentSeconds ?? 0
        let hours = seconds / 3600
        let minutes = (seconds % 3600) / 60
        
        if hours > 0 {
            return "\(hours)h \(minutes)m"
        } else {
            return "\(minutes)m"
        }
    }
    
    
    // MARK: - Reset
    
    /// Reset progress for a specific course
    func resetCourse(_ courseId: String) {
        allProgress.removeValue(forKey: courseId)
        saveProgress()
    }
    
    /// Reset all progress (for testing)
    func resetAllProgress() {
        allProgress.removeAll()
        currentStreak = 0
        longestStreak = 0
        defaults.removeObject(forKey: progressKey)
        defaults.removeObject(forKey: streakKey)
        defaults.removeObject(forKey: "longest_streak")
        defaults.removeObject(forKey: lastActivityKey)
        updateStats()
    }
}


// MARK: - SwiftUI Integration

/// Environment key for progress manager
struct CourseProgressManagerKey: @preconcurrency EnvironmentKey {
    @MainActor static let defaultValue = CourseProgressManager.shared
}

extension EnvironmentValues {
    var courseProgress: CourseProgressManager {
        get { self[CourseProgressManagerKey.self] }
        set { self[CourseProgressManagerKey.self] = newValue }
    }
}


// MARK: - Progress View Components

struct CourseProgressBar: View {
    let progress: Double
    let color: Color
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 4)
                    .fill(Color.white.opacity(0.1))
                
                RoundedRectangle(cornerRadius: 4)
                    .fill(
                        LinearGradient(
                            colors: [color, color.opacity(0.7)],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .frame(width: geometry.size.width * progress)
                    .animation(.spring(response: 0.4), value: progress)
            }
        }
        .frame(height: 6)
    }
}

struct CourseProgressRing: View {
    let progress: Double
    let color: Color
    let size: CGFloat
    let lineWidth: CGFloat
    
    init(progress: Double, color: Color, size: CGFloat = 60, lineWidth: CGFloat = 6) {
        self.progress = progress
        self.color = color
        self.size = size
        self.lineWidth = lineWidth
    }
    
    var body: some View {
        ZStack {
            // Background ring
            Circle()
                .stroke(Color.white.opacity(0.1), lineWidth: lineWidth)
            
            // Progress ring
            Circle()
                .trim(from: 0, to: progress)
                .stroke(
                    LinearGradient(
                        colors: [color, color.opacity(0.7)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ),
                    style: StrokeStyle(lineWidth: lineWidth, lineCap: .round)
                )
                .rotationEffect(.degrees(-90))
                .animation(.spring(response: 0.6), value: progress)
            
            // Percentage text
            Text("\(Int(progress * 100))%")
                .font(.system(size: size * 0.25, weight: .bold, design: .rounded))
                .foregroundColor(.white)
        }
        .frame(width: size, height: size)
    }
}

struct LessonCompletionCheckmark: View {
    let isCompleted: Bool
    let color: Color
    
    var body: some View {
        ZStack {
            Circle()
                .fill(isCompleted ? color : Color.white.opacity(0.1))
                .frame(width: 24, height: 24)
            
            if isCompleted {
                Image(systemName: "checkmark")
                    .font(.system(size: 12, weight: .bold))
                    .foregroundColor(.white)
            }
        }
        .animation(.spring(response: 0.3), value: isCompleted)
    }
}

struct StreakBadge: View {
    let streak: Int
    
    var body: some View {
        HStack(spacing: 4) {
            Image(systemName: "flame.fill")
                .foregroundColor(.orange)
            
            Text("\(streak)")
                .font(.subheadline.bold())
                .foregroundColor(.white)
            
            Text("day streak")
                .font(.caption)
                .foregroundColor(.white.opacity(0.7))
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 6)
        .background(
            Capsule()
                .fill(Color.orange.opacity(0.2))
        )
    }
}


// MARK: - Continue Learning Card

struct ContinueLearningCard: View {
    let courseId: String
    let courseTitle: String
    let courseColor: Color
    let progress: UserCourseProgress
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("CONTINUE LEARNING")
                            .font(.caption.bold())
                            .foregroundColor(courseColor)
                            .tracking(1)
                        
                        Text(courseTitle)
                            .font(.headline)
                            .foregroundColor(.white)
                    }
                    
                    Spacer()
                    
                    CourseProgressRing(
                        progress: progress.progressPercentage,
                        color: courseColor,
                        size: 50,
                        lineWidth: 4
                    )
                }
                
                CourseProgressBar(progress: progress.progressPercentage, color: courseColor)
                
                HStack {
                    Text("\(progress.completedLessonIds.count)/\(progress.totalLessons) lessons")
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.6))
                    
                    Spacer()
                    
                    HStack(spacing: 4) {
                        Image(systemName: "play.fill")
                            .font(.caption)
                        Text("Resume")
                            .font(.caption.bold())
                    }
                    .foregroundColor(courseColor)
                }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.white.opacity(0.05))
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(courseColor.opacity(0.3), lineWidth: 1)
                    )
            )
        }
        .buttonStyle(PlainButtonStyle())
    }
}


// MARK: - Stats Overview

struct ProgressStatsView: View {
    @ObservedObject var manager = CourseProgressManager.shared
    
    var body: some View {
        HStack(spacing: 20) {
            StatItem(
                icon: "book.fill",
                value: "\(manager.totalCoursesCompleted)",
                label: "Completed"
            )
            
            StatItem(
                icon: "checkmark.circle.fill",
                value: "\(manager.totalLessonsCompleted)",
                label: "Lessons"
            )
            
            StatItem(
                icon: "flame.fill",
                value: "\(manager.currentStreak)",
                label: "Day Streak",
                color: .orange
            )
        }
    }
    
    struct StatItem: View {
        let icon: String
        let value: String
        let label: String
        var color: Color = .white
        
        var body: some View {
            VStack(spacing: 8) {
                Image(systemName: icon)
                    .font(.title2)
                    .foregroundColor(color)
                
                Text(value)
                    .font(.title2.bold())
                    .foregroundColor(.white)
                
                Text(label)
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.6))
            }
            .frame(maxWidth: .infinity)
        }
    }
}


// MARK: - Preview

#Preview("Progress Bar") {
    ZStack {
        Color(hex: "#0a0a1a").ignoresSafeArea()
        VStack(spacing: 20) {
            CourseProgressBar(progress: 0.3, color: .purple)
            CourseProgressBar(progress: 0.7, color: .cyan)
            CourseProgressBar(progress: 1.0, color: .green)
        }
        .padding()
    }
}

#Preview("Progress Ring") {
    ZStack {
        Color(hex: "#0a0a1a").ignoresSafeArea()
        HStack(spacing: 20) {
            CourseProgressRing(progress: 0.25, color: .purple)
            CourseProgressRing(progress: 0.65, color: .cyan)
            CourseProgressRing(progress: 1.0, color: .green)
        }
    }
}

#Preview("Streak Badge") {
    ZStack {
        Color(hex: "#0a0a1a").ignoresSafeArea()
        VStack(spacing: 20) {
            StreakBadge(streak: 7)
            StreakBadge(streak: 30)
            StreakBadge(streak: 100)
        }
    }
}
