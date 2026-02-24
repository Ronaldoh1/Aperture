// AchievementTriggers.swift
// Integration hooks to trigger achievements from user actions
// ☀️ SunFlow: Reignited

import SwiftUI
import Foundation

// MARK: - Achievement Trigger Service

@MainActor
class AchievementTriggerService: ObservableObject {
    static let shared = AchievementTriggerService()
    
    @Published var showAchievementToast: Achievement?
    @Published var showLevelUp: Int?
    
    private let manager = AchievementManager.shared
    private let userDefaults = UserDefaults.standard
    
    // User stats keys
    private let lessonsCompletedKey = "total_lessons_completed"
    private let coursesCompletedKey = "total_courses_completed"
    private let currentStreakKey = "current_streak_days"
    private let lastLessonDateKey = "last_lesson_completion_date"
    private let lessonsPerDayKey = "lessons_completed_today"
    private let todayDateKey = "lessons_today_date"
    private let weeklyLessonsKey = "weekly_lesson_days"
    
    // Category completion tracking
    private let categoryCompletionKey = "category_completion_counts"
    
    init() {}
    
    // MARK: - Lesson Completion
    
    func onLessonCompleted(lessonId: String, courseId: String, category: String) {
        let previousLevel = manager.currentLevel
        
        // Increment lesson count
        var lessonsCompleted = userDefaults.integer(forKey: lessonsCompletedKey)
        lessonsCompleted += 1
        userDefaults.set(lessonsCompleted, forKey: lessonsCompletedKey)
        
        // Track daily lessons
        updateDailyLessonCount()
        
        // Update streak
        updateStreak()
        
        // Track weekly completion
        updateWeeklyCompletion()
        
        // Check time-based achievements
        checkTimeBasedAchievements()
        
        // Check all achievements
        let categoryProgress = getCategoryProgress()
        manager.checkAchievements(
            coursesCompleted: userDefaults.integer(forKey: coursesCompletedKey),
            lessonsCompleted: lessonsCompleted,
            streakDays: userDefaults.integer(forKey: currentStreakKey),
            categoryProgress: categoryProgress
        )
        
        // Check for level up
        if manager.currentLevel > previousLevel {
            showLevelUp = manager.currentLevel
        }
        
        // Show toast for any newly unlocked
        if let recent = manager.recentlyUnlocked.first {
            showAchievementToast = recent
        }
    }
    
    // MARK: - Course Completion
    
    func onCourseCompleted(courseId: String, category: String) {
        let previousLevel = manager.currentLevel
        
        // Increment course count
        var coursesCompleted = userDefaults.integer(forKey: coursesCompletedKey)
        coursesCompleted += 1
        userDefaults.set(coursesCompleted, forKey: coursesCompletedKey)
        
        // Update category progress
        updateCategoryProgress(category: category)
        
        // Check specific course achievements
        checkSpecificCourseAchievements(courseId: courseId)
        
        // Check all achievements
        let categoryProgress = getCategoryProgress()
        manager.checkAchievements(
            coursesCompleted: coursesCompleted,
            lessonsCompleted: userDefaults.integer(forKey: lessonsCompletedKey),
            streakDays: userDefaults.integer(forKey: currentStreakKey),
            completedCourseId: courseId,
            categoryProgress: categoryProgress
        )
        
        // Check for level up
        if manager.currentLevel > previousLevel {
            showLevelUp = manager.currentLevel
        }
        
        // Show toast for any newly unlocked
        if let recent = manager.recentlyUnlocked.first {
            showAchievementToast = recent
        }
    }
    
    // MARK: - Daily Tracking
    
    private func updateDailyLessonCount() {
        let today = Calendar.current.startOfDay(for: Date())
        let storedDate = userDefaults.object(forKey: todayDateKey) as? Date ?? Date.distantPast
        let storedDay = Calendar.current.startOfDay(for: storedDate)
        
        if today == storedDay {
            // Same day, increment
            var count = userDefaults.integer(forKey: lessonsPerDayKey)
            count += 1
            userDefaults.set(count, forKey: lessonsPerDayKey)
            
            // Check "5 lessons in one day" secret achievement
            if count >= 5 {
                unlockSecretAchievement(condition: "five_lessons_one_day")
            }
        } else {
            // New day, reset
            userDefaults.set(today, forKey: todayDateKey)
            userDefaults.set(1, forKey: lessonsPerDayKey)
        }
    }
    
    // MARK: - Streak Tracking
    
    private func updateStreak() {
        let today = Calendar.current.startOfDay(for: Date())
        let lastDate = userDefaults.object(forKey: lastLessonDateKey) as? Date
        
        if let last = lastDate {
            let lastDay = Calendar.current.startOfDay(for: last)
            let daysDiff = Calendar.current.dateComponents([.day], from: lastDay, to: today).day ?? 0
            
            if daysDiff == 0 {
                // Same day, streak unchanged
            } else if daysDiff == 1 {
                // Consecutive day, increment streak
                var streak = userDefaults.integer(forKey: currentStreakKey)
                streak += 1
                userDefaults.set(streak, forKey: currentStreakKey)
            } else {
                // Streak broken, reset to 1
                userDefaults.set(1, forKey: currentStreakKey)
            }
        } else {
            // First ever lesson
            userDefaults.set(1, forKey: currentStreakKey)
        }
        
        userDefaults.set(today, forKey: lastLessonDateKey)
    }
    
    // MARK: - Weekly Completion Tracking
    
    private func updateWeeklyCompletion() {
        let calendar = Calendar.current
        let today = Date()
        let weekOfYear = calendar.component(.weekOfYear, from: today)
        let dayOfWeek = calendar.component(.weekday, from: today)
        
        // Load existing data
        if let data = userDefaults.data(forKey: weeklyLessonsKey),
           let weekData = try? JSONDecoder().decode(WeeklyData.self, from: data) {
            
            if weekData.weekOfYear == weekOfYear {
                // Same week, add today
                var days = weekData.daysCompleted
                if !days.contains(dayOfWeek) {
                    days.insert(dayOfWeek)
                    
                    // Check for perfect week (all 7 days)
                    if days.count >= 7 {
                        unlockSecretAchievement(condition: "perfect_week")
                    }
                    
                    let newData = WeeklyData(weekOfYear: weekOfYear, daysCompleted: days)
                    if let encoded = try? JSONEncoder().encode(newData) {
                        userDefaults.set(encoded, forKey: weeklyLessonsKey)
                    }
                }
            } else {
                // New week, reset
                let newData = WeeklyData(weekOfYear: weekOfYear, daysCompleted: [dayOfWeek])
                if let encoded = try? JSONEncoder().encode(newData) {
                    userDefaults.set(encoded, forKey: weeklyLessonsKey)
                }
            }
        } else {
            // First time
            let newData = WeeklyData(weekOfYear: weekOfYear, daysCompleted: [dayOfWeek])
            if let encoded = try? JSONEncoder().encode(newData) {
                userDefaults.set(encoded, forKey: weeklyLessonsKey)
            }
        }
    }
    
    struct WeeklyData: Codable {
        let weekOfYear: Int
        var daysCompleted: Set<Int>
    }
    
    // MARK: - Time-Based Achievements
    
    private func checkTimeBasedAchievements() {
        let hour = Calendar.current.component(.hour, from: Date())
        
        // Night owl: midnight to 4 AM
        if hour >= 0 && hour < 4 {
            unlockSecretAchievement(condition: "lesson_completed_night")
        }
        
        // Early bird: before 6 AM
        if hour < 6 {
            unlockSecretAchievement(condition: "lesson_completed_early")
        }
    }
    
    // MARK: - Category Progress
    
    private func updateCategoryProgress(category: String) {
        var progress = getCategoryProgress()
        progress[category] = (progress[category] ?? 0) + 1
        
        if let data = try? JSONEncoder().encode(progress) {
            userDefaults.set(data, forKey: categoryCompletionKey)
        }
    }
    
    private func getCategoryProgress() -> [String: Int] {
        guard let data = userDefaults.data(forKey: categoryCompletionKey),
              let progress = try? JSONDecoder().decode([String: Int].self, from: data) else {
            return [:]
        }
        return progress
    }
    
    // MARK: - Specific Course Achievements
    
    private func checkSpecificCourseAchievements(courseId: String) {
        let courseToAchievement: [String: String] = [
            "psyop_detection": "psyop_detector",
            "serpent_decoded": "serpent_wisdom",
            "living_name": "name_keeper",
            "word_spells": "word_wizard"
        ]
        
        if let achievementId = courseToAchievement[courseId],
           let achievement = manager.allAchievements.first(where: { $0.id == achievementId }) {
            manager.unlockAchievement(achievement)
        }
    }
    
    // MARK: - Secret Achievements
    
    private func unlockSecretAchievement(condition: String) {
        if let achievement = manager.allAchievements.first(where: {
            if case .secret(let cond) = $0.requirement {
                return cond == condition
            }
            return false
        }) {
            manager.unlockAchievement(achievement)
        }
    }
    
    // MARK: - Forbidden Gospels Tracking
    
    func onForbiddenGospelRead(gospelId: String) {
        let key = "forbidden_gospels_read"
        var readGospels = userDefaults.stringArray(forKey: key) ?? []
        
        if !readGospels.contains(gospelId) {
            readGospels.append(gospelId)
            userDefaults.set(readGospels, forKey: key)
            
            // Check if all 7 read
            if readGospels.count >= 7 {
                unlockSecretAchievement(condition: "all_forbidden_gospels")
            }
        }
    }
    
    // MARK: - Ultra Instinct Achievement (Easter Egg)
    
    func checkUltraInstinct() {
        // This could be triggered by various hidden conditions
        // For example: completing all courses, 100-day streak, level 50+
        let allCoursesComplete = userDefaults.integer(forKey: coursesCompletedKey) >= 31
        let hasLongStreak = userDefaults.integer(forKey: currentStreakKey) >= 100
        let highLevel = manager.currentLevel >= 50
        
        if allCoursesComplete && hasLongStreak && highLevel {
            unlockSecretAchievement(condition: "ultra_instinct_unlocked")
        }
    }
    
    // MARK: - Stats Getters (for display)
    
    var totalLessonsCompleted: Int {
        userDefaults.integer(forKey: lessonsCompletedKey)
    }
    
    var totalCoursesCompleted: Int {
        userDefaults.integer(forKey: coursesCompletedKey)
    }
    
    var currentStreak: Int {
        userDefaults.integer(forKey: currentStreakKey)
    }
}

// MARK: - Achievement Toast Overlay Modifier

struct AchievementToastOverlay: ViewModifier {
    @StateObject private var triggerService = AchievementTriggerService.shared
    
    func body(content: Content) -> some View {
        content
            .overlay(alignment: .top) {
                if let achievement = triggerService.showAchievementToast {
                    AchievementToastView(
                        achievement: achievement,
                        isShowing: Binding(
                            get: { triggerService.showAchievementToast != nil },
                            set: { if !$0 { 
                                AchievementManager.shared.markAsSeen(achievement.id)
                                triggerService.showAchievementToast = nil 
                            }}
                        )
                    )
                    .padding(.top, 60)
                    .transition(.move(edge: .top).combined(with: .opacity))
                    .zIndex(1000)
                }
            }
            .overlay {
                if let level = triggerService.showLevelUp {
                    LevelUpCelebrationView(newLevel: level) {
                        triggerService.showLevelUp = nil
                    }
                    .zIndex(1001)
                }
            }
    }
}

extension View {
    func withAchievementToasts() -> some View {
        modifier(AchievementToastOverlay())
    }
}

// MARK: - Lesson Completion Hook

/// Call this when a lesson is marked complete
/// Example: AchievementTriggerService.shared.onLessonCompleted(lessonId: "lesson_1", courseId: "psyop_detection", category: "systems")
/// 
/// Categories for reference:
/// - "consciousness" - Consciousness & awareness courses
/// - "systems" - Systems analysis, psyop detection
/// - "history" - Hidden history, timeline
/// - "esoteric" - Mystery school, forbidden knowledge
/// - "wellness" - Health, solar sovereignty

// MARK: - Usage Examples

/*
 
 // In LessonDetailView when lesson completes:
 
 Button("Complete Lesson") {
     // Mark lesson complete in your course system
     markLessonComplete(lesson.id)
     
     // Trigger achievement check
     AchievementTriggerService.shared.onLessonCompleted(
         lessonId: lesson.id,
         courseId: course.id,
         category: course.category
     )
 }
 
 // In CourseCompletionView when course finishes:
 
 .onAppear {
     AchievementTriggerService.shared.onCourseCompleted(
         courseId: course.id,
         category: course.category
     )
 }
 
 // In your root app view:
 
 WindowGroup {
     ContentView()
         .withAchievementToasts()
 }
 
 */
