// AnimatedFlowerOfLife.swift
// Living sacred geometry for the Timeline opening
// The Flower of Life — found in the Osireion at Abydos, Da Vinci's notebooks,
// every ancient sun temple. The pattern of creation itself.

import SwiftUI

// MARK: - Animated Flower of Life (Timeline Opening)

struct AnimatedFlowerOfLife: View {
    
    var size: CGFloat = 300
    var accentColor: Color = Palette.accent.gold
    
    @State private var breathe: CGFloat = 0
    @State private var outerRotation: Double = 0
    @State private var innerRotation: Double = 0
    @State private var pulseRing: CGFloat = 0.8
    @State private var centerGlow: CGFloat = 0.4
    @State private var shimmer: Double = 0
    
    var body: some View {
        ZStack {
            sunGlow
            outerBoundary
            flowerLayer1Center
            flowerLayer2Inner
            flowerLayer3Outer
            flowerLayer4Interstitial
            centerSun
            lightParticles
        }
        .frame(width: size, height: size)
        .onAppear { startAnimations() }
    }
    
    // MARK: - Sun Glow
    
    private var sunGlow: some View {
        let glowAlpha1: Double = 0.25 + centerGlow * 0.15
        let glowAlpha2: Double = 0.12 + centerGlow * 0.08
        let colors: [Color] = [
            accentColor.opacity(glowAlpha1),
            Color(hex: "#FF8C00").opacity(glowAlpha2),
            Color(hex: "#FF4500").opacity(0.04),
            Color.clear
        ]
        let grad = RadialGradient(
            colors: colors,
            center: .center,
            startRadius: size * 0.05,
            endRadius: size * 0.55
        )
        return ZStack {
            Circle()
                .fill(grad)
                .frame(width: size * 1.1, height: size * 1.1)
                .blur(radius: 20)
            Circle()
                .stroke(accentColor.opacity(0.15 * Double(pulseRing)), lineWidth: 2)
                .frame(width: size * pulseRing, height: size * pulseRing)
                .blur(radius: 3)
        }
    }
    
    // MARK: - Outer Boundary
    
    private var outerBoundary: some View {
        let angColors: [Color] = [
            accentColor.opacity(0.5),
            Color.white.opacity(0.15),
            accentColor.opacity(0.3),
            Color.white.opacity(0.1),
            accentColor.opacity(0.5)
        ]
        return ZStack {
            Circle()
                .stroke(
                    AngularGradient(colors: angColors, center: .center),
                    lineWidth: 1.5
                )
                .frame(width: size * 0.92, height: size * 0.92)
                .rotationEffect(.degrees(outerRotation))
            Circle()
                .stroke(accentColor.opacity(0.12), lineWidth: 0.8)
                .frame(width: size * 0.98, height: size * 0.98)
                .rotationEffect(.degrees(-outerRotation * 0.5))
        }
    }
    
    // MARK: - Flower Layer 1: Center Seed
    
    private var flowerLayer1Center: some View {
        let r: CGFloat = size / 6
        return makeCircle(r: r, offsetX: 0, offsetY: 0, alpha: 0.6)
            .rotationEffect(.degrees(innerRotation * 0.3))
    }
    
    // MARK: - Flower Layer 2: Inner Ring (Seed of Life)
    
    private var flowerLayer2Inner: some View {
        let r: CGFloat = size / 6
        let rotRad: Double = innerRotation * .pi / 180
        return ZStack {
            ForEach(0..<6, id: \.self) { i in
                let angle: Double = Double(i) * (.pi / 3) + rotRad
                let xOff: CGFloat = CGFloat(cos(angle)) * r
                let yOff: CGFloat = CGFloat(sin(angle)) * r
                makeCircle(r: r, offsetX: xOff, offsetY: yOff, alpha: 0.45)
            }
        }
        .rotationEffect(.degrees(innerRotation * 0.3))
    }
    
    // MARK: - Flower Layer 3: Outer Ring
    
    private var flowerLayer3Outer: some View {
        let r: CGFloat = size / 6
        let rotRad: Double = innerRotation * .pi / 180
        return ZStack {
            ForEach(0..<6, id: \.self) { i in
                let angle: Double = Double(i) * (.pi / 3) + rotRad
                let xOff: CGFloat = CGFloat(cos(angle)) * r * 2
                let yOff: CGFloat = CGFloat(sin(angle)) * r * 2
                makeCircle(r: r, offsetX: xOff, offsetY: yOff, alpha: 0.3)
            }
        }
        .rotationEffect(.degrees(innerRotation * 0.3))
    }
    
    // MARK: - Flower Layer 4: Interstitial
    
    private var flowerLayer4Interstitial: some View {
        let r: CGFloat = size / 6
        let rotRad: Double = innerRotation * .pi / 180
        let dist: CGFloat = r * 1.732
        return ZStack {
            ForEach(0..<6, id: \.self) { i in
                let angle: Double = Double(i) * (.pi / 3) + (.pi / 6) + rotRad
                let xOff: CGFloat = CGFloat(cos(angle)) * dist
                let yOff: CGFloat = CGFloat(sin(angle)) * dist
                makeCircle(r: r, offsetX: xOff, offsetY: yOff, alpha: 0.25)
            }
        }
        .rotationEffect(.degrees(innerRotation * 0.3))
    }
    
    // MARK: - Circle Builder (simple, explicit types)
    
    private func makeCircle(r: CGFloat, offsetX: CGFloat, offsetY: CGFloat, alpha: Double) -> some View {
        let breatheAmount: CGFloat = breathe * 0.06
        let adjustedR: CGFloat = r * (1.0 + breatheAmount)
        let lineW: CGFloat = 1.2 + breathe * 0.3
        let c1: Color = accentColor.opacity(alpha)
        let c2: Color = Color.white.opacity(alpha * 0.5)
        let c3: Color = accentColor.opacity(alpha * 0.7)
        let grad = LinearGradient(colors: [c1, c2, c3], startPoint: .topLeading, endPoint: .bottomTrailing)
        
        return Circle()
            .stroke(grad, lineWidth: lineW)
            .frame(width: adjustedR * 2, height: adjustedR * 2)
            .offset(x: offsetX, y: offsetY)
    }
    
    // MARK: - Center Sun
    
    private var centerSun: some View {
        let scaleVal: CGFloat = 1.0 + centerGlow * 0.3
        let sunColors: [Color] = [
            Color.white.opacity(0.9),
            accentColor.opacity(0.7),
            accentColor.opacity(0.3),
            Color.clear
        ]
        let sunGrad = RadialGradient(
            colors: sunColors,
            center: .center,
            startRadius: 0,
            endRadius: size * 0.08
        )
        return ZStack {
            Circle()
                .fill(sunGrad)
                .frame(width: size * 0.16, height: size * 0.16)
                .scaleEffect(scaleVal)
            sunRays
            Circle()
                .fill(Color.white)
                .frame(width: 4, height: 4)
                .shadow(color: accentColor, radius: 4)
        }
    }
    
    private var sunRays: some View {
        let rayLen: CGFloat = size * 0.12 * (1.0 + centerGlow * 0.2)
        let rayAlpha: Double = 0.5 + centerGlow * 0.3
        return ZStack {
            ForEach(0..<6, id: \.self) { i in
                let angleDeg: Double = Double(i) * 60.0
                Rectangle()
                    .fill(
                        LinearGradient(
                            colors: [accentColor.opacity(rayAlpha), Color.clear],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .frame(width: rayLen, height: 1.5)
                    .offset(x: size * 0.06)
                    .rotationEffect(.degrees(angleDeg))
            }
        }
    }
    
    // MARK: - Light Particles
    
    private var lightParticles: some View {
        Canvas { context, canvasSize in
            let cx: CGFloat = canvasSize.width / 2
            let cy: CGFloat = canvasSize.height / 2
            let time: Double = shimmer
            
            for i in 0..<18 {
                let di: Double = Double(i)
                let baseAngle: Double = di * (.pi / 9) + time * 0.5
                let rDist: Double = Double(size) * (0.25 + sin(time * 2 + di * 0.8) * 0.18)
                let px: CGFloat = cx + CGFloat(cos(baseAngle) * rDist)
                let py: CGFloat = cy + CGFloat(sin(baseAngle) * rDist)
                let dotSize: CGFloat = 2.0 + CGFloat(sin(time * 3 + di) * 1.0)
                let alpha: Double = 0.3 + sin(time * 2.5 + di * 0.7) * 0.25
                
                let rect = CGRect(x: px - dotSize / 2, y: py - dotSize / 2, width: dotSize, height: dotSize)
                context.opacity = alpha
                let color: Color = i % 3 == 0 ? .white : accentColor
                context.fill(Circle().path(in: rect), with: .color(color))
            }
        }
        .frame(width: size, height: size)
        .allowsHitTesting(false)
    }
    
    // MARK: - Animations
    
    private func startAnimations() {
        withAnimation(.easeInOut(duration: 3.5).repeatForever(autoreverses: true)) {
            breathe = 1.0
        }
        withAnimation(.linear(duration: 40).repeatForever(autoreverses: false)) {
            outerRotation = 360
        }
        withAnimation(.linear(duration: 120).repeatForever(autoreverses: false)) {
            innerRotation = 360
        }
        withAnimation(.easeInOut(duration: 4).repeatForever(autoreverses: true)) {
            pulseRing = 1.1
        }
        withAnimation(.easeInOut(duration: 2.5).repeatForever(autoreverses: true)) {
            centerGlow = 1.0
        }
        withAnimation(.linear(duration: 8).repeatForever(autoreverses: false)) {
            shimmer = .pi * 2
        }
    }
}
