// DragonBubbleView.swift
// The persistent floating Dragon bubble that appears across all screens
// Tap to open Dragon, drag to reposition, swipe to dismiss

import SwiftUI

// MARK: - Dragon Bubble View

struct DragonBubbleView: View {
    
    @ObservedObject var manager: DragonBubbleManager
    @ObservedObject var dragonRepo = DragonCompanionRepository.shared
    
    @State private var dragOffset: CGSize = .zero
    @State private var isDragging: Bool = false
    @State private var showDismissHint: Bool = false
    @State private var breatheAnimation: Bool = false
    
    private let bubbleSize: CGFloat = 60
    
    var body: some View {
        
        ZStack {
            // Dismiss zone indicator (shows when dragging toward edge)
            if isDragging && showDismissHint {
                dismissZoneIndicator
            }
            
            // The bubble
            bubbleContent
                .position(
                    x: manager.bubblePosition.x + dragOffset.width,
                    y: manager.bubblePosition.y + dragOffset.height
                )
                .gesture(dragGesture)
                .onTapGesture {
                    manager.openDragonView()
                }
                .opacity(manager.isVisible ? 1 : 0)
                .scaleEffect(manager.isVisible ? 1 : 0.5)
                .animation(.spring(response: 0.4, dampingFraction: 0.7), value: manager.isVisible)
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 2.0).repeatForever(autoreverses: true)) {
                breatheAnimation = true
            }
        }
        .sheet(isPresented: $manager.showingFullDragon) {
            DragonCompanionView()
        }
    }
    
    // MARK: - Bubble Content
    
    private var bubbleContent: some View {
        ZStack {
            // Outer glow (breathing effect)
            Circle()
                .fill(
                    RadialGradient(
                        colors: [
                            dragonColor.opacity(0.4),
                            dragonColor.opacity(0.1),
                            Color.clear
                        ],
                        center: .center,
                        startRadius: bubbleSize / 2 - 5,
                        endRadius: bubbleSize / 2 + (breatheAnimation ? 15 : 8)
                    )
                )
                .frame(width: bubbleSize + 30, height: bubbleSize + 30)
            
            // Pulse ring (when Dragon wants attention)
            if manager.pulseAnimation {
                Circle()
                    .stroke(dragonColor, lineWidth: 2)
                    .frame(width: bubbleSize + 20, height: bubbleSize + 20)
                    .scaleEffect(breatheAnimation ? 1.3 : 1.0)
                    .opacity(breatheAnimation ? 0 : 0.8)
            }
            
            // Main bubble
            Circle()
                .fill(
                    LinearGradient(
                        colors: [
                            Color(hex: "#1a1a2e"),
                            Color(hex: "#0f0f1a")
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
                                colors: [dragonColor, dragonColor.opacity(0.5)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ),
                            lineWidth: 2
                        )
                )
                .shadow(color: dragonColor.opacity(0.5), radius: 10, x: 0, y: 4)
            
            // Dragon emoji/icon
            dragonIcon
                .font(.system(size: 28))
                .scaleEffect(breatheAnimation ? 1.05 : 1.0)
            
            // Stage indicator (small badge)
            if let dragon = dragonRepo.currentDragon {
                stageIndicator(for: dragon)
            }
        }
        .scaleEffect(isDragging ? 1.1 : 1.0)
        .animation(.spring(response: 0.3), value: isDragging)
    }
    
    // MARK: - Dragon Icon
    
    @ViewBuilder
    private var dragonIcon: some View {
        if let dragon = dragonRepo.currentDragon {
            switch dragon.stage {
            case .egg:
                Text("🥚")
            case .hatching:
                Text("🐣")
            case .hatchling, .young:
                Text("🐉")
            case .adolescent, .adult:
                Text("🐲")
            case .elder, .ascended:
                Text("✨🐲✨")
                    .font(.system(size: 24))
            }
        } else {
            Text("🐉")
        }
    }
    
    // MARK: - Dragon Color
    
    private var dragonColor: Color {
        if let dragon = dragonRepo.currentDragon {
            return dragon.primaryElement.color
        }
        return Palette.accent.gold
    }
    
    // MARK: - Stage Indicator
    
    private func stageIndicator(for dragon: DragonCompanion) -> some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                
                // Level badge
                Text("\(dragon.level)")
                    .font(.system(size: 10, weight: .bold))
                    .foregroundColor(.white)
                    .frame(width: 18, height: 18)
                    .background(
                        Circle()
                            .fill(dragonColor)
                    )
                    .overlay(
                        Circle()
                            .stroke(Color.black, lineWidth: 1)
                    )
            }
        }
        .frame(width: bubbleSize, height: bubbleSize)
        .offset(x: 5, y: 5)
    }
    
    // MARK: - Dismiss Zone
    
    private var dismissZoneIndicator: some View {
        VStack {
            Spacer()
            
            HStack {
                // Left dismiss zone
                dismissZone(edge: .leading)
                
                Spacer()
                
                // Right dismiss zone
                dismissZone(edge: .trailing)
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 100)
        }
    }
    
    private func dismissZone(edge: HorizontalEdge) -> some View {
        VStack(spacing: 8) {
            Image(systemName: "xmark.circle.fill")
                .font(.system(size: 30))
            Text("Dismiss")
                .font(.system(size: 12, weight: .medium))
        }
        .foregroundColor(.red.opacity(0.8))
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.red.opacity(0.1))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.red.opacity(0.3), lineWidth: 1)
                )
        )
        .opacity(showDismissHint ? 1 : 0)
        .animation(.easeInOut(duration: 0.2), value: showDismissHint)
    }
    
    // MARK: - Drag Gesture
    
    private var dragGesture: some Gesture {
        DragGesture()
            .onChanged { value in
                isDragging = true
                dragOffset = value.translation
                
                // Check if near edges for dismiss hint
                let newX = manager.bubblePosition.x + value.translation.width
                let newY = manager.bubblePosition.y + value.translation.height
                
                showDismissHint = newX < 60 || newX > UIScreen.main.bounds.width - 60
                
                HapticManager.shared.selectionChanged()
            }
            .onEnded { value in
                isDragging = false
                
                let newX = manager.bubblePosition.x + value.translation.width
                let newY = manager.bubblePosition.y + value.translation.height
                
                // Check for dismiss gesture (drag to edge)
                if newX < 40 || newX > UIScreen.main.bounds.width - 40 {
                    manager.dismiss()
                    showDismissHint = false
                    dragOffset = .zero
                    HapticManager.shared.medium()
                    return
                }
                
                // Constrain to screen bounds
                let padding: CGFloat = 40
                let constrainedX = min(max(newX, padding), UIScreen.main.bounds.width - padding)
                let constrainedY = min(max(newY, padding + 60), UIScreen.main.bounds.height - padding - 100)
                
                withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                    manager.bubblePosition = CGPoint(x: constrainedX, y: constrainedY)
                    dragOffset = .zero
                    showDismissHint = false
                }
                
                manager.savePosition()
            }
    }
}

// MARK: - Preview

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        
        DragonBubbleView(manager: DragonBubbleManager.shared)
    }
}
