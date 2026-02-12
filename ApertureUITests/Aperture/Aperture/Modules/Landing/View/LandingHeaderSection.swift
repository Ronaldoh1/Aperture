// LandingHeaderSection.swift
// Contains secret GodMode activation - triple-tap the Eye

import SwiftUI

struct LandingHeaderSection: View {
    
    @ObservedObject private var godModeManager = GodModeManager.shared
    @State private var eyePulse = false
    @State private var secretTapScale: CGFloat = 1.0

    var body: some View {

        VStack(spacing: 16) {

            ZStack {
                
                // Standard glow
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [Palette.primary.cyan.opacity(0.3), Color.clear],
                            center: .center,
                            startRadius: 30,
                            endRadius: 60
                        )
                    )
                    .frame(width: 120, height: 120)
                
                // GodMode glow (visible when unlocked or tapping)
                if godModeManager.isUnlocked || godModeManager.tapCount > 0 {
                    Circle()
                        .fill(
                            RadialGradient(
                                colors: [
                                    Color(red: 1, green: 0.84, blue: 0).opacity(eyePulse ? 0.5 : 0.2),
                                    Color.clear
                                ],
                                center: .center,
                                startRadius: 20,
                                endRadius: eyePulse ? 80 : 60
                            )
                        )
                        .frame(width: 160, height: 160)
                }

                Image(systemName: "eye.circle.fill")
                    .font(.system(size: 60, weight: .light))
                    .foregroundStyle(
                        LinearGradient(
                            colors: godModeManager.isUnlocked ? 
                                [Color(red: 1, green: 0.84, blue: 0), Palette.accent.gold] :
                                [Palette.primary.cyan, Palette.accent.gold],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .scaleEffect(secretTapScale)
                    .shadow(
                        color: godModeManager.isUnlocked ? 
                            Color(red: 1, green: 0.84, blue: 0).opacity(0.5) : Color.clear,
                        radius: 15
                    )
                    .onTapGesture {
                        // Secret tap handler
                        godModeManager.handleSecretTap()
                        
                        // Visual feedback
                        withAnimation(.spring(response: 0.2, dampingFraction: 0.5)) {
                            secretTapScale = 0.9
                        }
                        withAnimation(.spring(response: 0.2, dampingFraction: 0.5).delay(0.1)) {
                            secretTapScale = 1.0
                        }
                    }

            }

            VStack(spacing: 8) {

                Text("APERTURE")
                    .font(.system(size: 28, weight: .black, design: .rounded))
                    .tracking(4)
                    .foregroundStyle(
                        LinearGradient(
                            colors: godModeManager.isUnlocked ?
                                [Color(red: 1, green: 0.84, blue: 0), Palette.primary.cyan] :
                                [Palette.text.primary, Palette.primary.cyan],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )

                Text(godModeManager.isUnlocked ? "The Monad Awakens" : "Open Your Eyes")
                    .font(.system(size: 14, weight: .medium, design: .rounded))
                    .foregroundColor(godModeManager.isUnlocked ? 
                        Color(red: 1, green: 0.84, blue: 0).opacity(0.8) : 
                        Palette.text.secondary)
                    .tracking(2)

            }
            
            // Secret tap progress indicator (subtle)
            if godModeManager.tapCount > 0 && !godModeManager.isUnlocked {
                HStack(spacing: 8) {
                    ForEach(0..<3, id: \.self) { index in
                        Circle()
                            .fill(index < godModeManager.tapCount ? 
                                Color(red: 1, green: 0.84, blue: 0) : 
                                Color.white.opacity(0.2))
                            .frame(width: 6, height: 6)
                    }
                }
                .transition(.opacity.combined(with: .scale))
            }

        }
        .padding(.top, 20)
        .onAppear {
            if godModeManager.isUnlocked {
                withAnimation(.easeInOut(duration: 2).repeatForever(autoreverses: true)) {
                    eyePulse = true
                }
            }
        }
        .onChange(of: godModeManager.isUnlocked) { _, unlocked in
            if unlocked {
                withAnimation(.easeInOut(duration: 2).repeatForever(autoreverses: true)) {
                    eyePulse = true
                }
            }
        }

    }

}
