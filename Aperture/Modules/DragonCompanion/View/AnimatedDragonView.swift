// AnimatedDragonView.swift
// The living Sun Dragon that accompanies the user's journey
// Uses the beautiful kundalini serpent dragon image with animations

import SwiftUI

// MARK: - Main Animated Dragon View

struct AnimatedDragonView: View {
    
    // Animation states
    @State private var breatheScale: CGFloat = 1.0
    @State private var glowOpacity: Double = 0.6
    @State private var floatOffset: CGFloat = 0
    @State private var eyeGlow: Double = 1.0
    @State private var particleRotation: Double = 0
    
    // Configuration
    var size: CGFloat = 300
    var showParticles: Bool = true
    var interactive: Bool = true
    
    var body: some View {
        
        ZStack {
            
            // Particle ring (sacred geometry energy)
            if showParticles {
                particleRing
            }
            
            // Outer glow aura
            outerGlow
            
            // The Dragon
            dragonImage
            
            // Energy particles floating
            if showParticles {
                floatingParticles
            }
            
        }
        .onAppear {
            startAnimations()
        }
        
    }
    
    // MARK: - Dragon Image
    
    private var dragonImage: some View {
        
        Image("SunDragon")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: size, height: size * 1.5)
            .scaleEffect(breatheScale)
            .offset(y: floatOffset)
            .shadow(color: Palette.accent.gold.opacity(0.5), radius: 20)
            .onTapGesture {
                if interactive {
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.5)) {
                        breatheScale = 1.1
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        withAnimation(.spring(response: 0.5)) {
                            breatheScale = 1.0
                        }
                    }
                    // Haptic feedback
                    HapticManager.shared.dragonTapped()
                }
            }
        
    }
    
    // MARK: - Outer Glow
    
    private var outerGlow: some View {
        
        Circle()
            .fill(
                RadialGradient(
                    colors: [
                        Palette.accent.gold.opacity(glowOpacity * 0.4),
                        Palette.primary.orange.opacity(glowOpacity * 0.2),
                        Color.clear
                    ],
                    center: .center,
                    startRadius: size * 0.2,
                    endRadius: size * 0.8
                )
            )
            .frame(width: size * 1.5, height: size * 1.5)
            .blur(radius: 30)
        
    }
    
    // MARK: - Particle Ring
    
    private var particleRing: some View {
        
        ZStack {
            
            // Outer ring
            Circle()
                .stroke(
                    AngularGradient(
                        colors: [
                            Palette.accent.gold.opacity(0.3),
                            Palette.primary.cyan.opacity(0.2),
                            Palette.primary.violet.opacity(0.3),
                            Palette.accent.gold.opacity(0.3)
                        ],
                        center: .center
                    ),
                    lineWidth: 2
                )
                .frame(width: size * 1.2, height: size * 1.2)
                .rotationEffect(.degrees(particleRotation))
            
            // Inner ring
            Circle()
                .stroke(
                    AngularGradient(
                        colors: [
                            Palette.primary.orange.opacity(0.4),
                            Palette.accent.gold.opacity(0.2),
                            Palette.primary.orange.opacity(0.4)
                        ],
                        center: .center
                    ),
                    lineWidth: 1
                )
                .frame(width: size * 0.9, height: size * 0.9)
                .rotationEffect(.degrees(-particleRotation * 0.7))
            
        }
        
    }
    
    // MARK: - Floating Particles
    
    private var floatingParticles: some View {
        
        Canvas { context, canvasSize in
            let center = CGPoint(x: canvasSize.width / 2, y: canvasSize.height / 2)
            
            for i in 0..<12 {
                let angle = Double(i) * .pi / 6 + particleRotation * .pi / 180
                let x = center.x + cos(angle) * (size * 0.5)
                let y = center.y + sin(angle) * (size * 0.4) + floatOffset * 0.5
                let particleSize = CGFloat(3 + i % 4)
                let opacity = 0.6 + sin(particleRotation * .pi / 180 + Double(i)) * 0.4
                
                let rect = CGRect(
                    x: x - particleSize / 2,
                    y: y - particleSize / 2,
                    width: particleSize,
                    height: particleSize
                )
                
                context.opacity = opacity
                context.fill(Circle().path(in: rect), with: .color(particleColor(for: i)))
            }
        }
        .frame(width: size * 1.5, height: size * 1.5)
        
    }
    
    private func particleColor(for index: Int) -> Color {
        let colors: [Color] = [
            .red, .orange, Palette.accent.gold, .green, 
            Palette.primary.cyan, .blue, Palette.primary.violet
        ]
        return colors[index % colors.count]
    }
    
    // MARK: - Animations
    
    private func startAnimations() {
        
        // Breathing animation
        withAnimation(.easeInOut(duration: 3).repeatForever(autoreverses: true)) {
            breatheScale = 1.03
        }
        
        // Glow pulse
        withAnimation(.easeInOut(duration: 2).repeatForever(autoreverses: true)) {
            glowOpacity = 0.8
        }
        
        // Floating motion
        withAnimation(.easeInOut(duration: 4).repeatForever(autoreverses: true)) {
            floatOffset = -10
        }
        
        // Particle rotation
        withAnimation(.linear(duration: 30).repeatForever(autoreverses: false)) {
            particleRotation = 360
        }
        
    }
    
}

// MARK: - Compact Dragon (for tab bar or small spaces)

struct CompactDragonView: View {
    
    @State private var pulse: CGFloat = 1.0
    var size: CGFloat = 40
    
    var body: some View {
        
        ZStack {
            
            // Glow
            Circle()
                .fill(Palette.accent.gold.opacity(0.3))
                .frame(width: size * 1.2, height: size * 1.2)
                .blur(radius: 8)
                .scaleEffect(pulse)
            
            // Dragon
            Image("SunDragon")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: size, height: size)
            
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 2).repeatForever(autoreverses: true)) {
                pulse = 1.15
            }
        }
        
    }
    
}

// MARK: - Dragon Silhouette (for loading states)

struct DragonSilhouetteView: View {
    
    @State private var shimmer: CGFloat = -1
    var size: CGFloat = 200
    
    var body: some View {
        
        Image("SunDragon")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: size, height: size * 1.5)
            .colorMultiply(Color.black)
            .opacity(0.3)
            .overlay(
                LinearGradient(
                    colors: [
                        Color.clear,
                        Palette.accent.gold.opacity(0.5),
                        Color.clear
                    ],
                    startPoint: .leading,
                    endPoint: .trailing
                )
                .frame(width: size * 0.5)
                .offset(x: shimmer * size)
                .mask(
                    Image("SunDragon")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                )
            )
            .onAppear {
                withAnimation(.linear(duration: 2).repeatForever(autoreverses: false)) {
                    shimmer = 1
                }
            }
        
    }
    
}

// MARK: - Preview

#Preview("Full Dragon") {
    ZStack {
        Color.black.ignoresSafeArea()
        AnimatedDragonView(size: 250)
    }
}

#Preview("Compact Dragon") {
    ZStack {
        Color.black.ignoresSafeArea()
        CompactDragonView(size: 60)
    }
}
