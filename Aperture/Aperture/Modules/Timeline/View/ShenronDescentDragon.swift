// ShenronDescentDragon.swift
// Replaced: Dragon → Animated Clock descent through the Timeline
// Clock hands spin counter-clockwise as we travel back in time to find the truth.

import SwiftUI

// MARK: - Chronus Descent View (Full-Screen Clock Descent Animation)

struct ShenronDescentView: View {
    
    @State private var descentProgress: CGFloat = 0
    @State private var hourHandAngle: Double = 0
    @State private var minuteHandAngle: Double = 0
    @State private var auraGlow: CGFloat = 0.3
    @State private var particleBurst: Bool = false
    @State private var pendulumSwing: CGFloat = 0
    @State private var yearCountdown: Int = 2024
    @State private var ringPulse: CGFloat = 1.0
    @State private var showYearLabel: Bool = true
    
    var onDescentComplete: (() -> Void)?
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                
                // Time-warp particle trail
                if descentProgress > 0 && descentProgress < 1 {
                    timeWarpParticles(in: geo)
                }
                
                // Temporal distortion rings along the path
                temporalRings(in: geo)
                
                // Central animated clock at descent leading edge
                ZStack {
                    // Outer temporal glow
                    Circle()
                        .fill(
                            RadialGradient(
                                colors: [
                                    Palette.accent.gold.opacity(0.4 * Double(descentProgress)),
                                    Palette.primary.cyan.opacity(0.2 * Double(descentProgress)),
                                    Color.clear
                                ],
                                center: .center,
                                startRadius: 20,
                                endRadius: 120
                            )
                        )
                        .frame(width: 240, height: 240)
                    
                    // The Clock Face
                    ChronusClockFace(
                        hourAngle: hourHandAngle,
                        minuteAngle: minuteHandAngle,
                        size: 100,
                        glowIntensity: Double(descentProgress)
                    )
                    .scaleEffect(0.7 + descentProgress * 0.4)
                    
                    // Year counter
                    if showYearLabel {
                        Text(yearDisplay)
                            .font(.system(size: 16, weight: .black, design: .monospaced))
                            .foregroundStyle(
                                LinearGradient(
                                    colors: [Palette.accent.gold, Palette.primary.cyan],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .shadow(color: Palette.accent.gold.opacity(0.8), radius: 8)
                            .offset(y: 76)
                    }
                }
                .position(clockPosition(in: geo))
                
                // Aura burst on completion
                if particleBurst {
                    Circle()
                        .fill(
                            RadialGradient(
                                colors: [
                                    Palette.accent.gold.opacity(0.6),
                                    Palette.primary.cyan.opacity(0.3),
                                    Color.clear
                                ],
                                center: .center,
                                startRadius: 0,
                                endRadius: 200
                            )
                        )
                        .frame(width: 400, height: 400)
                        .position(clockPosition(in: geo))
                        .opacity(particleBurst ? 0 : 0.8)
                        .scaleEffect(particleBurst ? 3.0 : 0.5)
                }
                
                // "Traveling back..." label
                if descentProgress > 0.1 && descentProgress < 0.85 {
                    VStack(spacing: 6) {
                        Text("Traveling back through time...")
                            .font(.system(size: 14, weight: .semibold, design: .rounded))
                            .foregroundColor(Palette.text.secondary)
                        
                        Text("Unwinding the lies")
                            .font(.system(size: 12, weight: .medium, design: .rounded))
                            .foregroundColor(Palette.accent.gold.opacity(0.7))
                    }
                    .position(x: geo.size.width / 2, y: geo.size.height * 0.12)
                    .transition(.opacity)
                }
            }
        }
        .onAppear {
            startDescentSequence()
        }
    }
    
    private var yearDisplay: String {
        if yearCountdown <= 0 {
            return "\(abs(yearCountdown)) BCE"
        } else if yearCountdown >= 2024 {
            return "NOW"
        } else {
            return "\(yearCountdown) CE"
        }
    }
    
    private func clockPosition(in geo: GeometryProxy) -> CGPoint {
        let w = geo.size.width
        let h = geo.size.height
        let y = h * 0.15 + descentProgress * h * 0.65
        let sway = sin(descentProgress * .pi * 2) * w * 0.08
        return CGPoint(x: w / 2 + sway, y: y)
    }
    
    private func temporalRings(in geo: GeometryProxy) -> some View {
        ForEach(0..<6, id: \.self) { i in
            let ringProgress = CGFloat(i) / 6.0
            let isVisible = descentProgress > ringProgress
            
            Circle()
                .stroke(
                    LinearGradient(
                        colors: [
                            Palette.accent.gold.opacity(isVisible ? 0.3 : 0),
                            Palette.primary.cyan.opacity(isVisible ? 0.15 : 0)
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    ),
                    lineWidth: 1.5
                )
                .frame(width: 60 + CGFloat(i) * 20, height: 60 + CGFloat(i) * 20)
                .scaleEffect(isVisible ? ringPulse : 0.5)
                .opacity(isVisible ? 1 : 0)
                .position(
                    x: geo.size.width / 2,
                    y: geo.size.height * (0.15 + ringProgress * 0.65)
                )
                .animation(.easeOut(duration: 0.6).delay(Double(i) * 0.15), value: descentProgress)
        }
    }
    
    private func timeWarpParticles(in geo: GeometryProxy) -> some View {
        ForEach(0..<25, id: \.self) { i in
            let pos = clockPosition(in: geo)
            let angle = Double(i) * (360.0 / 25.0)
            let radius: CGFloat = CGFloat.random(in: 30...90)
            
            Circle()
                .fill(
                    [Palette.accent.gold, Palette.primary.cyan, Color.white].randomElement()!
                        .opacity(Double.random(in: 0.2...0.6))
                )
                .frame(width: CGFloat.random(in: 1.5...4))
                .position(
                    x: pos.x + cos(CGFloat(angle) * .pi / 180) * radius,
                    y: pos.y + sin(CGFloat(angle) * .pi / 180) * radius
                )
                .blur(radius: Double.random(in: 0.3...1.5))
        }
    }
    
    private func startDescentSequence() {
        // Clock hands spinning counter-clockwise (backwards through time)
        withAnimation(.linear(duration: 4.5).repeatForever(autoreverses: false)) {
            minuteHandAngle = -360 * 8  // Fast counter-clockwise
        }
        withAnimation(.linear(duration: 4.5).repeatForever(autoreverses: false)) {
            hourHandAngle = -360 * 2    // Slower counter-clockwise
        }
        
        // Ring pulse
        withAnimation(.easeInOut(duration: 1.2).repeatForever(autoreverses: true)) {
            ringPulse = 1.08
        }
        
        // Year countdown
        let totalDuration = 4.0
        let years = [2024, 2000, 1900, 1500, 1000, 500, 325, 30, -500, -1500, -3000, -10000]
        for (index, year) in years.enumerated() {
            let delay = totalDuration * Double(index) / Double(years.count)
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                withAnimation(.easeInOut(duration: 0.2)) {
                    yearCountdown = year
                }
            }
        }
        
        // The descent — 4 seconds
        withAnimation(.easeInOut(duration: 4.0)) {
            descentProgress = 0.85
        }
        
        // Burst at completion
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
            withAnimation(.easeOut(duration: 0.8)) {
                particleBurst = true
                auraGlow = 0.8
            }
            HapticManager.shared.success()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                onDescentComplete?()
            }
        }
    }
}

// MARK: - Chronus Clock Face

struct ChronusClockFace: View {
    
    var hourAngle: Double
    var minuteAngle: Double
    var size: CGFloat
    var glowIntensity: Double = 0.5
    
    var body: some View {
        ZStack {
            // Clock face background
            Circle()
                .fill(
                    RadialGradient(
                        colors: [
                            Color(hex: "#1a1408"),
                            Color(hex: "#0d0a04"),
                            Color.black
                        ],
                        center: .center,
                        startRadius: 0,
                        endRadius: size * 0.5
                    )
                )
                .frame(width: size, height: size)
            
            // Outer ring - ornate
            Circle()
                .stroke(
                    AngularGradient(
                        colors: [
                            Palette.accent.gold,
                            Palette.primary.orange,
                            Palette.accent.gold.opacity(0.5),
                            Palette.primary.cyan.opacity(0.3),
                            Palette.accent.gold
                        ],
                        center: .center
                    ),
                    lineWidth: 3
                )
                .frame(width: size, height: size)
                .shadow(color: Palette.accent.gold.opacity(0.5 * glowIntensity), radius: 10)
            
            // Inner ring
            Circle()
                .stroke(Palette.accent.gold.opacity(0.3), lineWidth: 1)
                .frame(width: size * 0.85, height: size * 0.85)
            
            // Hour markers
            ForEach(0..<12, id: \.self) { i in
                let angle = Double(i) * 30.0
                let isCardinal = i % 3 == 0
                
                Rectangle()
                    .fill(isCardinal ? Palette.accent.gold : Palette.accent.gold.opacity(0.5))
                    .frame(width: isCardinal ? 2.5 : 1.5, height: isCardinal ? size * 0.1 : size * 0.06)
                    .offset(y: -size * 0.4)
                    .rotationEffect(.degrees(angle))
            }
            
            // Roman numerals at cardinal points
            ForEach(cardinalNumerals, id: \.0) { numeral in
                Text(numeral.1)
                    .font(.system(size: size * 0.09, weight: .bold, design: .serif))
                    .foregroundColor(Palette.accent.gold.opacity(0.8))
                    .offset(x: numeral.2 * size * 0.33, y: numeral.3 * size * 0.33)
            }
            
            // Minute hand (long, thin)
            ClockHand(
                length: size * 0.38,
                width: 2,
                color: Palette.primary.cyan
            )
            .rotationEffect(.degrees(minuteAngle))
            .shadow(color: Palette.primary.cyan.opacity(0.6 * glowIntensity), radius: 4)
            
            // Hour hand (shorter, thicker)
            ClockHand(
                length: size * 0.26,
                width: 3,
                color: Palette.accent.gold
            )
            .rotationEffect(.degrees(hourAngle))
            .shadow(color: Palette.accent.gold.opacity(0.6 * glowIntensity), radius: 4)
            
            // Center pin
            ZStack {
                Circle()
                    .fill(Palette.accent.gold)
                    .frame(width: size * 0.06, height: size * 0.06)
                Circle()
                    .fill(Color.black)
                    .frame(width: size * 0.03, height: size * 0.03)
            }
            .shadow(color: Palette.accent.gold.opacity(0.8), radius: 3)
        }
    }
    
    private var cardinalNumerals: [(Int, String, CGFloat, CGFloat)] {
        [
            (0, "XII", 0, -1),
            (1, "III", 1, 0),
            (2, "VI", 0, 1),
            (3, "IX", -1, 0)
        ]
    }
}

// MARK: - Clock Hand Shape

struct ClockHand: View {
    var length: CGFloat
    var width: CGFloat
    var color: Color
    
    var body: some View {
        VStack(spacing: 0) {
            Rectangle()
                .fill(
                    LinearGradient(
                        colors: [color, color.opacity(0.7)],
                        startPoint: .bottom,
                        endPoint: .top
                    )
                )
                .frame(width: width, height: length)
                .clipShape(
                    RoundedRectangle(cornerRadius: width / 2)
                )
            
            Spacer()
                .frame(height: length * 0.1)
        }
        .frame(height: length * 1.1)
        .offset(y: -length * 0.45)
    }
}

// MARK: - Chronus Scroll Companion (Clock that travels with user)

struct ShenronScrollCompanion: View {
    
    var scrollProgress: CGFloat  // 0 = top (present), 1 = bottom (ancient)
    var size: CGFloat
    
    @State private var minuteAngle: Double = 0
    @State private var hourAngle: Double = 0
    @State private var prevProgress: CGFloat = 0
    @State private var glowPulse: CGFloat = 0.5
    
    var body: some View {
        ZStack {
            // Outer temporal glow
            Circle()
                .fill(
                    RadialGradient(
                        colors: [
                            Palette.accent.gold.opacity(0.2 + Double(scrollProgress) * 0.2),
                            Color.clear
                        ],
                        center: .center,
                        startRadius: 0,
                        endRadius: size * 0.8
                    )
                )
                .frame(width: size * 1.4, height: size * 1.4)
                .scaleEffect(glowPulse)
            
            // Mini clock face
            ChronusClockFace(
                hourAngle: hourAngle,
                minuteAngle: minuteAngle,
                size: size,
                glowIntensity: 0.3 + Double(scrollProgress) * 0.7
            )
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 2.0).repeatForever(autoreverses: true)) {
                glowPulse = 0.6
            }
        }
        .onChange(of: scrollProgress) { _, newValue in
            let delta = newValue - prevProgress
            // Counter-clockwise when descending (going back in time)
            // Clockwise when ascending (returning to present)
            let direction: Double = delta > 0 ? -1.0 : 1.0
            let speed = abs(delta) * 800
            
            withAnimation(.easeOut(duration: 0.15)) {
                minuteAngle += direction * speed
                hourAngle += direction * speed * 0.25
            }
            prevProgress = newValue
        }
    }
}

// MARK: - Legacy Stubs (kept for compile compatibility with other modules)

struct ShenronHead: View {
    var eyePulse: CGFloat = 0.5
    var whiskerWave: CGFloat = 0
    var body: some View { EmptyView() }
}

struct ShenronSerpentineBody: View {
    var progress: CGFloat
    var wave: CGFloat
    var shimmer: CGFloat
    var body: some View { EmptyView() }
}

struct ShenronDragonShape: Shape {
    var wave: CGFloat = 0
    var animatableData: CGFloat {
        get { wave }
        set { wave = newValue }
    }
    func path(in rect: CGRect) -> Path { Path() }
}

struct ShenronHeadShape: Shape {
    func path(in rect: CGRect) -> Path { Path() }
}

struct SerpentineCoilShape: Shape {
    var wave: CGFloat
    var animatableData: CGFloat {
        get { wave }
        set { wave = newValue }
    }
    func path(in rect: CGRect) -> Path { Path() }
}
