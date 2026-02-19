// SiriIntegrationManager.swift
// SIRI + LOCAL AI INTEGRATION
// ☀️ SunFlow: Reignited × Second Brain
//
// "Hey Siri, I'm anxious."
// → Launches breathing exercise immediately.
//
// "Hey Siri, break down my task."
// → On-device NLP splits it into micro-steps.
//
// "Hey Siri, I can't sleep."
// → Starts sleep wind-down protocol.
//
// ALL on-device. Zero backend. Zero API calls.
// Uses: App Intents (iOS 16+), SiriKit,
// Core ML, Natural Language framework.
//
// Privacy-first: nothing leaves the device.
// Your mental health data stays YOUR data.

import Foundation
import AppIntents
import Intents
import NaturalLanguage

// MARK: - ═══════════════════════════════════════════════════
// SIRI SHORTCUT INTENTS — App Intents Framework (iOS 16+)
// ═══════════════════════════════════════════════════════════

// ─────────────────────────────────────────────
// 1. "Hey Siri, I'm anxious" / "Start breathing"
// ─────────────────────────────────────────────

struct StartBreathingIntent: AppIntent {
    
    static var title: LocalizedStringResource = "Start Breathing Exercise"
    static var description = IntentDescription("Start a guided breathing exercise to calm your nervous system.")
    static var openAppWhenRun: Bool = true
    
    @Parameter(title: "Technique")
    var technique: BreathingTechnique?
    
    func perform() async throws -> some IntentResult & ProvidesDialog {
        let tech = technique ?? .fourSevenEight
        
        // Post notification to open Mind Sanctuary → Breathe tab
        NotificationCenter.default.post(
            name: .siriStartBreathing,
            object: nil,
            userInfo: ["technique": tech.rawValue]
        )
        
        return .result(dialog: "Starting \(tech.displayName). Breathe in... hold... breathe out. You're safe.")
    }
    
    static var parameterSummary: some ParameterSummary {
        Summary("Start \(\.$technique) breathing")
    }
}

enum BreathingTechnique: String, AppEnum {
    case fourSevenEight = "478"
    case boxBreathing = "box"
    case physiologicalSigh = "sigh"
    
    static var typeDisplayRepresentation = TypeDisplayRepresentation(name: "Breathing Technique")
    static var caseDisplayRepresentations: [BreathingTechnique: DisplayRepresentation] = [
        .fourSevenEight: "4-7-8 Calm",
        .boxBreathing: "Box Breathing",
        .physiologicalSigh: "Physiological Sigh",
    ]
    
    var displayName: String {
        switch self {
        case .fourSevenEight: return "4-7-8 breathing"
        case .boxBreathing: return "Box Breathing"
        case .physiologicalSigh: return "Physiological Sigh"
        }
    }
}

// ─────────────────────────────────────────────
// 2. "Hey Siri, ground me" / "I need grounding"
// ─────────────────────────────────────────────

struct StartGroundingIntent: AppIntent {
    
    static var title: LocalizedStringResource = "Start Grounding Exercise"
    static var description = IntentDescription("Start the 5-4-3-2-1 grounding technique to anchor you to the present moment.")
    static var openAppWhenRun: Bool = true
    
    func perform() async throws -> some IntentResult & ProvidesDialog {
        NotificationCenter.default.post(name: .siriStartGrounding, object: nil)
        
        return .result(dialog: "Starting grounding. Look around and name 5 things you can see. Take your time.")
    }
}

// ─────────────────────────────────────────────
// 3. "Hey Siri, I can't sleep" / "Start wind-down"
// ─────────────────────────────────────────────

struct StartSleepWindDownIntent: AppIntent {
    
    static var title: LocalizedStringResource = "Start Sleep Wind-Down"
    static var description = IntentDescription("Begin the evening wind-down protocol to prepare for sleep.")
    static var openAppWhenRun: Bool = true
    
    func perform() async throws -> some IntentResult & ProvidesDialog {
        NotificationCenter.default.post(name: .siriStartSleepWindDown, object: nil)
        
        return .result(dialog: "Starting your wind-down protocol. First step: put your screens on night mode or set them aside. You're preparing your brain for rest.")
    }
}

// ─────────────────────────────────────────────
// 4. "Hey Siri, anxiety first aid"
// ─────────────────────────────────────────────

struct AnxietyFirstAidIntent: AppIntent {
    
    static var title: LocalizedStringResource = "Anxiety First Aid"
    static var description = IntentDescription("Launch the emergency anxiety toolkit — fastest calming techniques.")
    static var openAppWhenRun: Bool = true
    
    func perform() async throws -> some IntentResult & ProvidesDialog {
        NotificationCenter.default.post(name: .siriAnxietyFirstAid, object: nil)
        
        return .result(dialog: "Opening Anxiety First Aid. First: take a double inhale through your nose, then a long exhale through your mouth. That's a physiological sigh. One breath can shift your state.")
    }
}

// ─────────────────────────────────────────────
// 5. "Hey Siri, mood check" / "How am I doing"
// ─────────────────────────────────────────────

struct MoodCheckIntent: AppIntent {
    
    static var title: LocalizedStringResource = "Mood Check-In"
    static var description = IntentDescription("Quick emotional check-in — name it to tame it.")
    static var openAppWhenRun: Bool = true
    
    func perform() async throws -> some IntentResult & ProvidesDialog {
        NotificationCenter.default.post(name: .siriMoodCheck, object: nil)
        
        return .result(dialog: "Opening your mood check. Take a moment to notice how you're feeling right now. No judgment — just awareness.")
    }
}

// ─────────────────────────────────────────────
// 6. "Hey Siri, dopamine menu"
// ─────────────────────────────────────────────

struct DopamineMenuIntent: AppIntent {
    
    static var title: LocalizedStringResource = "Dopamine Menu"
    static var description = IntentDescription("Get healthy dopamine alternatives instead of doom-scrolling.")
    static var openAppWhenRun: Bool = true
    
    func perform() async throws -> some IntentResult & ProvidesDialog {
        NotificationCenter.default.post(name: .siriDopamineMenu, object: nil)
        
        let suggestions = [
            "Put on a song you love",
            "Walk outside for 5 minutes",
            "Do a quick stretch",
            "Dance to one song",
            "Call someone you love",
        ]
        let random = suggestions.randomElement() ?? suggestions[0]
        
        return .result(dialog: "Here's a quick dopamine hit: \(random). Or open the full menu for more options.")
    }
}

// ─────────────────────────────────────────────
// 7. "Hey Siri, break down my task"
// ─────────────────────────────────────────────

struct BreakDownTaskIntent: AppIntent {
    
    static var title: LocalizedStringResource = "Break Down My Task"
    static var description = IntentDescription("Break an overwhelming task into micro-steps using on-device AI.")
    static var openAppWhenRun: Bool = true
    
    @Parameter(title: "Task Description")
    var taskDescription: String?
    
    func perform() async throws -> some IntentResult & ProvidesDialog {
        guard let task = taskDescription, !task.isEmpty else {
            return .result(dialog: "What task do you need broken down? Tell me what you're trying to do.")
        }
        
        // Use on-device task breakdown
        let breakdown = LocalTaskBreakdown.breakDown(task: task)
        
        NotificationCenter.default.post(
            name: .siriBreakDownTask,
            object: nil,
            userInfo: ["task": task, "steps": breakdown.steps]
        )
        
        let firstStep = breakdown.steps.first ?? "Just start with the smallest piece."
        return .result(dialog: "I broke '\(task)' into \(breakdown.steps.count) micro-steps. First step: \(firstStep). Opening the full breakdown now.")
    }
    
    static var parameterSummary: some ParameterSummary {
        Summary("Break down \(\.$taskDescription)")
    }
}

// ─────────────────────────────────────────────
// 8. "Hey Siri, open Mind Sanctuary"
// ─────────────────────────────────────────────

struct OpenMindSanctuaryIntent: AppIntent {
    
    static var title: LocalizedStringResource = "Open Mind Sanctuary"
    static var description = IntentDescription("Open the Mind Sanctuary — your calm space.")
    static var openAppWhenRun: Bool = true
    
    func perform() async throws -> some IntentResult & ProvidesDialog {
        NotificationCenter.default.post(name: .siriOpenSanctuary, object: nil)
        return .result(dialog: "Opening Mind Sanctuary. What do you need right now?")
    }
}

// MARK: - ═══════════════════════════════════════════════════
// SIRI SHORTCUTS PROVIDER — Makes shortcuts appear in
// Shortcuts app and Siri suggestions
// ═══════════════════════════════════════════════════════════

// MARK: - Siri Shortcuts (registered in Core/Intents/AppIntents.swift)
// ApertureShortcuts is the single AppShortcutsProvider for the app.
// Mind Sanctuary intents (StartBreathingIntent, etc.) are registered there.

// MARK: - ═══════════════════════════════════════════════════
// NOTIFICATION NAMES — For Siri → App communication
// ═══════════════════════════════════════════════════════════

extension Notification.Name {
    static let siriStartBreathing = Notification.Name("siriStartBreathing")
    static let siriStartGrounding = Notification.Name("siriStartGrounding")
    static let siriStartSleepWindDown = Notification.Name("siriStartSleepWindDown")
    static let siriAnxietyFirstAid = Notification.Name("siriAnxietyFirstAid")
    static let siriMoodCheck = Notification.Name("siriMoodCheck")
    static let siriDopamineMenu = Notification.Name("siriDopamineMenu")
    static let siriBreakDownTask = Notification.Name("siriBreakDownTask")
    static let siriOpenSanctuary = Notification.Name("siriOpenSanctuary")
}

// MARK: - ═══════════════════════════════════════════════════
// LOCAL AI — On-Device NLP (Natural Language Framework)
// No API. No backend. No data leaves the device.
// ═══════════════════════════════════════════════════════════

// ─────────────────────────────────────────────
// SENTIMENT ANALYZER — Mood detection from text
// Uses Apple's built-in NL sentiment model
// ─────────────────────────────────────────────

struct LocalSentimentAnalyzer {
    
    /// Analyze mood from user text input — returns -1.0 (negative) to 1.0 (positive)
    /// Runs entirely on-device using Apple's NaturalLanguage framework
    static func analyzeMood(from text: String) -> MoodAnalysis {
        let tagger = NLTagger(tagSchemes: [.sentimentScore])
        tagger.string = text
        
        var sentimentScore: Double = 0.0
        tagger.enumerateTags(in: text.startIndex..<text.endIndex, unit: .paragraph, scheme: .sentimentScore) { tag, _ in
            if let tag = tag {
                sentimentScore = Double(tag.rawValue) ?? 0.0
            }
            return false
        }
        
        // Detect specific emotional keywords for more nuanced analysis
        let anxietyKeywords = ["anxious", "anxiety", "panic", "scared", "worried", "nervous", "fear", "dread", "spiraling", "overwhelmed", "can't breathe", "heart racing"]
        let depressionKeywords = ["sad", "hopeless", "empty", "numb", "worthless", "tired", "exhausted", "can't", "give up", "alone", "dark"]
        let adhKeywords = ["scattered", "distracted", "can't focus", "forgot", "procrastinating", "overwhelmed", "too much", "paralyzed", "stuck", "bored", "restless"]
        let positiveKeywords = ["grateful", "happy", "calm", "focused", "peaceful", "good", "great", "amazing", "flow", "clear", "sovereign"]
        
        let lowered = text.lowercased()
        let detectedStates = DetectedStates(
            anxietyLevel: keywordMatch(in: lowered, keywords: anxietyKeywords),
            depressionLevel: keywordMatch(in: lowered, keywords: depressionKeywords),
            adhdLevel: keywordMatch(in: lowered, keywords: adhKeywords),
            positiveLevel: keywordMatch(in: lowered, keywords: positiveKeywords)
        )
        
        return MoodAnalysis(
            sentimentScore: sentimentScore,
            detectedStates: detectedStates,
            suggestedTool: suggestTool(for: detectedStates, sentiment: sentimentScore)
        )
    }
    
    private static func keywordMatch(in text: String, keywords: [String]) -> Double {
        let matches = keywords.filter { text.contains($0) }
        return min(Double(matches.count) / 3.0, 1.0) // Normalized 0-1
    }
    
    private static func suggestTool(for states: DetectedStates, sentiment: Double) -> SuggestedSanctuaryTool {
        if states.anxietyLevel > 0.5 {
            return .anxietyFirstAid
        } else if states.depressionLevel > 0.5 {
            return .moodCheck
        } else if states.adhdLevel > 0.5 {
            return .dopamineMenu
        } else if sentiment < -0.3 {
            return .breathing
        } else if sentiment > 0.3 {
            return .awakeningReady
        } else {
            return .grounding
        }
    }
}

struct MoodAnalysis {
    let sentimentScore: Double // -1.0 to 1.0
    let detectedStates: DetectedStates
    let suggestedTool: SuggestedSanctuaryTool
    
    var moodLevel: Int {
        // Convert -1.0...1.0 to 1...10
        return max(1, min(10, Int((sentimentScore + 1.0) * 5.0)))
    }
    
    var summary: String {
        switch suggestedTool {
        case .anxietyFirstAid: return "I'm detecting anxiety signals. Let me help you right now."
        case .breathing: return "Sounds like your nervous system needs a reset. Let's breathe."
        case .grounding: return "Let's ground you in the present moment."
        case .moodCheck: return "It sounds like you're going through something. Let's check in."
        case .dopamineMenu: return "Your brain might need a healthy dopamine hit. Here are some options."
        case .microTasks: return "Feeling stuck? Let's break it into tiny steps."
        case .awakeningReady: return "You're in a good space. You might have bandwidth to explore deeper content."
        }
    }
}

struct DetectedStates {
    let anxietyLevel: Double   // 0-1
    let depressionLevel: Double // 0-1
    let adhdLevel: Double      // 0-1
    let positiveLevel: Double  // 0-1
}

enum SuggestedSanctuaryTool: String {
    case anxietyFirstAid = "Anxiety First Aid"
    case breathing = "Breathing Exercise"
    case grounding = "Grounding"
    case moodCheck = "Mood Check"
    case dopamineMenu = "Dopamine Menu"
    case microTasks = "Micro Tasks"
    case awakeningReady = "Explore Awakening"
}

// ─────────────────────────────────────────────
// TASK BREAKDOWN ENGINE — On-device NLP
// Breaks tasks into micro-steps using
// pattern matching and NL tokenization
// ─────────────────────────────────────────────

struct LocalTaskBreakdown {
    
    struct TaskResult {
        let originalTask: String
        let steps: [String]
        let estimatedMinutes: Int
        let complexity: TaskComplexity
    }
    
    enum TaskComplexity: String {
        case tiny = "Tiny (just do it)"
        case small = "Small (5-10 min)"
        case medium = "Medium (15-30 min)"
        case large = "Large (break it down more)"
    }
    
    /// Break down a task description into micro-steps
    /// Uses NLP tokenization + pattern matching — entirely on-device
    static func breakDown(task: String) -> TaskResult {
        let lowered = task.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Detect task category and provide tailored breakdown
        let steps: [String]
        let minutes: Int
        let complexity: TaskComplexity
        
        if containsAny(lowered, ["clean", "tidy", "organize", "declutter", "dishes", "laundry"]) {
            steps = cleaningBreakdown(task)
            minutes = 15
            complexity = .medium
        } else if containsAny(lowered, ["email", "reply", "respond", "message", "text", "write", "send"]) {
            steps = communicationBreakdown(task)
            minutes = 10
            complexity = .small
        } else if containsAny(lowered, ["study", "read", "learn", "homework", "research", "paper"]) {
            steps = studyBreakdown(task)
            minutes = 25
            complexity = .medium
        } else if containsAny(lowered, ["exercise", "workout", "gym", "run", "walk", "stretch"]) {
            steps = exerciseBreakdown(task)
            minutes = 15
            complexity = .small
        } else if containsAny(lowered, ["cook", "meal", "food", "eat", "dinner", "lunch", "breakfast"]) {
            steps = cookingBreakdown(task)
            minutes = 20
            complexity = .medium
        } else if containsAny(lowered, ["code", "build", "develop", "program", "debug", "fix", "app", "project"]) {
            steps = codingBreakdown(task)
            minutes = 25
            complexity = .large
        } else if containsAny(lowered, ["call", "phone", "appointment", "schedule", "book"]) {
            steps = phoneBreakdown(task)
            minutes = 5
            complexity = .tiny
        } else {
            steps = genericBreakdown(task)
            minutes = 15
            complexity = .medium
        }
        
        return TaskResult(originalTask: task, steps: steps, estimatedMinutes: minutes, complexity: complexity)
    }
    
    // MARK: - Category-specific breakdowns
    
    private static func cleaningBreakdown(_ task: String) -> [String] {
        [
            "Stand up and walk to the area that needs cleaning.",
            "Set a timer for 10 minutes (you can stop after that).",
            "Pick up ONE item and put it where it belongs.",
            "Pick up the next closest item.",
            "If the timer goes off and you want to stop — stop. You did something. That counts.",
            "If momentum kicked in — ride it until done.",
        ]
    }
    
    private static func communicationBreakdown(_ task: String) -> [String] {
        [
            "Open the app (email, messages, etc.).",
            "Find the specific message you need to respond to.",
            "Type just the greeting: 'Hi [name],'",
            "Write ONE sentence. Just one. Imperfect is fine.",
            "Read it once (don't overthink it).",
            "Hit send. Done. Imperfect and sent > perfect and unsent.",
        ]
    }
    
    private static func studyBreakdown(_ task: String) -> [String] {
        [
            "Get your materials out (book, laptop, notes).",
            "Set a timer for 15 minutes (Pomodoro technique).",
            "Read/work on JUST the first section or page.",
            "After 15 minutes: take a 3-minute break (stretch, water).",
            "Do one more 15-minute block if you can.",
            "After 2 blocks: you've done 30 minutes. That's real progress.",
        ]
    }
    
    private static func exerciseBreakdown(_ task: String) -> [String] {
        [
            "Put on athletic shoes. That's the only commitment right now.",
            "Stand up.",
            "Do 5 jumping jacks or march in place for 30 seconds.",
            "If you want to stop — stop. You moved. That counts.",
            "If not — do 5 more minutes of whatever feels right.",
            "Movement creates motivation. Not the other way around.",
        ]
    }
    
    private static func cookingBreakdown(_ task: String) -> [String] {
        [
            "Go to the kitchen.",
            "Pick the SIMPLEST thing you could make (even toast counts).",
            "Get out just the ingredients for that one thing.",
            "Prepare it. Don't worry about making it fancy.",
            "Eat it. You fed yourself. That's a win.",
            "Dishes can wait. Nourishment was the mission.",
        ]
    }
    
    private static func codingBreakdown(_ task: String) -> [String] {
        [
            "Open your editor / IDE.",
            "Open the specific file you need to work on.",
            "Write ONE comment describing what you want to do.",
            "Write the smallest possible piece of code that does ONE thing.",
            "Run it. Does it work? If yes — commit. If no — debug just that piece.",
            "Repeat. Small commits. Small wins. Momentum builds.",
        ]
    }
    
    private static func phoneBreakdown(_ task: String) -> [String] {
        [
            "Find the phone number or contact.",
            "Write down 2-3 bullet points of what you want to say.",
            "Dial the number (or tap the contact).",
            "If voicemail: leave a brief message with your name and callback number.",
            "If they answer: read your bullets. Keep it brief.",
            "Done. Phone calls feel 10x harder than they actually are.",
        ]
    }
    
    private static func genericBreakdown(_ task: String) -> [String] {
        [
            "What's the SMALLEST possible first step? Do just that.",
            "Set a timer for 5 minutes.",
            "Work on it for just those 5 minutes.",
            "When the timer rings — decide: stop or continue?",
            "If you did 5 minutes — that's progress. Real progress.",
            "Momentum comes FROM starting. Not before it.",
        ]
    }
    
    private static func containsAny(_ text: String, _ keywords: [String]) -> Bool {
        keywords.contains { text.contains($0) }
    }
}

// MARK: - ═══════════════════════════════════════════════════
// LOCAL AI SMART ROUTER
// Analyzes user state and routes to the right tool
// ═══════════════════════════════════════════════════════════

struct SmartSanctuaryRouter {
    
    /// Given a free-text input (from Siri, voice, or text),
    /// determine what the user needs and route them accordingly
    static func route(input: String) -> SanctuaryRoute {
        let lowered = input.lowercased()
        
        // Emergency / Crisis detection — highest priority
        if containsCrisisLanguage(lowered) {
            return SanctuaryRoute(
                destination: .anxietyFirstAid,
                urgency: .immediate,
                spokenResponse: "I hear you. Let's start with one breath. Double inhale through your nose, then long exhale. You're safe right now.",
                followUp: "If you're in crisis, please also reach out to 988 Suicide & Crisis Lifeline (call or text 988)."
            )
        }
        
        // Anxiety / Panic
        if containsAny(lowered, ["anxious", "anxiety", "panic", "can't breathe", "heart racing", "spiraling", "scared", "freaking out"]) {
            return SanctuaryRoute(
                destination: .anxietyFirstAid,
                urgency: .high,
                spokenResponse: "Starting anxiety first aid. First: a physiological sigh. Double inhale, long exhale.",
                followUp: nil
            )
        }
        
        // Can't sleep
        if containsAny(lowered, ["can't sleep", "insomnia", "awake", "bedtime", "sleep", "rest", "wind down"]) {
            return SanctuaryRoute(
                destination: .sleepWindDown,
                urgency: .medium,
                spokenResponse: "Starting your sleep wind-down protocol. First: screens on night mode.",
                followUp: nil
            )
        }
        
        // Need to focus / ADHD overwhelm
        if containsAny(lowered, ["can't focus", "distracted", "scattered", "overwhelmed", "too much", "stuck", "procrastinating"]) {
            return SanctuaryRoute(
                destination: .dopamineMenu,
                urgency: .medium,
                spokenResponse: "Sounds like your brain needs a reset. Here's a quick dopamine menu — pick one healthy option.",
                followUp: nil
            )
        }
        
        // Task breakdown
        if containsAny(lowered, ["break down", "how do i start", "too big", "don't know where to start", "task", "micro"]) {
            return SanctuaryRoute(
                destination: .microTasks,
                urgency: .low,
                spokenResponse: "Let's make it tiny. What's the task? I'll break it into micro-steps.",
                followUp: nil
            )
        }
        
        // Breathing
        if containsAny(lowered, ["breathe", "breathing", "calm", "calm down", "relax"]) {
            return SanctuaryRoute(
                destination: .breathing,
                urgency: .medium,
                spokenResponse: "Starting breathing exercise. Inhale for 4... hold for 7... exhale for 8.",
                followUp: nil
            )
        }
        
        // Mood / emotional
        if containsAny(lowered, ["sad", "depressed", "empty", "numb", "lonely", "how am i", "mood", "feeling"]) {
            return SanctuaryRoute(
                destination: .moodCheck,
                urgency: .medium,
                spokenResponse: "Let's check in. How are you feeling right now, on a scale of 1 to 10?",
                followUp: nil
            )
        }
        
        // Bored / seeking
        if containsAny(lowered, ["bored", "dopamine", "something to do", "restless"]) {
            return SanctuaryRoute(
                destination: .dopamineMenu,
                urgency: .low,
                spokenResponse: "Your brain wants dopamine. Let's give it something healthy instead of your phone.",
                followUp: nil
            )
        }
        
        // Default — open sanctuary
        return SanctuaryRoute(
            destination: .sanctuary,
            urgency: .low,
            spokenResponse: "Opening Mind Sanctuary. What do you need right now?",
            followUp: nil
        )
    }
    
    private static func containsCrisisLanguage(_ text: String) -> Bool {
        let crisisTerms = ["kill myself", "want to die", "end it all", "suicide", "no reason to live", "better off dead"]
        return crisisTerms.contains { text.contains($0) }
    }
    
    private static func containsAny(_ text: String, _ keywords: [String]) -> Bool {
        keywords.contains { text.contains($0) }
    }
}

struct SanctuaryRoute {
    let destination: SanctuaryDestination
    let urgency: RouteUrgency
    let spokenResponse: String
    let followUp: String?
}

enum SanctuaryDestination: String {
    case anxietyFirstAid = "Anxiety First Aid"
    case breathing = "Breathing"
    case grounding = "Grounding"
    case moodCheck = "Mood Check"
    case dopamineMenu = "Dopamine Menu"
    case microTasks = "Micro Tasks"
    case sensory = "Sensory Toolkit"
    case sleepWindDown = "Sleep Wind-Down"
    case sanctuary = "Mind Sanctuary"
}

enum RouteUrgency: String {
    case immediate = "Now"
    case high = "High"
    case medium = "Medium"
    case low = "Low"
}

// MARK: - ═══════════════════════════════════════════════════
// SIRI NAVIGATION HANDLER
// Listens for Siri notifications and routes to correct view
// ═══════════════════════════════════════════════════════════

class SiriNavigationHandler: ObservableObject {
    
    @Published var targetSection: SanctuarySection?
    @Published var shouldOpenSanctuary = false
    @Published var taskToBreakDown: String?
    @Published var breakdownResult: LocalTaskBreakdown.TaskResult?
    
    init() {
        setupListeners()
    }
    
    private func setupListeners() {
        let center = NotificationCenter.default
        
        center.addObserver(forName: .siriStartBreathing, object: nil, queue: .main) { [weak self] notification in
            self?.shouldOpenSanctuary = true
            self?.targetSection = .breathe
        }
        
        center.addObserver(forName: .siriStartGrounding, object: nil, queue: .main) { [weak self] _ in
            self?.shouldOpenSanctuary = true
            self?.targetSection = .ground
        }
        
        center.addObserver(forName: .siriStartSleepWindDown, object: nil, queue: .main) { [weak self] _ in
            self?.shouldOpenSanctuary = true
            self?.targetSection = .sleep
        }
        
        center.addObserver(forName: .siriAnxietyFirstAid, object: nil, queue: .main) { [weak self] _ in
            self?.shouldOpenSanctuary = true
            self?.targetSection = .firstAid
        }
        
        center.addObserver(forName: .siriMoodCheck, object: nil, queue: .main) { [weak self] _ in
            self?.shouldOpenSanctuary = true
            self?.targetSection = .mood
        }
        
        center.addObserver(forName: .siriDopamineMenu, object: nil, queue: .main) { [weak self] _ in
            self?.shouldOpenSanctuary = true
            self?.targetSection = .dopamine
        }
        
        center.addObserver(forName: .siriBreakDownTask, object: nil, queue: .main) { [weak self] notification in
            self?.shouldOpenSanctuary = true
            self?.targetSection = .tasks
            if let task = notification.userInfo?["task"] as? String {
                self?.taskToBreakDown = task
                self?.breakdownResult = LocalTaskBreakdown.breakDown(task: task)
            }
        }
        
        center.addObserver(forName: .siriOpenSanctuary, object: nil, queue: .main) { [weak self] _ in
            self?.shouldOpenSanctuary = true
        }
    }
}
