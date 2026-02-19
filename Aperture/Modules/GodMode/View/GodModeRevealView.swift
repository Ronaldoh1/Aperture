// GodModeRevealView.swift
// The cosmic unlock animation when GodMode is first discovered
// 3-6-9 sacred geometry unfolds as the monad awakens

import SwiftUI

struct GodModeRevealView: View {
    
    @ObservedObject var manager: GodModeManager
    @State private var phase: RevealPhase = .dormant
    @State private var ringScale: [CGFloat] = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    @State private var ringOpacity: [Double] = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    @State private var eyeScale: CGFloat = 0
    @State private var eyeGlow: Double = 0
    @State private var textOpacity: Double = 0
    @State private var particlePhase: Double = 0
    @State private var vortexRotation: Double = 0
    
    enum RevealPhase {
        case dormant, awakening, expanding, revealing, complete
    }
    
    var body: some View {
        ZStack {
            // Deep void background
            Color.black
                .ignoresSafeArea()
            
            // Particle field
            particleField
            
            // 3-6-9 Sacred rings
            sacredRings
            
            // Vortex spiral
            vortexSpiral
            
            // Central eye
            centralEye
            
            // Reveal text
            revealText
        }
        .onAppear {
            startRevealSequence()
        }
    }
    
    // MARK: - Particle Field
    
    private var particleField: some View {
        SwiftUI.TimelineView(.animation) { timeline in
            Canvas { context, size in
                let time = timeline.date.timeIntervalSinceReferenceDate
                
                for i in 0..<100 {
                    let seed = Double(i)
                    let x = (sin(time * 0.5 + seed * 0.7) * 0.5 + 0.5) * size.width
                    let y = (cos(time * 0.3 + seed * 1.1) * 0.5 + 0.5) * size.height
                    let radius = (sin(time + seed) * 0.5 + 0.5) * 3 + 1
                    let opacity = (sin(time * 2 + seed * 0.5) * 0.5 + 0.5) * 0.6
                    
                    // Gold and cyan particles
                    let color = i % 3 == 0 ? 
                        Color(red: 1, green: 0.84, blue: 0).opacity(opacity) :
                        Color(red: 0, green: 0.9, blue: 1).opacity(opacity * 0.7)
                    
                    context.fill(
                        Path(ellipseIn: CGRect(x: x - radius, y: y - radius, width: radius * 2, height: radius * 2)),
                        with: .color(color)
                    )
                }
            }
        }
        .opacity(phase == .dormant ? 0 : 0.8)
    }
    
    // MARK: - Sacred Rings (9 rings for 3-6-9)
    
    private var sacredRings: some View {
        ZStack {
            ForEach(0..<9, id: \.self) { index in
                let baseSize: CGFloat = 60 + CGFloat(index) * 35
                
                Circle()
                    .stroke(
                        AngularGradient(
                            colors: ringColors(for: index),
                            center: .center,
                            startAngle: .degrees(Double(index) * 40),
                            endAngle: .degrees(Double(index) * 40 + 360)
                        ),
                        lineWidth: index < 3 ? 3 : (index < 6 ? 2 : 1.5)
                    )
                    .frame(width: baseSize, height: baseSize)
                    .scaleEffect(ringScale[index])
                    .opacity(ringOpacity[index])
                    .rotationEffect(.degrees(Double(index) * 10 + vortexRotation * (index % 2 == 0 ? 1 : -1) * 0.3))
            }
        }
    }
    
    private func ringColors(for index: Int) -> [Color] {
        if index < 3 {
            // Inner 3 - Gold (Intent)
            return [
                Color(red: 1, green: 0.84, blue: 0),
                Color(red: 1, green: 0.6, blue: 0),
                Color(red: 1, green: 0.84, blue: 0).opacity(0.3)
            ]
        } else if index < 6 {
            // Middle 6 - Cyan (Embodiment)
            return [
                Color(red: 0, green: 0.9, blue: 1),
                Color(red: 0.4, green: 0.6, blue: 1),
                Color(red: 0, green: 0.9, blue: 1).opacity(0.3)
            ]
        } else {
            // Outer 9 - Violet (Completion/Infinity)
            return [
                Color(red: 0.6, green: 0.3, blue: 1),
                Color(red: 0.9, green: 0.4, blue: 0.8),
                Color(red: 0.6, green: 0.3, blue: 1).opacity(0.3)
            ]
        }
    }
    
    // MARK: - Vortex Spiral
    
    private var vortexSpiral: some View {
        ZStack {
            ForEach(0..<6, id: \.self) { arm in
                spiralArm(index: arm)
            }
        }
        .rotationEffect(.degrees(vortexRotation))
        .opacity(phase == .expanding || phase == .revealing || phase == .complete ? 0.6 : 0)
    }
    
    private func spiralArm(index: Int) -> some View {
        Path { path in
            let startAngle = Double(index) * 60
            for i in 0..<50 {
                let t = Double(i) / 50.0
                let angle = startAngle + t * 720
                let radius = 30 + t * 150
                let x = 200 + cos(angle * .pi / 180) * radius
                let y = 200 + sin(angle * .pi / 180) * radius
                
                if i == 0 {
                    path.move(to: CGPoint(x: x, y: y))
                } else {
                    path.addLine(to: CGPoint(x: x, y: y))
                }
            }
        }
        .stroke(
            LinearGradient(
                colors: [
                    Color(red: 1, green: 0.84, blue: 0).opacity(0.8),
                    Color(red: 0, green: 0.9, blue: 1).opacity(0.4),
                    Color.clear
                ],
                startPoint: .center,
                endPoint: .trailing
            ),
            lineWidth: 2
        )
        .frame(width: 400, height: 400)
    }
    
    // MARK: - Central Eye
    
    private var centralEye: some View {
        ZStack {
            // Glow
            Circle()
                .fill(
                    RadialGradient(
                        colors: [
                            Color(red: 1, green: 0.84, blue: 0).opacity(eyeGlow * 0.8),
                            Color(red: 1, green: 0.6, blue: 0).opacity(eyeGlow * 0.4),
                            Color.clear
                        ],
                        center: .center,
                        startRadius: 20,
                        endRadius: 100
                    )
                )
                .frame(width: 200, height: 200)
            
            // Eye symbol
            Image(systemName: "eye.circle.fill")
                .font(.system(size: 80, weight: .ultraLight))
                .foregroundStyle(
                    LinearGradient(
                        colors: [
                            Color(red: 1, green: 0.84, blue: 0),
                            Color.white,
                            Color(red: 1, green: 0.84, blue: 0)
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .shadow(color: Color(red: 1, green: 0.84, blue: 0).opacity(0.8), radius: 20)
                .scaleEffect(eyeScale)
        }
    }
    
    // MARK: - Reveal Text
    
    private var revealText: some View {
        VStack(spacing: 16) {
            Spacer()
            
            Text("G O D M O D E")
                .font(.system(size: 32, weight: .black, design: .rounded))
                .tracking(8)
                .foregroundStyle(
                    LinearGradient(
                        colors: [
                            Color(red: 1, green: 0.84, blue: 0),
                            Color.white,
                            Color(red: 1, green: 0.84, blue: 0)
                        ],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .shadow(color: Color(red: 1, green: 0.84, blue: 0).opacity(0.8), radius: 10)
            
            Text("I AM THE MONAD")
                .font(.system(size: 14, weight: .medium, design: .rounded))
                .tracking(4)
                .foregroundColor(.white.opacity(0.8))
            
            Text("Reality Obeys My Spark")
                .font(.system(size: 12, weight: .regular, design: .serif))
                .italic()
                .foregroundColor(Color(red: 0, green: 0.9, blue: 1).opacity(0.9))
            
            Spacer()
                .frame(height: 100)
        }
        .opacity(textOpacity)
    }
    
    // MARK: - Animation Sequence
    
    private func startRevealSequence() {
        guard manager.isRevealing else { return }
        
        phase = .awakening
        
        // Start vortex rotation
        withAnimation(.linear(duration: 60).repeatForever(autoreverses: false)) {
            vortexRotation = 360
        }
        
        // Phase 1: Inner 3 rings (0.0 - 0.6s)
        for i in 0..<3 {
            let delay = Double(i) * 0.15
            withAnimation(.spring(response: 0.5, dampingFraction: 0.7).delay(delay)) {
                ringScale[i] = 1
                ringOpacity[i] = 1
            }
        }
        
        // Phase 2: Middle 6 rings (0.6 - 1.2s)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            phase = .expanding
            for i in 3..<6 {
                let delay = Double(i - 3) * 0.15
                withAnimation(.spring(response: 0.5, dampingFraction: 0.7).delay(delay)) {
                    ringScale[i] = 1
                    ringOpacity[i] = 0.9
                }
            }
        }
        
        // Phase 3: Outer 9 rings (1.2 - 1.8s)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            for i in 6..<9 {
                let delay = Double(i - 6) * 0.15
                withAnimation(.spring(response: 0.5, dampingFraction: 0.7).delay(delay)) {
                    ringScale[i] = 1
                    ringOpacity[i] = 0.8
                }
            }
        }
        
        // Phase 4: Eye reveal (1.5s)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            phase = .revealing
            withAnimation(.spring(response: 0.6, dampingFraction: 0.6)) {
                eyeScale = 1
            }
            withAnimation(.easeInOut(duration: 0.8)) {
                eyeGlow = 1
            }
        }
        
        // Phase 5: Text reveal (2.0s)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            phase = .complete
            withAnimation(.easeInOut(duration: 0.5)) {
                textOpacity = 1
            }
        }
    }
}

// MARK: - Preview

#Preview {
    GodModeRevealView(manager: GodModeManager.shared)
}
