// AlexandriaCallToActionCard.swift
// Animated CTA for the Library of Alexandria
// Pulsing glow animation - disappears after 5 taps (reset only on reinstall)
// Supports two layout styles: .centered (NavigationCard grid) and .explore (ExploreCard grid)
// ☀️ SunFlow: Reignited

import SwiftUI

// MARK: - Card Style Enum

enum AlexandriaCTAStyle {
    case centered   // NavigationCard layout (icon centered, used in LandingNavigationSection)
    case explore    // ExploreCard layout (left-aligned, used in PersonalizedLandingView)
}

// MARK: - Animated Alexandria CTA

struct AlexandriaCallToActionCard: View {
    
    @Binding var selectedTab: Int
    var style: AlexandriaCTAStyle = .centered
    
    // Persisted tap count - survives app restarts, only resets on reinstall
    @AppStorage("alexandria_cta_tap_count") private var tapCount: Int = 0
    
    @State private var glowIntensity: CGFloat = 0
    @State private var shimmerOffset: CGFloat = -200
    @State private var isPressed = false
    @State private var showRipple = false
    
    // After 5 taps the animation is dismissed forever (until reinstall)
    private var animationDismissed: Bool { tapCount >= 5 }
    
    private var cornerRadius: CGFloat { style == .explore ? 14 : 16 }
    
    var body: some View {
        if animationDismissed {
            dismissedFallback
        } else {
            animatedCard
        }
    }
    
    // MARK: - Dismissed Fallback (plain card)
    
    @ViewBuilder
    private var dismissedFallback: some View {
        switch style {
        case .centered:
            NavigationCard(
                icon: "books.vertical.fill",
                title: "Alexandria",
                subtitle: "Sacred Library",
                color: Palette.primary.violet
            ) {
                selectedTab = 4
            }
        case .explore:
            ExploreCard(
                icon: "books.vertical.fill",
                title: "Alexandria",
                subtitle: "Sacred Library",
                color: Palette.primary.violet
            ) {
                selectedTab = 4
            }
        }
    }
    
    // MARK: - Animated Card
    
    private var animatedCard: some View {
        
        Button(action: {
            HapticManager.shared.cardFlip()
            tapCount += 1
            
            withAnimation(.easeOut(duration: 0.3)) {
                isPressed = true
                showRipple = true
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                isPressed = false
                showRipple = false
            }
            
            selectedTab = 4
        }) {
            ZStack {
                
                // Pulsing glow border
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .fill(Color.clear)
                    .overlay(
                        RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                            .stroke(
                                LinearGradient(
                                    colors: [
                                        Palette.accent.gold.opacity(0.7 * glowIntensity),
                                        Palette.primary.violet.opacity(0.5 * glowIntensity),
                                        Palette.accent.gold.opacity(0.6 * glowIntensity)
                                    ],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                ),
                                lineWidth: 2
                            )
                    )
                    .shadow(
                        color: Palette.accent.gold.opacity(0.4 * glowIntensity),
                        radius: 10 + (6 * glowIntensity)
                    )
                    .shadow(
                        color: Palette.primary.violet.opacity(0.2 * glowIntensity),
                        radius: 16 + (8 * glowIntensity)
                    )
                
                // Card content - adapts to style
                cardContent
                
                // Shimmer sweep
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .fill(
                        LinearGradient(
                            colors: [
                                Color.clear,
                                Color.white.opacity(0.08),
                                Color.clear
                            ],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .offset(x: shimmerOffset)
                    .clipShape(RoundedRectangle(cornerRadius: cornerRadius, style: .continuous))
                
                // Tap ripple
                if showRipple {
                    RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                        .fill(Color.white.opacity(0.15))
                        .transition(.opacity)
                }
            }
            .scaleEffect(isPressed ? 0.95 : 1.0)
        }
        .buttonStyle(.plain)
        .onAppear {
            startAnimations()
        }
    }
    
    // MARK: - Card Content (style-dependent)
    
    @ViewBuilder
    private var cardContent: some View {
        switch style {
        case .centered:
            centeredContent
        case .explore:
            exploreContent
        }
    }
    
    // Centered layout (NavigationCard style)
    private var centeredContent: some View {
        VStack(spacing: 12) {
            
            ZStack {
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [
                                Palette.accent.gold.opacity(0.3 * glowIntensity),
                                Color.clear
                            ],
                            center: .center,
                            startRadius: 0,
                            endRadius: 30
                        )
                    )
                    .frame(width: 60, height: 60)
                
                Image(systemName: "books.vertical.fill")
                    .font(.system(size: 32, weight: .semibold))
                    .foregroundStyle(
                        LinearGradient(
                            colors: [Palette.accent.gold, Palette.primary.violet],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
            }
            
            VStack(spacing: 4) {
                Text("Alexandria")
                    .font(.system(size: 16, weight: .bold, design: .rounded))
                    .foregroundColor(Palette.text.primary)
                
                Text("Sacred Library")
                    .font(.system(size: 12, weight: .medium, design: .rounded))
                    .foregroundColor(Palette.text.secondary)
            }
            
            exploreBadge
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 24)
        .background(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .fill(Palette.primary.violet.opacity(0.1))
        )
    }
    
    // Left-aligned layout (ExploreCard style)
    private var exploreContent: some View {
        VStack(alignment: .leading, spacing: 8) {
            
            HStack(spacing: 8) {
                ZStack {
                    Circle()
                        .fill(
                            RadialGradient(
                                colors: [
                                    Palette.accent.gold.opacity(0.25 * glowIntensity),
                                    Color.clear
                                ],
                                center: .center,
                                startRadius: 0,
                                endRadius: 18
                            )
                        )
                        .frame(width: 36, height: 36)
                    
                    Image(systemName: "books.vertical.fill")
                        .font(.system(size: 24))
                        .foregroundStyle(
                            LinearGradient(
                                colors: [Palette.accent.gold, Palette.primary.violet],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                }
                
                Spacer()
                
                exploreBadge
            }
            
            Text("Alexandria")
                .font(.system(size: 15, weight: .semibold))
                .foregroundColor(.white)
            
            Text("Sacred Library")
                .font(.system(size: 11))
                .foregroundColor(.white.opacity(0.5))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 14)
                .fill(Color.white.opacity(0.05))
        )
    }
    
    // Shared pulsing badge
    private var exploreBadge: some View {
        Text("EXPLORE")
            .font(.system(size: 7, weight: .black, design: .rounded))
            .tracking(1.5)
            .foregroundColor(Palette.accent.gold)
            .padding(.horizontal, 8)
            .padding(.vertical, 3)
            .background(
                Capsule()
                    .fill(Palette.accent.gold.opacity(0.15))
                    .overlay(
                        Capsule()
                            .stroke(Palette.accent.gold.opacity(0.4 * glowIntensity), lineWidth: 1)
                    )
            )
            .opacity(glowIntensity > 0.5 ? 1 : 0.6)
    }
    
    // MARK: - Animations
    
    private func startAnimations() {
        withAnimation(
            .easeInOut(duration: 2.5)
            .repeatForever(autoreverses: true)
        ) {
            glowIntensity = 1
        }
        startShimmerLoop()
    }
    
    private func startShimmerLoop() {
        shimmerOffset = -200
        withAnimation(.easeInOut(duration: 1.5)) {
            shimmerOffset = UIScreen.main.bounds.width
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            if !animationDismissed {
                startShimmerLoop()
            }
        }
    }
}

// MARK: - Preview

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        VStack(spacing: 30) {
            
            Text("Centered Style").foregroundColor(.white)
            AlexandriaCallToActionCard(selectedTab: .constant(4), style: .centered)
                .frame(width: 170)
            
            Text("Explore Style").foregroundColor(.white)
            AlexandriaCallToActionCard(selectedTab: .constant(4), style: .explore)
                .frame(width: 170)
        }
        .padding()
    }
}
