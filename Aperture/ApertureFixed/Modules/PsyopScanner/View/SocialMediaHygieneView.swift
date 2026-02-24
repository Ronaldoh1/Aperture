// SocialMediaHygieneView.swift
// DIGITAL HYGIENE — Clean Your Feed, Clear Your Mind
// ☀️ SunFlow: Reignited
//
// "Your feed is a mirror of your programming.
//  Clean the feed, deprogram the mind."
//
// Features:
// 1. Echo Chamber Education (onboarding)
// 2. 5 Hygiene Levels with daily protocols
// 3. Reactive Content Scanner (paste/screenshot analysis)
// 4. Article Spectrum Checker
// 5. Follow Declutter Guide
// 6. Morning Check-in with local notifications
// 7. Usage tracking (self-reported) with progress

import SwiftUI
import UserNotifications

// MARK: - ═══════════════════════════════════════════════════
// DATA MODELS
// ═══════════════════════════════════════════════════════════

// MARK: - Hygiene Level

enum HygieneLevel: Int, CaseIterable, Codable, Identifiable {
    case level1 = 1 // Awareness
    case level2 = 2 // Reduction
    case level3 = 3 // Intentional
    case level4 = 4 // Minimal
    case level5 = 5 // Sovereign
    
    var id: Int { rawValue }
    
    var name: String {
        switch self {
        case .level1: return "Awareness"
        case .level2: return "Reduction"
        case .level3: return "Intentional"
        case .level4: return "Minimal"
        case .level5: return "Sovereign"
        }
    }
    
    var description: String {
        switch self {
        case .level1: return "I live on social media (4+ hours/day). First step: just notice."
        case .level2: return "Cutting back to 2-3 hours. Removing worst triggers."
        case .level3: return "Under 1 hour. Only checking with purpose."
        case .level4: return "15-30 minutes. Scheduled check-ins only."
        case .level5: return "Social media is a tool, not a habitat. Full sovereignty."
        }
    }
    
    var dailyBudgetMinutes: Int {
        switch self {
        case .level1: return 240
        case .level2: return 150
        case .level3: return 60
        case .level4: return 30
        case .level5: return 15
        }
    }
    
    var morningMessage: String {
        switch self {
        case .level1: return "Good morning. Today's goal: just NOTICE how many times you open social media. Don't judge it. Just count. Awareness is step one."
        case .level2: return "Good morning. Your budget today: 2.5 hours. Before each session, ask: am I seeking information or stimulation? Set a timer when you open an app."
        case .level3: return "Good morning. Your budget: 1 hour. Only open social media with a specific purpose. When that purpose is complete, close it. You're training sovereignty."
        case .level4: return "Good morning. Your check-in windows: morning (15 min) and evening (15 min). Outside those windows, your attention belongs to your REAL life."
        case .level5: return "Good morning. You own your attention. If social media serves a purpose today, use it briefly and intentionally. If not, don't open it. You are free."
        }
    }
    
    var protocol_steps: [String] {
        switch self {
        case .level1: return [
            "Turn on Screen Time in Settings → Screen Time → See All Activity",
            "Write down your actual daily average (be honest — no one sees this)",
            "Identify your top 3 most-used social apps",
            "Notice: what TRIGGERS you to open the app? Boredom? Anxiety? Habit?",
            "No changes yet — just awareness for 7 days"
        ]
        case .level2: return [
            "Move social media apps off your home screen (into a folder on page 2)",
            "Turn off ALL push notifications for social apps",
            "Set Screen Time limit: 2.5 hours combined",
            "Unfollow 10 accounts that make you angry, anxious, or envious",
            "Replace one scroll session with 10 minutes of something real"
        ]
        case .level3: return [
            "Check social media only 3 times per day (morning, lunch, evening)",
            "Set a timer before each session — close when it rings",
            "Unfollow all outrage accounts, news reaction accounts, and drama pages",
            "Start following accounts that teach skills, share knowledge, or inspire creation",
            "Ask before posting: 'Am I sharing, or performing?'"
        ]
        case .level4: return [
            "Two check-in windows only: 15 minutes morning, 15 minutes evening",
            "Delete social apps from your phone — use browser only (friction = freedom)",
            "Your feed should be 80% educational/inspirational, 20% social",
            "No social media in bed (morning or night)",
            "Weekly review: what did social media ADD to my life this week?"
        ]
        case .level5: return [
            "Social media is a tool with a specific purpose — use it like a hammer, not a habitat",
            "Check only when you have something to share or someone to connect with",
            "Your information comes from curated sources, not algorithmic feeds",
            "You create more than you consume",
            "Your attention is the most valuable thing you own — and you don't give it away"
        ]
        }
    }
    
    var color: Color {
        switch self {
        case .level1: return .red
        case .level2: return .orange
        case .level3: return .yellow
        case .level4: return Color(red: 0.3, green: 0.8, blue: 0.5)
        case .level5: return .cyan
        }
    }
    
    var icon: String {
        switch self {
        case .level1: return "eye.fill"
        case .level2: return "scissors"
        case .level3: return "target"
        case .level4: return "timer"
        case .level5: return "crown.fill"
        }
    }
}

// MARK: - Reactive Content Analysis

struct ReactiveContentAnalysis: Identifiable, Codable {
    let id: String
    let content: String
    let analyzedAt: Date
    let reactivityScore: Int // 0-100
    let triggers: [ReactivityTrigger]
    let recommendation: String
    let breathingAdvice: String
    
    init(id: String = UUID().uuidString, content: String, analyzedAt: Date = Date(),
         reactivityScore: Int, triggers: [ReactivityTrigger],
         recommendation: String, breathingAdvice: String) {
        self.id = id; self.content = content; self.analyzedAt = analyzedAt
        self.reactivityScore = reactivityScore; self.triggers = triggers
        self.recommendation = recommendation; self.breathingAdvice = breathingAdvice
    }
}

struct ReactivityTrigger: Identifiable, Codable {
    let id: String
    let name: String
    let description: String
    let nervousSystemEffect: String
    
    init(id: String = UUID().uuidString, name: String, description: String, nervousSystemEffect: String) {
        self.id = id; self.name = name; self.description = description
        self.nervousSystemEffect = nervousSystemEffect
    }
}

// MARK: - Daily Check-in

struct HygieneCheckIn: Identifiable, Codable {
    let id: String
    let date: Date
    let reportedMinutes: Int
    let level: Int
    let triggerCount: Int
    let mood: CheckInMood
    let note: String?
    
    init(id: String = UUID().uuidString, date: Date = Date(), reportedMinutes: Int,
         level: Int, triggerCount: Int, mood: CheckInMood, note: String? = nil) {
        self.id = id; self.date = date; self.reportedMinutes = reportedMinutes
        self.level = level; self.triggerCount = triggerCount; self.mood = mood; self.note = note
    }
}

enum CheckInMood: String, CaseIterable, Codable {
    case great = "Great"
    case good = "Good"
    case neutral = "Neutral"
    case stressed = "Stressed"
    case triggered = "Triggered"
    
    var emoji: String {
        switch self {
        case .great: return "😌"
        case .good: return "🙂"
        case .neutral: return "😐"
        case .stressed: return "😤"
        case .triggered: return "🤯"
        }
    }
}

// MARK: - Echo Chamber Content

struct EchoChamberLesson {
    let title: String
    let content: String
    let icon: String
}

// MARK: - ═══════════════════════════════════════════════════
// REACTIVE CONTENT ENGINE
// ═══════════════════════════════════════════════════════════

final class ReactiveContentEngine {
    
    static let shared = ReactiveContentEngine()
    private init() {}
    
    // Words designed to trigger fight-or-flight
    private let rageBaitWords: [String: Int] = [
        "destroyed": 4, "slammed": 4, "eviscerated": 5, "obliterated": 5,
        "outrage": 4, "disgusting": 4, "unacceptable": 3, "pathetic": 4,
        "shameful": 3, "coward": 4, "traitor": 5, "enemy": 4,
        "wake up": 3, "sheep": 4, "sheeple": 5, "brainwashed": 4,
        "cancelled": 3, "exposed": 3, "caught": 3, "busted": 3,
        "insane": 3, "deranged": 4, "unhinged": 4, "psycho": 4,
    ]
    
    private let tribalSignaling = [
        "real americans", "true patriots", "our side", "their side",
        "the left", "the right", "libs", "maga", "woke mob",
        "snowflake", "nazi", "fascist", "communist", "radical",
        "them", "those people", "they want to", "they're coming for",
        "defend our", "fight for", "take back", "stand against",
    ]
    
    private let fearProgramming = [
        "they don't want you to know", "what they're hiding",
        "before it's too late", "final warning", "this changes everything",
        "you won't believe", "share before deleted", "censored",
        "banned", "what they don't tell you", "the truth about",
        "mainstream media won't cover", "wake up people",
    ]
    
    private let strawmanPatterns = [
        "so you're saying", "basically admitting", "just admitted",
        "told on themselves", "mask off", "quiet part out loud",
        "says it all", "imagine thinking", "imagine believing",
        "this is what happens when", "this is why",
    ]
    
    private let missingContextIndicators = [
        "no context", "out of context", "clipped", "cropped",
        "screenshot", "ratio", "dunked on", "ratioed",
    ]
    
    func analyze(content: String) -> ReactiveContentAnalysis {
        let lowered = content.lowercased()
        var triggers: [ReactivityTrigger] = []
        var totalScore = 0
        
        // Check rage bait
        var rageScore = 0
        for (word, severity) in rageBaitWords {
            if lowered.contains(word) { rageScore += severity }
        }
        if rageScore > 0 {
            triggers.append(ReactivityTrigger(
                name: "Rage Bait",
                description: "This content uses emotionally loaded language designed to make you angry before you think. Loaded words: the linguistic equivalent of a sucker punch.",
                nervousSystemEffect: "Cortisol spike → fight-or-flight activation → prefrontal cortex (rational brain) goes offline → you react instead of respond"
            ))
            totalScore += rageScore * 4
        }
        
        // Check tribal signaling
        var tribalScore = 0
        for pattern in tribalSignaling {
            if lowered.contains(pattern) { tribalScore += 3 }
        }
        if tribalScore > 0 {
            triggers.append(ReactivityTrigger(
                name: "Tribal Activation",
                description: "This content activates your 'us vs them' wiring. It wants you to identify with a group and see another group as the enemy. This is how the outrage economy works.",
                nervousSystemEffect: "Amygdala activation → tribal identity override → nuanced thinking becomes impossible → you share to signal which 'team' you're on"
            ))
            totalScore += tribalScore * 3
        }
        
        // Check fear programming
        var fearScore = 0
        for pattern in fearProgramming {
            if lowered.contains(pattern) { fearScore += 4 }
        }
        if fearScore > 0 {
            triggers.append(ReactivityTrigger(
                name: "Fear Programming",
                description: "Scarcity language, secrecy framing, urgency cues. This content says 'ACT NOW before it's too late.' Real information doesn't expire in 24 hours.",
                nervousSystemEffect: "Anxiety spike → hypervigilance → compulsive checking/sharing → dopamine hit from 'protecting' your group"
            ))
            totalScore += fearScore * 3
        }
        
        // Check strawman
        var strawScore = 0
        for pattern in strawmanPatterns {
            if lowered.contains(pattern) { strawScore += 3 }
        }
        if strawScore > 0 {
            triggers.append(ReactivityTrigger(
                name: "Strawman Framing",
                description: "This takes something someone said and reframes it in the worst possible way. 'So you're saying...' almost never reflects what was actually said. It's interpretation disguised as quotation.",
                nervousSystemEffect: "Moral outrage → feeling of righteousness → dopamine reward for 'catching' someone → sharing to perform moral superiority"
            ))
            totalScore += strawScore * 3
        }
        
        // Check missing context
        var contextScore = 0
        for pattern in missingContextIndicators {
            if lowered.contains(pattern) { contextScore += 2 }
        }
        
        // ALL CAPS check
        let words = content.split(separator: " ")
        let capsWords = words.filter { $0.count > 2 && $0 == $0.uppercased() }
        if capsWords.count >= 3 {
            triggers.append(ReactivityTrigger(
                name: "Visual Screaming",
                description: "ALL CAPS is the text equivalent of someone grabbing your shoulders and shaking you. It bypasses reading comprehension and hits your nervous system directly.",
                nervousSystemEffect: "Heightened alertness → perceived urgency → reduced critical evaluation → impulse to act/share immediately"
            ))
            totalScore += capsWords.count * 3
        }
        
        // Excessive exclamation/question marks
        let exclamations = content.filter { $0 == "!" }.count
        let questions = content.filter { $0 == "?" }.count
        if exclamations >= 3 || questions >= 3 {
            triggers.append(ReactivityTrigger(
                name: "Punctuation Manipulation",
                description: "Excessive punctuation (!!! or ???) is designed to make you feel the 'energy' of outrage or disbelief. It's emotional contagion through typography.",
                nervousSystemEffect: "Mirror neurons activate → you 'feel' the poster's emotion → emotional contagion spreads without any actual new information"
            ))
            totalScore += (exclamations + questions) * 2
        }
        
        let normalizedScore = min(totalScore * 3, 100)
        
        // Generate recommendation
        let recommendation: String
        if normalizedScore >= 70 {
            recommendation = "This content is HIGHLY reactive. It's designed to make you feel, not think. Do NOT engage, share, or reply right now. Come back in 30 minutes if you still care."
        } else if normalizedScore >= 40 {
            recommendation = "This content has reactive elements. Before engaging, ask: what is the FACTUAL claim here? Can I verify it? Is my reaction being manufactured?"
        } else if normalizedScore >= 20 {
            recommendation = "Mild reactive elements detected. This may be worth engaging with — just pause and breathe first. Respond, don't react."
        } else {
            recommendation = "Low reactivity detected. This content appears relatively neutral. Still worth verifying any claims before sharing."
        }
        
        // Breathing advice
        let breathingAdvice: String
        if normalizedScore >= 50 {
            breathingAdvice = "Before doing ANYTHING with this content: 4 breaths. In for 4 counts, hold for 4, out for 4. This re-engages your prefrontal cortex. React after breathing, not before."
        } else {
            breathingAdvice = "Quick check: notice your body. Jaw clenched? Shoulders tight? That's your nervous system responding to content designed to trigger it. Relax, then decide."
        }
        
        return ReactiveContentAnalysis(
            content: content, reactivityScore: normalizedScore,
            triggers: triggers, recommendation: recommendation,
            breathingAdvice: breathingAdvice
        )
    }
}

// MARK: - ═══════════════════════════════════════════════════
// HYGIENE MANAGER
// ═══════════════════════════════════════════════════════════

@MainActor
class SocialHygieneManager: ObservableObject {
    
    static let shared = SocialHygieneManager()
    
    @Published var currentLevel: HygieneLevel = .level1
    @Published var hasCompletedOnboarding: Bool = false
    @Published var checkIns: [HygieneCheckIn] = []
    @Published var scanHistory: [ReactiveContentAnalysis] = []
    @Published var morningReminderEnabled: Bool = false
    @Published var morningReminderHour: Int = 7
    @Published var morningReminderMinute: Int = 0
    @Published var dailyGoalMinutes: Int = 240
    @Published var streakDays: Int = 0
    @Published var unfollowedCount: Int = 0
    
    private let dataKey = "social.hygiene.data"
    private let checkInsKey = "social.hygiene.checkins"
    private let scansKey = "social.hygiene.scans"
    
    init() { load() }
    
    func setLevel(_ level: HygieneLevel) {
        currentLevel = level
        dailyGoalMinutes = level.dailyBudgetMinutes
        save()
    }
    
    func completeOnboarding() {
        hasCompletedOnboarding = true
        save()
    }
    
    func addCheckIn(_ checkIn: HygieneCheckIn) {
        checkIns.insert(checkIn, at: 0)
        if checkIns.count > 365 { checkIns = Array(checkIns.prefix(365)) }
        updateStreak()
        save()
    }
    
    func addScan(_ analysis: ReactiveContentAnalysis) {
        scanHistory.insert(analysis, at: 0)
        if scanHistory.count > 50 { scanHistory = Array(scanHistory.prefix(50)) }
        saveScans()
    }
    
    func incrementUnfollowed(_ count: Int = 1) {
        unfollowedCount += count
        save()
    }
    
    var averageMinutesLast7: Int {
        let recent = checkIns.prefix(7)
        guard !recent.isEmpty else { return 0 }
        return recent.map(\.reportedMinutes).reduce(0, +) / recent.count
    }
    
    var averageMoodLast7: String {
        let recent = checkIns.prefix(7)
        guard !recent.isEmpty else { return "—" }
        let moodScores = recent.map { mood in
            switch mood.mood {
            case .great: return 5
            case .good: return 4
            case .neutral: return 3
            case .stressed: return 2
            case .triggered: return 1
            }
        }
        let avg = Double(moodScores.reduce(0, +)) / Double(moodScores.count)
        if avg >= 4.5 { return "😌" }
        if avg >= 3.5 { return "🙂" }
        if avg >= 2.5 { return "😐" }
        if avg >= 1.5 { return "😤" }
        return "🤯"
    }
    
    var isUnderBudget: Bool {
        guard let today = checkIns.first, Calendar.current.isDateInToday(today.date) else { return true }
        return today.reportedMinutes <= dailyGoalMinutes
    }
    
    private func updateStreak() {
        var streak = 0
        let calendar = Calendar.current
        var checkDate = Date()
        for checkIn in checkIns {
            if calendar.isDate(checkIn.date, inSameDayAs: checkDate) {
                if checkIn.reportedMinutes <= dailyGoalMinutes {
                    streak += 1
                    checkDate = calendar.date(byAdding: .day, value: -1, to: checkDate) ?? checkDate
                } else { break }
            }
        }
        streakDays = streak
    }
    
    // MARK: - Notifications
    
    func scheduleMorningReminder() {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound]) { granted, _ in
            guard granted else { return }
            let content = UNMutableNotificationContent()
            content.title = "☀️ Digital Hygiene Check"
            content.body = self.currentLevel.morningMessage
            content.sound = .default
            
            var dateComponents = DateComponents()
            dateComponents.hour = self.morningReminderHour
            dateComponents.minute = self.morningReminderMinute
            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
            
            let request = UNNotificationRequest(identifier: "aperture.hygiene.morning", content: content, trigger: trigger)
            center.add(request)
        }
        morningReminderEnabled = true
        save()
    }
    
    func cancelMorningReminder() {
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["aperture.hygiene.morning"])
        morningReminderEnabled = false
        save()
    }
    
    // MARK: - Persistence
    
    private func save() {
        let data: [String: Any] = [
            "level": currentLevel.rawValue,
            "onboarded": hasCompletedOnboarding,
            "reminderEnabled": morningReminderEnabled,
            "reminderHour": morningReminderHour,
            "reminderMinute": morningReminderMinute,
            "goal": dailyGoalMinutes,
            "streak": streakDays,
            "unfollowed": unfollowedCount,
        ]
        UserDefaults.standard.set(data, forKey: dataKey)
        if let encoded = try? JSONEncoder().encode(checkIns) {
            UserDefaults.standard.set(encoded, forKey: checkInsKey)
        }
    }
    
    private func saveScans() {
        if let encoded = try? JSONEncoder().encode(scanHistory) {
            UserDefaults.standard.set(encoded, forKey: scansKey)
        }
    }
    
    private func load() {
        if let data = UserDefaults.standard.dictionary(forKey: dataKey) {
            if let lvl = data["level"] as? Int, let level = HygieneLevel(rawValue: lvl) { currentLevel = level }
            hasCompletedOnboarding = data["onboarded"] as? Bool ?? false
            morningReminderEnabled = data["reminderEnabled"] as? Bool ?? false
            morningReminderHour = data["reminderHour"] as? Int ?? 7
            morningReminderMinute = data["reminderMinute"] as? Int ?? 0
            dailyGoalMinutes = data["goal"] as? Int ?? 240
            streakDays = data["streak"] as? Int ?? 0
            unfollowedCount = data["unfollowed"] as? Int ?? 0
        }
        if let encoded = UserDefaults.standard.data(forKey: checkInsKey),
           let decoded = try? JSONDecoder().decode([HygieneCheckIn].self, from: encoded) {
            checkIns = decoded
        }
        if let encoded = UserDefaults.standard.data(forKey: scansKey),
           let decoded = try? JSONDecoder().decode([ReactiveContentAnalysis].self, from: encoded) {
            scanHistory = decoded
        }
    }
}

// MARK: - ═══════════════════════════════════════════════════
// ECHO CHAMBER EDUCATION DATABASE
// ═══════════════════════════════════════════════════════════

struct EchoChamberDatabase {
    
    static let lessons: [EchoChamberLesson] = [
        EchoChamberLesson(
            title: "What Is an Echo Chamber?",
            content: """
An echo chamber is an environment where you only encounter information and opinions that reinforce what you already believe. Your social media feed is the most powerful echo chamber ever built.

Here's how it works: Every time you like, share, comment, or even PAUSE on a post, the algorithm learns what triggers your engagement. It then shows you MORE of exactly that. Not because it agrees with you — because it wants your attention.

The result: you think "everyone" agrees with you. You think the "other side" is insane. You lose the ability to understand people who see the world differently. And you never even realize it happened, because the walls of the chamber are invisible.

An echo chamber isn't a room you walk into. It's a room that builds itself around you, one click at a time.
""",
            icon: "waveform.path.ecg"
        ),
        EchoChamberLesson(
            title: "How Algorithms Build Your Bubble",
            content: """
Social media algorithms optimize for ONE thing: engagement. Not truth. Not balance. Not your wellbeing. Engagement.

And what gets the most engagement? Outrage. Fear. Tribal identity. Content that makes you feel strongly — especially ANGRY — keeps you scrolling 6x longer than neutral content.

So the algorithm feeds you a diet of rage. Not because it hates you, but because anger is profitable. Your cortisol spike is someone's revenue.

The algorithm doesn't show you the world. It shows you a funhouse mirror version of reality calibrated to your specific emotional triggers. Two people in the same city, same age, same job can live in completely different information universes — and each thinks theirs is "real."
""",
            icon: "cpu"
        ),
        EchoChamberLesson(
            title: "Signs You're in an Echo Chamber",
            content: """
Ask yourself these questions honestly:

Can you explain the OTHER side's strongest argument — not a strawman, but what they'd actually say? If you can't, you're in a chamber.

Do you follow anyone who regularly challenges your views? Not trolls — thoughtful people who disagree. If not, you're in a chamber.

When you see a news story, do you immediately know how you feel about it before reading it? If yes, that's programming, not thinking.

Do you use words like "they" to describe large groups of people who think differently? ("They want to..." "They're trying to...") That's tribal framing, and it's the chamber talking.

Have you unfollowed, muted, or blocked people primarily because they expressed different views (not because they were abusive)? Every removal makes the chamber tighter.

None of this is a moral failing. The machine is DESIGNED to do this. Recognizing it is the first step out.
""",
            icon: "magnifyingglass"
        ),
        EchoChamberLesson(
            title: "The Real Cost of the Chamber",
            content: """
Echo chambers don't just distort your view of the world. They rewire your nervous system.

Constant outrage content keeps your cortisol (stress hormone) elevated. Chronic cortisol elevation leads to: anxiety, depression, insomnia, weakened immune system, difficulty concentrating, and shortened lifespan.

Your brain's amygdala (fear center) gets stronger. Your prefrontal cortex (rational thinking) gets weaker. You literally become LESS able to think clearly the more outrage content you consume.

The chamber also destroys relationships. You start seeing friends, family, even strangers through an ideological lens. Uncle at Thanksgiving becomes "the enemy." Coworker becomes "one of them." Humanity shrinks to a political label.

This isn't about left or right. Echo chambers exist on ALL sides. The machine doesn't care about your politics — it cares about your attention. And it's eating your peace to get it.
""",
            icon: "brain.head.profile"
        ),
        EchoChamberLesson(
            title: "Breaking Free — The Declutter Strategy",
            content: """
You don't escape an echo chamber by arguing harder. You escape by changing what feeds it.

STEP 1: AUDIT YOUR FOLLOWS
Go through every account you follow. For each one, ask: "Does this account make me think, or make me react?" Unfollow every account that primarily triggers emotional reactions. Yes, even the ones on "your side."

STEP 2: ADD OPPOSING PERSPECTIVES
Follow 3-5 thoughtful voices from perspectives you disagree with. Not rage accounts — people who make genuine arguments. This will feel uncomfortable. That discomfort is your echo chamber cracking.

STEP 3: FOLLOW CREATORS, NOT REACTORS
Prioritize accounts that CREATE (teach, build, share skills, tell stories) over accounts that REACT (comment on news, dunk on people, outrage-farm). Creators add to your life. Reactors subtract from it.

STEP 4: REMOVE NEWS REACTION ACCOUNTS
Get your news from primary sources, not from people REACTING to news. Reading the actual article takes 5 minutes. Reading 50 reactions to the headline takes an hour and teaches you nothing.

STEP 5: SCHEDULE, DON'T SCROLL
Open social media with a PURPOSE. "I'm checking messages." "I'm posting this." When the purpose is done, close it. Aimless scrolling is the chamber's main feeding mechanism.
""",
            icon: "scissors"
        ),
    ]
    
    // MARK: - Declutter Checklist
    
    static let declutterChecklist: [(category: String, items: [String], icon: String)] = [
        ("Political Rage Accounts", [
            "Accounts that ONLY post outrage about the other party",
            "Pages that use 'BREAKING' or '🚨' on every post",
            "Commentators who mock rather than explain",
            "Any account that calls the other side 'evil,' 'subhuman,' or 'the enemy'",
            "Accounts that post out-of-context clips to trigger reactions",
        ], "flame.fill"),
        ("News Reaction Accounts", [
            "Twitter/X 'dunking' accounts that ratio news stories",
            "YouTube channels that react to news instead of reporting it",
            "Podcasts that are 90% opinion, 10% information",
            "Any account whose primary content is screenshots of other people's posts",
        ], "newspaper.fill"),
        ("Envy & Comparison Triggers", [
            "Lifestyle accounts that make you feel inadequate",
            "Flexing/wealth display accounts",
            "Fitness accounts that trigger body shame (not inspiration)",
            "Any account that consistently makes you feel worse after viewing",
        ], "eye.slash.fill"),
        ("Conspiracy Without Sources", [
            "Accounts that say 'they don't want you to know' but never cite sources",
            "Pages that share claims without verifiable evidence",
            "Accounts that profit from fear without providing solutions",
            "Any account that attacks you for asking 'where's the source?'",
        ], "exclamationmark.triangle.fill"),
        ("Replace With", [
            "Educators who teach skills (coding, finance, health, history)",
            "Primary sources (government docs, research papers, official reports)",
            "Local community accounts (your city council, local organizations)",
            "Creators who build things (artists, makers, writers, developers)",
            "3-5 thoughtful voices you DISAGREE with (this is the hardest and most important)",
        ], "sparkles"),
    ]
}

// MARK: - ═══════════════════════════════════════════════════
// MAIN HUB VIEW
// ═══════════════════════════════════════════════════════════

struct SocialMediaHygieneView: View {
    
    @Environment(\.dismiss) var dismiss
    @StateObject private var manager = SocialHygieneManager.shared
    @State private var showOnboarding = false
    @State private var showScanner = false
    @State private var showCheckIn = false
    @State private var showDeclutter = false
    @State private var showProgress = false
    @State private var showLevelPicker = false
    @State private var showReminderSettings = false
    @State private var pulsePhase: CGFloat = 0
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 0.03, green: 0.03, blue: 0.08).ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 20) {
                        heroSection
                        levelCard
                        dailyStatusCard
                        modulesGrid
                        morningReminderCard
                        Spacer(minLength: 100)
                    }
                    .padding(.horizontal, 20)
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
                        Image(systemName: "shield.checkered").foregroundColor(.cyan)
                        Text("Digital Hygiene").font(.system(size: 17, weight: .bold)).foregroundColor(.white)
                    }
                }
            }
            .onAppear {
                if !manager.hasCompletedOnboarding { showOnboarding = true }
                withAnimation(.easeInOut(duration: 3).repeatForever(autoreverses: true)) { pulsePhase = .pi * 2 }
            }
            .fullScreenCover(isPresented: $showOnboarding) { EchoChamberOnboardingView(manager: manager) }
            .sheet(isPresented: $showScanner) { ReactiveContentScannerView(manager: manager) }
            .sheet(isPresented: $showCheckIn) { SocialHygieneCheckInView(manager: manager) }
            .sheet(isPresented: $showDeclutter) { FeedDeclutterView() }
            .sheet(isPresented: $showProgress) { HygieneProgressView(manager: manager) }
            .sheet(isPresented: $showLevelPicker) { LevelPickerView(manager: manager) }
        }
    }
    
    private var heroSection: some View {
        VStack(spacing: 10) {
            ZStack {
                Circle().fill(Color.cyan.opacity(0.06)).frame(width: 70, height: 70)
                    .scaleEffect(1 + sin(pulsePhase) * 0.08)
                Image(systemName: "shield.checkered").font(.system(size: 28)).foregroundColor(.cyan)
            }
            Text("DIGITAL HYGIENE").font(.system(size: 10, weight: .bold)).tracking(4).foregroundColor(.cyan.opacity(0.4))
            Text("Clean Your Feed,\nClear Your Mind")
                .font(.system(size: 22, weight: .bold, design: .rounded)).foregroundColor(.white)
                .multilineTextAlignment(.center)
        }
        .padding(.top, 8)
    }
    
    private var levelCard: some View {
        Button { showLevelPicker = true } label: {
            HStack(spacing: 14) {
                ZStack {
                    Circle().fill(manager.currentLevel.color.opacity(0.15)).frame(width: 48, height: 48)
                    Image(systemName: manager.currentLevel.icon).font(.system(size: 20)).foregroundColor(manager.currentLevel.color)
                }
                VStack(alignment: .leading, spacing: 3) {
                    HStack(spacing: 6) {
                        Text("Level \(manager.currentLevel.rawValue)").font(.system(size: 10, weight: .bold)).tracking(1).foregroundColor(manager.currentLevel.color)
                        Text(manager.currentLevel.name).font(.system(size: 14, weight: .bold)).foregroundColor(.white)
                    }
                    Text("Budget: \(manager.dailyGoalMinutes) min/day").font(.system(size: 11)).foregroundColor(.white.opacity(0.4))
                }
                Spacer()
                Image(systemName: "chevron.right").foregroundColor(.white.opacity(0.2))
            }
            .padding(14)
            .background(RoundedRectangle(cornerRadius: 14).fill(manager.currentLevel.color.opacity(0.06))
                .overlay(RoundedRectangle(cornerRadius: 14).stroke(manager.currentLevel.color.opacity(0.15), lineWidth: 1)))
        }
    }
    
    private var dailyStatusCard: some View {
        HStack(spacing: 0) {
            statCell("\(manager.streakDays)", "Streak", .green)
            statCell("\(manager.averageMinutesLast7)m", "Avg/Day", manager.averageMinutesLast7 <= manager.dailyGoalMinutes ? .green : .red)
            statCell(manager.averageMoodLast7, "Mood", .purple)
            statCell("\(manager.unfollowedCount)", "Unfollowed", .orange)
        }
        .padding(12)
        .background(RoundedRectangle(cornerRadius: 14).fill(Color.white.opacity(0.03))
            .overlay(RoundedRectangle(cornerRadius: 14).stroke(Color.white.opacity(0.06), lineWidth: 1)))
    }
    
    private func statCell(_ value: String, _ label: String, _ color: Color) -> some View {
        VStack(spacing: 2) {
            Text(value).font(.system(size: 16, weight: .bold)).foregroundColor(color)
            Text(label).font(.system(size: 8, weight: .medium)).foregroundColor(.white.opacity(0.3))
        }.frame(maxWidth: .infinity)
    }
    
    private var modulesGrid: some View {
        VStack(spacing: 8) {
            HStack {
                Text("TOOLS").font(.system(size: 10, weight: .bold)).tracking(2).foregroundColor(.white.opacity(0.3))
                Spacer()
            }
            
            // Row 1
            HStack(spacing: 10) {
                moduleButton("Scan Content", "antenna.radiowaves.left.and.right", .red) { showScanner = true }
                moduleButton("Daily Check-in", "checkmark.circle.fill", .green) { showCheckIn = true }
            }
            
            // Row 2
            HStack(spacing: 10) {
                moduleButton("Declutter Feed", "scissors", .orange) { showDeclutter = true }
                moduleButton("My Progress", "chart.line.uptrend.xyaxis", .cyan) { showProgress = true }
            }
            
            // Row 3
            HStack(spacing: 10) {
                moduleButton("Echo Chamber 101", "book.closed.fill", .purple) { showOnboarding = true }
                moduleButton("Change Level", "slider.horizontal.3", manager.currentLevel.color) { showLevelPicker = true }
            }
        }
    }
    
    private func moduleButton(_ title: String, _ icon: String, _ color: Color, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            HStack(spacing: 8) {
                Image(systemName: icon).font(.system(size: 16)).foregroundColor(color).frame(width: 24)
                Text(title).font(.system(size: 12, weight: .bold)).foregroundColor(.white)
                Spacer()
            }
            .padding(12)
            .frame(maxWidth: .infinity)
            .background(RoundedRectangle(cornerRadius: 12).fill(color.opacity(0.06))
                .overlay(RoundedRectangle(cornerRadius: 12).stroke(color.opacity(0.1), lineWidth: 1)))
        }
    }
    
    private var morningReminderCard: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 8) {
                Image(systemName: "sunrise.fill").foregroundColor(.orange)
                Text("MORNING REMINDER").font(.system(size: 10, weight: .bold)).tracking(2).foregroundColor(.orange.opacity(0.6))
                Spacer()
                Toggle("", isOn: Binding(
                    get: { manager.morningReminderEnabled },
                    set: { on in
                        if on { manager.scheduleMorningReminder() }
                        else { manager.cancelMorningReminder() }
                    }
                ))
                .toggleStyle(SwitchToggleStyle(tint: .orange))
                .labelsHidden()
            }
            
            if manager.morningReminderEnabled {
                Text("Every morning at \(String(format: "%d:%02d", manager.morningReminderHour, manager.morningReminderMinute)) AM:")
                    .font(.system(size: 11, weight: .medium)).foregroundColor(.white.opacity(0.4))
                Text(manager.currentLevel.morningMessage)
                    .font(.system(size: 12, weight: .medium, design: .rounded))
                    .foregroundColor(.white.opacity(0.6)).lineSpacing(3)
            } else {
                Text("Get a daily reminder of your hygiene goals and protocol before you check your phone.")
                    .font(.system(size: 11)).foregroundColor(.white.opacity(0.3)).lineSpacing(2)
            }
        }
        .padding(14)
        .background(RoundedRectangle(cornerRadius: 14).fill(Color.orange.opacity(0.04))
            .overlay(RoundedRectangle(cornerRadius: 14).stroke(Color.orange.opacity(0.1), lineWidth: 1)))
    }
}

// MARK: - ═══════════════════════════════════════════════════
// ECHO CHAMBER ONBOARDING
// ═══════════════════════════════════════════════════════════

struct EchoChamberOnboardingView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var manager: SocialHygieneManager
    @State private var currentPage = 0
    
    private let lessons = EchoChamberDatabase.lessons
    
    var body: some View {
        ZStack {
            Color(red: 0.02, green: 0.02, blue: 0.06).ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Progress dots
                HStack(spacing: 6) {
                    ForEach(0..<lessons.count, id: \.self) { i in
                        Circle().fill(i <= currentPage ? Color.cyan : Color.white.opacity(0.15))
                            .frame(width: 8, height: 8)
                    }
                }
                .padding(.top, 20)
                
                TabView(selection: $currentPage) {
                    ForEach(Array(lessons.enumerated()), id: \.offset) { index, lesson in
                        ScrollView(showsIndicators: false) {
                            VStack(spacing: 20) {
                                Image(systemName: lesson.icon).font(.system(size: 36)).foregroundColor(.cyan).padding(.top, 30)
                                Text(lesson.title).font(.system(size: 20, weight: .bold)).foregroundColor(.white)
                                Text(lesson.content)
                                    .font(.system(size: 14, weight: .regular)).foregroundColor(.white.opacity(0.7))
                                    .lineSpacing(5).padding(.horizontal, 20)
                                Spacer(minLength: 100)
                            }
                            .padding(.horizontal, 10)
                        }
                        .tag(index)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                
                // Navigation
                HStack(spacing: 16) {
                    if currentPage > 0 {
                        Button { withAnimation { currentPage -= 1 } } label: {
                            Text("Back").font(.system(size: 14, weight: .medium)).foregroundColor(.white.opacity(0.4))
                        }
                    }
                    Spacer()
                    if currentPage < lessons.count - 1 {
                        Button { withAnimation { currentPage += 1 } } label: {
                            HStack(spacing: 4) {
                                Text("Next").font(.system(size: 14, weight: .bold))
                                Image(systemName: "arrow.right")
                            }.foregroundColor(.cyan)
                        }
                    } else {
                        Button {
                            manager.completeOnboarding()
                            dismiss()
                        } label: {
                            Text("I'm Ready to Clean Up").font(.system(size: 14, weight: .bold))
                                .foregroundColor(.black).padding(.horizontal, 20).padding(.vertical, 10)
                                .background(Capsule().fill(Color.cyan))
                        }
                    }
                }
                .padding(.horizontal, 30).padding(.bottom, 30)
            }
        }
    }
}

// MARK: - ═══════════════════════════════════════════════════
// REACTIVE CONTENT SCANNER
// ═══════════════════════════════════════════════════════════

struct ReactiveContentScannerView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var manager: SocialHygieneManager
    @State private var inputText = ""
    @State private var analysis: ReactiveContentAnalysis? = nil
    
    private let engine = ReactiveContentEngine.shared
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 0.03, green: 0.03, blue: 0.08).ignoresSafeArea()
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 16) {
                        Text("Paste any social media post, tweet, headline, or comment.\nWe'll tell you what it's doing to your nervous system.")
                            .font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.4))
                            .multilineTextAlignment(.center).lineSpacing(3)
                        
                        TextEditor(text: $inputText)
                            .frame(minHeight: 100).scrollContentBackground(.hidden)
                            .font(.system(size: 14)).foregroundColor(.white)
                            .padding(12).background(RoundedRectangle(cornerRadius: 12).fill(Color.white.opacity(0.06)))
                        
                        Button {
                            let trimmed = inputText.trimmingCharacters(in: .whitespacesAndNewlines)
                            guard !trimmed.isEmpty else { return }
                            let result = engine.analyze(content: trimmed)
                            analysis = result
                            manager.addScan(result)
                        } label: {
                            HStack(spacing: 8) {
                                Image(systemName: "shield.checkered")
                                Text("SCAN FOR REACTIVITY").font(.system(size: 14, weight: .bold))
                            }
                            .foregroundColor(.black).frame(maxWidth: .infinity).padding(.vertical, 12)
                            .background(Capsule().fill(Color.cyan))
                        }
                        
                        if let a = analysis { analysisResult(a) }
                        
                        Spacer(minLength: 40)
                    }
                    .padding(20)
                }
            }
            .navigationTitle("Reactivity Scanner")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button { dismiss() } label: {
                        Image(systemName: "xmark.circle.fill").foregroundColor(.white.opacity(0.3))
                    }
                }
            }
        }
    }
    
    private func analysisResult(_ a: ReactiveContentAnalysis) -> some View {
        VStack(alignment: .leading, spacing: 14) {
            // Score
            HStack(spacing: 12) {
                ZStack {
                    Circle().stroke(scoreColor(a.reactivityScore).opacity(0.2), lineWidth: 4)
                        .frame(width: 56, height: 56)
                    Circle().trim(from: 0, to: CGFloat(a.reactivityScore) / 100)
                        .stroke(scoreColor(a.reactivityScore), style: StrokeStyle(lineWidth: 4, lineCap: .round))
                        .frame(width: 56, height: 56).rotationEffect(.degrees(-90))
                    Text("\(a.reactivityScore)").font(.system(size: 18, weight: .bold))
                        .foregroundColor(scoreColor(a.reactivityScore))
                }
                VStack(alignment: .leading, spacing: 2) {
                    Text("Reactivity Score").font(.system(size: 14, weight: .bold)).foregroundColor(.white)
                    Text(scoreLabel(a.reactivityScore)).font(.system(size: 11)).foregroundColor(scoreColor(a.reactivityScore))
                }
                Spacer()
            }
            
            // Breathing advice
            VStack(alignment: .leading, spacing: 4) {
                HStack(spacing: 6) {
                    Image(systemName: "wind").foregroundColor(.cyan)
                    Text("BEFORE YOU REACT").font(.system(size: 9, weight: .bold)).tracking(1).foregroundColor(.cyan.opacity(0.6))
                }
                Text(a.breathingAdvice).font(.system(size: 12, weight: .medium)).foregroundColor(.cyan.opacity(0.8)).lineSpacing(3)
            }
            .padding(10).background(RoundedRectangle(cornerRadius: 8).fill(Color.cyan.opacity(0.04)))
            
            // Triggers
            if !a.triggers.isEmpty {
                VStack(alignment: .leading, spacing: 8) {
                    Text("MANIPULATION TRIGGERS DETECTED").font(.system(size: 9, weight: .bold)).tracking(1).foregroundColor(.red.opacity(0.6))
                    ForEach(a.triggers) { trigger in
                        VStack(alignment: .leading, spacing: 6) {
                            Text(trigger.name).font(.system(size: 13, weight: .bold)).foregroundColor(.white)
                            Text(trigger.description).font(.system(size: 11)).foregroundColor(.white.opacity(0.6)).lineSpacing(2)
                            HStack(spacing: 4) {
                                Image(systemName: "brain.head.profile").font(.system(size: 10)).foregroundColor(.orange)
                                Text(trigger.nervousSystemEffect).font(.system(size: 10, weight: .medium))
                                    .foregroundColor(.orange.opacity(0.7)).lineSpacing(2)
                            }
                        }
                        .padding(10).background(RoundedRectangle(cornerRadius: 8).fill(Color.red.opacity(0.03)))
                    }
                }
            }
            
            // Recommendation
            VStack(alignment: .leading, spacing: 4) {
                Text("RECOMMENDATION").font(.system(size: 9, weight: .bold)).tracking(1).foregroundColor(.green.opacity(0.6))
                Text(a.recommendation).font(.system(size: 12, weight: .medium)).foregroundColor(.green.opacity(0.8)).lineSpacing(3)
            }
            .padding(10).background(RoundedRectangle(cornerRadius: 8).fill(Color.green.opacity(0.04)))
        }
        .padding(16)
        .background(RoundedRectangle(cornerRadius: 16).fill(Color.white.opacity(0.03))
            .overlay(RoundedRectangle(cornerRadius: 16).stroke(scoreColor(a.reactivityScore).opacity(0.15), lineWidth: 1)))
    }
    
    private func scoreColor(_ score: Int) -> Color {
        if score >= 70 { return .red }
        if score >= 40 { return .orange }
        if score >= 20 { return .yellow }
        return .green
    }
    
    private func scoreLabel(_ score: Int) -> String {
        if score >= 70 { return "🚨 HIGH — Do NOT engage right now" }
        if score >= 40 { return "⚠️ MODERATE — Pause before reacting" }
        if score >= 20 { return "🟡 MILD — Proceed with awareness" }
        return "✅ LOW — Relatively safe to engage"
    }
}

// MARK: - ═══════════════════════════════════════════════════
// DAILY CHECK-IN
// ═══════════════════════════════════════════════════════════

struct SocialHygieneCheckInView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var manager: SocialHygieneManager
    @State private var reportedMinutes: Double = 60
    @State private var triggerCount: Double = 0
    @State private var selectedMood: CheckInMood = .neutral
    @State private var note = ""
    @State private var saved = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 0.03, green: 0.03, blue: 0.08).ignoresSafeArea()
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 20) {
                        Text("How was your digital day?")
                            .font(.system(size: 18, weight: .bold)).foregroundColor(.white)
                        
                        Text("Check Settings → Screen Time → See All Activity\nfor your actual usage, then report below.")
                            .font(.system(size: 11, weight: .medium)).foregroundColor(.white.opacity(0.4))
                            .multilineTextAlignment(.center).lineSpacing(2)
                        
                        // Minutes slider
                        VStack(alignment: .leading, spacing: 8) {
                            HStack {
                                Text("Social Media Time").font(.system(size: 13, weight: .bold)).foregroundColor(.white)
                                Spacer()
                                Text("\(Int(reportedMinutes)) min").font(.system(size: 15, weight: .bold))
                                    .foregroundColor(Int(reportedMinutes) <= manager.dailyGoalMinutes ? .green : .red)
                            }
                            Slider(value: $reportedMinutes, in: 0...480, step: 5)
                                .tint(Int(reportedMinutes) <= manager.dailyGoalMinutes ? .green : .red)
                            HStack {
                                Text("0").font(.system(size: 9)).foregroundColor(.white.opacity(0.2))
                                Spacer()
                                Text("Goal: \(manager.dailyGoalMinutes)m").font(.system(size: 9, weight: .bold))
                                    .foregroundColor(manager.currentLevel.color)
                                Spacer()
                                Text("8h").font(.system(size: 9)).foregroundColor(.white.opacity(0.2))
                            }
                        }
                        .padding(14).background(RoundedRectangle(cornerRadius: 12).fill(Color.white.opacity(0.03)))
                        
                        // Trigger count
                        VStack(alignment: .leading, spacing: 8) {
                            HStack {
                                Text("Times You Got Triggered").font(.system(size: 13, weight: .bold)).foregroundColor(.white)
                                Spacer()
                                Text("\(Int(triggerCount))").font(.system(size: 15, weight: .bold)).foregroundColor(.orange)
                            }
                            Slider(value: $triggerCount, in: 0...20, step: 1).tint(.orange)
                            Text("Triggered = felt a strong emotional reaction to content")
                                .font(.system(size: 9)).foregroundColor(.white.opacity(0.3))
                        }
                        .padding(14).background(RoundedRectangle(cornerRadius: 12).fill(Color.white.opacity(0.03)))
                        
                        // Mood
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Overall Mood After Social Media").font(.system(size: 13, weight: .bold)).foregroundColor(.white)
                            HStack(spacing: 12) {
                                ForEach(CheckInMood.allCases, id: \.self) { mood in
                                    Button {
                                        selectedMood = mood
                                    } label: {
                                        VStack(spacing: 4) {
                                            Text(mood.emoji).font(.system(size: 24))
                                            Text(mood.rawValue).font(.system(size: 9, weight: .medium))
                                                .foregroundColor(selectedMood == mood ? .white : .white.opacity(0.3))
                                        }
                                        .frame(maxWidth: .infinity)
                                        .padding(.vertical, 8)
                                        .background(RoundedRectangle(cornerRadius: 10)
                                            .fill(selectedMood == mood ? Color.cyan.opacity(0.15) : .clear))
                                    }
                                }
                            }
                        }
                        .padding(14).background(RoundedRectangle(cornerRadius: 12).fill(Color.white.opacity(0.03)))
                        
                        // Note
                        TextField("Any notes? (optional)", text: $note)
                            .font(.system(size: 13)).foregroundColor(.white)
                            .padding(12).background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.04)))
                        
                        // Save
                        Button {
                            let checkIn = HygieneCheckIn(
                                reportedMinutes: Int(reportedMinutes),
                                level: manager.currentLevel.rawValue,
                                triggerCount: Int(triggerCount),
                                mood: selectedMood,
                                note: note.isEmpty ? nil : note
                            )
                            manager.addCheckIn(checkIn)
                            saved = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) { dismiss() }
                        } label: {
                            HStack(spacing: 6) {
                                Image(systemName: saved ? "checkmark.circle.fill" : "checkmark")
                                Text(saved ? "Saved!" : "Log Today").font(.system(size: 15, weight: .bold))
                            }
                            .foregroundColor(.black).frame(maxWidth: .infinity).padding(.vertical, 12)
                            .background(Capsule().fill(saved ? .green : .cyan))
                        }
                        .disabled(saved)
                        
                        Spacer(minLength: 40)
                    }
                    .padding(20)
                }
            }
            .navigationTitle("Daily Check-in")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button { dismiss() } label: {
                        Image(systemName: "xmark.circle.fill").foregroundColor(.white.opacity(0.3))
                    }
                }
            }
        }
    }
}

// MARK: - ═══════════════════════════════════════════════════
// FEED DECLUTTER VIEW
// ═══════════════════════════════════════════════════════════

struct FeedDeclutterView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var manager = SocialHygieneManager.shared
    @State private var completedItems: Set<String> = []
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 0.03, green: 0.03, blue: 0.08).ignoresSafeArea()
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 16) {
                        Text("Go through each category.\nTap items as you complete them.\nYour feed is about to get a LOT cleaner.")
                            .font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.4))
                            .multilineTextAlignment(.center).lineSpacing(3)
                        
                        // Unfollowed counter
                        HStack(spacing: 10) {
                            Image(systemName: "scissors").foregroundColor(.orange)
                            Text("Accounts Unfollowed:").font(.system(size: 13, weight: .medium)).foregroundColor(.white.opacity(0.5))
                            Spacer()
                            Text("\(manager.unfollowedCount)").font(.system(size: 20, weight: .bold)).foregroundColor(.orange)
                            Stepper("", value: Binding(
                                get: { manager.unfollowedCount },
                                set: { newVal in
                                    if newVal > manager.unfollowedCount { manager.incrementUnfollowed() }
                                }
                            ), in: 0...999)
                            .labelsHidden().frame(width: 90)
                        }
                        .padding(12).background(RoundedRectangle(cornerRadius: 12).fill(Color.orange.opacity(0.06)))
                        
                        ForEach(Array(EchoChamberDatabase.declutterChecklist.enumerated()), id: \.offset) { _, category in
                            VStack(alignment: .leading, spacing: 10) {
                                HStack(spacing: 8) {
                                    Image(systemName: category.icon).font(.system(size: 14))
                                        .foregroundColor(category.icon == "sparkles" ? .green : .red)
                                    Text(category.category)
                                        .font(.system(size: 14, weight: .bold))
                                        .foregroundColor(category.icon == "sparkles" ? .green : .white)
                                }
                                
                                ForEach(category.items, id: \.self) { item in
                                    Button {
                                        if completedItems.contains(item) { completedItems.remove(item) }
                                        else { completedItems.insert(item) }
                                    } label: {
                                        HStack(alignment: .top, spacing: 10) {
                                            Image(systemName: completedItems.contains(item) ? "checkmark.circle.fill" : "circle")
                                                .font(.system(size: 16))
                                                .foregroundColor(completedItems.contains(item) ? .green : .white.opacity(0.2))
                                            Text(item)
                                                .font(.system(size: 12, weight: .medium))
                                                .foregroundColor(completedItems.contains(item) ? .white.opacity(0.3) : .white.opacity(0.7))
                                                .strikethrough(completedItems.contains(item))
                                                .lineSpacing(2).multilineTextAlignment(.leading)
                                        }
                                    }
                                }
                            }
                            .padding(14)
                            .background(RoundedRectangle(cornerRadius: 14).fill(Color.white.opacity(0.03))
                                .overlay(RoundedRectangle(cornerRadius: 14).stroke(
                                    category.icon == "sparkles" ? Color.green.opacity(0.1) : Color.white.opacity(0.05), lineWidth: 1)))
                        }
                        
                        Spacer(minLength: 40)
                    }
                    .padding(20)
                }
            }
            .navigationTitle("Declutter Your Feed")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button { dismiss() } label: {
                        Image(systemName: "xmark.circle.fill").foregroundColor(.white.opacity(0.3))
                    }
                }
            }
        }
    }
}

// MARK: - ═══════════════════════════════════════════════════
// LEVEL PICKER
// ═══════════════════════════════════════════════════════════

struct LevelPickerView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var manager: SocialHygieneManager
    @State private var expandedLevel: HygieneLevel? = nil
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 0.03, green: 0.03, blue: 0.08).ignoresSafeArea()
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 12) {
                        Text("Choose your level honestly.\nYou can always change it.\nThe only wrong answer is pretending.")
                            .font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.4))
                            .multilineTextAlignment(.center).lineSpacing(3).padding(.bottom, 8)
                        
                        ForEach(HygieneLevel.allCases) { level in
                            VStack(alignment: .leading, spacing: 0) {
                                Button {
                                    withAnimation(.spring(response: 0.3)) {
                                        expandedLevel = expandedLevel == level ? nil : level
                                    }
                                } label: {
                                    HStack(spacing: 12) {
                                        ZStack {
                                            Circle().fill(level.color.opacity(manager.currentLevel == level ? 0.3 : 0.1))
                                                .frame(width: 40, height: 40)
                                            Image(systemName: level.icon).font(.system(size: 16)).foregroundColor(level.color)
                                        }
                                        VStack(alignment: .leading, spacing: 3) {
                                            HStack(spacing: 6) {
                                                Text("Level \(level.rawValue)").font(.system(size: 10, weight: .bold)).foregroundColor(level.color)
                                                Text(level.name).font(.system(size: 14, weight: .bold)).foregroundColor(.white)
                                                if manager.currentLevel == level {
                                                    Text("CURRENT").font(.system(size: 8, weight: .bold)).tracking(1)
                                                        .foregroundColor(.black).padding(.horizontal, 6).padding(.vertical, 2)
                                                        .background(Capsule().fill(level.color))
                                                }
                                            }
                                            Text(level.description).font(.system(size: 11)).foregroundColor(.white.opacity(0.4))
                                            Text("Budget: \(level.dailyBudgetMinutes) min/day").font(.system(size: 10, weight: .bold)).foregroundColor(level.color.opacity(0.6))
                                        }
                                        Spacer()
                                        Image(systemName: expandedLevel == level ? "chevron.up" : "chevron.down")
                                            .font(.system(size: 11)).foregroundColor(.white.opacity(0.2))
                                    }
                                    .padding(12)
                                }
                                
                                if expandedLevel == level {
                                    VStack(alignment: .leading, spacing: 8) {
                                        Divider().background(Color.white.opacity(0.06))
                                        Text("DAILY PROTOCOL").font(.system(size: 9, weight: .bold)).tracking(1).foregroundColor(level.color.opacity(0.5))
                                        ForEach(Array(level.protocol_steps.enumerated()), id: \.offset) { i, step in
                                            HStack(alignment: .top, spacing: 8) {
                                                Text("\(i + 1)").font(.system(size: 10, weight: .bold))
                                                    .foregroundColor(level.color).frame(width: 18)
                                                Text(step).font(.system(size: 11, weight: .medium))
                                                    .foregroundColor(.white.opacity(0.6)).lineSpacing(2)
                                            }
                                        }
                                        
                                        if manager.currentLevel != level {
                                            Button {
                                                manager.setLevel(level)
                                                dismiss()
                                            } label: {
                                                Text("Set as My Level").font(.system(size: 13, weight: .bold))
                                                    .foregroundColor(.black).frame(maxWidth: .infinity).padding(.vertical, 10)
                                                    .background(Capsule().fill(level.color))
                                            }
                                            .padding(.top, 4)
                                        }
                                    }
                                    .padding(.horizontal, 12).padding(.bottom, 12)
                                }
                            }
                            .background(RoundedRectangle(cornerRadius: 14).fill(Color.white.opacity(0.03))
                                .overlay(RoundedRectangle(cornerRadius: 14).stroke(
                                    manager.currentLevel == level ? level.color.opacity(0.2) : Color.white.opacity(0.04), lineWidth: 1)))
                        }
                        
                        Spacer(minLength: 40)
                    }
                    .padding(20)
                }
            }
            .navigationTitle("Choose Your Level")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button { dismiss() } label: {
                        Image(systemName: "xmark.circle.fill").foregroundColor(.white.opacity(0.3))
                    }
                }
            }
        }
    }
}

// MARK: - ═══════════════════════════════════════════════════
// HYGIENE PROGRESS VIEW
// ═══════════════════════════════════════════════════════════

struct HygieneProgressView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var manager: SocialHygieneManager
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 0.03, green: 0.03, blue: 0.08).ignoresSafeArea()
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 16) {
                        // Level + streak
                        HStack(spacing: 20) {
                            VStack(spacing: 4) {
                                Text("Level").font(.system(size: 9, weight: .bold)).foregroundColor(.white.opacity(0.3))
                                ZStack {
                                    Circle().fill(manager.currentLevel.color.opacity(0.15)).frame(width: 56, height: 56)
                                    Text("\(manager.currentLevel.rawValue)").font(.system(size: 22, weight: .bold)).foregroundColor(manager.currentLevel.color)
                                }
                                Text(manager.currentLevel.name).font(.system(size: 10, weight: .bold)).foregroundColor(manager.currentLevel.color)
                            }
                            VStack(spacing: 4) {
                                Text("Streak").font(.system(size: 9, weight: .bold)).foregroundColor(.white.opacity(0.3))
                                Text("\(manager.streakDays)").font(.system(size: 28, weight: .bold)).foregroundColor(.green)
                                Text("days on budget").font(.system(size: 10)).foregroundColor(.white.opacity(0.3))
                            }
                            VStack(spacing: 4) {
                                Text("Avg 7d").font(.system(size: 9, weight: .bold)).foregroundColor(.white.opacity(0.3))
                                Text("\(manager.averageMinutesLast7)").font(.system(size: 28, weight: .bold))
                                    .foregroundColor(manager.averageMinutesLast7 <= manager.dailyGoalMinutes ? .green : .red)
                                Text("min/day").font(.system(size: 10)).foregroundColor(.white.opacity(0.3))
                            }
                        }
                        .padding(16).frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 16).fill(Color.white.opacity(0.03)))
                        
                        // Check-in history
                        if !manager.checkIns.isEmpty {
                            VStack(alignment: .leading, spacing: 8) {
                                Text("RECENT CHECK-INS").font(.system(size: 10, weight: .bold)).tracking(2).foregroundColor(.white.opacity(0.3))
                                ForEach(manager.checkIns.prefix(14)) { checkIn in
                                    HStack(spacing: 10) {
                                        Text(checkIn.mood.emoji)
                                        VStack(alignment: .leading, spacing: 2) {
                                            HStack(spacing: 6) {
                                                Text("\(checkIn.reportedMinutes) min").font(.system(size: 12, weight: .bold))
                                                    .foregroundColor(checkIn.reportedMinutes <= manager.dailyGoalMinutes ? .green : .red)
                                                Text("\(checkIn.triggerCount) triggers").font(.system(size: 10)).foregroundColor(.orange)
                                            }
                                            if let note = checkIn.note {
                                                Text(note).font(.system(size: 10)).foregroundColor(.white.opacity(0.3)).lineLimit(1)
                                            }
                                        }
                                        Spacer()
                                        Text(checkIn.date, style: .date).font(.system(size: 9)).foregroundColor(.white.opacity(0.2))
                                    }
                                    .padding(8).background(RoundedRectangle(cornerRadius: 8).fill(Color.white.opacity(0.02)))
                                }
                            }
                        }
                        
                        // Scans
                        if !manager.scanHistory.isEmpty {
                            VStack(alignment: .leading, spacing: 8) {
                                Text("RECENT SCANS").font(.system(size: 10, weight: .bold)).tracking(2).foregroundColor(.white.opacity(0.3))
                                ForEach(manager.scanHistory.prefix(5)) { scan in
                                    HStack(spacing: 8) {
                                        Text("\(scan.reactivityScore)")
                                            .font(.system(size: 14, weight: .bold))
                                            .foregroundColor(scan.reactivityScore >= 70 ? .red : scan.reactivityScore >= 40 ? .orange : .green)
                                            .frame(width: 30)
                                        Text(scan.content).font(.system(size: 11)).foregroundColor(.white.opacity(0.5)).lineLimit(2)
                                        Spacer()
                                    }
                                    .padding(8).background(RoundedRectangle(cornerRadius: 8).fill(Color.white.opacity(0.02)))
                                }
                            }
                        }
                        
                        // Stats
                        VStack(alignment: .leading, spacing: 8) {
                            Text("STATS").font(.system(size: 10, weight: .bold)).tracking(2).foregroundColor(.white.opacity(0.3))
                            statRow("Total check-ins", "\(manager.checkIns.count)")
                            statRow("Content scans", "\(manager.scanHistory.count)")
                            statRow("Accounts unfollowed", "\(manager.unfollowedCount)")
                            statRow("Daily budget", "\(manager.dailyGoalMinutes) min")
                        }
                        
                        Spacer(minLength: 40)
                    }
                    .padding(20)
                }
            }
            .navigationTitle("My Progress")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button { dismiss() } label: {
                        Image(systemName: "xmark.circle.fill").foregroundColor(.white.opacity(0.3))
                    }
                }
            }
        }
    }
    
    private func statRow(_ label: String, _ value: String) -> some View {
        HStack {
            Text(label).font(.system(size: 12)).foregroundColor(.white.opacity(0.5))
            Spacer()
            Text(value).font(.system(size: 12, weight: .bold)).foregroundColor(.white)
        }
        .padding(8).background(RoundedRectangle(cornerRadius: 6).fill(Color.white.opacity(0.02)))
    }
}
