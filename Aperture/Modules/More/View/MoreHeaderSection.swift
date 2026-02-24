// MoreHeaderSection.swift

import SwiftUI

struct MoreHeaderSection: View {

    @State private var glowPulse = false

    var body: some View {

        VStack(spacing: 14) {

            // Glowing icon cluster
            ZStack {

                // Outer aurora glow
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [
                                Palette.primary.violet.opacity(glowPulse ? 0.45 : 0.25),
                                Palette.primary.cyan.opacity(glowPulse ? 0.2 : 0.1),
                                Color.clear
                            ],
                            center: .center,
                            startRadius: 10,
                            endRadius: 72
                        )
                    )
                    .frame(width: 144, height: 144)
                    .animation(.easeInOut(duration: 2.8).repeatForever(autoreverses: true), value: glowPulse)

                // Mid ring
                Circle()
                    .stroke(
                        LinearGradient(
                            colors: [Palette.primary.cyan.opacity(0.4), Palette.primary.violet.opacity(0.3)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        lineWidth: 1
                    )
                    .frame(width: 96, height: 96)

                // Icon surface
                Circle()
                    .fill(
                        LinearGradient(
                            colors: [
                                Palette.primary.violet.opacity(0.3),
                                Palette.primary.cyan.opacity(0.15)
                            ],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 80, height: 80)
                    .overlay(
                        Circle()
                            .stroke(Color.white.opacity(0.12), lineWidth: 1)
                    )

                Image(systemName: "sparkles")
                    .font(.system(size: 36, weight: .semibold))
                    .foregroundStyle(
                        LinearGradient(
                            colors: [Palette.accent.gold, Palette.primary.cyan],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .shadow(color: Palette.accent.gold.opacity(0.6), radius: 8)

            }
            .onAppear { glowPulse = true }

            // Title
            Text("EXPLORE")
                .font(.system(size: 26, weight: .black, design: .rounded))
                .tracking(5)
                .foregroundStyle(
                    LinearGradient(
                        colors: [Color.white, Palette.primary.cyan.opacity(0.9)],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )

            // Subtitle
            Text("Tools, features & your journey")
                .font(.system(size: 13, weight: .medium, design: .rounded))
                .foregroundColor(Palette.text.muted)
                .tracking(0.5)

        }
        .padding(.top, 40)
        .padding(.bottom, 16)

    }

}
