// Aperture/Modules/Tutorial/View/TutorialPageView.swift

import SwiftUI

struct TutorialPageView: View {
  let page: TutorialPage

  var body: some View {
    VStack(spacing: 18) {
      Spacer(minLength: 8)

      Image(systemName: page.symbol)
        .font(.system(size: 52, weight: .semibold))
        .foregroundStyle(
          LinearGradient(
            colors: [
              Palette.primary.cyan,
              Palette.primary.violet.opacity(0.85),
            ],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
          )
        )
        .padding(.top, 12)

      Text(page.title)
        .font(.system(size: 34, weight: .bold, design: .rounded))
        .foregroundColor(Palette.text.primary)
        .multilineTextAlignment(.center)
        .lineLimit(2)
        .minimumScaleFactor(0.80)
        .cosmicFormWidth(maxWidth: 520)

      Text(page.subtitle)
        .font(.system(size: 16, weight: .medium, design: .rounded))
        .foregroundColor(Palette.text.secondary)
        .multilineTextAlignment(.center)
        .lineLimit(3)
        .minimumScaleFactor(0.85)
        .padding(.horizontal, 8)
        .cosmicFormWidth(maxWidth: 520)

      Spacer(minLength: 8)
    }
  }
}
