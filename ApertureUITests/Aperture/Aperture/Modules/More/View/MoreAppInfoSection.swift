// MoreAppInfoSection.swift

import SwiftUI

struct MoreAppInfoSection: View {
  var body: some View {
    VStack(spacing: 16) {
      Rectangle()
        .fill(Palette.text.muted.opacity(0.3))
        .frame(height: 1)
        .padding(.vertical, 10)

      VStack(spacing: 8) {
        Text("🐉")
          .font(.system(size: 32))

        Text("\"The only prison is the one you don't know you're in.\"")
          .font(.system(size: 14, weight: .medium, design: .rounded))
          .foregroundColor(Palette.text.secondary)
          .italic()
          .multilineTextAlignment(.center)
      }
      .padding(.vertical, 20)

      Text("Aperture v1.0")
        .font(.system(size: 12, weight: .medium, design: .monospaced))
        .foregroundColor(Palette.text.muted)

      Text("Open your eyes")
        .font(.system(size: 10, weight: .medium, design: .rounded))
        .foregroundColor(Palette.text.muted.opacity(0.6))
    }
  }
}
