// LandingDragonSection.swift

import SwiftUI

struct LandingDragonSection: View {

    @Binding var selectedTab: Int

    private let quotes: [String] = [
        "The truth was never hidden. You just weren't looking.",
        "Every institution that tells you not to question is hiding something.",
        "They didn't burn the Library of Alexandria because the books were worthless.",
        "The matrix isn't a simulation. It's a perspective you chose to forget.",
        "When they say 'trust the experts,' ask who trained the experts.",
        "Your ancestors knew things that would terrify your professors.",
        "The greatest prison is the one you don't know you're in."
    ]

    var body: some View {

        VStack(spacing: 12) {

            HStack {
                Text("🐉 DRAGON'S WISDOM")
                    .font(.system(size: 12, weight: .bold, design: .rounded))
                    .foregroundColor(Palette.accent.gold)
                    .tracking(2)
                Spacer()
            }

            VStack(alignment: .leading, spacing: 12) {

                Text(quotes.randomElement() ?? quotes[0])
                    .font(.system(size: 16, weight: .medium, design: .rounded))
                    .foregroundColor(Palette.text.primary)
                    .italic()
                    .lineSpacing(4)

            }
            .padding(20)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .fill(Color.white.opacity(0.03))
                    .overlay(
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .stroke(Palette.accent.gold.opacity(0.3), lineWidth: 1)
                    )
            )

            // Chronokeeper CTA — AI guide accessible from landing
            Button {
                HapticManager.shared.tabChanged()
                selectedTab = 5
            } label: {
                HStack(spacing: 10) {
                    Image(systemName: "bubble.left.and.text.bubble.right.fill")
                        .font(.system(size: 16))
                        .foregroundColor(Palette.primary.cyan)

                    VStack(alignment: .leading, spacing: 2) {
                        Text("Ask Chronokeeper")
                            .font(.system(size: 14, weight: .semibold, design: .rounded))
                            .foregroundColor(Palette.text.primary)
                        Text("Your AI guide to all knowledge")
                            .font(.system(size: 11, weight: .medium))
                            .foregroundColor(Palette.text.muted)
                    }

                    Spacer()

                    Image(systemName: "chevron.right")
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(Palette.text.muted)
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 12)
                .background(
                    RoundedRectangle(cornerRadius: 14, style: .continuous)
                        .fill(Palette.primary.cyan.opacity(0.07))
                        .overlay(
                            RoundedRectangle(cornerRadius: 14, style: .continuous)
                                .stroke(Palette.primary.cyan.opacity(0.2), lineWidth: 1)
                        )
                )
            }
            .buttonStyle(.plain)

        }

    }

}
