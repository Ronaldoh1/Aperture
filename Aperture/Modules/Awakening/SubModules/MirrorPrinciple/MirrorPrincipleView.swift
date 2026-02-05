// MirrorPrincipleView.swift
// The Mirror Principle - One of the most powerful universal laws
// "The outer world follows the inner world"

import SwiftUI

// MARK: - Main Mirror Principle View
struct MirrorPrincipleView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var selectedSection = 0
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Reflective gradient
                LinearGradient(
                    colors: [Color(hex: "0a0a1a"), Color(hex: "1a1a3a"), Color(hex: "0a0a1a")],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    Picker("Section", selection: $selectedSection) {
                        Text("Core").tag(0)
                        Text("3 Parts").tag(1)
                        Text("Player").tag(2)
                        Text("Practice").tag(3)
                    }
                    .pickerStyle(.segmented)
                    .padding()
                    
                    TabView(selection: $selectedSection) {
                        coreConceptSection.tag(0)
                        threePartBeingSection.tag(1)
                        playerVsCharacterSection.tag(2)
                        practiceSection.tag(3)
                    }
                    .tabViewStyle(.page(indexDisplayMode: .never))
                }
            }
            .navigationTitle("🪞 Mirror Principle")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") { dismiss() }
                        .foregroundStyle(Color(hex: "9B59B6"))
                }
            }
        }
    }
    
    // MARK: - Core Concept Section
    private var coreConceptSection: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Header
                VStack(spacing: 12) {
                    Text("🪞")
                        .font(.system(size: 60))
                    
                    Text("The Mirror Principle")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                    
                    Text("One of the most powerful universal laws you've never been taught")
                        .font(.subheadline)
                        .foregroundStyle(.white.opacity(0.7))
                        .multilineTextAlignment(.center)
                }
                .padding(.vertical, 20)
                
                // The Truth Bomb
                VStack(alignment: .leading, spacing: 12) {
                    Text("💣 THE TRUTH")
                        .font(.caption)
                        .foregroundStyle(Color(hex: "E74C3C"))
                        .tracking(2)
                    
                    Text("You've been lied to about how life and reality works.")
                        .font(.headline)
                        .foregroundStyle(.white)
                    
                    Text("You were taught to fight the world, to hustle and grind, to try and fix everything around you in order to succeed. But what if the life you are living right now isn't life at all—it is merely a REFLECTION?")
                        .font(.body)
                        .foregroundStyle(.white.opacity(0.9))
                        .lineSpacing(4)
                }
                .padding()
                .background(Color(hex: "E74C3C").opacity(0.1))
                .cornerRadius(12)
                
                // Core Principle
                VStack(alignment: .leading, spacing: 16) {
                    Text("🔮 THE CORE PRINCIPLE")
                        .font(.caption)
                        .foregroundStyle(Color(hex: "9B59B6"))
                        .tracking(2)
                    
                    HStack {
                        Spacer()
                        Text("\"The Outer World Follows The Inner World\"")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundStyle(Color(hex: "9B59B6"))
                            .multilineTextAlignment(.center)
                        Spacer()
                    }
                    
                    Text("Everything you're experiencing—your relationships, your bank account, your struggles, your successes—is showing you YOU. The mirror is not random circumstances, not punishment, not luck. It's a reflection of your internal state.")
                        .font(.body)
                        .foregroundStyle(.white.opacity(0.9))
                        .lineSpacing(4)
                }
                .padding()
                .background(Color(hex: "9B59B6").opacity(0.1))
                .cornerRadius(12)
                
                // Elite Secret
                VStack(alignment: .leading, spacing: 12) {
                    Text("👁️ THE ELITE SECRET")
                        .font(.caption)
                        .foregroundStyle(Color(hex: "FFD700"))
                        .tracking(2)
                    
                    Text("The people in power—the so-called elites—were taught these things at a very young age. They were shown this through example as babies and learned it systematically as they got older. They were taught how to WORK WITH the mirror, not fight it.")
                        .font(.body)
                        .foregroundStyle(.white.opacity(0.9))
                        .lineSpacing(4)
                    
                    Text("Most people spend their lives trying to fix the reflection, not realizing that it's their internal state—their beliefs, their frequency, their perception—that's shaping what they see.")
                        .font(.body)
                        .foregroundStyle(.white.opacity(0.9))
                        .lineSpacing(4)
                }
                .padding()
                .background(Color(hex: "FFD700").opacity(0.1))
                .cornerRadius(12)
                
                // Scientific Basis
                VStack(alignment: .leading, spacing: 16) {
                    Text("⚛️ THE SCIENCE")
                        .font(.caption)
                        .foregroundStyle(Color(hex: "00D4FF"))
                        .tracking(2)
                    
                    scienceCard(
                        stat: "99.9999%",
                        title: "Empty Space/Energy",
                        desc: "The atom—building block of everything physical—is made of 99.9999% empty space or energy"
                    )
                    
                    scienceCard(
                        stat: "0.00001%",
                        title: "Physical Matter",
                        desc: "Only this tiny fraction is actual physical matter. Everything 'physical' is made of things that cannot be regarded as physical."
                    )
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("\"If you removed all empty space and energy from everyone on Earth (8 billion people), you would only have enough physical stuff to fit within a tiny sugar cube.\"")
                            .font(.caption)
                            .italic()
                            .foregroundStyle(.white.opacity(0.8))
                        
                        Text("— Max Planck: \"Consciousness is fundamental. Physical matter is derivative of consciousness.\"")
                            .font(.caption)
                            .foregroundStyle(Color(hex: "00D4FF"))
                    }
                }
                .padding()
                .background(Color(hex: "00D4FF").opacity(0.1))
                .cornerRadius(12)
                
                // Key Insight
                keyInsightCard(
                    text: "You don't get what you WANT. You get who you ARE.",
                    subtext: "Your physical world is an 'energetic history'—the accumulation of whatever energy you've been dwelling in over weeks and months."
                )
                
                Spacer(minLength: 50)
            }
            .padding(.horizontal, 20)
        }
    }
    
    // MARK: - Three-Part Being Section
    private var threePartBeingSection: some View {
        ScrollView {
            VStack(spacing: 24) {
                Text("👤 YOUR THREE-PART BEING")
                    .font(.caption)
                    .foregroundStyle(Color(hex: "9B59B6"))
                    .tracking(2)
                    .padding(.top, 20)
                
                // Diagram
                VStack(spacing: 16) {
                    partCard(
                        emoji: "✨",
                        title: "SPIRITUAL (Inner World)",
                        color: Color(hex: "9B59B6"),
                        points: [
                            "Your connection to Source/God/Infinite Intelligence",
                            "Your emotional self—energy in motion",
                            "What you FEEL activates this plane",
                            "Your direct line to something larger and more powerful"
                        ]
                    )
                    
                    Image(systemName: "arrow.down")
                        .font(.title2)
                        .foregroundStyle(.white.opacity(0.5))
                    
                    partCard(
                        emoji: "🧠",
                        title: "MENTAL (Inner World)",
                        color: Color(hex: "3498DB"),
                        points: [
                            "Your thoughts, imaginings, visualizations",
                            "Where beliefs and convictions form",
                            "Your daydreams and internal dialogue",
                            "Not physical, but leads to physical"
                        ]
                    )
                    
                    Image(systemName: "arrow.down")
                        .font(.title2)
                        .foregroundStyle(.white.opacity(0.5))
                    
                    partCard(
                        emoji: "🏃",
                        title: "PHYSICAL (Outer World)",
                        color: Color(hex: "27AE60"),
                        points: [
                            "Your physical existence—the reflection",
                            "Everything perceived with five senses",
                            "The 0.00001% that appears as matter",
                            "THE EFFECT, not the cause"
                        ]
                    )
                }
                
                // Advanced Cause & Effect
                VStack(alignment: .leading, spacing: 16) {
                    Text("⚡ ADVANCED CAUSE & EFFECT")
                        .font(.caption)
                        .foregroundStyle(Color(hex: "F39C12"))
                        .tracking(2)
                    
                    Text("Most people only understand cause and effect on the physical plane (push something → it moves). But cause and effect also works on higher planes:")
                        .font(.body)
                        .foregroundStyle(.white.opacity(0.9))
                    
                    VStack(alignment: .leading, spacing: 12) {
                        causeEffectRow(
                            cause: "Dwell in certain thoughts (Mental)",
                            effect: "Feel corresponding emotions (Spiritual)"
                        )
                        causeEffectRow(
                            cause: "Feel higher emotions (Spiritual)",
                            effect: "Physical reality shifts to match"
                        )
                        causeEffectRow(
                            cause: "Think negatively most of the time",
                            effect: "Physical world reflects that negativity"
                        )
                    }
                    
                    Text("This is why so many people's physical world is nowhere near where they want it to be. Their inner garden is overrun with weeds—negative thoughts, lower emotions like guilt, shame, fear, apathy, anger. Because that's where they're dwelling, that's what shows up in the mirror.")
                        .font(.caption)
                        .foregroundStyle(.white.opacity(0.7))
                }
                .padding()
                .background(Color(hex: "F39C12").opacity(0.1))
                .cornerRadius(12)
                
                // Polarity Principle
                VStack(alignment: .leading, spacing: 16) {
                    Text("📊 THE PRINCIPLE OF POLARITY")
                        .font(.caption)
                        .foregroundStyle(Color(hex: "9B59B6"))
                        .tracking(2)
                    
                    Text("Why does it take TIME for the mirror to change?")
                        .font(.headline)
                        .foregroundStyle(.white)
                    
                    Text("Imagine a pole with Spirit/Pure Energy at the top and grossest matter at the bottom. Everything exists somewhere on this pole—vibrating at different frequencies.")
                        .font(.body)
                        .foregroundStyle(.white.opacity(0.9))
                    
                    VStack(spacing: 8) {
                        polarityRow(level: "Spirit/Energy", position: "TOP", desc: "Highest vibration")
                        polarityRow(level: "Mental", position: "HIGH", desc: "Thoughts, ideas")
                        polarityRow(level: "Liquids", position: "MID", desc: "Slower vibration")
                        polarityRow(level: "Gross Matter", position: "BOTTOM", desc: "Slowest, densest")
                    }
                    
                    Text("Physical matter is denser, slower vibration. There needs to be concentrated energy flow for it to manifest. You must DWELL in a certain energy long enough for it to show up physically. There is a LAG TIME.")
                        .font(.caption)
                        .foregroundStyle(.white.opacity(0.7))
                }
                .padding()
                .background(Color(hex: "9B59B6").opacity(0.1))
                .cornerRadius(12)
                
                Spacer(minLength: 50)
            }
            .padding(.horizontal, 20)
        }
    }
    
    // MARK: - Player vs Character Section
    private var playerVsCharacterSection: some View {
        ScrollView {
            VStack(spacing: 24) {
                Text("🎮 PLAYER VS CHARACTER")
                    .font(.caption)
                    .foregroundStyle(Color(hex: "00D4FF"))
                    .tracking(2)
                    .padding(.top, 20)
                
                // Analogy
                VStack(alignment: .leading, spacing: 16) {
                    Text("Imagine life as a video game...")
                        .font(.headline)
                        .foregroundStyle(.white)
                    
                    HStack(alignment: .top, spacing: 20) {
                        // Character
                        VStack(spacing: 12) {
                            Text("🕹️")
                                .font(.system(size: 40))
                            Text("THE CHARACTER")
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundStyle(Color(hex: "E74C3C"))
                            
                            VStack(alignment: .leading, spacing: 8) {
                                characterPoint("Fully immersed in the game")
                                characterPoint("Doesn't know it's a game")
                                characterPoint("Believes everything is real")
                                characterPoint("Gets hooked & reactive")
                                characterPoint("Feels like a victim")
                                characterPoint("Connected to 0.00001%")
                            }
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(hex: "E74C3C").opacity(0.1))
                        .cornerRadius(12)
                        
                        // Player
                        VStack(spacing: 12) {
                            Text("👁️")
                                .font(.system(size: 40))
                            Text("THE PLAYER")
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundStyle(Color(hex: "27AE60"))
                            
                            VStack(alignment: .leading, spacing: 8) {
                                playerPoint("Behind the screen")
                                playerPoint("KNOWS it's a game")
                                playerPoint("Has higher perspective")
                                playerPoint("Can program the game")
                                playerPoint("Makes conscious choices")
                                playerPoint("Connected to 99.9999%")
                            }
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(hex: "27AE60").opacity(0.1))
                        .cornerRadius(12)
                    }
                }
                
                // Mario Analogy
                VStack(alignment: .leading, spacing: 12) {
                    Text("🍄 THE MARIO ANALOGY")
                        .font(.caption)
                        .foregroundStyle(Color(hex: "E74C3C"))
                        .tracking(2)
                    
                    Text("Mario in the game has no idea what to do. He doesn't know why turtles are coming at him. He doesn't know he can jump on blocks for coins and power-ups.")
                        .font(.body)
                        .foregroundStyle(.white.opacity(0.9))
                    
                    Text("But the PLAYER knows how to navigate. The player knows to jump on enemies, get the fireflower, collect upgrades, and advance through levels.")
                        .font(.body)
                        .foregroundStyle(.white.opacity(0.9))
                    
                    Text("Your goal: Connect to the PLAYER more than the character. When you do, certain things start showing up that you never could have created from the character's perspective.")
                        .font(.body)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color(hex: "27AE60"))
                }
                .padding()
                .background(Color.white.opacity(0.05))
                .cornerRadius(12)
                
                // Smiling in the Mirror
                VStack(alignment: .leading, spacing: 16) {
                    Text("😊 SMILING IN THE MIRROR")
                        .font(.caption)
                        .foregroundStyle(Color(hex: "9B59B6"))
                        .tracking(2)
                    
                    Text("This analogy from Reality Transurfing perfectly illustrates the process:")
                        .font(.body)
                        .foregroundStyle(.white.opacity(0.9))
                    
                    VStack(alignment: .leading, spacing: 12) {
                        smileStep(num: 1, text: "You smile at the mirror (change your inner state)")
                        smileStep(num: 2, text: "The reflection doesn't smile back immediately (energetic history)")
                        smileStep(num: 3, text: "Most people get frustrated and stop smiling")
                        smileStep(num: 4, text: "Or they try to PAINT a smile on the mirror (physical bypass)")
                        smileStep(num: 5, text: "But if you KEEP smiling consistently...")
                        smileStep(num: 6, text: "The corners of the reflection's mouth start to curl up")
                        smileStep(num: 7, text: "Eventually the reflection matches your smile")
                    }
                    
                    Text("You must keep smiling even when the mirror shows a stonewall face. That face is just history. A new future is always available.")
                        .font(.caption)
                        .italic()
                        .foregroundStyle(Color(hex: "9B59B6"))
                }
                .padding()
                .background(Color(hex: "9B59B6").opacity(0.1))
                .cornerRadius(12)
                
                // Key Rules
                VStack(alignment: .leading, spacing: 12) {
                    Text("📋 KEY RULES")
                        .font(.caption)
                        .foregroundStyle(Color(hex: "FFD700"))
                        .tracking(2)
                    
                    ruleCard(num: 1, rule: "Have more faith in the VISION than your current physical circumstances")
                    ruleCard(num: 2, rule: "Tip the scales—at least 51% of the time, think/feel positively")
                    ruleCard(num: 3, rule: "Don't stop. If you stop, the energy dissipates and you have to start over")
                    ruleCard(num: 4, rule: "Don't paint a smile (spiritual bypass)—actually change your inner state")
                    ruleCard(num: 5, rule: "Recognize your physical world is just energetic history, not fixed destiny")
                }
                .padding()
                .background(Color(hex: "FFD700").opacity(0.1))
                .cornerRadius(12)
                
                Spacer(minLength: 50)
            }
            .padding(.horizontal, 20)
        }
    }
    
    // MARK: - Practice Section
    private var practiceSection: some View {
        ScrollView {
            VStack(spacing: 24) {
                Text("🧘 PRACTICES TO CONNECT TO THE PLAYER")
                    .font(.caption)
                    .foregroundStyle(Color(hex: "27AE60"))
                    .tracking(2)
                    .padding(.top, 20)
                
                // Inner Work
                VStack(alignment: .leading, spacing: 16) {
                    Text("💪 THE INNER-CISE")
                        .font(.headline)
                        .foregroundStyle(.white)
                    
                    Text("Just like you can't build muscles without going to the gym and lifting weights, you cannot grow your inner muscles without doing the inner-cise.")
                        .font(.body)
                        .foregroundStyle(.white.opacity(0.9))
                    
                    practiceCard(
                        emoji: "🧘",
                        title: "MEDITATION",
                        benefits: [
                            "Tunes you into the Player",
                            "Creates disconnect from physical",
                            "Clears mental/emotional gunk",
                            "Opens the channel to Source",
                            "Helps respond rather than react"
                        ],
                        tip: "When truly deep in meditation, you forget about your physical body and go past the senses into the inner realm—into the Player."
                    )
                    
                    practiceCard(
                        emoji: "👁️",
                        title: "VISUALIZATION",
                        benefits: [
                            "Choose the scenes you want in life",
                            "Feel what it feels like to have them",
                            "Focus thoughts throughout the day",
                            "Tell the universe what to bring",
                            "Create clear picture of your goal"
                        ],
                        tip: "You get what you think about most of the time. By constantly visualizing, you'll have a clear image to tune into throughout your day."
                    )
                }
                
                // Moment to Moment
                VStack(alignment: .leading, spacing: 16) {
                    Text("⏱️ MOMENT-TO-MOMENT PRACTICES")
                        .font(.headline)
                        .foregroundStyle(.white)
                    
                    Text("Even if you meditate and visualize for an hour, what about the other 15+ hours? You are in INFINITE ACTION—always dwelling on something in thought and feeling.")
                        .font(.caption)
                        .foregroundStyle(.white.opacity(0.7))
                    
                    momentPracticeCard(
                        emoji: "🌬️",
                        title: "Wake Up & Breathe",
                        steps: [
                            "Notice when you're getting hooked into the game",
                            "Physically or mentally take a step back",
                            "Take deep breaths to anchor yourself",
                            "Ask: 'Is this what I want to think about?'",
                            "Make a new conscious choice"
                        ]
                    )
                    
                    momentPracticeCard(
                        emoji: "🙏",
                        title: "Appreciation Bursts",
                        steps: [
                            "When you feel autopilot kicking in...",
                            "Start becoming thankful for everything around you",
                            "Partner, home, body, opportunities, nature",
                            "Say 'thank you' to each thing genuinely",
                            "What you appreciate appreciates"
                        ]
                    )
                    
                    momentPracticeCard(
                        emoji: "🏃",
                        title: "Movement",
                        steps: [
                            "If stagnant physically → stagnant mentally/emotionally",
                            "Principle of Correspondence: As above, so below",
                            "Get on treadmill, vibration plate, do stretches",
                            "Go outside for sun, do qigong",
                            "Clean your physical space → clears mental space"
                        ]
                    )
                }
                
                // Identity Shifting
                VStack(alignment: .leading, spacing: 12) {
                    Text("🔄 IDENTITY SHIFTING")
                        .font(.caption)
                        .foregroundStyle(Color(hex: "9B59B6"))
                        .tracking(2)
                    
                    Text("The most important tool. Remember: You don't get what you WANT, you get who you ARE.")
                        .font(.body)
                        .foregroundStyle(.white)
                    
                    Text("Learning intentional identity shifting helps you utilize the Mirror Principle in the quickest way possible. This is what elites learn from childhood—how to shift who they're BEING to shift what shows up.")
                        .font(.body)
                        .foregroundStyle(.white.opacity(0.9))
                    
                    VStack(alignment: .leading, spacing: 8) {
                        identityQuestion("Who am I being in this moment?")
                        identityQuestion("Am I being someone abundant or scarce?")
                        identityQuestion("Am I being someone loving or fearful?")
                        identityQuestion("Am I being someone who creates or reacts?")
                        identityQuestion("Who would I need to BE for my vision to show up?")
                    }
                }
                .padding()
                .background(Color(hex: "9B59B6").opacity(0.1))
                .cornerRadius(12)
                
                // Final Reminder
                keyInsightCard(
                    text: "A new future is ALWAYS available.",
                    subtext: "It doesn't matter where you're starting. The Mirror Principle, when applied consciously, will absolutely transform your life."
                )
                
                Spacer(minLength: 50)
            }
            .padding(.horizontal, 20)
        }
    }
    
    // MARK: - Helper Views
    private func scienceCard(stat: String, title: String, desc: String) -> some View {
        HStack(alignment: .top, spacing: 16) {
            Text(stat)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "00D4FF"))
                .frame(width: 80)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                Text(desc)
                    .font(.caption)
                    .foregroundStyle(.white.opacity(0.7))
            }
        }
    }
    
    private func keyInsightCard(text: String, subtext: String) -> some View {
        VStack(spacing: 12) {
            Text("💎 KEY INSIGHT")
                .font(.caption)
                .foregroundStyle(Color(hex: "FFD700"))
            Text(text)
                .font(.title3)
                .fontWeight(.bold)
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)
            Text(subtext)
                .font(.caption)
                .foregroundStyle(.white.opacity(0.7))
                .multilineTextAlignment(.center)
        }
        .padding()
        .background(Color(hex: "FFD700").opacity(0.1))
        .cornerRadius(12)
    }
    
    private func partCard(emoji: String, title: String, color: Color, points: [String]) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text(emoji)
                    .font(.title2)
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundStyle(color)
            }
            
            ForEach(points, id: \.self) { point in
                HStack(alignment: .top, spacing: 8) {
                    Text("•")
                        .foregroundStyle(color)
                    Text(point)
                        .font(.caption)
                        .foregroundStyle(.white.opacity(0.9))
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(color.opacity(0.1))
        .cornerRadius(12)
    }
    
    private func causeEffectRow(cause: String, effect: String) -> some View {
        HStack(alignment: .top) {
            Text("→")
                .foregroundStyle(Color(hex: "F39C12"))
            VStack(alignment: .leading, spacing: 2) {
                Text(cause)
                    .font(.caption)
                    .foregroundStyle(.white)
                Text("= \(effect)")
                    .font(.caption)
                    .foregroundStyle(.white.opacity(0.7))
            }
        }
    }
    
    private func polarityRow(level: String, position: String, desc: String) -> some View {
        HStack {
            Text(position)
                .font(.caption2)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "9B59B6"))
                .frame(width: 50)
            Text(level)
                .font(.caption)
                .foregroundStyle(.white)
            Spacer()
            Text(desc)
                .font(.caption2)
                .foregroundStyle(.white.opacity(0.6))
        }
        .padding(.vertical, 4)
    }
    
    private func characterPoint(_ text: String) -> some View {
        HStack(alignment: .top, spacing: 4) {
            Text("✗")
                .font(.caption2)
                .foregroundStyle(Color(hex: "E74C3C"))
            Text(text)
                .font(.caption2)
                .foregroundStyle(.white.opacity(0.8))
        }
    }
    
    private func playerPoint(_ text: String) -> some View {
        HStack(alignment: .top, spacing: 4) {
            Text("✓")
                .font(.caption2)
                .foregroundStyle(Color(hex: "27AE60"))
            Text(text)
                .font(.caption2)
                .foregroundStyle(.white.opacity(0.8))
        }
    }
    
    private func smileStep(num: Int, text: String) -> some View {
        HStack(alignment: .top, spacing: 8) {
            Text("\(num)")
                .font(.caption2)
                .fontWeight(.bold)
                .foregroundStyle(.black)
                .frame(width: 20, height: 20)
                .background(Color(hex: "9B59B6"))
                .cornerRadius(10)
            Text(text)
                .font(.caption)
                .foregroundStyle(.white.opacity(0.9))
        }
    }
    
    private func ruleCard(num: Int, rule: String) -> some View {
        HStack(alignment: .top, spacing: 12) {
            Text("\(num)")
                .font(.caption)
                .fontWeight(.bold)
                .foregroundStyle(.black)
                .frame(width: 24, height: 24)
                .background(Color(hex: "FFD700"))
                .cornerRadius(12)
            Text(rule)
                .font(.caption)
                .foregroundStyle(.white.opacity(0.9))
        }
    }
    
    private func practiceCard(emoji: String, title: String, benefits: [String], tip: String) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text(emoji)
                    .font(.title2)
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundStyle(Color(hex: "27AE60"))
            }
            
            ForEach(benefits, id: \.self) { benefit in
                HStack(alignment: .top, spacing: 8) {
                    Text("✓")
                        .foregroundStyle(Color(hex: "27AE60"))
                    Text(benefit)
                        .font(.caption)
                        .foregroundStyle(.white.opacity(0.9))
                }
            }
            
            Text("💡 \(tip)")
                .font(.caption)
                .italic()
                .foregroundStyle(.white.opacity(0.7))
        }
        .padding()
        .background(Color(hex: "27AE60").opacity(0.1))
        .cornerRadius(12)
    }
    
    private func momentPracticeCard(emoji: String, title: String, steps: [String]) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(emoji)
                    .font(.title3)
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
            }
            
            ForEach(Array(steps.enumerated()), id: \.offset) { index, step in
                HStack(alignment: .top, spacing: 8) {
                    Text("\(index + 1).")
                        .font(.caption2)
                        .foregroundStyle(.white.opacity(0.5))
                    Text(step)
                        .font(.caption)
                        .foregroundStyle(.white.opacity(0.9))
                }
            }
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(12)
    }
    
    private func identityQuestion(_ text: String) -> some View {
        HStack(alignment: .top, spacing: 8) {
            Text("?")
                .font(.caption)
                .fontWeight(.bold)
                .foregroundStyle(Color(hex: "9B59B6"))
            Text(text)
                .font(.caption)
                .foregroundStyle(.white.opacity(0.9))
        }
    }
}

#Preview {
    MirrorPrincipleView()
}
