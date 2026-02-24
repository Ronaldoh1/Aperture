// ChosenOnesAnimations.swift
// SunFlow: Reignited — Aperture
// Shared animations for Chosen Ones + Monad vs God courses

import SwiftUI

// MARK: - Floating Particle System

struct ChosenOnesParticle: Identifiable {
    let id = UUID()
    var x: CGFloat
    var y: CGFloat
    let size: CGFloat
    var opacity: Double
    let speed: Double
    let drift: CGFloat
    let symbol: String
}

struct ChosenOnesParticleField: View {
    let accent: Color
    let symbols: [String]
    @State private var particles: [ChosenOnesParticle] = []
    @State private var animating = false

    private let particleCount = 18

    var body: some View {
        GeometryReader { geo in
            ZStack {
                ForEach(particles) { p in
                    Text(p.symbol)
                        .font(.system(size: p.size))
                        .foregroundColor(accent.opacity(p.opacity))
                        .position(x: p.x * geo.size.width, y: p.y * geo.size.height)
                }
            }
        }
        .onAppear {
            spawnParticles()
            withAnimation(Animation.linear(duration: 12).repeatForever(autoreverses: false)) {
                animating = true
            }
        }
    }

    private func spawnParticles() {
        particles = (0..<particleCount).map { i in
            ChosenOnesParticle(
                x: CGFloat.random(in: 0...1),
                y: CGFloat.random(in: 0...1),
                size: CGFloat.random(in: 6...14),
                opacity: Double.random(in: 0.04...0.14),
                speed: Double.random(in: 8...20),
                drift: CGFloat.random(in: -0.1...0.1),
                symbol: symbols[i % symbols.count]
            )
        }
        // Animate each particle independently
        for i in particles.indices {
            let duration = particles[i].speed
            withAnimation(Animation.linear(duration: duration).repeatForever(autoreverses: false).delay(Double(i) * 0.3)) {
                particles[i].y -= 1.2
                particles[i].x += particles[i].drift
                particles[i].opacity = Double.random(in: 0.02...0.08)
            }
        }
    }
}

// MARK: - Sacred Geometry Ring

struct SacredGeometryRing: View {
    let accent: Color
    let size: CGFloat
    @State private var rotation: Double = 0
    @State private var pulse: CGFloat = 1

    var body: some View {
        ZStack {
            // Outer ring
            Circle()
                .stroke(accent.opacity(0.08), lineWidth: 1)
                .frame(width: size, height: size)

            // Star of David / Flower of Life approximation using rotated triangles
            ForEach(0..<6) { i in
                RegularPolygon(sides: 3, cornerRadius: 2)
                    .stroke(accent.opacity(0.12), lineWidth: 0.5)
                    .frame(width: size * 0.55, height: size * 0.55)
                    .rotationEffect(.degrees(Double(i) * 60 + rotation))
            }

            // Inner hexagon
            RegularPolygon(sides: 6, cornerRadius: 1)
                .stroke(accent.opacity(0.10), lineWidth: 0.7)
                .frame(width: size * 0.35, height: size * 0.35)
                .rotationEffect(.degrees(rotation * 0.5))

            // Center dot
            Circle()
                .fill(accent.opacity(0.25 * pulse))
                .frame(width: 4, height: 4)
        }
        .onAppear {
            withAnimation(Animation.linear(duration: 40).repeatForever(autoreverses: false)) {
                rotation = 360
            }
            withAnimation(Animation.easeInOut(duration: 2.5).repeatForever(autoreverses: true)) {
                pulse = 0.4
            }
        }
    }
}

// MARK: - Regular Polygon Shape

struct RegularPolygon: Shape {
    let sides: Int
    let cornerRadius: CGFloat

    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        var path = Path()
        for i in 0..<sides {
            let angle = (Double(i) * 360.0 / Double(sides) - 90) * Double.pi / 180
            let point = CGPoint(
                x: center.x + radius * CGFloat(cos(angle)),
                y: center.y + radius * CGFloat(sin(angle))
            )
            if i == 0 { path.move(to: point) }
            else { path.addLine(to: point) }
        }
        path.closeSubpath()
        return path
    }
}

// MARK: - Archetype Reveal Animation

struct ArchetypeRevealView: View {
    let archetype: ChosenOneArchetype
    @State private var phase: RevealPhase = .waiting
    @State private var emojiScale: CGFloat = 0.3
    @State private var emojiOpacity: Double = 0
    @State private var ringOpacity: Double = 0
    @State private var ringScale: CGFloat = 0.5
    @State private var textOpacity: Double = 0
    @State private var glowRadius: CGFloat = 0
    let onDismiss: () -> Void

    enum RevealPhase { case waiting, ring, emoji, text, done }

    var body: some View {
        ZStack {
            Color(red: 0.02, green: 0.02, blue: 0.08).ignoresSafeArea()

            // Particle field
            ChosenOnesParticleField(accent: archetype.accent, symbols: ["✨", "⭐", "🌟", "💫", "·"])
                .opacity(0.7)

            VStack(spacing: 24) {
                Spacer()

                // Sacred geometry rings (layered)
                ZStack {
                    SacredGeometryRing(accent: archetype.accent, size: 240)
                        .opacity(ringOpacity)
                        .scaleEffect(ringScale)
                    SacredGeometryRing(accent: archetype.accent, size: 160)
                        .opacity(ringOpacity * 0.7)
                        .scaleEffect(ringScale * 0.95)

                    // Emoji
                    ZStack {
                        // Glow
                        Circle()
                            .fill(archetype.accent.opacity(0.15))
                            .frame(width: 100, height: 100)
                            .blur(radius: glowRadius)

                        Text(archetype.emoji)
                            .font(.system(size: 72))
                            .scaleEffect(emojiScale)
                            .opacity(emojiOpacity)
                    }
                }
                .frame(width: 260, height: 260)

                VStack(spacing: 12) {
                    Text("YOU ARE")
                        .font(.system(size: 11, weight: .black)).tracking(4)
                        .foregroundColor(archetype.accent.opacity(0.6))
                        .opacity(textOpacity)

                    Text(archetype.name.uppercased())
                        .font(.system(size: 36, weight: .black))
                        .foregroundColor(.white)
                        .opacity(textOpacity)

                    Text(archetype.tagline)
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.white.opacity(0.5))
                        .multilineTextAlignment(.center)
                        .opacity(textOpacity)
                        .padding(.horizontal, 40)
                }

                Spacer()

                Button {
                    onDismiss()
                } label: {
                    Text("Explore Your Mission →")
                        .font(.system(size: 15, weight: .bold)).foregroundColor(.black)
                        .frame(maxWidth: .infinity).padding(.vertical, 15)
                        .background(RoundedRectangle(cornerRadius: 14).fill(archetype.accent))
                }
                .opacity(textOpacity)
                .padding(.horizontal, 24)
                .padding(.bottom, 40)
            }
        }
        .onAppear { runRevealSequence() }
    }

    private func runRevealSequence() {
        // Step 1: Ring appears
        withAnimation(.spring(response: 0.8, dampingFraction: 0.6).delay(0.2)) {
            ringOpacity = 1
            ringScale = 1
        }
        // Step 2: Emoji bursts in
        withAnimation(.spring(response: 0.5, dampingFraction: 0.5).delay(0.7)) {
            emojiScale = 1.1
            emojiOpacity = 1
        }
        withAnimation(.spring(response: 0.3, dampingFraction: 0.7).delay(1.1)) {
            emojiScale = 1.0
        }
        // Glow pulses
        withAnimation(.easeOut(duration: 0.6).delay(0.8)) {
            glowRadius = 30
        }
        withAnimation(.easeInOut(duration: 1.2).delay(1.4).repeatForever(autoreverses: true)) {
            glowRadius = 15
        }
        // Step 3: Text fades in
        withAnimation(.easeOut(duration: 0.8).delay(1.3)) {
            textOpacity = 1
        }
    }
}

// MARK: - Monad Infinite Light Animation

struct MonadInfiniteLight: View {
    let accent: Color
    @State private var rotation: Double = 0
    @State private var innerRotation: Double = 0
    @State private var outerOpacity: Double = 0.3
    @State private var coreOpacity: Double = 0.6
    @State private var rayExtension: CGFloat = 0
    let size: CGFloat

    var body: some View {
        ZStack {
            // Outer rays
            ForEach(0..<12) { i in
                RoundedRectangle(cornerRadius: 1)
                    .fill(accent.opacity(0.06 + outerOpacity * 0.04))
                    .frame(width: 1, height: size * 0.45 + rayExtension)
                    .offset(y: -(size * 0.22 + rayExtension / 2))
                    .rotationEffect(.degrees(Double(i) * 30 + rotation))
            }

            // Middle ring — Flower of Life
            SacredGeometryRing(accent: accent, size: size * 0.75)
                .opacity(outerOpacity)

            // Inner circle with radial gradient
            Circle()
                .fill(RadialGradient(
                    colors: [accent.opacity(coreOpacity), accent.opacity(0.0)],
                    center: .center,
                    startRadius: 0,
                    endRadius: size * 0.2
                ))
                .frame(width: size * 0.4, height: size * 0.4)

            // Innermost point — the Monad
            Circle()
                .fill(accent.opacity(0.9))
                .frame(width: 6, height: 6)
                .shadow(color: accent, radius: 8)
        }
        .frame(width: size, height: size)
        .onAppear {
            withAnimation(.linear(duration: 25).repeatForever(autoreverses: false)) {
                rotation = 360
            }
            withAnimation(.linear(duration: 15).repeatForever(autoreverses: false)) {
                innerRotation = -360
            }
            withAnimation(.easeInOut(duration: 3).repeatForever(autoreverses: true)) {
                outerOpacity = 0.7
                coreOpacity = 0.3
                rayExtension = 20
            }
        }
    }
}

// MARK: - 144K Connection Pulse

struct ConnectionPulse: View {
    let accent: Color
    @State private var rings: [PulseRing] = (0..<4).map { PulseRing(id: $0) }

    struct PulseRing: Identifiable {
        let id: Int
        var scale: CGFloat = 0.3
        var opacity: Double = 0.8
    }

    var body: some View {
        ZStack {
            ForEach(Array(rings.enumerated()), id: \.1.id) { idx, ring in
                Circle()
                    .stroke(accent.opacity(ring.opacity), lineWidth: 1.5)
                    .scaleEffect(ring.scale)
            }
        }
        .onAppear {
            for i in 0..<rings.count {
                let delay = Double(i) * 0.8
                withAnimation(.easeOut(duration: 3.0).repeatForever(autoreverses: false).delay(delay)) {
                    rings[i].scale = 2.5
                    rings[i].opacity = 0
                }
            }
        }
    }
}

// MARK: - Awakened Node Network (144K visualization)

struct AwakenedNodeNetwork: View {
    let accent: Color
    @State private var nodes: [NetworkNode] = []
    @State private var animating = false

    struct NetworkNode: Identifiable {
        let id = UUID()
        let x: CGFloat
        let y: CGFloat
        let size: CGFloat
        var pulse: CGFloat = 1.0
        var lit: Bool = false
    }

    var body: some View {
        GeometryReader { geo in
            ZStack {
                // Connection lines
                let nodeLimit = Swift.min(nodes.count, 8)
                ForEach(0..<nodeLimit, id: \.self) { i in
                    if i + 1 < nodes.count {
                        Path { path in
                            path.move(to: CGPoint(x: nodes[i].x * geo.size.width, y: nodes[i].y * geo.size.height))
                            path.addLine(to: CGPoint(x: nodes[i+1].x * geo.size.width, y: nodes[i+1].y * geo.size.height))
                        }
                        .stroke(accent.opacity(0.06), lineWidth: 0.5)
                    }
                }

                // Nodes
                ForEach(nodes) { node in
                    ZStack {
                        Circle().fill(accent.opacity(node.lit ? 0.25 : 0.05))
                            .frame(width: node.size * node.pulse, height: node.size * node.pulse)
                        Circle().fill(accent.opacity(node.lit ? 0.8 : 0.2))
                            .frame(width: 3, height: 3)
                    }
                    .position(x: node.x * geo.size.width, y: node.y * geo.size.height)
                }
            }
        }
        .onAppear {
            spawnNodes()
            animateNodes()
        }
    }

    private func spawnNodes() {
        nodes = (0..<16).map { _ in
            NetworkNode(x: CGFloat.random(in: 0.05...0.95), y: CGFloat.random(in: 0.05...0.95), size: CGFloat.random(in: 8...16))
        }
    }

    private func animateNodes() {
        for i in nodes.indices {
            withAnimation(.easeInOut(duration: Double.random(in: 1.5...3.0)).repeatForever(autoreverses: true).delay(Double(i) * 0.2)) {
                nodes[i].pulse = CGFloat.random(in: 1.0...1.8)
                nodes[i].lit = Bool.random()
            }
        }
    }
}
