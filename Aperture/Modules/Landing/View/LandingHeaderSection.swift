// LandingHeaderSection.swift

import SwiftUI

struct LandingHeaderSection: View {

    var body: some View {

        VStack(spacing: 16) {

            ZStack {

                Circle()
                    .fill(
                        RadialGradient(
                            colors: [Palette.primary.cyan.opacity(0.3), Color.clear],
                            center: .center,
                            startRadius: 30,
                            endRadius: 60
                        )
                    )
                    .frame(width: 120, height: 120)

                Image(systemName: "eye.circle.fill")
                    .font(.system(size: 60, weight: .light))
                    .foregroundStyle(
                        LinearGradient(
                            colors: [Palette.primary.cyan, Palette.accent.gold],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )

            }

            VStack(spacing: 8) {

                Text("APERTURE")
                    .font(.system(size: 28, weight: .black, design: .rounded))
                    .tracking(4)
                    .foregroundStyle(
                        LinearGradient(
                            colors: [Palette.text.primary, Palette.primary.cyan],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )

                Text("Open Your Eyes")
                    .font(.system(size: 14, weight: .medium, design: .rounded))
                    .foregroundColor(Palette.text.secondary)
                    .tracking(2)

            }

        }
        .padding(.top, 20)

    }

}
