// Aperture/DesignSystem/CosmicFormWidth.swift

import SwiftUI

enum CosmicFormMetrics {
  static let fieldMaxWidth: CGFloat = 400
  static let screenHorizontalPadding: CGFloat = 20
}

struct CosmicFormWidthModifier: ViewModifier {
  let maxWidth: CGFloat

  func body(content: Content) -> some View {
    content
      .frame(maxWidth: maxWidth)
      .frame(maxWidth: .infinity, alignment: .center)
      .padding(.horizontal, CosmicFormMetrics.screenHorizontalPadding)
  }
}

extension View {
  func cosmicFormWidth(
    maxWidth: CGFloat = CosmicFormMetrics.fieldMaxWidth
  ) -> some View {
    modifier(
      CosmicFormWidthModifier(
        maxWidth: maxWidth
      )
    )
  }
}
