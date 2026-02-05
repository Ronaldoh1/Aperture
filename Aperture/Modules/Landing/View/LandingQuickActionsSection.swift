// LandingQuickActionsSection.swift

import SwiftUI

struct LandingQuickActionsSection: View {

    @Binding var selectedTab: Int

    var body: some View {

        VStack(spacing: 16) {

            HStack {
                Text("QUICK START")
                    .font(.system(size: 12, weight: .bold, design: .rounded))
                    .foregroundColor(Palette.text.muted)
                    .tracking(2)
                Spacer()
            }

            VStack(spacing: 12) {

                QuickActionRow(
                    icon: "play.circle.fill",
                    title: "Continue Learning",
                    subtitle: "Resume your last course",
                    color: Palette.primary.cyan
                ) {
                    selectedTab = 3  // Awakening tab
                }

                QuickActionRow(
                    icon: "questionmark.circle.fill",
                    title: "Daily Question",
                    subtitle: "Challenge your programming",
                    color: Palette.primary.violet
                ) {
                    selectedTab = 3  // Awakening tab
                }

                QuickActionRow(
                    icon: "flame.fill",
                    title: "Explore Alternative Traditions",
                    subtitle: "Canonical vs. suppressed texts",
                    color: Palette.primary.red
                ) {
                    selectedTab = 2  // Cosmos tab
                }

            }

        }

    }

}
