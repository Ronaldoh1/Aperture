// SettingsView.swift
// Main settings hub for Aperture

import SwiftUI

struct SettingsView: View {
  /// Sacred Geometry Bubble Settings
  @ObservedObject private var bubbleManager = SacredGeometryBubbleManager.shared

  // User Preferences
  @AppStorage("notifications_enabled") private var notificationsEnabled = true
  @AppStorage("daily_reminder_time") private var dailyReminderTime = Date()
  @AppStorage("haptics_enabled") private var hapticsEnabled = true
  @AppStorage("auto_play_audio") private var autoPlayAudio = false
  @AppStorage("dark_mode_override") private var darkModeOverride = false

  // Navigation
  @State private var showSecuritySettings = false
  @State private var showNotificationSettings = false

  var body: some View {
    ZStack {
      CosmicBackground(starCount: 40)

      ScrollView(showsIndicators: false) {
        VStack(spacing: 24) {
          // Badge Settings
          badgeSettingsSection

          // Appearance
          appearanceSection

          // Notifications
          notificationsSection

          // Accessibility
          accessibilitySection

          // Security
          securitySection

          // Data
          dataSection

          Spacer(minLength: 100)
        }
        .padding(.horizontal, 20)
        .padding(.top, 20)
      }
    }
    .navigationTitle("Settings")
    .navigationBarTitleDisplayMode(.inline)
    .navigationDestination(isPresented: $showSecuritySettings) {
      SecuritySettingsView()
    }
  }

  // MARK: - Dragon Settings

  private var badgeSettingsSection: some View {
    VStack(alignment: .leading, spacing: 12) {
      sectionHeader("Sacred Geometry", icon: "✨")

      // Bubble Enabled
      SettingsToggle(
        title: "Show Badge Bubble",
        subtitle: "Floating Flower of Life on all screens",
        isOn: $bubbleManager.isVisible
      )

      // View Badge Collection
      SettingsButton(
        title: "View Badge Collection",
        subtitle: "\(SacredBadgeManager.shared.totalBadgeCount) badges earned",
        icon: "seal.fill",
        color: Palette.accent.gold
      ) {
        // This will be handled by navigation
      }
    }
    .padding()
    .background(sectionBackground)
  }

  // MARK: - Appearance

  private var appearanceSection: some View {
    VStack(alignment: .leading, spacing: 12) {
      sectionHeader("Appearance", icon: "paintbrush.fill")

      SettingsToggle(
        title: "Force Dark Mode",
        subtitle: "Override system appearance",
        isOn: $darkModeOverride
      )

      // Note: Full dark/light mode implementation would require more work
      Text("Aperture is optimized for dark mode. Light mode coming soon.")
        .font(.system(size: 12))
        .foregroundColor(.gray)
        .padding(.top, 4)
    }
    .padding()
    .background(sectionBackground)
  }

  // MARK: - Notifications

  private var notificationsSection: some View {
    VStack(alignment: .leading, spacing: 12) {
      sectionHeader("Notifications", icon: "bell.fill")

      SettingsToggle(
        title: "Daily Reminders",
        subtitle: "Get gentle nudges to practice",
        isOn: $notificationsEnabled
      )

      if notificationsEnabled {
        // Time picker
        HStack {
          Text("Reminder Time")
            .font(.system(size: 15))
            .foregroundColor(.white)

          Spacer()

          DatePicker(
            "",
            selection: $dailyReminderTime,
            displayedComponents: .hourAndMinute
          )
          .labelsHidden()
          .accentColor(Palette.accent.gold)
        }
        .padding(.vertical, 8)
      }

      SettingsToggle(
        title: "Dragon Wisdom Drops",
        subtitle: "Morning insights from your companion",
        isOn: .constant(true)  // Placeholder
      )
    }
    .padding()
    .background(sectionBackground)
  }

  // MARK: - Accessibility

  private var accessibilitySection: some View {
    VStack(alignment: .leading, spacing: 12) {
      sectionHeader("Accessibility", icon: "accessibility")

      SettingsToggle(
        title: "Haptic Feedback",
        subtitle: "Vibrations for interactions",
        isOn: $hapticsEnabled
      )
      // TODO: Implement HapticManager.isEnabled property to support this

      SettingsToggle(
        title: "Auto-Play Audio",
        subtitle: "Start guided meditations automatically",
        isOn: $autoPlayAudio
      )
    }
    .padding()
    .background(sectionBackground)
  }

  // MARK: - Security

  private var securitySection: some View {
    VStack(alignment: .leading, spacing: 12) {
      sectionHeader("Security", icon: "lock.fill")

      SettingsButton(
        title: "Security Settings",
        subtitle: "Biometrics, passcode, and privacy",
        icon: "chevron.right",
        showChevron: true
      ) {
        showSecuritySettings = true
      }
    }
    .padding()
    .background(sectionBackground)
  }

  // MARK: - Data

  private var dataSection: some View {
    VStack(alignment: .leading, spacing: 12) {
      sectionHeader("Data", icon: "externaldrive.fill")

      SettingsButton(
        title: "Export My Data",
        subtitle: "Download your journey data",
        icon: "square.and.arrow.up"
      ) {
        // TODO: Implement data export
      }

      SettingsButton(
        title: "Clear Cache",
        subtitle: "Free up storage space",
        icon: "trash"
      ) {
        // TODO: Implement cache clearing
      }

      SettingsButton(
        title: "Reset All Settings",
        subtitle: "Restore defaults (keeps progress)",
        icon: "arrow.counterclockwise",
        color: .red
      ) {
        // TODO: Implement reset
      }
    }
    .padding()
    .background(sectionBackground)
  }

  // MARK: - Helpers

  private func sectionHeader(_ title: String, icon: String) -> some View {
    HStack(spacing: 8) {
      if icon.count == 1 || icon.count == 2 {
        // Emoji
        Text(icon)
          .font(.system(size: 16))
      } else {
        // SF Symbol
        Image(systemName: icon)
          .font(.system(size: 14))
          .foregroundColor(Palette.accent.gold)
      }

      Text(title.uppercased())
        .font(.system(size: 12, weight: .bold))
        .foregroundColor(Palette.accent.gold)
        .tracking(2)
    }
  }

  private var sectionBackground: some View {
    RoundedRectangle(cornerRadius: 16)
      .fill(Color.white.opacity(0.05))
      .overlay(
        RoundedRectangle(cornerRadius: 16)
          .stroke(Color.white.opacity(0.1), lineWidth: 1)
      )
  }
}

// MARK: - Settings Toggle Component

struct SettingsToggle: View {
  let title: String
  let subtitle: String
  @Binding var isOn: Bool

  var body: some View {
    Toggle(isOn: $isOn) {
      VStack(alignment: .leading, spacing: 2) {
        Text(title)
          .font(.system(size: 15, weight: .medium))
          .foregroundColor(.white)

        Text(subtitle)
          .font(.system(size: 12))
          .foregroundColor(.gray)
      }
    }
    .tint(Palette.accent.gold)
    .padding(.vertical, 4)
  }
}

// MARK: - Settings Button Component

struct SettingsButton: View {
  let title: String
  let subtitle: String
  let icon: String
  var color: Color = .white
  var showChevron: Bool = false
  let action: () -> Void

  var body: some View {
    Button(action: action) {
      HStack {
        VStack(alignment: .leading, spacing: 2) {
          Text(title)
            .font(.system(size: 15, weight: .medium))
            .foregroundColor(color)

          Text(subtitle)
            .font(.system(size: 12))
            .foregroundColor(.gray)
        }

        Spacer()

        if showChevron {
          Image(systemName: "chevron.right")
            .font(.system(size: 12))
            .foregroundColor(.gray)
        } else {
          Image(systemName: icon)
            .font(.system(size: 14))
            .foregroundColor(color.opacity(0.7))
        }
      }
      .padding(.vertical, 4)
    }
    .buttonStyle(PlainButtonStyle())
  }
}

// MARK: - Preview

#Preview {
  NavigationStack {
    SettingsView()
  }
}
