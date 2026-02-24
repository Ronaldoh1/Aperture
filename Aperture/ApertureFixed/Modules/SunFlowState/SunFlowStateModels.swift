// SunFlowStateModels.swift
// The complete data model layer for Sun Flow State — Cognitive Sovereignty Protocol.
// P0-P4 Bucket Engine, Pillars, Compass, Scorecard, Blueprint, Guided Sessions.
// ☀️ SunFlow: Reignited

import SwiftUI

// MARK: - ═══════════════════════════════════════════════════
// P0–P4 BUCKET ENGINE — The spine of everything
// ═══════════════════════════════════════════════════════════

enum FlowBucket: Int, CaseIterable, Codable, Identifiable {
    case p0 = 0, p1, p2, p3, p4
    
    var id: Int { rawValue }
    
    var label: String {
        switch self {
        case .p0: return "P0 – Propellant"
        case .p1: return "P1 – Accelerator"
        case .p2: return "P2 – Maintenance"
        case .p3: return "P3 – Nice-to-Have"
        case .p4: return "P4 – #404Error"
        }
    }
    
    var shortLabel: String {
        switch self {
        case .p0: return "P0"
        case .p1: return "P1"
        case .p2: return "P2"
        case .p3: return "P3"
        case .p4: return "P4"
        }
    }
    
    var description: String {
        switch self {
        case .p0: return "Directly propels a Pillar today. Calendar it."
        case .p1: return "Strong accelerator within 30 days."
        case .p2: return "Keeps the machine running."
        case .p3: return "Rarely allowed. Justify or kill."
        case .p4: return "Delete immediately. #404Error."
        }
    }
    
    var color: Color {
        switch self {
        case .p0: return Color(red: 0.0, green: 0.6, blue: 0.2)      // Deep green
        case .p1: return Color(red: 0.4, green: 0.8, blue: 0.4)      // Light green
        case .p2: return Color(red: 1.0, green: 0.85, blue: 0.3)     // Yellow/gold
        case .p3: return Color(red: 1.0, green: 0.6, blue: 0.2)      // Orange warning
        case .p4: return .red
        }
    }
    
    var emoji: String {
        switch self {
        case .p0: return "🟢"
        case .p1: return "🟩"
        case .p2: return "🟡"
        case .p3: return "🟠"
        case .p4: return "🔴"
        }
    }
    
    var isAllowedInCalendar: Bool {
        self != .p4 && self != .p3
    }
}

// MARK: - ═══════════════════════════════════════════════════
// CHANGE SCALE — Commitment gate + adaptive difficulty
// ═══════════════════════════════════════════════════════════

enum ChangeScaleLevel: Int, CaseIterable, Codable {
    case one = 1, two, three, four, five
    
    var label: String {
        switch self {
        case .one: return "I like the idea but brunch and dopamine still win."
        case .two: return "Curious but not ready to sacrifice comfort."
        case .three: return "Want change but still negotiate with distraction."
        case .four: return "Serious. I will restructure my environment."
        case .five: return "I want sovereignty more than stimulation."
        }
    }
    
    var shortLabel: String {
        switch self {
        case .one: return "Browsing"
        case .two: return "Curious"
        case .three: return "Negotiating"
        case .four: return "Committed"
        case .five: return "Sovereign"
        }
    }
    
    var meetsMinimum: Bool { self.rawValue >= 4 }
}

// MARK: - ═══════════════════════════════════════════════════
// PILLARS — 3-5 permanent anchors
// ═══════════════════════════════════════════════════════════

struct FlowPillar: Identifiable, Codable, Equatable {
    let id: String
    var title: String
    var emoji: String
    var createdDate: Date
    
    init(title: String, emoji: String = "⚡") {
        self.id = UUID().uuidString
        self.title = title
        self.emoji = emoji
        self.createdDate = Date()
    }
}

// MARK: - ═══════════════════════════════════════════════════
// NEXT-LEVEL COMPASS
// ═══════════════════════════════════════════════════════════

struct NextLevelCompass: Codable {
    var nextLevelSelf: String           // 6-12 month vision in present tense
    var pillars: [FlowPillar]
    var lastUpdated: Date
    var changeScaleLevel: ChangeScaleLevel
    
    init() {
        self.nextLevelSelf = ""
        self.pillars = []
        self.lastUpdated = Date()
        self.changeScaleLevel = .three
    }
}

// MARK: - ═══════════════════════════════════════════════════
// FLOW TASK — Any item that goes through the bucket engine
// ═══════════════════════════════════════════════════════════

struct FlowTask: Identifiable, Codable {
    let id: String
    var title: String
    var bucket: FlowBucket
    var linkedPillarId: String?
    var scheduledDate: Date?
    var timeBlockStart: Date?
    var timeBlockEnd: Date?
    var isCompleted: Bool
    var definitionOfDone: String?
    var urgency: Int             // 1-10
    var impact: Int              // 1-10
    var roi: Int                 // 1-10
    var alignment: Int           // 1-10
    var energyCost: Int          // 1-10
    
    init(title: String, bucket: FlowBucket, linkedPillarId: String? = nil) {
        self.id = UUID().uuidString
        self.title = title
        self.bucket = bucket
        self.linkedPillarId = linkedPillarId
        self.scheduledDate = nil
        self.timeBlockStart = nil
        self.timeBlockEnd = nil
        self.isCompleted = false
        self.definitionOfDone = nil
        self.urgency = 5
        self.impact = 5
        self.roi = 5
        self.alignment = 5
        self.energyCost = 5
    }
    
    var priorityScore: Double {
        let u = Double(urgency)
        let i = Double(impact)
        let r = Double(roi)
        let a = Double(alignment)
        let e = Double(10 - energyCost)
        return (u * i * r * a * e) / 10000.0  // Normalized 0-1
    }
}

// MARK: - ═══════════════════════════════════════════════════
// TIME BLOCK CATEGORIES
// ═══════════════════════════════════════════════════════════

enum TimeBlockCategory: String, CaseIterable, Codable {
    case deepFlow = "Deep Flow"
    case creative = "Creative"
    case adminBatch = "Admin Batch"
    case urgent = "Urgent"
    case buffer = "Buffer/Recovery"
    
    var color: Color {
        switch self {
        case .deepFlow: return Color(red: 0.0, green: 0.5, blue: 0.2)
        case .creative: return Color(red: 0.4, green: 0.8, blue: 0.4)
        case .adminBatch: return Color(red: 1.0, green: 0.85, blue: 0.3)
        case .urgent: return .red
        case .buffer: return .gray
        }
    }
    
    var emoji: String {
        switch self {
        case .deepFlow: return "🟩"
        case .creative: return "💡"
        case .adminBatch: return "📋"
        case .urgent: return "🔴"
        case .buffer: return "⬜"
        }
    }
}

// MARK: - ═══════════════════════════════════════════════════
// WEEKLY BLUEPRINT
// ═══════════════════════════════════════════════════════════

struct WeeklyBlueprint: Identifiable, Codable {
    let id: String
    let weekStartDate: Date
    var tasks: [FlowTask]
    var executionScore: Double?
    var errorCount: Int
    var coherenceRating: Int?    // 1-5
    var reflectionNotes: String?
    
    init(weekStartDate: Date) {
        self.id = UUID().uuidString
        self.weekStartDate = weekStartDate
        self.tasks = []
        self.executionScore = nil
        self.errorCount = 0
        self.coherenceRating = nil
        self.reflectionNotes = nil
    }
    
    var completionPercent: Double {
        let actionable = tasks.filter { $0.bucket != .p4 }
        guard !actionable.isEmpty else { return 0 }
        return Double(actionable.filter(\.isCompleted).count) / Double(actionable.count)
    }
}

// MARK: - ═══════════════════════════════════════════════════
// MONTHLY TARGET
// ═══════════════════════════════════════════════════════════

struct MonthlyTarget: Identifiable, Codable {
    let id: String
    var title: String
    var definitionOfDone: String
    var metric: String
    var bucket: FlowBucket
    var linkedPillarId: String?
    var colorCategory: TargetColor
    var isCompleted: Bool
    var createdDate: Date
    
    init(title: String, definitionOfDone: String, metric: String, bucket: FlowBucket, linkedPillarId: String?, colorCategory: TargetColor) {
        self.id = UUID().uuidString
        self.title = title
        self.definitionOfDone = definitionOfDone
        self.metric = metric
        self.bucket = bucket
        self.linkedPillarId = linkedPillarId
        self.colorCategory = colorCategory
        self.isCompleted = false
        self.createdDate = Date()
    }
}

enum TargetColor: String, CaseIterable, Codable {
    case gold = "Gold – Growth/High-ROI"
    case blue = "Blue – Skill Building"
    case green = "Green – Health/Energy"
    case red = "Red – Urgent Survival"
    
    var color: Color {
        switch self {
        case .gold: return Color(red: 1.0, green: 0.85, blue: 0.3)
        case .blue: return .cyan
        case .green: return .green
        case .red: return .red
        }
    }
    
    var emoji: String {
        switch self {
        case .gold: return "🥇"
        case .blue: return "📘"
        case .green: return "💚"
        case .red: return "🔴"
        }
    }
}

// MARK: - ═══════════════════════════════════════════════════
// EXECUTION SCORECARD
// ═══════════════════════════════════════════════════════════

struct ExecutionScorecard: Identifiable, Codable {
    let id: String
    let month: String  // "2026-02"
    var weeklyScores: [WeeklyScore]
    var monthlyTargetsCompleted: Int
    var monthlyTargetsTotal: Int
    var stillnessSessions: Int
    var biggestCoherenceWin: String
    
    var overallExecution: Double {
        guard !weeklyScores.isEmpty else { return 0 }
        return weeklyScores.map(\.executionPercent).reduce(0, +) / Double(weeklyScores.count)
    }
    
    var grade: SovereigntyGrade {
        switch overallExecution {
        case 0.9...1.0: return .sovereign
        case 0.7..<0.9: return .solid
        default: return .resetRequired
        }
    }
}

struct WeeklyScore: Identifiable, Codable {
    let id: String
    let weekNumber: Int
    var executionPercent: Double
    var p0p1Completion: Double
    var errorCount: Int
    var coherenceRating: Int  // 1-5
    var notes: String
    
    init(weekNumber: Int) {
        self.id = UUID().uuidString
        self.weekNumber = weekNumber
        self.executionPercent = 0
        self.p0p1Completion = 0
        self.errorCount = 0
        self.coherenceRating = 3
        self.notes = ""
    }
}

enum SovereigntyGrade: String, Codable {
    case sovereign = "Sovereign"
    case solid = "Solid"
    case resetRequired = "Reset Required"
    
    var emoji: String {
        switch self {
        case .sovereign: return "👁️‍🗨️"
        case .solid: return "⚡"
        case .resetRequired: return "🔄"
        }
    }
    
    var color: Color {
        switch self {
        case .sovereign: return Color(red: 1.0, green: 0.85, blue: 0.3)
        case .solid: return .green
        case .resetRequired: return .red
        }
    }
    
    var message: String {
        switch self {
        case .sovereign: return "Ultra Instinct. Flow is your default state."
        case .solid: return "Strong. Protect your buffers, keep stacking."
        case .resetRequired: return "Below 70%. Triggering 3-day Phase 0 Reset."
        }
    }
}

// MARK: - ═══════════════════════════════════════════════════
// PHASE 0 BOOTCAMP PROGRESS
// ═══════════════════════════════════════════════════════════

struct BootcampProgress: Codable {
    var startDate: Date?
    var currentDay: Int                     // 1-14
    var stillnessMinutesTarget: Int         // 5 or 10
    var stillnessCompletedDays: Set<Int>
    var controlPurgeDone: Bool
    var fearPurgeDone: Bool
    var digitalPurgeDone: Bool
    var socializationProtocolRead: Bool
    var newsProtocolRead: Bool
    var sayingNoFrameworkRead: Bool
    var isComplete: Bool
    
    init() {
        self.startDate = nil
        self.currentDay = 0
        self.stillnessMinutesTarget = 5
        self.stillnessCompletedDays = []
        self.controlPurgeDone = false
        self.fearPurgeDone = false
        self.digitalPurgeDone = false
        self.socializationProtocolRead = false
        self.newsProtocolRead = false
        self.sayingNoFrameworkRead = false
        self.isComplete = false
    }
    
    var progressPercent: Double {
        var done = 0
        let total = 14 + 6  // 14 stillness days + 6 exercises
        done += stillnessCompletedDays.count
        if controlPurgeDone { done += 1 }
        if fearPurgeDone { done += 1 }
        if digitalPurgeDone { done += 1 }
        if socializationProtocolRead { done += 1 }
        if newsProtocolRead { done += 1 }
        if sayingNoFrameworkRead { done += 1 }
        return Double(done) / Double(total)
    }
}

// MARK: - ═══════════════════════════════════════════════════
// 404 ERROR LOG ENTRY
// ═══════════════════════════════════════════════════════════

struct ErrorLogEntry: Identifiable, Codable {
    let id: String
    let item: String
    let category: ErrorCategory
    let date: Date
    let releasePhrase: String
    
    init(item: String, category: ErrorCategory) {
        self.id = UUID().uuidString
        self.item = item
        self.category = category
        self.date = Date()
        self.releasePhrase = "This is not mine. #404Error."
    }
}

enum ErrorCategory: String, CaseIterable, Codable {
    case people = "People/Favors"
    case digital = "Apps/Digital"
    case news = "News/Headlines"
    case internal_ = "Internal Thoughts"
    case social = "Social Media"
    case opportunity = "Opportunities"
    case random = "Random Requests"
    
    var emoji: String {
        switch self {
        case .people: return "👥"
        case .digital: return "📱"
        case .news: return "📰"
        case .internal_: return "🧠"
        case .social: return "📲"
        case .opportunity: return "💼"
        case .random: return "❓"
        }
    }
}

// MARK: - ═══════════════════════════════════════════════════
// GUIDED SESSION TYPES
// ═══════════════════════════════════════════════════════════

enum GuidedSessionType: String, CaseIterable, Identifiable, Codable {
    case monthlyReflection = "Monthly Reflection"
    case weeklySprint = "Weekly Sprint"
    case dailyAlign = "Daily Align"
    case stillnessTraining = "Stillness Training"
    
    var id: String { rawValue }
    
    var duration: String {
        switch self {
        case .monthlyReflection: return "60 min"
        case .weeklySprint: return "30 min"
        case .dailyAlign: return "10 min"
        case .stillnessTraining: return "5–20 min"
        }
    }
    
    var emoji: String {
        switch self {
        case .monthlyReflection: return "🔮"
        case .weeklySprint: return "⚡"
        case .dailyAlign: return "🌅"
        case .stillnessTraining: return "🧘"
        }
    }
    
    var color: Color {
        switch self {
        case .monthlyReflection: return Color(red: 1.0, green: 0.85, blue: 0.3)
        case .weeklySprint: return .cyan
        case .dailyAlign: return .green
        case .stillnessTraining: return .purple
        }
    }
}

enum GuidanceLevel: String, CaseIterable, Codable {
    case full = "Full Guided"
    case semi = "Semi-Guided"
    case selfDirected = "Self-Directed"
    
    var description: String {
        switch self {
        case .full: return "Step-by-step voice prompts"
        case .semi: return "Section headers + timer"
        case .selfDirected: return "Timer only"
        }
    }
}

// MARK: - ═══════════════════════════════════════════════════
// CONTROL PURGE ENTRY
// ═══════════════════════════════════════════════════════════

struct ControlPurgeItem: Identifiable, Codable {
    let id: String
    var text: String
    var column: ControlColumn
    
    init(text: String, column: ControlColumn) {
        self.id = UUID().uuidString
        self.text = text
        self.column = column
    }
}

enum ControlColumn: String, CaseIterable, Codable {
    case control = "I Control This"
    case influence = "I Influence This"
    case release = "I Release This"
    
    var color: Color {
        switch self {
        case .control: return .green
        case .influence: return Color(red: 1.0, green: 0.85, blue: 0.3)
        case .release: return .red
        }
    }
    
    var emoji: String {
        switch self {
        case .control: return "✊"
        case .influence: return "🤝"
        case .release: return "🕊️"
        }
    }
}

// MARK: - ═══════════════════════════════════════════════════
// FEAR PURGE ENTRY
// ═══════════════════════════════════════════════════════════

struct FearPurgeItem: Identifiable, Codable {
    let id: String
    var fear: String
    var isAbstract: Bool          // true = imagined, false = concrete
    var action: FearAction
    
    init(fear: String, isAbstract: Bool, action: FearAction) {
        self.id = UUID().uuidString
        self.fear = fear
        self.isAbstract = isAbstract
        self.action = action
    }
}

enum FearAction: String, CaseIterable, Codable {
    case controllableAction = "Controllable Action"
    case release = "Release"
}

// MARK: - ═══════════════════════════════════════════════════
// 404 SWIPE FILE
// ═══════════════════════════════════════════════════════════

struct SwipeScript: Identifiable {
    let id = UUID()
    let category: ErrorCategory
    let script: String
}

struct SwipeFileBank {
    static let scripts: [SwipeScript] = [
        // People / Favors
        SwipeScript(category: .people, script: "I can't commit right now — focusing on my own priorities."),
        SwipeScript(category: .people, script: "That doesn't align with my current Pillars."),
        SwipeScript(category: .people, script: "Appreciate you thinking of me, but I have to pass so I stay coherent."),
        SwipeScript(category: .people, script: "I'm protecting my energy for P0 work only right now."),
        SwipeScript(category: .people, script: "Means a lot, but the answer is #404Error for me."),
        // Digital
        SwipeScript(category: .digital, script: "Deleting this app — it's P4."),
        SwipeScript(category: .digital, script: "Notifications off permanently. API defined on day one."),
        SwipeScript(category: .digital, script: "Moving to folder 404 — one check per week max."),
        // News
        SwipeScript(category: .news, script: "#404Error — not actionable for me."),
        SwipeScript(category: .news, script: "This is emotional bait. I'm not renting space in my nervous system."),
        // Internal
        SwipeScript(category: .internal_, script: "This worry is P4. Releasing it now."),
        SwipeScript(category: .internal_, script: "Not my Pillar. Not my bandwidth."),
        SwipeScript(category: .internal_, script: "I choose coherence over this noise."),
        // Social
        SwipeScript(category: .social, script: "Unfollowing — triggers P4 energy."),
        SwipeScript(category: .social, script: "This scroll is #404Error. Closing app."),
        // Opportunities
        SwipeScript(category: .opportunity, script: "Sounds cool but it's P3/P4 for my current Compass."),
        SwipeScript(category: .opportunity, script: "I'm saying No so I can say Hell Yeah to my own goals."),
        SwipeScript(category: .opportunity, script: "Thank you — but my calendar only has space for P0/P1."),
        // Random
        SwipeScript(category: .random, script: "I'm practicing controlled socialization — can we schedule for next month?"),
        SwipeScript(category: .random, script: "That would dilute my focus. Hard pass."),
        SwipeScript(category: .random, script: "I release this. It does not propel my Next Level."),
        SwipeScript(category: .random, script: "My nervous system says #404Error."),
        SwipeScript(category: .random, script: "I'm at a 5 on the Change Scale — this doesn't make the cut."),
        SwipeScript(category: .random, script: "Coherence over FOMO."),
        SwipeScript(category: .random, script: "API defined on day one. Not mine."),
    ]
    
    static func scripts(for category: ErrorCategory) -> [SwipeScript] {
        scripts.filter { $0.category == category }
    }
}

// MARK: - ═══════════════════════════════════════════════════
// UNLOCK GATE — Badge requirement
// ═══════════════════════════════════════════════════════════

@MainActor
struct SunFlowUnlockGate {
    static let requiredBadgeCount = 3
    
    static var isUnlocked: Bool {
        SacredBadgeManager.shared.totalBadgeCount >= requiredBadgeCount
            || UserDefaults.standard.bool(forKey: "sunflow_force_unlocked")
    }
    
    static var badgesNeeded: Int {
        max(0, requiredBadgeCount - SacredBadgeManager.shared.totalBadgeCount)
    }
}
