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

        }

    }

    private var menuSection: some View {

        VStack(spacing: 16) {

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

            // SETTINGS
            MoreMenuCard(
                icon: "gearshape.fill",
                title: "Settings",
                subtitle: "Customize your experience",
                color: Palette.text.muted,
                badge: nil
            ) {
                showSettings = true
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
