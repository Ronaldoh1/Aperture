// AppSettingsView.swift
// Full settings screen with notification permissions, accountability settings,
// privacy controls, and appearance preferences.
// ☀️ SunFlow: Reignited

import SwiftUI
import UserNotifications

// MARK: - ═══════════════════════════════════════════════════
// APP SETTINGS VIEW
// ═══════════════════════════════════════════════════════════

struct AppSettingsView: View {
    
    @Environment(\.dismiss) var dismiss
    @StateObject private var notificationState = NotificationPermissionState()
    @StateObject private var buddy = AccountabilityBuddyManager.shared
    @AppStorage("haptics_enabled") private var hapticsEnabled = true
    @AppStorage("auto_dark_mode") private var autoDarkMode = true
    @AppStorage("daily_report_reminder") private var dailyReportReminder = false
    @AppStorage("morning_routine_reminder") private var morningRoutineReminder = false
    @AppStorage("micro_checkin_reminders") private var microCheckinReminders = false
    @AppStorage("lesson_reminders") private var lessonReminders = false
    @AppStorage("narration_enabled") private var narrationEnabled = true
    @AppStorage("reduce_animations") private var reduceAnimations = false
    
    var body: some View {
        ZStack {
            Color(hex: "#0a0a0f").ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 24) {
                    
                    // MARK: - Notifications
                    settingsGroup("NOTIFICATIONS", icon: "bell.fill", color: .red) {
                        // System permission status
                        HStack {
                            VStack(alignment: .leading, spacing: 2) {
                                Text("Push Notifications").font(.system(size: 14, weight: .bold)).foregroundColor(.white)
                                Text(notificationState.statusText)
                                    .font(.system(size: 10, weight: .medium))
                                    .foregroundColor(notificationState.isAuthorized ? .green : .red.opacity(0.7))
                            }
                            Spacer()
                            if !notificationState.isAuthorized {
                                Button {
                                    if notificationState.isDenied {
                                        openSystemSettings()
                                    } else {
                                        requestNotifications()
                                    }
                                } label: {
                                    Text(notificationState.isDenied ? "Open Settings" : "Enable")
                                        .font(.system(size: 11, weight: .bold)).foregroundColor(.black)
                                        .padding(.horizontal, 14).padding(.vertical, 6)
                                        .background(Capsule().fill(Color.red))
                                }
                            } else {
                                Image(systemName: "checkmark.circle.fill").foregroundColor(.green)
                            }
                        }
                        
                        if notificationState.isAuthorized {
                            settingsToggle("End of Day Report Reminder", isOn: $dailyReportReminder, subtitle: "Daily at 9 PM")
                            settingsToggle("Morning Routine Reminder", isOn: $morningRoutineReminder, subtitle: "At your wake target time")
                            settingsToggle("Micro Check-in Reminders", isOn: $microCheckinReminders, subtitle: "2-3 times throughout the day")
                            settingsToggle("Lesson Reminders", isOn: $lessonReminders, subtitle: "Gentle nudge to keep learning")
                        }
                    }
                    
                    // MARK: - Accountability
                    settingsGroup("ACCOUNTABILITY", icon: "person.2.fill", color: Color(hex: "#F39C12")) {
                        if buddy.hasBuddy {
                            HStack {
                                Text("Buddy Name").font(.system(size: 13, weight: .medium)).foregroundColor(.white.opacity(0.7))
                                Spacer()
                                Text(buddy.buddyName ?? "").font(.system(size: 13, weight: .bold)).foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3))
                            }
                        }
                        
                        settingsToggle("Sleep Accountability", isOn: $buddy.sleepAccountabilityEnabled, subtitle: buddy.sleepAccountabilityEnabled ? "Bedtime reminder active" : "Off")
                        settingsToggle("Wake Accountability", isOn: $buddy.wakeAccountabilityEnabled, subtitle: buddy.wakeAccountabilityEnabled ? "Morning reminder active" : "Off")
                    }
                    
                    // MARK: - Experience
                    settingsGroup("EXPERIENCE", icon: "sparkles", color: .cyan) {
                        settingsToggle("Haptic Feedback", isOn: $hapticsEnabled, subtitle: "Tactile responses on actions")
                        settingsToggle("Text-to-Speech Narration", isOn: $narrationEnabled, subtitle: "Hear course content read aloud")
                        settingsToggle("Reduce Animations", isOn: $reduceAnimations, subtitle: "Simpler transitions for performance")
                    }
                    
                    // MARK: - Privacy
                    settingsGroup("PRIVACY & DATA", icon: "lock.shield.fill", color: .green) {
                        settingsNav("Data Storage", value: "On Device Only")
                        settingsNav("Analytics", value: "None Collected")
                        settingsNav("Ad Tracking", value: "Blocked")
                        
                        Button {
                            // Clear all UserDefaults
                        } label: {
                            HStack {
                                Text("Clear All Local Data").font(.system(size: 13, weight: .medium)).foregroundColor(.red)
                                Spacer()
                                Image(systemName: "trash").font(.system(size: 12)).foregroundColor(.red.opacity(0.5))
                            }
                        }
                    }
                    
                    // MARK: - About
                    settingsGroup("ABOUT", icon: "info.circle.fill", color: .white.opacity(0.5)) {
                        settingsNav("Version", value: "1.0.0 (Build 27)")
                        settingsNav("Framework", value: "VIPER + SwiftUI")
                        
                        HStack {
                            Text("Made with").font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.3))
                            Text("☀️").font(.system(size: 14))
                            Text("by SunFlow").font(.system(size: 12, weight: .bold)).foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3))
                        }
                        .frame(maxWidth: .infinity).padding(.top, 4)
                    }
                    
                    Spacer(minLength: 100)
                }
                .padding(.horizontal, 16)
                .padding(.top, 16)
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
                Text("Settings").font(.system(size: 17, weight: .bold)).foregroundColor(.white)
            }
        }
        .toolbarBackground(Color(hex: "#0a0a0f"), for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .onAppear { notificationState.checkStatus() }
    }
    
    // MARK: - Components
    
    private func settingsGroup(_ title: String, icon: String, color: Color, @ViewBuilder content: () -> some View) -> some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack(spacing: 8) {
                Image(systemName: icon).font(.system(size: 12, weight: .bold)).foregroundColor(color)
                Text(title).font(.system(size: 10, weight: .black)).tracking(1.5).foregroundColor(.white.opacity(0.3))
            }
            
            VStack(spacing: 12) {
                content()
            }
            .padding(14)
            .background(RoundedRectangle(cornerRadius: 14).fill(Color.white.opacity(0.03)))
            .overlay(RoundedRectangle(cornerRadius: 14).stroke(color.opacity(0.08), lineWidth: 1))
        }
    }
    
    private func settingsToggle(_ title: String, isOn: Binding<Bool>, subtitle: String) -> some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                Text(title).font(.system(size: 13, weight: .medium)).foregroundColor(.white.opacity(0.8))
                Text(subtitle).font(.system(size: 10, weight: .medium)).foregroundColor(.white.opacity(0.25))
            }
            Spacer()
            Toggle("", isOn: isOn).tint(Color(red: 1.0, green: 0.85, blue: 0.3)).labelsHidden()
        }
    }
    
    private func settingsNav(_ title: String, value: String) -> some View {
        HStack {
            Text(title).font(.system(size: 13, weight: .medium)).foregroundColor(.white.opacity(0.7))
            Spacer()
            Text(value).font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.25))
        }
    }
    
    // MARK: - Actions
    
    private func requestNotifications() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, _ in
            DispatchQueue.main.async { notificationState.checkStatus() }
        }
    }
    
    private func openSystemSettings() {
        if let url = URL(string: UIApplication.openSettingsURLString) {
            UIApplication.shared.open(url)
        }
    }
}

// MARK: - ═══════════════════════════════════════════════════
// NOTIFICATION PERMISSION STATE
// ═══════════════════════════════════════════════════════════

@MainActor
final class NotificationPermissionState: ObservableObject {
    @Published var isAuthorized = false
    @Published var isDenied = false
    @Published var statusText = "Checking..."
    
    func checkStatus() {
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            DispatchQueue.main.async {
                switch settings.authorizationStatus {
                case .authorized, .provisional, .ephemeral:
                    self.isAuthorized = true
                    self.isDenied = false
                    self.statusText = "Enabled"
                case .denied:
                    self.isAuthorized = false
                    self.isDenied = true
                    self.statusText = "Denied — tap to open Settings"
                case .notDetermined:
                    self.isAuthorized = false
                    self.isDenied = false
                    self.statusText = "Not yet enabled"
                @unknown default:
                    self.statusText = "Unknown"
                }
            }
        }
    }
}
