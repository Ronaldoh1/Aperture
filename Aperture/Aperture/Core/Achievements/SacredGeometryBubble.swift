// SacredGeometryBubble.swift
// Floating Flower of Life bubble that glows like the sun
// Replaces DragonCompanion - takes users to their Sacred Geometry badge collection

import SwiftUI

// MARK: - Sacred Geometry Bubble View

struct SacredGeometryBubbleView: View {
  @StateObject private var badgeManager = SacredBadgeManager.shared
  @State private var isExpanded = false
  @State private var showBadgeCollection = false
  @State private var glowPhase: CGFloat = 0
  @State private var rotationAngle: Double = 0
  @State private var pulseScale: CGFloat = 1.0
  @State private var coronaScale: CGFloat = 1.0
  @State private var flareOpacity: CGFloat = 0
  @State private var flareRotation: Double = 0
  @State private var innerPulse: CGFloat = 1.0
  @State private var surfaceWavePhase: CGFloat = 0

  /// 29% smaller (was 56, now ~40)
  private let bubbleSize: CGFloat = 40

  var body: some View {
    ZStack {
      // Outer corona - like sun's atmosphere
      coronaLayer

      // Dragon flare effect (occasional)
      dragonFlareLayer

      // Surface wave layer - sun granulation effect
      surfaceWaveLayer

      // Inner glow - sun-like radiance
      Circle()
        .fill(
          RadialGradient(
            colors: [
              Color(hex: "#FFD700").opacity(0.7),
              Color(hex: "#FFA500").opacity(0.4),
              Color(hex: "#FF6B00").opacity(0.2),
              Color.clear,
            ],
            center: .center,
            startRadius: bubbleSize * 0.2,
            endRadius: bubbleSize * 0.9
          )
        )
        .frame(width: bubbleSize * 1.8, height: bubbleSize * 1.8)
        .scaleEffect(pulseScale)
        .opacity(0.8 + glowPhase * 0.2)

      // Main bubble background - sun core
      Circle()
        .fill(
          RadialGradient(
            colors: [
              Color(hex: "#FFF4E0"),
              Color(hex: "#FFD700"),
              Color(hex: "#FF8C00"),
            ],
            center: .center,
            startRadius: 0,
            endRadius: bubbleSize * 0.5
          )
        )
        .frame(width: bubbleSize, height: bubbleSize)
        .scaleEffect(innerPulse)
        .overlay(
          Circle()
            .stroke(
              LinearGradient(
                colors: [
                  Color(hex: "#FFD700"),
                  Color(hex: "#FFA500"),
                  Color(hex: "#FF6B00"),
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
              ),
              lineWidth: 1.5
            )
        )
        .shadow(color: Color(hex: "#FFD700").opacity(0.6), radius: 8)

      // Flower of Life shape - darker for contrast
      FlowerOfLifeBubbleShape()
        .stroke(
          LinearGradient(
            colors: [
              Color(hex: "#8B4513").opacity(0.8),
              Color(hex: "#654321").opacity(0.6),
            ],
            startPoint: .top,
            endPoint: .bottom
          ),
          lineWidth: 1
        )
        .frame(width: bubbleSize * 0.65, height: bubbleSize * 0.65)
        .rotationEffect(.degrees(rotationAngle))

      // Badge count indicator
      if badgeManager.earnedBadges.count > 0 {
        Text("\(badgeManager.earnedBadges.count)")
          .font(.system(size: 8, weight: .bold))
          .foregroundColor(.white)
          .padding(3)
          .background(
            Circle()
              .fill(Color(hex: "#7C5CFF"))
          )
          .offset(x: bubbleSize * 0.35, y: -bubbleSize * 0.35)
      }
    }
    .frame(width: bubbleSize * 2, height: bubbleSize * 2)
    .contentShape(Circle().scale(0.7))
    .onTapGesture {
      HapticManager.shared.medium()
      showBadgeCollection = true
    }
    .onLongPressGesture {
      HapticManager.shared.heavy()
      withAnimation(.spring(response: 0.3)) {
        isExpanded.toggle()
      }
    }
    .sheet(isPresented: $showBadgeCollection) {
      NavigationStack {
        BadgeCollectionView()
      }
    }
    .onAppear {
      startAnimations()
      startDragonFlare()
    }
  }

  // MARK: - Corona Layer (Sun's Outer Atmosphere)

  private var coronaLayer: some View {
    ZStack {
      ForEach(0..<3, id: \.self) { i in
        Circle()
          .stroke(
            RadialGradient(
              colors: [
                Color(hex: "#FFD700").opacity(0.3 - Double(i) * 0.1),
                Color.clear,
              ],
              center: .center,
              startRadius: bubbleSize * 0.5,
              endRadius: bubbleSize * (1.2 + CGFloat(i) * 0.3)
            ),
            lineWidth: 2
          )
          .frame(
            width: bubbleSize * (2.0 + CGFloat(i) * 0.4),
            height: bubbleSize * (2.0 + CGFloat(i) * 0.4)
          )
          .scaleEffect(coronaScale)
          .opacity(0.5 - Double(i) * 0.15)
      }
    }
  }

  // MARK: - Dragon Flare Effect

  private var dragonFlareLayer: some View {
    ZStack {
      // Flare 1 - main prominence
      DragonFlareShape()
        .fill(
          LinearGradient(
            colors: [
              Color(hex: "#FF6B00").opacity(flareOpacity),
              Color(hex: "#FFD700").opacity(flareOpacity * 0.5),
              Color.clear,
            ],
            startPoint: .bottom,
            endPoint: .top
          )
        )
        .frame(width: bubbleSize * 0.4, height: bubbleSize * 0.8)
        .offset(y: -bubbleSize * 0.7)
        .rotationEffect(.degrees(flareRotation))

      // Flare 2 - secondary
      DragonFlareShape()
        .fill(
          LinearGradient(
            colors: [
              Color(hex: "#FF4500").opacity(flareOpacity * 0.7),
              Color(hex: "#FFA500").opacity(flareOpacity * 0.3),
              Color.clear,
            ],
            startPoint: .bottom,
            endPoint: .top
          )
        )
        .frame(width: bubbleSize * 0.25, height: bubbleSize * 0.5)
        .offset(y: -bubbleSize * 0.55)
        .rotationEffect(.degrees(flareRotation + 120))
    }
  }

  // MARK: - Surface Wave Layer

  private var surfaceWaveLayer: some View {
    Circle()
      .fill(
        AngularGradient(
          colors: [
            Color(hex: "#FFD700").opacity(0.3),
            Color(hex: "#FFA500").opacity(0.1),
            Color(hex: "#FFD700").opacity(0.3),
            Color(hex: "#FF8C00").opacity(0.15),
            Color(hex: "#FFD700").opacity(0.3),
          ],
          center: .center,
          startAngle: .degrees(surfaceWavePhase),
          endAngle: .degrees(surfaceWavePhase + 360)
        )
      )
      .frame(width: bubbleSize * 1.1, height: bubbleSize * 1.1)
      .blur(radius: 2)
  }

  private func startAnimations() {
    // Slow rotation of flower of life
    withAnimation(.linear(duration: 40).repeatForever(autoreverses: false)) {
      rotationAngle = 360
    }

    // Glow pulsing - heartbeat of the sun
    withAnimation(.easeInOut(duration: 2.5).repeatForever(autoreverses: true)) {
      glowPhase = 1
    }

    // Outer pulse - breathing effect
    withAnimation(.easeInOut(duration: 3.5).repeatForever(autoreverses: true)) {
      pulseScale = 1.15
    }

    // Corona pulse
    withAnimation(.easeInOut(duration: 4).repeatForever(autoreverses: true)) {
      coronaScale = 1.08
    }

    // Inner core pulse - faster heartbeat
    withAnimation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true)) {
      innerPulse = 1.05
    }

    // Surface wave rotation
    withAnimation(.linear(duration: 20).repeatForever(autoreverses: false)) {
      surfaceWavePhase = 360
    }
  }

  private func startDragonFlare() {
    // Random dragon flare every 8-15 seconds
    triggerFlare()
  }

  private func triggerFlare() {
    // Random delay between 8-15 seconds
    let delay = Double.random(in: 8...15)

    DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
      // Flare animation sequence
      withAnimation(.easeOut(duration: 0.8)) {
        flareOpacity = 0.9
        flareRotation = Double.random(in: 0...360)
      }

      // Hold and fade
      DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
        withAnimation(.easeIn(duration: 1.5)) {
          flareOpacity = 0
        }
      }

      // Schedule next flare
      triggerFlare()
    }
  }
}

// MARK: - Dragon Flare Shape

struct DragonFlareShape: Shape {
  func path(in rect: CGRect) -> Path {
    var path = Path()
    let width = rect.width
    let height = rect.height

    // Flame-like shape that resembles a dragon tongue/solar prominence
    path.move(to: CGPoint(x: width * 0.5, y: height))

    // Left curve
    path.addQuadCurve(
      to: CGPoint(x: width * 0.2, y: height * 0.4),
      control: CGPoint(x: width * 0.1, y: height * 0.7)
    )

    // Top curve to tip
    path.addQuadCurve(
      to: CGPoint(x: width * 0.5, y: 0),
      control: CGPoint(x: width * 0.3, y: height * 0.15)
    )

    // Right side down
    path.addQuadCurve(
      to: CGPoint(x: width * 0.8, y: height * 0.4),
      control: CGPoint(x: width * 0.7, y: height * 0.15)
    )

    // Back to base
    path.addQuadCurve(
      to: CGPoint(x: width * 0.5, y: height),
      control: CGPoint(x: width * 0.9, y: height * 0.7)
    )

    return path
  }
}

// MARK: - Flower of Life Bubble Shape

struct FlowerOfLifeBubbleShape: Shape {
  func path(in rect: CGRect) -> Path {
    var path = Path()
    let center = CGPoint(x: rect.midX, y: rect.midY)
    let radius = min(rect.width, rect.height) * 0.25

    // Central circle
    path.addEllipse(
      in: CGRect(
        x: center.x - radius,
        y: center.y - radius,
        width: radius * 2,
        height: radius * 2
      ))

    // Six surrounding circles
    for i in 0..<6 {
      let angle = CGFloat(i) * .pi / 3
      let x = center.x + radius * cos(angle)
      let y = center.y + radius * sin(angle)

      path.addEllipse(
        in: CGRect(
          x: x - radius,
          y: y - radius,
          width: radius * 2,
          height: radius * 2
        ))
    }

    return path
  }
}

// MARK: - Bubble Manager

class SacredGeometryBubbleManager: ObservableObject {
  static let shared = SacredGeometryBubbleManager()

  @Published var isVisible: Bool = true
  @Published var position: CGPoint = .init(
    x: UIScreen.main.bounds.width - 50, y: UIScreen.main.bounds.height - 150)

  private init() {}

  func show() {
    withAnimation(.spring()) {
      isVisible = true
    }
  }

  func hide() {
    withAnimation(.spring()) {
      isVisible = false
    }
  }
}

// MARK: - Overlay Wrapper

struct SacredGeometryOverlayWrapper<Content: View>: View {
  let content: Content
  @StateObject private var bubbleManager = SacredGeometryBubbleManager.shared
  @State private var dragOffset: CGSize = .zero
  @State private var position: CGPoint = .init(
    x: UIScreen.main.bounds.width - 60,
    y: UIScreen.main.bounds.height - 180
  )

  init(@ViewBuilder content: () -> Content) {
    self.content = content()
  }

  var body: some View {
    ZStack {
      content

      if bubbleManager.isVisible {
        SacredGeometryBubbleView()
          .position(position)
          .offset(dragOffset)
          .gesture(
            DragGesture()
              .onChanged { value in
                dragOffset = value.translation
              }
              .onEnded { value in
                position.x += value.translation.width
                position.y += value.translation.height
                dragOffset = .zero

                // Keep within bounds
                let padding: CGFloat = 40
                position.x = max(padding, min(UIScreen.main.bounds.width - padding, position.x))
                position.y = max(
                  padding + 50, min(UIScreen.main.bounds.height - padding - 80, position.y))
              }
          )
          .transition(.scale.combined(with: .opacity))
      }
    }
  }
}

// MARK: - View Extension

extension View {
  func withSacredGeometryBubble() -> some View {
    SacredGeometryOverlayWrapper {
      self
    }
  }
}

// MARK: - Preview

#Preview {
  ZStack {
    Color(hex: "#0D0D1A")
      .ignoresSafeArea()

    SacredGeometryBubbleView()
  }
}
