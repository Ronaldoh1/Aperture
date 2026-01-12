//
//  VesicaPiscis.swift
//  Aperture
//
//  Sacred Geometry - Vesica Piscis
//  ☀️ Portal, passage between worlds, perfect for password reset
//

import SwiftUI

struct VesicaPiscis: View {
    
    let size: CGFloat
    let lineWidth: CGFloat
    let color: Color
    let animated: Bool
    
    @State private var leftScale: CGFloat = 0.0
    @State private var rightScale: CGFloat = 0.0
    @State private var glowIntensity: Double = 0.3
    @State private var opacity: Double = 0.0
    
    init(
        size: CGFloat = 300,
        lineWidth: CGFloat = 2.5,
        color: Color = Color(hex: "9370DB"),
        animated: Bool = true
    ) {
        self.size = size
        self.lineWidth = lineWidth
        self.color = color
        self.animated = animated
    }
    
    var body: some View {
        ZStack {
            
            let radius = size * 0.4
            let offset = size * 0.2
            
            // Left circle
            Circle()
                .stroke(color, lineWidth: lineWidth)
                .frame(width: radius * 2, height: radius * 2)
                .offset(x: -offset)
                .scaleEffect(leftScale)
            
            // Right circle
            Circle()
                .stroke(color, lineWidth: lineWidth)
                .frame(width: radius * 2, height: radius * 2)
                .offset(x: offset)
                .scaleEffect(rightScale)
            
            // Center vesica (the overlapping lens shape)
            vesicaShape
                .fill(color.opacity(0.2))
                .shadow(color: color.opacity(glowIntensity), radius: 20)
            
        }
        .opacity(opacity)
        .onAppear {
            if animated {
                withAnimation(.easeInOut(duration: 0.5)) {
                    opacity = 1.0
                }
                
                withAnimation(
                    .spring(response: 0.8, dampingFraction: 0.6)
                    .delay(0.2)
                ) {
                    leftScale = 1.0
                }
                
                withAnimation(
                    .spring(response: 0.8, dampingFraction: 0.6)
                    .delay(0.4)
                ) {
                    rightScale = 1.0
                }
                
                // Pulsing glow
                withAnimation(
                    .easeInOut(duration: 2)
                    .repeatForever(autoreverses: true)
                ) {
                    glowIntensity = 0.8
                }
            } else {
                opacity = 1.0
                leftScale = 1.0
                rightScale = 1.0
            }
        }
    }
    
    private var vesicaShape: Path {
        let radius = size * 0.4
        let offset = size * 0.2

        // Precompute angle in radians. Cast to Double to avoid ambiguous `asin` overloads.
        let angle = Double(asin(offset / radius))
        let angleDeg = angle * 180.0 / Double.pi

        return Path { path in

            // Top intersection point
            let topY = sqrt(radius * radius - offset * offset)

            // Start at top intersection
            path.move(to: CGPoint(x: 0, y: topY))

            // Right arc
            path.addArc(
                center: CGPoint(x: offset, y: 0),
                radius: radius,
                startAngle: .degrees(90.0 - angleDeg),
                endAngle: .degrees(270.0 + angleDeg),
                clockwise: false
            )

            // Left arc
            path.addArc(
                center: CGPoint(x: -offset, y: 0),
                radius: radius,
                startAngle: .degrees(270.0 + angleDeg),
                endAngle: .degrees(90.0 - angleDeg),
                clockwise: false
            )

            path.closeSubpath()
        }
    }
    
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        
        VesicaPiscis(size: 300, animated: true)
    }
}
