// StreaksAndBadgesView.swift
// STREAKS & BADGES — "Dopamine for Doing Good Things"
// ☀️ SunFlow: Reignited × Second Brain
//
// "The ADHD brain has lower baseline dopamine.
//  It NEEDS reward signals to maintain behavior.
//  Instead of getting those rewards from scrolling,
//  we give them for breathing, checking in, and growing.
//  Same neurochemistry. Better outcomes."
//
// UserDefaults persistence. Zero backend.
// Streak tracking across all app features.

import SwiftUI

// MARK: - ═══════════════════════════════════════════════════
// STREAKS & BADGES VIEW
// ═══════════════════════════════════════════════════════════

struct StreaksAndBadgesView: View {
    
    @Environment(\.dismiss) var dismiss
    @StateObject private var tracker = StreakTracker()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 0.02, green: 0.03, blue: 0.06).ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 16) {
                        headerView
                        levelCard
                        streaksSection
                        badgesSection
                        dailyMissionsSection
                        insightCard
                        Spacer(minLength: 60)
                    }
                    .padding(20)
                }
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button { dismiss() } label: {
                        Image(systemName: "chevron.left").font(.system(size: 16, weight: .semibold)).foregroundColor(.white)
                    }
                }
                ToolbarItem(placement: .principal) {
                    HStack(spacing: 6) {
                        Image(systemName: "flame.fill").font(.system(size: 14)).foregroundColor(.orange)
                        Text("Streaks & Badges").font(.system(size: 17, weight: .bold)).foregroundColor(.white)
                    }
                }
            }
        }
    }
    
    // MARK: - Header
    
    private var headerView: some View {
        VStack(spacing: 6) {
            Text("🔥").font(.system(size: 44))
            Text("YOUR PROGRESS").font(.system(size: 18, weight: .black)).tracking(1).foregroundColor(.white)
            Text("Dopamine for doing good things.\nYour brain needs rewards — here are healthy ones.")
                .font(.system(size: 10, weight: .medium)).foregroundColor(.white.opacity(0.25)).multilineTextAlignment(.center)
        }
    }
    
    // MARK: - Level Card
    
    private var levelCard: some View {
        VStack(spacing: 10) {
            HStack {
                VStack(alignment: .leading, spacing: 2) {
                    Text("LEVEL \(tracker.currentLevel)").font(.system(size: 10, weight: .black)).tracking(1).foregroundColor(levelColor)
                    Text(tracker.levelTitle).font(.system(size: 18, weight: .black)).foregroundColor(.white)
                }
                Spacer()
                Text(tracker.levelEmoji).font(.system(size: 40))
            }
            
            // XP bar
            VStack(spacing: 4) {
                GeometryReader { geo in
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 4).fill(Color.white.opacity(0.03)).frame(height: 8)
                        RoundedRectangle(cornerRadius: 4).fill(levelColor).frame(width: geo.size.width * tracker.levelProgress, height: 8)
                    }
                }.frame(height: 8)
                
                HStack {
                    Text("\(tracker.totalXP) XP").font(.system(size: 9, weight: .bold)).foregroundColor(levelColor)
                    Spacer()
                    Text("\(tracker.xpForNextLevel) XP to Level \(tracker.currentLevel + 1)").font(.system(size: 9, weight: .medium)).foregroundColor(.white.opacity(0.2))
                }
            }
        }
        .padding(16).background(RoundedRectangle(cornerRadius: 14).fill(Color.white.opacity(0.02))
            .overlay(RoundedRectangle(cornerRadius: 14).stroke(levelColor.opacity(0.1), lineWidth: 1)))
    }
    
    private var levelColor: Color {
        switch tracker.currentLevel {
        case 1...4: return .cyan
        case 5...9: return .green
        case 10...19: return .purple
        case 20...29: return .orange
        default: return Color(red: 1.0, green: 0.85, blue: 0.3)
        }
    }
    
    // MARK: - Streaks Section
    
    private var streaksSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("ACTIVE STREAKS").font(.system(size: 9, weight: .black)).tracking(1).foregroundColor(.white.opacity(0.2))
            
            ForEach(StreakType.allCases, id: \.self) { type in
                streakRow(type)
            }
        }
    }
    
    private func streakRow(_ type: StreakType) -> some View {
        let streak = tracker.getStreak(type)
        let best = tracker.getBestStreak(type)
        
        return HStack(spacing: 10) {
            Text(type.emoji).font(.system(size: 20)).frame(width: 30)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(type.label).font(.system(size: 12, weight: .bold)).foregroundColor(.white)
                Text(type.detail).font(.system(size: 9, weight: .medium)).foregroundColor(.white.opacity(0.25))
            }
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 2) {
                HStack(spacing: 3) {
                    Text("🔥").font(.system(size: 10))
                    Text("\(streak)").font(.system(size: 16, weight: .black)).foregroundColor(streak > 0 ? .orange : .white.opacity(0.15))
                }
                Text("Best: \(best)").font(.system(size: 8, weight: .medium)).foregroundColor(.white.opacity(0.12))
            }
        }
        .padding(10).background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(streak > 0 ? 0.02 : 0.01))
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(streak > 0 ? Color.orange.opacity(0.06) : Color.clear, lineWidth: 1)))
    }
    
    // MARK: - Badges Section
    
    private var badgesSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text("BADGES").font(.system(size: 9, weight: .black)).tracking(1).foregroundColor(.white.opacity(0.2))
                Spacer()
                Text("\(tracker.earnedBadges.count)/\(Badge.allBadges.count)").font(.system(size: 9, weight: .bold)).foregroundColor(.white.opacity(0.15))
            }
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 90))], spacing: 8) {
                ForEach(Badge.allBadges) { badge in
                    badgeCard(badge)
                }
            }
        }
    }
    
    private func badgeCard(_ badge: Badge) -> some View {
        let earned = tracker.earnedBadges.contains(badge.id)
        return VStack(spacing: 4) {
            Text(earned ? badge.emoji : "🔒")
                .font(.system(size: 28))
                .opacity(earned ? 1.0 : 0.3)
            Text(badge.name).font(.system(size: 9, weight: .bold))
                .foregroundColor(earned ? .white : .white.opacity(0.15)).multilineTextAlignment(.center)
            Text(badge.requirement).font(.system(size: 7, weight: .medium))
                .foregroundColor(earned ? badge.color.opacity(0.5) : .white.opacity(0.08)).multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity).padding(10)
        .background(RoundedRectangle(cornerRadius: 10).fill(earned ? badge.color.opacity(0.03) : Color.white.opacity(0.005))
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(earned ? badge.color.opacity(0.1) : Color.white.opacity(0.02), lineWidth: 1)))
    }
    
    // MARK: - Daily Missions
    
    private var dailyMissionsSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("TODAY'S MISSIONS").font(.system(size: 9, weight: .black)).tracking(1).foregroundColor(.white.opacity(0.2))
            
            ForEach(DailyMission.todaysMissions) { mission in
                missionRow(mission)
            }
        }
    }
    
    private func missionRow(_ mission: DailyMission) -> some View {
        let completed = tracker.isMissionComplete(mission.id)
        return HStack(spacing: 10) {
            Image(systemName: completed ? "checkmark.circle.fill" : "circle")
                .font(.system(size: 16)).foregroundColor(completed ? .green : .white.opacity(0.1))
            
            VStack(alignment: .leading, spacing: 2) {
                Text(mission.title).font(.system(size: 12, weight: .bold))
                    .foregroundColor(completed ? .white.opacity(0.3) : .white)
                    .strikethrough(completed)
                Text(mission.description).font(.system(size: 9, weight: .medium)).foregroundColor(.white.opacity(0.2))
            }
            Spacer()
            Text("+\(mission.xpReward) XP").font(.system(size: 10, weight: .bold)).foregroundColor(completed ? .green.opacity(0.3) : .cyan)
        }
        .padding(10).background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(completed ? 0.005 : 0.02)))
    }
    
    // MARK: - Insight
    
    private var insightCard: some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack(spacing: 4) {
                Text("🧠").font(.system(size: 10))
                Text("WHY STREAKS WORK FOR ADHD").font(.system(size: 10, weight: .black)).tracking(1).foregroundColor(.orange)
            }
            Text("The ADHD brain has lower baseline dopamine in the reward pathway. This isn't a flaw — it's a configuration. But it means the brain constantly SEEKS stimulation to reach the same dopamine levels neurotypical brains get automatically.\n\nStreaks exploit this by providing PREDICTABLE dopamine hits tied to healthy behaviors. Each day you maintain a streak, your brain gets a reward signal. Breaking the streak creates loss aversion — another powerful motivator.\n\nThe beauty: over time, the healthy behavior becomes automated in the basal ganglia. What started as 'I need the streak' becomes 'I just do this now.' The streak was the bridge between conscious effort and automatic habit.\n\nSame neurochemistry that makes social media addictive. Better outcomes.")
                .font(.system(size: 11, weight: .medium)).foregroundColor(.white.opacity(0.4)).lineSpacing(3)
        }
        .padding(14).background(RoundedRectangle(cornerRadius: 12).fill(Color.orange.opacity(0.02))
            .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.orange.opacity(0.06), lineWidth: 1)))
    }
}

// MARK: - ═══════════════════════════════════════════════════
// STREAK TRACKER — Centralized XP + Streak Engine
// ═══════════════════════════════════════════════════════════

class StreakTracker: ObservableObject {
    
    @Published var totalXP: Int = 0
    @Published var streakData: [String: StreakData] = [:]
    @Published var earnedBadges: Set<String> = []
    @Published var completedMissions: Set<String> = []
    @Published var lastActiveDate: Date?
    
    private let storageKey = "aperture_streak_tracker"
    
    init() { load(); checkBadges() }
    
    // MARK: - Level System
    
    var currentLevel: Int {
        // Every 100 XP = 1 level, scaling
        var xp = totalXP; var level = 1; var threshold = 100
        while xp >= threshold { xp -= threshold; level += 1; threshold = 100 + (level * 20) }
        return level
    }
    
    var levelProgress: CGFloat {
        var xp = totalXP; var level = 1; var threshold = 100
        while xp >= threshold { xp -= threshold; level += 1; threshold = 100 + (level * 20) }
        return CGFloat(xp) / CGFloat(threshold)
    }
    
    var xpForNextLevel: Int {
        var xp = totalXP; var level = 1; var threshold = 100
        while xp >= threshold { xp -= threshold; level += 1; threshold = 100 + (level * 20) }
        return threshold - xp
    }
    
    var levelTitle: String {
        switch currentLevel {
        case 1...4: return "Awakening"
        case 5...9: return "Pattern Seeker"
        case 10...19: return "Sovereign Mind"
        case 20...29: return "Phoenix Rising"
        case 30...39: return "Ultra Instinct"
        default: return "SunFlow Master"
        }
    }
    
    var levelEmoji: String {
        switch currentLevel {
        case 1...4: return "🌱"
        case 5...9: return "🌿"
        case 10...19: return "🔥"
        case 20...29: return "🦅"
        case 30...39: return "⚡"
        default: return "☀️"
        }
    }
    
    // MARK: - Streak Operations
    
    func recordActivity(_ type: StreakType) {
        let key = type.rawValue
        var data = streakData[key] ?? StreakData(current: 0, best: 0, lastDate: nil)
        let cal = Calendar.current
        let today = cal.startOfDay(for: Date())
        
        if let last = data.lastDate {
            let lastDay = cal.startOfDay(for: last)
            if lastDay == today { return } // Already recorded today
            let diff = cal.dateComponents([.day], from: lastDay, to: today).day ?? 0
            if diff == 1 { data.current += 1 }
            else { data.current = 1 }
        } else {
            data.current = 1
        }
        
        data.lastDate = Date()
        data.best = max(data.best, data.current)
        streakData[key] = data
        
        // Award XP
        addXP(type.xpPerActivity + (data.current > 1 ? type.streakBonus : 0))
        
        save()
        checkBadges()
    }
    
    func getStreak(_ type: StreakType) -> Int {
        let data = streakData[type.rawValue]
        guard let last = data?.lastDate else { return 0 }
        let cal = Calendar.current
        let diff = cal.dateComponents([.day], from: cal.startOfDay(for: last), to: cal.startOfDay(for: Date())).day ?? 0
        if diff > 1 { return 0 } // Streak broken
        return data?.current ?? 0
    }
    
    func getBestStreak(_ type: StreakType) -> Int { streakData[type.rawValue]?.best ?? 0 }
    
    func addXP(_ amount: Int) {
        totalXP += amount
        save()
    }
    
    func isMissionComplete(_ id: String) -> Bool { completedMissions.contains(id) }
    
    func completeMission(_ id: String, xp: Int) {
        guard !completedMissions.contains(id) else { return }
        completedMissions.insert(id)
        addXP(xp)
        save()
    }
    
    // MARK: - Badge Checking
    
    private func checkBadges() {
        for badge in Badge.allBadges {
            if badge.check(self) { earnedBadges.insert(badge.id) }
        }
        save()
    }
    
    // MARK: - Persistence
    
    private func save() {
        let state = TrackerState(totalXP: totalXP, streakData: streakData, earnedBadges: Array(earnedBadges), completedMissions: Array(completedMissions))
        if let data = try? JSONEncoder().encode(state) { UserDefaults.standard.set(data, forKey: storageKey) }
    }
    
    private func load() {
        guard let data = UserDefaults.standard.data(forKey: storageKey),
              let state = try? JSONDecoder().decode(TrackerState.self, from: data) else { return }
        totalXP = state.totalXP
        streakData = state.streakData
        earnedBadges = Set(state.earnedBadges)
        completedMissions = Set(state.completedMissions)
    }
}

struct TrackerState: Codable {
    let totalXP: Int
    let streakData: [String: StreakData]
    let earnedBadges: [String]
    let completedMissions: [String]
}

struct StreakData: Codable {
    var current: Int
    var best: Int
    var lastDate: Date?
}

// MARK: - ═══════════════════════════════════════════════════
// STREAK TYPES
// ═══════════════════════════════════════════════════════════

enum StreakType: String, CaseIterable {
    case breathing, moodCheck, brainDump, taskComplete, sleepWindDown, awakening
    
    var emoji: String {
        switch self { case .breathing: return "🌬️"; case .moodCheck: return "💚"; case .brainDump: return "🧠"
        case .taskComplete: return "✅"; case .sleepWindDown: return "🌙"; case .awakening: return "☀️" }
    }
    var label: String {
        switch self { case .breathing: return "Breathing"; case .moodCheck: return "Mood Check"
        case .brainDump: return "Brain Dump"; case .taskComplete: return "Task Done"
        case .sleepWindDown: return "Wind-Down"; case .awakening: return "Awakening" }
    }
    var detail: String {
        switch self { case .breathing: return "Complete a breathing exercise"
        case .moodCheck: return "Log your mood"; case .brainDump: return "Dump at least one thought"
        case .taskComplete: return "Complete a task or micro-step"
        case .sleepWindDown: return "Use the sleep wind-down protocol"
        case .awakening: return "Explore any awakening module" }
    }
    var xpPerActivity: Int {
        switch self { case .breathing: return 15; case .moodCheck: return 20; case .brainDump: return 10
        case .taskComplete: return 25; case .sleepWindDown: return 20; case .awakening: return 30 }
    }
    var streakBonus: Int { 5 } // Extra XP per streak day
}

// MARK: - ═══════════════════════════════════════════════════
// BADGES
// ═══════════════════════════════════════════════════════════

struct Badge: Identifiable {
    let id: String
    let name: String
    let emoji: String
    let requirement: String
    let color: Color
    let check: (StreakTracker) -> Bool
    
    static let allBadges: [Badge] = [
        // Streak badges
        Badge(id: "first_breath", name: "First Breath", emoji: "🌬️", requirement: "Complete 1 breathing exercise", color: .cyan) { t in t.getBestStreak(.breathing) >= 1 },
        Badge(id: "breath_3", name: "Breath Warrior", emoji: "🧘", requirement: "3-day breathing streak", color: .cyan) { t in t.getBestStreak(.breathing) >= 3 },
        Badge(id: "breath_7", name: "Vagus Master", emoji: "💎", requirement: "7-day breathing streak", color: .cyan) { t in t.getBestStreak(.breathing) >= 7 },
        Badge(id: "breath_30", name: "Neural Architect", emoji: "🏗️", requirement: "30-day breathing streak", color: .cyan) { t in t.getBestStreak(.breathing) >= 30 },
        
        Badge(id: "mood_1", name: "Self-Aware", emoji: "💚", requirement: "Log first mood", color: .green) { t in t.getBestStreak(.moodCheck) >= 1 },
        Badge(id: "mood_7", name: "Pattern Seeker", emoji: "🔍", requirement: "7-day mood streak", color: .green) { t in t.getBestStreak(.moodCheck) >= 7 },
        Badge(id: "mood_30", name: "Emotional Literate", emoji: "📊", requirement: "30-day mood streak", color: .green) { t in t.getBestStreak(.moodCheck) >= 30 },
        
        Badge(id: "dump_1", name: "Brain Unburdened", emoji: "🧠", requirement: "First brain dump", color: .purple) { t in t.getBestStreak(.brainDump) >= 1 },
        Badge(id: "dump_7", name: "Thought Liberator", emoji: "🕊️", requirement: "7-day dump streak", color: .purple) { t in t.getBestStreak(.brainDump) >= 7 },
        
        Badge(id: "task_10", name: "Momentum Builder", emoji: "🚀", requirement: "Complete 10 tasks", color: .blue) { t in t.totalXP >= 250 },
        
        Badge(id: "awaken_1", name: "Curious Mind", emoji: "👁️", requirement: "Explore first awakening module", color: Color(red: 1.0, green: 0.85, blue: 0.3)) { t in t.getBestStreak(.awakening) >= 1 },
        Badge(id: "awaken_7", name: "Seeker", emoji: "🔮", requirement: "7 days exploring awakening", color: Color(red: 1.0, green: 0.85, blue: 0.3)) { t in t.getBestStreak(.awakening) >= 7 },
        
        // Level badges
        Badge(id: "level_5", name: "Rising", emoji: "🌅", requirement: "Reach Level 5", color: .green) { t in t.currentLevel >= 5 },
        Badge(id: "level_10", name: "Sovereign", emoji: "👑", requirement: "Reach Level 10", color: .purple) { t in t.currentLevel >= 10 },
        Badge(id: "level_20", name: "Phoenix", emoji: "🦅", requirement: "Reach Level 20", color: .orange) { t in t.currentLevel >= 20 },
        Badge(id: "level_30", name: "Ultra Instinct", emoji: "⚡", requirement: "Reach Level 30", color: Color(red: 1.0, green: 0.85, blue: 0.3)) { t in t.currentLevel >= 30 },
    ]
}

// MARK: - ═══════════════════════════════════════════════════
// DAILY MISSIONS
// ═══════════════════════════════════════════════════════════

struct DailyMission: Identifiable {
    let id: String
    let title: String
    let description: String
    let xpReward: Int
    
    static var todaysMissions: [DailyMission] {
        [
            DailyMission(id: "m_breathe", title: "Complete a breathing exercise", description: "Any technique, any duration", xpReward: 15),
            DailyMission(id: "m_mood", title: "Log your mood", description: "Check in with yourself", xpReward: 20),
            DailyMission(id: "m_dump", title: "Brain dump at least one thought", description: "Get it out of your head", xpReward: 10),
            DailyMission(id: "m_task", title: "Complete one micro-task", description: "Even the tiniest step counts", xpReward: 25),
            DailyMission(id: "m_explore", title: "Explore any module for 2+ minutes", description: "Feed your curiosity", xpReward: 15),
        ]
    }
}
