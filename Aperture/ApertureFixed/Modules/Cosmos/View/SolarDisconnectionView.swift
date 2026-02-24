// SolarDisconnectionView.swift
// We are Solar Beings 🌞 — But they cut us off from our source

import SwiftUI

// MARK: - Solar Disconnection View

struct SolarDisconnectionView: View {
    
    let onContinue: () -> Void
    
    @State private var showDisconnections: Bool = false
    @State private var revealedDisconnections: Set<UUID> = []
    @State private var showTruths: Bool = false
    @State private var revealedTruths: Set<UUID> = []
    @State private var showReclaim: Bool = false
    @State private var showContinue: Bool = false
    @State private var brokenSunPulse: Bool = false
    @State private var healingSunPulse: Bool = false
    
    var body: some View {
        VStack(spacing: 28) {
            
            // Header
            headerSection
            
            // How they disconnected us
            if showDisconnections {
                disconnectionSection
                    .transition(.opacity.combined(with: .move(edge: .bottom)))
            }
            
            // The truth about solar beings
            if showTruths {
                solarBeingSection
                    .transition(.opacity.combined(with: .move(edge: .bottom)))
            }
            
            // Reclaim your connection
            if showReclaim {
                reclaimSection
                    .transition(.opacity.combined(with: .scale(scale: 0.95)))
            }
            
            // Continue button
            if showContinue {
                continueButton
                    .transition(.opacity.combined(with: .move(edge: .bottom)))
            }
            
            Spacer(minLength: 40)
        }
        .onAppear {
            startRevealSequence()
        }
    }
    
    // MARK: - Header Section
    
    private var headerSection: some View {
        VStack(spacing: 20) {
            // Broken sun icon
            ZStack {
                // Faded/blocked sun
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [
                                Color.gray.opacity(0.3),
                                Color.gray.opacity(0.1),
                                .clear
                            ],
                            center: .center,
                            startRadius: 20,
                            endRadius: brokenSunPulse ? 70 : 60
                        )
                    )
                    .frame(width: 140, height: 140)
                
                // Blocked rays
                ForEach(0..<12, id: \.self) { i in
                    Rectangle()
                        .fill(
                            LinearGradient(
                                colors: [Color.gray.opacity(0.4), Color.gray.opacity(0)],
                                startPoint: .bottom,
                                endPoint: .top
                            )
                        )
                        .frame(width: 2, height: 25)
                        .offset(y: -45)
                        .rotationEffect(.degrees(Double(i) * 30))
                }
                
                // Sun with X overlay
                ZStack {
                    Circle()
                        .fill(
                            RadialGradient(
                                colors: [Color.gray.opacity(0.6), Color.gray.opacity(0.3)],
                                center: .center,
                                startRadius: 0,
                                endRadius: 30
                            )
                        )
                        .frame(width: 60, height: 60)
                    
                    // Sunglasses blocking
                    Image(systemName: "eyeglasses")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(.black.opacity(0.7))
                }
            }
            .onAppear {
                withAnimation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true)) {
                    brokenSunPulse = true
                }
            }
            
            VStack(spacing: 8) {
                Text("WE ARE SOLAR BEINGS")
                    .font(.system(size: 18, weight: .black, design: .rounded))
                    .tracking(2)
                    .foregroundColor(.white)
                
                Text("But They Cut Us Off From Our Source")
                    .font(.system(size: 15, weight: .bold, design: .rounded))
                    .foregroundColor(.red.opacity(0.9))
            }
            
            // Opening statement
            VStack(spacing: 8) {
                Text("They worship the sun in SECRET")
                    .font(.system(size: 14, weight: .bold, design: .rounded))
                    .foregroundColor(Palette.accent.gold)
                
                Text("(Vatican symbols, SUNday, December 25)")
                    .font(.system(size: 12, weight: .medium, design: .rounded))
                    .foregroundColor(.white.opacity(0.6))
                
                Text("But told YOU that the sun god is EVIL")
                    .font(.system(size: 14, weight: .bold, design: .rounded))
                    .foregroundColor(.red)
                
                Text("And then systematically disconnected you from it.")
                    .font(.system(size: 13, weight: .medium, design: .rounded))
                    .foregroundColor(.white.opacity(0.8))
                    .padding(.top, 4)
            }
            .padding(16)
            .background(
                RoundedRectangle(cornerRadius: 14, style: .continuous)
                    .fill(Color.white.opacity(0.05))
                    .overlay(
                        RoundedRectangle(cornerRadius: 14, style: .continuous)
                            .stroke(Color.red.opacity(0.3), lineWidth: 1)
                    )
            )
        }
    }
    
    // MARK: - Disconnection Section
    
    private var disconnectionSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Header
            HStack {
                Image(systemName: "link.badge.plus")
                    .foregroundColor(.red)
                    .rotationEffect(.degrees(45)) // Broken link effect
                
                Text("HOW THEY DISCONNECTED US")
                    .font(.system(size: 13, weight: .black, design: .rounded))
                    .tracking(2)
                    .foregroundColor(.red)
            }
            
            // Disconnection methods
            VStack(spacing: 10) {
                ForEach(SolarDisconnection.all) { item in
                    if revealedDisconnections.contains(item.id) {
                        disconnectionRow(item)
                            .transition(.opacity.combined(with: .move(edge: .leading)))
                    }
                }
            }
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .fill(Color.red.opacity(0.06))
                .overlay(
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .stroke(Color.red.opacity(0.2), lineWidth: 1)
                )
        )
    }
    
    private func disconnectionRow(_ item: SolarDisconnection) -> some View {
        HStack(alignment: .top, spacing: 12) {
            // Icon
            Image(systemName: item.icon)
                .font(.system(size: 18))
                .foregroundColor(Color(hex: item.color))
                .frame(width: 32, height: 32)
                .background(
                    Circle()
                        .fill(Color(hex: item.color).opacity(0.15))
                )
            
            // Content
            VStack(alignment: .leading, spacing: 4) {
                Text(item.method)
                    .font(.system(size: 14, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                
                Text(item.description)
                    .font(.system(size: 12, weight: .medium, design: .rounded))
                    .foregroundColor(.white.opacity(0.7))
                    .lineLimit(3)
                    .fixedSize(horizontal: false, vertical: true)
            }
            
            Spacer()
        }
        .padding(12)
        .background(
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(Color.white.opacity(0.03))
        )
    }
    
    // MARK: - Solar Being Section
    
    private var solarBeingSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Header with healing sun
            HStack {
                ZStack {
                    Circle()
                        .fill(Palette.accent.gold.opacity(healingSunPulse ? 0.4 : 0.2))
                        .frame(width: 32, height: 32)
                    
                    Image(systemName: "sun.max.fill")
                        .font(.system(size: 16))
                        .foregroundColor(Palette.accent.gold)
                }
                .onAppear {
                    withAnimation(.easeInOut(duration: 1.0).repeatForever(autoreverses: true)) {
                        healingSunPulse = true
                    }
                }
                
                Text("THE TRUTH ABOUT YOU")
                    .font(.system(size: 13, weight: .black, design: .rounded))
                    .tracking(2)
                    .foregroundColor(Palette.accent.gold)
            }
            
            // Truths
            VStack(spacing: 10) {
                ForEach(SolarBeingTruth.all) { truth in
                    if revealedTruths.contains(truth.id) {
                        truthRow(truth)
                            .transition(.opacity.combined(with: .move(edge: .trailing)))
                    }
                }
            }
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .fill(Palette.accent.gold.opacity(0.06))
                .overlay(
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .stroke(Palette.accent.gold.opacity(0.25), lineWidth: 1)
                )
        )
    }
    
    private func truthRow(_ truth: SolarBeingTruth) -> some View {
        HStack(alignment: .top, spacing: 12) {
            // Icon
            Image(systemName: truth.icon)
                .font(.system(size: 18))
                .foregroundColor(Palette.accent.gold)
                .frame(width: 32, height: 32)
                .background(
                    Circle()
                        .fill(Palette.accent.gold.opacity(0.15))
                )
            
            // Content
            VStack(alignment: .leading, spacing: 4) {
                Text(truth.truth)
                    .font(.system(size: 14, weight: .bold, design: .rounded))
                    .foregroundColor(Palette.accent.gold)
                
                Text(truth.explanation)
                    .font(.system(size: 12, weight: .medium, design: .rounded))
                    .foregroundColor(.white.opacity(0.85))
                    .lineLimit(4)
                    .fixedSize(horizontal: false, vertical: true)
            }
            
            Spacer()
        }
        .padding(12)
        .background(
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(Color.white.opacity(0.03))
        )
    }
    
    // MARK: - Reclaim Section
    
    private var reclaimSection: some View {
        VStack(spacing: 16) {
            // Glowing sun restored
            ZStack {
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [
                                Palette.accent.gold.opacity(0.5),
                                Palette.primary.orange.opacity(0.3),
                                .clear
                            ],
                            center: .center,
                            startRadius: 20,
                            endRadius: 70
                        )
                    )
                    .frame(width: 140, height: 140)
                
                // Rays
                ForEach(0..<12, id: \.self) { i in
                    Rectangle()
                        .fill(
                            LinearGradient(
                                colors: [Palette.accent.gold, Palette.accent.gold.opacity(0)],
                                startPoint: .bottom,
                                endPoint: .top
                            )
                        )
                        .frame(width: 3, height: 35)
                        .offset(y: -50)
                        .rotationEffect(.degrees(Double(i) * 30))
                }
                
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [.white, Palette.accent.gold, Palette.primary.orange],
                            center: .center,
                            startRadius: 0,
                            endRadius: 35
                        )
                    )
                    .frame(width: 70, height: 70)
                    .shadow(color: Palette.accent.gold, radius: 15)
            }
            
            Text("RECLAIM YOUR CONNECTION")
                .font(.system(size: 14, weight: .black, design: .rounded))
                .tracking(3)
                .foregroundColor(Palette.accent.gold)
            
            VStack(spacing: 12) {
                reclaimPoint(icon: "sunrise.fill", text: "Watch the sunrise. Let light enter your eyes.")
                reclaimPoint(icon: "figure.walk", text: "Walk outside during daylight hours.")
                reclaimPoint(icon: "eyeglasses", strikethrough: true, text: "Remove sunglasses when safe to do so.")
                reclaimPoint(icon: "iphone.slash", text: "Eliminate blue light 2 hours before bed.")
                reclaimPoint(icon: "leaf.fill", text: "Ground barefoot while receiving sun.")
                reclaimPoint(icon: "moon.stars.fill", text: "Sleep in complete darkness.")
            }
            
            // Final affirmation
            VStack(spacing: 8) {
                Text("☀️")
                    .font(.system(size: 36))
                
                Text("The Sun has ALWAYS been there for you.\nIt's time to return to your source.")
                    .font(.system(size: 15, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .lineSpacing(4)
            }
            .padding(.top, 8)
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(
                    LinearGradient(
                        colors: [
                            Palette.accent.gold.opacity(0.12),
                            Palette.primary.orange.opacity(0.06)
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .stroke(
                            LinearGradient(
                                colors: [Palette.accent.gold.opacity(0.5), Palette.primary.orange.opacity(0.3)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ),
                            lineWidth: 1
                        )
                )
        )
    }
    
    private func reclaimPoint(icon: String, strikethrough: Bool = false, text: String) -> some View {
        HStack(spacing: 12) {
            ZStack {
                Image(systemName: icon)
                    .font(.system(size: 14))
                    .foregroundColor(Palette.accent.gold)
                
                if strikethrough {
                    Rectangle()
                        .fill(Color.red)
                        .frame(width: 20, height: 2)
                        .rotationEffect(.degrees(-45))
                }
            }
            .frame(width: 24)
            
            Text(text)
                .font(.system(size: 13, weight: .medium, design: .rounded))
                .foregroundColor(.white.opacity(0.9))
            
            Spacer()
        }
    }
    
    // MARK: - Continue Button
    
    private var continueButton: some View {
        Button(action: {
            HapticManager.shared.medium()
            onContinue()
        }) {
            HStack(spacing: 12) {
                Text("See The Final Truth")
                    .font(.system(size: 16, weight: .bold, design: .rounded))
                
                Image(systemName: "arrow.right")
                    .font(.system(size: 14, weight: .bold))
            }
            .foregroundColor(.black)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .background(
                RoundedRectangle(cornerRadius: 14, style: .continuous)
                    .fill(Palette.accent.gold)
                    .shadow(color: Palette.accent.gold.opacity(0.4), radius: 10, y: 4)
            )
        }
    }
    
    // MARK: - Reveal Sequence
    
    private func startRevealSequence() {
        // Show disconnection section
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation(.spring(response: 0.5, dampingFraction: 0.8)) {
                showDisconnections = true
            }
            
            // Reveal each disconnection
            for (index, item) in SolarDisconnection.all.enumerated() {
                DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.25) {
                    withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                        _ = revealedDisconnections.insert(item.id)
                    }
                }
            }
        }
        
        // Show truths section
        let disconnectionDelay = 0.5 + Double(SolarDisconnection.all.count) * 0.25 + 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + disconnectionDelay) {
            withAnimation(.spring(response: 0.5, dampingFraction: 0.8)) {
                showTruths = true
            }
            
            // Reveal each truth
            for (index, truth) in SolarBeingTruth.all.enumerated() {
                DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.25) {
                    withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                        _ = revealedTruths.insert(truth.id)
                    }
                }
            }
        }
        
        // Show reclaim section
        let truthsDelay = disconnectionDelay + Double(SolarBeingTruth.all.count) * 0.25 + 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + truthsDelay) {
            withAnimation(.spring(response: 0.5, dampingFraction: 0.8)) {
                showReclaim = true
            }
        }
        
        // Show continue button
        DispatchQueue.main.asyncAfter(deadline: .now() + truthsDelay + 1.0) {
            withAnimation(.spring(response: 0.5, dampingFraction: 0.8)) {
                showContinue = true
            }
        }
    }
}

// MARK: - Preview

#Preview {
    ZStack {
        LinearGradient(
            colors: [Color(hex: "#0a0a1a"), Color(hex: "#1a0a2a")],
            startPoint: .top,
            endPoint: .bottom
        )
        .ignoresSafeArea()
        
        ScrollView {
            SolarDisconnectionView(onContinue: {})
                .padding()
        }
    }
}
