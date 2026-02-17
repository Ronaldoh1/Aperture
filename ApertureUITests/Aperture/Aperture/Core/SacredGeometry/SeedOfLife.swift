import SwiftUI

struct SeedOfLife: Shape {
  func path(in rect: CGRect) -> Path {
    var path = Path()

    let size = min(rect.width, rect.height)
    let r = size / 6
    let center = CGPoint(x: rect.midX, y: rect.midY)

    func addCircle(_ c: CGPoint) {
      path.addEllipse(in: CGRect(x: c.x - r, y: c.y - r, width: r * 2, height: r * 2))
    }

    addCircle(center)

    for i in 0..<6 {
      let angle = Double(i) * (Double.pi / 3)
      let c = CGPoint(
        x: center.x + CGFloat(cos(angle)) * r,
        y: center.y + CGFloat(sin(angle)) * r
      )
      addCircle(c)
    }

    return path
  }
}
