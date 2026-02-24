// MoreAppInfoSection.swift

import SwiftUI

struct MoreAppInfoSection: View {

    var body: some View {

        VStack(spacing: 20) {

            // Divider line with fade
            LinearGradient(
                colors: [Color.clear, Palette.text.muted.opacity(0.25), Color.clear],
                startPoint: .leading,
                endPoint: .trailing
            )
            .frame(height: 1)
            .padding(.vertical, 8)

            // Dragon quote card
            VStack(spacing: 14) {

                Text("🐉")
                    .font(.system(size: 36))
                    .shadow(color: Palette.accent.gold.opacity(0.4), radius: 10)

                Text("\"The only prison is the one you don't know you're in.\"")
                    .font(.system(size: 14, weight: .medium, design: .rounded))
                    .foregroundColor(Palette.text.secondary)
                    .italic()
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)

            }
            .padding(.vertical, 24)
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 18, style: .continuous)
                    .fill(Color.white.opacity(0.04))
                    .overlay(
                        RoundedRectangle(cornerRadius: 18, style: .continuous)
                            .stroke(
                                LinearGradient(
                                    colors: [Palette.accent.gold.opacity(0.25), Palette.primary.violet.opacity(0.15)],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                ),
                                lineWidth: 1
                            )
                    )
            )

            // Version + tagline
            VStack(spacing: 6) {

                Text("APERTURE  ·  v1.0")
                    .font(.system(size: 11, weight: .semibold, design: .monospaced))
                    .foregroundColor(Palette.text.muted)
                    .tracking(2)

                Text("SunFlow: Reignited · Open your eyes")
                    .font(.system(size: 10, weight: .medium, design: .rounded))
                    .foregroundColor(Palette.text.muted.opacity(0.5))
                    .tracking(0.5)

            }
            .padding(.bottom, 8)

        }

    }

}
