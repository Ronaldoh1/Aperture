// TutorialView.swift

import SwiftUI

struct TutorialView: View {

    struct Page: Identifiable {

        let id = UUID()
        let title: String
        let subtitle: String
        let systemImage: String

    }

    let onFinish: () -> Void

    @State private var index: Int = 0

    private let pages: [Page] = [
        Page(
            title: "Welcome to Aperture",
            subtitle: "This is your portal. We start with the basics, then you create your account.",
            systemImage: "sparkles"
        ),
        Page(
            title: "Track Your Path",
            subtitle: "Capture your state, your patterns, and your progress with clarity.",
            systemImage: "waveform.path.ecg"
        ),
        Page(
            title: "Sacred Geometry",
            subtitle: "The UI is not decoration. It is orientation. You are meant to feel centered.",
            systemImage: "hexagon"
        ),
        Page(
            title: "Stay Grounded",
            subtitle: "When something fails, you will see the reason. No silent errors.",
            systemImage: "checkmark.shield"
        ),
        Page(
            title: "Ready",
            subtitle: "You can create an account next. You can always revisit the tutorial later.",
            systemImage: "arrow.right.circle.fill"
        )
    ]

    var body: some View {

        ZStack {

            background

            VStack(spacing: 0) {

                header

                TabView(selection: $index) {

                    ForEach(Array(pages.enumerated()), id: \.offset) { item in

                        pageView(page: item.element)
                            .tag(item.offset)

                    }

                }
                .tabViewStyle(.page(indexDisplayMode: .always))

                footer

            }

        }

    }

    private var background: some View {

        ZStack {

            PaletteGradients.cosmicBackground
                .ignoresSafeArea()

            FlowerOfLife()
                .stroke(Palette.text.primary.opacity(0.06), lineWidth: 1)
                .frame(width: 820, height: 820)
                .blendMode(.screen)
                .opacity(0.9)

            StarTetrahedron()
                .stroke(Palette.primary.cyan.opacity(0.08), lineWidth: 1)
                .frame(width: 640, height: 640)
                .blendMode(.screen)
                .opacity(0.9)

        }

    }

    private var header: some View {

        HStack {

            Spacer()

            Button {

                onFinish()

            } label: {

                Text("Skip")
                    .font(.system(size: 15, weight: .semibold, design: .rounded))
                    .foregroundColor(Palette.text.primary.opacity(0.85))
                    .padding(.horizontal, 14)
                    .padding(.vertical, 10)
                    .background(
                        Capsule(style: .continuous)
                            .fill(Palette.surface.pillFill)
                            .overlay(
                                Capsule(style: .continuous)
                                    .stroke(Palette.surface.pillStroke, lineWidth: 1)
                            )
                    )

            }
            .buttonStyle(.plain)

        }
        .padding(.top, 18)
        .padding(.horizontal, 18)

    }

    private func pageView(page: Page) -> some View {

        VStack(spacing: 18) {

            Spacer(minLength: 24)

            Image(systemName: page.systemImage)
                .font(.system(size: 56, weight: .semibold))
                .foregroundStyle(
                    LinearGradient(
                        colors: [
                            Palette.text.primary,
                            Palette.primary.cyan.opacity(0.85)
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .padding(.bottom, 6)

            Text(page.title)
                .font(.system(size: 34, weight: .bold, design: .rounded))
                .foregroundColor(Palette.text.primary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 28)

            Text(page.subtitle)
                .font(.system(size: 16, weight: .medium, design: .rounded))
                .foregroundColor(Palette.text.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 34)

            Spacer()

        }

    }

    private var footer: some View {

        VStack(spacing: 12) {

            CosmicButton(
                title: index == pages.count - 1 ? "Continue" : "Next",
                style: .primary,
                systemImage: "arrow.right",
                isDisabled: false
            ) {

                if index < pages.count - 1 {
                    withAnimation(.spring(response: 0.35, dampingFraction: 0.8)) {
                        index += 1
                    }
                } else {
                    onFinish()
                }

            }

            CosmicButton(
                title: "Back",
                style: .secondary,
                systemImage: nil,
                isDisabled: index == 0
            ) {

                guard index > 0 else { return }
                withAnimation(.spring(response: 0.35, dampingFraction: 0.8)) {
                    index -= 1
                }

            }

        }
        .padding(.bottom, 24)

    }

}

#Preview {

    TutorialView {
        print("finish")
    }

}
