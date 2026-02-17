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
        ZStack {
          Circle()
            .fill(color.opacity(0.15))
            .frame(width: 56, height: 56)

          Image(systemName: icon)
            .font(.system(size: 24, weight: .semibold))
            .foregroundColor(color)
        }

        VStack(alignment: .leading, spacing: 4) {
          HStack {
            Text(title)
              .font(.system(size: 18, weight: .bold, design: .rounded))
              .foregroundColor(Palette.text.primary)

            if let badge = badge {
              Text(badge)
                .font(.system(size: 10, weight: .bold, design: .rounded))
                .foregroundColor(color)
                .padding(.horizontal, 8)
                .padding(.vertical, 3)
                .background(
                  Capsule()
                    .fill(color.opacity(0.15))
                )
            }
          }

          Text(subtitle)
            .font(.system(size: 13, weight: .medium, design: .rounded))
            .foregroundColor(Palette.text.secondary)
        }

        Spacer()

        Image(systemName: "chevron.right")
          .font(.system(size: 14, weight: .semibold))
          .foregroundColor(Palette.text.muted)
      }
      .padding(16)
      .background(
        RoundedRectangle(cornerRadius: 16, style: .continuous)
          .fill(Color.white.opacity(0.05))
          .overlay(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
              .stroke(color.opacity(0.2), lineWidth: 1)
          )
      )
    }
    .buttonStyle(ScaleButtonStyle())
  }
}
