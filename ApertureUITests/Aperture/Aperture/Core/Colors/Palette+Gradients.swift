//
//  Palette+Gradients.swift
//  Aperture
//
//  Created by Ronald Hernandez on 1/17/26.
//


import SwiftUI

enum PaletteGradients {

    static let cosmicBackground = LinearGradient(
        gradient: Gradient(colors: [
            Palette.primaryGradientStart,
            Palette.primaryGradientMid,
            Palette.primaryGradientEnd
        ]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )

    static let auroraGlow = LinearGradient(
        gradient: Gradient(colors: [
            Palette.primaryCyan.opacity(0.35),
            Palette.primaryViolet.opacity(0.25),
            Palette.primaryGold.opacity(0.18)
        ]),
        startPoint: .top,
        endPoint: .bottom
    )

}
