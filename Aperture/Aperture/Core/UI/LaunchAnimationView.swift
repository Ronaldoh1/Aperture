// LaunchAnimationView.swift
// A polished launch animation that transitions smoothly into the app

import SwiftUI

struct LaunchAnimationView: View {
  @State private var phase: LaunchPhase = .logo
  @State private var logoScale: CGFloat = 0.6
  @State private var logoOpacity: Double = 0
  @State private var ringScale: CGFloat = 0.8
  @State private var ringOpacity: Double = 0
  @State private var outerRingRotation: Double = 0
  @State private var innerRingRotation: Double = 0
  @State private var textOpacity: Double = 0
  @State private var glowIntensity: Double = 0
  @State private var particlesOpacity: Double = 0

  let onComplete: () -> Void

  enum LaunchPhase {
    case logo
    case expanding
    case complete
  }

  var body: some View {
    ZStack {
      // Background
      cosmicBackground

      // Floating particles
      particleField
        .opacity(particlesOpacity)

      // Main content
      VStack(spacing: 24) {
        Spacer()

        // Animated logo
        ZStack {
          // Outer glow
          Circle()
            .fill(
              RadialGradient(
                colors: [
                  Palette.accent.gold.opacity(glowIntensity * 0.4),
                  Palette.primary.cyan.opacity(glowIntensity * 0.2),
                  .clear,
                ],
                center: .center,
                startRadius: 40,
                endRadius: 150
              )
            )
            .frame(width: 300, height: 300)
            .blur(radius: 30)

          // Outer rotating ring
          Circle()
            .stroke(
              AngularGradient(
                colors: [
                  Palette.primary.cyan.opacity(0.6),
                  Palette.primary.violet.opacity(0.4),
                  Palette.accent.gold.opacity(0.6),
                  Palette.primary.cyan.opacity(0.6),
                ],
                center: .center
              ),
              lineWidth: 2
            )
            .frame(width: 140, height: 140)
            .scaleEffect(ringScale)
            .opacity(ringOpacity)
            .rotationEffect(.degrees(outerRingRotation))

          // Inner rotating ring
          Circle()
            .stroke(
              AngularGradient(
                colors: [
                  Palette.accent.gold.opacity(0.8),
                  Palette.primary.cyan.opacity(0.5),
                  Palette.accent.gold.opacity(0.8),
                ],
                center: .center
              ),
              lineWidth: 1.5
            )
            .frame(width: 100, height: 100)
            .scaleEffect(ringScale)
            .opacity(ringOpacity)
            .rotationEffect(.degrees(innerRingRotation))

          // Center iris/aperture icon
          ZStack {
            // Iris circle
            Circle()
              .fill(
                RadialGradient(
                  colors: [
                    Color.black,
                    Color(hex: "#0a0a1a"),
                  ],
                  center: .center,
                  startRadius: 0,
                  endRadius: 35
                )
              )
              .frame(width: 70, height: 70)
              .overlay(
                Circle()
                  .stroke(
                    LinearGradient(
                      colors: [
                        Palette.accent.gold,
                        Palette.primary.cyan,
                      ],
                      startPoint: .topLeading,
                      endPoint: .bottomTrailing
                    ),
                    lineWidth: 2
                  )
              )

            // Eye/aperture symbol
            Image(systemName: "eye.fill")
              .font(.system(size: 28, weight: .semibold))
              .foregroundStyle(
                LinearGradient(
                  colors: [
                    Palette.accent.gold,
                    Palette.primary.cyan,
                  ],
                  startPoint: .topLeading,
                  endPoint: .bottomTrailing
                )
              )
          }
          .scaleEffect(logoScale)
          .opacity(logoOpacity)
        }

        // App name
        VStack(spacing: 8) {
          Text("APERTURE")
            .font(.system(size: 32, weight: .bold, design: .rounded))
            .tracking(8)
            .foregroundStyle(
              LinearGradient(
                colors: [.white, .white.opacity(0.9)],
                startPoint: .top,
                endPoint: .bottom
              )
            )
            .shadow(color: Palette.accent.gold.opacity(0.3), radius: 10)

          Text("See Beyond the Veil")
            .font(.system(size: 14, weight: .medium, design: .rounded))
            .foregroundColor(Palette.primary.cyan.opacity(0.8))
            .tracking(2)
        }
        .opacity(textOpacity)

        Spacer()
        Spacer()
      }
    }
    .ignoresSafeArea()
    .onAppear {
      startAnimation()
    }
  }

  // MARK: - Background

  private var cosmicBackground: some View {
    ZStack {
      // Base gradient
      LinearGradient(
        colors: [
          Color(hex: "#0a0a1a"),
          Color(hex: "#0d0d24"),
          Color(hex: "#0a0a1a"),
        ],
        startPoint: .top,
        endPoint: .bottom
      )

      // Subtle star field
      GeometryReader { geometry in
        ForEach(0..<30, id: \.self) { _ in
          Circle()
            .fill(Color.white.opacity(Double.random(in: 0.1...0.4)))
            .frame(width: CGFloat.random(in: 1...3))
            .position(
              x: CGFloat.random(in: 0...geometry.size.width),
              y: CGFloat.random(in: 0...geometry.size.height)
            )
        }
      }
    }
  }

  // MARK: - Particle Field

  private var particleField: some View {
    GeometryReader { geometry in
      ForEach(0..<15, id: \.self) { i in
        Circle()
          .fill(
            i % 2 == 0
              ? Palette.accent.gold.opacity(0.4)
              : Palette.primary.cyan.opacity(0.3)
          )
          .frame(width: CGFloat.random(in: 2...5))
          .position(
            x: geometry.size.width / 2 + CGFloat.random(in: -100...100),
            y: geometry.size.height / 2 + CGFloat.random(in: -150...150)
          )
          .blur(radius: 1)
      }
    }
  }

  // MARK: - Animation

  private func startAnimation() {
    // Phase 1: Logo fades in and scales up
    withAnimation(.easeOut(duration: 0.6)) {
      logoOpacity = 1
      logoScale = 1
    }

    // Phase 2: Rings appear and start rotating
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
      withAnimation(.easeOut(duration: 0.5)) {
        ringOpacity = 1
        ringScale = 1
      }

      // Start continuous rotation
      withAnimation(.linear(duration: 8).repeatForever(autoreverses: false)) {
        outerRingRotation = 360
      }
      withAnimation(.linear(duration: 6).repeatForever(autoreverses: false)) {
        innerRingRotation = -360
      }
    }

    // Phase 3: Text fades in
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
      withAnimation(.easeOut(duration: 0.5)) {
        textOpacity = 1
      }
    }

    // Phase 4: Glow intensifies
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
      withAnimation(.easeInOut(duration: 0.6)) {
        glowIntensity = 1
        particlesOpacity = 1
      }
    }

    // Phase 5: Complete and transition
    DispatchQueue.main.asyncAfter(deadline: .now() + 1.8) {
      withAnimation(.easeIn(duration: 0.3)) {
        phase = .complete
      }

      DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
        onComplete()
      }
    }
  }
}

// MARK: - Preview

#Preview {
  LaunchAnimationView {
    print("Animation complete")
  }
}
