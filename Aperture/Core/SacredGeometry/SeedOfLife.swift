//
//  SeedOfLife.swift
//  Aperture
//
//  Sacred Geometry - Seed of Life
//  ☀️ Genesis, new beginning, perfect for Sign Up
//

import SwiftUI

struct SeedOfLife: View {
    
    let size: CGFloat
    let lineWidth: CGFloat
    let color: Color
    let animated: Bool
    
    @State private var circleScales: [CGFloat] = Array(repeating: 0.0, count: 7)
    @State private var rotation: Double = 0
    @State private var opacity: Double = 0.0
    
    init(
        size: CGFloat = 300,
        lineWidth: CGFloat = 2,
        color: Color = Color(hex: "00FF88"),
        animated: Bool = true
    ) {
        self.size = size
        self.lineWidth = lineWidth
        self.color = color
        self.animated = animated
    }
    
    var body: some View {
        ZStack {
            
            let radius = size * 0.25
            
            // Center circle
            Circle()
                .stroke(color, lineWidth: lineWidth)
                .frame(width: radius * 2, height: radius * 2)
                .scaleEffect(circleScales[0])
            
            // Six surrounding circles
            ForEach(0..<6, id: \.self) { index in
                let angle = Double(index) * .pi / 3
                Circle()
                    .stroke(color, lineWidth: lineWidth)
                    .frame(width: radius * 2, height: radius * 2)
                    .offset(
                        x: cos(angle) * radius,
                        y: sin(angle) * radius
                    )
                    .scaleEffect(circleScales[index + 1])
            }
            
        }
        .rotationEffect(.degrees(rotation))
        .opacity(opacity)
        .onAppear {
            if animated {
                withAnimation(.easeInOut(duration: 0.5)) {
                    opacity = 1.0
                }
                
                // Animate circles appearing one by one
                for i in 0..<7 {
                    withAnimation(
                        .spring(response: 0.6, dampingFraction: 0.7)
                        .delay(Double(i) * 0.1)
                    ) {
                        circleScales[i] = 1.0
                    }
                }
                
                // Gentle rotation after formation
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    withAnimation(
                        .linear(duration: 40)
                        .repeatForever(autoreverses: false)
                    ) {
                        rotation = 360
                    }
                }
            } else {
                opacity = 1.0
                circleScales = Array(repeating: 1.0, count: 7)
            }
        }
    }
    
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        
        SeedOfLife(size: 300, animated: true)
            .shadow(color: Color(hex: "00FF88").opacity(0.6), radius: 20)
    }
}
