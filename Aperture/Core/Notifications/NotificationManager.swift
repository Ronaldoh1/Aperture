// NotificationManager.swift
// Handle local and remote push notifications for Aperture
// Daily reminders, Dragon wisdom, practice prompts

import Foundation
import UserNotifications
import SwiftUI

// MARK: - Notification Types

enum ApertureNotificationType: String, CaseIterable {
    case dailyReminder = "daily_reminder"
    case dragonWisdom = "dragon_wisdom"
    case practicePrompt = "practice_prompt"
    case streakWarning = "streak_warning"
    case courseProgress = "course_progress"
    case achievement = "achievement"
    
    var title: String {
        switch self {
        case .dailyReminder: return "Time to Awaken"
        case .dragonWisdom: return "🐉 Dragon Wisdom"
        case .practicePrompt: return "Practice Reminder"
        case .streakWarning: return "Keep Your Streak!"
        case .courseProgress: return "Continue Learning"
        case .achievement: return "Achievement Unlocked!"
        }
    }
    
    var categoryIdentifier: String {
        return "aperture_\(rawValue)"
    }
}

// MARK: - Notification Manager

@MainActor
class NotificationManager: ObservableObject {
    
    static let shared = NotificationManager()
    
    // MARK: - Published State
    
    @Published var isAuthorized: Bool = false
    @Published var dailyReminderEnabled: Bool = false
    @Published var dragonWisdomEnabled: Bool = false
    @Published var practicePromptsEnabled: Bool = false
    @Published var streakWarningsEnabled: Bool = true
    @Published var reminderTime: Date = Calendar.current.date(from: DateComponents(hour: 9, minute: 0)) ?? Date()
    
    // MARK: - Storage Keys
    
    private let keys = (
        dailyReminder: "aperture.notifications.dailyReminder",
        dragonWisdom: "aperture.notifications.dragonWisdom",
        practicePrompts: "aperture.notifications.practicePrompts",
        streakWarnings: "aperture.notifications.streakWarnings",
        reminderHour: "aperture.notifications.reminderHour",
        reminderMinute: "aperture.notifications.reminderMinute"
    )
    
    // MARK: - Dragon Wisdom Messages
    
    private let dragonWisdomMessages = [
        "The truth you seek is not hidden—it is ignored. Open your eyes today.",
        "Every tradition points to the same summit. What path calls to you?",
        "What they call heresy is often the truth they fear. Keep questioning.",
        "Awakening is not escape from the world—it is seeing the world clearly.",
        "The serpent they demonized carries the medicine they fear you'll find.",
        "You were born awake. You were taught to sleep. Time to remember.",
        "The patterns repeat across centuries. Once you see them, everything changes.",
        "Your practice today ripples through all your tomorrows.",
        "The Demiurge keeps you distracted. What truth are you avoiding?",
        "Sophia waits within you. Her wisdom is your birthright.",
        "The spark of the divine is not in the sky—it's in your chest.",
        "They burned the library but the truth survives. You are the library now.",
        "Every saint was once a heretic. Every heretic glimpsed something real.",
        "The kingdom is within. No church, no guru, no app can give it to you.",
        "Your Dragon grows as you grow. What will you feed it today?"
    ]
    
    private let practicePrompts = [
        "Take 3 conscious breaths right now. Feel your body.",
        "Notice something beautiful in your environment. Presence is practice.",
        "Your chakras are energy centers. Scan your body—where do you feel tension?",
        "Ask yourself: What belief am I holding that doesn't serve me?",
        "The breath is always with you. Return to it now.",
        "Observe your thoughts without judgment for 60 seconds.",
        "Ground yourself: Feel your feet. You are here. You are safe.",
        "What would you do today if you weren't afraid?",
        "Send loving-kindness to someone who challenges you.",
        "Notice the space between thoughts. That's where you live."
    ]
    
    // MARK: - Initialization
    
    private init() {
        loadSettings()
        checkAuthorizationStatus()
    }
    
    // MARK: - Authorization
    
    func requestAuthorization() async -> Bool {
        do {
            let center = UNUserNotificationCenter.current()
            let granted = try await center.requestAuthorization(options: [.alert, .sound, .badge])
            
            await MainActor.run {
                self.isAuthorized = granted
            }
            
            if granted {
                registerCategories()
            }
            
            return granted
        } catch {
            print("Notification authorization error: \(error)")
            return false
        }
    }
    
    func checkAuthorizationStatus() {
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            Task { @MainActor in
                self.isAuthorized = settings.authorizationStatus == .authorized
            }
        }
    }
    
    private func registerCategories() {
        let center = UNUserNotificationCenter.current()
        
        // Daily reminder category with actions
        let openAction = UNNotificationAction(
            identifier: "OPEN_APP",
            title: "Open Aperture",
            options: [.foreground]
        )
        
        let remindLaterAction = UNNotificationAction(
            identifier: "REMIND_LATER",
            title: "Remind in 1 hour",
            options: []
        )
        
        let dailyCategory = UNNotificationCategory(
            identifier: ApertureNotificationType.dailyReminder.categoryIdentifier,
            actions: [openAction, remindLaterAction],
            intentIdentifiers: [],
            options: []
        )
        
        let dragonCategory = UNNotificationCategory(
            identifier: ApertureNotificationType.dragonWisdom.categoryIdentifier,
            actions: [openAction],
            intentIdentifiers: [],
            options: []
        )
        
        center.setNotificationCategories([dailyCategory, dragonCategory])
    }
    
    // MARK: - Schedule Notifications
    
    func updateDailyReminder(enabled: Bool, time: Date? = nil) {
        dailyReminderEnabled = enabled
        if let time = time {
            reminderTime = time
        }
        
        saveSettings()
        
        // Remove existing
        removeNotifications(ofType: .dailyReminder)
        
        if enabled {
            scheduleDailyReminder()
        }
    }
    
    func updateDragonWisdom(enabled: Bool) {
        dragonWisdomEnabled = enabled
        saveSettings()
        
        removeNotifications(ofType: .dragonWisdom)
        
        if enabled {
            scheduleDragonWisdom()
        }
    }
    
    func updatePracticePrompts(enabled: Bool) {
        practicePromptsEnabled = enabled
        saveSettings()
        
        removeNotifications(ofType: .practicePrompt)
        
        if enabled {
            schedulePracticePrompts()
        }
    }
    
    private func scheduleDailyReminder() {
        let content = UNMutableNotificationContent()
        content.title = "🌅 Time to Awaken"
        content.body = "Your daily practice awaits. The path to gnosis is walked one step at a time."
        content.sound = .default
        content.categoryIdentifier = ApertureNotificationType.dailyReminder.categoryIdentifier
        
        let components = Calendar.current.dateComponents([.hour, .minute], from: reminderTime)
        let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: true)
        
        let request = UNNotificationRequest(
            identifier: "aperture_daily_reminder",
            content: content,
            trigger: trigger
        )
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error scheduling daily reminder: \(error)")
            }
        }
    }
    
    private func scheduleDragonWisdom() {
        // Schedule random wisdom at noon each day
        for i in 0..<7 {
            let content = UNMutableNotificationContent()
            content.title = "🐉 Dragon Wisdom"
            content.body = dragonWisdomMessages.randomElement() ?? "The truth awaits within."
            content.sound = .default
            content.categoryIdentifier = ApertureNotificationType.dragonWisdom.categoryIdentifier
            
            var components = DateComponents()
            components.hour = 12
            components.minute = 0
            
            // Add days offset
            if let futureDate = Calendar.current.date(byAdding: .day, value: i, to: Date()) {
                let dayComponents = Calendar.current.dateComponents([.year, .month, .day], from: futureDate)
                components.year = dayComponents.year
                components.month = dayComponents.month
                components.day = dayComponents.day
            }
            
            let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
            
            let request = UNNotificationRequest(
                identifier: "aperture_dragon_wisdom_\(i)",
                content: content,
                trigger: trigger
            )
            
            UNUserNotificationCenter.current().add(request)
        }
    }
    
    private func schedulePracticePrompts() {
        // Schedule 3 random prompts throughout the day for the next week
        let times = [10, 14, 18] // 10 AM, 2 PM, 6 PM
        
        for day in 0..<7 {
            for (index, hour) in times.enumerated() {
                let content = UNMutableNotificationContent()
                content.title = "🧘 Micro-Practice"
                content.body = practicePrompts.randomElement() ?? "Take a breath."
                content.sound = .default
                content.categoryIdentifier = ApertureNotificationType.practicePrompt.categoryIdentifier
                
                var components = DateComponents()
                components.hour = hour
                components.minute = 0
                
                if let futureDate = Calendar.current.date(byAdding: .day, value: day, to: Date()) {
                    let dayComponents = Calendar.current.dateComponents([.year, .month, .day], from: futureDate)
                    components.year = dayComponents.year
                    components.month = dayComponents.month
                    components.day = dayComponents.day
                }
                
                let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
                
                let request = UNNotificationRequest(
                    identifier: "aperture_practice_\(day)_\(index)",
                    content: content,
                    trigger: trigger
                )
                
                UNUserNotificationCenter.current().add(request)
            }
        }
    }
    
    func scheduleStreakWarning() {
        guard streakWarningsEnabled else { return }
        
        let content = UNMutableNotificationContent()
        content.title = "🔥 Keep Your Streak!"
        content.body = "You haven't practiced today. Don't let your streak end—even 1 minute counts."
        content.sound = .default
        content.categoryIdentifier = ApertureNotificationType.streakWarning.categoryIdentifier
        
        // Schedule for 8 PM if user hasn't practiced today
        var components = DateComponents()
        components.hour = 20
        components.minute = 0
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
        
        let request = UNNotificationRequest(
            identifier: "aperture_streak_warning",
            content: content,
            trigger: trigger
        )
        
        UNUserNotificationCenter.current().add(request)
    }
    
    func cancelStreakWarning() {
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["aperture_streak_warning"])
    }
    
    func scheduleAchievementNotification(title: String, description: String) {
        let content = UNMutableNotificationContent()
        content.title = "🏆 \(title)"
        content.body = description
        content.sound = .default
        content.categoryIdentifier = ApertureNotificationType.achievement.categoryIdentifier
        
        // Immediate notification
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        
        let request = UNNotificationRequest(
            identifier: "aperture_achievement_\(UUID().uuidString)",
            content: content,
            trigger: trigger
        )
        
        UNUserNotificationCenter.current().add(request)
    }
    
    // MARK: - Remove Notifications
    
    private func removeNotifications(ofType type: ApertureNotificationType) {
        let center = UNUserNotificationCenter.current()
        
        switch type {
        case .dailyReminder:
            center.removePendingNotificationRequests(withIdentifiers: ["aperture_daily_reminder"])
        case .dragonWisdom:
            let ids = (0..<7).map { "aperture_dragon_wisdom_\($0)" }
            center.removePendingNotificationRequests(withIdentifiers: ids)
        case .practicePrompt:
            let ids = (0..<7).flatMap { day in
                (0..<3).map { "aperture_practice_\(day)_\($0)" }
            }
            center.removePendingNotificationRequests(withIdentifiers: ids)
        case .streakWarning:
            center.removePendingNotificationRequests(withIdentifiers: ["aperture_streak_warning"])
        default:
            break
        }
    }
    
    func removeAllNotifications() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
    }
    
    // MARK: - Persistence
    
    private func loadSettings() {
        dailyReminderEnabled = UserDefaults.standard.bool(forKey: keys.dailyReminder)
        dragonWisdomEnabled = UserDefaults.standard.bool(forKey: keys.dragonWisdom)
        practicePromptsEnabled = UserDefaults.standard.bool(forKey: keys.practicePrompts)
        streakWarningsEnabled = UserDefaults.standard.object(forKey: keys.streakWarnings) as? Bool ?? true
        
        let hour = UserDefaults.standard.integer(forKey: keys.reminderHour)
        let minute = UserDefaults.standard.integer(forKey: keys.reminderMinute)
        
        if hour > 0 || minute > 0 {
            reminderTime = Calendar.current.date(from: DateComponents(hour: hour, minute: minute)) ?? reminderTime
        }
    }
    
    private func saveSettings() {
        UserDefaults.standard.set(dailyReminderEnabled, forKey: keys.dailyReminder)
        UserDefaults.standard.set(dragonWisdomEnabled, forKey: keys.dragonWisdom)
        UserDefaults.standard.set(practicePromptsEnabled, forKey: keys.practicePrompts)
        UserDefaults.standard.set(streakWarningsEnabled, forKey: keys.streakWarnings)
        
        let components = Calendar.current.dateComponents([.hour, .minute], from: reminderTime)
        UserDefaults.standard.set(components.hour ?? 9, forKey: keys.reminderHour)
        UserDefaults.standard.set(components.minute ?? 0, forKey: keys.reminderMinute)
    }
}

// MARK: - Notification Settings View

struct NotificationSettingsView: View {
    
    @StateObject private var manager = NotificationManager.shared
    @State private var showTimePickerSheet = false
    
    var body: some View {
        List {
            // Authorization section
            if !manager.isAuthorized {
                Section(footer: Text("Allow notifications to receive daily reminders and Dragon wisdom.")) {
                    Button(action: {
                        Task {
                            await manager.requestAuthorization()
                        }
                    }) {
                        HStack {
                            Image(systemName: "bell.badge")
                                .foregroundColor(Palette.accent.gold)
                            Text("Enable Notifications")
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            
            Section(header: Text("Daily Reminder")) {
                Toggle("Morning Reminder", isOn: Binding(
                    get: { manager.dailyReminderEnabled },
                    set: { manager.updateDailyReminder(enabled: $0) }
                ))
                
                if manager.dailyReminderEnabled {
                    Button(action: { showTimePickerSheet = true }) {
                        HStack {
                            Text("Reminder Time")
                            Spacer()
                            Text(manager.reminderTime.formatted(date: .omitted, time: .shortened))
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
            
            Section(header: Text("Dragon Wisdom"), footer: Text("Receive daily wisdom from your Dragon companion at noon.")) {
                Toggle("Daily Dragon Message", isOn: Binding(
                    get: { manager.dragonWisdomEnabled },
                    set: { manager.updateDragonWisdom(enabled: $0) }
                ))
            }
            
            Section(header: Text("Practice Prompts"), footer: Text("Get brief practice prompts throughout the day to stay present.")) {
                Toggle("Micro-Practice Reminders", isOn: Binding(
                    get: { manager.practicePromptsEnabled },
                    set: { manager.updatePracticePrompts(enabled: $0) }
                ))
            }
            
            Section(header: Text("Streak Protection"), footer: Text("Get reminded at 8 PM if you haven't practiced that day.")) {
                Toggle("Streak Warnings", isOn: $manager.streakWarningsEnabled)
            }
        }
        .navigationTitle("Notifications")
        .sheet(isPresented: $showTimePickerSheet) {
            TimePickerSheet(
                time: $manager.reminderTime,
                onSave: {
                    manager.updateDailyReminder(enabled: true, time: manager.reminderTime)
                }
            )
        }
    }
}

struct TimePickerSheet: View {
    @Binding var time: Date
    let onSave: () -> Void
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            VStack {
                DatePicker(
                    "Reminder Time",
                    selection: $time,
                    displayedComponents: .hourAndMinute
                )
                .datePickerStyle(.wheel)
                .labelsHidden()
                
                Spacer()
            }
            .padding()
            .navigationTitle("Set Time")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") { dismiss() }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        onSave()
                        dismiss()
                    }
                    .fontWeight(.bold)
                }
            }
        }
    }
}

// MARK: - Preview

#Preview {
    NavigationStack {
        NotificationSettingsView()
    }
}
