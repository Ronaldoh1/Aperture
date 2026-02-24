// GnosticRevelationView.swift

import SwiftUI

// MARK: - Gnostic Revelation View
// Displays expandable Gnostic knowledge cards at the bottom of the Timeline descent

struct GnosticRevelationView: View {
    
    @State private var expandedCardId: UUID?
    @State private var hasAppeared = false
    @State private var showForbiddenGospels = false
    
    let cards = GnosticCard.revelationCards
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            revelationHeader
            
            cardsStack
            
            // "They Hid This From Everyone" - Alexandria deep dive
            alexandriaDeepDiveSection
            
        }
        .background(cosmicBackground)
        .onAppear {
            withAnimation(.easeOut(duration: 1.0)) {
                hasAppeared = true
            }
        }
        .sheet(isPresented: $showForbiddenGospels) {
            ForbiddenGospelsView()
        }
        
    }
    
    // MARK: - Header
    
    private var revelationHeader: some View {
        
        VStack(spacing: 16) {
            
            Text("THE TRUTH PRESERVED")
                .font(.system(size: 11, weight: .bold, design: .rounded))
                .tracking(6)
                .foregroundColor(Palette.accent.gold.opacity(0.7))
            
            Text("Gnostic Revelation")
                .font(.system(size: 32, weight: .bold, design: .rounded))
                .foregroundColor(Palette.accent.gold)
            
            Text("What they killed to hide.\nWhat you were born to remember.")
                .font(.system(size: 15, weight: .medium, design: .rounded))
                .foregroundColor(Palette.text.secondary)
                .multilineTextAlignment(.center)
                .lineSpacing(4)
            
            // Dragon icon
            ZStack {
                
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [
                                Palette.accent.gold.opacity(0.3),
                                Color.clear
                            ],
                            center: .center,
                            startRadius: 0,
                            endRadius: 40
                        )
                    )
                    .frame(width: 80, height: 80)
                
                Image(systemName: "flame.fill")
                    .font(.system(size: 36, weight: .semibold))
                    .foregroundStyle(
                        LinearGradient(
                            colors: [Palette.accent.gold, Palette.primary.orange],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                
            }
            .shadow(color: Palette.accent.gold.opacity(0.4), radius: 15)
            
        }
        .padding(.vertical, 30)
        .opacity(hasAppeared ? 1 : 0)
        .offset(y: hasAppeared ? 0 : 20)
        
    }
    
    // MARK: - Cards Stack
    
    private var cardsStack: some View {
        
        VStack(spacing: 14) {
            
            ForEach(Array(cards.enumerated()), id: \.element.id) { index, card in
                
                GnosticCardView(
                    card: card,
                    isExpanded: expandedCardId == card.id,
                    onTap: {
                        withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                            if expandedCardId == card.id {
                                expandedCardId = nil
                            } else {
                                expandedCardId = card.id
                            }
                        }
                    }
                )
                .opacity(hasAppeared ? 1 : 0)
                .offset(y: hasAppeared ? 0 : 30)
                .animation(
                    .easeOut(duration: 0.5).delay(Double(index) * 0.1),
                    value: hasAppeared
                )
                
            }
            
        }
        .padding(.horizontal, 16)
        .padding(.bottom, 40)
        
    }
    
    // MARK: - Alexandria Deep Dive
    
    private var alexandriaDeepDiveSection: some View {
        
        VStack(spacing: 20) {
            
            // Divider flame
            HStack(spacing: 12) {
                Rectangle()
                    .fill(
                        LinearGradient(
                            colors: [Color.clear, Palette.accent.gold.opacity(0.4)],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .frame(height: 1)
                
                Image(systemName: "flame.fill")
                    .font(.system(size: 16))
                    .foregroundColor(Palette.accent.gold)
                
                Rectangle()
                    .fill(
                        LinearGradient(
                            colors: [Palette.accent.gold.opacity(0.4), Color.clear],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .frame(height: 1)
            }
            .padding(.horizontal, 20)
            
            // Dragon callout
            HStack(alignment: .top, spacing: 10) {
                
                Text("🐉")
                    .font(.system(size: 22))
                
                VStack(alignment: .leading, spacing: 8) {
                    
                    Text("They hid this truth from everyone.")
                        .font(.system(size: 16, weight: .bold, design: .rounded))
                        .foregroundColor(Palette.accent.gold)
                    
                    Text("Not all gospels were written to be read by the masses. Some were written and THAT is why they were hidden. The teachings of Thomas, Mary Magdalene, Philip, and Judas didn't preach obedience — they preached awakening.")
                        .font(.system(size: 13, weight: .medium, design: .rounded))
                        .foregroundColor(Palette.text.secondary)
                        .lineSpacing(5)
                    
                    Text("The Library of Alexandria holds the full truth. Go deeper.")
                        .font(.system(size: 13, weight: .bold, design: .rounded))
                        .foregroundColor(Palette.accent.gold.opacity(0.9))
                        .italic()
                        .padding(.top, 4)
                    
                }
                
            }
            .padding(16)
            .background(
                RoundedRectangle(cornerRadius: 14, style: .continuous)
                    .fill(Palette.accent.gold.opacity(0.08))
                    .overlay(
                        RoundedRectangle(cornerRadius: 14, style: .continuous)
                            .stroke(Palette.accent.gold.opacity(0.25), lineWidth: 1)
                    )
            )
            .padding(.horizontal, 16)
            
            // CTA Button - Deep dive into Forbidden Gospels
            Button(action: {
                HapticManager.shared.heavy()
                showForbiddenGospels = true
            }) {
                HStack(spacing: 12) {
                    
                    ZStack {
                        Circle()
                            .fill(
                                LinearGradient(
                                    colors: [Color(red: 0.85, green: 0.2, blue: 0.2), Color(red: 0.6, green: 0.1, blue: 0.1)],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .frame(width: 44, height: 44)
                        
                        Image(systemName: "books.vertical.fill")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(.white)
                    }
                    
                    VStack(alignment: .leading, spacing: 3) {
                        
                        HStack(spacing: 6) {
                            Text("THE FORBIDDEN GOSPELS")
                                .font(.system(size: 13, weight: .black, design: .rounded))
                                .tracking(1)
                                .foregroundColor(.white)
                            
                            Text("HIDDEN")
                                .font(.system(size: 8, weight: .bold))
                                .foregroundColor(.white)
                                .padding(.horizontal, 6)
                                .padding(.vertical, 2)
                                .background(Color.red.opacity(0.8))
                                .cornerRadius(4)
                        }
                        
                        Text("Deep dive into the gospels they banned")
                            .font(.system(size: 11, weight: .medium, design: .rounded))
                            .foregroundColor(Palette.text.secondary)
                        
                    }
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(Color(red: 0.85, green: 0.2, blue: 0.2))
                    
                }
                .padding(14)
                .background(
                    RoundedRectangle(cornerRadius: 14, style: .continuous)
                        .fill(Color(red: 0.85, green: 0.2, blue: 0.2).opacity(0.12))
                        .overlay(
                            RoundedRectangle(cornerRadius: 14, style: .continuous)
                                .stroke(Color(red: 0.85, green: 0.2, blue: 0.2).opacity(0.3), lineWidth: 1)
                        )
                )
            }
            .buttonStyle(ScaleButtonStyle())
            .padding(.horizontal, 16)
            
        }
        .padding(.top, 30)
        .padding(.bottom, 20)
        .opacity(hasAppeared ? 1 : 0)
        .offset(y: hasAppeared ? 0 : 30)
        .animation(.easeOut(duration: 0.6).delay(0.8), value: hasAppeared)
        
    }
    
    // MARK: - Revelation Background
    
    private var cosmicBackground: some View {
        
        ZStack {
            
            Color.clear
            
            RadialGradient(
                gradient: Gradient(colors: [
                    Palette.accent.gold.opacity(0.12),
                    Palette.primary.violet.opacity(0.06),
                    Color.clear
                ]),
                center: .bottom,
                startRadius: 0,
                endRadius: 400
            )
            
        }
        
    }
    
}

// MARK: - Individual Gnostic Card View

struct GnosticCardView: View {
    
    let card: GnosticCard
    let isExpanded: Bool
    let onTap: () -> Void
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            
            cardHeader
            
            if isExpanded {
                expandedContent
            }
            
        }
        .background(cardBackground)
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        .overlay(cardBorder)
        .shadow(color: card.color.opacity(isExpanded ? 0.25 : 0.1), radius: isExpanded ? 16 : 8)
        .onTapGesture(perform: onTap)
        
    }
    
    // MARK: - Card Header
    
    private var cardHeader: some View {
        
        HStack(spacing: 14) {
            
            // Icon circle
            ZStack {
                
                Circle()
                    .fill(card.color.opacity(0.15))
                    .frame(width: 46, height: 46)
                
                Image(systemName: card.icon)
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(card.color)
                
            }
            
            // Title & Subtitle
            VStack(alignment: .leading, spacing: 3) {
                
                Text(card.title)
                    .font(.system(size: 17, weight: .bold, design: .rounded))
                    .foregroundColor(Palette.text.primary)
                
                Text(card.subtitle)
                    .font(.system(size: 13, weight: .medium, design: .rounded))
                    .foregroundColor(Palette.text.muted)
                
            }
            
            Spacer()
            
            // Chevron
            Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                .font(.system(size: 13, weight: .semibold))
                .foregroundColor(card.color)
            
        }
        .padding(18)
        
    }
    
    // MARK: - Expanded Content
    
    private var expandedContent: some View {
        
        VStack(alignment: .leading, spacing: 18) {
            
            Rectangle()
                .fill(card.color.opacity(0.2))
                .frame(height: 1)
            
            ForEach(card.sections) { section in
                
                VStack(alignment: .leading, spacing: 8) {
                    
                    Text(section.heading)
                        .font(.system(size: 14, weight: .bold, design: .rounded))
                        .foregroundColor(card.color)
                    
                    Text(section.content)
                        .font(.system(size: 14, weight: .regular, design: .rounded))
                        .foregroundColor(Palette.text.secondary)
                        .lineSpacing(5)
                        .fixedSize(horizontal: false, vertical: true)
                    
                }
                
            }
            
        }
        .padding(.horizontal, 18)
        .padding(.bottom, 18)
        .transition(.opacity.combined(with: .move(edge: .top)))
        
    }
    
    // MARK: - Background & Border
    
    private var cardBackground: some View {
        
        RoundedRectangle(cornerRadius: 16, style: .continuous)
            .fill(
                LinearGradient(
                    colors: [
                        Color.white.opacity(0.06),
                        Color.white.opacity(0.02)
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
        
    }
    
    private var cardBorder: some View {
        
        RoundedRectangle(cornerRadius: 16, style: .continuous)
            .stroke(
                LinearGradient(
                    colors: [
                        card.color.opacity(isExpanded ? 0.5 : 0.25),
                        card.color.opacity(isExpanded ? 0.15 : 0.08)
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ),
                lineWidth: 1
            )
        
    }
    
}

// MARK: - Preview

#Preview {
    
    ScrollView {
        GnosticRevelationView()
    }
    .background(Color.black)
    
}
