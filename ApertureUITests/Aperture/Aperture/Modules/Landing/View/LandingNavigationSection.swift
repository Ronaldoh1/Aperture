// LandingNavigationSection.swift

import SwiftUI

struct LandingNavigationSection: View {

    @Binding var selectedTab: Int

    var body: some View {

        VStack(spacing: 16) {

            HStack {
                Text("EXPLORE")
                    .font(.system(size: 12, weight: .bold, design: .rounded))
                    .foregroundColor(Palette.text.muted)
                    .tracking(2)
                Spacer()
            }

            LazyVGrid(columns: [
                GridItem(.flexible(), spacing: 16),
                GridItem(.flexible(), spacing: 16)
            ], spacing: 16) {

                NavigationCard(
                    icon: "clock.arrow.circlepath",
                    title: "Timeline",
                    subtitle: "Hidden History",
                    color: Palette.primary.violet
                ) {
                    selectedTab = 1
                }

                NavigationCard(
                    icon: "globe.americas.fill",
                    title: "Cosmos",
                    subtitle: "Gnostic Realms",
                    color: Palette.primary.cyan
                ) {
                    selectedTab = 2
                }

                NavigationCard(
                    icon: "sun.max.fill",
                    title: "Awakening",
                    subtitle: "13 Traditions",
                    color: Palette.accent.gold
                ) {
                    selectedTab = 3  // Awakening is now tab 3
                }

                // Alexandria - Animated CTA (pulses until tapped 5 times)
                AlexandriaCallToActionCard(selectedTab: $selectedTab)

            }

        }

    }

}
