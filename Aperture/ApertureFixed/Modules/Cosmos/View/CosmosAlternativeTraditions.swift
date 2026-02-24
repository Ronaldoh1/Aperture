// CosmosAlternativeTraditions.swift
// Canonical vs Alternative Traditions feature for Cosmos

import SwiftUI

// MARK: - Alternative Traditions Navigation Card

struct AlternativeTraditionsCard: View {
    
    let onTap: () -> Void
    
    @State private var isAnimating = false
    
    var body: some View {
        VStack(spacing: 0) {
            separatorLine
            mainCard
        }
        .onTapGesture { HapticManager.shared.cardFlip(); onTap() }
        .onAppear {
            withAnimation(
                .easeInOut(duration: 2.0)
                .repeatForever(autoreverses: true)
            ) {
                isAnimating = true
            }
        }
    }
    
    private var separatorLine: some View {
        Rectangle()
            .fill(
                LinearGradient(
                    colors: [Color.clear, Palette.accent.gold.opacity(0.5), Color.clear],
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            .frame(height: 1)
            .padding(.vertical, 20)
    }
    
    private var mainCard: some View {
        VStack(spacing: 16) {
            sunIconWithRays
            titleSection
            ctaButton
        }
        .padding(.vertical, 24)
        .padding(.horizontal, 20)
        .frame(maxWidth: .infinity)
        .background(cardBackground)
        .shadow(color: Palette.accent.gold.opacity(0.3), radius: 20)
    }
    
    private var sunIconWithRays: some View {
        ZStack {
            // Outer glow pulse
            Circle()
                .fill(
                    RadialGradient(
                        colors: [
                            Palette.accent.gold.opacity(0.4),
                            Palette.primary.orange.opacity(0.2),
                            Color.clear
                        ],
                        center: .center,
                        startRadius: 0,
                        endRadius: isAnimating ? 80 : 60
                    )
                )
                .frame(width: 160, height: 160)
                .scaleEffect(isAnimating ? 1.2 : 1.0)
                .opacity(isAnimating ? 0.6 : 0.8)
            
            // Rotating rays
            ForEach(0..<12, id: \.self) { i in
                Rectangle()
                    .fill(
                        LinearGradient(
                            colors: [Palette.accent.gold, Palette.accent.gold.opacity(0)],
                            startPoint: .bottom,
                            endPoint: .top
                        )
                    )
                    .frame(width: 3, height: 40)
                    .offset(y: -50)
                    .rotationEffect(.degrees(Double(i) * 30 + (isAnimating ? 15 : 0)))
            }
            
            // Middle glow
            Circle()
                .fill(
                    RadialGradient(
                        colors: [
                            Palette.accent.gold.opacity(0.8),
                            Palette.primary.orange.opacity(0.4),
                            Color.clear
                        ],
                        center: .center,
                        startRadius: 0,
                        endRadius: 50
                    )
                )
                .frame(width: 100, height: 100)
            
            // Sun circle
            Circle()
                .fill(
                    RadialGradient(
                        colors: [
                            Color.white,
                            Palette.accent.gold,
                            Palette.primary.orange
                        ],
                        center: .center,
                        startRadius: 0,
                        endRadius: 35
                    )
                )
                .frame(width: 70, height: 70)
                .shadow(color: Palette.accent.gold, radius: 20)
                .shadow(color: Palette.primary.orange, radius: 40)
            
            // Book icon in center
            Image(systemName: "book.closed.fill")
                .font(.system(size: 28, weight: .bold))
                .foregroundColor(Color(red: 0.3, green: 0.15, blue: 0.0))
        }
        .frame(height: 160)
    }
    
    private var titleSection: some View {
        VStack(spacing: 8) {
            Text("CANONICAL VS. ALTERNATIVE TRADITIONS")
                .font(.system(size: 14, weight: .black, design: .rounded))
                .tracking(3)
                .foregroundStyle(
                    LinearGradient(
                        colors: [Palette.accent.gold, Palette.primary.orange, Palette.accent.gold],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
            
            Text("What They Said vs The Gnostic Truth")
                .font(.system(size: 16, weight: .bold, design: .rounded))
                .foregroundColor(Palette.text.primary)
            
            Text("15 doctrines exposed. Tap to see what\nthey don't want you to know.")
                .font(.system(size: 13, weight: .medium, design: .rounded))
                .foregroundColor(Palette.text.secondary)
                .multilineTextAlignment(.center)
                .lineSpacing(4)
        }
    }
    
    private var ctaButton: some View {
        HStack(spacing: 8) {
            Text("EXPLORE THE DIFFERENCES")
                .font(.system(size: 13, weight: .black, design: .rounded))
                .tracking(2)
            
            Image(systemName: "chevron.right")
                .font(.system(size: 12, weight: .bold))
        }
        .foregroundColor(.black)
        .padding(.horizontal, 24)
        .padding(.vertical, 12)
        .background(
            Capsule()
                .fill(
                    LinearGradient(
                        colors: [Palette.accent.gold, Palette.primary.orange],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .shadow(color: Palette.accent.gold.opacity(0.5), radius: 10)
        )
        .padding(.top, 8)
    }
    
    private var cardBackground: some View {
        RoundedRectangle(cornerRadius: 20, style: .continuous)
            .fill(
                LinearGradient(
                    colors: [
                        Color.white.opacity(0.1),
                        Color.white.opacity(0.02),
                        Palette.accent.gold.opacity(0.05)
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .overlay(
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .stroke(
                        LinearGradient(
                            colors: [
                                Palette.accent.gold.opacity(0.6),
                                Palette.primary.orange.opacity(0.3),
                                Palette.accent.gold.opacity(0.6)
                            ],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        lineWidth: 2
                    )
            )
    }
}

// MARK: - Alternative Traditions List View

struct AlternativeTraditionsListView: View {
    
    let onDismiss: () -> Void
    
    @State private var selectedLie: BiblicalLie?
    
    var body: some View {
        ZStack {
            backgroundGradient
            
            VStack(spacing: 0) {
                headerBar
                
                ScrollView {
                    VStack(spacing: 20) {
                        headerSection
                        
                        ForEach(BiblicalLie.allLies) { lie in
                            BiblicalLieCard(lie: lie) {
                                selectedLie = lie
                            }
                        }
                        
                        dragonFooter
                        
                        Spacer(minLength: 40)
                    }
                    .padding(.horizontal, 20)
                }
            }
        }
        .sheet(item: $selectedLie) { lie in
            BiblicalLieDetailView(lie: lie) {
                selectedLie = nil
            }
        }
    }
    
    private var backgroundGradient: some View {
        LinearGradient(
            colors: [
                Color.black,
                Color(red: 0.1, green: 0.02, blue: 0.02),
                Color.black
            ],
            startPoint: .top,
            endPoint: .bottom
        )
        .ignoresSafeArea()
    }
    
    private var headerBar: some View {
        HStack {
            Spacer()
            Button(action: onDismiss) {
                Image(systemName: "xmark.circle.fill")
                    .font(.system(size: 28))
                    .foregroundColor(Palette.text.secondary)
            }
        }
        .padding(.horizontal, 20)
        .padding(.top, 16)
        .padding(.bottom, 8)
    }
    
    private var headerSection: some View {
        VStack(spacing: 12) {
            Text("📖🔥")
                .font(.system(size: 50))
            
            Text("CANONICAL VS. ALTERNATIVE TRADITIONS")
                .font(.system(size: 13, weight: .bold, design: .rounded))
                .tracking(3)
                .foregroundColor(Palette.primary.red)
            
            Text("What They Said")
                .font(.system(size: 28, weight: .bold, design: .rounded))
                .foregroundColor(Palette.text.primary)
            
            Text("vs")
                .font(.system(size: 16, weight: .medium, design: .rounded))
                .foregroundColor(Palette.text.muted)
            
            Text("The Gnostic Truth")
                .font(.system(size: 28, weight: .bold, design: .rounded))
                .foregroundStyle(
                    LinearGradient(
                        colors: [Palette.accent.gold, Palette.primary.orange],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
            
            Text("Tap each lie to see what they don't want you to know")
                .font(.system(size: 14, weight: .medium, design: .rounded))
                .foregroundColor(Palette.text.secondary)
                .padding(.top, 8)
        }
        .padding(.top, 20)
        .padding(.bottom, 10)
    }
    
    private var dragonFooter: some View {
        HStack(alignment: .top, spacing: 10) {
            Text("🐉")
                .font(.system(size: 20))
            
            Text("\"They wrote the book. They edited the book. They translated the book. They taught you to never question the book. Maybe start there.\"")
                .font(.system(size: 13, weight: .medium, design: .rounded))
                .italic()
                .foregroundColor(Palette.accent.gold)
                .lineSpacing(4)
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill(Palette.accent.gold.opacity(0.1))
                .overlay(
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .stroke(Palette.accent.gold.opacity(0.3), lineWidth: 1)
                )
        )
        .padding(.top, 20)
    }
}

// MARK: - Biblical Lie Card

struct BiblicalLieCard: View {
    
    let lie: BiblicalLie
    let onTap: () -> Void
    
    var body: some View {
        HStack(spacing: 14) {
            // Icon
            ZStack {
                Circle()
                    .fill(lie.color.opacity(0.2))
                    .frame(width: 44, height: 44)
                
                Image(systemName: lie.icon)
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(lie.color)
            }
            
            // Title
            Text(lie.title)
                .font(.system(size: 16, weight: .bold, design: .rounded))
                .foregroundColor(Palette.text.primary)
            
            Spacer()
            
            // "Exposed" indicator
            Text("TAP TO EXPOSE")
                .font(.system(size: 9, weight: .bold, design: .rounded))
                .tracking(1)
                .foregroundColor(Palette.primary.red.opacity(0.8))
            
            Image(systemName: "chevron.right")
                .font(.system(size: 12, weight: .semibold))
                .foregroundColor(Palette.text.muted)
        }
        .padding(14)
        .background(
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill(Color.white.opacity(0.05))
                .overlay(
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .stroke(lie.color.opacity(0.2), lineWidth: 1)
                )
        )
        .onTapGesture { HapticManager.shared.cardFlip(); onTap() }
    }
}

// MARK: - Biblical Lie Detail View

struct BiblicalLieDetailView: View {
    
    let lie: BiblicalLie
    let onDismiss: () -> Void
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack(spacing: 0) {
                headerBar
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 24) {
                        detailHeader
                        
                        if let verse = lie.bibleVerse {
                            bibleVerseSection(verse: verse)
                        }
                        
                        whatTheySaidSection
                        arrowDivider
                        gnosticTruthSection
                        dragonComment
                        
                        Spacer(minLength: 40)
                    }
                    .padding(.horizontal, 20)
                }
            }
        }
    }
    
    private var headerBar: some View {
        HStack {
            Spacer()
            Button(action: onDismiss) {
                Image(systemName: "xmark.circle.fill")
                    .font(.system(size: 28))
                    .foregroundColor(Palette.text.secondary)
            }
        }
        .padding(.horizontal, 20)
        .padding(.top, 16)
        .padding(.bottom, 8)
    }
    
    private var detailHeader: some View {
        VStack(spacing: 16) {
            ZStack {
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [lie.color.opacity(0.4), lie.color.opacity(0.05)],
                            center: .center,
                            startRadius: 0,
                            endRadius: 50
                        )
                    )
                    .frame(width: 80, height: 80)
                
                Image(systemName: lie.icon)
                    .font(.system(size: 36, weight: .semibold))
                    .foregroundColor(lie.color)
            }
            .shadow(color: lie.color.opacity(0.4), radius: 15)
            
            Text(lie.title)
                .font(.system(size: 26, weight: .bold, design: .rounded))
                .foregroundColor(Palette.text.primary)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
        .padding(.top, 10)
    }
    
    private func bibleVerseSection(verse: String) -> some View {
        HStack(spacing: 10) {
            Image(systemName: "book.fill")
                .font(.system(size: 14))
                .foregroundColor(Palette.text.muted)
            
            Text(verse)
                .font(.system(size: 13, weight: .medium, design: .rounded))
                .italic()
                .foregroundColor(Palette.text.secondary)
        }
        .padding(12)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(Color.white.opacity(0.05))
        )
    }
    
    private var whatTheySaidSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Image(systemName: "xmark.circle.fill")
                    .foregroundColor(Palette.primary.red)
                
                Text("WHAT THEY SAID")
                    .font(.system(size: 12, weight: .bold, design: .rounded))
                    .tracking(2)
                    .foregroundColor(Palette.primary.red)
            }
            
            Text(lie.whatTheySaid)
                .font(.system(size: 15, weight: .regular, design: .rounded))
                .foregroundColor(Palette.text.primary.opacity(0.9))
                .lineSpacing(6)
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 14, style: .continuous)
                .fill(Palette.primary.red.opacity(0.1))
                .overlay(
                    RoundedRectangle(cornerRadius: 14, style: .continuous)
                        .stroke(Palette.primary.red.opacity(0.3), lineWidth: 1)
                )
        )
    }
    
    private var arrowDivider: some View {
        HStack {
            Spacer()
            Image(systemName: "arrow.down")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(Palette.accent.gold)
            Spacer()
        }
    }
    
    private var gnosticTruthSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(Palette.accent.gold)
                
                Text("THE GNOSTIC TRUTH")
                    .font(.system(size: 12, weight: .bold, design: .rounded))
                    .tracking(2)
                    .foregroundColor(Palette.accent.gold)
            }
            
            Text(lie.theGnosticTruth)
                .font(.system(size: 15, weight: .regular, design: .rounded))
                .foregroundColor(Palette.text.primary)
                .lineSpacing(6)
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 14, style: .continuous)
                .fill(Palette.accent.gold.opacity(0.1))
                .overlay(
                    RoundedRectangle(cornerRadius: 14, style: .continuous)
                        .stroke(Palette.accent.gold.opacity(0.3), lineWidth: 1)
                )
        )
    }
    
    private var dragonComment: some View {
        HStack(alignment: .top, spacing: 12) {
            Text("🐉")
                .font(.system(size: 24))
            
            Text(lie.dragonComment)
                .font(.system(size: 14, weight: .medium, design: .rounded))
                .italic()
                .foregroundColor(Palette.accent.gold)
                .lineSpacing(5)
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 14, style: .continuous)
                .fill(Color.white.opacity(0.03))
                .overlay(
                    RoundedRectangle(cornerRadius: 14, style: .continuous)
                        .stroke(Palette.accent.gold.opacity(0.2), lineWidth: 1)
                )
        )
    }
}

// MARK: - Previews

#Preview("Card") {
    ZStack {
        Color.black.ignoresSafeArea()
        AlternativeTraditionsCard(onTap: {})
            .padding()
    }
}

#Preview("List") {
    AlternativeTraditionsListView(onDismiss: {})
}
