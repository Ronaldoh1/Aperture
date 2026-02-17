//
//  InfinitySymbol.swift
//  Aperture
//
//  Created by Ronald Hernandez on 1/13/26.
//

import SwiftUI

struct InfinitySymbol: Shape {
  func path(in rect: CGRect) -> Path {
    var path = Path()

    let a = min(rect.width, rect.height) * 0.48
    let center = CGPoint(x: rect.midX, y: rect.midY)

    var isFirst = true
    for degrees in stride(from: 0.0, through: 360.0, by: 2.0) {
      let t = degrees * .pi / 180
      let denom = 1 + pow(sin(t), 2)

      let x = a * cos(t) / denom
      let y = a * sin(t) * cos(t) / denom

      let p = CGPoint(x: center.x + x, y: center.y + y)

      if isFirst {
        path.move(to: p)
        isFirst = false
      } else {
        path.addLine(to: p)
      }
    }

    return path
  }
}
