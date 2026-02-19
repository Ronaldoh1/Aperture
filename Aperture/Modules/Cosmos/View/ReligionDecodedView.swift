// ReligionDecodedView.swift
// A journey of discovery - see beyond the veil of religious programming

import SwiftUI

// MARK: - Journey State

enum ReligionDecodedJourneyState: Equatable {
    case welcome
    case selectReligion
    case yourReligion(ReligionType)
    case comparison
    case preDatedSaviors
    case globalSunWorship
    case solarDisconnection
    case christWithin
    case patternRecognition  // NEW: Control Triangle, 1492 → 2026
    case finalTruth
    case completed
}

// MARK: - Main View

struct ReligionDecodedView: View {
    
    @Environment(\.dismiss) private var dismiss
    @State private var journeyState: ReligionDecodedJourneyState = .welcome
    @State private var selectedReligion: ReligionType?
    @State private var showFullJourney: Bool = false // "Just show me everything"
    @State private var currentSection: Int = 0
    
    var body: some View {
        NavigationStack {
            ZStack {
                backgroundGradient
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 24) {
                        switch journeyState {
                        case .welcome:
                            welcomeSection
                        case .selectReligion:
                            selectReligionSection
                        case .yourReligion(let religion):
                            YourReligionDecodedView(
                                religion: religion,
                                onContinue: { 
                                    withAnimation(.easeInOut(duration: 0.5)) {
                                        journeyState = .comparison
                                    }
                                }
                            )
                        case .comparison:
                            ComparisonView(
                                selectedReligion: selectedReligion,
                                onContinue: {
                                    withAnimation(.easeInOut(duration: 0.5)) {
                                        journeyState = .preDatedSaviors
                                    }
                                }
                            )
                        case .preDatedSaviors:
                            PreDatedSaviorsView(
                                onContinue: {
                                    withAnimation(.easeInOut(duration: 0.5)) {
                                        journeyState = .globalSunWorship
                                    }
                                }
                            )
                        case .globalSunWorship:
                            GlobalSunWorshipView(
                                onContinue: {
                                    withAnimation(.easeInOut(duration: 0.5)) {
                                        journeyState = .solarDisconnection
                                    }
                                }
                            )
                        case .solarDisconnection:
                            SolarDisconnectionView(
                                onContinue: {
                                    withAnimation(.easeInOut(duration: 0.5)) {
                                        journeyState = .christWithin
                                    }
                                }
                            )
                        case .christWithin:
                            ChristWithinView(
                                onContinue: {
                                    withAnimation(.easeInOut(duration: 0.5)) {
                                        journeyState = .patternRecognition
                                    }
                                }
                            )
                        case .patternRecognition:
                            PatternRecognitionView(
                                onContinue: {
                                    withAnimation(.easeInOut(duration: 0.5)) {
                                        journeyState = .finalTruth
                                    }
                                }
                            )
                        case .finalTruth:
                            FinalTruthView(
                                onComplete: {
                                    withAnimation(.easeInOut(duration: 0.5)) {
                                        journeyState = .completed
                                    }
                                }
                            )
                        case .completed:
                            completedSection
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 24)
                }
            }
            .navigationTitle(navigationTitle)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    if journeyState != .welcome {
                        Button(action: goBack) {
                            Image(systemName: "chevron.left")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(.white)
                        }
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { dismiss() }) {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 20))
                            .foregroundColor(.white.opacity(0.5))
                    }
                }
            }
        }
    }
    
    private var navigationTitle: String {
        switch journeyState {
        case .welcome: return ""
        case .selectReligion: return "Choose Your Path"
        case .yourReligion(let r): return "\(r.rawValue) Decoded"
        case .comparison: return "The Pattern"
        case .preDatedSaviors: return "Same Story, Different Names"
        case .globalSunWorship: return "The Sun Has Always Been There"
        case .solarDisconnection: return "How They Disconnected Us"
        case .christWithin: return "The Christ Within"
        case .patternRecognition: return "Pattern Recognition"
        case .finalTruth: return "The Truth"
        case .completed: return "Awakened"
        }
    }
    
    private func goBack() {
        withAnimation(.easeInOut(duration: 0.3)) {
            switch journeyState {
            case .selectReligion:
                journeyState = .welcome
            case .yourReligion:
                journeyState = .selectReligion
            case .comparison:
                if let religion = selectedReligion {
                    journeyState = .yourReligion(religion)
                } else {
                    journeyState = .selectReligion
                }
            case .preDatedSaviors:
                journeyState = .comparison
            case .globalSunWorship:
                journeyState = .preDatedSaviors
            case .solarDisconnection:
                journeyState = .globalSunWorship
            case .christWithin:
                journeyState = .solarDisconnection
            case .patternRecognition:
                journeyState = .christWithin
            case .finalTruth:
                journeyState = .patternRecognition
            case .completed:
                journeyState = .finalTruth
            default:
                break
            }
        }
    }
    
    // MARK: - Background
    
    private var backgroundGradient: some View {
        LinearGradient(
            colors: [
                Color(hex: "#0a0a1a"),
                Color(hex: "#1a1a2e"),
                Color(hex: "#0a0a1a")
            ],
            startPoint: .top,
            endPoint: .bottom
        )
        .ignoresSafeArea()
    }
    
    // MARK: - Welcome Section
    
    private var welcomeSection: some View {
        VStack(spacing: 32) {
            Spacer()
                .frame(height: 40)
            
            // Animated symbol
            welcomeSymbol
            
            // Title
            VStack(spacing: 12) {
                Text("Beyond the Veil")
                    .font(.system(size: 32, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                
                Text("What They Never Wanted You to Know")
                    .font(.system(size: 16, weight: .medium, design: .rounded))
                    .foregroundColor(.white.opacity(0.6))
            }
            
            // Intro text
            VStack(spacing: 16) {
                introCard(
                    text: "This isn't about attacking your faith or your family's traditions.",
                    icon: "heart.fill",
                    color: .pink
                )
                
                introCard(
                    text: "It's about seeing patterns that were hidden in plain sight for thousands of years.",
                    icon: "eye.fill",
                    color: Palette.primary.cyan
                )
                
                introCard(
                    text: "Your ancestors weren't foolish — they were given incomplete information.",
                    icon: "person.3.fill",
                    color: .orange
                )
                
                introCard(
                    text: "Once you see it, you'll understand why they didn't want you to.",
                    icon: "lightbulb.fill",
                    color: Palette.accent.gold
                )
            }
            .padding(.top, 16)
            
            Spacer()
                .frame(height: 20)
            
            // CTA Button
            Button(action: {
                HapticManager.shared.medium()
                withAnimation(.easeInOut(duration: 0.5)) {
                    journeyState = .selectReligion
                }
            }) {
                HStack(spacing: 12) {
                    Text("Begin the Journey")
                        .font(.system(size: 18, weight: .bold, design: .rounded))
                    
                    Image(systemName: "arrow.right")
                        .font(.system(size: 16, weight: .bold))
                }
                .foregroundColor(.black)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 18)
                .background(
                    LinearGradient(
                        colors: [Palette.accent.gold, Color(hex: "#FF8C00")],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            }
            
            Spacer()
                .frame(height: 40)
        }
    }
    
    private var welcomeSymbol: some View {
        ZStack {
            // Outer glow
            Circle()
                .fill(
                    RadialGradient(
                        colors: [Palette.accent.gold.opacity(0.3), .clear],
                        center: .center,
                        startRadius: 0,
                        endRadius: 80
                    )
                )
                .frame(width: 160, height: 160)
            
            // Three symbols rotating
            ZStack {
                Text("☀️")
                    .font(.system(size: 40))
                    .offset(x: 0, y: -50)
                
                Text("🪐")
                    .font(.system(size: 40))
                    .offset(x: -43, y: 25)
                
                Text("🌙")
                    .font(.system(size: 40))
                    .offset(x: 43, y: 25)
                
                // Center eye
                Image(systemName: "eye.fill")
                    .font(.system(size: 30))
                    .foregroundColor(Palette.accent.gold)
            }
        }
    }
    
    private func introCard(text: String, icon: String, color: Color) -> some View {
        HStack(spacing: 14) {
            Image(systemName: icon)
                .font(.system(size: 18))
                .foregroundColor(color)
                .frame(width: 40, height: 40)
                .background(color.opacity(0.15))
                .clipShape(Circle())
            
            Text(text)
                .font(.system(size: 14, weight: .medium, design: .rounded))
                .foregroundColor(.white.opacity(0.85))
                .multilineTextAlignment(.leading)
            
            Spacer()
        }
        .padding(14)
        .background(
            RoundedRectangle(cornerRadius: 14, style: .continuous)
                .fill(Color.white.opacity(0.05))
                .overlay(
                    RoundedRectangle(cornerRadius: 14, style: .continuous)
                        .stroke(Color.white.opacity(0.1), lineWidth: 1)
                )
        )
    }
    
    // MARK: - Select Religion Section
    
    private var selectReligionSection: some View {
        VStack(spacing: 28) {
            Spacer()
                .frame(height: 20)
            
            // Header
            VStack(spacing: 12) {
                Text("What Were You Raised With?")
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                
                Text("We'll start with what's familiar, then show you the bigger pattern.")
                    .font(.system(size: 14, weight: .medium, design: .rounded))
                    .foregroundColor(.white.opacity(0.6))
                    .multilineTextAlignment(.center)
            }
            
            // Religion options
            VStack(spacing: 16) {
                ForEach(ReligionType.allCases) { religion in
                    religionOptionCard(religion)
                }
            }
            
            // Divider
            HStack {
                Rectangle()
                    .fill(Color.white.opacity(0.2))
                    .frame(height: 1)
                
                Text("OR")
                    .font(.system(size: 12, weight: .bold))
                    .foregroundColor(.white.opacity(0.4))
                    .padding(.horizontal, 12)
                
                Rectangle()
                    .fill(Color.white.opacity(0.2))
                    .frame(height: 1)
            }
            .padding(.vertical, 8)
            
            // Show everything option
            Button(action: {
                HapticManager.shared.medium()
                showFullJourney = true
                withAnimation(.easeInOut(duration: 0.5)) {
                    journeyState = .comparison
                }
            }) {
                HStack(spacing: 12) {
                    Image(systemName: "eye.trianglebadge.exclamationmark")
                        .font(.system(size: 20))
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Just Show Me Everything")
                            .font(.system(size: 16, weight: .bold, design: .rounded))
                        
                        Text("I'm ready for the full picture")
                            .font(.system(size: 12, weight: .medium))
                            .opacity(0.7)
                    }
                    
                    Spacer()
                    
                    Image(systemName: "arrow.right")
                        .font(.system(size: 14, weight: .semibold))
                }
                .foregroundColor(.white)
                .padding(18)
                .background(
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .fill(Color.white.opacity(0.08))
                        .overlay(
                            RoundedRectangle(cornerRadius: 16, style: .continuous)
                                .stroke(Palette.accent.gold.opacity(0.4), lineWidth: 1)
                        )
                )
            }
            
            Spacer()
        }
    }
    
    private func religionOptionCard(_ religion: ReligionType) -> some View {
        Button(action: {
            HapticManager.shared.medium()
            selectedReligion = religion
            withAnimation(.easeInOut(duration: 0.5)) {
                journeyState = .yourReligion(religion)
            }
        }) {
            HStack(spacing: 16) {
                // Symbol
                Text(religion.primarySymbol)
                    .font(.system(size: 36))
                    .frame(width: 60, height: 60)
                    .background(religion.primaryColor.opacity(0.15))
                    .clipShape(Circle())
                
                // Info
                VStack(alignment: .leading, spacing: 4) {
                    Text(religion.rawValue)
                        .font(.system(size: 18, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                    
                    HStack(spacing: 8) {
                        Text(religion.celestialBody)
                            .font(.system(size: 13, weight: .medium))
                            .foregroundColor(religion.primaryColor)
                        
                        Text("•")
                            .foregroundColor(.white.opacity(0.3))
                        
                        Text(religion.sacredDay)
                            .font(.system(size: 12, weight: .medium))
                            .foregroundColor(.white.opacity(0.5))
                    }
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(religion.primaryColor)
            }
            .padding(16)
            .background(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .fill(religion.primaryColor.opacity(0.08))
                    .overlay(
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .stroke(religion.primaryColor.opacity(0.25), lineWidth: 1)
                    )
            )
        }
        .buttonStyle(PlainButtonStyle())
    }
    
    // MARK: - Completed Section
    
    private var completedSection: some View {
        VStack(spacing: 32) {
            Spacer()
                .frame(height: 40)
            
            // Awakened symbol
            ZStack {
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [Palette.accent.gold.opacity(0.4), .clear],
                            center: .center,
                            startRadius: 0,
                            endRadius: 80
                        )
                    )
                    .frame(width: 160, height: 160)
                
                Image(systemName: "eye.fill")
                    .font(.system(size: 50))
                    .foregroundColor(Palette.accent.gold)
            }
            
            VStack(spacing: 16) {
                Text("You've Seen Beyond the Veil")
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                
                Text("The sun is in the sky.\nThe moon reflects its light.\nAnd YOU contain them all.")
                    .font(.system(size: 16, weight: .medium, design: .rounded))
                    .foregroundColor(.white.opacity(0.7))
                    .multilineTextAlignment(.center)
                    .lineSpacing(4)
            }
            
            // Final affirmation
            VStack(spacing: 8) {
                Text("🌀")
                    .font(.system(size: 40))
                
                Text("\"I AM the Father, the Son,\nand the Holy Spirit.\nI AM the fractal of Source.\"")
                    .font(.system(size: 18, weight: .semibold, design: .serif))
                    .foregroundColor(Palette.accent.gold)
                    .multilineTextAlignment(.center)
                    .italic()
                    .lineSpacing(4)
            }
            .padding(24)
            .background(
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .fill(Palette.accent.gold.opacity(0.1))
                    .overlay(
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .stroke(Palette.accent.gold.opacity(0.3), lineWidth: 1)
                    )
            )
            
            Spacer()
                .frame(height: 20)
            
            // Zodiac Discovery Invitation
            zodiacDiscoveryCard
            
            Spacer()
                .frame(height: 16)
            
            Button(action: { dismiss() }) {
                HStack(spacing: 12) {
                    Text("Return to Cosmos")
                        .font(.system(size: 16, weight: .bold, design: .rounded))
                    
                    Image(systemName: "sparkles")
                        .font(.system(size: 14))
                }
                .foregroundColor(.black)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
                .background(Palette.accent.gold)
                .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
            }
            
            Spacer()
        }
    }
    
    // MARK: - Zodiac Discovery Card
    
    private var zodiacDiscoveryCard: some View {
        VStack(spacing: 16) {
            // Header
            HStack {
                Image(systemName: "sparkles")
                    .foregroundColor(.purple)
                
                Text("CONTINUE YOUR JOURNEY")
                    .font(.system(size: 11, weight: .bold))
                    .tracking(2)
                    .foregroundColor(.purple)
                
                Spacer()
            }
            
            // Zodiac symbols animation
            HStack(spacing: 8) {
                ForEach(["♈", "♉", "♊", "♋", "♌", "♍", "♎", "♏", "♐", "♑", "♒", "♓"], id: \.self) { sign in
                    Text(sign)
                        .font(.system(size: 14))
                        .foregroundColor(.purple.opacity(0.7))
                }
            }
            
            VStack(spacing: 8) {
                Text("Discover Your Cosmic Blueprint")
                    .font(.system(size: 18, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                
                Text("The 12 disciples are the 12 zodiac signs.\nThe zodiac wheel is in YOU.\nDiscover how the stars mapped your soul.")
                    .font(.system(size: 13, weight: .medium))
                    .foregroundColor(.white.opacity(0.7))
                    .multilineTextAlignment(.center)
                    .lineSpacing(4)
            }
            
            // Two options
            HStack(spacing: 12) {
                // Birth Chart option
                NavigationLink(destination: EmptyView()) { // TODO: Link to ZodiacConnectionCourse
                    HStack(spacing: 8) {
                        Image(systemName: "chart.pie.fill")
                            .font(.system(size: 14))
                        Text("Your Birth Chart")
                            .font(.system(size: 13, weight: .bold))
                    }
                    .foregroundColor(.white)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 12)
                    .background(
                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                            .fill(Color.purple.opacity(0.3))
                            .overlay(
                                RoundedRectangle(cornerRadius: 12, style: .continuous)
                                    .stroke(Color.purple.opacity(0.5), lineWidth: 1)
                            )
                    )
                }
                
                // Zodiac Course option
                NavigationLink(destination: EmptyView()) { // TODO: Link to ZodiacConnectionCourse
                    HStack(spacing: 8) {
                        Image(systemName: "graduationcap.fill")
                            .font(.system(size: 14))
                        Text("Zodiac Course")
                            .font(.system(size: 13, weight: .bold))
                    }
                    .foregroundColor(.black)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 12)
                    .background(
                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                            .fill(Color.purple)
                    )
                }
            }
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(
                    LinearGradient(
                        colors: [
                            Color.purple.opacity(0.15),
                            Color.purple.opacity(0.05)
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .stroke(
                            LinearGradient(
                                colors: [Color.purple.opacity(0.5), Color.purple.opacity(0.2)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ),
                            lineWidth: 1
                        )
                )
        )
    }
}

// MARK: - Preview

#Preview {
    ReligionDecodedView()
}
