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
                    selectedTab = 4
                }

                QuickActionRow(
                    icon: "questionmark.circle.fill",
                    title: "Daily Question",
                    subtitle: "Challenge your programming",
                    color: Palette.primary.violet
                ) {
                    selectedTab = 4
                }

                QuickActionRow(
                    icon: "flame.fill",
                    title: "Institutional Lies Exposed",
                    subtitle: "Documented deception",
                    color: Palette.primary.red
                ) {
                    selectedTab = 2
                }

            }

        }

    }

}
