//
//  Palette.swift
//  Aperture
//
//  Created by Ronald Hernandez on 1/17/26.
//


import SwiftUI

enum Palette {

    // MARK: - Primary Colors

    struct Primary {

        let red: Color
        let orange: Color
        let gold: Color
        let cyan: Color
        let blue: Color
        let violet: Color

    }

    // MARK: - Accent Colors

    struct Accent {

        let cyan: Color
        let violet: Color
        let gold: Color

    }

    // MARK: - Text Colors

    struct Text {

        let primary: Color
        let secondary: Color
        let muted: Color

    }

    // MARK: - Surface Colors

    struct Surface {

        let fieldFill: Color
        let fieldStroke: Color

        let buttonSecondaryFill: Color
        let buttonPrimaryStroke: Color
        let buttonSecondaryStroke: Color

        let pillFill: Color
        let pillStroke: Color

    }

    // MARK: - Tokens

    static let primary = Primary(
        red: Color(hex: "#FF3B30"),
        orange: Color(hex: "#FF9500"),
        gold: Color(hex: "#FFD700"),
        cyan: Color(hex: "#00D9FF"),
        blue: Color(hex: "#0A84FF"),
        violet: Color(hex: "#7C5CFF")
    )

    static let accent = Accent(
        cyan: primary.cyan,
        violet: primary.violet,
        gold: primary.gold
    )

    static let text = Text(
        primary: Color.white,
        secondary: Color.white.opacity(0.70),
        muted: Color.white.opacity(0.45)
    )

    static let surface = Surface(
        fieldFill: Color.white.opacity(0.08),
        fieldStroke: Color.white.opacity(0.16),

        buttonSecondaryFill: Color.white.opacity(0.10),
        buttonPrimaryStroke: Color.white.opacity(0.18),
        buttonSecondaryStroke: Color.white.opacity(0.16),

        pillFill: Color.white.opacity(0.10),
        pillStroke: Color.white.opacity(0.20)
    )

    // MARK: - Backward Compatibility (do not remove)

    static let background = Color.black
    static let primaryBlue = primary.blue
    static let primaryCyan = primary.cyan
    static let primaryViolet = primary.violet
    static let primaryGold = primary.gold

    static let primaryGradientStart = Color(hex: "#070B1D")
    static let primaryGradientMid = Color(hex: "#0A1B3D")
    static let primaryGradientEnd = Color(hex: "#060712")

}
