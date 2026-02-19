// FlowOrchestrator.swift
// Aperture
//
// Flow State Orchestration System
// Haikai your life - remove distractions, optimize for flow
//
// Features:
// - Distraction audit & removal suggestions
// - Calendar integration & optimization
// - Priority triage (1-5 levels)
// - Social media hygiene challenges
// - Notification management
// - Weekly planning ritual
// - Circadian rhythm flow windows

import Foundation
import SwiftUI
import EventKit
import Combine


// MARK: - Flow Orchestrator Manager

@MainActor
final class FlowOrchestrator: ObservableObject {
    
    static let shared = FlowOrchestrator()
    
    // MARK: - Dependencies
    
    private let eventStore = EKEventStore()
    private let defaults = UserDefaults.standard
    private let calendar = Calendar.current
    
    // MARK: - Published State
    
    @Published var isCalendarAuthorized = false
    @Published var userProfile: FlowUserProfile?
    @Published var weeklyPlan: WeeklyFlowPlan?
    @Published var todaysFocusBlocks: [FocusBlock] = []
    @Published var distractionAudit: DistractionAudit?
    @Published var priorityInbox: [PriorityItem] = []
    @Published var currentStreak: Int = 0
    
    // MARK: - Keys
    
    private let profileKey = "flow_user_profile"
    private let weeklyPlanKey = "flow_weekly_plan"
    private let priorityInboxKey = "flow_priority_inbox"
    
    
    // MARK: - Initialization
    
    init() {
        loadUserProfile()
        loadWeeklyPlan()
        loadPriorityInbox()
        checkCalendarAuthorization()
    }
    
    
    // MARK: - Calendar Authorization
    
    func requestCalendarAccess() async -> Bool {
        do {
            let granted = try await eventStore.requestFullAccessToEvents()
            await MainActor.run {
                isCalendarAuthorized = granted
            }
            return granted
        } catch {
            print("Calendar access error: \(error)")
            return false
        }
    }
    
    private func checkCalendarAuthorization() {
        let status = EKEventStore.authorizationStatus(for: .event)
        isCalendarAuthorized = (status == .fullAccess)
    }
    
    
    // MARK: - User Profile
    
    func saveUserProfile(_ profile: FlowUserProfile) {
        userProfile = profile
        if let encoded = try? JSONEncoder().encode(profile) {
            defaults.set(encoded, forKey: profileKey)
        }
        
        // Generate optimal flow windows based on profile
        generateFlowWindows()
    }
    
    private func loadUserProfile() {
        guard let data = defaults.data(forKey: profileKey),
              let decoded = try? JSONDecoder().decode(FlowUserProfile.self, from: data) else {
            return
        }
        userProfile = decoded
    }
    
    
    // MARK: - Flow Window Generation
    
    func generateFlowWindows() {
        guard let profile = userProfile else { return }
        
        var blocks: [FocusBlock] = []
        let today = Date()
        
        // Based on circadian rhythm preference
        switch profile.circadianType {
        case .earlyBird:
            // Best focus: 6-10 AM
            blocks.append(FocusBlock(
                id: UUID(),
                title: "Morning Deep Work",
                startHour: 6,
                endHour: 10,
                type: .deepWork,
                date: today
            ))
            
        case .nightOwl:
            // Best focus: 9 PM - 1 AM
            blocks.append(FocusBlock(
                id: UUID(),
                title: "Night Deep Work",
                startHour: 21,
                endHour: 25, // 1 AM next day
                type: .deepWork,
                date: today
            ))
            
        case .balanced:
            // Best focus: 10 AM - 12 PM, 3-5 PM
            blocks.append(FocusBlock(
                id: UUID(),
                title: "Morning Focus",
                startHour: 10,
                endHour: 12,
                type: .deepWork,
                date: today
            ))
            blocks.append(FocusBlock(
                id: UUID(),
                title: "Afternoon Focus",
                startHour: 15,
                endHour: 17,
                type: .deepWork,
                date: today
            ))
        }
        
        // Add breaks
        blocks.append(FocusBlock(
            id: UUID(),
            title: "Mindful Break",
            startHour: 12,
            endHour: 13,
            type: .break,
            date: today
        ))
        
        todaysFocusBlocks = blocks.sorted { $0.startHour < $1.startHour }
    }
    
    
    // MARK: - Calendar Analysis
    
    func analyzeCalendar() async -> CalendarAnalysis? {
        guard isCalendarAuthorized else { return nil }
        
        let startDate = Date()
        let endDate = calendar.date(byAdding: .day, value: 7, to: startDate)!
        
        let predicate = eventStore.predicateForEvents(
            withStart: startDate,
            end: endDate,
            calendars: nil
        )
        
        let events = eventStore.events(matching: predicate)
        
        // Analyze events
        var totalMeetingHours: Double = 0
        var potentialHaikais: [HaikaiSuggestion] = []
        let fragmentedBlocks: [Date] = []
        
        for event in events {
            let duration = event.endDate.timeIntervalSince(event.startDate) / 3600
            totalMeetingHours += duration
            
            // Check for meetings that could be emails
            if let title = event.title?.lowercased() {
                if title.contains("sync") || title.contains("standup") || title.contains("update") {
                    if duration >= 0.5 {
                        potentialHaikais.append(HaikaiSuggestion(
                            id: UUID(),
                            eventTitle: event.title ?? "Meeting",
                            eventDate: event.startDate,
                            suggestion: "Could this be an async update instead?",
                            timeSaved: duration * 0.5,
                            category: .meeting
                        ))
                    }
                }
                
                // Short fragmented meetings
                if duration < 0.5 {
                    potentialHaikais.append(HaikaiSuggestion(
                        id: UUID(),
                        eventTitle: event.title ?? "Quick Meeting",
                        eventDate: event.startDate,
                        suggestion: "Batch short meetings together",
                        timeSaved: 0.25,
                        category: .fragmentation
                    ))
                }
            }
        }
        
        return CalendarAnalysis(
            totalMeetingHours: totalMeetingHours,
            averageMeetingsPerDay: totalMeetingHours / 7,
            potentialHaikais: potentialHaikais,
            estimatedTimeSavings: potentialHaikais.reduce(0) { $0 + $1.timeSaved },
            fragmentedDays: fragmentedBlocks.count
        )
    }
    
    
    // MARK: - Distraction Audit
    
    func runDistractionAudit() -> DistractionAudit {
        guard let profile = userProfile else {
            return DistractionAudit.empty
        }
        
        var suggestions: [DistractionSuggestion] = []
        var totalTimeSaved: Double = 0
        
        // Social Media Analysis
        let socialMediaMinutes = profile.currentSocialMediaMinutes
        if socialMediaMinutes > 30 {
            let suggestion = DistractionSuggestion(
                id: UUID(),
                category: .socialMedia,
                title: "Reduce Social Media",
                description: "You're spending \(socialMediaMinutes) min/day. Try starting with \(max(10, socialMediaMinutes / 2)) min.",
                currentTime: Double(socialMediaMinutes),
                suggestedTime: Double(max(10, socialMediaMinutes / 2)),
                challenge: "Try 10 min/day for 1 week"
            )
            suggestions.append(suggestion)
            totalTimeSaved += Double(socialMediaMinutes - max(10, socialMediaMinutes / 2))
        }
        
        // Email Checking
        let emailChecks = profile.emailChecksPerDay
        if emailChecks > 3 {
            suggestions.append(DistractionSuggestion(
                id: UUID(),
                category: .email,
                title: "Batch Email Checking",
                description: "You check email \(emailChecks)x/day. Try 3 dedicated times.",
                currentTime: Double(emailChecks * 15),
                suggestedTime: 45,
                challenge: "Check email only at 9 AM, 1 PM, 5 PM"
            ))
            totalTimeSaved += Double((emailChecks - 3) * 15)
        }
        
        // Notifications
        if !profile.hasOptimizedNotifications {
            suggestions.append(DistractionSuggestion(
                id: UUID(),
                category: .notifications,
                title: "Notification Haikai",
                description: "Turn off all notifications except: calls, texts from VIPs, calendar",
                currentTime: 60, // estimated distraction time
                suggestedTime: 10,
                challenge: "Go notification-free for 24 hours"
            ))
            totalTimeSaved += 50
        }
        
        // Meetings
        if profile.averageMeetingHoursPerDay > 3 {
            suggestions.append(DistractionSuggestion(
                id: UUID(),
                category: .meetings,
                title: "Meeting Diet",
                description: "\(Int(profile.averageMeetingHoursPerDay))+ hours in meetings daily. Decline or shorten.",
                currentTime: profile.averageMeetingHoursPerDay * 60,
                suggestedTime: 2 * 60,
                challenge: "Decline one meeting this week"
            ))
            totalTimeSaved += (profile.averageMeetingHoursPerDay - 2) * 60
        }
        
        let audit = DistractionAudit(
            createdAt: Date(),
            suggestions: suggestions,
            totalPotentialTimeSaved: totalTimeSaved,
            flowScore: calculateFlowScore(suggestions: suggestions)
        )
        
        distractionAudit = audit
        return audit
    }
    
    private func calculateFlowScore(suggestions: [DistractionSuggestion]) -> Int {
        // 100 = optimal, lower = more distractions
        let baseScore = 100
        let penalty = suggestions.count * 15
        return max(0, baseScore - penalty)
    }
    
    
    // MARK: - Priority Triage
    
    func addPriorityItem(_ item: PriorityItem) {
        priorityInbox.append(item)
        priorityInbox.sort { $0.priority.rawValue < $1.priority.rawValue }
        savePriorityInbox()
    }
    
    func updateItemPriority(_ itemId: UUID, priority: Priority) {
        if let index = priorityInbox.firstIndex(where: { $0.id == itemId }) {
            priorityInbox[index].priority = priority
            priorityInbox.sort { $0.priority.rawValue < $1.priority.rawValue }
            savePriorityInbox()
        }
    }
    
    func archiveItem(_ itemId: UUID) {
        priorityInbox.removeAll { $0.id == itemId }
        savePriorityInbox()
    }
    
    func getItemsByPriority(_ priority: Priority) -> [PriorityItem] {
        priorityInbox.filter { $0.priority == priority }
    }
    
    private func savePriorityInbox() {
        if let encoded = try? JSONEncoder().encode(priorityInbox) {
            defaults.set(encoded, forKey: priorityInboxKey)
        }
    }
    
    private func loadPriorityInbox() {
        guard let data = defaults.data(forKey: priorityInboxKey),
              let decoded = try? JSONDecoder().decode([PriorityItem].self, from: data) else {
            return
        }
        priorityInbox = decoded
    }
    
    
    // MARK: - Weekly Planning
    
    func createWeeklyPlan(_ plan: WeeklyFlowPlan) {
        weeklyPlan = plan
        if let encoded = try? JSONEncoder().encode(plan) {
            defaults.set(encoded, forKey: weeklyPlanKey)
        }
        
        // Schedule reminder for next Sunday
        scheduleWeeklyPlanningReminder()
    }
    
    private func loadWeeklyPlan() {
        guard let data = defaults.data(forKey: weeklyPlanKey),
              let decoded = try? JSONDecoder().decode(WeeklyFlowPlan.self, from: data) else {
            return
        }
        weeklyPlan = decoded
    }
    
    private func scheduleWeeklyPlanningReminder() {
        // This would schedule a local notification for Sunday
        // Implementation depends on notification setup
    }
    
    
    // MARK: - Social Media Challenge
    
    func getSocialMediaChallenge(currentLevel: Int) -> SocialMediaChallenge {
        switch currentLevel {
        case 0:
            return SocialMediaChallenge(
                level: 1,
                title: "Starter",
                dailyMinutes: 30,
                description: "30 minutes per day, max 3 check-ins",
                durationDays: 7
            )
        case 1:
            return SocialMediaChallenge(
                level: 2,
                title: "Focused",
                dailyMinutes: 15,
                description: "15 minutes per day, 2 check-ins",
                durationDays: 7
            )
        case 2:
            return SocialMediaChallenge(
                level: 3,
                title: "Minimalist",
                dailyMinutes: 10,
                description: "10 minutes per day, 1 check-in",
                durationDays: 14
            )
        case 3:
            return SocialMediaChallenge(
                level: 4,
                title: "Monk Mode",
                dailyMinutes: 20,
                description: "20 minutes every OTHER day",
                durationDays: 14
            )
        default:
            return SocialMediaChallenge(
                level: 5,
                title: "Digital Ascetic",
                dailyMinutes: 20,
                description: "20 minutes twice per WEEK",
                durationDays: 30
            )
        }
    }
}


// MARK: - Data Models

struct FlowUserProfile: Codable {
    var id: UUID = UUID()
    var name: String
    
    // Work schedule
    var workStartHour: Int  // 0-23
    var workEndHour: Int
    var workDays: [Int]     // 1=Sun, 2=Mon, etc.
    
    // Circadian preference
    var circadianType: CircadianType
    
    // Current habits (for audit)
    var currentSocialMediaMinutes: Int
    var emailChecksPerDay: Int
    var averageMeetingHoursPerDay: Double
    var hasOptimizedNotifications: Bool
    
    // Goals
    var dailyFlowHoursGoal: Int
    var topPriorities: [String]  // Top 3-5 priorities
    
    // VIPs - people whose messages always get through
    var vipContacts: [String]
}

enum CircadianType: String, Codable, CaseIterable {
    case earlyBird = "Early Bird"
    case nightOwl = "Night Owl"
    case balanced = "Balanced"
    
    var description: String {
        switch self {
        case .earlyBird: return "Best energy in the morning (6-10 AM)"
        case .nightOwl: return "Best energy at night (9 PM - 1 AM)"
        case .balanced: return "Steady energy, peaks mid-morning and afternoon"
        }
    }
    
    var icon: String {
        switch self {
        case .earlyBird: return "sunrise.fill"
        case .nightOwl: return "moon.stars.fill"
        case .balanced: return "sun.max.fill"
        }
    }
}

struct FocusBlock: Identifiable, Codable {
    let id: UUID
    var title: String
    var startHour: Int
    var endHour: Int
    var type: FocusBlockType
    var date: Date
    
    var timeRange: String {
        let startFormatted = formatHour(startHour)
        let endFormatted = formatHour(endHour % 24)
        return "\(startFormatted) - \(endFormatted)"
    }
    
    private func formatHour(_ hour: Int) -> String {
        let h = hour % 12 == 0 ? 12 : hour % 12
        let ampm = hour < 12 || hour == 24 ? "AM" : "PM"
        return "\(h) \(ampm)"
    }
}

enum FocusBlockType: String, Codable {
    case deepWork = "Deep Work"
    case shallowWork = "Shallow Work"
    case meetings = "Meetings"
    case `break` = "Break"
    case personal = "Personal"
    
    var color: Color {
        switch self {
        case .deepWork: return Color(hex: "#7C4DFF")
        case .shallowWork: return Color(hex: "#00BCD4")
        case .meetings: return Color(hex: "#FF9800")
        case .break: return Color(hex: "#4CAF50")
        case .personal: return Color(hex: "#E040FB")
        }
    }
    
    var icon: String {
        switch self {
        case .deepWork: return "brain.head.profile"
        case .shallowWork: return "envelope.fill"
        case .meetings: return "person.3.fill"
        case .break: return "leaf.fill"
        case .personal: return "heart.fill"
        }
    }
}


// MARK: - Calendar Analysis

struct CalendarAnalysis {
    let totalMeetingHours: Double
    let averageMeetingsPerDay: Double
    let potentialHaikais: [HaikaiSuggestion]
    let estimatedTimeSavings: Double
    let fragmentedDays: Int
}

struct HaikaiSuggestion: Identifiable {
    let id: UUID
    let eventTitle: String
    let eventDate: Date
    let suggestion: String
    let timeSaved: Double  // hours
    let category: HaikaiCategory
}

enum HaikaiCategory: String {
    case meeting = "Meeting"
    case fragmentation = "Fragmentation"
    case recurring = "Recurring"
    case tooLong = "Too Long"
}


// MARK: - Distraction Audit

struct DistractionAudit: Codable {
    let createdAt: Date
    let suggestions: [DistractionSuggestion]
    let totalPotentialTimeSaved: Double  // minutes per day
    let flowScore: Int  // 0-100
    
    static let empty = DistractionAudit(
        createdAt: Date(),
        suggestions: [],
        totalPotentialTimeSaved: 0,
        flowScore: 100
    )
    
    var formattedTimeSaved: String {
        if totalPotentialTimeSaved >= 60 {
            let hours = Int(totalPotentialTimeSaved / 60)
            let minutes = Int(totalPotentialTimeSaved.truncatingRemainder(dividingBy: 60))
            return "\(hours)h \(minutes)m"
        }
        return "\(Int(totalPotentialTimeSaved))m"
    }
}

struct DistractionSuggestion: Identifiable, Codable {
    let id: UUID
    let category: DistractionCategory
    let title: String
    let description: String
    let currentTime: Double  // minutes
    let suggestedTime: Double
    let challenge: String
    
    var timeSaved: Double {
        currentTime - suggestedTime
    }
}

enum DistractionCategory: String, Codable {
    case socialMedia = "Social Media"
    case email = "Email"
    case notifications = "Notifications"
    case meetings = "Meetings"
    case news = "News"
    case entertainment = "Entertainment"
    
    var icon: String {
        switch self {
        case .socialMedia: return "iphone"
        case .email: return "envelope.fill"
        case .notifications: return "bell.fill"
        case .meetings: return "person.3.fill"
        case .news: return "newspaper.fill"
        case .entertainment: return "tv.fill"
        }
    }
    
    var color: Color {
        switch self {
        case .socialMedia: return .pink
        case .email: return .blue
        case .notifications: return .orange
        case .meetings: return .purple
        case .news: return .gray
        case .entertainment: return .red
        }
    }
}


// MARK: - Priority System

struct PriorityItem: Identifiable, Codable {
    let id: UUID
    var title: String
    var description: String?
    var priority: Priority
    var source: PrioritySource
    var createdAt: Date
    var dueDate: Date?
    var isCompleted: Bool = false
    var completedAt: Date?
}

enum Priority: Int, Codable, CaseIterable {
    case p1 = 1  // Critical - must do today
    case p2 = 2  // Important - this week
    case p3 = 3  // Should do - this month
    case p4 = 4  // Nice to have
    case p5 = 5  // Archive/Maybe
    
    var label: String {
        switch self {
        case .p1: return "🔴 P1 - Critical"
        case .p2: return "🟠 P2 - Important"
        case .p3: return "🟡 P3 - Should Do"
        case .p4: return "🟢 P4 - Nice to Have"
        case .p5: return "⚪ P5 - Archive"
        }
    }
    
    var shortLabel: String {
        switch self {
        case .p1: return "P1"
        case .p2: return "P2"
        case .p3: return "P3"
        case .p4: return "P4"
        case .p5: return "P5"
        }
    }
    
    var color: Color {
        switch self {
        case .p1: return .red
        case .p2: return .orange
        case .p3: return .yellow
        case .p4: return .green
        case .p5: return .gray
        }
    }
}

enum PrioritySource: String, Codable {
    case email = "Email"
    case calendar = "Calendar"
    case manual = "Manual"
    case slack = "Slack"
    case other = "Other"
}


// MARK: - Weekly Planning

struct WeeklyFlowPlan: Codable {
    let id: UUID
    let weekStarting: Date
    var topThreePriorities: [String]
    var focusBlocks: [FocusBlock]
    var socialMediaBudget: Int  // minutes per day
    var emailWindows: [Int]  // hours when checking email (e.g., [9, 13, 17])
    var reflectionNotes: String?
    var createdAt: Date
    
    var isCurrentWeek: Bool {
        let calendar = Calendar.current
        let now = Date()
        let weekStart = calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: now))!
        return calendar.isDate(weekStarting, inSameDayAs: weekStart)
    }
}


// MARK: - Social Media Challenge

struct SocialMediaChallenge: Identifiable {
    let id = UUID()
    let level: Int
    let title: String
    let dailyMinutes: Int
    let description: String
    let durationDays: Int
    
    var checkInsAllowed: Int {
        switch level {
        case 1: return 3
        case 2: return 2
        case 3: return 1
        case 4: return 1  // every other day
        default: return 1  // twice per week
        }
    }
}
