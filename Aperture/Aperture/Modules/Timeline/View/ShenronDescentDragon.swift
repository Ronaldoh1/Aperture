// ShenronDescentDragon.swift
// A dramatic Shenron-inspired dragon that descends through the Timeline
// Serpentine, elongated, with flowing whiskers and glowing eyes — NOT a moth.

import SwiftUI

// MARK: - Shenron Descent View (Full-Screen Descent Animation)

struct ShenronDescentView: View {
    
    @State private var descentProgress: CGFloat = 0   // 0 = coiled at top, 1 = fully descended
    @State private var bodyWave: CGFloat = 0
    @State private var eyePulse: CGFloat = 0.6
    @State private var auraGlow: CGFloat = 0.3
    @State private var whiskerWave: CGFloat = 0
    @State private var scaleShimmer: CGFloat = 0
    @State private var particleBurst: Bool = false
    
    var onDescentComplete: (() -> Void)?
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                
                // Particle trail during descent
                if descentProgress > 0 && descentProgress < 1 {
                    descentParticles(in: geo)
                }
                
                // The Shenron body — serpentine path
                ShenronSerpentineBody(
                    progress: descentProgress,
                    wave: bodyWave,
                    shimmer: scaleShimmer
                )
                .frame(width: geo.size.width, height: geo.size.height)
                
                // Dragon head at the leading edge of descent
                ShenronHead(
                    eyePulse: eyePulse,
                    whiskerWave: whiskerWave
                )
                .frame(width: 90, height: 90)
                .position(
                    x: headPosition(in: geo).x,
                    y: headPosition(in: geo).y
                )
                .scaleEffect(0.8 + descentProgress * 0.3)
                
                // Aura burst on completion
                if particleBurst {
                    Circle()
                        .fill(
                            RadialGradient(
                                colors: [
                                    Palette.accent.gold.opacity(0.6),
                                    Color.green.opacity(0.3),
                                    Color.clear
                                ],
                                center: .center,
                                startRadius: 0,
                                endRadius: 150
                            )
                        )
                        .frame(width: 300, height: 300)
                        .position(headPosition(in: geo))
                        .opacity(particleBurst ? 0 : 0.8)
                        .scaleEffect(particleBurst ? 2.5 : 0.5)
                }
            }
        }
        .onAppear {
            startDescentSequence()
        }
    }
    
    private func headPosition(in geo: GeometryProxy) -> CGPoint {
        let w = geo.size.width
        let h = geo.size.height
        
        // Serpentine path for the head
        let y = -h * 0.1 + descentProgress * h * 1.0
        let sineX = sin(descentProgress * .pi * 2.5) * w * 0.2
        let x = w / 2 + sineX
        
        return CGPoint(x: x, y: y)
    }
    
    private func descentParticles(in geo: GeometryProxy) -> some View {
        ForEach(0..<20, id: \.self) { i in
            let pos = headPosition(in: geo)
            Circle()
                .fill(
                    [Palette.accent.gold, Color.green, Color.cyan].randomElement()!
                        .opacity(Double.random(in: 0.3...0.7))
                )
                .frame(width: CGFloat.random(in: 2...5))
                .position(
                    x: pos.x + CGFloat.random(in: -60...60),
                    y: pos.y + CGFloat.random(in: -80...40)
                )
                .blur(radius: Double.random(in: 0.5...2))
        }
    }
    
    private func startDescentSequence() {
        // Body wave animation (continuous)
        withAnimation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true)) {
            bodyWave = 1.0
        }
        withAnimation(.easeInOut(duration: 2.0).repeatForever(autoreverses: true)) {
            whiskerWave = 1.0
        }
        withAnimation(.easeInOut(duration: 1.2).repeatForever(autoreverses: true)) {
            eyePulse = 1.0
        }
        withAnimation(.easeInOut(duration: 3.0).repeatForever(autoreverses: true)) {
            scaleShimmer = 1.0
        }
        
        // The dramatic descent — 4 seconds
        withAnimation(.easeInOut(duration: 4.0)) {
            descentProgress = 0.85
        }
        
        // Aura burst at bottom
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

// MARK: - Shenron Serpentine Body (Canvas-drawn)

struct ShenronSerpentineBody: View {
    
    var progress: CGFloat // 0 to 1, how far descended
    var wave: CGFloat     // body undulation
    var shimmer: CGFloat  // scale shimmer effect
    
    var body: some View {
        Canvas { context, size in
            let w = size.width
            let h = size.height
            
            // Only draw visible body segments based on descent progress
            let totalLength = progress * h * 1.2
            guard totalLength > 10 else { return }
            
            // Build serpentine path
            let steps = 120
            var points: [CGPoint] = []
            
            for i in 0...steps {
                let t = CGFloat(i) / CGFloat(steps)
                let segmentY = -h * 0.1 + t * h * 1.2
                
                // Only draw what's descended so far
                guard segmentY <= (-h * 0.1 + totalLength) else { break }
                
                // Serpentine wave
                let amplitude = w * 0.18
                let frequency: CGFloat = 2.5
                let waveOffset = wave * 0.03
                let sineX = sin((t * .pi * frequency) + waveOffset) * amplitude
                let x = w / 2 + sineX
                
                points.append(CGPoint(x: x, y: segmentY))
            }
            
            guard points.count >= 2 else { return }
            
            // Draw the body with tapered width
            for i in 1..<points.count {
                let t = CGFloat(i) / CGFloat(points.count)
                
                // Body tapers: thick in middle, thin at head and tail
                let taper: CGFloat
                if t < 0.15 {
                    taper = t / 0.15  // Taper from tail
                } else if t > 0.85 {
                    taper = (1.0 - t) / 0.15  // Taper to head (neck)
                } else {
                    taper = 1.0  // Full width in middle
                }
                let bodyWidth = (18 + taper * 14) * (0.8 + progress * 0.2)
                
                let p1 = points[i - 1]
                let p2 = points[i]
                
                // Direction perpendicular to body
                let dx = p2.x - p1.x
                let dy = p2.y - p1.y
                let len = sqrt(dx * dx + dy * dy)
                guard len > 0 else { continue }
                let nx = -dy / len * bodyWidth / 2
                let ny = dx / len * bodyWidth / 2
                
                var segPath = Path()
                segPath.move(to: CGPoint(x: p1.x + nx, y: p1.y + ny))
                segPath.addLine(to: CGPoint(x: p2.x + nx, y: p2.y + ny))
                segPath.addLine(to: CGPoint(x: p2.x - nx, y: p2.y - ny))
                segPath.addLine(to: CGPoint(x: p1.x - nx, y: p1.y - ny))
                segPath.closeSubpath()
                
                // Color: emerald green with gold belly shimmer
                let greenVal = 0.55 + shimmer * 0.1 * sin(t * .pi * 8)
                let color = Color(
                    red: 0.05 + shimmer * 0.05 * sin(t * .pi * 6),
                    green: greenVal,
                    blue: 0.25 + shimmer * 0.05
                )
                
                context.fill(segPath, with: .color(color))
                
                // Scale pattern lines (horizontal stripes on body)
                if i % 4 == 0 {
                    var scaleLine = Path()
                    scaleLine.move(to: CGPoint(x: p1.x + nx * 0.7, y: p1.y + ny * 0.7))
                    scaleLine.addLine(to: CGPoint(x: p1.x - nx * 0.7, y: p1.y - ny * 0.7))
                    context.stroke(scaleLine, with: .color(.white.opacity(0.08)), lineWidth: 0.5)
                }
            }
            
            // Outer glow stroke
            if points.count > 2 {
                var glowPath = Path()
                glowPath.move(to: points[0])
                for pt in points.dropFirst() {
                    glowPath.addLine(to: pt)
                }
                context.stroke(
                    glowPath,
                    with: .color(Palette.accent.gold.opacity(0.3)),
                    lineWidth: 3
                )
            }
        }
    }
}

// MARK: - Shenron Head (Code-drawn, no assets needed)

struct ShenronHead: View {
    
    var eyePulse: CGFloat
    var whiskerWave: CGFloat
    
    var body: some View {
        ZStack {
            
            // Head aura
            Circle()
                .fill(
                    RadialGradient(
                        colors: [
                            Color.green.opacity(0.4),
                            Palette.accent.gold.opacity(0.2),
                            Color.clear
                        ],
                        center: .center,
                        startRadius: 15,
                        endRadius: 55
                    )
                )
                .frame(width: 100, height: 100)
            
            // Head shape
            ShenronHeadShape()
                .fill(
                    LinearGradient(
                        colors: [
                            Color(red: 0.0, green: 0.65, blue: 0.3),
                            Color(red: 0.05, green: 0.55, blue: 0.25),
                            Color(red: 0.0, green: 0.45, blue: 0.2)
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .frame(width: 60, height: 65)
                .shadow(color: Color.green.opacity(0.5), radius: 8)
            
            // Head outline
            ShenronHeadShape()
                .stroke(
                    LinearGradient(
                        colors: [Palette.accent.gold.opacity(0.6), Color.green.opacity(0.4)],
                        startPoint: .top,
                        endPoint: .bottom
                    ),
                    lineWidth: 1.5
                )
                .frame(width: 60, height: 65)
            
            // Antlers / horns
            HStack(spacing: 36) {
                ShenronAntler()
                    .rotationEffect(.degrees(-25))
                    .offset(x: 4, y: -2)
                ShenronAntler()
                    .rotationEffect(.degrees(25))
                    .scaleEffect(x: -1, y: 1)
                    .offset(x: -4, y: -2)
            }
            .offset(y: -32)
            
            // Eyes — fierce red Shenron eyes
            HStack(spacing: 18) {
                ShenronEye(pulse: eyePulse)
                ShenronEye(pulse: eyePulse)
            }
            .offset(y: -8)
            
            // Whiskers — iconic long flowing
            HStack(spacing: 50) {
                ShenronWhiskerLong(wave: whiskerWave, direction: -1)
                ShenronWhiskerLong(wave: whiskerWave, direction: 1)
            }
            .offset(y: 6)
            
            // Mouth / jaw detail
            Path { path in
                path.move(to: CGPoint(x: 20, y: 52))
                path.addCurve(
                    to: CGPoint(x: 70, y: 52),
                    control1: CGPoint(x: 35, y: 58),
                    control2: CGPoint(x: 55, y: 58)
                )
            }
            .stroke(Color.red.opacity(0.4), lineWidth: 1)
            .frame(width: 90, height: 65)
            .offset(y: 2)
            
            // Teeth hints
            HStack(spacing: 8) {
                ForEach(0..<3, id: \.self) { _ in
                    DragonTooth()
                        .fill(Color.white.opacity(0.6))
                        .frame(width: 4, height: 5)
                }
            }
            .offset(y: 18)
        }
    }
}

// MARK: - Shenron Eye

struct ShenronEye: View {
    var pulse: CGFloat
    
    var body: some View {
        ZStack {
            // Eye glow
            Circle()
                .fill(
                    RadialGradient(
                        colors: [Color.red.opacity(0.9 * pulse), Color.red.opacity(0.3), Color.clear],
                        center: .center,
                        startRadius: 0,
                        endRadius: 12
                    )
                )
                .frame(width: 24, height: 24)
            
            // Eye shape
            Ellipse()
                .fill(
                    RadialGradient(
                        colors: [Color.red, Color(red: 0.7, green: 0, blue: 0)],
                        center: .center,
                        startRadius: 0,
                        endRadius: 6
                    )
                )
                .frame(width: 10, height: 7)
            
            // Slit pupil
            Ellipse()
                .fill(Color.black)
                .frame(width: 3, height: 6)
            
            // Highlight
            Circle()
                .fill(Color.white.opacity(0.8))
                .frame(width: 2.5, height: 2.5)
                .offset(x: -2, y: -1.5)
        }
    }
}

// MARK: - Shenron Antler

struct ShenronAntler: View {
    var body: some View {
        ZStack {
            // Main antler
            Path { path in
                path.move(to: CGPoint(x: 10, y: 30))
                path.addCurve(
                    to: CGPoint(x: 5, y: 0),
                    control1: CGPoint(x: 8, y: 20),
                    control2: CGPoint(x: 2, y: 8)
                )
                path.addCurve(
                    to: CGPoint(x: 15, y: 30),
                    control1: CGPoint(x: 8, y: 8),
                    control2: CGPoint(x: 14, y: 20)
                )
                path.closeSubpath()
            }
            .fill(
                LinearGradient(
                    colors: [Palette.accent.gold, Color(red: 0.6, green: 0.4, blue: 0.1)],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .frame(width: 20, height: 32)
            
            // Branch
            Path { path in
                path.move(to: CGPoint(x: 10, y: 12))
                path.addCurve(
                    to: CGPoint(x: 0, y: 5),
                    control1: CGPoint(x: 6, y: 10),
                    control2: CGPoint(x: 2, y: 6)
                )
            }
            .stroke(
                Palette.accent.gold.opacity(0.7),
                style: StrokeStyle(lineWidth: 2.5, lineCap: .round)
            )
            .frame(width: 20, height: 32)
        }
    }
}

// MARK: - Long Flowing Whisker

struct ShenronWhiskerLong: View {
    var wave: CGFloat
    var direction: CGFloat // -1 for left, 1 for right
    
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 0, y: 0))
            path.addCurve(
                to: CGPoint(x: direction * 35, y: 30 + wave * 5),
                control1: CGPoint(x: direction * 10, y: 8),
                control2: CGPoint(x: direction * 25 + wave * direction * 5, y: 20)
            )
            path.addCurve(
                to: CGPoint(x: direction * 50, y: 50 + wave * 8),
                control1: CGPoint(x: direction * 40, y: 35),
                control2: CGPoint(x: direction * 48, y: 42 + wave * 3)
            )
        }
        .stroke(
            LinearGradient(
                colors: [Palette.accent.gold, Palette.accent.gold.opacity(0.3)],
                startPoint: .leading,
                endPoint: .trailing
            ),
            style: StrokeStyle(lineWidth: 2.5, lineCap: .round)
        )
        .frame(width: 60, height: 60)
    }
}

// MARK: - Shenron Head Shape

struct ShenronHeadShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let w = rect.width
        let h = rect.height
        
        // Top of snout
        path.move(to: CGPoint(x: w * 0.5, y: 0))
        
        // Right side — angular jaw
        path.addCurve(
            to: CGPoint(x: w * 0.9, y: h * 0.3),
            control1: CGPoint(x: w * 0.7, y: 0),
            control2: CGPoint(x: w * 0.88, y: h * 0.15)
        )
        path.addCurve(
            to: CGPoint(x: w * 0.85, y: h * 0.6),
            control1: CGPoint(x: w * 0.92, y: h * 0.4),
            control2: CGPoint(x: w * 0.9, y: h * 0.5)
        )
        // Jaw
        path.addCurve(
            to: CGPoint(x: w * 0.5, y: h),
            control1: CGPoint(x: w * 0.8, y: h * 0.8),
            control2: CGPoint(x: w * 0.65, y: h * 0.95)
        )
        // Left jaw
        path.addCurve(
            to: CGPoint(x: w * 0.15, y: h * 0.6),
            control1: CGPoint(x: w * 0.35, y: h * 0.95),
            control2: CGPoint(x: w * 0.1, y: h * 0.8)
        )
        // Left cheek
        path.addCurve(
            to: CGPoint(x: w * 0.1, y: h * 0.3),
            control1: CGPoint(x: w * 0.08, y: h * 0.5),
            control2: CGPoint(x: w * 0.08, y: h * 0.4)
        )
        // Back to top
        path.addCurve(
            to: CGPoint(x: w * 0.5, y: 0),
            control1: CGPoint(x: w * 0.12, y: h * 0.15),
            control2: CGPoint(x: w * 0.3, y: 0)
        )
        
        path.closeSubpath()
        return path
    }
}

// MARK: - Triangle Helper

struct DragonTooth: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.closeSubpath()
        return path
    }
}

// MARK: - Shenron Scroll Companion (Replaces the tiny SunDragonView)

struct ShenronScrollCompanion: View {
    
    var scrollProgress: CGFloat  // 0 to 1
    var size: CGFloat = 80
    @State private var bodyWave: CGFloat = 0
    @State private var eyePulse: CGFloat = 0.7
    @State private var whiskerWave: CGFloat = 0
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            // Speech bubble
            // (handled externally)
            
            // Dragon - now proper Shenron head with serpentine tail
            ZStack {
                
                // Aura
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [
                                Palette.accent.gold.opacity(0.3),
                                Color.green.opacity(0.15),
                                Color.clear
                            ],
                            center: .center,
                            startRadius: size * 0.15,
                            endRadius: size * 0.55
                        )
                    )
                    .frame(width: size * 1.2, height: size * 1.2)
                
                // Serpentine coil behind head
                SerpentineCoilShape(wave: bodyWave)
                    .fill(
                        LinearGradient(
                            colors: [
                                Color(red: 0.0, green: 0.6, blue: 0.3),
                                Color(red: 0.05, green: 0.5, blue: 0.25)
                            ],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .frame(width: size * 0.9, height: size * 1.1)
                    .shadow(color: Color.green.opacity(0.4), radius: 6)
                
                // Head
                ShenronHeadShape()
                    .fill(
                        LinearGradient(
                            colors: [
                                Color(red: 0.0, green: 0.65, blue: 0.3),
                                Color(red: 0.0, green: 0.5, blue: 0.22)
                            ],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .frame(width: size * 0.5, height: size * 0.55)
                    .offset(y: -size * 0.15)
                    .shadow(color: Color.green.opacity(0.5), radius: 8)
                
                // Head outline
                ShenronHeadShape()
                    .stroke(Palette.accent.gold.opacity(0.4), lineWidth: 1)
                    .frame(width: size * 0.5, height: size * 0.55)
                    .offset(y: -size * 0.15)
                
                // Eyes
                HStack(spacing: size * 0.15) {
                    miniEye
                    miniEye
                }
                .offset(y: -size * 0.2)
                
                // Whiskers
                HStack(spacing: size * 0.35) {
                    miniWhisker(direction: -1)
                    miniWhisker(direction: 1)
                }
                .offset(y: -size * 0.08)
                
                // Antler hints
                HStack(spacing: size * 0.28) {
                    miniAntler()
                        .rotationEffect(.degrees(-20))
                    miniAntler()
                        .rotationEffect(.degrees(20))
                        .scaleEffect(x: -1)
                }
                .offset(y: -size * 0.38)
            }
            .scaleEffect(1.0 + scrollProgress * 0.1)
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true)) {
                bodyWave = 1.0
            }
            withAnimation(.easeInOut(duration: 1.0).repeatForever(autoreverses: true)) {
                eyePulse = 1.0
            }
            withAnimation(.easeInOut(duration: 2.0).repeatForever(autoreverses: true)) {
                whiskerWave = 1.0
            }
        }
    }
    
    private var miniEye: some View {
        ZStack {
            Circle()
                .fill(
                    RadialGradient(
                        colors: [Color.red.opacity(0.9 * eyePulse), Color.red.opacity(0.2), Color.clear],
                        center: .center,
                        startRadius: 0,
                        endRadius: size * 0.06
                    )
                )
                .frame(width: size * 0.12, height: size * 0.12)
            
            Ellipse()
                .fill(Color.red)
                .frame(width: size * 0.06, height: size * 0.04)
            
            Ellipse()
                .fill(Color.black)
                .frame(width: size * 0.02, height: size * 0.035)
        }
    }
    
    private func miniWhisker(direction: CGFloat) -> some View {
        Path { path in
            path.move(to: CGPoint(x: 0, y: 0))
            path.addCurve(
                to: CGPoint(x: direction * 18 + whiskerWave * direction * 3, y: 14),
                control1: CGPoint(x: direction * 6, y: 4),
                control2: CGPoint(x: direction * 14, y: 10)
            )
        }
        .stroke(
            Palette.accent.gold.opacity(0.6),
            style: StrokeStyle(lineWidth: 1.5, lineCap: .round)
        )
        .frame(width: 24, height: 18)
    }
    
    private func miniAntler() -> some View {
        Path { path in
            path.move(to: CGPoint(x: 5, y: 14))
            path.addCurve(
                to: CGPoint(x: 4, y: 0),
                control1: CGPoint(x: 4, y: 8),
                control2: CGPoint(x: 2, y: 3)
            )
        }
        .stroke(
            Palette.accent.gold.opacity(0.5),
            style: StrokeStyle(lineWidth: 2, lineCap: .round)
        )
        .frame(width: 10, height: 16)
    }
}

// MARK: - Serpentine Coil Shape (For scroll companion body)

struct SerpentineCoilShape: Shape {
    var wave: CGFloat
    
    var animatableData: CGFloat {
        get { wave }
        set { wave = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let w = rect.width
        let h = rect.height
        let waveOff = wave * w * 0.03
        
        // Start from neck area
        path.move(to: CGPoint(x: w * 0.45, y: h * 0.15))
        
        // Right coil
        path.addCurve(
            to: CGPoint(x: w * 0.8 + waveOff, y: h * 0.35),
            control1: CGPoint(x: w * 0.65, y: h * 0.15),
            control2: CGPoint(x: w * 0.85, y: h * 0.22)
        )
        
        // Swing left
        path.addCurve(
            to: CGPoint(x: w * 0.2 - waveOff, y: h * 0.55),
            control1: CGPoint(x: w * 0.75, y: h * 0.48),
            control2: CGPoint(x: w * 0.3, y: h * 0.48)
        )
        
        // Swing right
        path.addCurve(
            to: CGPoint(x: w * 0.75 + waveOff, y: h * 0.75),
            control1: CGPoint(x: w * 0.15, y: h * 0.62),
            control2: CGPoint(x: w * 0.7, y: h * 0.65)
        )
        
        // Tail curl
        path.addCurve(
            to: CGPoint(x: w * 0.5, y: h * 0.95),
            control1: CGPoint(x: w * 0.8, y: h * 0.85),
            control2: CGPoint(x: w * 0.6, y: h * 0.93)
        )
        
        // Return path (left side, narrower)
        path.addCurve(
            to: CGPoint(x: w * 0.65 - waveOff, y: h * 0.75),
            control1: CGPoint(x: w * 0.45, y: h * 0.9),
            control2: CGPoint(x: w * 0.6, y: h * 0.82)
        )
        
        path.addCurve(
            to: CGPoint(x: w * 0.28 + waveOff, y: h * 0.55),
            control1: CGPoint(x: w * 0.6, y: h * 0.68),
            control2: CGPoint(x: w * 0.25, y: h * 0.62)
        )
        
        path.addCurve(
            to: CGPoint(x: w * 0.7 - waveOff, y: h * 0.35),
            control1: CGPoint(x: w * 0.35, y: h * 0.48),
            control2: CGPoint(x: w * 0.65, y: h * 0.45)
        )
        
        path.addCurve(
            to: CGPoint(x: w * 0.55, y: h * 0.15),
            control1: CGPoint(x: w * 0.75, y: h * 0.25),
            control2: CGPoint(x: w * 0.65, y: h * 0.15)
        )
        
        path.closeSubpath()
        return path
    }
}
