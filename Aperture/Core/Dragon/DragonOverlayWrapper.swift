// DragonOverlayWrapper.swift
// Wraps any view with the Dragon bubble overlay
// Handles long-press and triple-tap gestures to summon Dragon

import SwiftUI

// MARK: - Dragon Overlay Wrapper

struct DragonOverlayWrapper<Content: View>: View {
    
    @StateObject private var bubbleManager = DragonBubbleManager.shared
    @State private var isLongPressing: Bool = false
    
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        ZStack {
            // Main content with gesture detection
            content
                .contentShape(Rectangle())
                .simultaneousGesture(tripleTapGesture)
                .simultaneousGesture(longPressGesture)
            
            // Dragon bubble overlay
            if bubbleManager.bubbleEnabled {
                DragonBubbleView(manager: bubbleManager)
                    .ignoresSafeArea()
            }
            
            // Long press indicator (shows when holding)
            if isLongPressing && bubbleManager.isDismissed {
                longPressIndicator
            }
        }
    }
    
    // MARK: - Triple Tap Gesture
    
    private var tripleTapGesture: some Gesture {
        TapGesture(count: 1)
            .onEnded {
                bubbleManager.registerTap()
            }
    }
    
    // MARK: - Long Press Gesture
    
    private var longPressGesture: some Gesture {
        LongPressGesture(minimumDuration: 1.5)
            .onChanged { isPressing in
                if isPressing && bubbleManager.isDismissed {
                    isLongPressing = true
                    HapticManager.shared.light()
                }
            }
            .onEnded { _ in
                isLongPressing = false
                if bubbleManager.isDismissed {
                    bubbleManager.show()
                    HapticManager.shared.success()
                }
            }
    }
    
    // MARK: - Long Press Indicator
    
    private var longPressIndicator: some View {
        VStack(spacing: 12) {
            // Dragon icon
            Text("🐉")
                .font(.system(size: 40))
                .scaleEffect(isLongPressing ? 1.2 : 1.0)
                .animation(.easeInOut(duration: 0.5).repeatForever(autoreverses: true), value: isLongPressing)
            
            Text("Summoning Dragon...")
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(.white)
            
            // Progress ring
            Circle()
                .trim(from: 0, to: isLongPressing ? 1.0 : 0.0)
                .stroke(Palette.accent.gold, lineWidth: 3)
                .frame(width: 50, height: 50)
                .rotationEffect(.degrees(-90))
                .animation(.linear(duration: 1.5), value: isLongPressing)
        }
        .padding(30)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.black.opacity(0.85))
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Palette.accent.gold.opacity(0.5), lineWidth: 1)
                )
        )
        .shadow(color: Palette.accent.gold.opacity(0.3), radius: 20)
        .transition(.scale.combined(with: .opacity))
    }
}

// MARK: - View Extension for Easy Use

extension View {
    func withDragonOverlay() -> some View {
        DragonOverlayWrapper {
            self
        }
    }
}

// MARK: - Context Chip Component

struct DragonContextChip: View {
    
    let context: DragonContext
    let customText: String?
    
    @ObservedObject private var bubbleManager = DragonBubbleManager.shared
    
    init(context: DragonContext, customText: String? = nil) {
        self.context = context
        self.customText = customText
    }
    
    var body: some View {
        Button(action: {
            bubbleManager.setContext(context)
            bubbleManager.openDragonView()
        }) {
            HStack(spacing: 6) {
                Text("🐉")
                    .font(.system(size: 14))
                
                Text(customText ?? "Ask the Dragon")
                    .font(.system(size: 12, weight: .medium))
            }
            .foregroundColor(Palette.accent.gold)
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .background(
                Capsule()
                    .fill(Color.black.opacity(0.4))
                    .overlay(
                        Capsule()
                            .stroke(Palette.accent.gold.opacity(0.4), lineWidth: 1)
                    )
            )
        }
        .buttonStyle(PlainButtonStyle())
    }
}

// MARK: - Portal Link Component (Cross-Module Connection)

struct PortalLink<Destination: View>: View {
    
    let icon: String
    let text: String
    let color: Color
    let destination: Destination
    
    init(
        icon: String = "arrow.right.circle.fill",
        text: String,
        color: Color = .cyan,
        @ViewBuilder destination: () -> Destination
    ) {
        self.icon = icon
        self.text = text
        self.color = color
        self.destination = destination()
    }
    
    var body: some View {
        NavigationLink(destination: destination) {
            HStack(spacing: 8) {
                Image(systemName: icon)
                    .font(.system(size: 14))
                
                Text(text)
                    .font(.system(size: 13, weight: .medium))
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .font(.system(size: 11))
                    .foregroundColor(color.opacity(0.6))
            }
            .foregroundColor(color)
            .padding(.horizontal, 14)
            .padding(.vertical, 10)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(color.opacity(0.1))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(color.opacity(0.3), lineWidth: 1)
                    )
            )
        }
        .buttonStyle(PlainButtonStyle())
    }
}

// MARK: - Content Footer with Dragon + Portal

struct ContentFooter: View {
    
    let dragonContext: DragonContext
    let portalText: String?
    let portalDestination: AnyView?
    
    init(
        dragonContext: DragonContext,
        portalText: String? = nil,
        portalDestination: AnyView? = nil
    ) {
        self.dragonContext = dragonContext
        self.portalText = portalText
        self.portalDestination = portalDestination
    }
    
    var body: some View {
        VStack(spacing: 12) {
            Divider()
                .background(Color.white.opacity(0.1))
            
            HStack {
                // Dragon context chip
                DragonContextChip(context: dragonContext)
                
                Spacer()
                
                // Portal link if provided
                if let text = portalText, let dest = portalDestination {
                    NavigationLink(destination: dest) {
                        HStack(spacing: 4) {
                            Text(text)
                                .font(.system(size: 12, weight: .medium))
                            Image(systemName: "arrow.right")
                                .font(.system(size: 10))
                        }
                        .foregroundColor(.cyan)
                    }
                }
            }
            .padding(.horizontal)
        }
        .padding(.vertical, 8)
    }
}

// MARK: - Preview

#Preview("DragonOverlay") {
    ZStack {
        Color(hex: "#0a0a1a").ignoresSafeArea()
        
        VStack(spacing: 20) {
            Text("Content Area")
                .foregroundColor(.white)
            
            DragonContextChip(context: .cosmos(sectionId: "spheres"))
            
            PortalLink(text: "See the cosmic architecture") {
                Text("Cosmos View")
            }
            
            ContentFooter(
                dragonContext: .timeline(eventId: "123"),
                portalText: "Explore in Cosmos",
                portalDestination: AnyView(Text("Destination"))
            )
        }
        .padding()
    }
    .withDragonOverlay()
}
