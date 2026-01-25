// MoreView.swift

import SwiftUI

struct MoreView: View {

    @Binding var selectedTab: Int
    @State private var showAwakening = false
    @State private var showProfile = false
    @State private var showDragonCompanion = false

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
            .navigationDestination(isPresented: $showAwakening) {
                AwakeningEntryView(presenter: AppContainer.shared.container.resolve(AwakeningPresenterType.self)!)
            }
            .navigationDestination(isPresented: $showProfile) {
                ProfileEntryView(container: AppContainer.shared.container) { route in
                    print("🟠 MoreView: Profile route - \(route)")
                }
            }
            .navigationDestination(isPresented: $showDragonCompanion) {
                DragonCompanionView()
            }

        }

    }

    private var menuSection: some View {

        VStack(spacing: 16) {

            // DRAGON COMPANION - Featured at top
            MoreMenuCard(
                icon: "flame.fill",
                title: "Dragon Companion",
                subtitle: "Your awakening partner grows with you",
                color: Color(hex: "#FF6B35"),
                badge: "🥚 NEW"
            ) {
                showDragonCompanion = true
            }

            MoreMenuCard(
                icon: "sun.max.fill",
                title: "Awakening",
                subtitle: "Courses & consciousness training",
                color: Palette.accent.gold,
                badge: "13 courses"
            ) {
                showAwakening = true
            }

            MoreMenuCard(
                icon: "person.circle.fill",
                title: "Profile",
                subtitle: "Your spiritual journey stats",
                color: Palette.primary.cyan,
                badge: nil
            ) {
                showProfile = true
            }

            MoreMenuCard(
                icon: "gearshape.fill",
                title: "Settings",
                subtitle: "Customize your experience",
                color: Palette.text.muted,
                badge: nil
            ) {
                // TODO: Navigate to settings
            }

            MoreMenuCard(
                icon: "info.circle.fill",
                title: "About Aperture",
                subtitle: "The truth shall set you free",
                color: Palette.primary.violet,
                badge: nil
            ) {
                // TODO: Navigate to about
            }

        }

    }

}
