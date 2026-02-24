// TimelineModeSelector.swift
// Aperture — Timeline Module
//
// Full-screen mode selector shown on first Timeline launch.
// Standard = existing native SwiftUI experience.
// Extended = HTML "Time Travel: Hidden History" ChronoKeeper experience.

import SwiftUI

// MARK: - Mode Model

enum TimelineViewMode: String {
    case standard = "standard"
    case extended = "extended"
    
    var title: String {
        switch self {
        case .standard: return "Standard"
        case .extended: return "Time Travel"
        }
    }
    
    var subtitle: String {
        switch self {
        case .standard: return "Native · Fast · Clean"
        case .extended: return "Immersive · Animated · Deep"
        }
    }
    
    var description: String {
        switch self {
        case .standard: return "Filter by era and institution. Instant results. The Chronokeeper guides you through the native experience."
        case .extended: return "5,000 years of buried truth. A clock-driven descent with full animations, expanding cards, and the Chronokeeper at every turn."
        }
    }
    
    var icon: String {
        switch self {
        case .standard: return "clock.arrow.circlepath"
        case .extended: return "hourglass.tophalf.filled"
        }
    }
    
    var accentColor: Color {
        switch self {
        case .standard: return Palette.primary.cyan
        case .extended: return Palette.accent.gold
        }
    }
    
    var isEpic: Bool { self == .extended }
}

// MARK: - Mode Selector View

struct TimelineModeSelectionView: View {
    
    let onSelect: (TimelineViewMode) -> Void
    var canDismiss: Bool = false
    var onDismiss: (() -> Void)? = nil
    
    @State private var headerVisible = false
    @State private var card0Visible = false
    @State private var card1Visible = false
    
    var body: some View {
        ZStack {
            // Background
            Color(hex: "#03030f").ignoresSafeArea()
            SelectorStarsView()
            
            // Dismiss tap area (only when not first launch)
            if canDismiss {
                Color.clear
                    .contentShape(Rectangle())
                    .onTapGesture { onDismiss?() }
                    .ignoresSafeArea()
            }
            
            VStack(spacing: 0) {
                
                Spacer()
                
                // Header
                VStack(spacing: 10) {
                    Text("⧗ APERTURE · TIMELINE")
                        .font(.custom("Georgia", size: 11))
                        .tracking(6)
                        .foregroundColor(Palette.accent.gold)
                    
                    Text("Time Travel:\nHidden History")
                        .font(.custom("Georgia-Bold", size: 30))
                        .multilineTextAlignment(.center)
                        .foregroundStyle(
                            LinearGradient(
                                colors: [Palette.accent.gold, .white, Palette.accent.gold.opacity(0.7)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                    
                    Text("Choose your experience")
                        .font(.custom("Georgia-Italic", size: 15))
                        .foregroundColor(.white.opacity(0.5))
                }
                .opacity(headerVisible ? 1 : 0)
                .offset(y: headerVisible ? 0 : 20)
                
                Spacer().frame(height: 40)
                
                // Mode cards
                VStack(spacing: 16) {
                    TimelineModeCard(mode: .standard, onSelect: onSelect)
                        .opacity(card0Visible ? 1 : 0)
                        .offset(y: card0Visible ? 0 : 24)
                    
                    TimelineModeCard(mode: .extended, onSelect: onSelect)
                        .opacity(card1Visible ? 1 : 0)
                        .offset(y: card1Visible ? 0 : 24)
                }
                .padding(.horizontal, 24)
                .contentShape(Rectangle()) // block dismiss tap on cards
                .onTapGesture {}           // swallow taps so canDismiss doesn't fire
                
                Spacer().frame(height: 28)
                
                if canDismiss {
                    Text("You can switch at any time")
                        .font(.custom("Georgia-Italic", size: 13))
                        .foregroundColor(.white.opacity(0.3))
                        .opacity(card1Visible ? 1 : 0)
                }
                
                Spacer()
            }
        }
        .onAppear {
            withAnimation(.easeOut(duration: 0.55).delay(0.1)) { headerVisible = true }
            withAnimation(.easeOut(duration: 0.5).delay(0.3)) { card0Visible = true }
            withAnimation(.easeOut(duration: 0.5).delay(0.45)) { card1Visible = true }
        }
    }
}

// MARK: - Mode Card

private struct TimelineModeCard: View {
    
    let mode: TimelineViewMode
    let onSelect: (TimelineViewMode) -> Void
    
    @State private var isPressed = false
    
    var body: some View {
        Button {
            onSelect(mode)
        } label: {
            HStack(spacing: 16) {
                // Icon circle
                ZStack {
                    Circle()
                        .fill(mode.accentColor.opacity(0.12))
                        .frame(width: 56, height: 56)
                    Image(systemName: mode.icon)
                        .font(.system(size: 22, weight: .medium))
                        .foregroundColor(mode.accentColor)
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack(spacing: 8) {
                        Text(mode.title)
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.white)
                        
                        if mode.isEpic {
                            Text("EPIC")
                                .font(.system(size: 9, weight: .heavy))
                                .tracking(1.5)
                                .foregroundColor(.black)
                                .padding(.horizontal, 7)
                                .padding(.vertical, 3)
                                .background(Palette.accent.gold)
                                .clipShape(Capsule())
                        }
                    }
                    
                    Text(mode.subtitle)
                        .font(.system(size: 11, weight: .medium))
                        .tracking(1.5)
                        .foregroundColor(mode.accentColor)
                    
                    Text(mode.description)
                        .font(.system(size: 13))
                        .foregroundColor(.white.opacity(0.5))
                        .lineSpacing(3)
                        .padding(.top, 2)
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(mode.accentColor.opacity(0.7))
            }
            .padding(20)
            .background(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .fill(.white.opacity(0.03))
                    .overlay(
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .stroke(mode.accentColor.opacity(mode.isEpic ? 0.5 : 0.2), lineWidth: mode.isEpic ? 1.5 : 1)
                    )
            )
            .scaleEffect(isPressed ? 0.97 : 1)
            .shadow(color: mode.isEpic ? mode.accentColor.opacity(0.15) : .clear, radius: 20)
        }
        .buttonStyle(PlainButtonStyle())
        .simultaneousGesture(
            DragGesture(minimumDistance: 0)
                .onChanged { _ in
                    withAnimation(.easeOut(duration: 0.1)) { isPressed = true }
                }
                .onEnded { _ in
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) { isPressed = false }
                }
        )
    }
}

// MARK: - Stars Background

struct SelectorStarsView: View {
    
    private struct Star: Identifiable {
        let id = UUID()
        let x, y, size, opacity: CGFloat
        let duration: Double
        let delay: Double
    }
    
    private let stars: [Star] = (0..<120).map { _ in
        Star(
            x: CGFloat.random(in: 0...1),
            y: CGFloat.random(in: 0...1),
            size: CGFloat.random(in: 0.5...2.2),
            opacity: CGFloat.random(in: 0.2...0.8),
            duration: Double.random(in: 1.5...4.0),
            delay: Double.random(in: 0...3.0)
        )
    }
    
    var body: some View {
        GeometryReader { geo in
            ForEach(stars) { star in
                Circle()
                    .fill(Color.white.opacity(star.opacity))
                    .frame(width: star.size, height: star.size)
                    .position(
                        x: star.x * geo.size.width,
                        y: star.y * geo.size.height
                    )
                    .modifier(TwinkleModifier(duration: star.duration, delay: star.delay))
            }
        }
        .ignoresSafeArea()
    }
}

private struct TwinkleModifier: ViewModifier {
    let duration: Double
    let delay: Double
    @State private var opacity: CGFloat = 0.3
    
    func body(content: Content) -> some View {
        content
            .opacity(opacity)
            .onAppear {
                withAnimation(
                    .easeInOut(duration: duration)
                    .repeatForever(autoreverses: true)
                    .delay(delay)
                ) {
                    opacity = 0.95
                }
            }
    }
}

// MARK: - Notification for "Switch Mode" from 3-dot menu

extension Notification.Name {
    static let timelineRequestModeSwitch = Notification.Name("aperture.timeline.requestModeSwitch")
}
