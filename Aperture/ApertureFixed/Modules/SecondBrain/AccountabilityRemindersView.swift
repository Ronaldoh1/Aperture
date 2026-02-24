// AccountabilityRemindersView.swift
// ACCOUNTABILITY REMINDERS — "Your External Prefrontal Cortex"
// ☀️ SunFlow: Reignited × Second Brain
//
// "The ADHD brain doesn't forget because it doesn't care.
//  It forgets because working memory has 3 slots
//  and life has 3,000 demands.
//  This is your external memory system."
//
// ALL local. UNUserNotificationCenter only.
// Zero backend. Zero API. Zero server.
// Notifications scheduled on-device.

import SwiftUI
import UserNotifications

// MARK: - ═══════════════════════════════════════════════════
// ACCOUNTABILITY REMINDERS VIEW
// ═══════════════════════════════════════════════════════════

struct AccountabilityRemindersView: View {
    
    @Environment(\.dismiss) var dismiss
    @StateObject private var manager = ReminderManager()
    @State private var showAddReminder = false
    @State private var selectedCategory: ReminderCategory = .tasks
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 0.02, green: 0.03, blue: 0.06).ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 16) {
                        headerView
                        permissionBanner
                        quickReminders
                        categorySelector
                        remindersList
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
                        Image(systemName: "bell.badge.fill").font(.system(size: 14)).foregroundColor(.cyan)
                        Text("Reminders").font(.system(size: 17, weight: .bold)).foregroundColor(.white)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button { showAddReminder = true } label: {
                        Image(systemName: "plus.circle.fill").font(.system(size: 20)).foregroundColor(.cyan)
                    }
                }
            }
            .sheet(isPresented: $showAddReminder) {
                AddReminderSheet(manager: manager)
            }
            .onAppear { manager.requestPermission() }
        }
    }
    
    // MARK: - Header
    
    private var headerView: some View {
        VStack(spacing: 8) {
            Text("🔔").font(.system(size: 44))
            Text("ACCOUNTABILITY\nREMINDERS").font(.system(size: 20, weight: .black)).tracking(1).foregroundColor(.white).multilineTextAlignment(.center)
            Text("Your external prefrontal cortex.\nBecause ADHD working memory has 3 slots and life has 3,000 demands.")
                .font(.system(size: 11, weight: .medium)).foregroundColor(.white.opacity(0.3)).multilineTextAlignment(.center)
        }
    }
    
    // MARK: - Permission Banner
    
    @ViewBuilder
    private var permissionBanner: some View {
        if !manager.hasPermission {
            HStack(spacing: 10) {
                Image(systemName: "exclamationmark.triangle.fill").foregroundColor(.orange)
                VStack(alignment: .leading, spacing: 2) {
                    Text("Notifications Disabled").font(.system(size: 12, weight: .bold)).foregroundColor(.white)
                    Text("Enable notifications to get reminders. Without them, this feature can't help you.")
                        .font(.system(size: 10, weight: .medium)).foregroundColor(.white.opacity(0.4))
                }
                Spacer()
                Button { manager.openSettings() } label: {
                    Text("ENABLE").font(.system(size: 10, weight: .black)).foregroundColor(.black)
                        .padding(.horizontal, 12).padding(.vertical, 6).background(Capsule().fill(Color.orange))
                }
            }
            .padding(12).background(RoundedRectangle(cornerRadius: 10).fill(Color.orange.opacity(0.05))
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.orange.opacity(0.1), lineWidth: 1)))
        }
    }
    
    // MARK: - Quick Reminders (One-Tap)
    
    private var quickReminders: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("QUICK SET").font(.system(size: 9, weight: .black)).tracking(1).foregroundColor(.white.opacity(0.2))
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    quickReminderChip("💧", "Hydrate", "Every 2 hours") { manager.scheduleHydration() }
                    quickReminderChip("🧘", "Breathe", "3x daily") { manager.scheduleBreathing() }
                    quickReminderChip("🚶", "Move", "Every 90 min") { manager.scheduleMovement() }
                    quickReminderChip("🌙", "Wind Down", "9:30 PM") { manager.scheduleWindDown() }
                    quickReminderChip("☀️", "Check In", "Morning") { manager.scheduleMorningCheckIn() }
                    quickReminderChip("📱", "Screen Break", "Every hour") { manager.scheduleScreenBreak() }
                }
            }
        }
    }
    
    private func quickReminderChip(_ emoji: String, _ title: String, _ timing: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            VStack(spacing: 4) {
                Text(emoji).font(.system(size: 20))
                Text(title).font(.system(size: 10, weight: .bold)).foregroundColor(.white)
                Text(timing).font(.system(size: 8, weight: .medium)).foregroundColor(.cyan.opacity(0.5))
            }
            .frame(width: 72, height: 72)
            .background(RoundedRectangle(cornerRadius: 12).fill(Color.white.opacity(0.02))
                .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.cyan.opacity(0.06), lineWidth: 1)))
        }
    }
    
    // MARK: - Category Selector
    
    private var categorySelector: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                ForEach(ReminderCategory.allCases, id: \.self) { cat in
                    Button {
                        withAnimation { selectedCategory = cat }
                    } label: {
                        Text(cat.label).font(.system(size: 10, weight: .bold))
                            .foregroundColor(selectedCategory == cat ? .black : .white.opacity(0.4))
                            .padding(.horizontal, 12).padding(.vertical, 6)
                            .background(Capsule().fill(selectedCategory == cat ? Color.cyan.opacity(0.7) : Color.white.opacity(0.03)))
                    }
                }
            }
        }
    }
    
    // MARK: - Reminders List
    
    private var remindersList: some View {
        VStack(spacing: 8) {
            let filtered = manager.reminders.filter { $0.category == selectedCategory }
            if filtered.isEmpty {
                emptyState
            } else {
                ForEach(filtered) { reminder in
                    reminderCard(reminder)
                }
            }
        }
    }
    
    private var emptyState: some View {
        VStack(spacing: 8) {
            Text("No reminders in this category yet").font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.2))
            Text("Tap + to add one, or use Quick Set above").font(.system(size: 10, weight: .medium)).foregroundColor(.white.opacity(0.15))
        }
        .padding(30)
    }
    
    private func reminderCard(_ reminder: ApertureReminder) -> some View {
        HStack(spacing: 12) {
            Text(reminder.emoji).font(.system(size: 20)).frame(width: 30)
            VStack(alignment: .leading, spacing: 2) {
                Text(reminder.title).font(.system(size: 13, weight: .bold)).foregroundColor(.white)
                Text(reminder.scheduleDescription).font(.system(size: 10, weight: .medium)).foregroundColor(.cyan.opacity(0.5))
                if let message = reminder.customMessage {
                    Text(message).font(.system(size: 10, weight: .medium)).foregroundColor(.white.opacity(0.3))
                }
            }
            Spacer()
            Toggle("", isOn: Binding(
                get: { reminder.isEnabled },
                set: { newValue in manager.toggleReminder(id: reminder.id, enabled: newValue) }
            ))
            .labelsHidden().tint(.cyan)
        }
        .padding(12).background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.02))
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.cyan.opacity(0.04), lineWidth: 1)))
        .swipeActions(edge: .trailing) {
            Button(role: .destructive) { manager.deleteReminder(id: reminder.id) } label: {
                Label("Delete", systemImage: "trash")
            }
        }
    }
}

// MARK: - ═══════════════════════════════════════════════════
// ADD REMINDER SHEET
// ═══════════════════════════════════════════════════════════

struct AddReminderSheet: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var manager: ReminderManager
    
    @State private var title = ""
    @State private var emoji = "🔔"
    @State private var category: ReminderCategory = .tasks
    @State private var tone: ReminderTone = .gentle
    @State private var frequency: ReminderFrequency = .daily
    @State private var time = Date()
    @State private var customMessage = ""
    @State private var selectedDays: Set<Int> = [2, 3, 4, 5, 6] // Mon-Fri
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 0.02, green: 0.03, blue: 0.06).ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 16) {
                        // Title
                        VStack(alignment: .leading, spacing: 4) {
                            Text("WHAT TO REMEMBER").font(.system(size: 9, weight: .black)).tracking(1).foregroundColor(.white.opacity(0.2))
                            TextField("e.g., Take meds, Drink water, Call mom", text: $title)
                                .font(.system(size: 14, weight: .medium)).foregroundColor(.white)
                                .padding(12).background(RoundedRectangle(cornerRadius: 8).fill(Color.white.opacity(0.03)))
                        }
                        
                        // Category
                        VStack(alignment: .leading, spacing: 4) {
                            Text("CATEGORY").font(.system(size: 9, weight: .black)).tracking(1).foregroundColor(.white.opacity(0.2))
                            LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))], spacing: 6) {
                                ForEach(ReminderCategory.allCases, id: \.self) { cat in
                                    Button { category = cat } label: {
                                        Text(cat.label).font(.system(size: 10, weight: .bold))
                                            .foregroundColor(category == cat ? .black : .white.opacity(0.4))
                                            .padding(.horizontal, 10).padding(.vertical, 6)
                                            .background(Capsule().fill(category == cat ? Color.cyan.opacity(0.7) : Color.white.opacity(0.03)))
                                    }
                                }
                            }
                        }
                        
                        // Tone
                        VStack(alignment: .leading, spacing: 4) {
                            Text("TONE").font(.system(size: 9, weight: .black)).tracking(1).foregroundColor(.white.opacity(0.2))
                            HStack(spacing: 8) {
                                ForEach(ReminderTone.allCases, id: \.self) { t in
                                    Button { tone = t } label: {
                                        VStack(spacing: 2) {
                                            Text(t.emoji).font(.system(size: 16))
                                            Text(t.label).font(.system(size: 9, weight: .bold))
                                                .foregroundColor(tone == t ? .black : .white.opacity(0.4))
                                        }
                                        .padding(8)
                                        .background(RoundedRectangle(cornerRadius: 8).fill(tone == t ? Color.cyan.opacity(0.7) : Color.white.opacity(0.03)))
                                    }
                                }
                            }
                        }
                        
                        // Frequency
                        VStack(alignment: .leading, spacing: 4) {
                            Text("FREQUENCY").font(.system(size: 9, weight: .black)).tracking(1).foregroundColor(.white.opacity(0.2))
                            HStack(spacing: 8) {
                                ForEach(ReminderFrequency.allCases, id: \.self) { f in
                                    Button { frequency = f } label: {
                                        Text(f.label).font(.system(size: 10, weight: .bold))
                                            .foregroundColor(frequency == f ? .black : .white.opacity(0.4))
                                            .padding(.horizontal, 10).padding(.vertical, 6)
                                            .background(Capsule().fill(frequency == f ? Color.cyan.opacity(0.7) : Color.white.opacity(0.03)))
                                    }
                                }
                            }
                        }
                        
                        // Time
                        DatePicker("Time", selection: $time, displayedComponents: .hourAndMinute)
                            .datePickerStyle(.wheel).labelsHidden().colorScheme(.dark)
                        
                        // Days (for weekly)
                        if frequency == .weekly || frequency == .weekdays {
                            VStack(alignment: .leading, spacing: 4) {
                                Text("DAYS").font(.system(size: 9, weight: .black)).tracking(1).foregroundColor(.white.opacity(0.2))
                                HStack(spacing: 4) {
                                    ForEach(Array(["S","M","T","W","T","F","S"].enumerated()), id: \.offset) { index, day in
                                        Button {
                                            if selectedDays.contains(index + 1) { selectedDays.remove(index + 1) }
                                            else { selectedDays.insert(index + 1) }
                                        } label: {
                                            Text(day).font(.system(size: 11, weight: .bold))
                                                .foregroundColor(selectedDays.contains(index + 1) ? .black : .white.opacity(0.3))
                                                .frame(width: 34, height: 34)
                                                .background(Circle().fill(selectedDays.contains(index + 1) ? Color.cyan.opacity(0.7) : Color.white.opacity(0.03)))
                                        }
                                    }
                                }
                            }
                        }
                        
                        // Custom message
                        VStack(alignment: .leading, spacing: 4) {
                            Text("CUSTOM MESSAGE (optional)").font(.system(size: 9, weight: .black)).tracking(1).foregroundColor(.white.opacity(0.2))
                            TextField("e.g., You got this! / Don't forget!", text: $customMessage)
                                .font(.system(size: 12, weight: .medium)).foregroundColor(.white)
                                .padding(10).background(RoundedRectangle(cornerRadius: 8).fill(Color.white.opacity(0.03)))
                        }
                        
                        // Save
                        Button {
                            guard !title.isEmpty else { return }
                            manager.addReminder(ApertureReminder(
                                id: UUID().uuidString, title: title, emoji: emoji, category: category,
                                tone: tone, frequency: frequency, time: time, days: Array(selectedDays),
                                customMessage: customMessage.isEmpty ? nil : customMessage, isEnabled: true
                            ))
                            dismiss()
                        } label: {
                            Text("SET REMINDER").font(.system(size: 13, weight: .black)).tracking(1)
                                .foregroundColor(.black).frame(maxWidth: .infinity).padding(14)
                                .background(RoundedRectangle(cornerRadius: 12).fill(Color.cyan))
                        }
                    }
                    .padding(20)
                }
            }
            .navigationTitle("New Reminder")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Cancel") { dismiss() }.foregroundColor(.white.opacity(0.4))
                }
            }
        }
    }
}

// MARK: - ═══════════════════════════════════════════════════
// REMINDER MANAGER — All local, UserDefaults persistence
// ═══════════════════════════════════════════════════════════

class ReminderManager: ObservableObject {
    
    @Published var reminders: [ApertureReminder] = []
    @Published var hasPermission = false
    
    private let center = UNUserNotificationCenter.current()
    private let storageKey = "aperture_reminders"
    
    init() { loadReminders(); checkPermission() }
    
    func requestPermission() {
        center.requestAuthorization(options: [.alert, .sound, .badge]) { [weak self] granted, _ in
            DispatchQueue.main.async { self?.hasPermission = granted }
        }
    }
    
    func checkPermission() {
        center.getNotificationSettings { [weak self] settings in
            DispatchQueue.main.async { self?.hasPermission = settings.authorizationStatus == .authorized }
        }
    }
    
    func openSettings() {
        if let url = URL(string: UIApplication.openSettingsURLString) { UIApplication.shared.open(url) }
    }
    
    func addReminder(_ reminder: ApertureReminder) {
        reminders.append(reminder)
        scheduleNotification(for: reminder)
        saveReminders()
    }
    
    func toggleReminder(id: String, enabled: Bool) {
        guard let index = reminders.firstIndex(where: { $0.id == id }) else { return }
        reminders[index].isEnabled = enabled
        if enabled { scheduleNotification(for: reminders[index]) }
        else { center.removePendingNotificationRequests(withIdentifiers: [id]) }
        saveReminders()
    }
    
    func deleteReminder(id: String) {
        reminders.removeAll { $0.id == id }
        center.removePendingNotificationRequests(withIdentifiers: [id])
        saveReminders()
    }
    
    // MARK: - Quick Schedules
    
    func scheduleHydration() {
        let times = [8, 10, 12, 14, 16, 18, 20]
        for hour in times {
            let r = ApertureReminder(id: "hydrate_\(hour)", title: "Drink Water", emoji: "💧", category: .health,
                tone: .gentle, frequency: .daily, time: makeTime(hour: hour, minute: 0),
                days: [], customMessage: "Your brain is 75% water. Feed it.", isEnabled: true)
            addReminder(r)
        }
    }
    
    func scheduleBreathing() {
        for (i, hour) in [9, 13, 18].enumerated() {
            let r = ApertureReminder(id: "breathe_\(i)", title: "Breathing Break", emoji: "🧘", category: .wellness,
                tone: .gentle, frequency: .daily, time: makeTime(hour: hour, minute: 0),
                days: [], customMessage: "60 seconds of breathing resets your nervous system.", isEnabled: true)
            addReminder(r)
        }
    }
    
    func scheduleMovement() {
        for hour in stride(from: 9, through: 18, by: 2) {
            let r = ApertureReminder(id: "move_\(hour)", title: "Move Your Body", emoji: "🚶", category: .health,
                tone: .motivating, frequency: .weekdays, time: makeTime(hour: hour, minute: 30),
                days: [2,3,4,5,6], customMessage: "Stand up. Stretch. Walk for 2 minutes. Your body will thank you.", isEnabled: true)
            addReminder(r)
        }
    }
    
    func scheduleWindDown() {
        let r = ApertureReminder(id: "winddown", title: "Wind Down", emoji: "🌙", category: .wellness,
            tone: .gentle, frequency: .daily, time: makeTime(hour: 21, minute: 30),
            days: [], customMessage: "Start your wind-down. Screens on night mode. Your brain needs the signal.", isEnabled: true)
        addReminder(r)
    }
    
    func scheduleMorningCheckIn() {
        let r = ApertureReminder(id: "morning", title: "Morning Check-In", emoji: "☀️", category: .wellness,
            tone: .gentle, frequency: .daily, time: makeTime(hour: 8, minute: 0),
            days: [], customMessage: "What's your ONE thing today? Set your intention.", isEnabled: true)
        addReminder(r)
    }
    
    func scheduleScreenBreak() {
        for hour in 9...17 {
            let r = ApertureReminder(id: "screen_\(hour)", title: "Screen Break", emoji: "📱", category: .health,
                tone: .firm, frequency: .weekdays, time: makeTime(hour: hour, minute: 50),
                days: [2,3,4,5,6], customMessage: "Look away from screen. 20 feet away. 20 seconds. Your eyes need it.", isEnabled: true)
            addReminder(r)
        }
    }
    
    // MARK: - Notification Scheduling
    
    private func scheduleNotification(for reminder: ApertureReminder) {
        let content = UNMutableNotificationContent()
        content.title = "\(reminder.emoji) \(reminder.title)"
        content.body = reminder.customMessage ?? toneMessage(reminder.tone, reminder.title)
        content.sound = .default
        content.categoryIdentifier = "APERTURE_REMINDER"
        
        let calendar = Calendar.current
        var components = calendar.dateComponents([.hour, .minute], from: reminder.time)
        
        let trigger: UNNotificationTrigger
        switch reminder.frequency {
        case .once:
            components = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: reminder.time)
            trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: false)
        case .daily:
            trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: true)
        case .weekdays:
            // Schedule for each selected day
            for day in reminder.days {
                var dayComponents = components
                dayComponents.weekday = day
                let dayTrigger = UNCalendarNotificationTrigger(dateMatching: dayComponents, repeats: true)
                let request = UNNotificationRequest(identifier: "\(reminder.id)_\(day)", content: content, trigger: dayTrigger)
                center.add(request)
            }
            return
        case .weekly:
            if let firstDay = reminder.days.first {
                components.weekday = firstDay
            }
            trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: true)
        case .hourly:
            trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3600, repeats: true)
        case .custom:
            trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: true)
        }
        
        let request = UNNotificationRequest(identifier: reminder.id, content: content, trigger: trigger)
        center.add(request)
    }
    
    private func toneMessage(_ tone: ReminderTone, _ task: String) -> String {
        switch tone {
        case .gentle: return "Hey, gentle reminder: \(task). You've got this. No pressure."
        case .motivating: return "Time to \(task)! Your future self will thank you. Let's go!"
        case .firm: return "\(task) — NOW. Not later. Not tomorrow. Right now. You know you'll feel better after."
        case .loving: return "Remember to \(task). You deserve to take care of yourself. You are loved."
        }
    }
    
    private func makeTime(hour: Int, minute: Int) -> Date {
        Calendar.current.date(from: DateComponents(hour: hour, minute: minute)) ?? Date()
    }
    
    // MARK: - Persistence
    
    private func saveReminders() {
        if let data = try? JSONEncoder().encode(reminders) {
            UserDefaults.standard.set(data, forKey: storageKey)
        }
    }
    
    private func loadReminders() {
        if let data = UserDefaults.standard.data(forKey: storageKey),
           let saved = try? JSONDecoder().decode([ApertureReminder].self, from: data) {
            reminders = saved
        }
    }
}

// MARK: - ═══════════════════════════════════════════════════
// DATA MODELS
// ═══════════════════════════════════════════════════════════

struct ApertureReminder: Identifiable, Codable {
    let id: String
    let title: String
    let emoji: String
    let category: ReminderCategory
    let tone: ReminderTone
    let frequency: ReminderFrequency
    let time: Date
    let days: [Int]
    let customMessage: String?
    var isEnabled: Bool
}

extension ApertureReminder {
    var scheduleDescription: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a"
        let timeStr = formatter.string(from: time)
        switch frequency {
        case .once: return "Once at \(timeStr)"
        case .daily: return "Daily at \(timeStr)"
        case .weekdays: return "Weekdays at \(timeStr)"
        case .weekly: return "Weekly at \(timeStr)"
        case .hourly: return "Every hour"
        case .custom:
            let dayNames = ["Sun","Mon","Tue","Wed","Thu","Fri","Sat"]
            let selected = days.compactMap { $0 < dayNames.count ? dayNames[$0] : nil }.joined(separator: ", ")
            return "\(selected) at \(timeStr)"
        }
    }
}

enum ReminderCategory: String, CaseIterable, Codable {
    case tasks, health, wellness, medication, relationships, custom
    var label: String {
        switch self {
        case .tasks: return "📋 Tasks"
        case .health: return "💪 Health"
        case .wellness: return "🧘 Wellness"
        case .medication: return "💊 Medication"
        case .relationships: return "❤️ People"
        case .custom: return "⚙️ Custom"
        }
    }
}

enum ReminderTone: String, CaseIterable, Codable {
    case gentle, motivating, firm, loving
    var emoji: String {
        switch self { case .gentle: return "🌿"; case .motivating: return "🔥"; case .firm: return "⚡"; case .loving: return "💗" }
    }
    var label: String { rawValue.capitalized }
}

enum ReminderFrequency: String, CaseIterable, Codable {
    case once, daily, weekdays, weekly, hourly, custom
    var label: String { rawValue.capitalized }
}
