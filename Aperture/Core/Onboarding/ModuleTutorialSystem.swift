// ModuleTutorialSystem.swift
// Aperture
//
// First-time user tutorials for each module
// Shows a guided walkthrough when users first visit a module

import SwiftUI

// MARK: - Module Tutorial Manager

class ModuleTutorialManager: ObservableObject {
    static let shared = ModuleTutorialManager()
    
    @AppStorage("seenTutorials") private var seenTutorialsData: Data = Data()
    
    private var seenTutorials: Set<String> {
        get {
            (try? JSONDecoder().decode(Set<String>.self, from: seenTutorialsData)) ?? []
        }
        set {
            seenTutorialsData = (try? JSONEncoder().encode(newValue)) ?? Data()
        }
    }
    
    func hasSeenTutorial(for moduleId: String) -> Bool {
        seenTutorials.contains(moduleId)
    }
    
    func markTutorialSeen(for moduleId: String) {
        var tutorials = seenTutorials
        tutorials.insert(moduleId)
        seenTutorials = tutorials
    }
    
    func resetAllTutorials() {
        seenTutorials = []
    }
}

// MARK: - Module Tutorial Content

struct ModuleTutorialContent: Identifiable {
    let id: String
    let title: String
    let subtitle: String
    let pages: [TutorialPage]
    let accentColor: Color
    
    struct TutorialPage {
        let icon: String
        let title: String
        let description: String
        let tips: [String]
    }
}

// MARK: - Pre-defined Module Tutorials

extension ModuleTutorialContent {
    
    static let timeline = ModuleTutorialContent(
        id: "timeline",
        title: "Timeline",
        subtitle: "Hidden History Revealed",
        pages: [
            TutorialPage(
                icon: "clock.badge.exclamationmark.fill",
                title: "Explore Hidden History",
                description: "The Timeline reveals historical events and patterns that have been hidden, suppressed, or misrepresented throughout human history.",
                tips: ["Swipe through different eras", "Tap events to see hidden connections", "Each discovery earns a sacred geometry badge"]
            ),
            TutorialPage(
                icon: "eye.trianglebadge.exclamationmark.fill",
                title: "See Beyond the Narrative",
                description: "Every historical event has multiple layers. The Timeline shows you what they didn't teach in school—the real stories behind the stories.",
                tips: ["Look for 🔮 symbols for gnostic insights", "Connect patterns across different eras", "Question everything you thought you knew"]
            )
        ],
        accentColor: Palette.primary.violet
    )
    
    static let cosmos = ModuleTutorialContent(
        id: "cosmos",
        title: "Cosmos",
        subtitle: "Gnostic Realms of Knowledge",
        pages: [
            TutorialPage(
                icon: "globe.central.south.asia.fill",
                title: "Enter the Gnostic Realms",
                description: "The Cosmos contains interconnected realms of esoteric knowledge—from ancient wisdom traditions to modern consciousness research.",
                tips: ["Explore different realms by category", "Each realm contains deep courses", "Your progress syncs across all devices"]
            ),
            TutorialPage(
                icon: "wand.and.stars",
                title: "Unlock Sacred Knowledge",
                description: "As you explore, you'll unlock sacred geometries and hidden teachings. The deeper you go, the more patterns you'll recognize.",
                tips: ["Start with realms that resonate with you", "Return often—new content is added regularly", "Share insights with fellow seekers"]
            )
        ],
        accentColor: Palette.primary.cyan
    )
    
    static let awakening = ModuleTutorialContent(
        id: "awakening",
        title: "Awakening",
        subtitle: "13 Paths to Consciousness",
        pages: [
            TutorialPage(
                icon: "sun.max.trianglebadge.exclamationmark.fill",
                title: "Your Awakening Journey",
                description: "Awakening offers 13 different spiritual traditions and consciousness practices. No single path is 'right'—find what resonates with your soul.",
                tips: ["Take the consciousness assessment first", "Try practices from multiple traditions", "Track your daily progress"]
            ),
            TutorialPage(
                icon: "figure.mind.and.body",
                title: "Practice & Integration",
                description: "Knowledge without practice is just information. Each tradition includes guided meditations, exercises, and daily rituals to integrate the teachings.",
                tips: ["Set a daily practice reminder", "Start with 5-10 minutes", "Journal your experiences"]
            ),
            TutorialPage(
                icon: "person.3.sequence.fill",
                title: "You're Not Alone",
                description: "Awakening can be disorienting. Remember: millions are on this journey with you. The discomfort is temporary; the clarity is permanent.",
                tips: ["Reach out if you feel overwhelmed", "Trust your direct experience", "The path unfolds at your pace"]
            )
        ],
        accentColor: Palette.accent.gold
    )
    
    static let alexandria = ModuleTutorialContent(
        id: "alexandria",
        title: "Alexandria",
        subtitle: "The Sacred Library",
        pages: [
            TutorialPage(
                icon: "books.vertical.fill",
                title: "Welcome to Alexandria",
                description: "Named after the legendary library, Alexandria contains the knowledge that was meant to be lost—forbidden texts, suppressed research, and hidden wisdom.",
                tips: ["Browse by category or search", "Bookmark important materials", "Download for offline reading"]
            ),
            TutorialPage(
                icon: "magnifyingglass.circle.fill",
                title: "Discern Truth",
                description: "Not everything here is 'true' in the conventional sense. Your job is to develop discernment—to recognize patterns and test ideas against your direct experience.",
                tips: ["Cross-reference multiple sources", "Trust but verify", "Your intuition is a valid tool"]
            )
        ],
        accentColor: Palette.primary.violet
    )
    
    static let godMode = ModuleTutorialContent(
        id: "godMode",
        title: "God Mode",
        subtitle: "Advanced Esoteric Knowledge",
        pages: [
            TutorialPage(
                icon: "bolt.trianglebadge.exclamationmark.fill",
                title: "You've Unlocked God Mode",
                description: "This section contains advanced esoteric knowledge—etymology secrets, hermetic principles, gnostic texts, and consciousness tools for the serious seeker.",
                tips: ["Complete the Etymology course first", "Tools are for regular practice", "Knowledge brings responsibility"]
            ),
            TutorialPage(
                icon: "wand.and.stars.inverse",
                title: "Words Are Spells",
                description: "The Etymology course reveals how language shapes reality. You'll never hear or speak words the same way again. This is powerful—use it wisely.",
                tips: ["Practice the I AM declarations daily", "Notice word spells in media", "Speak your reality into existence"]
            ),
            TutorialPage(
                icon: "key.viewfinder",
                title: "The Kybalion & Beyond",
                description: "The seven hermetic principles form the foundation of all esoteric knowledge. Master these, and you hold the keys to understanding reality itself.",
                tips: ["Study one principle per week", "Apply principles to daily life", "Everything is mental—everything"]
            )
        ],
        accentColor: Color(hex: "#9C27B0")
    )
    

    static let explore = ModuleTutorialContent(
        id: "explore",
        title: "Explore",
        subtitle: "Your Command Center",
        pages: [
            TutorialPage(
                icon: "sparkles",
                title: "Everything Lives Here",
                description: "Explore is your gateway to every tool, library, and feature in Aperture. Think of it as mission control — everything you need for your awakening journey, organized in one place.",
                tips: ["Tap any card to dive in", "Cards with badges show new or premium content", "Scroll down to see everything available"]
            ),
            TutorialPage(
                icon: "books.vertical.fill",
                title: "Sacred Library & AI Guide",
                description: "Access the Alexandria library — 29 deep-dive courses on hidden history, sacred geometry, consciousness, and forbidden knowledge. Your AI Guide (Chronokeeper) is also here for real-time questions.",
                tips: ["Alexandria courses take 20-40 min each", "Chronokeeper answers anything, anytime", "Save courses to Bookmarks for later"]
            ),
            TutorialPage(
                icon: "seal.fill",
                title: "Badges, Progress & Tools",
                description: "Track your Sacred Geometry badges earned through learning. Access Sun Flow State, Dive Deeper explorations, Journey Progress, and your personal Profile — all your stats in one place.",
                tips: ["Earn badges by completing Alexandria courses", "Sun Flow State unlocks after earning badges", "Journey Progress shows your full awakening arc"]
            ),
            TutorialPage(
                icon: "brain.head.profile",
                title: "Deprogram & Decode",
                description: "Unlearn, Signal vs Noise, Digital Hygiene, Economy Wake-Up, Systemic Exposure, Revelations — these tools help you identify and remove the programming you didn't consent to.",
                tips: ["Start with Revelations to see how apps track you", "Signal vs Noise trains media discernment", "Unlearn is designed for daily use"]
            ),
            TutorialPage(
                icon: "gearshape.fill",
                title: "Settings & Customization",
                description: "Tap the gear icon ⚙️ at the top right anytime to access Settings, voice preferences, notifications, and app configuration. Everything personalizable is one tap away.",
                tips: ["Change narration voice in Voice Settings", "Toggle Food Consciousness in Feature Preferences", "Send feedback directly from Settings"]
            )
        ],
        accentColor: Color(hex: "#00D9FF")
    )

    static let flowState = ModuleTutorialContent(
        id: "flowState",
        title: "Flow State",
        subtitle: "Optimize Your Consciousness",
        pages: [
            TutorialPage(
                icon: "waveform.path.ecg.rectangle.fill",
                title: "Enter the Flow",
                description: "Flow State helps you optimize your daily rhythms, eliminate distractions, and enter states of peak performance and presence.",
                tips: ["Complete the initial setup", "Sync with your calendar", "Enable focus mode notifications"]
            ),
            TutorialPage(
                icon: "brain.head.profile.fill",
                title: "Distraction Audit",
                description: "Modern life is designed to fragment your attention. The Distraction Audit helps you identify and eliminate the inputs that keep you unconscious.",
                tips: ["Be honest in your audit", "Start with one distraction at a time", "Replace—don't just remove"]
            )
        ],
        accentColor: Color(hex: "#4CAF50")
    )
}

// MARK: - Module Tutorial Sheet View

struct ModuleTutorialSheet: View {
    let content: ModuleTutorialContent
    @Binding var isPresented: Bool
    @State private var currentPage = 0
    @StateObject private var tutorialManager = ModuleTutorialManager.shared
    
    var body: some View {
        ZStack {
            // Background
            LinearGradient(
                colors: [
                    Color(hex: "#0a0a1a"),
                    content.accentColor.opacity(0.1),
                    Color(hex: "#0a0a1a")
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Header
                headerSection
                
                // Page content
                TabView(selection: $currentPage) {
                    ForEach(content.pages.indices, id: \.self) { index in
                        ModuleTutorialPageView(
                            page: content.pages[index],
                            accentColor: content.accentColor
                        )
                        .tag(index)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                
                // Footer
                footerSection
            }
        }
    }
    
    private var headerSection: some View {
        VStack(spacing: 12) {
            // Close button
            HStack {
                Spacer()
                Button {
                    tutorialManager.markTutorialSeen(for: content.id)
                    isPresented = false
                } label: {
                    ZStack {
                        Circle()
                            .fill(Color.white.opacity(0.1))
                            .frame(width: 36, height: 36)
                        
                        Image(systemName: "xmark")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.white.opacity(0.6))
                    }
                }
            }
            .padding(.horizontal)
            .padding(.top, 12)
            
            // Module title with cosmic styling
            VStack(spacing: 6) {
                Text(content.title.uppercased())
                    .font(.system(size: 32, weight: .bold, design: .rounded))
                    .foregroundStyle(
                        LinearGradient(
                            colors: [.white, .white.opacity(0.9)],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .shadow(color: content.accentColor.opacity(0.3), radius: 10)
                
                Text(content.subtitle)
                    .font(.system(size: 14, weight: .semibold, design: .rounded))
                    .foregroundColor(content.accentColor)
                    .tracking(1)
            }
            
            // Page indicators with cosmic styling
            HStack(spacing: 8) {
                ForEach(content.pages.indices, id: \.self) { index in
                    Capsule()
                        .fill(currentPage == index ? content.accentColor : Color.white.opacity(0.2))
                        .frame(width: currentPage == index ? 28 : 8, height: 8)
                        .shadow(color: currentPage == index ? content.accentColor.opacity(0.5) : .clear, radius: 4)
                        .animation(.spring(response: 0.35, dampingFraction: 0.8), value: currentPage)
                }
            }
            .padding(.top, 20)
        }
    }
    
    private var footerSection: some View {
        VStack(spacing: 16) {
            // Navigation buttons
            HStack(spacing: 12) {
                if currentPage > 0 {
                    Button {
                        withAnimation(.spring(response: 0.35, dampingFraction: 0.8)) {
                            currentPage -= 1
                        }
                    } label: {
                        HStack(spacing: 8) {
                            Image(systemName: "chevron.left")
                                .font(.system(size: 14, weight: .semibold))
                            Text("Back")
                                .font(.system(size: 15, weight: .semibold, design: .rounded))
                        }
                        .foregroundColor(.white.opacity(0.8))
                        .padding(.vertical, 16)
                        .frame(maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 14, style: .continuous)
                                .fill(Color.white.opacity(0.08))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 14, style: .continuous)
                                        .stroke(Color.white.opacity(0.15), lineWidth: 1)
                                )
                        )
                    }
                }
                
                Button {
                    if currentPage < content.pages.count - 1 {
                        withAnimation(.spring(response: 0.35, dampingFraction: 0.8)) {
                            currentPage += 1
                        }
                    } else {
                        tutorialManager.markTutorialSeen(for: content.id)
                        isPresented = false
                    }
                } label: {
                    HStack(spacing: 8) {
                        Text(currentPage < content.pages.count - 1 ? "Next" : "Get Started")
                            .font(.system(size: 16, weight: .bold, design: .rounded))
                        if currentPage < content.pages.count - 1 {
                            Image(systemName: "chevron.right")
                                .font(.system(size: 14, weight: .bold))
                        } else {
                            Image(systemName: "sparkles")
                                .font(.system(size: 14, weight: .bold))
                        }
                    }
                    .foregroundColor(.black)
                    .padding(.vertical, 16)
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 14, style: .continuous)
                            .fill(content.accentColor)
                            .shadow(color: content.accentColor.opacity(0.4), radius: 8, y: 4)
                    )
                }
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 30)
        }
    }
}

// MARK: - Tutorial Page View

struct ModuleTutorialPageView: View {
    let page: ModuleTutorialContent.TutorialPage
    let accentColor: Color
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                Spacer(minLength: 20)
                
                // Cosmic Icon with enhanced glow
                ZStack {
                    // Outer glow ring
                    Circle()
                        .fill(
                            RadialGradient(
                                colors: [accentColor.opacity(0.3), accentColor.opacity(0)],
                                center: .center,
                                startRadius: 40,
                                endRadius: 80
                            )
                        )
                        .frame(width: 160, height: 160)
                    
                    // Middle ring
                    Circle()
                        .fill(accentColor.opacity(0.15))
                        .frame(width: 120, height: 120)
                    
                    // Inner circle
                    Circle()
                        .fill(
                            LinearGradient(
                                colors: [accentColor.opacity(0.25), accentColor.opacity(0.1)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 100, height: 100)
                        .overlay(
                            Circle()
                                .stroke(accentColor.opacity(0.4), lineWidth: 1)
                        )
                    
                    // Icon with gradient
                    Image(systemName: page.icon)
                        .font(.system(size: 45, weight: .semibold))
                        .foregroundStyle(
                            LinearGradient(
                                colors: [accentColor, accentColor.opacity(0.7)],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .shadow(color: accentColor.opacity(0.5), radius: 10)
                }
                
                // Title with better contrast
                Text(page.title)
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .shadow(color: .black.opacity(0.3), radius: 2, y: 1)
                
                // Description with better readability
                Text(page.description)
                    .font(.system(size: 15, weight: .medium, design: .rounded))
                    .foregroundColor(.white.opacity(0.85))
                    .multilineTextAlignment(.center)
                    .lineSpacing(4)
                    .padding(.horizontal, 30)
                
                // Tips with improved styling
                VStack(alignment: .leading, spacing: 14) {
                    ForEach(page.tips, id: \.self) { tip in
                        HStack(alignment: .top, spacing: 12) {
                            // Cosmic checkmark
                            ZStack {
                                Circle()
                                    .fill(accentColor.opacity(0.2))
                                    .frame(width: 24, height: 24)
                                
                                Image(systemName: "checkmark")
                                    .font(.system(size: 12, weight: .bold))
                                    .foregroundColor(accentColor)
                            }
                            
                            Text(tip)
                                .font(.system(size: 14, weight: .medium, design: .rounded))
                                .foregroundColor(.white.opacity(0.85))
                                .fixedSize(horizontal: false, vertical: true)
                        }
                    }
                }
                .padding(18)
                .background(
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .fill(Color.white.opacity(0.06))
                        .overlay(
                            RoundedRectangle(cornerRadius: 16, style: .continuous)
                                .stroke(accentColor.opacity(0.2), lineWidth: 1)
                        )
                )
                .padding(.horizontal, 20)
                
                Spacer(minLength: 100)
            }
        }
    }
}

// MARK: - View Modifier for Easy Integration

struct ModuleTutorialModifier: ViewModifier {
    let content: ModuleTutorialContent
    @State private var showTutorial = false
    @StateObject private var tutorialManager = ModuleTutorialManager.shared
    
    func body(content: Content) -> some View {
        content
            .onAppear {
                if !tutorialManager.hasSeenTutorial(for: self.content.id) {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        showTutorial = true
                    }
                }
            }
            .sheet(isPresented: $showTutorial) {
                ModuleTutorialSheet(content: self.content, isPresented: $showTutorial)
            }
    }
}

extension View {
    func withModuleTutorial(_ content: ModuleTutorialContent) -> some View {
        modifier(ModuleTutorialModifier(content: content))
    }
}

// MARK: - Preview

#Preview {
    ModuleTutorialSheet(
        content: .awakening,
        isPresented: .constant(true)
    )
}
