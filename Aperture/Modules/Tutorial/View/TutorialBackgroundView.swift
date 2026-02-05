// TutorialBackgroundView.swift

import SwiftUI

struct TutorialBackgroundView: View {

    @State private var rotation: Double = 0
    @State private var particleOpacity: Double = 0.25

    var body: some View {

        ZStack {

            PaletteGradients.cosmicBackground
                .ignoresSafeArea()

            ZStack {

                FlowerOfLife()
                    .stroke(Palette.text.primary.opacity(0.07), lineWidth: 1)
                    .frame(width: 860, height: 860)
                    .rotationEffect(.degrees(rotation * 0.12))
                    .blendMode(.screen)
                    .blur(radius: 0.9)

                StarTetrahedron()
                    .stroke(Palette.primary.cyan.opacity(0.10), lineWidth: 1)
                    .frame(width: 700, height: 700)
                    .rotationEffect(.degrees(-rotation * 0.18))
                    .blendMode(.screen)
                    .blur(radius: 0.6)

                VesicaPiscis()
                    .stroke(Palette.primary.violet.opacity(0.10), lineWidth: 1)
                    .frame(width: 620, height: 620)
                    .rotationEffect(.degrees(rotation * 0.08))
                    .blendMode(.screen)
                    .blur(radius: 0.6)

            }
            .opacity(0.95)

            ForEach(0..<90, id: \.self) { _ in
                Circle()
                    .fill(Palette.text.primary)
                    .frame(width: CGFloat.random(in: 1...2.2), height: CGFloat.random(in: 1...2.2))
                    .position(
                        x: CGFloat.random(in: 0...UIScreen.main.bounds.width),
                        y: CGFloat.random(in: 0...UIScreen.main.bounds.height)
                    )
                    .opacity(particleOpacity * Double.random(in: 0.2...1.0))
            }

        }
        .onAppear {
            withAnimation(.linear(duration: 70).repeatForever(autoreverses: false)) {
                rotation = 360
            }
            withAnimation(.easeInOut(duration: 4).repeatForever(autoreverses: true)) {
                particleOpacity = 0.65
            }
        }
    }

}
