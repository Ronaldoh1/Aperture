//
//  TorusField.swift
//  Aperture
//
//  Sacred Geometry - Torus Energy Field
//  ☀️ Life force flow, perfect for Sun awakening tutorial slide
//

import SwiftUI

struct TorusField: View {
    
    let size: CGFloat
    let lineWidth: CGFloat
    let color: Color
    let animated: Bool
    
    @State private var flowProgress: CGFloat = 0.0
    @State private var rotation: Double = 0
    @State private var opacity: Double = 0.0
    
    init(
        size: CGFloat = 300,
        lineWidth: CGFloat = 2,
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
            
            // Multiple concentric circles representing torus field lines
            ForEach(0..<8, id: \.self) { index in
                let scale = 0.3 + (Double(index) * 0.1)
                
                Circle()
                    .trim(from: 0, to: flowProgress)
                    .stroke(
                        color.opacity(1.0 - Double(index) * 0.1),
                        style: StrokeStyle(
                            lineWidth: lineWidth,
                            lineCap: .round
                        )
                    )
                    .frame(width: size * scale, height: size * scale)
                    .rotationEffect(.degrees(Double(index) * 45))
            }
            
            // Energy flow lines (meridians)
            ForEach(0..<12, id: \.self) { index in
                energyFlowPath(index: index)
                    .trim(from: 0, to: flowProgress)
                    .stroke(
                        color.opacity(0.4),
                        style: StrokeStyle(
                            lineWidth: lineWidth * 0.8,
                            lineCap: .round
                        )
                    )
            }
            
            // Center sun
            Circle()
                .fill(
                    RadialGradient(
                        colors: [
                            color,
                            color.opacity(0.6),
                            Color.clear
                        ],
                        center: .center,
                        startRadius: 0,
                        endRadius: size * 0.15
                    )
                )
                .frame(width: size * 0.3, height: size * 0.3)
                .scaleEffect(1.0 + sin(flowProgress * .pi * 2) * 0.1)
            
        }
        .rotationEffect(.degrees(rotation))
        .opacity(opacity)
        .onAppear {
            if animated {
                withAnimation(.easeInOut(duration: 0.5)) {
                    opacity = 1.0
                }
                
                withAnimation(
                    .easeInOut(duration: 3)
                    .repeatForever(autoreverses: false)
                ) {
                    flowProgress = 1.0
                }
                
                withAnimation(
                    .linear(duration: 60)
                    .repeatForever(autoreverses: false)
                ) {
                    rotation = 360
                }
            } else {
                opacity = 1.0
                flowProgress = 1.0
            }
        }
    }
    
    private func energyFlowPath(index: Int) -> Path {
        // Break up math into explicit subexpressions so the compiler can type-check quickly.
        let angle: Double = Double(index) * Double.pi / 6.0

        let startRadius: CGFloat = size * 0.15
        let endRadius: CGFloat = size * 0.5

        let cosA: CGFloat = CGFloat(cos(angle))
        let sinA: CGFloat = CGFloat(sin(angle))

        let startPoint = CGPoint(x: cosA * startRadius, y: sinA * startRadius)
        let endPoint = CGPoint(x: cosA * endRadius, y: sinA * endRadius)

        let midRadius: CGFloat = (startRadius + endRadius) * 0.5
        let controlPoint = CGPoint(x: cosA * midRadius * 1.2, y: sinA * midRadius * 1.2)

        var path = Path()
        path.move(to: startPoint)
        path.addQuadCurve(to: endPoint, control: controlPoint)
        return path
    }
    
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        
        TorusField(size: 300, animated: true)
            .shadow(color: Color(hex: "FFD700").opacity(0.6), radius: 30)
    }
}
