// CosmicBackground.swift

import SwiftUI

struct CosmicBackground: View {

    var starCount: Int = 80

    var body: some View {

        ZStack {

            PaletteGradients.cosmicBackground
                .ignoresSafeArea()

            GeometryReader { geo in
                ForEach(0..<starCount, id: \.self) { i in
                    Circle()
                        .fill(Color.white)
                        .frame(width: CGFloat(i % 3 + 1))
                        .position(
                            x: CGFloat(i * 17 % max(1, Int(geo.size.width))),
                            y: CGFloat(i * 23 % max(1, Int(geo.size.height)))
                        )
                        .opacity(Double(i % 5) * 0.1 + 0.2)
                }
            }

        }

    }

}
