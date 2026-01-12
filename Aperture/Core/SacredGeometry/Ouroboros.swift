//
//  Ouroboros.swift
//  Aperture
//
//  Sacred Geometry - Ouroboros (Serpent eating tail)
//  ☀️ Eternal cycle, infinity, perfect for Timeline tutorial slide
//

import SwiftUI

struct Ouroboros: View {
    
    let size: CGFloat
    let lineWidth: CGFloat
    let color: Color
    let animated: Bool
    
    @State private var drawProgress: CGFloat = 0.0
    @State private var rotation: Double = 0
    @State private var scaleEffect: CGFloat = 0.8
    @State private var opacity: Double = 0.0
    
    init(
        size: CGFloat = 300,
        lineWidth: CGFloat = 8,
        color: Color = Color(hex: "FFD700"),
        animated: Bool = true
    ) {
        self.size = size
        self.lineWidth = lineWidth
        self.color = color
        self.animated = animated
    }
    
    var body: some View {
        ZStack {
            
            // Main circular body
            Circle()
                .trim(from: 0, to: drawProgress * 0.85)
                .stroke(
                    LinearGradient(
                        colors: [
                            color,
                            color.opacity(0.8),
                            color.opacity(0.6)
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ),
                    style: StrokeStyle(
                        lineWidth: lineWidth,
                        lineCap: .round
                    )
                )
                .frame(width: size * 0.8, height: size * 0.8)
            
            // Dragon/serpent head (simplified)
            if drawProgress > 0.5 {
                dragonHead
                    .offset(y: -size * 0.4)
                    .opacity(Double((drawProgress - 0.5) * 2))
            }
            
            // Tail end
            if drawProgress > 0.7 {
                tailEnd
                    .offset(y: -size * 0.38)
                    .rotationEffect(.degrees(30))
                    .opacity(Double((drawProgress - 0.7) * 3))
            }
            
            // Infinity symbol in center
            infinitySymbol
                .stroke(color.opacity(0.3), lineWidth: lineWidth * 0.5)
                .frame(width: size * 0.3, height: size * 0.15)
            
        }
        .rotationEffect(.degrees(rotation))
        .scaleEffect(scaleEffect)
        .opacity(opacity)
        .onAppear {
            if animated {
                withAnimation(.easeInOut(duration: 0.5)) {
                    opacity = 1.0
                }
                
                withAnimation(.spring(response: 1, dampingFraction: 0.7)) {
                    scaleEffect = 1.0
                }
                
                withAnimation(.easeInOut(duration: 2.5)) {
                    drawProgress = 1.0
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                    withAnimation(
                        .linear(duration: 40)
                        .repeatForever(autoreverses: false)
                    ) {
                        rotation = 360
                    }
                }
            } else {
                opacity = 1.0
                scaleEffect = 1.0
                drawProgress = 1.0
            }
        }
    }
    
    private var dragonHead: some View {
        ZStack {
            // Head circle
            Circle()
                .fill(color)
                .frame(width: lineWidth * 1.5, height: lineWidth * 1.5)
            
            // Eye
            Circle()
                .fill(Color.black)
                .frame(width: lineWidth * 0.4, height: lineWidth * 0.4)
                .offset(x: lineWidth * 0.3, y: -lineWidth * 0.2)
            
            // Mouth (eating tail)
            Path { path in
                path.move(to: CGPoint(x: -lineWidth * 0.5, y: 0))
                path.addLine(to: CGPoint(x: lineWidth * 0.5, y: 0))
            }
            .stroke(Color.black, lineWidth: lineWidth * 0.2)
        }
    }
    
    private var tailEnd: some View {
        Path { path in
            path.move(to: .zero)
            path.addLine(to: CGPoint(x: -lineWidth * 0.5, y: lineWidth))
            path.addLine(to: CGPoint(x: lineWidth * 0.5, y: lineWidth))
            path.closeSubpath()
        }
        .fill(color)
    }
    
    private var infinitySymbol: InfinitySymbolShape {
        InfinitySymbolShape()
    }

    private struct InfinitySymbolShape: Shape {
        func path(in rect: CGRect) -> Path {
            var path = Path()

            // Lemniscate (infinity symbol) centered in the given rect.
            // Scale to fit inside rect with a bit of padding.
            let w = rect.width
            let h = rect.height
            let center = CGPoint(x: rect.midX, y: rect.midY)
            let a = min(w, h) * 0.45

            var isFirst = true
            for i in stride(from: 0.0, through: 360.0, by: 2.0) {
                let t = i * .pi / 180
                let denom = 1 + (sin(t) * sin(t))
                let x = a * cos(t) / denom
                let y = a * sin(t) * cos(t) / denom

                let point = CGPoint(x: center.x + x, y: center.y + y)
                if isFirst {
                    path.move(to: point)
                    isFirst = false
                } else {
                    path.addLine(to: point)
                }
            }

            return path
        }
    }
    
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        
        Ouroboros(size: 300, animated: true)
            .shadow(color: Color(hex: "FFD700").opacity(0.6), radius: 20)
    }
}
