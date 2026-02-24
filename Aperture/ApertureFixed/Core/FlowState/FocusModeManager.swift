// FocusModeManager.swift
// Aperture
//
// iOS Focus Mode Integration
// Automatically enable Focus modes during flow blocks
//
// This works with iOS 15+ Focus system
// Requires Focus Filter extension for full functionality
//
// Capabilities needed:
// - App Intents
// - Focus (for Focus Filter extension)

import Foundation
import SwiftUI
import Intents
import Combine

#if canImport(AppIntents)
import AppIntents
#endif


// MARK: - Focus Mode Type

enum ApertureFocusMode: String, CaseIterable, Codable {
    case deepWork = "Deep Work"
    case lightWork = "Light Work"
    case rest = "Rest"
    case off = "Off"
    
    var systemFocusName: String? {
        switch self {
        case .deepWork: return "Do Not Disturb"  // Maps to DND
        case .lightWork: return "Work"           // Maps to Work focus
        case .rest: return nil                   // No system focus
        case .off: return nil
        }
    }
    
    var icon: String {
        switch self {
        case .deepWork: return "moon.fill"
        case .lightWork: return "briefcase.fill"
        case .rest: return "leaf.fill"
        case .off: return "bell.fill"
        }
    }
    
    var color: Color {
        switch self {
        case .deepWork: return .indigo
        case .lightWork: return .blue
        case .rest: return .green
        case .off: return .gray
        }
    }
    
    var description: String {
        switch self {
        case .deepWork: return "All notifications silenced. Only VIPs can reach you."
        case .lightWork: return "Non-urgent notifications delayed."
        case .rest: return "Taking a break. Full notifications."
        case .off: return "All notifications enabled."
        }
    }
    
    var notificationBehavior: FocusNotificationBehavior {
        switch self {
        case .deepWork: return .silenceAll
        case .lightWork: return .delayNonUrgent
        case .rest: return .allowAll
        case .off: return .allowAll
        }
    }
}

enum FocusNotificationBehavior {
    case silenceAll
    case delayNonUrgent
    case allowAll
}


// MARK: - Focus Session

struct FocusModeSession: Identifiable, Codable {
    let id: UUID
    let mode: ApertureFocusMode
    let startTime: Date
    var endTime: Date?
    var focusBlockId: UUID?  // Associated focus block if any
    var wasInterrupted: Bool = false
    var interruptionCount: Int = 0
    
    var duration: TimeInterval {
        let end = endTime ?? Date()
        return end.timeIntervalSince(startTime)
    }
    
    var durationMinutes: Int {
        Int(duration / 60)
    }
    
    var isActive: Bool {
        endTime == nil
    }
}


// MARK: - Focus Mode Manager

@MainActor
final class FocusModeManager: ObservableObject {
    
    static let shared = FocusModeManager()
    
    // MARK: - Published State
    
    @Published var currentMode: ApertureFocusMode = .off
    @Published var activeSession: FocusModeSession?
    @Published var isSystemFocusActive = false
    @Published var autoEnableEnabled = true
    @Published var vipContacts: [String] = []  // Always allowed through
    @Published var focusHistory: [FocusModeSession] = []
    
    // MARK: - Settings
    
    @Published var deepWorkSettings = DeepWorkFocusSettings()
    @Published var lightWorkSettings = LightWorkFocusSettings()
    
    // MARK: - Storage
    
    private let defaults = UserDefaults.standard
    private let keys = (
        autoEnable: "focus.autoEnable",
        vipContacts: "focus.vipContacts",
        deepWorkSettings: "focus.deepWorkSettings",
        lightWorkSettings: "focus.lightWorkSettings",
        focusHistory: "focus.history"
    )
    
    
    // MARK: - Initialization
    
    init() {
        loadSettings()
        loadHistory()
        checkSystemFocusStatus()
    }
    
    private func loadSettings() {
        autoEnableEnabled = defaults.bool(forKey: keys.autoEnable)
        
        if let contacts = defaults.stringArray(forKey: keys.vipContacts) {
            vipContacts = contacts
        }
        
        if let data = defaults.data(forKey: keys.deepWorkSettings),
           let settings = try? JSONDecoder().decode(DeepWorkFocusSettings.self, from: data) {
            deepWorkSettings = settings
        }
        
        if let data = defaults.data(forKey: keys.lightWorkSettings),
           let settings = try? JSONDecoder().decode(LightWorkFocusSettings.self, from: data) {
            lightWorkSettings = settings
        }
    }
    
    func saveSettings() {
        defaults.set(autoEnableEnabled, forKey: keys.autoEnable)
        defaults.set(vipContacts, forKey: keys.vipContacts)
        
        if let data = try? JSONEncoder().encode(deepWorkSettings) {
            defaults.set(data, forKey: keys.deepWorkSettings)
        }
        if let data = try? JSONEncoder().encode(lightWorkSettings) {
            defaults.set(data, forKey: keys.lightWorkSettings)
        }
    }
    
    private func loadHistory() {
        if let data = defaults.data(forKey: keys.focusHistory),
           let history = try? JSONDecoder().decode([FocusModeSession].self, from: data) {
            // Keep only last 30 days
            let thirtyDaysAgo = Calendar.current.date(byAdding: .day, value: -30, to: Date())!
            focusHistory = history.filter { $0.startTime >= thirtyDaysAgo }
        }
    }
    
    private func saveHistory() {
        if let data = try? JSONEncoder().encode(focusHistory) {
            defaults.set(data, forKey: keys.focusHistory)
        }
    }
    
    
    // MARK: - Focus Control
    
    /// Start a focus session
    func startFocus(mode: ApertureFocusMode, forBlock blockId: UUID? = nil) {
        // End any existing session
        if activeSession != nil {
            endFocus()
        }
        
        guard mode != .off else {
            currentMode = .off
            return
        }
        
        let session = FocusModeSession(
            id: UUID(),
            mode: mode,
            startTime: Date(),
            focusBlockId: blockId
        )
        
        activeSession = session
        currentMode = mode
        
        // Try to enable system focus
        enableSystemFocus(for: mode)
        
        // Provide haptic feedback
        provideHapticFeedback()
    }
    
    /// End the current focus session
    func endFocus() {
        guard var session = activeSession else { return }
        
        session.endTime = Date()
        focusHistory.append(session)
        saveHistory()
        
        activeSession = nil
        currentMode = .off
        
        // Disable system focus
        disableSystemFocus()
    }
    
    /// Record an interruption during focus
    func recordInterruption() {
        guard var session = activeSession else { return }
        session.interruptionCount += 1
        session.wasInterrupted = true
        activeSession = session
    }
    
    /// Auto-start focus for a focus block
    func autoStartForBlock(_ block: FocusBlock) {
        guard autoEnableEnabled else { return }
        
        let mode: ApertureFocusMode = block.type == .deepWork ? .deepWork : .lightWork
        startFocus(mode: mode, forBlock: block.id)
        
        // Schedule auto-end
        let duration = TimeInterval((block.endHour - block.startHour) * 3600)
        scheduleAutoEnd(after: duration)
    }
    
    private func scheduleAutoEnd(after duration: TimeInterval) {
        Task {
            try? await Task.sleep(nanoseconds: UInt64(duration * 1_000_000_000))
            await MainActor.run {
                if self.activeSession != nil {
                    self.endFocus()
                }
            }
        }
    }
    
    
    // MARK: - System Focus Integration
    
    private func checkSystemFocusStatus() {
        // Note: There's no direct API to check system Focus status
        // This would require a Focus Filter app extension
        // For now, we track our own state
    }
    
    private func enableSystemFocus(for mode: ApertureFocusMode) {
        // iOS doesn't allow apps to directly enable Focus modes
        // Options:
        // 1. Use Shortcuts automation (user must set up)
        // 2. Use Focus Filter extension (more complex)
        // 3. Remind user to enable manually
        
        // For MVP, we'll show a reminder
        if mode == .deepWork || mode == .lightWork {
            showFocusEnableReminder(mode: mode)
        }
    }
    
    private func disableSystemFocus() {
        // Same limitation as above
        // For MVP, we assume user handles this
    }
    
    private func showFocusEnableReminder(mode: ApertureFocusMode) {
        // This would trigger a notification or in-app prompt
        // suggesting user enable the corresponding system Focus
        
        // In a future version, this could use Shortcuts integration
    }
    
    
    // MARK: - VIP Management
    
    func addVIP(_ contact: String) {
        guard !vipContacts.contains(contact) else { return }
        vipContacts.append(contact)
        saveSettings()
    }
    
    func removeVIP(_ contact: String) {
        vipContacts.removeAll { $0 == contact }
        saveSettings()
    }
    
    func isVIP(_ contact: String) -> Bool {
        vipContacts.contains(contact)
    }
    
    
    // MARK: - Statistics
    
    /// Total focus time today
    var todayFocusMinutes: Int {
        let today = Calendar.current.startOfDay(for: Date())
        
        var total = 0
        
        // Add completed sessions
        for session in focusHistory where Calendar.current.isDate(session.startTime, inSameDayAs: today) {
            total += session.durationMinutes
        }
        
        // Add active session
        if let active = activeSession, Calendar.current.isDate(active.startTime, inSameDayAs: today) {
            total += active.durationMinutes
        }
        
        return total
    }
    
    /// Average daily focus time over last 7 days
    var weeklyAverageFocusMinutes: Int {
        let weekAgo = Calendar.current.date(byAdding: .day, value: -7, to: Date())!
        let sessions = focusHistory.filter { $0.startTime >= weekAgo }
        
        guard !sessions.isEmpty else { return 0 }
        
        let total = sessions.reduce(0) { $0 + $1.durationMinutes }
        return total / 7
    }
    
    /// Deep work sessions this week
    var weeklyDeepWorkSessions: Int {
        let weekAgo = Calendar.current.date(byAdding: .day, value: -7, to: Date())!
        return focusHistory.filter { $0.startTime >= weekAgo && $0.mode == .deepWork }.count
    }
    
    /// Average interruptions per session
    var averageInterruptions: Double {
        let completedSessions = focusHistory.filter { $0.endTime != nil }
        guard !completedSessions.isEmpty else { return 0 }
        
        let totalInterruptions = completedSessions.reduce(0) { $0 + $1.interruptionCount }
        return Double(totalInterruptions) / Double(completedSessions.count)
    }
    
    
    // MARK: - Haptics
    
    private func provideHapticFeedback() {
        let impact = UIImpactFeedbackGenerator(style: .medium)
        impact.impactOccurred()
    }
}


// MARK: - Focus Settings

struct DeepWorkFocusSettings: Codable {
    var silenceAllNotifications: Bool = true
    var allowCallsFromVIPs: Bool = true
    var allowRepeatedCalls: Bool = true  // Second call within 3 min
    var showOnLockScreen: Bool = false
    var dimLockScreen: Bool = true
    var autoReply: Bool = false
    var autoReplyMessage: String = "I'm in deep work mode. I'll respond when I'm done."
}

struct LightWorkFocusSettings: Codable {
    var allowAllCalls: Bool = true
    var allowAllMessages: Bool = false
    var allowWorkApps: Bool = true
    var delayNonUrgent: Bool = true
    var delayMinutes: Int = 30
}


// MARK: - Focus Mode View

struct FocusModeView: View {
    
    @StateObject private var manager = FocusModeManager.shared
    @State private var showSettings = false
    @State private var showVIPEditor = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(hex: "#0a0a1a")
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 24) {
                        currentStatusCard
                        focusModesGrid
                        todayStatsCard
                        vipSection
                    }
                    .padding()
                }
            }
            .navigationTitle("Focus Mode")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showSettings = true
                    } label: {
                        Image(systemName: "gear")
                            .foregroundColor(.white)
                    }
                }
            }
            .sheet(isPresented: $showSettings) {
                FocusModeSettingsView()
            }
            .sheet(isPresented: $showVIPEditor) {
                VIPEditorView()
            }
        }
    }
    
    
    // MARK: - Current Status
    
    private var currentStatusCard: some View {
        VStack(spacing: 16) {
            HStack {
                ZStack {
                    Circle()
                        .fill(manager.currentMode.color.opacity(0.2))
                        .frame(width: 60, height: 60)
                    
                    Image(systemName: manager.currentMode.icon)
                        .font(.title2)
                        .foregroundColor(manager.currentMode.color)
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(manager.currentMode.rawValue)
                        .font(.title3.bold())
                        .foregroundColor(.white)
                    
                    Text(manager.currentMode.description)
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.6))
                }
                
                Spacer()
            }
            
            if let session = manager.activeSession {
                HStack {
                    Image(systemName: "clock.fill")
                        .foregroundColor(.white.opacity(0.5))
                    
                    Text("Active for \(session.durationMinutes) min")
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.7))
                    
                    Spacer()
                    
                    Button("End") {
                        manager.endFocus()
                    }
                    .font(.subheadline.bold())
                    .foregroundColor(.red)
                }
                .padding(.top, 8)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white.opacity(0.05))
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(manager.currentMode.color.opacity(0.5), lineWidth: 1)
                )
        )
    }
    
    
    // MARK: - Focus Modes Grid
    
    private var focusModesGrid: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("FOCUS MODES")
                .font(.caption.bold())
                .foregroundColor(.white.opacity(0.5))
                .tracking(1)
            
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                ForEach(ApertureFocusMode.allCases.filter { $0 != .off }, id: \.self) { mode in
                    FocusModeCard(
                        mode: mode,
                        isActive: manager.currentMode == mode,
                        action: {
                            if manager.currentMode == mode {
                                manager.endFocus()
                            } else {
                                manager.startFocus(mode: mode)
                            }
                        }
                    )
                }
            }
        }
    }
    
    
    // MARK: - Today Stats
    
    private var todayStatsCard: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("TODAY")
                .font(.caption.bold())
                .foregroundColor(.white.opacity(0.5))
                .tracking(1)
            
            HStack(spacing: 16) {
                FocusStatBox(
                    value: "\(manager.todayFocusMinutes)",
                    label: "Focus Time",
                    unit: "minutes",
                    color: Color(hex: "#7C4DFF")
                )
                
                FocusStatBox(
                    value: "\(manager.weeklyDeepWorkSessions)",
                    label: "Deep Work",
                    unit: "sessions/week",
                    color: .indigo
                )
                
                FocusStatBox(
                    value: String(format: "%.1f", manager.averageInterruptions),
                    label: "Interruptions",
                    unit: "avg/session",
                    color: .orange
                )
            }
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(16)
    }
    
    
    // MARK: - VIP Section
    
    private var vipSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("VIP CONTACTS")
                    .font(.caption.bold())
                    .foregroundColor(.white.opacity(0.5))
                    .tracking(1)
                
                Spacer()
                
                Button {
                    showVIPEditor = true
                } label: {
                    Image(systemName: "pencil.circle.fill")
                        .foregroundColor(Color(hex: "#7C4DFF"))
                }
            }
            
            if manager.vipContacts.isEmpty {
                Text("No VIPs added. These contacts can always reach you.")
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.5))
            } else {
                ForEach(manager.vipContacts, id: \.self) { vip in
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                            .font(.caption)
                        
                        Text(vip)
                            .font(.subheadline)
                            .foregroundColor(.white)
                        
                        Spacer()
                    }
                }
            }
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(16)
    }
}


// MARK: - Supporting Views

struct FocusModeCard: View {
    let mode: ApertureFocusMode
    let isActive: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 12) {
                Image(systemName: mode.icon)
                    .font(.title2)
                    .foregroundColor(isActive ? .white : mode.color)
                
                Text(mode.rawValue)
                    .font(.subheadline.bold())
                    .foregroundColor(isActive ? .white : .white.opacity(0.8))
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 20)
            .background(isActive ? mode.color : Color.white.opacity(0.05))
            .cornerRadius(16)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(mode.color.opacity(isActive ? 0 : 0.3), lineWidth: 1)
            )
        }
    }
}

struct FocusStatBox: View {
    let value: String
    let label: String
    let unit: String
    let color: Color
    
    var body: some View {
        VStack(spacing: 4) {
            Text(value)
                .font(.title2.bold())
                .foregroundColor(color)
            
            Text(label)
                .font(.caption)
                .foregroundColor(.white.opacity(0.7))
            
            Text(unit)
                .font(.caption2)
                .foregroundColor(.white.opacity(0.5))
        }
        .frame(maxWidth: .infinity)
    }
}

struct FocusModeSettingsView: View {
    @StateObject private var manager = FocusModeManager.shared
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(hex: "#0a0a1a")
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 24) {
                        Toggle("Auto-enable during focus blocks", isOn: $manager.autoEnableEnabled)
                            .toggleStyle(SwitchToggleStyle(tint: Color(hex: "#7C4DFF")))
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.white.opacity(0.05))
                            .cornerRadius(16)
                        
                        // Deep Work Settings
                        VStack(alignment: .leading, spacing: 12) {
                            Text("DEEP WORK MODE")
                                .font(.caption.bold())
                                .foregroundColor(.white.opacity(0.5))
                            
                            Toggle("Silence all notifications", isOn: $manager.deepWorkSettings.silenceAllNotifications)
                            Toggle("Allow calls from VIPs", isOn: $manager.deepWorkSettings.allowCallsFromVIPs)
                            Toggle("Allow repeated calls", isOn: $manager.deepWorkSettings.allowRepeatedCalls)
                            Toggle("Dim lock screen", isOn: $manager.deepWorkSettings.dimLockScreen)
                        }
                        .toggleStyle(SwitchToggleStyle(tint: Color(hex: "#7C4DFF")))
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.white.opacity(0.05))
                        .cornerRadius(16)
                    }
                    .padding()
                }
            }
            .navigationTitle("Focus Settings")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        manager.saveSettings()
                        dismiss()
                    }
                    .foregroundColor(Color(hex: "#7C4DFF"))
                }
            }
        }
    }
}

struct VIPEditorView: View {
    @StateObject private var manager = FocusModeManager.shared
    @Environment(\.dismiss) private var dismiss
    @State private var newVIP = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(hex: "#0a0a1a")
                    .ignoresSafeArea()
                
                VStack(spacing: 16) {
                    HStack {
                        TextField("Add contact name or email", text: $newVIP)
                            .textFieldStyle(FlowTextFieldStyle())
                        
                        Button {
                            if !newVIP.isEmpty {
                                manager.addVIP(newVIP)
                                newVIP = ""
                            }
                        } label: {
                            Image(systemName: "plus.circle.fill")
                                .font(.title2)
                                .foregroundColor(Color(hex: "#7C4DFF"))
                        }
                    }
                    
                    List {
                        ForEach(manager.vipContacts, id: \.self) { vip in
                            HStack {
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                                
                                Text(vip)
                                    .foregroundColor(.white)
                            }
                            .listRowBackground(Color.white.opacity(0.05))
                        }
                        .onDelete { indexSet in
                            for index in indexSet {
                                manager.removeVIP(manager.vipContacts[index])
                            }
                        }
                    }
                    .listStyle(.plain)
                    .scrollContentBackground(.hidden)
                }
                .padding()
            }
            .navigationTitle("VIP Contacts")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") { dismiss() }
                        .foregroundColor(.white)
                }
            }
        }
    }
}


#Preview {
    FocusModeView()
}
