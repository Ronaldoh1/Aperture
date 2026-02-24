// MoreView.swift

import SwiftUI

struct MoreView: View {

    @Binding var selectedTab: Int
    @State private var showAlexandria = false
    @State private var showProfile = false
    @State private var showBadgeCollection = false
    @State private var showSettings = false
    @State private var showFAQ = false
    @State private var showAbout = false
    @State private var showJourneyProgress = false
    @State private var showBookmarks = false
    @State private var showFlowState = false
    @State private var showFoodConsciousness = false
    @State private var showSourceLibrary = false
    @State private var showCosmicNotes = false
    @State private var showUnlearn = false
    @State private var showSignalNoise = false
    @State private var showSocialHygiene = false
    @State private var showEconomyWakeUp = false
    @State private var showPrintableExport = false
    @State private var showVoiceScanner = false
    @State private var showSystemicExposure = false
    @State private var showRevelations = false
    @State private var showAccountability = false
    @State private var showAppSettings = false
    @State private var showSunFlowState = false
    @State private var showDiveDeeper = false
    @State private var showFeedback = false
    @State private var showVoiceSettings = false

    var body: some View {

        NavigationStack {

            ZStack {

                CosmicBackground(starCount: 60)

                ScrollView(showsIndicators: false) {

                    VStack(spacing: 24) {

                        MoreHeaderSection()

                        menuSection

                        MoreAppInfoSection()

                        Spacer(minLength: 100)

                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 20)

                }

            }
            .navigationTitle("")
            .navigationBarHidden(true)
            .navigationDestination(isPresented: $showAlexandria) {
                AlexandriaEntryView(container: AppContainer.shared.container) { route in
                    print("🟠 MoreView: Alexandria route - \(route)")
                }
            }
            .navigationDestination(isPresented: $showProfile) {
                ProfileEntryView(container: AppContainer.shared.container) { route in
                    print("🟠 MoreView: Profile route - \(route)")
                }
            }
            .navigationDestination(isPresented: $showBadgeCollection) {
                BadgeCollectionView()
            }
            .navigationDestination(isPresented: $showFAQ) {
                FAQView()
            }
            .navigationDestination(isPresented: $showSettings) {
                SettingsView()
            }
            .navigationDestination(isPresented: $showAbout) {
                AboutApertureView()
            }
            .navigationDestination(isPresented: $showJourneyProgress) {
                JourneyProgressView()
            }
            .navigationDestination(isPresented: $showBookmarks) {
                BookmarksView(selectedTab: $selectedTab)
            }
            .navigationDestination(isPresented: $showFlowState) {
                FlowStateView()
            }
            .navigationDestination(isPresented: $showFoodConsciousness) {
                FoodConsciousnessView()
            }
            .navigationDestination(isPresented: $showSourceLibrary) {
                SourceLibraryView()
            }
            .navigationDestination(isPresented: $showCosmicNotes) {
                CosmicNotesView()
            }
            .navigationDestination(isPresented: $showUnlearn) {
                UnlearnModuleView()
            }
            .navigationDestination(isPresented: $showSignalNoise) {
                SignalVsNoiseView()
            }
            .navigationDestination(isPresented: $showSocialHygiene) {
                SocialMediaHygieneView()
            }
            .navigationDestination(isPresented: $showEconomyWakeUp) {
                EconomyWakeUpView()
            }
            .navigationDestination(isPresented: $showPrintableExport) {
                PrintableExportView()
            }
            .navigationDestination(isPresented: $showVoiceScanner) {
                VoiceLabelScannerView()
            }
            .navigationDestination(isPresented: $showSystemicExposure) {
                SystemicExposureView()
            }
            .navigationDestination(isPresented: $showRevelations) {
                RevelationsView()
            }
            .navigationDestination(isPresented: $showAccountability) {
                AccountabilityHubView()
            }
            .navigationDestination(isPresented: $showAppSettings) {
                AppSettingsView()
            }
            .navigationDestination(isPresented: $showSunFlowState) {
                SunFlowStateHub()
            }
            .navigationDestination(isPresented: $showDiveDeeper) {
                DiveDeeperHub()
            }
            .navigationDestination(isPresented: $showFeedback) {
                FeedbackFormView()
            }
            .navigationDestination(isPresented: $showVoiceSettings) {
                VoicePickerView()
            }

        }

    }

    private func sectionDivider(_ title: String) -> some View {
        HStack(spacing: 10) {
            Rectangle()
                .fill(
                    LinearGradient(
                        colors: [Color.clear, Palette.text.muted.opacity(0.2)],
                        startPoint: .leading, endPoint: .trailing
                    )
                )
                .frame(height: 1)
            Text(title.uppercased())
                .font(.system(size: 10, weight: .bold, design: .rounded))
                .foregroundColor(Palette.text.muted)
                .tracking(2)
            Rectangle()
                .fill(
                    LinearGradient(
                        colors: [Palette.text.muted.opacity(0.2), Color.clear],
                        startPoint: .leading, endPoint: .trailing
                    )
                )
                .frame(height: 1)
        }
        .padding(.vertical, 4)
    }

    private var menuSection: some View {

        VStack(spacing: 14) {

            sectionDivider("Featured")

            // SACRED GEOMETRY BADGES - Featured at top
            MoreMenuCard(
                icon: "seal.fill",
                title: "Sacred Geometry",
                subtitle: "Your earned badges & achievements",
                color: Color(hex: "#FFD700"),
                badge: "✨ \(SacredBadgeManager.shared.totalBadgeCount)"
            ) {
                showBadgeCollection = true
            }
            
            // REVELATIONS — NEW
            MoreMenuCard(
                icon: "eye.fill",
                title: "Revelations",
                subtitle: "App tracking, data harvesting & behavioral exploitation",
                color: Color(hex: "#E74C3C"),
                badge: "🔮 NEW"
            ) {
                showRevelations = true
            }
            
            // ACCOUNTABILITY BUDDY — NEW
            MoreMenuCard(
                icon: "figure.2.arms.open",
                title: "Accountability",
                subtitle: "Daily reports, morning routines & goals",
                color: Color(red: 1.0, green: 0.85, blue: 0.3),
                badge: "☀️ NEW"
            ) {
                showAccountability = true
            }
            
            // SUN FLOW STATE — Cognitive Sovereignty OS
            MoreMenuCard(
                icon: "brain.head.profile",
                title: "Sun Flow State",
                subtitle: SunFlowUnlockGate.isUnlocked ? "Your mental operating system" : "🔒 Earn \(SunFlowUnlockGate.badgesNeeded) more badges",
                color: Color(red: 1.0, green: 0.85, blue: 0.3),
                badge: SunFlowUnlockGate.isUnlocked ? "☀️ OS" : "🔒"
            ) {
                showSunFlowState = true
            }
            
            // DIVE DEEPER — Iceberg explorations
            MoreMenuCard(
                icon: "arrow.down.to.line",
                title: "Dive Deeper",
                subtitle: "Interrogate beyond the surface level 👀",
                color: Color(red: 0.3, green: 0.7, blue: 0.9),
                badge: "🔺"
            ) {
                showDiveDeeper = true
            }

            sectionDivider("Library")

            // ALEXANDRIA - Sacred Library (moved from tab bar)
            MoreMenuCard(
                icon: "books.vertical.fill",
                title: "Alexandria",
                subtitle: "Sacred Library & primary sources",
                color: Palette.primary.violet,
                badge: nil
            ) {
                showAlexandria = true
            }

            // PROFILE
            MoreMenuCard(
                icon: "person.circle.fill",
                title: "Profile",
                subtitle: "Your spiritual journey stats",
                color: Palette.primary.cyan,
                badge: nil
            ) {
                showProfile = true
            }

            sectionDivider("Your Journey")

            // JOURNEY PROGRESS (NEW)
            MoreMenuCard(
                icon: "chart.line.uptrend.xyaxis",
                title: "Journey Progress",
                subtitle: "Track your awakening journey",
                color: .green,
                badge: nil
            ) {
                showJourneyProgress = true
            }

            // BOOKMARKS (NEW)
            MoreMenuCard(
                icon: "bookmark.fill",
                title: "Bookmarks",
                subtitle: "Saved content for later",
                color: Palette.accent.gold,
                badge: nil
            ) {
                showBookmarks = true
            }

            sectionDivider("Tools")

            // FLOWSTATE (PREMIUM)
            MoreMenuCard(
                icon: "brain.head.profile",
                title: "FlowState",
                subtitle: "AI-guided focus sessions",
                color: .purple,
                badge: "✨ PRO"
            ) {
                showFlowState = true
            }
            
            // COSMIC NOTES (Universal)
            MoreMenuCard(
                icon: "note.text.badge.plus",
                title: "Cosmic Notes",
                subtitle: "Notes, tasks & checklists — everywhere",
                color: Color(red: 0.4, green: 0.7, blue: 1.0),
                badge: "📝 NEW"
            ) {
                showCosmicNotes = true
            }
            
            // UNLEARN (Deprogramming)
            MoreMenuCard(
                icon: "brain.head.profile",
                title: "Unlearn",
                subtitle: "Deprogram inherited bias through awareness",
                color: Color(red: 0.3, green: 0.8, blue: 0.5),
                badge: "🌍 NEW"
            ) {
                showUnlearn = true
            }
            
            // SIGNAL vs NOISE
            MoreMenuCard(
                icon: "antenna.radiowaves.left.and.right",
                title: "Signal vs Noise",
                subtitle: "See through the media static",
                color: .cyan,
                badge: "📡 NEW"
            ) {
                showSignalNoise = true
            }
            
            // DIGITAL HYGIENE
            MoreMenuCard(
                icon: "shield.checkered",
                title: "Digital Hygiene",
                subtitle: "Clean your feed, clear your mind",
                color: Color(red: 0.2, green: 0.7, blue: 0.9),
                badge: "🧹 NEW"
            ) {
                showSocialHygiene = true
            }
            
            // ECONOMY WAKE-UP
            MoreMenuCard(
                icon: "banknote.fill",
                title: "Economy Wake-Up",
                subtitle: "What's happening while you're distracted",
                color: Color(red: 1.0, green: 0.85, blue: 0.3),
                badge: "💰 NEW"
            ) {
                showEconomyWakeUp = true
            }
            
            // PRINTABLE EXPORTS
            MoreMenuCard(
                icon: "printer.fill",
                title: "Print & Share",
                subtitle: "PDF cheat sheets for your fridge",
                color: .green,
                badge: "🖨️ NEW"
            ) {
                showPrintableExport = true
            }
            
            // VOICE SCANNER
            MoreMenuCard(
                icon: "mic.fill",
                title: "Voice Scanner",
                subtitle: "Hands-free label checking",
                color: .cyan,
                badge: "🎙️ NEW"
            ) {
                showVoiceScanner = true
            }
            
            // SYSTEMIC EXPOSURE
            MoreMenuCard(
                icon: "eye.trianglebadge.exclamationmark.fill",
                title: "Systemic Exposure",
                subtitle: "What else did they lie about?",
                color: .red,
                badge: "🔥 NEW"
            ) {
                showSystemicExposure = true
            }
            
            // FOOD CONSCIOUSNESS
            if FeaturePreferencesManager.shared.foodConsciousnessEnabled {
                MoreMenuCard(
                    icon: "leaf.circle.fill",
                    title: "Food Consciousness",
                    subtitle: "Scan ingredients, expose fast food & drinks",
                    color: .green,
                    badge: "🧬 NEW"
                ) {
                    showFoodConsciousness = true
                }
            }

            sectionDivider("Info & Support")

            // SOURCES & FURTHER READING
            MoreMenuCard(
                icon: "checkmark.shield.fill",
                title: "Sources & Further Reading",
                subtitle: "Citations, primary texts, and transparency",
                color: Palette.accent.gold,
                badge: "📚"
            ) {
                showSourceLibrary = true
            }

            // VOICE SETTINGS
            MoreMenuCard(
                icon: "person.wave.2.fill",
                title: "Voice Settings",
                subtitle: "Choose narration voice, style & speed",
                color: Palette.primary.cyan,
                badge: nil
            ) {
                showVoiceSettings = true
            }

            // SETTINGS
            MoreMenuCard(
                icon: "gearshape.fill",
                title: "Settings",
                subtitle: "Notifications, permissions & preferences",
                color: Palette.text.muted,
                badge: nil
            ) {
                showAppSettings = true
            }

            // SEND FEEDBACK — Firebase powered
            MoreMenuCard(
                icon: "bubble.left.and.bubble.right.fill",
                title: "Send Feedback",
                subtitle: "Bug reports, feature requests, love notes ☀️",
                color: Color(hex: "#00BCD4"),
                badge: nil
            ) {
                showFeedback = true
            }

            // FAQ
            MoreMenuCard(
                icon: "questionmark.circle.fill",
                title: "FAQ",
                subtitle: "Common questions answered",
                color: Palette.accent.gold,
                badge: nil
            ) {
                showFAQ = true
            }

            // ABOUT
            MoreMenuCard(
                icon: "info.circle.fill",
                title: "About Aperture",
                subtitle: "The truth shall set you free",
                color: Palette.primary.violet,
                badge: nil
            ) {
                showAbout = true
            }

        }

    }

}
