// AchievementSystem.swift
// Achievement Badges & Gamification Layer
// ☀️ SunFlow: Reignited

import SwiftUI
import Foundation

// MARK: - Achievement Category

enum AchievementCategory: String, CaseIterable, Codable {
    case awakening = "Awakening"
    case knowledge = "Knowledge"
    case consistency = "Consistency"
    case mastery = "Mastery"
    case community = "Community"
    case special = "Special"
    
    var icon: String {
        switch self {
        case .awakening: return "eye.fill"
        case .knowledge: return "book.fill"
        case .consistency: return "flame.fill"
        case .mastery: return "crown.fill"
        case .community: return "person.3.fill"
        case .special: return "star.fill"
        }
    }
    
    var color: Color {
        switch self {
        case .awakening: return .purple
        case .knowledge: return .blue
        case .consistency: return .orange
        case .mastery: return .yellow
        case .community: return .green
        case .special: return .pink
        }
    }
}

// MARK: - Achievement Rarity

enum AchievementRarity: String, CaseIterable, Codable {
    case common = "Common"
    case rare = "Rare"
    case epic = "Epic"
    case legendary = "Legendary"
    case mythic = "Mythic"
    
    var color: Color {
        switch self {
        case .common: return .gray
        case .rare: return .blue
        case .epic: return .purple
        case .legendary: return .orange
        case .mythic: return Color(hex: "#FFD700") // Gold
        }
    }
    
    var glowIntensity: Double {
        switch self {
        case .common: return 0.0
        case .rare: return 0.3
        case .epic: return 0.5
        case .legendary: return 0.7
        case .mythic: return 1.0
        }
    }
}

// MARK: - Achievement Model

struct Achievement: Identifiable, Codable, Equatable {
    let id: String
    let title: String
    let description: String
    let icon: String
    let category: AchievementCategory
    let rarity: AchievementRarity
    let requirement: AchievementRequirement
    let xpReward: Int
    let secretUntilUnlocked: Bool
    var dateEarned: Date?
    
    var isSecret: Bool { secretUntilUnlocked }
    
    static func == (lhs: Achievement, rhs: Achievement) -> Bool {
        lhs.id == rhs.id
    }
}

// MARK: - Achievement Requirement

enum AchievementRequirement: Codable, Equatable {
    case coursesCompleted(count: Int)
    case lessonsCompleted(count: Int)
    case streakDays(count: Int)
    case categoryMastery(category: String, coursesRequired: Int)
    case specificCourse(courseId: String)
    case totalXP(amount: Int)
    case friendsInvited(count: Int)
    case firstAction(action: String)
    case timeSpent(minutes: Int)
    case perfectWeek
    case allCoursesInCategory(category: String)
    case secret(condition: String)
    
    var progressDescription: String {
        switch self {
        case .coursesCompleted(let count):
            return "Complete \(count) course\(count == 1 ? "" : "s")"
        case .lessonsCompleted(let count):
            return "Complete \(count) lesson\(count == 1 ? "" : "s")"
        case .streakDays(let count):
            return "Maintain a \(count)-day streak"
        case .categoryMastery(let category, let courses):
            return "Complete \(courses) \(category) courses"
        case .specificCourse(let courseId):
            return "Complete the \(courseId) course"
        case .totalXP(let amount):
            return "Earn \(amount) XP"
        case .friendsInvited(let count):
            return "Invite \(count) friend\(count == 1 ? "" : "s")"
        case .firstAction(let action):
            return action
        case .timeSpent(let minutes):
            return "Spend \(minutes) minutes learning"
        case .perfectWeek:
            return "Complete lessons every day for a week"
        case .allCoursesInCategory(let category):
            return "Complete all \(category) courses"
        case .secret:
            return "???"
        }
    }
}

// MARK: - User Achievement Progress

struct UserAchievementProgress: Codable {
    let achievementId: String
    var currentProgress: Int
    var isUnlocked: Bool
    var unlockedDate: Date?
    var hasBeenSeen: Bool
}

// MARK: - Achievement Manager

@MainActor
class AchievementManager: ObservableObject {
    static let shared = AchievementManager()
    
    @Published var unlockedAchievements: [String: UserAchievementProgress] = [:]
    @Published var recentlyUnlocked: [Achievement] = []
    @Published var totalXP: Int = 0
    @Published var currentLevel: Int = 1
    
    private let userDefaults = UserDefaults.standard
    private let achievementsKey = "user_achievements_progress"
    private let xpKey = "user_total_xp"
    
    // XP required per level (exponential curve)
    private func xpForLevel(_ level: Int) -> Int {
        return level * level * 100
    }
    
    var xpToNextLevel: Int {
        xpForLevel(currentLevel + 1) - totalXP
    }
    
    var levelProgress: Double {
        let currentLevelXP = xpForLevel(currentLevel)
        let nextLevelXP = xpForLevel(currentLevel + 1)
        let progressXP = totalXP - currentLevelXP
        let requiredXP = nextLevelXP - currentLevelXP
        return Double(progressXP) / Double(requiredXP)
    }
    
    init() {
        loadProgress()
    }
    
    // MARK: - All Achievements
    
    let allAchievements: [Achievement] = [
        
        // ═══════════════════════════════════════════════════════════════
        // AWAKENING ACHIEVEMENTS
        // ═══════════════════════════════════════════════════════════════
        
        Achievement(
            id: "first_lesson",
            title: "Eyes Opening",
            description: "Complete your first lesson",
            icon: "eye",
            category: .awakening,
            rarity: .common,
            requirement: .lessonsCompleted(count: 1),
            xpReward: 50,
            secretUntilUnlocked: false
        ),
        
        Achievement(
            id: "first_course",
            title: "Seeker",
            description: "Complete your first course",
            icon: "magnifyingglass",
            category: .awakening,
            rarity: .common,
            requirement: .coursesCompleted(count: 1),
            xpReward: 100,
            secretUntilUnlocked: false
        ),
        
        Achievement(
            id: "five_courses",
            title: "Truth Hunter",
            description: "Complete 5 courses",
            icon: "scope",
            category: .awakening,
            rarity: .rare,
            requirement: .coursesCompleted(count: 5),
            xpReward: 250,
            secretUntilUnlocked: false
        ),
        
        Achievement(
            id: "ten_courses",
            title: "Pattern Recognizer",
            description: "Complete 10 courses",
            icon: "brain.head.profile",
            category: .awakening,
            rarity: .epic,
            requirement: .coursesCompleted(count: 10),
            xpReward: 500,
            secretUntilUnlocked: false
        ),
        
        Achievement(
            id: "twenty_courses",
            title: "Awakened Mind",
            description: "Complete 20 courses",
            icon: "sparkles",
            category: .awakening,
            rarity: .legendary,
            requirement: .coursesCompleted(count: 20),
            xpReward: 1000,
            secretUntilUnlocked: false
        ),
        
        Achievement(
            id: "all_courses",
            title: "Fully Awakened",
            description: "Complete every course in Aperture",
            icon: "sun.max.fill",
            category: .awakening,
            rarity: .mythic,
            requirement: .coursesCompleted(count: 31),
            xpReward: 5000,
            secretUntilUnlocked: false
        ),
        
        // ═══════════════════════════════════════════════════════════════
        // KNOWLEDGE ACHIEVEMENTS
        // ═══════════════════════════════════════════════════════════════
        
        Achievement(
            id: "fifty_lessons",
            title: "Scholar",
            description: "Complete 50 lessons",
            icon: "book.closed.fill",
            category: .knowledge,
            rarity: .rare,
            requirement: .lessonsCompleted(count: 50),
            xpReward: 300,
            secretUntilUnlocked: false
        ),
        
        Achievement(
            id: "hundred_lessons",
            title: "Sage",
            description: "Complete 100 lessons",
            icon: "books.vertical.fill",
            category: .knowledge,
            rarity: .epic,
            requirement: .lessonsCompleted(count: 100),
            xpReward: 750,
            secretUntilUnlocked: false
        ),
        
        Achievement(
            id: "consciousness_master",
            title: "Consciousness Explorer",
            description: "Complete 3 Consciousness courses",
            icon: "brain",
            category: .knowledge,
            rarity: .rare,
            requirement: .categoryMastery(category: "consciousness", coursesRequired: 3),
            xpReward: 400,
            secretUntilUnlocked: false
        ),
        
        Achievement(
            id: "systems_master",
            title: "Systems Analyst",
            description: "Complete 3 Systems courses",
            icon: "gearshape.2.fill",
            category: .knowledge,
            rarity: .rare,
            requirement: .categoryMastery(category: "systems", coursesRequired: 3),
            xpReward: 400,
            secretUntilUnlocked: false
        ),
        
        Achievement(
            id: "history_master",
            title: "Hidden Historian",
            description: "Complete 3 History courses",
            icon: "clock.arrow.circlepath",
            category: .knowledge,
            rarity: .rare,
            requirement: .categoryMastery(category: "history", coursesRequired: 3),
            xpReward: 400,
            secretUntilUnlocked: false
        ),
        
        Achievement(
            id: "esoteric_master",
            title: "Mystery School Graduate",
            description: "Complete 3 Esoteric courses",
            icon: "eye.trianglebadge.exclamationmark",
            category: .knowledge,
            rarity: .epic,
            requirement: .categoryMastery(category: "esoteric", coursesRequired: 3),
            xpReward: 600,
            secretUntilUnlocked: false
        ),
        
        // ═══════════════════════════════════════════════════════════════
        // CONSISTENCY ACHIEVEMENTS
        // ═══════════════════════════════════════════════════════════════
        
        Achievement(
            id: "streak_3",
            title: "Spark",
            description: "Maintain a 3-day learning streak",
            icon: "flame",
            category: .consistency,
            rarity: .common,
            requirement: .streakDays(count: 3),
            xpReward: 75,
            secretUntilUnlocked: false
        ),
        
        Achievement(
            id: "streak_7",
            title: "Burning Bright",
            description: "Maintain a 7-day learning streak",
            icon: "flame.fill",
            category: .consistency,
            rarity: .rare,
            requirement: .streakDays(count: 7),
            xpReward: 200,
            secretUntilUnlocked: false
        ),
        
        Achievement(
            id: "streak_30",
            title: "Eternal Flame",
            description: "Maintain a 30-day learning streak",
            icon: "flame.circle.fill",
            category: .consistency,
            rarity: .epic,
            requirement: .streakDays(count: 30),
            xpReward: 500,
            secretUntilUnlocked: false
        ),
        
        Achievement(
            id: "streak_100",
            title: "Unbreakable",
            description: "Maintain a 100-day learning streak",
            icon: "bolt.shield.fill",
            category: .consistency,
            rarity: .legendary,
            requirement: .streakDays(count: 100),
            xpReward: 1500,
            secretUntilUnlocked: false
        ),
        
        Achievement(
            id: "streak_365",
            title: "Year of Awakening",
            description: "Maintain a 365-day learning streak",
            icon: "sun.max.trianglebadge.exclamationmark",
            category: .consistency,
            rarity: .mythic,
            requirement: .streakDays(count: 365),
            xpReward: 10000,
            secretUntilUnlocked: false
        ),
        
        Achievement(
            id: "perfect_week",
            title: "Perfect Week",
            description: "Complete at least one lesson every day for a week",
            icon: "checkmark.seal.fill",
            category: .consistency,
            rarity: .rare,
            requirement: .perfectWeek,
            xpReward: 250,
            secretUntilUnlocked: false
        ),
        
        // ═══════════════════════════════════════════════════════════════
        // MASTERY ACHIEVEMENTS
        // ═══════════════════════════════════════════════════════════════
        
        Achievement(
            id: "level_5",
            title: "Initiate",
            description: "Reach Level 5",
            icon: "star",
            category: .mastery,
            rarity: .common,
            requirement: .totalXP(amount: 2500),
            xpReward: 100,
            secretUntilUnlocked: false
        ),
        
        Achievement(
            id: "level_10",
            title: "Adept",
            description: "Reach Level 10",
            icon: "star.leadinghalf.filled",
            category: .mastery,
            rarity: .rare,
            requirement: .totalXP(amount: 10000),
            xpReward: 250,
            secretUntilUnlocked: false
        ),
        
        Achievement(
            id: "level_25",
            title: "Master",
            description: "Reach Level 25",
            icon: "star.fill",
            category: .mastery,
            rarity: .epic,
            requirement: .totalXP(amount: 62500),
            xpReward: 500,
            secretUntilUnlocked: false
        ),
        
        Achievement(
            id: "level_50",
            title: "Grandmaster",
            description: "Reach Level 50",
            icon: "star.circle.fill",
            category: .mastery,
            rarity: .legendary,
            requirement: .totalXP(amount: 250000),
            xpReward: 1000,
            secretUntilUnlocked: false
        ),
        
        // ═══════════════════════════════════════════════════════════════
        // COMMUNITY ACHIEVEMENTS
        // ═══════════════════════════════════════════════════════════════
        
        Achievement(
            id: "first_share",
            title: "Spark Spreader",
            description: "Share a course with a friend",
            icon: "paperplane.fill",
            category: .community,
            rarity: .common,
            requirement: .firstAction(action: "Share a course"),
            xpReward: 50,
            secretUntilUnlocked: false
        ),
        
        Achievement(
            id: "invite_1",
            title: "Awakening Catalyst",
            description: "Invite a friend to Aperture",
            icon: "person.badge.plus",
            category: .community,
            rarity: .common,
            requirement: .friendsInvited(count: 1),
            xpReward: 100,
            secretUntilUnlocked: false
        ),
        
        Achievement(
            id: "invite_5",
            title: "Truth Ambassador",
            description: "Invite 5 friends to Aperture",
            icon: "person.3.fill",
            category: .community,
            rarity: .rare,
            requirement: .friendsInvited(count: 5),
            xpReward: 300,
            secretUntilUnlocked: false
        ),
        
        Achievement(
            id: "invite_10",
            title: "Awakening Network",
            description: "Invite 10 friends to Aperture",
            icon: "network",
            category: .community,
            rarity: .epic,
            requirement: .friendsInvited(count: 10),
            xpReward: 750,
            secretUntilUnlocked: false
        ),
        
        // ═══════════════════════════════════════════════════════════════
        // SPECIAL / SECRET ACHIEVEMENTS
        // ═══════════════════════════════════════════════════════════════
        
        Achievement(
            id: "night_owl",
            title: "Night Owl",
            description: "Complete a lesson between midnight and 4 AM",
            icon: "moon.stars.fill",
            category: .special,
            rarity: .rare,
            requirement: .secret(condition: "lesson_completed_night"),
            xpReward: 150,
            secretUntilUnlocked: true
        ),
        
        Achievement(
            id: "early_bird",
            title: "Early Bird",
            description: "Complete a lesson before 6 AM",
            icon: "sunrise.fill",
            category: .special,
            rarity: .rare,
            requirement: .secret(condition: "lesson_completed_early"),
            xpReward: 150,
            secretUntilUnlocked: true
        ),
        
        Achievement(
            id: "speed_reader",
            title: "Speed Seeker",
            description: "Complete 5 lessons in one day",
            icon: "hare.fill",
            category: .special,
            rarity: .rare,
            requirement: .secret(condition: "five_lessons_one_day"),
            xpReward: 200,
            secretUntilUnlocked: true
        ),
        
        Achievement(
            id: "psyop_detector",
            title: "Psyop Detector",
            description: "Complete the 'How to Spot a Psyop' course",
            icon: "eye.trianglebadge.exclamationmark",
            category: .special,
            rarity: .epic,
            requirement: .specificCourse(courseId: "psyop_detection"),
            xpReward: 500,
            secretUntilUnlocked: false
        ),
        
        Achievement(
            id: "serpent_wisdom",
            title: "Serpent Wisdom",
            description: "Complete the 'Serpent Decoded' course",
            icon: "waveform.path",
            category: .special,
            rarity: .epic,
            requirement: .specificCourse(courseId: "serpent_decoded"),
            xpReward: 500,
            secretUntilUnlocked: false
        ),
        
        Achievement(
            id: "name_keeper",
            title: "Name Keeper",
            description: "Complete 'The Living Name' course",
            icon: "character.book.closed.fill",
            category: .special,
            rarity: .epic,
            requirement: .specificCourse(courseId: "living_name"),
            xpReward: 500,
            secretUntilUnlocked: false
        ),
        
        Achievement(
            id: "word_wizard",
            title: "Word Wizard",
            description: "Complete 'The Word Spells' course",
            icon: "textformat.abc",
            category: .special,
            rarity: .epic,
            requirement: .specificCourse(courseId: "word_spells"),
            xpReward: 500,
            secretUntilUnlocked: false
        ),
        
        Achievement(
            id: "matrix_unplugged",
            title: "Matrix Unplugged",
            description: "Complete all Systems category courses",
            icon: "cube.transparent",
            category: .special,
            rarity: .legendary,
            requirement: .allCoursesInCategory(category: "systems"),
            xpReward: 2000,
            secretUntilUnlocked: false
        ),
        
        Achievement(
            id: "forbidden_knowledge",
            title: "Forbidden Knowledge",
            description: "Read all 7 Forbidden Gospels",
            icon: "book.closed.fill",
            category: .special,
            rarity: .legendary,
            requirement: .secret(condition: "all_forbidden_gospels"),
            xpReward: 1000,
            secretUntilUnlocked: true
        ),
        
        Achievement(
            id: "ultra_instinct",
            title: "Ultra Instinct",
            description: "???",
            icon: "bolt.fill",
            category: .special,
            rarity: .mythic,
            requirement: .secret(condition: "ultra_instinct_unlocked"),
            xpReward: 5000,
            secretUntilUnlocked: true
        )
    ]
    
    // MARK: - Progress Management
    
    func loadProgress() {
        if let data = userDefaults.data(forKey: achievementsKey),
           let progress = try? JSONDecoder().decode([String: UserAchievementProgress].self, from: data) {
            unlockedAchievements = progress
        }
        totalXP = userDefaults.integer(forKey: xpKey)
        calculateLevel()
    }
    
    func saveProgress() {
        if let data = try? JSONEncoder().encode(unlockedAchievements) {
            userDefaults.set(data, forKey: achievementsKey)
        }
        userDefaults.set(totalXP, forKey: xpKey)
    }
    
    private func calculateLevel() {
        var level = 1
        while xpForLevel(level + 1) <= totalXP {
            level += 1
        }
        currentLevel = level
    }
    
    // MARK: - Achievement Checking
    
    func checkAchievements(
        coursesCompleted: Int = 0,
        lessonsCompleted: Int = 0,
        streakDays: Int = 0,
        friendsInvited: Int = 0,
        completedCourseId: String? = nil,
        categoryProgress: [String: Int] = [:]
    ) {
        for achievement in allAchievements {
            // Skip if already unlocked
            if unlockedAchievements[achievement.id]?.isUnlocked == true {
                continue
            }
            
            var shouldUnlock = false
            
            switch achievement.requirement {
            case .coursesCompleted(let count):
                shouldUnlock = coursesCompleted >= count
                
            case .lessonsCompleted(let count):
                shouldUnlock = lessonsCompleted >= count
                
            case .streakDays(let count):
                shouldUnlock = streakDays >= count
                
            case .friendsInvited(let count):
                shouldUnlock = friendsInvited >= count
                
            case .specificCourse(let courseId):
                shouldUnlock = completedCourseId == courseId
                
            case .categoryMastery(let category, let required):
                shouldUnlock = (categoryProgress[category] ?? 0) >= required
                
            case .totalXP(let amount):
                shouldUnlock = totalXP >= amount
                
            default:
                break
            }
            
            if shouldUnlock {
                unlockAchievement(achievement)
            }
        }
    }
    
    func unlockAchievement(_ achievement: Achievement) {
        guard unlockedAchievements[achievement.id]?.isUnlocked != true else { return }
        
        let progress = UserAchievementProgress(
            achievementId: achievement.id,
            currentProgress: 1,
            isUnlocked: true,
            unlockedDate: Date(),
            hasBeenSeen: false
        )
        
        unlockedAchievements[achievement.id] = progress
        recentlyUnlocked.append(achievement)
        totalXP += achievement.xpReward
        calculateLevel()
        saveProgress()
        
        // Haptic feedback
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
    
    func markAsSeen(_ achievementId: String) {
        unlockedAchievements[achievementId]?.hasBeenSeen = true
        recentlyUnlocked.removeAll { $0.id == achievementId }
        saveProgress()
    }
    
    func getProgress(for achievement: Achievement) -> Double {
        guard let progress = unlockedAchievements[achievement.id] else {
            return 0
        }
        
        if progress.isUnlocked { return 1.0 }
        
        // Calculate progress based on requirement type
        // This would need to be connected to actual user stats
        return Double(progress.currentProgress) / 100.0
    }
    
    // MARK: - Stats
    
    var totalUnlocked: Int {
        unlockedAchievements.values.filter { $0.isUnlocked }.count
    }
    
    var totalAchievements: Int {
        allAchievements.count
    }
    
    var completionPercentage: Double {
        Double(totalUnlocked) / Double(totalAchievements)
    }
    
    func achievementsByCategory(_ category: AchievementCategory) -> [Achievement] {
        allAchievements.filter { $0.category == category }
    }
    
    func unlockedInCategory(_ category: AchievementCategory) -> Int {
        achievementsByCategory(category).filter { unlockedAchievements[$0.id]?.isUnlocked == true }.count
    }
}
