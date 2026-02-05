// ProfileCard.swift

import SwiftUI

struct ProfileCard: View {

    let icon: String
    let title: String
    let description: String

    var body: some View {

        HStack(spacing: 16) {

            Image(systemName: icon)
                .font(.system(size: 24, weight: .semibold))
                .foregroundColor(Palette.primary.cyan)
                .frame(width: 48, height: 48)
                .background(
                    Circle()
                        .fill(Palette.primary.cyan.opacity(0.15))
                )

            VStack(alignment: .leading, spacing: 4) {

                Text(title)
                    .font(.system(size: 18, weight: .bold, design: .rounded))
                    .foregroundColor(Palette.text.primary)

                Text(description)
                    .font(.system(size: 14, weight: .medium, design: .rounded))
                    .foregroundColor(Palette.text.secondary)

            }

            Spacer()

            Image(systemName: "chevron.right")
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(Palette.text.secondary.opacity(0.5))

        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .fill(Palette.surface.fieldFill)
                .overlay(
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .stroke(Palette.surface.fieldStroke, lineWidth: 1)
                )
        )

    }

}
