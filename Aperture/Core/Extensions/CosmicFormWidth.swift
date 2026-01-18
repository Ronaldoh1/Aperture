//
//  CosmicFormWidth.swift
//  Aperture
//
//  Created by Ronald Hernandez on 1/17/26.
//

import SwiftUI

struct CosmicFormWidthModifier: ViewModifier {

    let maxWidth: CGFloat
    let horizontalPadding: CGFloat

    func body(content: Content) -> some View {

        content
            .frame(maxWidth: maxWidth)
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.horizontal, horizontalPadding)

    }

}


extension View {

    func cosmicFormWidth(
        maxWidth: CGFloat = 410,
        horizontalPadding: CGFloat = 24
    ) -> some View {
        self
            .frame(maxWidth: maxWidth)
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.horizontal, horizontalPadding)
    }

}
