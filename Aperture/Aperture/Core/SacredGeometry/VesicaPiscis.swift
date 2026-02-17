import SwiftUI

struct VesicaPiscis: Shape {
  func path(in rect: CGRect) -> Path {
    var path = Path()

    let w = rect.width
    let h = rect.height
    let r = min(w, h) / 2
    let c = CGPoint(x: rect.midX, y: rect.midY)

    let left = CGPoint(x: c.x - r / 2, y: c.y)
    let right = CGPoint(x: c.x + r / 2, y: c.y)

    path.addEllipse(in: CGRect(x: left.x - r, y: c.y - r, width: r * 2, height: r * 2))
    path.addEllipse(in: CGRect(x: right.x - r, y: c.y - r, width: r * 2, height: r * 2))

    return path
  }
}
