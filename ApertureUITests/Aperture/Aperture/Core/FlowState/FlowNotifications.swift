// FlowNotifications.swift
// Aperture
//
// Flow State Notifications
// Reminders for focus blocks, weekly planning, and Haikai audits
//
// Integrates with existing NotificationManager

import Foundation
import UserNotifications
import SwiftUI


// MARK: - Flow Notification Types

enum FlowNotificationType: String, CaseIterable {
    case focusBlockStarting = "flow_focus_starting"
    case focusBlockEnding = "flow_focus_ending"
    case weeklyPlanning = "flow_weekly_planning"
    case dailyReview = "flow_daily_review"
    case haikaiReminder = "flow_haikai_reminder"
    case streakAtRisk = "flow_streak_risk"
    case socialMediaBudget = "flow_social_budget"
    case priorityDue = "flow_priority_due"
    
    var title: String {
        switch self {
        case .focusBlockStarting: return "🧠 Focus Time"
        case .focusBlockEnding: return "⏰ Focus Complete"
        case .weeklyPlanning: return "📅 Weekly Planning"
        case .dailyReview: return "🌙 Daily Review"
        case .haikaiReminder: return "✂️ Haikai Time"
        case .streakAtRisk: return "🔥 Streak at Risk!"
        case .socialMediaBudget: return "📱 Social Media"
        case .priorityDue: return "⚡ Priority Due"
        }
    }
    
    var categoryIdentifier: String {
        return "aperture_\(rawValue)"
    }
}


// MARK: - Flow Notification Manager

@MainActor
final class FlowNotificationManager: ObservableObject {
    
    static let shared = FlowNotificationManager()
    
    // MARK: - Published State
    
    @Published var focusRemindersEnabled = true
    @Published var weeklyPlanningEnabled = true
    @Published var dailyReviewEnabled = true
    @Published var priorityRemindersEnabled = true
    @Published var focusReminderMinutes = 5  // minutes before block starts
    @Published var weeklyPlanningDay = 1  // Sunday = 1
    @Published var weeklyPlanningHour = 10  // 10 AM
    @Published var dailyReviewHour = 21  // 9 PM
    
    // MARK: - Storage Keys
    
    private let defaults = UserDefaults.standard
    private let keys = (
        focusReminders: "flow.notifications.focusReminders",
        weeklyPlanning: "flow.notifications.weeklyPlanning",
        dailyReview: "flow.notifications.dailyReview",
        priorityReminders: "flow.notifications.priorityReminders",
        reminderMinutes: "flow.notifications.reminderMinutes",
        planningDay: "flow.notifications.planningDay",
        planningHour: "flow.notifications.planningHour",
        reviewHour: "flow.notifications.reviewHour"
    )
    
    // MARK: - Messages
    
    private let focusMessages = [
        "Time to enter flow state. Close distractions.",
        "Your focus block is about to begin. Get ready.",
        "Deep work time! Silence notifications.",
        "Focus mode: ON. The world can wait.",
        "Your best work happens now. Let's go."
    ]
    
    private let planningMessages = [
        "Ready to plan your week? 15 minutes well spent.",
        "Weekly planning ritual: Set your priorities.",
        "Take 15 min to design your ideal week.",
        "What matters most this week? Let's plan."
    ]
    
    private let reviewMessages = [
        "How was today? Quick 5-min reflection.",
        "End your day with intention. Review time.",
        "What wins did you have today?",
        "Capture insights before they fade."
    ]
    
    
    // MARK: - Initialization
    
    init() {
        loadSettings()
    }
    
    private func loadSettings() {
        focusRemindersEnabled = defaults.bool(forKey: keys.focusReminders)
        weeklyPlanningEnabled = defaults.bool(forKey: keys.weeklyPlanning)
        dailyReviewEnabled = defaults.bool(forKey: keys.dailyReview)
        priorityRemindersEnabled = defaults.bool(forKey: keys.priorityReminders)
        
        if defaults.object(forKey: keys.reminderMinutes) != nil {
            focusReminderMinutes = defaults.integer(forKey: keys.reminderMinutes)
        }
        if defaults.object(forKey: keys.planningDay) != nil {
            weeklyPlanningDay = defaults.integer(forKey: keys.planningDay)
        }
        if defaults.object(forKey: keys.planningHour) != nil {
            weeklyPlanningHour = defaults.integer(forKey: keys.planningHour)
        }
        if defaults.object(forKey: keys.reviewHour) != nil {
            dailyReviewHour = defaults.integer(forKey: keys.reviewHour)
        }
    }
    
    func saveSettings() {
        defaults.set(focusRemindersEnabled, forKey: keys.focusReminders)
        defaults.set(weeklyPlanningEnabled, forKey: keys.weeklyPlanning)
        defaults.set(dailyReviewEnabled, forKey: keys.dailyReview)
        defaults.set(priorityRemindersEnabled, forKey: keys.priorityReminders)
        defaults.set(focusReminderMinutes, forKey: keys.reminderMinutes)
        defaults.set(weeklyPlanningDay, forKey: keys.planningDay)
        defaults.set(weeklyPlanningHour, forKey: keys.planningHour)
        defaults.set(dailyReviewHour, forKey: keys.reviewHour)
    }
    
    
    // MARK: - Schedule Notifications
    
    /// Schedule all Flow notifications based on user settings
    func scheduleAllNotifications() {
        Task {
            // Remove old Flow notifications
            await removeAllFlowNotifications()
            
            // Schedule new ones
            if weeklyPlanningEnabled {
                await scheduleWeeklyPlanning()
            }
            
            if dailyReviewEnabled {
                await scheduleDailyReview()
            }
        }
    }
    
    /// Schedule notifications for today's focus blocks
    func scheduleFocusBlockReminders(blocks: [FocusBlock]) async {
        guard focusRemindersEnabled else { return }
        
        let center = UNUserNotificationCenter.current()
        
        // Remove old focus block notifications
        let pendingRequests = await center.pendingNotificationRequests()
        let focusIds = pendingRequests
            .filter { $0.identifier.hasPrefix("flow_focus_") }
            .map { $0.identifier }
        center.removePendingNotificationRequests(withIdentifiers: focusIds)
        
        // Schedule new ones
        for block in blocks where block.type == .deepWork {
            // Starting notification
            let startContent = UNMutableNotificationContent()
            startContent.title = FlowNotificationType.focusBlockStarting.title
            startContent.body = "\(block.title) starts in \(focusReminderMinutes) min. \(focusMessages.randomElement()!)"
            startContent.sound = .default
            startContent.categoryIdentifier = FlowNotificationType.focusBlockStarting.categoryIdentifier
            
            // Calculate trigger time
            let calendar = Calendar.current
            var triggerComponents = calendar.dateComponents([.year, .month, .day], from: block.date)
            triggerComponents.hour = block.startHour
            triggerComponents.minute = 0
            
            if let blockStart = calendar.date(from: triggerComponents),
               let reminderTime = calendar.date(byAdding: .minute, value: -focusReminderMinutes, to: blockStart),
               reminderTime > Date() {
                
                let triggerDate = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: reminderTime)
                let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: false)
                
                let request = UNNotificationRequest(
                    identifier: "flow_focus_start_\(block.id.uuidString)",
                    content: startContent,
                    trigger: trigger
                )
                
                try? await center.add(request)
            }
            
            // Ending notification
            let endContent = UNMutableNotificationContent()
            endContent.title = FlowNotificationType.focusBlockEnding.title
            endContent.body = "\(block.title) complete! Great work. Time for a break."
            endContent.sound = .default
            
            var endComponents = triggerComponents
            endComponents.hour = block.endHour
            
            if let blockEnd = calendar.date(from: endComponents), blockEnd > Date() {
                let endTriggerDate = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: blockEnd)
                let endTrigger = UNCalendarNotificationTrigger(dateMatching: endTriggerDate, repeats: false)
                
                let endRequest = UNNotificationRequest(
                    identifier: "flow_focus_end_\(block.id.uuidString)",
                    content: endContent,
                    trigger: endTrigger
                )
                
                try? await center.add(endRequest)
            }
        }
    }
    
    /// Schedule weekly planning reminder
    private func scheduleWeeklyPlanning() async {
        let content = UNMutableNotificationContent()
        content.title = FlowNotificationType.weeklyPlanning.title
        content.body = planningMessages.randomElement()!
        content.sound = .default
        content.categoryIdentifier = FlowNotificationType.weeklyPlanning.categoryIdentifier
        
        var dateComponents = DateComponents()
        dateComponents.weekday = weeklyPlanningDay
        dateComponents.hour = weeklyPlanningHour
        dateComponents.minute = 0
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        let request = UNNotificationRequest(
            identifier: "flow_weekly_planning",
            content: content,
            trigger: trigger
        )
        
        try? await UNUserNotificationCenter.current().add(request)
    }
    
    /// Schedule daily review reminder
    private func scheduleDailyReview() async {
        let content = UNMutableNotificationContent()
        content.title = FlowNotificationType.dailyReview.title
        content.body = reviewMessages.randomElement()!
        content.sound = .default
        content.categoryIdentifier = FlowNotificationType.dailyReview.categoryIdentifier
        
        var dateComponents = DateComponents()
        dateComponents.hour = dailyReviewHour
        dateComponents.minute = 0
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        let request = UNNotificationRequest(
            identifier: "flow_daily_review",
            content: content,
            trigger: trigger
        )
        
        try? await UNUserNotificationCenter.current().add(request)
    }
    
    /// Schedule priority due reminder
    func schedulePriorityReminder(for item: PriorityItem) async {
        guard priorityRemindersEnabled, let dueDate = item.dueDate else { return }
        
        let content = UNMutableNotificationContent()
        content.title = FlowNotificationType.priorityDue.title
        content.body = "\(item.priority.shortLabel): \(item.title)"
        content.sound = .default
        content.categoryIdentifier = FlowNotificationType.priorityDue.categoryIdentifier
        content.userInfo = ["priorityId": item.id.uuidString]
        
        // Remind 1 hour before for P1, morning of for others
        let reminderDate: Date
        if item.priority == .p1 {
            reminderDate = Calendar.current.date(byAdding: .hour, value: -1, to: dueDate) ?? dueDate
        } else {
            var components = Calendar.current.dateComponents([.year, .month, .day], from: dueDate)
            components.hour = 9
            reminderDate = Calendar.current.date(from: components) ?? dueDate
        }
        
        guard reminderDate > Date() else { return }
        
        let triggerDate = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: reminderDate)
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: false)
        
        let request = UNNotificationRequest(
            identifier: "flow_priority_\(item.id.uuidString)",
            content: content,
            trigger: trigger
        )
        
        try? await UNUserNotificationCenter.current().add(request)
    }
    
    /// Schedule social media budget reminder
    func scheduleSocialMediaReminder(budgetMinutes: Int, usedMinutes: Int) async {
        // If they've used 80% of budget
        guard usedMinutes >= Int(Double(budgetMinutes) * 0.8) else { return }
        
        let content = UNMutableNotificationContent()
        content.title = FlowNotificationType.socialMediaBudget.title
        content.body = "You've used \(usedMinutes)/\(budgetMinutes) minutes today. Time to disconnect?"
        content.sound = .default
        
        // Immediate notification
        let request = UNNotificationRequest(
            identifier: "flow_social_budget_\(Date().timeIntervalSince1970)",
            content: content,
            trigger: nil
        )
        
        try? await UNUserNotificationCenter.current().add(request)
    }
    
    
    // MARK: - Remove Notifications
    
    private func removeAllFlowNotifications() async {
        let center = UNUserNotificationCenter.current()
        let pending = await center.pendingNotificationRequests()
        
        let flowIds = pending
            .filter { $0.identifier.hasPrefix("flow_") }
            .map { $0.identifier }
        
        center.removePendingNotificationRequests(withIdentifiers: flowIds)
    }
    
    func removePriorityReminder(for itemId: UUID) {
        UNUserNotificationCenter.current().removePendingNotificationRequests(
            withIdentifiers: ["flow_priority_\(itemId.uuidString)"]
        )
    }
    
    
    // MARK: - Register Categories
    
    func registerCategories() {
        let center = UNUserNotificationCenter.current()
        
        // Focus block actions
        let startFocusAction = UNNotificationAction(
            identifier: "START_FOCUS",
            title: "Enter Flow",
            options: [.foreground]
        )
        
        let snoozeAction = UNNotificationAction(
            identifier: "SNOOZE_5MIN",
            title: "5 more minutes",
            options: []
        )
        
        let focusCategory = UNNotificationCategory(
            identifier: FlowNotificationType.focusBlockStarting.categoryIdentifier,
            actions: [startFocusAction, snoozeAction],
            intentIdentifiers: [],
            options: []
        )
        
        // Weekly planning actions
        let planNowAction = UNNotificationAction(
            identifier: "PLAN_NOW",
            title: "Plan Now",
            options: [.foreground]
        )
        
        let planLaterAction = UNNotificationAction(
            identifier: "PLAN_LATER",
            title: "Remind in 1 hour",
            options: []
        )
        
        let planningCategory = UNNotificationCategory(
            identifier: FlowNotificationType.weeklyPlanning.categoryIdentifier,
            actions: [planNowAction, planLaterAction],
            intentIdentifiers: [],
            options: []
        )
        
        // Priority actions
        let completeAction = UNNotificationAction(
            identifier: "COMPLETE_PRIORITY",
            title: "Mark Complete",
            options: []
        )
        
        let viewAction = UNNotificationAction(
            identifier: "VIEW_PRIORITY",
            title: "View",
            options: [.foreground]
        )
        
        let priorityCategory = UNNotificationCategory(
            identifier: FlowNotificationType.priorityDue.categoryIdentifier,
            actions: [completeAction, viewAction],
            intentIdentifiers: [],
            options: []
        )
        
        center.setNotificationCategories([focusCategory, planningCategory, priorityCategory])
    }
}


// MARK: - Flow Notification Settings View

struct FlowNotificationSettingsView: View {
    
    @StateObject private var manager = FlowNotificationManager.shared
    @StateObject private var notificationManager = NotificationManager.shared
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(hex: "#0a0a1a")
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 24) {
                        authorizationCard
                        focusRemindersSection
                        planningRemindersSection
                        priorityRemindersSection
                    }
                    .padding()
                }
            }
            .navigationTitle("Flow Notifications")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        manager.saveSettings()
                        manager.scheduleAllNotifications()
                        dismiss()
                    }
                    .fontWeight(.semibold)
                    .foregroundColor(Color(hex: "#7C4DFF"))
                }
            }
        }
    }
    
    private var authorizationCard: some View {
        VStack(spacing: 12) {
            HStack {
                Image(systemName: notificationManager.isAuthorized ? "bell.badge.fill" : "bell.slash.fill")
                    .foregroundColor(notificationManager.isAuthorized ? .green : .red)
                
                Text(notificationManager.isAuthorized ? "Notifications Enabled" : "Notifications Disabled")
                    .foregroundColor(.white)
                
                Spacer()
            }
            
            if !notificationManager.isAuthorized {
                Button("Enable Notifications") {
                    Task {
                        await notificationManager.requestAuthorization()
                    }
                }
                .font(.subheadline.bold())
                .foregroundColor(Color(hex: "#7C4DFF"))
            }
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(16)
    }
    
    private var focusRemindersSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("FOCUS BLOCKS")
                .font(.caption.bold())
                .foregroundColor(.white.opacity(0.5))
                .tracking(1)
            
            Toggle("Focus block reminders", isOn: $manager.focusRemindersEnabled)
                .toggleStyle(SwitchToggleStyle(tint: Color(hex: "#7C4DFF")))
                .foregroundColor(.white)
            
            if manager.focusRemindersEnabled {
                HStack {
                    Text("Remind me")
                        .foregroundColor(.white.opacity(0.7))
                    
                    Picker("", selection: $manager.focusReminderMinutes) {
                        Text("5 min").tag(5)
                        Text("10 min").tag(10)
                        Text("15 min").tag(15)
                        Text("30 min").tag(30)
                    }
                    .pickerStyle(.menu)
                    .tint(Color(hex: "#7C4DFF"))
                    
                    Text("before")
                        .foregroundColor(.white.opacity(0.7))
                }
                .font(.subheadline)
            }
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(16)
    }
    
    private var planningRemindersSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("PLANNING RITUALS")
                .font(.caption.bold())
                .foregroundColor(.white.opacity(0.5))
                .tracking(1)
            
            Toggle("Weekly planning reminder", isOn: $manager.weeklyPlanningEnabled)
                .toggleStyle(SwitchToggleStyle(tint: Color(hex: "#7C4DFF")))
                .foregroundColor(.white)
            
            if manager.weeklyPlanningEnabled {
                HStack {
                    Picker("Day", selection: $manager.weeklyPlanningDay) {
                        Text("Sunday").tag(1)
                        Text("Saturday").tag(7)
                        Text("Monday").tag(2)
                    }
                    .pickerStyle(.menu)
                    .tint(Color(hex: "#7C4DFF"))
                    
                    Text("at")
                        .foregroundColor(.white.opacity(0.7))
                    
                    Picker("Hour", selection: $manager.weeklyPlanningHour) {
                        ForEach(6..<22) { hour in
                            Text(formatHour(hour)).tag(hour)
                        }
                    }
                    .pickerStyle(.menu)
                    .tint(Color(hex: "#7C4DFF"))
                }
                .font(.subheadline)
            }
            
            Divider()
                .background(Color.white.opacity(0.1))
            
            Toggle("Daily review reminder", isOn: $manager.dailyReviewEnabled)
                .toggleStyle(SwitchToggleStyle(tint: Color(hex: "#7C4DFF")))
                .foregroundColor(.white)
            
            if manager.dailyReviewEnabled {
                HStack {
                    Text("Every day at")
                        .foregroundColor(.white.opacity(0.7))
                    
                    Picker("Hour", selection: $manager.dailyReviewHour) {
                        ForEach(17..<24) { hour in
                            Text(formatHour(hour)).tag(hour)
                        }
                    }
                    .pickerStyle(.menu)
                    .tint(Color(hex: "#7C4DFF"))
                }
                .font(.subheadline)
            }
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(16)
    }
    
    private var priorityRemindersSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("PRIORITIES")
                .font(.caption.bold())
                .foregroundColor(.white.opacity(0.5))
                .tracking(1)
            
            Toggle("Priority due date reminders", isOn: $manager.priorityRemindersEnabled)
                .toggleStyle(SwitchToggleStyle(tint: Color(hex: "#7C4DFF")))
                .foregroundColor(.white)
            
            if manager.priorityRemindersEnabled {
                Text("P1 items: 1 hour before\nP2-P5 items: Morning of due date")
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.5))
            }
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(16)
    }
    
    private func formatHour(_ hour: Int) -> String {
        let h = hour % 12 == 0 ? 12 : hour % 12
        let ampm = hour < 12 ? "AM" : "PM"
        return "\(h) \(ampm)"
    }
}


#Preview {
    FlowNotificationSettingsView()
}
