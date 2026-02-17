// FeatureFlags.swift
// Aperture
//
// Feature Flag System for MVP Versioning
// Control which features are enabled per release version

import Foundation
import SwiftUI

// MARK: - Feature Flag Manager

@MainActor
final class FeatureFlags: ObservableObject {
  static let shared = FeatureFlags()

  // MARK: - Storage

  private let defaults = UserDefaults.standard
  private let remoteConfigEnabled = false  // Enable when Firebase Remote Config is set up

  // MARK: - Current App Version

  enum AppVersion: String, CaseIterable, Comparable {
    case mvp = "1.0"  // MVP Release
    case v1_1 = "1.1"  // First update
    case v1_2 = "1.2"  // Second update
    case v1_3 = "1.3"  // Third update
    case v2_0 = "2.0"  // Major release
    case v2_1 = "2.1"  //
    case future = "99.0"  // Future features

    static func < (lhs: AppVersion, rhs: AppVersion) -> Bool {
      lhs.numericValue < rhs.numericValue
    }

    var numericValue: Double {
      Double(rawValue) ?? 0
    }
  }

  /// Current deployed version - UPDATE THIS FOR EACH RELEASE
  let currentVersion: AppVersion = .mvp

  // MARK: - Feature Definitions

  /// All features in the app with their target release version
  enum Feature: String, CaseIterable {
    // ═══════════════════════════════════════════════════════════════
    // MVP (1.0) - Core Features
    // ═══════════════════════════════════════════════════════════════

    // Core Modules
    case dragonCompanion = "dragon_companion"
    case psyopScanner = "psyop_scanner"
    case consciousnessAssessment = "consciousness_assessment"
    case alexandriaLibrary = "alexandria_library"
    case courseHub = "course_hub"
    case awakeningArsenal = "awakening_arsenal"

    // MVP Courses
    case courseDragonBall = "course_dragonball"
    case coursePsyopDetection = "course_psyop_detection"
    case courseConsciousness101 = "course_consciousness_101"
    case courseMoneyFundamentals = "course_money_fundamentals"
    case courseSophiaAwakening = "course_sophia_awakening"
    case courseUjatCode = "course_ujat_code"
    case course11thDimension = "course_11th_dimension"

    // Basic Tools
    case basicMeditation = "basic_meditation"
    case breathingExercises = "breathing_exercises"
    case groundingExercises = "grounding_exercises"
    case knowYourRights = "know_your_rights"

    // ═══════════════════════════════════════════════════════════════
    // v1.1 - Premium & Polish
    // ═══════════════════════════════════════════════════════════════

    case premiumPaywall = "premium_paywall"
    case courseProgress = "course_progress"
    case dragonEvolution = "dragon_evolution"
    case offlineDownloads = "offline_downloads"
    case digitalSecurity = "digital_security"
    case governmentTracker = "government_tracker"

    // v1.1 Courses
    case courseEmeraldTablets = "course_emerald_tablets"
    case courseGodMode = "course_godmode"
    case courseBirthChart = "course_birth_chart"

    // ═══════════════════════════════════════════════════════════════
    // v1.2 - Community & Engagement
    // ═══════════════════════════════════════════════════════════════

    case awakeTogether = "awake_together"
    case communityForums = "community_forums"
    case localGroups = "local_groups"
    case mentorshipMatching = "mentorship_matching"
    case mandelaEffects = "mandela_effects"
    case sacredEtymology = "sacred_etymology"

    // ═══════════════════════════════════════════════════════════════
    // v1.3 - Advanced Features
    // ═══════════════════════════════════════════════════════════════

    case multipleDragons = "multiple_dragons"
    case voiceInteraction = "voice_interaction"
    case urlScanning = "url_scanning"
    case realTimeFeedScanner = "realtime_feed_scanner"
    case audioVersions = "audio_versions"
    case aiInsights = "ai_insights"

    // ═══════════════════════════════════════════════════════════════
    // v2.0 - Major Features
    // ═══════════════════════════════════════════════════════════════

    case cloudSync = "cloud_sync"
    case watchOSApp = "watchos_app"
    case visionOSApp = "visionos_app"
    case arPreviews = "ar_previews"
    case patternForecasting = "pattern_forecasting"
    case synchronicityLog = "synchronicity_log"

    // MARK: - Feature Metadata

    var targetVersion: AppVersion {
      switch self {
      // MVP
      case .dragonCompanion, .psyopScanner, .consciousnessAssessment,
        .alexandriaLibrary, .courseHub, .awakeningArsenal,
        .courseDragonBall, .coursePsyopDetection, .courseConsciousness101,
        .courseMoneyFundamentals, .courseSophiaAwakening, .courseUjatCode,
        .course11thDimension, .basicMeditation, .breathingExercises,
        .groundingExercises, .knowYourRights:
        return .mvp

      // v1.1
      case .premiumPaywall, .courseProgress, .dragonEvolution,
        .offlineDownloads, .digitalSecurity, .governmentTracker,
        .courseEmeraldTablets, .courseGodMode, .courseBirthChart:
        return .v1_1

      // v1.2
      case .awakeTogether, .communityForums, .localGroups,
        .mentorshipMatching, .mandelaEffects, .sacredEtymology:
        return .v1_2

      // v1.3
      case .multipleDragons, .voiceInteraction, .urlScanning,
        .realTimeFeedScanner, .audioVersions, .aiInsights:
        return .v1_3

      // v2.0
      case .cloudSync, .watchOSApp, .visionOSApp, .arPreviews,
        .patternForecasting, .synchronicityLog:
        return .v2_0
      }
    }

    var displayName: String {
      switch self {
      case .dragonCompanion: return "Dragon Companion"
      case .psyopScanner: return "Psyop Scanner"
      case .consciousnessAssessment: return "Consciousness Assessment"
      case .alexandriaLibrary: return "Alexandria Library"
      case .courseHub: return "Course Hub"
      case .awakeningArsenal: return "Awakening Arsenal"
      case .courseDragonBall: return "Dragon Ball Awakening Course"
      case .coursePsyopDetection: return "Psyop Detection Course"
      case .courseConsciousness101: return "Consciousness 101 Course"
      case .courseMoneyFundamentals: return "Money Fundamentals Course"
      case .courseSophiaAwakening: return "Pistis Sophia Course"
      case .courseUjatCode: return "Ujat Code Course"
      case .course11thDimension: return "11th Dimension Course"
      case .basicMeditation: return "Basic Meditation"
      case .breathingExercises: return "Breathing Exercises"
      case .groundingExercises: return "Grounding Exercises"
      case .knowYourRights: return "Know Your Rights"
      case .premiumPaywall: return "Premium Subscription"
      case .courseProgress: return "Course Progress Tracking"
      case .dragonEvolution: return "Dragon Evolution System"
      case .offlineDownloads: return "Offline Downloads"
      case .digitalSecurity: return "Digital Security Guide"
      case .governmentTracker: return "Government Tracker"
      case .courseEmeraldTablets: return "Emerald Tablets Course"
      case .courseGodMode: return "GodMode Course"
      case .courseBirthChart: return "Birth Chart Course"
      case .awakeTogether: return "AwakeTogether Community"
      case .communityForums: return "Community Forums"
      case .localGroups: return "Local Groups"
      case .mentorshipMatching: return "Mentorship Matching"
      case .mandelaEffects: return "Mandela Effects"
      case .sacredEtymology: return "Sacred Etymology"
      case .multipleDragons: return "Multiple Dragons"
      case .voiceInteraction: return "Voice Interaction"
      case .urlScanning: return "URL Scanning"
      case .realTimeFeedScanner: return "Real-Time Feed Scanner"
      case .audioVersions: return "Audio Versions"
      case .aiInsights: return "AI Insights"
      case .cloudSync: return "Cloud Sync"
      case .watchOSApp: return "watchOS App"
      case .visionOSApp: return "visionOS App"
      case .arPreviews: return "AR Previews"
      case .patternForecasting: return "Pattern Forecasting"
      case .synchronicityLog: return "Synchronicity Log"
      }
    }

    var isPremium: Bool {
      switch self {
      case .courseEmeraldTablets, .courseGodMode, .multipleDragons,
        .voiceInteraction, .aiInsights, .mentorshipMatching,
        .audioVersions, .patternForecasting:
        return true
      default:
        return false
      }
    }
  }

  // MARK: - Feature Checking

  /// Check if a feature is enabled for current version
  func isEnabled(_ feature: Feature) -> Bool {
    // Check version-based availability
    let versionEnabled = feature.targetVersion <= currentVersion

    // Check for override (useful for testing)
    let overrideKey = "feature_override_\(feature.rawValue)"
    if let override = defaults.object(forKey: overrideKey) as? Bool {
      return override
    }

    // Check kill switch (disable feature remotely)
    let killKey = "feature_kill_\(feature.rawValue)"
    if defaults.bool(forKey: killKey) {
      return false
    }

    return versionEnabled
  }

  /// Check if feature requires premium
  func requiresPremium(_ feature: Feature) -> Bool {
    feature.isPremium
  }

  // MARK: - Debug Overrides

  /// Force enable a feature (for testing)
  func enableFeature(_ feature: Feature) {
    defaults.set(true, forKey: "feature_override_\(feature.rawValue)")
    objectWillChange.send()
  }

  /// Force disable a feature (for testing)
  func disableFeature(_ feature: Feature) {
    defaults.set(false, forKey: "feature_override_\(feature.rawValue)")
    objectWillChange.send()
  }

  /// Reset feature to version-based default
  func resetFeature(_ feature: Feature) {
    defaults.removeObject(forKey: "feature_override_\(feature.rawValue)")
    objectWillChange.send()
  }

  /// Reset all overrides
  func resetAllOverrides() {
    for feature in Feature.allCases {
      defaults.removeObject(forKey: "feature_override_\(feature.rawValue)")
    }
    objectWillChange.send()
  }

  // MARK: - Feature Lists

  /// Get all features for a specific version
  func features(for version: AppVersion) -> [Feature] {
    Feature.allCases.filter { $0.targetVersion == version }
  }

  /// Get all currently enabled features
  var enabledFeatures: [Feature] {
    Feature.allCases.filter { isEnabled($0) }
  }

  /// Get all upcoming features (not yet released)
  var upcomingFeatures: [Feature] {
    Feature.allCases.filter { $0.targetVersion > currentVersion }
  }

  /// Get features by version for roadmap display
  var roadmap: [(version: AppVersion, features: [Feature])] {
    AppVersion.allCases.compactMap { version in
      let versionFeatures = features(for: version)
      guard !versionFeatures.isEmpty else { return nil }
      return (version, versionFeatures)
    }
  }
}

// MARK: - SwiftUI Integration

/// View modifier to conditionally show content based on feature flag
struct FeatureFlagModifier: ViewModifier {
  let feature: FeatureFlags.Feature
  @ObservedObject var flags = FeatureFlags.shared

  func body(content: Content) -> some View {
    if flags.isEnabled(feature) {
      content
    }
  }
}

extension View {
  /// Only show this view if the feature is enabled
  func featureFlag(_ feature: FeatureFlags.Feature) -> some View {
    modifier(FeatureFlagModifier(feature: feature))
  }
}

// MARK: - Premium Gate Modifier

struct PremiumGateModifier: ViewModifier {
  let feature: FeatureFlags.Feature
  @ObservedObject var flags = FeatureFlags.shared
  @State private var showPaywall = false

  func body(content: Content) -> some View {
    Group {
      if flags.requiresPremium(feature) {
        // Show locked state or paywall trigger
        content
          .overlay(
            PremiumLockedOverlay(feature: feature, showPaywall: $showPaywall)
          )
      } else {
        content
      }
    }
    .sheet(isPresented: $showPaywall) {
      // PremiumPaywallView()  // Uncomment when built
      Text("Premium Paywall Coming Soon")
    }
  }
}

struct PremiumLockedOverlay: View {
  let feature: FeatureFlags.Feature
  @Binding var showPaywall: Bool

  var body: some View {
    ZStack {
      Color.black.opacity(0.7)

      VStack(spacing: 16) {
        Image(systemName: "lock.fill")
          .font(.system(size: 40))
          .foregroundColor(.yellow)

        Text("\(feature.displayName)")
          .font(.headline)
          .foregroundColor(.white)

        Text("Premium Feature")
          .font(.subheadline)
          .foregroundColor(.white.opacity(0.7))

        Button {
          showPaywall = true
        } label: {
          Text("Unlock Premium")
            .fontWeight(.semibold)
            .foregroundColor(.black)
            .padding(.horizontal, 24)
            .padding(.vertical, 12)
            .background(Color.yellow)
            .cornerRadius(20)
        }
      }
    }
  }
}

extension View {
  /// Gate this view behind premium if feature requires it
  func premiumGate(_ feature: FeatureFlags.Feature) -> some View {
    modifier(PremiumGateModifier(feature: feature))
  }
}

// MARK: - Debug View

#if DEBUG
  struct FeatureFlagsDebugView: View {
    @ObservedObject var flags = FeatureFlags.shared

    var body: some View {
      NavigationStack {
        List {
          Section("Current Version: \(flags.currentVersion.rawValue)") {
            Text("Enabled: \(flags.enabledFeatures.count) features")
            Text("Upcoming: \(flags.upcomingFeatures.count) features")
          }

          ForEach(flags.roadmap, id: \.version) { item in
            Section(header: Text("Version \(item.version.rawValue)")) {
              ForEach(item.features, id: \.rawValue) { feature in
                FeatureRow(feature: feature)
              }
            }
          }
        }
        .navigationTitle("Feature Flags")
        .toolbar {
          ToolbarItem(placement: .topBarTrailing) {
            Button("Reset All") {
              flags.resetAllOverrides()
            }
          }
        }
      }
    }
  }

  struct FeatureRow: View {
    let feature: FeatureFlags.Feature
    @ObservedObject var flags = FeatureFlags.shared

    var body: some View {
      HStack {
        VStack(alignment: .leading, spacing: 4) {
          HStack {
            Text(feature.displayName)
              .font(.body)

            if feature.isPremium {
              Image(systemName: "star.fill")
                .foregroundColor(.yellow)
                .font(.caption)
            }
          }

          Text(feature.rawValue)
            .font(.caption)
            .foregroundColor(.secondary)
        }

        Spacer()

        Toggle(
          "",
          isOn: Binding(
            get: { flags.isEnabled(feature) },
            set: { enabled in
              if enabled {
                flags.enableFeature(feature)
              } else {
                flags.disableFeature(feature)
              }
            }
          ))
      }
    }
  }

  #Preview {
    FeatureFlagsDebugView()
  }
#endif
