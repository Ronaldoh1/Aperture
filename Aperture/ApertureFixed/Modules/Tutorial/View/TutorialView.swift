// Aperture/Modules/Tutorial/View/TutorialView.swift

import SwiftUI

struct TutorialView: View {

    private let onFinish: () -> Void
    private let onSkip: () -> Void

    @State private var index: Int = 0

    init(
        onFinish: @escaping () -> Void,
        onSkip: @escaping () -> Void
    ) {
        self.onFinish = onFinish
        self.onSkip = onSkip
    }

    var body: some View {

        ZStack {

            PaletteGradients.cosmicBackground
                .ignoresSafeArea()

            VStack(spacing: 18) {

                headerBar

                TabView(selection: $index) {
                    ForEach(Array(pages.enumerated()), id: \.offset) { item in
                        TutorialPageView(page: item.element)
                            .tag(item.offset)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .always))

                footerControls

            }
            .padding(.horizontal, 24)
            .padding(.vertical, 18)

        }

    }

    private var headerBar: some View {

        HStack {

            Text("Aperture Tutorial")
                .font(.system(size: 18, weight: .semibold, design: .rounded))
                .foregroundColor(Color(hex: "#C9A84C"))     // warm gold header
                .lineLimit(1)
                .minimumScaleFactor(0.85)

            Spacer()

            Button {
                onSkip()
            } label: {
                Text("Skip")
                    .font(.system(size: 15, weight: .semibold, design: .rounded))
                    .foregroundColor(Color(hex: "#A89878").opacity(0.85)) // muted warm — not blinding cyan
            }
            .buttonStyle(.plain)

        }
        .cosmicFormWidth(maxWidth: 520)

    }

    private var footerControls: some View {

        VStack(spacing: 12) {

            CosmicButton(
                title: index == pages.count - 1 ? "Continue" : "Next",
                style: .primary,
                systemImage: "arrow.right",
                isDisabled: false
            ) {
                if index == pages.count - 1 {
                    onFinish()
                } else {
                    withAnimation(.spring(response: 0.35, dampingFraction: 0.85)) {
                        index += 1
                    }
                }
            }

            if index > 0 {
                Button {
                    withAnimation(.spring(response: 0.35, dampingFraction: 0.85)) {
                        index -= 1
                    }
                } label: {
                    Text("Back")
                        .font(.system(size: 15, weight: .semibold, design: .rounded))
                        .foregroundColor(Palette.text.secondary)
                        .padding(.vertical, 8)
                }
                .buttonStyle(.plain)
            }

        }
        .cosmicFormWidth(maxWidth: 520)

    }

    private var pages: [TutorialPage] {
        [
            TutorialPage(
                title: "Welcome to Aperture",
                subtitle: "A cosmic space to build clarity, habits, and momentum.",
                symbol: "sparkles"
            ),
            TutorialPage(
                title: "Sacred Geometry",
                subtitle: "Patterns that calm the mind and train attention.",
                symbol: "circle.grid.3x3.fill"
            ),
            TutorialPage(
                title: "Track your path",
                subtitle: "Log small wins and watch patterns become progress.",
                symbol: "chart.line.uptrend.xyaxis"
            ),
            TutorialPage(
                title: "Stay consistent",
                subtitle: "Micro actions, repeated, become your new operating system.",
                symbol: "flame.fill"
            ),
            TutorialPage(
                title: "Ready to begin?",
                subtitle: "Continue to create your account and enter the app.",
                symbol: "arrow.right.circle.fill"
            )
        ]
    }

}
