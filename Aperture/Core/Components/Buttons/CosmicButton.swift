// CosmicButton.swift

import SwiftUI

enum CosmicButtonStyle {

    case primary
    case secondary

}

struct CosmicButton: View {

    let title: String
    let style: CosmicButtonStyle
    let systemImage: String?
    let isDisabled: Bool
    let action: () -> Void

    init(
        title: String,
        style: CosmicButtonStyle = .primary,
        systemImage: String? = nil,
        isDisabled: Bool = false,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.style = style
        self.systemImage = systemImage
        self.isDisabled = isDisabled
        self.action = action
    }

    var body: some View {

        Button(action: action) {

            ZStack {

                background
                geometryOverlay

                HStack(spacing: 10) {

                    Text(title)
                        .font(.system(size: 17, weight: .semibold, design: .rounded))

                    if let systemImage {
                        Image(systemName: systemImage)
                            .font(.system(size: 15, weight: .bold))
                    }

                }
                .foregroundColor(foregroundColor)
                .padding(.horizontal, 20)

            }
            .frame(height: height)
            .cosmicFormWidth(maxWidth: maxWidth, horizontalPadding: 28)

        }
        .buttonStyle(.plain)
        .disabled(isDisabled)
        .opacity(isDisabled ? 0.55 : 1.0)

    }

    private var height: CGFloat {

        switch style {
        case .primary:
            return 52
        case .secondary:
            return 50
        }

    }

    private var maxWidth: CGFloat {

        switch style {
        case .primary:
            return 380
        case .secondary:
            return 360
        }

    }

    private var foregroundColor: Color {

        switch style {
        case .primary:
            return .black
        case .secondary:
            return Palette.text.primary
        }

    }

    private var background: some View {

        Capsule(style: .continuous)
            .fill(backgroundGradient)
            .overlay(border)
            .shadow(color: shadowColor, radius: 16, x: 0, y: 9)
            .overlay(glassSheen.mask(Capsule(style: .continuous)))

    }

    private var backgroundGradient: LinearGradient {

        switch style {
        case .primary:
            return LinearGradient(
                colors: [
                    Palette.primary.gold,
                    Palette.primary.cyan
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        case .secondary:
            return LinearGradient(
                colors: [
                    Palette.surface.buttonSecondaryFill,
                    Palette.surface.buttonSecondaryFill.opacity(0.65)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
        }

    }

    private var glassSheen: some View {

        LinearGradient(
            colors: [
                Color.white.opacity(0.18),
                Color.white.opacity(0.03),
                Color.clear
            ],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )

    }

    private var border: some View {

        Capsule(style: .continuous)
            .stroke(
                LinearGradient(
                    colors: [
                        Palette.surface.buttonPrimaryStroke.opacity(style == .primary ? 1.0 : 0.0),
                        Palette.surface.buttonSecondaryStroke.opacity(style == .secondary ? 1.0 : 0.0),
                        Palette.accent.cyan.opacity(0.16),
                        Palette.accent.violet.opacity(0.12)
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ),
                lineWidth: 1
            )

    }

    private var shadowColor: Color {

        switch style {
        case .primary:
            return Palette.accent.cyan.opacity(0.16)
        case .secondary:
            return Color.black.opacity(0.30)
        }

    }

    private var geometryOverlay: some View {

        GeometryReader { proxy in

            let size = min(proxy.size.width, proxy.size.height)

            ZStack {

                if style == .primary {

                    StarTetrahedron()
                        .stroke(
                            LinearGradient(
                                colors: [
                                    Color.white.opacity(0.22),
                                    Palette.accent.cyan.opacity(0.18),
                                    Palette.accent.violet.opacity(0.14)
                                ],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ),
                            lineWidth: 1
                        )
                        .frame(width: size * 0.88, height: size * 0.88)
                        .opacity(0.14)
                        .blendMode(.screen)

                } else {

                    FlowerOfLife()
                        .stroke(
                            LinearGradient(
                                colors: [
                                    Color.white.opacity(0.12),
                                    Palette.accent.cyan.opacity(0.10),
                                    Palette.accent.violet.opacity(0.08)
                                ],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ),
                            lineWidth: 1
                        )
                        .frame(width: size * 0.86, height: size * 0.86)
                        .opacity(0.10)
                        .blendMode(.screen)

                }

            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)

        }
        .allowsHitTesting(false)

    }

}
