// MoreHeaderSection.swift

import SwiftUI

struct MoreHeaderSection: View {
  var body: some View {
    VStack(spacing: 12) {
      ZStack {
        Circle()
          .fill(
            RadialGradient(
              colors: [Palette.primary.violet.opacity(0.4), Color.clear],
              center: .center,
              startRadius: 20,
              endRadius: 50
            )
          )
          .frame(width: 100, height: 100)

        Image(systemName: "ellipsis.circle.fill")
          .font(.system(size: 50, weight: .light))
          .foregroundStyle(
            LinearGradient(
              colors: [Palette.primary.cyan, Palette.primary.violet],
              startPoint: .topLeading,
              endPoint: .bottomTrailing
            )
          )
      }

      Text("MORE")
        .font(.system(size: 24, weight: .black, design: .rounded))
        .tracking(4)
        .foregroundColor(Palette.text.primary)

      Text("Continue your journey")
        .font(.system(size: 14, weight: .medium, design: .rounded))
        .foregroundColor(Palette.text.secondary)
    }
    .padding(.top, 40)
    .padding(.bottom, 10)
  }
}
