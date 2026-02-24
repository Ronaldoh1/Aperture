//
//  Color+Hex.swift
//  Aperture
//
//  Created by Ronald Hernandez on 1/9/26.
//

import SwiftUI

import SwiftUI

extension Color {
    init(hex: String) {
        let cleaned = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: cleaned).scanHexInt64(&int)

        let r = Double((int >> 16) & 0xff) / 255.0
        let g = Double((int >> 8) & 0xff) / 255.0
        let b = Double(int & 0xff) / 255.0

        self.init(red: r, green: g, blue: b)
    }
}
