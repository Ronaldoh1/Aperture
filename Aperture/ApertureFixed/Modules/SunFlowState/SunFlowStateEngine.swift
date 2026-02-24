// SunFlowStateEngine.swift
// The core engine — manages compass, pillars, tasks, blueprints, scorecards, bootcamp progress.
// All data stored locally via UserDefaults/JSON. Nothing leaves the device. Ever.
// ☀️ SunFlow: Reignited

import SwiftUI
import Combine

// MARK: - ═══════════════════════════════════════════════════
// SUN FLOW STATE ENGINE — Central coordinator
// ═══════════════════════════════════════════════════════════

@MainActor
final class SunFlowStateEngine: ObservableObject {
    
    static let shared = SunFlowStateEngine()
    
    // MARK: - Published State
    @Published var compass = NextLevelCompass()
    @Published var bootcamp = BootcampProgress()
    @Published var currentBlueprint: WeeklyBlueprint?
    @Published var monthlyTargets: [MonthlyTarget] = []
    @Published var errorLog: [ErrorLogEntry] = []
    @Published var controlPurgeItems: [ControlPurgeItem] = []
    @Published var fearPurgeItems: [FearPurgeItem] = []
    @Published var currentScorecard: ExecutionScorecard?
    @Published var hasCompletedOnboarding = false
    
    private let defaults = UserDefaults.standard
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    private init() { loadAll() }
    
    // MARK: - Compass
    
    func saveCompass() {
        save(compass, key: "sunflow_compass")
    }
    
    func addPillar(_ pillar: FlowPillar) {
        guard compass.pillars.count < 5 else { return }
        compass.pillars.append(pillar)
        saveCompass()
    }
    
    func removePillar(at index: Int) {
        guard compass.pillars.indices.contains(index) else { return }
        compass.pillars.remove(at: index)
        saveCompass()
    }
    
    func setChangeScale(_ level: ChangeScaleLevel) {
        compass.changeScaleLevel = level
        saveCompass()
    }
    
    // MARK: - Bootcamp
    
    func startBootcamp() {
        bootcamp.startDate = Date()
        bootcamp.currentDay = 1
        bootcamp.stillnessMinutesTarget = 5
        saveBootcamp()
    }
    
    func completeStillness(day: Int) {
        bootcamp.stillnessCompletedDays.insert(day)
        if day > 7 { bootcamp.stillnessMinutesTarget = 10 }
        advanceBootcampDay()
        saveBootcamp()
    }
    
    func completeBootcampExercise(_ exercise: BootcampExercise) {
        switch exercise {
        case .controlPurge: bootcamp.controlPurgeDone = true
        case .fearPurge: bootcamp.fearPurgeDone = true
        case .digitalPurge: bootcamp.digitalPurgeDone = true
        case .socialization: bootcamp.socializationProtocolRead = true
        case .newsProtocol: bootcamp.newsProtocolRead = true
        case .sayingNo: bootcamp.sayingNoFrameworkRead = true
        }
        checkBootcampCompletion()
        saveBootcamp()
    }
    
    private func advanceBootcampDay() {
        if let start = bootcamp.startDate {
            let daysSinceStart = Calendar.current.dateComponents([.day], from: start, to: Date()).day ?? 0
            bootcamp.currentDay = min(daysSinceStart + 1, 14)
        }
    }
    
    private func checkBootcampCompletion() {
        if bootcamp.stillnessCompletedDays.count >= 14
            && bootcamp.controlPurgeDone && bootcamp.fearPurgeDone
            && bootcamp.digitalPurgeDone && bootcamp.socializationProtocolRead
            && bootcamp.newsProtocolRead && bootcamp.sayingNoFrameworkRead {
            bootcamp.isComplete = true
        }
    }
    
    // MARK: - Monthly Targets
    
    func addMonthlyTarget(_ target: MonthlyTarget) {
        guard monthlyTargets.count < 3 else { return }
        monthlyTargets.append(target)
        save(monthlyTargets, key: "sunflow_monthly_targets")
    }
    
    func completeMonthlyTarget(_ id: String) {
        if let idx = monthlyTargets.firstIndex(where: { $0.id == id }) {
            monthlyTargets[idx].isCompleted = true
            save(monthlyTargets, key: "sunflow_monthly_targets")
        }
    }
    
    func clearMonthlyTargets() {
        monthlyTargets.removeAll()
        save(monthlyTargets, key: "sunflow_monthly_targets")
    }
    
    // MARK: - Weekly Blueprint
    
    func createBlueprint() -> WeeklyBlueprint {
        let start = Calendar.current.date(from: Calendar.current.dateComponents([.yearForWeekOfYear, .weekOfYear], from: Date())) ?? Date()
        let blueprint = WeeklyBlueprint(weekStartDate: start)
        currentBlueprint = blueprint
        saveBlueprint()
        return blueprint
    }
    
    func addTask(_ task: FlowTask) {
        currentBlueprint?.tasks.append(task)
        saveBlueprint()
    }
    
    func completeTask(_ taskId: String) {
        if let idx = currentBlueprint?.tasks.firstIndex(where: { $0.id == taskId }) {
            currentBlueprint?.tasks[idx].isCompleted = true
            saveBlueprint()
        }
    }
    
    func removeTask(_ taskId: String) {
        currentBlueprint?.tasks.removeAll { $0.id == taskId }
        saveBlueprint()
    }
    
    func bucketTask(_ taskId: String, as bucket: FlowBucket) {
        if let idx = currentBlueprint?.tasks.firstIndex(where: { $0.id == taskId }) {
            currentBlueprint?.tasks[idx].bucket = bucket
            if bucket == .p4 {
                log404Error(item: currentBlueprint?.tasks[idx].title ?? "Task", category: .random)
            }
            saveBlueprint()
        }
    }
    
    // Dynamic Prioritization: sort tasks by priority score
    var prioritizedTasks: [FlowTask] {
        let tasks = currentBlueprint?.tasks.filter { $0.bucket != .p4 && !$0.isCompleted } ?? []
        return tasks.sorted { $0.priorityScore > $1.priorityScore }
    }
    
    // MARK: - Execution Scorecard
    
    func calculateWeeklyScore() -> WeeklyScore {
        guard let bp = currentBlueprint else { return WeeklyScore(weekNumber: 1) }
        
        let weekNum = Calendar.current.component(.weekOfMonth, from: Date())
        var score = WeeklyScore(weekNumber: weekNum)
        score.executionPercent = bp.completionPercent
        
        let p0p1 = bp.tasks.filter { $0.bucket == .p0 || $0.bucket == .p1 }
        if !p0p1.isEmpty {
            score.p0p1Completion = Double(p0p1.filter(\.isCompleted).count) / Double(p0p1.count)
        }
        score.errorCount = bp.errorCount
        
        return score
    }
    
    var needsPhaseZeroReset: Bool {
        guard let sc = currentScorecard else { return false }
        return sc.overallExecution < 0.7
    }
    
    // MARK: - 404 Error Log
    
    func log404Error(item: String, category: ErrorCategory) {
        let entry = ErrorLogEntry(item: item, category: category)
        errorLog.insert(entry, at: 0)
        if errorLog.count > 200 { errorLog = Array(errorLog.prefix(200)) }
        save(errorLog, key: "sunflow_error_log")
    }
    
    var errorStreak: Int {
        // Days with at least one 404 logged
        let calendar = Calendar.current
        var streak = 0
        var checkDate = calendar.startOfDay(for: Date())
        
        for _ in 0..<365 {
            let hasEntry = errorLog.contains { calendar.isDate($0.date, inSameDayAs: checkDate) }
            if hasEntry {
                streak += 1
                checkDate = calendar.date(byAdding: .day, value: -1, to: checkDate) ?? checkDate
            } else {
                break
            }
        }
        return streak
    }
    
    // MARK: - Control Purge
    
    func addControlItem(_ item: ControlPurgeItem) {
        controlPurgeItems.append(item)
        save(controlPurgeItems, key: "sunflow_control_purge")
    }
    
    func removeControlItem(_ id: String) {
        controlPurgeItems.removeAll { $0.id == id }
        save(controlPurgeItems, key: "sunflow_control_purge")
    }
    
    // MARK: - Fear Purge
    
    func addFearItem(_ item: FearPurgeItem) {
        fearPurgeItems.append(item)
        save(fearPurgeItems, key: "sunflow_fear_purge")
    }
    
    func removeFearItem(_ id: String) {
        fearPurgeItems.removeAll { $0.id == id }
        save(fearPurgeItems, key: "sunflow_fear_purge")
    }
    
    // MARK: - Onboarding
    
    func completeOnboarding() {
        hasCompletedOnboarding = true
        defaults.set(true, forKey: "sunflow_onboarded")
    }
    
    // MARK: - Persistence Helpers
    
    private func save<T: Encodable>(_ value: T, key: String) {
        if let data = try? encoder.encode(value) {
            defaults.set(data, forKey: key)
        }
    }
    
    private func load<T: Decodable>(_ type: T.Type, key: String) -> T? {
        guard let data = defaults.data(forKey: key) else { return nil }
        return try? decoder.decode(type, from: data)
    }
    
    private func saveBootcamp() { save(bootcamp, key: "sunflow_bootcamp") }
    private func saveBlueprint() {
        if let bp = currentBlueprint { save(bp, key: "sunflow_current_blueprint") }
    }
    
    private func loadAll() {
        hasCompletedOnboarding = defaults.bool(forKey: "sunflow_onboarded")
        if let c: NextLevelCompass = load(NextLevelCompass.self, key: "sunflow_compass") { compass = c }
        if let b: BootcampProgress = load(BootcampProgress.self, key: "sunflow_bootcamp") { bootcamp = b }
        if let bp: WeeklyBlueprint = load(WeeklyBlueprint.self, key: "sunflow_current_blueprint") { currentBlueprint = bp }
        if let mt: [MonthlyTarget] = load([MonthlyTarget].self, key: "sunflow_monthly_targets") { monthlyTargets = mt }
        if let el: [ErrorLogEntry] = load([ErrorLogEntry].self, key: "sunflow_error_log") { errorLog = el }
        if let cp: [ControlPurgeItem] = load([ControlPurgeItem].self, key: "sunflow_control_purge") { controlPurgeItems = cp }
        if let fp: [FearPurgeItem] = load([FearPurgeItem].self, key: "sunflow_fear_purge") { fearPurgeItems = fp }
        if let sc: ExecutionScorecard = load(ExecutionScorecard.self, key: "sunflow_scorecard") { currentScorecard = sc }
    }
}

// MARK: - Bootcamp Exercise Enum
enum BootcampExercise: String, CaseIterable {
    case controlPurge = "Control Purge"
    case fearPurge = "Fear Purge"
    case digitalPurge = "404 Digital Purge"
    case socialization = "Socialization Protocol"
    case newsProtocol = "News Protocol"
    case sayingNo = "Saying No Framework"
}
