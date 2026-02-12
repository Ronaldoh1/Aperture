// YourReligionDecodedView.swift
// Personalized decoding of your specific religious background

import SwiftUI

struct YourReligionDecodedView: View {
    
    let religion: ReligionType
    let onContinue: () -> Void
    
    @State private var expandedSections: Set<String> = []
    @State private var currentRevealIndex: Int = 0
    @State private var showContinueButton: Bool = false
    
    private var data: ReligionDecodedData {
        switch religion {
        case .christianity: return .christianity
        case .judaism: return .judaism
        case .islam: return .islam
        }
    }
    
    var body: some View {
        VStack(spacing: 24) {
            
            // Header
            headerSection
            
            // Key Revelation
            keyRevelationCard
            
            // Collapsible sections
            decodedSections
            
            // Continue button
            if showContinueButton {
                continueButton
            }
        }
        .onAppear {
            // Auto-expand first section
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                withAnimation {
                    _ = expandedSections.insert("characters")
                }
            }
            // Show continue button after delay
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                withAnimation {
                    showContinueButton = true
                }
            }
        }
    }
    
    // MARK: - Header
    
    private var headerSection: some View {
        VStack(spacing: 16) {
            // Religion symbol with glow
            ZStack {
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [religion.primaryColor.opacity(0.4), .clear],
                            center: .center,
                            startRadius: 0,
                            endRadius: 50
                        )
                    )
                    .frame(width: 100, height: 100)
                
                Text(religion.primarySymbol)
                    .font(.system(size: 50))
            }
            
            VStack(spacing: 8) {
                Text("\(religion.rawValue)")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(religion.primaryColor)
                    .tracking(2)
                
                HStack(spacing: 12) {
                    Label(religion.celestialBody, systemImage: "sparkles")
                        .font(.system(size: 13, weight: .medium))
                        .foregroundColor(.white.opacity(0.7))
                    
                    Text("•")
                        .foregroundColor(.white.opacity(0.3))
                    
                    Text(religion.sacredDay)
                        .font(.system(size: 13, weight: .medium))
                        .foregroundColor(.white.opacity(0.7))
                }
            }
        }
    }
    
    // MARK: - Key Revelation
    
    private var keyRevelationCard: some View {
        VStack(spacing: 12) {
            HStack {
                Image(systemName: "lightbulb.fill")
                    .foregroundColor(Palette.accent.gold)
                
                Text("THE KEY REVELATION")
                    .font(.system(size: 11, weight: .bold))
                    .tracking(2)
                    .foregroundColor(Palette.accent.gold)
                
                Spacer()
            }
            
            Text(data.keyRevelation)
                .font(.system(size: 15, weight: .medium, design: .rounded))
                .foregroundColor(.white)
                .multilineTextAlignment(.leading)
                .lineSpacing(4)
        }
        .padding(18)
        .background(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .fill(Palette.accent.gold.opacity(0.1))
                .overlay(
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .stroke(Palette.accent.gold.opacity(0.3), lineWidth: 1)
                )
        )
    }
    
    // MARK: - Decoded Sections
    
    private var decodedSections: some View {
        VStack(spacing: 12) {
            
            // Characters Decoded
            decodedSection(
                id: "characters",
                title: "Characters Decoded",
                subtitle: "Who they really represent",
                icon: "person.3.fill",
                color: .purple
            ) {
                VStack(spacing: 12) {
                    ForEach(data.characters) { character in
                        CharacterDecodedCard(character: character, color: religion.primaryColor)
                    }
                }
            }
            
            // Symbols Decoded
            decodedSection(
                id: "symbols",
                title: "Symbols Decoded",
                subtitle: "Hidden in plain sight",
                icon: "star.fill",
                color: religion.primaryColor
            ) {
                VStack(spacing: 12) {
                    ForEach(data.symbols) { symbol in
                        SymbolDecodedCard(symbol: symbol, color: religion.primaryColor)
                    }
                }
            }
            
            // Holidays Decoded
            decodedSection(
                id: "holidays",
                title: "Holidays Decoded",
                subtitle: "What you're really celebrating",
                icon: "calendar",
                color: .orange
            ) {
                VStack(spacing: 12) {
                    ForEach(data.holidays) { holiday in
                        HolidayDecodedCard(holiday: holiday, color: .orange)
                    }
                }
            }
            
            // Etymology Reveals
            decodedSection(
                id: "etymology",
                title: "Etymology Reveals",
                subtitle: "Words hide the truth",
                icon: "text.book.closed",
                color: Palette.primary.cyan
            ) {
                VStack(spacing: 8) {
                    ForEach(data.etymologies) { etymology in
                        EtymologyCard(etymology: etymology)
                    }
                }
            }
            
            // Control Mechanisms
            decodedSection(
                id: "control",
                title: "Control Mechanisms",
                subtitle: "How it keeps you in the matrix",
                icon: "lock.fill",
                color: .red
            ) {
                VStack(spacing: 10) {
                    ForEach(data.controlMechanisms) { mechanism in
                        ControlMechanismCard(mechanism: mechanism)
                    }
                }
            }
        }
    }
    
    private func decodedSection<Content: View>(
        id: String,
        title: String,
        subtitle: String,
        icon: String,
        color: Color,
        @ViewBuilder content: () -> Content
    ) -> some View {
        let isExpanded = expandedSections.contains(id)
        
        return VStack(spacing: 0) {
            // Header
            Button(action: {
                HapticManager.shared.light()
                withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
                    if isExpanded {
                        expandedSections.remove(id)
                    } else {
                        expandedSections.insert(id)
                    }
                }
            }) {
                HStack(spacing: 14) {
                    Image(systemName: icon)
                        .font(.system(size: 18))
                        .foregroundColor(color)
                        .frame(width: 40, height: 40)
                        .background(color.opacity(0.15))
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text(title)
                            .font(.system(size: 16, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                        
                        Text(subtitle)
                            .font(.system(size: 12, weight: .medium))
                            .foregroundColor(.white.opacity(0.5))
                    }
                    
                    Spacer()
                    
                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(color)
                }
                .padding(16)
                .background(
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .fill(Color.white.opacity(0.05))
                        .overlay(
                            RoundedRectangle(cornerRadius: 16, style: .continuous)
                                .stroke(
                                    isExpanded ? color.opacity(0.4) : Color.white.opacity(0.1),
                                    lineWidth: 1
                                )
                        )
                )
            }
            .buttonStyle(PlainButtonStyle())
            
            // Content
            if isExpanded {
                content()
                    .padding(.top, 12)
                    .transition(.opacity.combined(with: .move(edge: .top)))
            }
        }
    }
    
    // MARK: - Continue Button
    
    private var continueButton: some View {
        VStack(spacing: 12) {
            Text("But wait — \(religion.rawValue) isn't the only one...")
                .font(.system(size: 14, weight: .medium, design: .rounded))
                .foregroundColor(.white.opacity(0.6))
            
            Button(action: {
                HapticManager.shared.medium()
                onContinue()
            }) {
                HStack(spacing: 12) {
                    Text("See The Pattern")
                        .font(.system(size: 16, weight: .bold, design: .rounded))
                    
                    Image(systemName: "arrow.right")
                        .font(.system(size: 14, weight: .bold))
                }
                .foregroundColor(.black)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
                .background(
                    LinearGradient(
                        colors: [Palette.accent.gold, Color(hex: "#FF8C00")],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
            }
        }
        .padding(.top, 16)
    }
}

// MARK: - Supporting Cards

struct CharacterDecodedCard: View {
    let character: DecodedCharacter
    let color: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Name
            Text(character.name)
                .font(.system(size: 15, weight: .bold, design: .rounded))
                .foregroundColor(.white)
            
            // What they told you
            HStack(alignment: .top, spacing: 10) {
                Text("📖")
                    .font(.system(size: 14))
                
                VStack(alignment: .leading, spacing: 2) {
                    Text("WHAT THEY TOLD YOU")
                        .font(.system(size: 9, weight: .bold))
                        .foregroundColor(.white.opacity(0.4))
                        .tracking(1)
                    
                    Text(character.officialMeaning)
                        .font(.system(size: 13, weight: .medium))
                        .foregroundColor(.white.opacity(0.7))
                }
            }
            
            // What it actually means
            HStack(alignment: .top, spacing: 10) {
                Text("👁️")
                    .font(.system(size: 14))
                
                VStack(alignment: .leading, spacing: 2) {
                    Text("WHAT IT ACTUALLY MEANS")
                        .font(.system(size: 9, weight: .bold))
                        .foregroundColor(color)
                        .tracking(1)
                    
                    Text(character.decodedMeaning)
                        .font(.system(size: 13, weight: .bold))
                        .foregroundColor(color)
                }
            }
            
            // Explanation
            Text(character.explanation)
                .font(.system(size: 12, weight: .medium))
                .foregroundColor(.white.opacity(0.6))
                .lineSpacing(2)
        }
        .padding(14)
        .background(
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill(Color.white.opacity(0.03))
                .overlay(
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .stroke(Color.white.opacity(0.08), lineWidth: 1)
                )
        )
    }
}

struct SymbolDecodedCard: View {
    let symbol: DecodedSymbol
    let color: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                if let icon = symbol.icon {
                    Image(systemName: icon)
                        .font(.system(size: 16))
                        .foregroundColor(color)
                }
                
                Text(symbol.name)
                    .font(.system(size: 14, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                
                Spacer()
            }
            
            HStack(spacing: 20) {
                VStack(alignment: .leading, spacing: 4) {
                    Text("OFFICIAL")
                        .font(.system(size: 8, weight: .bold))
                        .foregroundColor(.white.opacity(0.4))
                        .tracking(1)
                    
                    Text(symbol.officialMeaning)
                        .font(.system(size: 11, weight: .medium))
                        .foregroundColor(.white.opacity(0.6))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Image(systemName: "arrow.right")
                    .font(.system(size: 12))
                    .foregroundColor(color)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("DECODED")
                        .font(.system(size: 8, weight: .bold))
                        .foregroundColor(color)
                        .tracking(1)
                    
                    Text(symbol.decodedMeaning)
                        .font(.system(size: 11, weight: .bold))
                        .foregroundColor(color)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            Text(symbol.explanation)
                .font(.system(size: 11, weight: .medium))
                .foregroundColor(.white.opacity(0.5))
                .lineSpacing(2)
        }
        .padding(12)
        .background(
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill(color.opacity(0.05))
                .overlay(
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .stroke(color.opacity(0.15), lineWidth: 1)
                )
        )
    }
}

struct HolidayDecodedCard: View {
    let holiday: DecodedHoliday
    let color: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(holiday.name)
                    .font(.system(size: 14, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                
                Spacer()
                
                if let date = holiday.date {
                    Text(date)
                        .font(.system(size: 10, weight: .medium))
                        .foregroundColor(.white.opacity(0.4))
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Color.white.opacity(0.1))
                        .clipShape(Capsule())
                }
            }
            
            VStack(alignment: .leading, spacing: 8) {
                HStack(alignment: .top, spacing: 8) {
                    Text("📖")
                        .font(.system(size: 12))
                    Text(holiday.officialMeaning)
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(.white.opacity(0.6))
                }
                
                HStack(alignment: .top, spacing: 8) {
                    Text("⭐")
                        .font(.system(size: 12))
                    Text(holiday.astronomicalMeaning)
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(color)
                }
            }
        }
        .padding(12)
        .background(
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill(Color.white.opacity(0.03))
                .overlay(
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .stroke(Color.white.opacity(0.08), lineWidth: 1)
                )
        )
    }
}

struct EtymologyCard: View {
    let etymology: EtymologyReveal
    
    var body: some View {
        HStack(spacing: 12) {
            Text(etymology.word)
                .font(.system(size: 13, weight: .bold, design: .monospaced))
                .foregroundColor(Palette.primary.cyan)
                .frame(width: 80, alignment: .leading)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(etymology.commonMeaning)
                    .font(.system(size: 11, weight: .medium))
                    .foregroundColor(.white.opacity(0.4))
                    .strikethrough()
                
                Text(etymology.actualOrigin)
                    .font(.system(size: 11, weight: .semibold))
                    .foregroundColor(.white.opacity(0.85))
            }
            
            Spacer()
        }
        .padding(10)
        .background(
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .fill(Palette.primary.cyan.opacity(0.05))
        )
    }
}

struct ControlMechanismCard: View {
    let mechanism: ReligionControlMechanism
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: mechanism.icon)
                .font(.system(size: 14))
                .foregroundColor(.red)
                .frame(width: 32, height: 32)
                .background(Color.red.opacity(0.15))
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 2) {
                Text(mechanism.mechanism)
                    .font(.system(size: 13, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                
                Text(mechanism.howItControls)
                    .font(.system(size: 11, weight: .medium))
                    .foregroundColor(.white.opacity(0.5))
            }
            
            Spacer()
        }
        .padding(10)
        .background(
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(Color.red.opacity(0.05))
                .overlay(
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .stroke(Color.red.opacity(0.15), lineWidth: 1)
                )
        )
    }
}

// MARK: - Preview

#Preview {
    ZStack {
        Color(hex: "#0a0a1a").ignoresSafeArea()
        
        ScrollView {
            YourReligionDecodedView(religion: .christianity, onContinue: {})
                .padding()
        }
    }
}
