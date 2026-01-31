// FeatureFlagManager.swift
// Kill Switch System for Beta Testing
// Toggle features on/off via Firebase Remote Config
// Default: ALL ON for beta testing

import Foundation
import SwiftUI
// import FirebaseRemoteConfig // Uncomment when Firebase is added

// MARK: - Feature Flag Keys

enum FeatureFlag: String, CaseIterable {
    // AwakeTogether Suite
    case hakaiHate = "hakai_hate_enabled"
    case awakeningTracker = "awakening_tracker_enabled"
    case ideologyMapper = "ideology_mapper_enabled"
    case narrativeDeprogrammer = "narrative_deprogrammer_enabled"
    case mindShield = "mind_shield_enabled"
    case realityAnchor = "reality_anchor_enabled"
    case equityWeave = "equity_weave_enabled"
    case sereneMindfulness = "serene_mindfulness_enabled"
    
    // Sub-features
    case voiceJournal = "voice_journal_enabled"
    case localAI = "local_ai_enabled"
    case hapticFeedback = "haptic_feedback_enabled"
    case widgetSupport = "widget_support_enabled"
    
    // Backend features (V2 - default OFF)
    case cloudSync = "cloud_sync_enabled"
    case externalAI = "external_ai_enabled" // ChatGPT/Claude/Grok
    case webAccess = "web_access_enabled"
    case anonymizedAggregation = "anonymized_aggregation_enabled"
    
    var displayName: String {
        switch self {
        case .hakaiHate: return "Hakai Hate (Post Checker)"
        case .awakeningTracker: return "Awakening Tracker"
        case .ideologyMapper: return "Ideology Mapper"
        case .narrativeDeprogrammer: return "Narrative Deprogrammer"
        case .mindShield: return "MindShield"
        case .realityAnchor: return "Reality Anchor Tools"
        case .equityWeave: return "EquityWeave"
        case .sereneMindfulness: return "Serene Mindfulness"
        case .voiceJournal: return "Voice Journal"
        case .localAI: return "Local AI (On-Device)"
        case .hapticFeedback: return "Haptic Feedback"
        case .widgetSupport: return "Widget Support"
        case .cloudSync: return "Cloud Sync (V2)"
        case .externalAI: return "External AI APIs (V2)"
        case .webAccess: return "Web Access (V2)"
        case .anonymizedAggregation: return "Anonymized Data (V2)"
        }
    }
    
    var description: String {
        switch self {
        case .hakaiHate: return "AI checks posts for hate/division before sharing"
        case .awakeningTracker: return "Track your awakening journey with milestones"
        case .ideologyMapper: return "Visualize ideological programming and overlaps"
        case .narrativeDeprogrammer: return "Daily Socratic questioning to unpack conditioning"
        case .mindShield: return "Scan media diet for manipulation patterns"
        case .realityAnchor: return "Grounding exercises and biofeedback"
        case .equityWeave: return "Analyze offers and understand economic systems"
        case .sereneMindfulness: return "Calm-like experience with behavioral nudges"
        case .voiceJournal: return "Hold-to-record voice notes with transcription"
        case .localAI: return "Use Apple's on-device AI (no internet needed)"
        case .hapticFeedback: return "Tactile feedback for positive reinforcement"
        case .widgetSupport: return "Home screen widgets for reality checks"
        case .cloudSync: return "Sync journal entries to cloud"
        case .externalAI: return "ChatGPT, Claude, or Grok integration"
        case .webAccess: return "Access journal from web browser"
        case .anonymizedAggregation: return "Contribute to collective insights"
        }
    }
    
    var isV2Feature: Bool {
        switch self {
        case .cloudSync, .externalAI, .webAccess, .anonymizedAggregation:
            return true
        default:
            return false
        }
    }
    
    // Default values - MVP features ON, V2 features OFF
    var defaultValue: Bool {
        !isV2Feature // MVP = ON, V2 = OFF
    }
}

// MARK: - Feature Flag Manager

@MainActor
class FeatureFlagManager: ObservableObject {
    static let shared = FeatureFlagManager()
    
    // Published flags for SwiftUI reactivity
    @Published private var flags: [FeatureFlag: Bool] = [:]
    
    // Local override storage (for testing without Firebase)
    private let localOverrideKey = "feature_flag_overrides"
    
    // Firebase Remote Config (uncomment when ready)
    // private var remoteConfig: RemoteConfig?
    
    private init() {
        loadDefaults()
        loadLocalOverrides()
        // setupFirebaseRemoteConfig() // Uncomment when Firebase is added
    }
    
    // MARK: - Public API
    
    func isEnabled(_ flag: FeatureFlag) -> Bool {
        flags[flag] ?? flag.defaultValue
    }
    
    func setEnabled(_ flag: FeatureFlag, enabled: Bool) {
        flags[flag] = enabled
        saveLocalOverrides()
        objectWillChange.send()
    }
    
    func resetToDefaults() {
        for flag in FeatureFlag.allCases {
            flags[flag] = flag.defaultValue
        }
        UserDefaults.standard.removeObject(forKey: localOverrideKey)
        objectWillChange.send()
    }
    
    func enableAllMVP() {
        for flag in FeatureFlag.allCases where !flag.isV2Feature {
            flags[flag] = true
        }
        saveLocalOverrides()
        objectWillChange.send()
    }
    
    func disableAllV2() {
        for flag in FeatureFlag.allCases where flag.isV2Feature {
            flags[flag] = false
        }
        saveLocalOverrides()
        objectWillChange.send()
    }
    
    // MARK: - Private Helpers
    
    private func loadDefaults() {
        for flag in FeatureFlag.allCases {
            flags[flag] = flag.defaultValue
        }
    }
    
    private func loadLocalOverrides() {
        guard let data = UserDefaults.standard.data(forKey: localOverrideKey),
              let overrides = try? JSONDecoder().decode([String: Bool].self, from: data) else {
            return
        }
        
        for (key, value) in overrides {
            if let flag = FeatureFlag(rawValue: key) {
                flags[flag] = value
            }
        }
    }
    
    private func saveLocalOverrides() {
        let overrides = Dictionary(uniqueKeysWithValues: flags.map { ($0.key.rawValue, $0.value) })
        if let data = try? JSONEncoder().encode(overrides) {
            UserDefaults.standard.set(data, forKey: localOverrideKey)
        }
    }
    
    // MARK: - Firebase Remote Config (V2)
    
    /*
    private func setupFirebaseRemoteConfig() {
        remoteConfig = RemoteConfig.remoteConfig()
        
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 3600 // 1 hour for production
        // settings.minimumFetchInterval = 0 // For testing
        remoteConfig?.configSettings = settings
        
        // Set defaults
        var defaults: [String: NSObject] = [:]
        for flag in FeatureFlag.allCases {
            defaults[flag.rawValue] = flag.defaultValue as NSObject
        }
        remoteConfig?.setDefaults(defaults)
        
        // Fetch and activate
        fetchRemoteConfig()
    }
    
    func fetchRemoteConfig() {
        remoteConfig?.fetch { [weak self] status, error in
            if status == .success {
                self?.remoteConfig?.activate { _, _ in
                    DispatchQueue.main.async {
                        self?.applyRemoteConfig()
                    }
                }
            }
        }
    }
    
    private func applyRemoteConfig() {
        guard let remoteConfig = remoteConfig else { return }
        
        for flag in FeatureFlag.allCases {
            let value = remoteConfig.configValue(forKey: flag.rawValue).boolValue
            flags[flag] = value
        }
        objectWillChange.send()
    }
    */
}

// MARK: - Feature Flag View Modifier

struct FeatureEnabled: ViewModifier {
    let flag: FeatureFlag
    @ObservedObject private var manager = FeatureFlagManager.shared
    
    func body(content: Content) -> some View {
        if manager.isEnabled(flag) {
            content
        }
    }
}

extension View {
    func featureEnabled(_ flag: FeatureFlag) -> some View {
        modifier(FeatureEnabled(flag: flag))
    }
}

// MARK: - Beta Testing Control Panel

struct BetaControlPanelView: View {
    @ObservedObject private var flagManager = FeatureFlagManager.shared
    @State private var showingResetAlert = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Header
                headerSection
                
                // Quick Actions
                quickActionsSection
                
                // MVP Features
                mvpFeaturesSection
                
                // V2 Features
                v2FeaturesSection
                
                // Reset
                resetSection
            }
            .padding()
        }
        .background(Color.black.ignoresSafeArea())
        .navigationTitle("Beta Control Panel")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Reset All Flags?", isPresented: $showingResetAlert) {
            Button("Cancel", role: .cancel) { }
            Button("Reset", role: .destructive) {
                flagManager.resetToDefaults()
            }
        } message: {
            Text("This will reset all feature flags to their default values.")
        }
    }
    
    // MARK: - Header
    
    private var headerSection: some View {
        VStack(spacing: 12) {
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(
                            colors: [.orange, .red],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 70, height: 70)
                
                Image(systemName: "switch.2")
                    .font(.system(size: 28))
                    .foregroundColor(.white)
            }
            
            Text("KILL SWITCH CONTROL")
                .font(.system(size: 20, weight: .black))
                .foregroundColor(.white)
            
            Text("Toggle features for beta testing")
                .font(.system(size: 13))
                .foregroundColor(.gray)
            
            HStack(spacing: 8) {
                Circle()
                    .fill(Color.green)
                    .frame(width: 8, height: 8)
                Text("Beta Mode Active")
                    .font(.system(size: 11, weight: .medium))
                    .foregroundColor(.green)
            }
        }
    }
    
    // MARK: - Quick Actions
    
    private var quickActionsSection: some View {
        VStack(spacing: 12) {
            HStack {
                Image(systemName: "bolt.fill")
                    .foregroundColor(.yellow)
                Text("QUICK ACTIONS")
                    .font(.system(size: 12, weight: .black))
                    .foregroundColor(.yellow)
                Spacer()
            }
            
            HStack(spacing: 12) {
                Button(action: { flagManager.enableAllMVP() }) {
                    HStack {
                        Image(systemName: "checkmark.circle.fill")
                        Text("Enable All MVP")
                            .font(.system(size: 12, weight: .semibold))
                    }
                    .foregroundColor(.white)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 10)
                    .background(Color.green)
                    .cornerRadius(8)
                }
                
                Button(action: { flagManager.disableAllV2() }) {
                    HStack {
                        Image(systemName: "xmark.circle.fill")
                        Text("Disable V2")
                            .font(.system(size: 12, weight: .semibold))
                    }
                    .foregroundColor(.white)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 10)
                    .background(Color.orange)
                    .cornerRadius(8)
                }
            }
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(12)
    }
    
    // MARK: - MVP Features
    
    private var mvpFeaturesSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "star.fill")
                    .foregroundColor(.cyan)
                Text("MVP FEATURES (Local/No Backend)")
                    .font(.system(size: 12, weight: .black))
                    .foregroundColor(.cyan)
                Spacer()
            }
            
            ForEach(FeatureFlag.allCases.filter { !$0.isV2Feature }, id: \.self) { flag in
                featureToggleRow(flag)
            }
        }
        .padding()
        .background(Color.cyan.opacity(0.1))
        .cornerRadius(12)
    }
    
    // MARK: - V2 Features
    
    private var v2FeaturesSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "cloud.fill")
                    .foregroundColor(.purple)
                Text("V2 FEATURES (Backend Required)")
                    .font(.system(size: 12, weight: .black))
                    .foregroundColor(.purple)
                Spacer()
            }
            
            Text("These features require backend infrastructure")
                .font(.system(size: 11))
                .foregroundColor(.gray)
            
            ForEach(FeatureFlag.allCases.filter { $0.isV2Feature }, id: \.self) { flag in
                featureToggleRow(flag)
            }
        }
        .padding()
        .background(Color.purple.opacity(0.1))
        .cornerRadius(12)
    }
    
    private func featureToggleRow(_ flag: FeatureFlag) -> some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                Text(flag.displayName)
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.white)
                Text(flag.description)
                    .font(.system(size: 10))
                    .foregroundColor(.gray)
                    .lineLimit(1)
            }
            
            Spacer()
            
            Toggle("", isOn: Binding(
                get: { flagManager.isEnabled(flag) },
                set: { flagManager.setEnabled(flag, enabled: $0) }
            ))
            .labelsHidden()
            .tint(flag.isV2Feature ? .purple : .cyan)
        }
        .padding(.vertical, 4)
    }
    
    // MARK: - Reset
    
    private var resetSection: some View {
        Button(action: { showingResetAlert = true }) {
            HStack {
                Image(systemName: "arrow.counterclockwise")
                Text("Reset All to Defaults")
                    .font(.system(size: 14, weight: .semibold))
            }
            .foregroundColor(.red)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.red.opacity(0.1))
            .cornerRadius(12)
        }
    }
}

#Preview {
    NavigationView {
        BetaControlPanelView()
    }
}
