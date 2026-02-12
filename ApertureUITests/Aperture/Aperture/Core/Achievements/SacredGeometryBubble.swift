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
    
    private let bubbleSize: CGFloat = 56
    
    var body: some View {
        ZStack {
            // Glow effect - sun-like radiance
            Circle()
                .fill(
                    RadialGradient(
                        colors: [
                            Color(hex: "#FFD700").opacity(0.6),
                            Color(hex: "#FFA500").opacity(0.3),
                            Color.clear
                        ],
                        center: .center,
                        startRadius: bubbleSize * 0.3,
                        endRadius: bubbleSize * 1.2
                    )
                )
                .frame(width: bubbleSize * 2, height: bubbleSize * 2)
                .scaleEffect(pulseScale)
                .opacity(0.8 + glowPhase * 0.2)
            
            // Main bubble background
            Circle()
                .fill(
                    LinearGradient(
                        colors: [
                            Color(hex: "#1A1A2E"),
                            Color(hex: "#16213E")
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(width: bubbleSize, height: bubbleSize)
                .overlay(
                    Circle()
                        .stroke(
                            LinearGradient(
                                colors: [
                                    Color(hex: "#FFD700"),
                                    Color(hex: "#FFA500"),
                                    Color(hex: "#FFD700")
                                ],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ),
                            lineWidth: 2
                        )
                )
                .shadow(color: Color(hex: "#FFD700").opacity(0.5), radius: 10)
            
            // Flower of Life shape
            FlowerOfLifeBubbleShape()
                .stroke(
                    LinearGradient(
                        colors: [
                            Color(hex: "#FFD700"),
                            Color(hex: "#FFA500")
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    ),
                    lineWidth: 1.5
                )
                .frame(width: bubbleSize * 0.7, height: bubbleSize * 0.7)
                .rotationEffect(.degrees(rotationAngle))
            
            // Badge count indicator
            if badgeManager.earnedBadges.count > 0 {
                Text("\(badgeManager.earnedBadges.count)")
                    .font(.system(size: 10, weight: .bold))
                    .foregroundColor(.white)
                    .padding(4)
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
        }
    }
    
    private func startAnimations() {
        // Slow rotation
        withAnimation(.linear(duration: 30).repeatForever(autoreverses: false)) {
            rotationAngle = 360
        }
        
        // Glow pulsing
        withAnimation(.easeInOut(duration: 2).repeatForever(autoreverses: true)) {
            glowPhase = 1
        }
        
        // Gentle pulse
        withAnimation(.easeInOut(duration: 3).repeatForever(autoreverses: true)) {
            pulseScale = 1.1
        }
    }
}

// MARK: - Flower of Life Bubble Shape

struct FlowerOfLifeBubbleShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) * 0.25
        
        // Central circle
        path.addEllipse(in: CGRect(
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
            
            path.addEllipse(in: CGRect(
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
    @Published var position: CGPoint = CGPoint(x: UIScreen.main.bounds.width - 50, y: UIScreen.main.bounds.height - 150)
    
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
    @State private var position: CGPoint = CGPoint(
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
                                position.y = max(padding + 50, min(UIScreen.main.bounds.height - padding - 80, position.y))
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
