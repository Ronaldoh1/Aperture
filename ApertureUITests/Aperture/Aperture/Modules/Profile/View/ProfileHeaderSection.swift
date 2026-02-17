// ProfileHeaderSection.swift

import SwiftUI

struct ProfileHeaderSection: View {
  var body: some View {
    VStack(spacing: 16) {
      Circle()
        .fill(
          LinearGradient(
            colors: [
              Palette.primary.cyan.opacity(0.3),
              Palette.primary.violet.opacity(0.3),
            ],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
          )
        )
        .frame(width: 100, height: 100)
        .overlay(
          Image(systemName: "person.fill")
            .font(.system(size: 48, weight: .semibold))
            .foregroundColor(Palette.primary.cyan)
        )

      Text("Consciousness Explorer")
        .font(.system(size: 24, weight: .bold, design: .rounded))
        .foregroundStyle(
          LinearGradient(
            colors: [
              Palette.text.primary,
              Palette.primary.cyan.opacity(0.75),
            ],
            startPoint: .top,
            endPoint: .bottom
          )
        )

      Text("Your journey continues")
        .font(.system(size: 16, weight: .medium, design: .rounded))
        .foregroundColor(Palette.text.secondary)
    }
  }
}
