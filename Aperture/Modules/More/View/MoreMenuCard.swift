// MoreMenuCard.swift

import SwiftUI

struct MoreMenuCard: View {

    let icon: String
    let title: String
    let subtitle: String
    let color: Color
    let badge: String?
    let action: () -> Void

    var body: some View {

        Button(action: action) {

            HStack(spacing: 16) {

                // Icon with layered glow
                ZStack {

                    // Glow halo
                    Circle()
                        .fill(color.opacity(0.18))
                        .frame(width: 60, height: 60)
                        .blur(radius: 6)

                    // Surface
                    Circle()
                        .fill(
                            LinearGradient(
                                colors: [color.opacity(0.25), color.opacity(0.1)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 56, height: 56)
                        .overlay(
                            Circle()
                                .stroke(color.opacity(0.35), lineWidth: 1)
                        )

                    Image(systemName: icon)
                        .font(.system(size: 22, weight: .semibold))
                        .foregroundStyle(
                            LinearGradient(
                                colors: [color, color.opacity(0.75)],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .shadow(color: color.opacity(0.5), radius: 4)

                }

                VStack(alignment: .leading, spacing: 4) {

                    HStack(spacing: 8) {
                        Text(title)
                            .font(.system(size: 16, weight: .bold, design: .rounded))
                            .foregroundColor(Palette.text.primary)

                        if let badge = badge {
                            Text(badge)
                                .font(.system(size: 10, weight: .bold, design: .rounded))
                                .foregroundColor(color)
                                .padding(.horizontal, 7)
                                .padding(.vertical, 3)
                                .background(
                                    Capsule()
                                        .fill(color.opacity(0.18))
                                        .overlay(Capsule().stroke(color.opacity(0.3), lineWidth: 0.5))
                                )
                        }
                    }

                    Text(subtitle)
                        .font(.system(size: 12, weight: .medium, design: .rounded))
                        .foregroundColor(Palette.text.muted)
                        .lineLimit(1)

                }

                Spacer()

                Image(systemName: "chevron.right")
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundColor(Palette.text.muted.opacity(0.6))

            }
            .padding(.horizontal, 16)
            .padding(.vertical, 14)
            .background(
                RoundedRectangle(cornerRadius: 18, style: .continuous)
                    .fill(
                        LinearGradient(
                            colors: [Color.white.opacity(0.07), Color.white.opacity(0.04)],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 18, style: .continuous)
                            .stroke(
                                LinearGradient(
                                    colors: [color.opacity(0.3), color.opacity(0.1)],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                ),
                                lineWidth: 1
                            )
                    )
            )

        }
        .buttonStyle(ScaleButtonStyle())

    }

}
