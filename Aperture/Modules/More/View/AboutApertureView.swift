// AboutApertureView.swift
// About Aperture - Mission, team, and trust statement

import SwiftUI

struct AboutApertureView: View {
    
    @State private var showPrivacyPolicy = false
    @State private var showTerms = false
    
    var body: some View {
        ZStack {
            CosmicBackground(starCount: 60)
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 30) {
                    
                    // Logo and Tagline
                    logoSection
                    
                    // Mission
                    missionSection
                    
                    // Trust Statement
                    trustSection
                    
                    // What We Believe
                    beliefsSection
                    
                    // Version Info
                    versionSection
                    
                    // Legal Links
                    legalSection
                    
                    Spacer(minLength: 100)
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)
            }
        }
        .navigationTitle("About")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    // MARK: - Logo Section
    
    private var logoSection: some View {
        VStack(spacing: 16) {
            // Aperture Eye Logo
            ZStack {
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [Palette.accent.gold.opacity(0.3), Color.clear],
                            center: .center,
                            startRadius: 40,
                            endRadius: 80
                        )
                    )
                    .frame(width: 120, height: 120)
                
                Image(systemName: "eye.fill")
                    .font(.system(size: 50))
                    .foregroundStyle(
                        LinearGradient(
                            colors: [Palette.accent.gold, Palette.primary.cyan],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
            }
            
            Text("APERTURE")
                .font(.system(size: 28, weight: .black, design: .rounded))
                .foregroundStyle(
                    LinearGradient(
                        colors: [.white, Palette.accent.gold],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .tracking(4)
            
            Text("Open Your Eyes")
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.gray)
        }
        .padding(.vertical, 20)
    }
    
    // MARK: - Mission Section
    
    private var missionSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            sectionHeader("Our Mission")
            
            Text("Aperture exists to synthesize the world's wisdom traditions, reveal hidden historical patterns, and provide practical tools for conscious evolution.")
                .font(.system(size: 15))
                .foregroundColor(.white.opacity(0.9))
                .lineSpacing(4)
            
            Text("We believe awakening is humanity's birthright—not a privilege reserved for monks, mystics, or the initiated few. By showing the common thread across all traditions, we help you find your path without dogma, gurus, or gatekeepers.")
                .font(.system(size: 15))
                .foregroundColor(.white.opacity(0.9))
                .lineSpacing(4)
        }
        .padding()
        .background(sectionBackground)
    }
    
    // MARK: - Trust Section
    
    private var trustSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "checkmark.shield.fill")
                    .foregroundColor(.green)
                sectionHeader("Our Commitment to You")
            }
            
            VStack(alignment: .leading, spacing: 10) {
                trustPoint("Educational, not ideological", "We present information for your consideration, not beliefs for your adoption.")
                trustPoint("Question everything—including us", "A healthy skepticism is part of awakening. We encourage you to verify, challenge, and form your own conclusions.")
                trustPoint("No gurus, no gatekeepers", "Your spiritual journey belongs to you. We're tools, not teachers.")
                trustPoint("Privacy protected", "Your inner journey is sacred. We don't sell your data or exploit your trust.")
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.green.opacity(0.1))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.green.opacity(0.3), lineWidth: 1)
                )
        )
    }
    
    private func trustPoint(_ title: String, _ description: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("• " + title)
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(.white)
            Text(description)
                .font(.system(size: 13))
                .foregroundColor(.gray)
                .padding(.leading, 12)
        }
    }
    
    // MARK: - Beliefs Section
    
    private var beliefsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            sectionHeader("What We Believe")
            
            VStack(alignment: .leading, spacing: 8) {
                beliefItem("All awakening traditions describe the same underlying reality")
                beliefItem("Truth has been fragmented and obscured throughout history")
                beliefItem("Pattern recognition reveals what narratives hide")
                beliefItem("Practical methods matter more than intellectual understanding")
                beliefItem("Each person's path is unique and valid")
                beliefItem("Awakening is natural, not supernatural")
            }
        }
        .padding()
        .background(sectionBackground)
    }
    
    private func beliefItem(_ text: String) -> some View {
        HStack(alignment: .top, spacing: 10) {
            Image(systemName: "sparkle")
                .font(.system(size: 10))
                .foregroundColor(Palette.accent.gold)
                .padding(.top, 4)
            
            Text(text)
                .font(.system(size: 14))
                .foregroundColor(.white.opacity(0.9))
        }
    }
    
    // MARK: - Version Section
    
    private var versionSection: some View {
        VStack(spacing: 8) {
            Text("Version 1.0.0")
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(.gray)
            
            Text("Built with 🐉 in NYC")
                .font(.system(size: 12))
                .foregroundColor(.gray.opacity(0.7))
            
            Text("© 2026 SunFlow: Reignited")
                .font(.system(size: 11))
                .foregroundColor(.gray.opacity(0.5))
        }
        .padding(.vertical, 20)
    }
    
    // MARK: - Legal Section
    
    private var legalSection: some View {
        VStack(spacing: 12) {
            Button(action: { showPrivacyPolicy = true }) {
                Text("Privacy Policy")
                    .font(.system(size: 14))
                    .foregroundColor(Palette.primary.cyan)
            }
            
            Button(action: { showTerms = true }) {
                Text("Terms of Service")
                    .font(.system(size: 14))
                    .foregroundColor(Palette.primary.cyan)
            }
        }
    }
    
    // MARK: - Helpers
    
    private func sectionHeader(_ title: String) -> some View {
        Text(title.uppercased())
            .font(.system(size: 12, weight: .bold))
            .foregroundColor(Palette.accent.gold)
            .tracking(2)
    }
    
    private var sectionBackground: some View {
        RoundedRectangle(cornerRadius: 16)
            .fill(Color.white.opacity(0.05))
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.white.opacity(0.1), lineWidth: 1)
            )
    }
}

// MARK: - Preview

#Preview {
    NavigationStack {
        AboutApertureView()
    }
}
