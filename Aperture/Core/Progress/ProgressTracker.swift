// ProgressTracker.swift
// Track and visualize user progress across Aperture
// FIXED: Renamed CourseProgress -> TrackedCourseProgress to avoid conflict with ConsciousnessCourseEntity
// FIXED: Renamed StatBadge -> ProgressStatBadge to avoid redeclaration

import SwiftUI
import Combine

// MARK: - Progress Stats

struct ProgressStats: Codable {
    var totalDaysActive: Int = 0
    var currentStreak: Int = 0
    var longestStreak: Int = 0
    var totalPracticeMinutes: Int = 0
    var coursesStarted: Int = 0
    var coursesCompleted: Int = 0
    var lessonsCompleted: Int = 0
    var practicesCompleted: Int = 0
    var cosmosExplored: Int = 0
    var textsRead: Int = 0
    var timelineEventsViewed: Int = 0
    var dragonInteractions: Int = 0
    var insightsLogged: Int = 0
    var lastActiveDate: Date?
    
    // Computed
    var averagePracticeMinutes: Int {
        totalDaysActive > 0 ? totalPracticeMinutes / totalDaysActive : 0
    }
    
    var completionRate: Double {
        coursesStarted > 0 ? Double(coursesCompleted) / Double(coursesStarted) : 0
    }
}

// MARK: - Tracked Course Progress (RENAMED from CourseProgress)

struct TrackedCourseProgress: Codable, Identifiable {
    let id: String
    let courseId: String
    let courseName: String
    var lessonsCompleted: Int
    var totalLessons: Int
    var lastLessonId: String?
    var startDate: Date
    var completionDate: Date?
    var practiceMinutes: Int
    
    var progress: Double {
        totalLessons > 0 ? Double(lessonsCompleted) / Double(totalLessons) : 0
    }
    
    var isCompleted: Bool {
        lessonsCompleted >= totalLessons
    }
}

// MARK: - Achievement

struct Achievement: Codable, Identifiable {
    let id: String
    let title: String
    let description: String
    let icon: String
    let dateEarned: Date
    let category: AchievementCategory
    
    enum AchievementCategory: String, Codable {
        case streak = "streak"
        case course = "course"
        case exploration = "exploration"
        case practice = "practice"
        case dragon = "dragon"
        case special = "special"
        
        var color: Color {
            switch self {
            case .streak: return .orange
            case .course: return Palette.accent.gold
            case .exploration: return Palette.primary.cyan
            case .practice: return .purple
            case .dragon: return .red
            case .special: return .pink
            }
        }
    }
}

// MARK: - Progress Tracker

@MainActor
class ProgressTracker: ObservableObject {
    
    static let shared = ProgressTracker()
    
    @Published private(set) var stats: ProgressStats = ProgressStats()
    @Published private(set) var courseProgress: [TrackedCourseProgress] = []
    @Published private(set) var achievements: [Achievement] = []
    @Published private(set) var weeklyActivity: [Int] = [0, 0, 0, 0, 0, 0, 0] // Last 7 days minutes
    
    private let statsKey = "aperture.progress.stats.v1"
    private let coursesKey = "aperture.progress.courses.v1"
    private let achievementsKey = "aperture.progress.achievements.v1"
    
    private init() {
        load()
        checkDailyActivity()
    }
    
    // MARK: - Activity Tracking
    
    func recordDailyActivity() {
        let today = Calendar.current.startOfDay(for: Date())
        
        if let lastActive = stats.lastActiveDate {
            let lastActiveDay = Calendar.current.startOfDay(for: lastActive)
            let daysSinceActive = Calendar.current.dateComponents([.day], from: lastActiveDay, to: today).day ?? 0
            
            if daysSinceActive == 0 {
                // Already recorded today
                return
            } else if daysSinceActive == 1 {
                // Consecutive day
                stats.currentStreak += 1
                stats.longestStreak = max(stats.longestStreak, stats.currentStreak)
            } else {
                // Streak broken
                stats.currentStreak = 1
            }
        } else {
            // First day
            stats.currentStreak = 1
            stats.longestStreak = 1
        }
        
        stats.totalDaysActive += 1
        stats.lastActiveDate = Date()
        save()
        
        checkStreakAchievements()
    }
    
    func recordPractice(minutes: Int) {
        stats.totalPracticeMinutes += minutes
        stats.practicesCompleted += 1
        
        // Update weekly activity
        let dayIndex = Calendar.current.component(.weekday, from: Date()) - 1
        weeklyActivity[dayIndex] += minutes
        
        save()
        checkPracticeAchievements()
    }
    
    func recordLessonComplete(courseId: String, lessonId: String) {
        stats.lessonsCompleted += 1
        
        if let index = courseProgress.firstIndex(where: { $0.courseId == courseId }) {
            courseProgress[index].lessonsCompleted += 1
            courseProgress[index].lastLessonId = lessonId
            
            // Check if course completed
            if courseProgress[index].isCompleted && courseProgress[index].completionDate == nil {
                courseProgress[index].completionDate = Date()
                stats.coursesCompleted += 1
                earnAchievement(
                    id: "course_\(courseId)_complete",
                    title: "Course Completed!",
                    description: "Completed \(courseProgress[index].courseName)",
                    icon: "checkmark.seal.fill",
                    category: .course
                )
            }
        }
        
        save()
    }
    
    func startCourse(courseId: String, courseName: String, totalLessons: Int) {
        guard !courseProgress.contains(where: { $0.courseId == courseId }) else { return }
        
        let progress = TrackedCourseProgress(
            id: UUID().uuidString,
            courseId: courseId,
            courseName: courseName,
            lessonsCompleted: 0,
            totalLessons: totalLessons,
            lastLessonId: nil,
            startDate: Date(),
            completionDate: nil,
            practiceMinutes: 0
        )
        
        courseProgress.append(progress)
        stats.coursesStarted += 1
        save()
    }
    
    func recordCosmosExploration() {
        stats.cosmosExplored += 1
        save()
        checkExplorationAchievements()
    }
    
    func recordTextRead() {
        stats.textsRead += 1
        save()
    }
    
    func recordTimelineView() {
        stats.timelineEventsViewed += 1
        save()
    }
    
    func recordDragonInteraction() {
        stats.dragonInteractions += 1
        save()
        checkDragonAchievements()
    }
    
    func logInsight() {
        stats.insightsLogged += 1
        save()
    }
    
    // MARK: - Achievements
    
    private func checkStreakAchievements() {
        let streakMilestones = [3, 7, 14, 30, 60, 100, 365]
        
        for milestone in streakMilestones {
            if stats.currentStreak >= milestone {
                earnAchievement(
                    id: "streak_\(milestone)",
                    title: "\(milestone) Day Streak!",
                    description: "Maintained a \(milestone)-day practice streak",
                    icon: "flame.fill",
                    category: .streak
                )
            }
        }
    }
    
    private func checkPracticeAchievements() {
        let practiceMilestones = [10, 50, 100, 500, 1000]
        
        for milestone in practiceMilestones {
            if stats.practicesCompleted >= milestone {
                earnAchievement(
                    id: "practice_\(milestone)",
                    title: "\(milestone) Practices!",
                    description: "Completed \(milestone) practices",
                    icon: "figure.mind.and.body",
                    category: .practice
                )
            }
        }
    }
    
    private func checkExplorationAchievements() {
        let explorationMilestones = [5, 10, 25, 50]
        
        for milestone in explorationMilestones {
            if stats.cosmosExplored >= milestone {
                earnAchievement(
                    id: "cosmos_\(milestone)",
                    title: "Cosmic Explorer",
                    description: "Explored \(milestone) cosmic realms",
                    icon: "globe.americas.fill",
                    category: .exploration
                )
            }
        }
    }
    
    private func checkDragonAchievements() {
        let dragonMilestones = [10, 50, 100, 500]
        
        for milestone in dragonMilestones {
            if stats.dragonInteractions >= milestone {
                earnAchievement(
                    id: "dragon_\(milestone)",
                    title: "Dragon Whisperer",
                    description: "Had \(milestone) conversations with your Dragon",
                    icon: "flame.fill",
                    category: .dragon
                )
            }
        }
    }
    
    private func earnAchievement(id: String, title: String, description: String, icon: String, category: Achievement.AchievementCategory) {
        guard !achievements.contains(where: { $0.id == id }) else { return }
        
        let achievement = Achievement(
            id: id,
            title: title,
            description: description,
            icon: icon,
            dateEarned: Date(),
            category: category
        )
        
        achievements.insert(achievement, at: 0)
        save()
        
        // Trigger celebration
        HapticManager.shared.success()
        NotificationCenter.default.post(name: .achievementEarned, object: achievement)
    }
    
    // MARK: - Daily Check
    
    private func checkDailyActivity() {
        recordDailyActivity()
    }
    
    // MARK: - Persistence
    
    private func load() {
        if let data = UserDefaults.standard.data(forKey: statsKey),
           let decoded = try? JSONDecoder().decode(ProgressStats.self, from: data) {
            stats = decoded
        }
        
        if let data = UserDefaults.standard.data(forKey: coursesKey),
           let decoded = try? JSONDecoder().decode([TrackedCourseProgress].self, from: data) {
            courseProgress = decoded
        }
        
        if let data = UserDefaults.standard.data(forKey: achievementsKey),
           let decoded = try? JSONDecoder().decode([Achievement].self, from: data) {
            achievements = decoded
        }
    }
    
    private func save() {
        if let encoded = try? JSONEncoder().encode(stats) {
            UserDefaults.standard.set(encoded, forKey: statsKey)
        }
        if let encoded = try? JSONEncoder().encode(courseProgress) {
            UserDefaults.standard.set(encoded, forKey: coursesKey)
        }
        if let encoded = try? JSONEncoder().encode(achievements) {
            UserDefaults.standard.set(encoded, forKey: achievementsKey)
        }
    }
    
    // MARK: - Reset
    
    func resetForDebug() {
        stats = ProgressStats()
        courseProgress = []
        achievements = []
        weeklyActivity = [0, 0, 0, 0, 0, 0, 0]
        save()
    }
}

// MARK: - Journey Progress View

struct JourneyProgressView: View {
    
    @StateObject private var tracker = ProgressTracker.shared
    @ObservedObject private var dragonRepo = DragonCompanionRepository.shared
    @ObservedObject private var journeyStore = UserJourneyStore.shared
    
    @State private var selectedSection: ProgressSection = .overview
    
    enum ProgressSection: String, CaseIterable {
        case overview = "Overview"
        case courses = "Courses"
        case achievements = "Achievements"
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(hex: "#0a0a1a").ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 24) {
                        
                        // Header with Dragon
                        headerSection
                        
                        // Section picker
                        Picker("Section", selection: $selectedSection) {
                            ForEach(ProgressSection.allCases, id: \.self) { section in
                                Text(section.rawValue).tag(section)
                            }
                        }
                        .pickerStyle(.segmented)
                        .padding(.horizontal)
                        
                        // Content based on selection
                        switch selectedSection {
                        case .overview:
                            overviewSection
                        case .courses:
                            coursesSection
                        case .achievements:
                            achievementsSection
                        }
                        
                        Spacer(minLength: 100)
                    }
                    .padding(.top, 20)
                }
            }
            .navigationTitle("Your Journey")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    // MARK: - Header Section
    
    private var headerSection: some View {
        VStack(spacing: 16) {
            // Dragon + Level
            HStack(spacing: 16) {
                // Dragon avatar
                ZStack {
                    Circle()
                        .fill(Palette.accent.gold.opacity(0.2))
                        .frame(width: 80, height: 80)
                    
                    Text("🐉")
                        .font(.system(size: 40))
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(journeyStore.dragonName)
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.white)
                    
                    if let dragon = dragonRepo.currentDragon {
                        Text("Level \(dragon.level) • \(dragon.stage.rawValue)")
                            .font(.system(size: 14))
                            .foregroundColor(Palette.accent.gold)
                        
                        // XP Progress bar
                        GeometryReader { geo in
                            ZStack(alignment: .leading) {
                                Capsule()
                                    .fill(Color.white.opacity(0.1))
                                    .frame(height: 6)
                                
                                Capsule()
                                    .fill(Palette.accent.gold)
                                    .frame(width: geo.size.width * (1.0 - Double(dragon.xpToNextLevel) / 1000.0), height: 6)
                            }
                        }
                        .frame(height: 6)
                        .frame(maxWidth: 150)
                        
                        Text("\(dragon.xpToNextLevel) XP to next level")
                            .font(.system(size: 10))
                            .foregroundColor(.gray)
                    }
                }
                
                Spacer()
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.white.opacity(0.05))
            )
            .padding(.horizontal)
            
            // Streak badge
            HStack(spacing: 20) {
                ProgressStatBadge(
                    value: "\(tracker.stats.currentStreak)",
                    label: "Day Streak",
                    icon: "flame.fill",
                    color: .orange
                )
                
                ProgressStatBadge(
                    value: "\(tracker.stats.totalDaysActive)",
                    label: "Total Days",
                    icon: "calendar",
                    color: Palette.primary.cyan
                )
                
                ProgressStatBadge(
                    value: "\(tracker.stats.totalPracticeMinutes)m",
                    label: "Practice Time",
                    icon: "clock.fill",
                    color: .purple
                )
            }
            .padding(.horizontal)
        }
    }
    
    // MARK: - Overview Section
    
    private var overviewSection: some View {
        VStack(spacing: 20) {
            // Weekly activity chart
            weeklyActivityChart
            
            // Stats grid
            statsGrid
            
            // Journey path
            if let journey = journeyStore.journeyType {
                journeyPathCard(journey: journey)
            }
        }
        .padding(.horizontal)
    }
    
    private var weeklyActivityChart: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("THIS WEEK")
                .font(.system(size: 12, weight: .bold))
                .foregroundColor(.gray)
                .tracking(2)
            
            HStack(spacing: 8) {
                ForEach(0..<7, id: \.self) { index in
                    let dayNames = ["S", "M", "T", "W", "T", "F", "S"]
                    let maxMinutes = max(tracker.weeklyActivity.max() ?? 1, 1)
                    let height = CGFloat(tracker.weeklyActivity[index]) / CGFloat(maxMinutes) * 60
                    
                    VStack(spacing: 4) {
                        RoundedRectangle(cornerRadius: 4)
                            .fill(index == Calendar.current.component(.weekday, from: Date()) - 1 ?
                                  Palette.accent.gold : Palette.primary.cyan.opacity(0.5))
                            .frame(width: 30, height: max(height, 4))
                        
                        Text(dayNames[index])
                            .font(.system(size: 10))
                            .foregroundColor(.gray)
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .frame(height: 80)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white.opacity(0.05))
        )
    }
    
    private var statsGrid: some View {
        LazyVGrid(columns: [
            GridItem(.flexible()),
            GridItem(.flexible())
        ], spacing: 12) {
            StatCard(title: "Courses Started", value: "\(tracker.stats.coursesStarted)", icon: "book.fill", color: Palette.accent.gold)
            StatCard(title: "Courses Completed", value: "\(tracker.stats.coursesCompleted)", icon: "checkmark.seal.fill", color: .green)
            StatCard(title: "Lessons Done", value: "\(tracker.stats.lessonsCompleted)", icon: "list.bullet", color: Palette.primary.cyan)
            StatCard(title: "Practices", value: "\(tracker.stats.practicesCompleted)", icon: "figure.mind.and.body", color: .purple)
            StatCard(title: "Cosmos Explored", value: "\(tracker.stats.cosmosExplored)", icon: "globe.americas.fill", color: Palette.primary.violet)
            StatCard(title: "Dragon Talks", value: "\(tracker.stats.dragonInteractions)", icon: "flame.fill", color: .red)
        }
    }
    
    private func journeyPathCard(journey: UserJourneyType) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text(journey.icon)
                    .font(.system(size: 24))
                Text("Your Path: \(journey.title)")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.white)
            }
            
            Text(journey.recommendedContent)
                .font(.system(size: 13))
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(journey.color.opacity(0.1))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(journey.color.opacity(0.3), lineWidth: 1)
                )
        )
    }
    
    // MARK: - Courses Section
    
    private var coursesSection: some View {
        VStack(spacing: 16) {
            if tracker.courseProgress.isEmpty {
                VStack(spacing: 12) {
                    Image(systemName: "book.closed")
                        .font(.system(size: 40))
                        .foregroundColor(.gray)
                    Text("No courses started yet")
                        .foregroundColor(.gray)
                }
                .padding(.vertical, 40)
            } else {
                ForEach(tracker.courseProgress) { course in
                    TrackedCourseProgressCard(course: course)
                }
            }
        }
        .padding(.horizontal)
    }
    
    // MARK: - Achievements Section
    
    private var achievementsSection: some View {
        VStack(spacing: 16) {
            if tracker.achievements.isEmpty {
                VStack(spacing: 12) {
                    Image(systemName: "star")
                        .font(.system(size: 40))
                        .foregroundColor(.gray)
                    Text("No achievements yet")
                        .foregroundColor(.gray)
                    Text("Keep practicing to earn achievements!")
                        .font(.system(size: 13))
                        .foregroundColor(.gray.opacity(0.7))
                }
                .padding(.vertical, 40)
            } else {
                ForEach(tracker.achievements) { achievement in
                    AchievementCard(achievement: achievement)
                }
            }
        }
        .padding(.horizontal)
    }
}

// MARK: - Supporting Views

// RENAMED from StatBadge to ProgressStatBadge
struct ProgressStatBadge: View {
    let value: String
    let label: String
    let icon: String
    let color: Color
    
    var body: some View {
        VStack(spacing: 4) {
            HStack(spacing: 4) {
                Image(systemName: icon)
                    .font(.system(size: 12))
                    .foregroundColor(color)
                Text(value)
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.white)
            }
            Text(label)
                .font(.system(size: 10))
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 12)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white.opacity(0.05))
        )
    }
}

struct StatCard: View {
    let title: String
    let value: String
    let icon: String
    let color: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: icon)
                    .foregroundColor(color)
                Spacer()
            }
            
            Text(value)
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.white)
            
            Text(title)
                .font(.system(size: 11))
                .foregroundColor(.gray)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white.opacity(0.05))
        )
    }
}

// RENAMED from CourseProgressCard to TrackedCourseProgressCard
struct TrackedCourseProgressCard: View {
    let course: TrackedCourseProgress
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text(course.courseName)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.white)
                
                Spacer()
                
                if course.isCompleted {
                    Image(systemName: "checkmark.seal.fill")
                        .foregroundColor(.green)
                }
            }
            
            // Progress bar
            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color.white.opacity(0.1))
                    
                    RoundedRectangle(cornerRadius: 4)
                        .fill(course.isCompleted ? Color.green : Palette.accent.gold)
                        .frame(width: geo.size.width * course.progress)
                }
            }
            .frame(height: 8)
            
            HStack {
                Text("\(course.lessonsCompleted)/\(course.totalLessons) lessons")
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
                
                Spacer()
                
                Text("\(Int(course.progress * 100))%")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(Palette.accent.gold)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 14)
                .fill(Color.white.opacity(0.05))
        )
    }
}

struct AchievementCard: View {
    let achievement: Achievement
    
    var body: some View {
        HStack(spacing: 12) {
            // Icon
            ZStack {
                Circle()
                    .fill(achievement.category.color.opacity(0.2))
                    .frame(width: 50, height: 50)
                
                Image(systemName: achievement.icon)
                    .font(.system(size: 20))
                    .foregroundColor(achievement.category.color)
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(achievement.title)
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundColor(.white)
                
                Text(achievement.description)
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
                
                Text(achievement.dateEarned.formatted(date: .abbreviated, time: .omitted))
                    .font(.system(size: 10))
                    .foregroundColor(.gray.opacity(0.6))
            }
            
            Spacer()
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 14)
                .fill(Color.white.opacity(0.05))
                .overlay(
                    RoundedRectangle(cornerRadius: 14)
                        .stroke(achievement.category.color.opacity(0.2), lineWidth: 1)
                )
        )
    }
}

// MARK: - Notification Names

extension Notification.Name {
    static let achievementEarned = Notification.Name("achievementEarned")
}

// MARK: - Preview

#Preview("Journey Progress") {
    JourneyProgressView()
}
