// AccountabilityBuddySystem.swift
// The heart of Aperture's personal growth engine.
// Buddy naming, end-of-day reports, morning routines, sleep accountability, micro check-ins.
// ☀️ SunFlow: Reignited

import SwiftUI
import UserNotifications

// MARK: - ═══════════════════════════════════════════════════
// ACCOUNTABILITY BUDDY MANAGER
// ═══════════════════════════════════════════════════════════

@MainActor
final class AccountabilityBuddyManager: ObservableObject {
    
    static let shared = AccountabilityBuddyManager()
    
    // MARK: - State
    @Published var buddyName: String? = nil
    @Published var morningRoutine: [RoutineStep] = []
    @Published var bedtimeTarget: Date = Calendar.current.date(from: DateComponents(hour: 22, minute: 30)) ?? Date()
    @Published var wakeTarget: Date = Calendar.current.date(from: DateComponents(hour: 6, minute: 30)) ?? Date()
    @Published var sleepAccountabilityEnabled = false
    @Published var wakeAccountabilityEnabled = false
    @Published var shortTermGoals: [PersonalGoal] = []
    @Published var longTermGoals: [PersonalGoal] = []
    @Published var todayReport: DailyReport?
    @Published var microCheckInsDone: Int = 0
    
    private let defaults = UserDefaults.standard
    
    private init() {
        loadState()
    }
    
    // MARK: - Buddy Naming
    
    func nameBuddy(_ name: String) {
        buddyName = name.trimmingCharacters(in: .whitespacesAndNewlines)
        defaults.set(buddyName, forKey: "accountability_buddy_name")
        SunCompanionManager.shared.setBuddyName(name)
    }
    
    var hasBuddy: Bool { buddyName != nil && !(buddyName?.isEmpty ?? true) }
    
    // MARK: - Morning Routine
    
    func addRoutineStep(_ step: RoutineStep) {
        morningRoutine.append(step)
        saveRoutine()
    }
    
    func removeRoutineStep(at index: Int) {
        guard morningRoutine.indices.contains(index) else { return }
        morningRoutine.remove(at: index)
        saveRoutine()
    }
    
    func completeRoutineStep(_ id: String) {
        if let idx = morningRoutine.firstIndex(where: { $0.id == id }) {
            morningRoutine[idx].isCompletedToday = true
            saveRoutine()
        }
    }
    
    var routineCompletionPercent: Double {
        guard !morningRoutine.isEmpty else { return 0 }
        let done = morningRoutine.filter(\.isCompletedToday).count
        return Double(done) / Double(morningRoutine.count)
    }
    
    // MARK: - Goals
    
    func addGoal(_ goal: PersonalGoal) {
        if goal.isLongTerm {
            longTermGoals.append(goal)
        } else {
            shortTermGoals.append(goal)
        }
        saveGoals()
    }
    
    // MARK: - Daily Report
    
    func generateDailyReport(
        screenTimeHours: Double,
        socialMediaMinutes: Int,
        moodRating: Int,
        gratitude: String,
        lessonsCompleted: Int,
        didMeditate: Bool,
        bedtimeHonesty: BedtimeHonesty,
        topWin: String
    ) -> DailyReport {
        let report = DailyReport(
            date: Date(),
            screenTimeHours: screenTimeHours,
            socialMediaMinutes: socialMediaMinutes,
            moodRating: moodRating,
            gratitude: gratitude,
            lessonsCompleted: lessonsCompleted,
            didMeditate: didMeditate,
            bedtimeHonesty: bedtimeHonesty,
            routineCompletion: routineCompletionPercent,
            topWin: topWin,
            microCheckInsCompleted: microCheckInsDone
        )
        todayReport = report
        saveReport(report)
        return report
    }
    
    // MARK: - Micro Check-ins
    
    func recordMicroCheckIn() {
        microCheckInsDone += 1
        defaults.set(microCheckInsDone, forKey: "micro_checkins_today_\(todayKey)")
    }
    
    // MARK: - Sleep Accountability
    
    func scheduleSleepReminder() {
        guard sleepAccountabilityEnabled else { return }
        let content = UNMutableNotificationContent()
        content.title = hasBuddy ? "\(buddyName!) says:" : "☀️ SunFlow"
        content.body = "Time to wind down. Your target bedtime is in 30 minutes. Screen light disrupts melatonin — the system is designed to keep you scrolling past your limit."
        content.sound = .default
        
        var comps = Calendar.current.dateComponents([.hour, .minute], from: bedtimeTarget)
        comps.minute = (comps.minute ?? 0) - 30
        if (comps.minute ?? 0) < 0 { comps.minute = (comps.minute ?? 0) + 60; comps.hour = (comps.hour ?? 0) - 1 }
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: comps, repeats: true)
        let request = UNNotificationRequest(identifier: "sleep_reminder", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
    
    func scheduleWakeReminder() {
        guard wakeAccountabilityEnabled else { return }
        let content = UNMutableNotificationContent()
        content.title = hasBuddy ? "\(buddyName!) checking in:" : "☀️ Rise & Align"
        content.body = "New day, new awareness. Your morning routine is waiting. 5 minutes of intention beats 2 hours of reaction."
        content.sound = .default
        
        let comps = Calendar.current.dateComponents([.hour, .minute], from: wakeTarget)
        let trigger = UNCalendarNotificationTrigger(dateMatching: comps, repeats: true)
        let request = UNNotificationRequest(identifier: "wake_reminder", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
    
    // MARK: - Persistence
    
    private var todayKey: String {
        let fmt = DateFormatter()
        fmt.dateFormat = "yyyy-MM-dd"
        return fmt.string(from: Date())
    }
    
    private func loadState() {
        buddyName = defaults.string(forKey: "accountability_buddy_name")
        sleepAccountabilityEnabled = defaults.bool(forKey: "sleep_accountability_on")
        wakeAccountabilityEnabled = defaults.bool(forKey: "wake_accountability_on")
        microCheckInsDone = defaults.integer(forKey: "micro_checkins_today_\(todayKey)")
        
        if let data = defaults.data(forKey: "morning_routine"),
           let routine = try? JSONDecoder().decode([RoutineStep].self, from: data) {
            morningRoutine = routine
        }
        if let data = defaults.data(forKey: "short_term_goals"),
           let goals = try? JSONDecoder().decode([PersonalGoal].self, from: data) {
            shortTermGoals = goals
        }
        if let data = defaults.data(forKey: "long_term_goals"),
           let goals = try? JSONDecoder().decode([PersonalGoal].self, from: data) {
            longTermGoals = goals
        }
        
        if let btData = defaults.data(forKey: "bedtime_target"),
           let date = try? JSONDecoder().decode(Date.self, from: btData) {
            bedtimeTarget = date
        }
        if let wtData = defaults.data(forKey: "wake_target"),
           let date = try? JSONDecoder().decode(Date.self, from: wtData) {
            wakeTarget = date
        }
    }
    
    private func saveRoutine() {
        if let data = try? JSONEncoder().encode(morningRoutine) {
            defaults.set(data, forKey: "morning_routine")
        }
    }
    
    private func saveGoals() {
        if let data = try? JSONEncoder().encode(shortTermGoals) {
            defaults.set(data, forKey: "short_term_goals")
        }
        if let data = try? JSONEncoder().encode(longTermGoals) {
            defaults.set(data, forKey: "long_term_goals")
        }
    }
    
    func saveSleepSettings() {
        defaults.set(sleepAccountabilityEnabled, forKey: "sleep_accountability_on")
        defaults.set(wakeAccountabilityEnabled, forKey: "wake_accountability_on")
        if let btData = try? JSONEncoder().encode(bedtimeTarget) {
            defaults.set(btData, forKey: "bedtime_target")
        }
        if let wtData = try? JSONEncoder().encode(wakeTarget) {
            defaults.set(wtData, forKey: "wake_target")
        }
    }
    
    private func saveReport(_ report: DailyReport) {
        if let data = try? JSONEncoder().encode(report) {
            defaults.set(data, forKey: "daily_report_\(todayKey)")
        }
    }
}

// MARK: - ═══════════════════════════════════════════════════
// DATA MODELS
// ═══════════════════════════════════════════════════════════

struct RoutineStep: Identifiable, Codable {
    let id: String
    let title: String
    let emoji: String
    let durationMinutes: Int
    var isCompletedToday: Bool
    
    init(title: String, emoji: String, durationMinutes: Int) {
        self.id = UUID().uuidString
        self.title = title
        self.emoji = emoji
        self.durationMinutes = durationMinutes
        self.isCompletedToday = false
    }
}

struct PersonalGoal: Identifiable, Codable {
    let id: String
    let title: String
    let category: GoalCategory
    let isLongTerm: Bool
    let createdDate: Date
    var isCompleted: Bool
    var targetDate: Date?
    
    init(title: String, category: GoalCategory, isLongTerm: Bool, targetDate: Date? = nil) {
        self.id = UUID().uuidString
        self.title = title
        self.category = category
        self.isLongTerm = isLongTerm
        self.createdDate = Date()
        self.isCompleted = false
        self.targetDate = targetDate
    }
}

enum GoalCategory: String, CaseIterable, Codable {
    case health = "💪 Health"
    case relationships = "❤️ Relationships"
    case career = "🚀 Career"
    case spiritual = "✨ Spiritual"
    case financial = "💰 Financial"
    case creative = "🎨 Creative"
    case travel = "🌍 Travel"
    case learning = "📚 Learning"
}

enum BedtimeHonesty: String, Codable, CaseIterable {
    case hitTarget = "Hit my target"
    case slightlyLate = "Slightly late (< 30 min)"
    case late = "Late (30-60 min)"
    case wayLate = "Way late (1+ hours)"
    case didntTrack = "Didn't track"
}

struct DailyReport: Identifiable, Codable {
    let id: String
    let date: Date
    let screenTimeHours: Double
    let socialMediaMinutes: Int
    let moodRating: Int
    let gratitude: String
    let lessonsCompleted: Int
    let didMeditate: Bool
    let bedtimeHonesty: BedtimeHonesty
    let routineCompletion: Double
    let topWin: String
    let microCheckInsCompleted: Int
    
    init(date: Date, screenTimeHours: Double, socialMediaMinutes: Int, moodRating: Int, gratitude: String, lessonsCompleted: Int, didMeditate: Bool, bedtimeHonesty: BedtimeHonesty, routineCompletion: Double, topWin: String, microCheckInsCompleted: Int) {
        self.id = UUID().uuidString
        self.date = date
        self.screenTimeHours = screenTimeHours
        self.socialMediaMinutes = socialMediaMinutes
        self.moodRating = moodRating
        self.gratitude = gratitude
        self.lessonsCompleted = lessonsCompleted
        self.didMeditate = didMeditate
        self.bedtimeHonesty = bedtimeHonesty
        self.routineCompletion = routineCompletion
        self.topWin = topWin
        self.microCheckInsCompleted = microCheckInsCompleted
    }
    
    var overallScore: Int {
        var score = 0
        if moodRating >= 7 { score += 20 } else if moodRating >= 5 { score += 10 }
        if didMeditate { score += 15 }
        if lessonsCompleted > 0 { score += min(lessonsCompleted * 10, 20) }
        if routineCompletion >= 0.8 { score += 15 } else if routineCompletion >= 0.5 { score += 8 }
        if socialMediaMinutes < 30 { score += 15 } else if socialMediaMinutes < 60 { score += 8 }
        if bedtimeHonesty == .hitTarget { score += 15 } else if bedtimeHonesty == .slightlyLate { score += 8 }
        return min(score, 100)
    }
    
    var cosmicGrade: String {
        switch overallScore {
        case 80...100: return "🌟 Ultra Instinct"
        case 60..<80: return "⚡ Super Saiyan"
        case 40..<60: return "🔥 Powering Up"
        case 20..<40: return "🌱 Awakening"
        default: return "💤 Resting"
        }
    }
}

// MARK: - ═══════════════════════════════════════════════════
// MICRO CHECK-IN MODEL
// ═══════════════════════════════════════════════════════════

struct MicroCheckInQuestion {
    let question: String
    let emoji: String
    let answers: [MicroAnswer]
}

struct MicroAnswer {
    let text: String
    let isHealthy: Bool
    let feedback: String
}

struct MicroCheckInBank {
    
    static let questions: [MicroCheckInQuestion] = [
        MicroCheckInQuestion(
            question: "How much social media have you consumed today?",
            emoji: "📱",
            answers: [
                MicroAnswer(text: "Under 30 min", isHealthy: true, feedback: "Clean discipline. Your attention is your most valuable asset."),
                MicroAnswer(text: "30-60 min", isHealthy: true, feedback: "Moderate. Be intentional about the next hour."),
                MicroAnswer(text: "1-2 hours", isHealthy: false, feedback: "That's designed. The algorithm is optimized to steal exactly this much. Reclaim it."),
                MicroAnswer(text: "2+ hours", isHealthy: false, feedback: "The system won today. Tomorrow is a reset. No shame, just awareness."),
            ]
        ),
        MicroCheckInQuestion(
            question: "Did you consume any news that made you angry?",
            emoji: "📺",
            answers: [
                MicroAnswer(text: "No", isHealthy: true, feedback: "Good. Anger is the cheapest engagement tool they have."),
                MicroAnswer(text: "A little", isHealthy: true, feedback: "Notice the trigger. They engineer headlines to hijack your amygdala."),
                MicroAnswer(text: "Yes, a lot", isHealthy: false, feedback: "Outrage is profitable for them, costly for you. Your cortisol doesn't know it's 'just news.'"),
            ]
        ),
        MicroCheckInQuestion(
            question: "Did you buy anything impulsively today?",
            emoji: "🛒",
            answers: [
                MicroAnswer(text: "Nope", isHealthy: true, feedback: "Your impulse shield is strong. The marketers lost today."),
                MicroAnswer(text: "Small purchase", isHealthy: true, feedback: "Notice what triggered it. Was it an ad? A notification? A mood?"),
                MicroAnswer(text: "Yes, bigger purchase", isHealthy: false, feedback: "The dopamine hit fades in 48 hours. The charge doesn't. 24-hour rule next time."),
            ]
        ),
        MicroCheckInQuestion(
            question: "What's your energy level right now?",
            emoji: "⚡",
            answers: [
                MicroAnswer(text: "High & focused", isHealthy: true, feedback: "Perfect flow state territory. Use this window wisely."),
                MicroAnswer(text: "Moderate", isHealthy: true, feedback: "Steady is sustainable. Not every moment needs to be peak."),
                MicroAnswer(text: "Low / drained", isHealthy: false, feedback: "Check: water, food, sunlight, movement. Your body is signaling something."),
            ]
        ),
        MicroCheckInQuestion(
            question: "Have you moved your body today?",
            emoji: "🏃",
            answers: [
                MicroAnswer(text: "Yes, proper workout", isHealthy: true, feedback: "Your ancestors moved to survive. You moved to thrive. Respect."),
                MicroAnswer(text: "Some walking", isHealthy: true, feedback: "Movement is movement. Even 10 minutes rewires your nervous system."),
                MicroAnswer(text: "Not yet", isHealthy: false, feedback: "Even 5 minutes changes your brain chemistry. Stand up. Stretch. Start small."),
            ]
        ),
        MicroCheckInQuestion(
            question: "Have you had a real conversation today (not text)?",
            emoji: "🗣️",
            answers: [
                MicroAnswer(text: "Yes, meaningful one", isHealthy: true, feedback: "Human connection is the original technology. Nothing digital replaces it."),
                MicroAnswer(text: "Brief exchanges", isHealthy: true, feedback: "Even small real-world interactions regulate your nervous system."),
                MicroAnswer(text: "Only digital", isHealthy: false, feedback: "Your mirror neurons need real faces. Text flattens 90% of communication."),
            ]
        ),
    ]
    
    static func randomQuestion() -> MicroCheckInQuestion {
        questions.randomElement()!
    }
}
