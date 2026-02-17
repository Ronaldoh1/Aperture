import SwiftUI

struct EnergyWave: Shape {
  func path(in rect: CGRect) -> Path {
    var path = Path()

    let w = rect.width
    let h = rect.height

    path.move(to: CGPoint(x: 0, y: h * 0.55))

    path.addCurve(
      to: CGPoint(x: w, y: h * 0.55),
      control1: CGPoint(x: w * 0.25, y: h * 0.10),
      control2: CGPoint(x: w * 0.75, y: h * 0.90)
    )

    path.addLine(to: CGPoint(x: w, y: h))
    path.addLine(to: CGPoint(x: 0, y: h))
    path.closeSubpath()

    return path
  }
}
