import Combine
import SwiftUI

// MARK: - Feature Preferences Manager

/// Manages user preferences for optional features
/// Used in onboarding and Settings
class FeaturePreferencesManager: ObservableObject {
  static let shared = FeaturePreferencesManager()

  // MARK: - Keys

  private enum Keys {
    static let foodConsciousnessEnabled = "feature_food_consciousness_enabled"
    static let hydrationRemindersEnabled = "feature_hydration_reminders_enabled"
    static let fastingCoachEnabled = "feature_fasting_coach_enabled"
    static let psyopScannerEnabled = "feature_psyop_scanner_enabled"
    static let flowStateEnabled = "feature_flow_state_enabled"
    static let sacredGeometryBadgesEnabled = "feature_sacred_geometry_badges_enabled"
    static let hasCompletedOnboarding = "has_completed_onboarding"
    static let hasSetFeaturePreferences = "has_set_feature_preferences"
  }

  // MARK: - Published Properties

  /// Food Consciousness Features
  @Published var foodConsciousnessEnabled: Bool {
    didSet {
      UserDefaults.standard.set(foodConsciousnessEnabled, forKey: Keys.foodConsciousnessEnabled)
    }
  }

  @Published var hydrationRemindersEnabled: Bool {
    didSet {
      UserDefaults.standard.set(hydrationRemindersEnabled, forKey: Keys.hydrationRemindersEnabled)
    }
  }

  @Published var fastingCoachEnabled: Bool {
    didSet { UserDefaults.standard.set(fastingCoachEnabled, forKey: Keys.fastingCoachEnabled) }
  }

  /// Other Core Features
  @Published var psyopScannerEnabled: Bool {
    didSet { UserDefaults.standard.set(psyopScannerEnabled, forKey: Keys.psyopScannerEnabled) }
  }

  @Published var flowStateEnabled: Bool {
    didSet { UserDefaults.standard.set(flowStateEnabled, forKey: Keys.flowStateEnabled) }
  }

  @Published var sacredGeometryBadgesEnabled: Bool {
    didSet {
      UserDefaults.standard.set(
        sacredGeometryBadgesEnabled, forKey: Keys.sacredGeometryBadgesEnabled)
    }
  }

  /// Onboarding State
  @Published var hasCompletedOnboarding: Bool {
    didSet {
      UserDefaults.standard.set(hasCompletedOnboarding, forKey: Keys.hasCompletedOnboarding)
    }
  }

  @Published var hasSetFeaturePreferences: Bool {
    didSet {
      UserDefaults.standard.set(hasSetFeaturePreferences, forKey: Keys.hasSetFeaturePreferences)
    }
  }

  // MARK: - Initialization

  private init() {
    // Load saved preferences or use defaults
    // If user hasn't set preferences, everything is enabled by default
    let hasSetPrefs = UserDefaults.standard.bool(forKey: Keys.hasSetFeaturePreferences)

    if hasSetPrefs {
      // Load user's saved preferences
      foodConsciousnessEnabled = UserDefaults.standard.bool(forKey: Keys.foodConsciousnessEnabled)
      hydrationRemindersEnabled = UserDefaults.standard.bool(forKey: Keys.hydrationRemindersEnabled)
      fastingCoachEnabled = UserDefaults.standard.bool(forKey: Keys.fastingCoachEnabled)
      psyopScannerEnabled = UserDefaults.standard.bool(forKey: Keys.psyopScannerEnabled)
      flowStateEnabled = UserDefaults.standard.bool(forKey: Keys.flowStateEnabled)
      sacredGeometryBadgesEnabled = UserDefaults.standard.bool(
        forKey: Keys.sacredGeometryBadgesEnabled)
    } else {
      // Apply defaults - all features enabled
      foodConsciousnessEnabled = true
      hydrationRemindersEnabled = true
      fastingCoachEnabled = true
      psyopScannerEnabled = true
      flowStateEnabled = true
      sacredGeometryBadgesEnabled = true
    }

    hasCompletedOnboarding = UserDefaults.standard.bool(forKey: Keys.hasCompletedOnboarding)
    hasSetFeaturePreferences = hasSetPrefs
  }

  // MARK: - Methods

  /// Apply default settings (for users who skip onboarding)
  func applyDefaults() {
    foodConsciousnessEnabled = true
    hydrationRemindersEnabled = true
    fastingCoachEnabled = true
    psyopScannerEnabled = true
    flowStateEnabled = true
    sacredGeometryBadgesEnabled = true
    hasSetFeaturePreferences = true
  }

  /// Skip onboarding and apply defaults
  func skipOnboarding() {
    applyDefaults()
    hasCompletedOnboarding = true
  }

  /// Complete onboarding with custom preferences
  func completeOnboarding(
    foodConsciousness: Bool = true,
    hydrationReminders: Bool = true,
    fastingCoach: Bool = true,
    psyopScanner: Bool = true,
    flowState: Bool = true,
    sacredGeometryBadges: Bool = true
  ) {
    foodConsciousnessEnabled = foodConsciousness
    hydrationRemindersEnabled = hydrationReminders
    fastingCoachEnabled = fastingCoach
    psyopScannerEnabled = psyopScanner
    flowStateEnabled = flowState
    sacredGeometryBadgesEnabled = sacredGeometryBadges
    hasSetFeaturePreferences = true
    hasCompletedOnboarding = true
  }

  /// Reset all preferences to defaults
  func resetToDefaults() {
    applyDefaults()
  }
}

// MARK: - Feature Preferences View (for Onboarding)

struct FeaturePreferencesOnboardingView: View {
  @ObservedObject private var preferences = FeaturePreferencesManager.shared
  @Environment(\.dismiss) private var dismiss

  var onComplete: () -> Void

  var body: some View {
    ZStack {
      // Background
      LinearGradient(
        colors: [
          Color(hex: "#1a1a2e"),
          Color(hex: "#16213e"),
          Color(hex: "#0f3460"),
        ],
        startPoint: .top,
        endPoint: .bottom
      )
      .ignoresSafeArea()

      VStack(spacing: 24) {
        // Header
        VStack(spacing: 12) {
          Image(systemName: "slider.horizontal.3")
            .font(.system(size: 50))
            .foregroundStyle(
              LinearGradient(
                colors: [.purple, .cyan],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
              )
            )

          Text("Customize Your Experience")
            .font(.title.bold())
            .foregroundColor(.white)

          Text("Choose which features to enable. You can change these anytime in Settings.")
            .font(.subheadline)
            .foregroundColor(.white.opacity(0.7))
            .multilineTextAlignment(.center)
        }
        .padding(.top, 40)

        // Feature Toggles
        ScrollView {
          VStack(spacing: 16) {
            // Food Consciousness Section
            VStack(alignment: .leading, spacing: 12) {
              HStack {
                Image(systemName: "leaf.fill")
                  .foregroundColor(.green)
                Text("Body Consciousness")
                  .font(.headline)
                  .foregroundColor(.white)
              }

              FeatureToggle(
                icon: "fork.knife",
                title: "Food Consciousness",
                subtitle: "Scan ingredients, expose fast food & drinks",
                color: .green,
                isEnabled: $preferences.foodConsciousnessEnabled
              )

              FeatureToggle(
                icon: "drop.fill",
                title: "Hydration Reminders",
                subtitle: "Stay hydrated with gentle reminders",
                color: .cyan,
                isEnabled: $preferences.hydrationRemindersEnabled
              )

              FeatureToggle(
                icon: "clock.fill",
                title: "Fasting Coach",
                subtitle: "Intermittent fasting guidance",
                color: .orange,
                isEnabled: $preferences.fastingCoachEnabled
              )
            }
            .padding()
            .background(Color.white.opacity(0.05))
            .cornerRadius(16)

            // Mind Consciousness Section
            VStack(alignment: .leading, spacing: 12) {
              HStack {
                Image(systemName: "brain.head.profile")
                  .foregroundColor(.purple)
                Text("Mind Consciousness")
                  .font(.headline)
                  .foregroundColor(.white)
              }

              FeatureToggle(
                icon: "eye.trianglebadge.exclamationmark",
                title: "Psyop Scanner",
                subtitle: "Detect manipulation in media",
                color: .red,
                isEnabled: $preferences.psyopScannerEnabled
              )

              FeatureToggle(
                icon: "waveform.path",
                title: "FlowState",
                subtitle: "AI-guided focus sessions",
                color: .purple,
                isEnabled: $preferences.flowStateEnabled
              )

              FeatureToggle(
                icon: "seal.fill",
                title: "Sacred Geometry Badges",
                subtitle: "Earn badges for your journey",
                color: Color(hex: "#FFD700"),
                isEnabled: $preferences.sacredGeometryBadgesEnabled
              )
            }
            .padding()
            .background(Color.white.opacity(0.05))
            .cornerRadius(16)
          }
          .padding(.horizontal)
        }

        // Action Buttons
        VStack(spacing: 12) {
          Button(action: {
            preferences.hasSetFeaturePreferences = true
            preferences.hasCompletedOnboarding = true
            onComplete()
          }) {
            Text("Continue")
              .font(.headline)
              .foregroundColor(.black)
              .frame(maxWidth: .infinity)
              .padding()
              .background(Color(hex: "#FFD700"))
              .cornerRadius(12)
          }

          Button(action: {
            preferences.skipOnboarding()
            onComplete()
          }) {
            Text("Skip & Use Defaults (All Enabled)")
              .font(.subheadline)
              .foregroundColor(.white.opacity(0.6))
          }
        }
        .padding()
      }
    }
  }
}

// MARK: - Feature Toggle Component

struct FeatureToggle: View {
  let icon: String
  let title: String
  let subtitle: String
  let color: Color
  @Binding var isEnabled: Bool

  var body: some View {
    HStack(spacing: 12) {
      Image(systemName: icon)
        .font(.title3)
        .foregroundColor(isEnabled ? color : .gray)
        .frame(width: 30)

      VStack(alignment: .leading, spacing: 2) {
        Text(title)
          .font(.subheadline.bold())
          .foregroundColor(isEnabled ? .white : .gray)

        Text(subtitle)
          .font(.caption)
          .foregroundColor(isEnabled ? .white.opacity(0.6) : .gray.opacity(0.5))
      }

      Spacer()

      Toggle("", isOn: $isEnabled)
        .tint(color)
    }
    .padding(.vertical, 4)
  }
}

// MARK: - Feature Preferences Settings View

struct FeaturePreferencesSettingsView: View {
  @ObservedObject private var preferences = FeaturePreferencesManager.shared

  var body: some View {
    ZStack {
      Color(hex: "#1a1a2e").ignoresSafeArea()

      ScrollView {
        VStack(spacing: 24) {
          // Body Consciousness
          VStack(alignment: .leading, spacing: 12) {
            FeatureSectionHeader(icon: "leaf.fill", title: "Body Consciousness", color: .green)

            FeatureToggle(
              icon: "fork.knife",
              title: "Food Consciousness",
              subtitle: "Ingredient scanner, fast food & drinks exposed",
              color: .green,
              isEnabled: $preferences.foodConsciousnessEnabled
            )

            FeatureToggle(
              icon: "drop.fill",
              title: "Hydration Reminders",
              subtitle: "Notifications to drink water",
              color: .cyan,
              isEnabled: $preferences.hydrationRemindersEnabled
            )

            FeatureToggle(
              icon: "clock.fill",
              title: "Fasting Coach",
              subtitle: "Intermittent fasting guidance",
              color: .orange,
              isEnabled: $preferences.fastingCoachEnabled
            )
          }
          .padding()
          .background(Color.white.opacity(0.05))
          .cornerRadius(16)

          // Mind Consciousness
          VStack(alignment: .leading, spacing: 12) {
            FeatureSectionHeader(
              icon: "brain.head.profile", title: "Mind Consciousness", color: .purple)

            FeatureToggle(
              icon: "eye.trianglebadge.exclamationmark",
              title: "Psyop Scanner",
              subtitle: "Media manipulation detector",
              color: .red,
              isEnabled: $preferences.psyopScannerEnabled
            )

            FeatureToggle(
              icon: "waveform.path",
              title: "FlowState",
              subtitle: "Focus sessions & productivity",
              color: .purple,
              isEnabled: $preferences.flowStateEnabled
            )

            FeatureToggle(
              icon: "seal.fill",
              title: "Sacred Geometry Badges",
              subtitle: "Achievement system",
              color: Color(hex: "#FFD700"),
              isEnabled: $preferences.sacredGeometryBadgesEnabled
            )
          }
          .padding()
          .background(Color.white.opacity(0.05))
          .cornerRadius(16)

          // Reset Button
          Button(action: {
            preferences.resetToDefaults()
          }) {
            HStack {
              Image(systemName: "arrow.counterclockwise")
              Text("Reset to Defaults")
            }
            .foregroundColor(.orange)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.orange.opacity(0.1))
            .cornerRadius(12)
          }
        }
        .padding()
      }
    }
    .navigationTitle("Feature Preferences")
  }
}

struct FeatureSectionHeader: View {
  let icon: String
  let title: String
  let color: Color

  var body: some View {
    HStack {
      Image(systemName: icon)
        .foregroundColor(color)
      Text(title)
        .font(.headline)
        .foregroundColor(.white)
    }
  }
}

// MARK: - Preview

struct FeaturePreferencesOnboardingView_Previews: PreviewProvider {
  static var previews: some View {
    FeaturePreferencesOnboardingView(onComplete: {})
  }
}
