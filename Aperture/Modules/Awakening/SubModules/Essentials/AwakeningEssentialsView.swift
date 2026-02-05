// AwakeningEssentialsView.swift
// Timeless Wisdom for Your Inner Upgrade
// The core philosophy introduction for Aperture's Awakening module

import SwiftUI

// MARK: - Awakening Essentials Data

struct AwakeningEssential: Identifiable {
    let id = UUID()
    let number: Int
    let title: String
    let content: String
    let icon: String
    let reflection: String?
}

struct AwakeningEssentialsContent {
    
    // MARK: - Intro
    
    static let introTitle = "Awakening Essentials"
    static let introSubtitle = "Timeless Wisdom for Your Inner Upgrade"
    
    static let introParagraph = """
You're not just a human stumbling through a spiritual side quest—you're pure consciousness borrowing a human avatar for this level of the game. Your body? Advanced tech on temporary loan from the cosmos, often mistaken for the real "you."

This draws from ancient insights like the Emerald Tablets, attributed to a wisdom keeper known across cultures: Tahuti to some Africans, Thoth to the Greeks, Hermes to alchemists, and similar figures in Hindu, Buddhist, Olmec, and Mayan traditions.

These ideas, potentially dating back 36,000–40,000 years, outlast trends because universal truths don't have expiration dates. As the sage put it: "Just as my knowledge elevates me, your growing awareness will make you a guiding light for those who follow."

Ready to level up? Here's the core download, broken into digestible insights. Each one builds on the last, inviting you to experiment and see what resonates.
"""
    
    // MARK: - Core Lessons (1-10)
    
    static let coreLessons: [AwakeningEssential] = [
        AwakeningEssential(
            number: 1,
            title: "Consciousness Comes First",
            content: "Your mind isn't trapped in your body—it's the other way around. Like water in a glass, your essence stays the same no matter the container.",
            icon: "brain.head.profile",
            reflection: "What if you tuned into that unchanging core amid daily chaos?"
        ),
        AwakeningEssential(
            number: 2,
            title: "Time as Cycles, Not Straight Lines",
            content: "Events aren't a one-way timeline; they're loops where you navigate from one moment to the next. Time holds things apart, but your awareness dances through it.",
            icon: "arrow.triangle.2.circlepath",
            reflection: "Ever notice how history rhymes? That's the cycle at work."
        ),
        AwakeningEssential(
            number: 3,
            title: "Death as a Shape-Shift",
            content: "Life's flame doesn't snuff out—it transforms. Why dread returning to your eternal state? It's like upgrading your software version.",
            icon: "flame.fill",
            reflection: nil
        ),
        AwakeningEssential(
            number: 4,
            title: "Energy Flows in Three Streams",
            content: "In your body, vital forces move through channels (think Ida, Pingala, and Sushumna in yoga traditions). Mastering them? That's biohacking your life force for peak performance.",
            icon: "waveform.path.ecg",
            reflection: nil
        ),
        AwakeningEssential(
            number: 5,
            title: "Balance Rules Everything",
            content: "The universe loves equilibrium. Chaos always settles into calm—your wild emotions included.",
            icon: "scale.3d",
            reflection: "How might leaning into balance smooth out your ride?"
        ),
        AwakeningEssential(
            number: 6,
            title: "Emotions Sculpt Reality",
            content: "Feelings aren't just vibes; they mold your world more than thoughts alone. Science calls it psychosomatic—ancient wisdom knew it first.",
            icon: "heart.fill",
            reflection: "What if you directed yours like a superpower?"
        ),
        AwakeningEssential(
            number: 7,
            title: "Inner Fire as Transformer",
            content: "A powerful energy simmers within, ready to reshape anything when channeled right. It's your built-in alchemy kit—waiting for activation.",
            icon: "bolt.fill",
            reflection: nil
        ),
        AwakeningEssential(
            number: 8,
            title: "Knowledge Needs Action",
            content: "Understanding is great, but embodiment is gold. Don't be the expert who knows but never does—like a chef who only reads recipes.",
            icon: "figure.walk",
            reflection: nil
        ),
        AwakeningEssential(
            number: 9,
            title: "Light as Ultimate Order",
            content: "Light symbolizes harmony; darkness is just temporary mess. Your role? Turn chaos into clarity, inside and out.",
            icon: "sun.max.fill",
            reflection: "Feels familiar in our info-saturated world, right?"
        ),
        AwakeningEssential(
            number: 10,
            title: "Unity Behind Duality",
            content: "Light and dark stem from the same source. Embracing that oneness dissolves fear.",
            icon: "yin.yang",
            reflection: "What shadows in your life might actually be allies?"
        )
    ]
    
    // MARK: - Advanced Lessons (11-20)
    
    static let advancedLessons: [AwakeningEssential] = [
        AwakeningEssential(
            number: 11,
            title: "Reality as Vibration",
            content: "Everything's frequency. Your consciousness tunes the dial. Quantum physics echoes this—tune higher, and reality shifts.",
            icon: "waveform",
            reflection: nil
        ),
        AwakeningEssential(
            number: 12,
            title: "The Word Weaves Order",
            content: "Primordial sound organizes chaos. Try affirmations or mantras—they're vibrational tools to align with the whole. Your voice? A creation wand.",
            icon: "text.bubble.fill",
            reflection: nil
        ),
        AwakeningEssential(
            number: 13,
            title: "Space Curves for Freedom",
            content: "Navigate curves, not sharp angles, for flow. Einstein proved it mathematically; experience it through mindful movement.",
            icon: "circle.grid.cross",
            reflection: nil
        ),
        AwakeningEssential(
            number: 14,
            title: "Polarity Hack for Vitality",
            content: "Balance energies daily—lie north-facing for an hour, then south. Simple? Profoundly so.",
            icon: "location.north.fill",
            reflection: "Test it and feel the recharge."
        ),
        AwakeningEssential(
            number: 15,
            title: "Earth as Living Partner",
            content: "The planet's alive, sharing your life force. You're not on Earth—you're of it, in symbiosis.",
            icon: "globe.americas.fill",
            reflection: "How does that change your eco-footprint?"
        ),
        AwakeningEssential(
            number: 16,
            title: "The Flower of Life Grid",
            content: "A sacred pattern links all things in conscious unity. It's the blueprint for geometry that connects atoms to galaxies.",
            icon: "hexagon.fill",
            reflection: nil
        ),
        AwakeningEssential(
            number: 17,
            title: "Your Growth Fuels the Cosmos",
            content: "Personal upgrades ripple universally. Skeptical about one person's impact? Think of a single cell sparking body-wide change.",
            icon: "sparkles",
            reflection: nil
        ),
        AwakeningEssential(
            number: 18,
            title: "Souls Evolve in Waves",
            content: "Growth expands and contracts, like breathing. \"Setbacks\" are setups for bigger leaps.",
            icon: "water.waves",
            reflection: "What's contracting in you right now?"
        ),
        AwakeningEssential(
            number: 19,
            title: "Nine Dimensions of Reality",
            content: "The cosmos layers in nine realms, each with unique rules. String theory nods to this—explore through meditation.",
            icon: "cube.transparent",
            reflection: nil
        ),
        AwakeningEssential(
            number: 20,
            title: "Heart Over Head",
            content: "Intellect analyzes; the heart intuitively knows.",
            icon: "heart.text.square",
            reflection: "Which lesson here tugs at your intuition most? That's your growth edge."
        )
    ]
    
    // MARK: - Mastery Lessons (21-35)
    
    static let masteryLessons: [AwakeningEssential] = [
        AwakeningEssential(
            number: 21,
            title: "Body Beyond Limits",
            content: "Manipulate energy to push physical boundaries. Athletes do it intuitively; you can do it consciously.",
            icon: "figure.strengthtraining.traditional",
            reflection: nil
        ),
        AwakeningEssential(
            number: 22,
            title: "Pyramids as Portals",
            content: "These aren't just tombs—they encode cosmic math, potentially as gateways. Precision like that? No accident.",
            icon: "pyramid.fill",
            reflection: nil
        ),
        AwakeningEssential(
            number: 23,
            title: "Halls of Transition",
            content: "Realms beyond the physical, accessed vibrationally. Multi-dimensional living awaits.",
            icon: "door.left.hand.open",
            reflection: nil
        ),
        AwakeningEssential(
            number: 24,
            title: "Memory Through Transitions",
            content: "Focus awareness (between eyebrows) to carry soul wisdom across changes. Ancient texts across cultures agree.",
            icon: "eye.fill",
            reflection: nil
        ),
        AwakeningEssential(
            number: 25,
            title: "Dissolve Barriers",
            content: "Advanced techniques melt dimensional walls. Meditation's the starter pack.",
            icon: "square.3.layers.3d.down.left",
            reflection: nil
        ),
        AwakeningEssential(
            number: 26,
            title: "Speech as Creator",
            content: "Words vibrate reality into form. Mind your language.",
            icon: "quote.bubble.fill",
            reflection: "What are you manifesting?"
        ),
        AwakeningEssential(
            number: 27,
            title: "Service Speeds Growth",
            content: "Giving expands you; hoarding shrinks. Generosity? Your evolution accelerator.",
            icon: "hand.raised.fill",
            reflection: nil
        ),
        AwakeningEssential(
            number: 28,
            title: "Freedom from Within",
            content: "Master self, not situations. External control's a myth; inner command's the key.",
            icon: "key.fill",
            reflection: nil
        ),
        AwakeningEssential(
            number: 29,
            title: "Creation from Potential",
            content: "All \"new\" things remix eternal elements. Infinite possibilities already exist in consciousness.",
            icon: "infinity",
            reflection: nil
        ),
        AwakeningEssential(
            number: 30,
            title: "Power + Wisdom = Harmony",
            content: "Strength needs ethics, or it backfires. Balance them for true impact.",
            icon: "equal.circle.fill",
            reflection: nil
        ),
        AwakeningEssential(
            number: 31,
            title: "Lost Peaks of Civilization",
            content: "Ancients tapped star wisdom beyond our grasp. Are we rediscovering or reinventing? Direction matters.",
            icon: "star.fill",
            reflection: nil
        ),
        AwakeningEssential(
            number: 32,
            title: "Unbound by Illusion",
            content: "Recognize limits as mental—the door's open; step through old habits.",
            icon: "lock.open.fill",
            reflection: nil
        ),
        AwakeningEssential(
            number: 33,
            title: "Beyond Words",
            content: "Ultimate truth is experiential. These pointers? Just signposts to direct knowing.",
            icon: "ellipsis.circle.fill",
            reflection: nil
        ),
        AwakeningEssential(
            number: 34,
            title: "Your Wisdom's Legacy",
            content: "Grow enough, and you're god-like to those after.",
            icon: "person.3.fill",
            reflection: "With great potential comes great responsibility—what's yours?"
        ),
        AwakeningEssential(
            number: 35,
            title: "Cyclic Rediscovery",
            content: "Knowledge ebbs and flows across eras. Souls journey onward, possibly seeding new worlds.",
            icon: "arrow.3.trianglepath",
            reflection: "Mind-bending, huh?"
        )
    ]
    
    // MARK: - Cosmic Overseers
    
    static let cosmicOverseers: [(name: String, number: Int, description: String, icon: String)] = [
        ("The Binder", 3, "Manages shadows and transitions—necessary resistance for growth. Darkness births light.", "moon.fill"),
        ("The Awakener", 4, "Liberates life force, expanding possibilities with radiant energy.", "sunrise.fill"),
        ("The Patterner", 5, "Weaves reality via sound and vibration—your words and songs shape worlds.", "waveform.circle.fill"),
        ("The Illuminator", 6, "Guides through uncertainty, revealing inner light in all.", "lightbulb.fill"),
        ("The Expander", 7, "Masters space-time cycles, connecting realities.", "arrow.up.left.and.arrow.down.right"),
        ("The Balancer", 8, "Ensures harmonious progress, weighing actions for equilibrium.", "scale.3d"),
        ("The Source", 9, "Formless origin of all—pure potential beyond duality.", "circle.dotted")
    ]
    
    static let cosmicOutro = """
These aren't distant deities; they're qualities within you. Practice attuning through meditation and mindful awareness, and you'll embody them, guiding your path like the sages once did.

Curious for more? Dive deeper in the modules—experiments, modern connections, and community insights await.

What sparks your next upgrade?
"""
    
    // MARK: - All Paragraphs for Narration
    
    static var allParagraphsForNarration: [String] {
        var paragraphs: [String] = []
        
        // Intro
        paragraphs.append(introParagraph)
        
        // Core lessons
        for lesson in coreLessons {
            var text = "\(lesson.title). \(lesson.content)"
            if let reflection = lesson.reflection {
                text += " \(reflection)"
            }
            paragraphs.append(text)
        }
        
        // Advanced lessons
        for lesson in advancedLessons {
            var text = "\(lesson.title). \(lesson.content)"
            if let reflection = lesson.reflection {
                text += " \(reflection)"
            }
            paragraphs.append(text)
        }
        
        // Mastery lessons
        for lesson in masteryLessons {
            var text = "\(lesson.title). \(lesson.content)"
            if let reflection = lesson.reflection {
                text += " \(reflection)"
            }
            paragraphs.append(text)
        }
        
        // Cosmic overseers
        for overseer in cosmicOverseers {
            paragraphs.append("\(overseer.name). \(overseer.description)")
        }
        
        paragraphs.append(cosmicOutro)
        
        return paragraphs
    }
}

// MARK: - Awakening Essentials View

struct AwakeningEssentialsView: View {
    
    @Environment(\.dismiss) private var dismiss
    @ObservedObject private var tts = TextToSpeechManager.shared
    
    @State private var expandedSection: String? = "core"
    @State private var showingVoiceSettings = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Background
                LinearGradient(
                    colors: [
                        Color(hex: "#0a0a1a"),
                        Color(hex: "#1a0a2e"),
                        Color(hex: "#0a1a2a")
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 32) {
                        
                        // Hero Header
                        heroHeader
                        
                        // Narration Controls
                        narrationSection
                        
                        // Introduction
                        introSection
                        
                        // Core Lessons (1-10)
                        lessonsSection(
                            title: "Core Principles",
                            subtitle: "The Foundation",
                            lessons: AwakeningEssentialsContent.coreLessons,
                            sectionId: "core",
                            gradient: [Palette.accent.gold, .orange]
                        )
                        
                        // Advanced Lessons (11-20)
                        lessonsSection(
                            title: "Deepening Understanding",
                            subtitle: "Expanding Awareness",
                            lessons: AwakeningEssentialsContent.advancedLessons,
                            sectionId: "advanced",
                            gradient: [Palette.primary.cyan, Palette.primary.blue]
                        )
                        
                        // Mastery Lessons (21-35)
                        lessonsSection(
                            title: "Mastery Insights",
                            subtitle: "Advanced Wisdom",
                            lessons: AwakeningEssentialsContent.masteryLessons,
                            sectionId: "mastery",
                            gradient: [Palette.primary.violet, .purple]
                        )
                        
                        // Cosmic Overseers
                        cosmicOverseersSection
                        
                        // Call to Action
                        ctaSection
                        
                        Spacer(minLength: 100)
                    }
                    .padding(.top, 20)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingVoiceSettings = true
                    } label: {
                        Image(systemName: "speaker.wave.2.fill")
                            .foregroundColor(Palette.accent.gold)
                    }
                }
            }
            .sheet(isPresented: $showingVoiceSettings) {
                NarrationControlSheet()
                    .presentationDetents([.height(200)])
            }
        }
        .onDisappear {
            if tts.isSpeaking {
                tts.stop()
            }
        }
    }
    
    // MARK: - Hero Header
    
    private var heroHeader: some View {
        VStack(spacing: 16) {
            // Icon
            ZStack {
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [Palette.accent.gold.opacity(0.3), .clear],
                            center: .center,
                            startRadius: 0,
                            endRadius: 80
                        )
                    )
                    .frame(width: 120, height: 120)
                
                Image(systemName: "eye.fill")
                    .font(.system(size: 44))
                    .foregroundStyle(
                        LinearGradient(
                            colors: [Palette.accent.gold, .orange],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
            }
            
            Text(AwakeningEssentialsContent.introTitle)
                .font(.system(size: 28, weight: .bold))
                .foregroundColor(.white)
            
            Text(AwakeningEssentialsContent.introSubtitle)
                .font(.system(size: 16))
                .foregroundColor(Palette.accent.gold)
        }
        .padding(.horizontal)
    }
    
    // MARK: - Narration Section
    
    private var narrationSection: some View {
        VStack(spacing: 12) {
            Button {
                HapticManager.shared.medium()
                if tts.isSpeaking {
                    tts.togglePlayPause()
                } else {
                    tts.speakParagraphs(AwakeningEssentialsContent.allParagraphsForNarration)
                }
            } label: {
                HStack(spacing: 12) {
                    Image(systemName: tts.isSpeaking && !tts.isPaused ? "pause.circle.fill" : "play.circle.fill")
                        .font(.system(size: 28))
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text(tts.isSpeaking ? (tts.isPaused ? "Paused" : "Now Playing") : "Listen to Full Guide")
                            .font(.system(size: 15, weight: .semibold))
                        
                        Text(tts.isSpeaking ? "\(Int(tts.progress * 100))% complete • ~20 min" : "Audio narration • ~20 min")
                            .font(.system(size: 12))
                            .foregroundColor(.white.opacity(0.7))
                    }
                    
                    Spacer()
                    
                    if tts.isSpeaking {
                        // Mini waveform animation
                        HStack(spacing: 2) {
                            ForEach(0..<4, id: \.self) { i in
                                Capsule()
                                    .fill(Palette.accent.gold)
                                    .frame(width: 3, height: tts.isPaused ? 8 : CGFloat.random(in: 8...20))
                                    .animation(.easeInOut(duration: 0.3).repeatForever(autoreverses: true).delay(Double(i) * 0.1), value: tts.isPaused)
                            }
                        }
                    }
                }
                .foregroundColor(.white)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 16)
                        .fill(
                            LinearGradient(
                                colors: [Palette.accent.gold.opacity(0.2), Palette.accent.gold.opacity(0.1)],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Palette.accent.gold.opacity(0.3), lineWidth: 1)
                        )
                )
            }
            
            if tts.isSpeaking {
                // Progress bar
                GeometryReader { geo in
                    ZStack(alignment: .leading) {
                        Capsule()
                            .fill(Color.white.opacity(0.1))
                        
                        Capsule()
                            .fill(Palette.accent.gold)
                            .frame(width: geo.size.width * tts.progress)
                    }
                }
                .frame(height: 4)
                .padding(.horizontal, 4)
            }
        }
        .padding(.horizontal)
    }
    
    // MARK: - Introduction Section
    
    private var introSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(AwakeningEssentialsContent.introParagraph)
                .font(.system(size: 15))
                .foregroundColor(.white.opacity(0.9))
                .lineSpacing(6)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white.opacity(0.05))
        )
        .padding(.horizontal)
    }
    
    // MARK: - Lessons Section
    
    private func lessonsSection(
        title: String,
        subtitle: String,
        lessons: [AwakeningEssential],
        sectionId: String,
        gradient: [Color]
    ) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            // Header
            Button {
                withAnimation(.spring(response: 0.3)) {
                    expandedSection = expandedSection == sectionId ? nil : sectionId
                }
                HapticManager.shared.light()
            } label: {
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(title)
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.white)
                        
                        Text(subtitle)
                            .font(.system(size: 13))
                            .foregroundStyle(
                                LinearGradient(colors: gradient, startPoint: .leading, endPoint: .trailing)
                            )
                    }
                    
                    Spacer()
                    
                    Image(systemName: expandedSection == sectionId ? "chevron.up" : "chevron.down")
                        .foregroundColor(.gray)
                        .font(.system(size: 14, weight: .medium))
                }
            }
            .padding(.horizontal)
            
            // Lessons
            if expandedSection == sectionId {
                VStack(spacing: 12) {
                    ForEach(lessons) { lesson in
                        EssentialsLessonCard(lesson: lesson, accentGradient: gradient)
                    }
                }
                .padding(.horizontal)
                .transition(.opacity.combined(with: .move(edge: .top)))
            }
        }
    }
    
    // MARK: - Cosmic Overseers Section
    
    private var cosmicOverseersSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("The Cosmic Principles")
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.white)
                .padding(.horizontal)
            
            Text("Universal forces that are also qualities within you")
                .font(.system(size: 13))
                .foregroundColor(.gray)
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(AwakeningEssentialsContent.cosmicOverseers, id: \.number) { overseer in
                        CosmicOverseerCard(
                            name: overseer.name,
                            number: overseer.number,
                            description: overseer.description,
                            icon: overseer.icon
                        )
                    }
                }
                .padding(.horizontal)
            }
            
            Text(AwakeningEssentialsContent.cosmicOutro)
                .font(.system(size: 14))
                .foregroundColor(.white.opacity(0.8))
                .lineSpacing(5)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.white.opacity(0.03))
                )
                .padding(.horizontal)
        }
    }
    
    // MARK: - CTA Section
    
    private var ctaSection: some View {
        VStack(spacing: 16) {
            Text("Ready to Begin Your Journey?")
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.white)
            
            Button {
                HapticManager.shared.medium()
                dismiss()
            } label: {
                Text("Explore the Awakening Module")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
                    .background(
                        LinearGradient(
                            colors: [Palette.accent.gold, .orange],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .cornerRadius(14)
            }
            .padding(.horizontal)
        }
        .padding(.top, 20)
    }
}

// MARK: - Lesson Card

struct EssentialsLessonCard: View {
    
    let lesson: AwakeningEssential
    let accentGradient: [Color]
    
    @State private var isExpanded = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Button {
                withAnimation(.spring(response: 0.3)) {
                    isExpanded.toggle()
                }
                HapticManager.shared.light()
            } label: {
                HStack(spacing: 12) {
                    // Number badge
                    ZStack {
                        Circle()
                            .fill(
                                LinearGradient(
                                    colors: accentGradient.map { $0.opacity(0.2) },
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .frame(width: 36, height: 36)
                        
                        Text("\(lesson.number)")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundStyle(
                                LinearGradient(colors: accentGradient, startPoint: .top, endPoint: .bottom)
                            )
                    }
                    
                    // Title
                    Text(lesson.title)
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                    
                    Spacer()
                    
                    // Icon
                    Image(systemName: lesson.icon)
                        .font(.system(size: 16))
                        .foregroundStyle(
                            LinearGradient(colors: accentGradient, startPoint: .top, endPoint: .bottom)
                        )
                }
            }
            
            if isExpanded {
                VStack(alignment: .leading, spacing: 8) {
                    Text(lesson.content)
                        .font(.system(size: 14))
                        .foregroundColor(.white.opacity(0.85))
                        .lineSpacing(4)
                    
                    if let reflection = lesson.reflection {
                        Text(reflection)
                            .font(.system(size: 13, weight: .medium))
                            .foregroundStyle(
                                LinearGradient(colors: accentGradient, startPoint: .leading, endPoint: .trailing)
                            )
                            .italic()
                            .padding(.top, 4)
                    }
                    
                    // Mini narration button
                    NarrationButton(text: "\(lesson.title). \(lesson.content) \(lesson.reflection ?? "")")
                        .padding(.top, 4)
                }
                .padding(.leading, 48)
                .transition(.opacity.combined(with: .move(edge: .top)))
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 14)
                .fill(Color.white.opacity(0.05))
        )
    }
}

// MARK: - Cosmic Overseer Card

struct CosmicOverseerCard: View {
    
    let name: String
    let number: Int
    let description: String
    let icon: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: icon)
                    .font(.system(size: 20))
                    .foregroundColor(Palette.primary.violet)
                
                Spacer()
                
                Text("\(number)")
                    .font(.system(size: 12, weight: .bold))
                    .foregroundColor(Palette.primary.violet)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(
                        Capsule()
                            .fill(Palette.primary.violet.opacity(0.2))
                    )
            }
            
            Text(name)
                .font(.system(size: 15, weight: .bold))
                .foregroundColor(.white)
            
            Text(description)
                .font(.system(size: 12))
                .foregroundColor(.white.opacity(0.7))
                .lineSpacing(3)
        }
        .frame(width: 180)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 14)
                .fill(
                    LinearGradient(
                        colors: [Palette.primary.violet.opacity(0.15), Color.clear],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 14)
                        .stroke(Palette.primary.violet.opacity(0.2), lineWidth: 1)
                )
        )
    }
}

// MARK: - First Visit Check

class AwakeningFirstVisitManager {
    static let shared = AwakeningFirstVisitManager()
    
    private let key = "awakening.hasSeenEssentials"
    
    var hasSeenEssentials: Bool {
        get { UserDefaults.standard.bool(forKey: key) }
        set { UserDefaults.standard.set(newValue, forKey: key) }
    }
    
    func markAsSeen() {
        hasSeenEssentials = true
    }
    
    func reset() {
        hasSeenEssentials = false
    }
}

// MARK: - Preview

#Preview("Awakening Essentials") {
    AwakeningEssentialsView()
}
