// StarTetrahedron.swift
// Aperture
//
// Sacred Geometry - Star Tetrahedron (Merkaba)
//
// Notes:
// - Pure SwiftUI Shape
// - Scales cleanly at any size
//

// StarTetrahedron.swift

import SwiftUI

struct StarTetrahedron: Shape {
  func path(in rect: CGRect) -> Path {
    var path = Path()

    let inset: CGFloat = 0.0
    let r = rect.insetBy(dx: inset, dy: inset)

    let top = CGPoint(x: r.midX, y: r.minY)
    let bottom = CGPoint(x: r.midX, y: r.maxY)
    let left = CGPoint(x: r.minX, y: r.midY)
    let right = CGPoint(x: r.maxX, y: r.midY)

    let upLeft = CGPoint(x: r.minX, y: r.maxY)
    let upRight = CGPoint(x: r.maxX, y: r.maxY)
    let downLeft = CGPoint(x: r.minX, y: r.minY)
    let downRight = CGPoint(x: r.maxX, y: r.minY)

    // Up triangle
    path.move(to: top)
    path.addLine(to: upLeft)
    path.addLine(to: upRight)
    path.closeSubpath()

    // Down triangle
    path.move(to: bottom)
    path.addLine(to: downLeft)
    path.addLine(to: downRight)
    path.closeSubpath()

    // Inner cross lines for a more “Merkaba” feel
    path.move(to: top)
    path.addLine(to: bottom)

    path.move(to: left)
    path.addLine(to: right)

    path.move(to: upLeft)
    path.addLine(to: downRight)

    path.move(to: upRight)
    path.addLine(to: downLeft)

    return path
  }
}
