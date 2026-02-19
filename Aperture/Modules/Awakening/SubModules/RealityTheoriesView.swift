// RealityTheoriesView.swift
// THEORIES ABOUT REALITY — "Do You Dare to Peek? 👀"
// ☀️ SunFlow: Reignited
//
// "Remember — these are THEORIES. 🫠
//  But once you read them, you can't unread them.
//  Proceed at your own risk."
//
// This module is FUN. It's the "what if?" playground.
// Eight mind-bending theories about the nature of reality,
// from philosophy, physics, and consciousness research.
//
// Not dogma. Not doctrine. Just... possibilities.
// And some of them will keep you up at night.

import SwiftUI

// MARK: - ═══════════════════════════════════════════════════
// REALITY THEORIES VIEW
// ═══════════════════════════════════════════════════════════

struct RealityTheoriesView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var expandedCards: Set<String> = []
    @State private var revealedTheories: Set<String> = []
    @State private var showIntro = true
    
    let theories = RealityTheory.allTheories
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Deep space background
                Color(red: 0.01, green: 0.01, blue: 0.04).ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 16) {
                        headerView
                        
                        if showIntro {
                            introWarning
                        }
                        
                        disclaimerBadge
                        
                        ForEach(theories) { theory in
                            theoryCard(theory)
                        }
                        
                        closingInsight
                        sourcesSection
                        
                        Spacer(minLength: 60)
                    }
                    .padding(20)
                }
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button { dismiss() } label: {
                        Image(systemName: "chevron.left").font(.system(size: 16, weight: .semibold)).foregroundColor(.white)
                    }
                }
                ToolbarItem(placement: .principal) {
                    HStack(spacing: 6) {
                        Text("👁️").font(.system(size: 14))
                        Text("Reality Theories").font(.system(size: 17, weight: .bold)).foregroundColor(.white)
                    }
                }
            }
        }
    }
    
    // MARK: - Header
    
    private var headerView: some View {
        VStack(spacing: 10) {
            Text("👀").font(.system(size: 56))
                .shadow(color: .purple.opacity(0.5), radius: 20)
            
            Text("THEORIES ABOUT\nREALITY")
                .font(.system(size: 24, weight: .black)).tracking(1)
                .foregroundColor(.white).multilineTextAlignment(.center)
            
            Text("Do you dare to peek?")
                .font(.system(size: 14, weight: .bold))
                .foregroundColor(.purple.opacity(0.7))
            
            Text("8 mind-bending ideas about what's actually going on.\nNone of them are proven. All of them will change how you think.")
                .font(.system(size: 11, weight: .medium)).foregroundColor(.white.opacity(0.3))
                .multilineTextAlignment(.center)
        }
    }
    
    // MARK: - Intro Warning
    
    private var introWarning: some View {
        VStack(spacing: 10) {
            Text("⚠️ FAIR WARNING ⚠️")
                .font(.system(size: 12, weight: .black)).tracking(2).foregroundColor(.orange)
            
            Text("These are THEORIES — not facts, not beliefs, not instructions.\n\nThey come from philosophers, physicists, and consciousness researchers who asked questions most people are afraid to ask.\n\nSome of these ideas are thousands of years old.\nSome are cutting-edge physics.\nAll of them will make you question what you think you know.\n\nThis is the fun part of awakening. 🫠")
                .font(.system(size: 11, weight: .medium)).foregroundColor(.white.opacity(0.5))
                .multilineTextAlignment(.center).lineSpacing(3)
            
            Button {
                withAnimation(.easeInOut(duration: 0.3)) { showIntro = false }
            } label: {
                Text("I'M READY TO PEEK 👀")
                    .font(.system(size: 11, weight: .black)).tracking(1)
                    .foregroundColor(.black)
                    .padding(.horizontal, 20).padding(.vertical, 10)
                    .background(Capsule().fill(Color.purple.opacity(0.8)))
            }
        }
        .padding(16)
        .background(RoundedRectangle(cornerRadius: 14).fill(Color.purple.opacity(0.04))
            .overlay(RoundedRectangle(cornerRadius: 14).stroke(Color.purple.opacity(0.1), lineWidth: 1)))
    }
    
    // MARK: - Disclaimer Badge
    
    private var disclaimerBadge: some View {
        HStack(spacing: 6) {
            Text("🫠").font(.system(size: 10))
            Text("Remember: these are theories").font(.system(size: 9, weight: .bold)).foregroundColor(.white.opacity(0.25))
            Text("🫠").font(.system(size: 10))
        }
        .padding(.horizontal, 14).padding(.vertical, 6)
        .background(Capsule().fill(Color.white.opacity(0.02)))
    }
    
    // MARK: - Theory Card
    
    private func theoryCard(_ theory: RealityTheory) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            // Header — always visible
            Button {
                withAnimation(.easeInOut(duration: 0.25)) {
                    if revealedTheories.contains(theory.id) {
                        if expandedCards.contains(theory.id) { expandedCards.remove(theory.id) }
                        else { expandedCards.insert(theory.id) }
                    } else {
                        revealedTheories.insert(theory.id)
                        expandedCards.insert(theory.id)
                    }
                }
            } label: {
                HStack(spacing: 12) {
                    // Mind-blow meter
                    VStack(spacing: 2) {
                        Text(theory.emoji).font(.system(size: 24))
                        HStack(spacing: 1) {
                            ForEach(0..<5) { i in
                                Circle().fill(i < theory.mindBlowLevel ? theory.color : Color.white.opacity(0.05))
                                    .frame(width: 4, height: 4)
                            }
                        }
                    }
                    .frame(width: 40)
                    
                    VStack(alignment: .leading, spacing: 3) {
                        Text(theory.name).font(.system(size: 14, weight: .bold)).foregroundColor(.white)
                        Text(theory.tagline).font(.system(size: 10, weight: .medium)).foregroundColor(theory.color.opacity(0.6))
                        
                        if !revealedTheories.contains(theory.id) {
                            Text("TAP TO PEEK 👀").font(.system(size: 8, weight: .black)).tracking(1)
                                .foregroundColor(.purple.opacity(0.4)).padding(.top, 2)
                        }
                    }
                    
                    Spacer()
                    
                    if revealedTheories.contains(theory.id) {
                        Image(systemName: expandedCards.contains(theory.id) ? "chevron.up" : "chevron.down")
                            .font(.system(size: 10)).foregroundColor(.white.opacity(0.15))
                    } else {
                        Image(systemName: "eye.slash").font(.system(size: 12)).foregroundColor(.purple.opacity(0.3))
                    }
                }
                .padding(14)
            }
            
            // Expanded content
            if revealedTheories.contains(theory.id) && expandedCards.contains(theory.id) {
                VStack(alignment: .leading, spacing: 12) {
                    // Main explanation
                    Text(theory.explanation)
                        .font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.6)).lineSpacing(3)
                    
                    // The "What If" section
                    VStack(alignment: .leading, spacing: 6) {
                        HStack(spacing: 4) {
                            Text("🤯").font(.system(size: 10))
                            Text("THE WHAT IF").font(.system(size: 10, weight: .black)).tracking(1).foregroundColor(theory.color)
                        }
                        Text(theory.whatIf)
                            .font(.system(size: 11, weight: .medium)).foregroundColor(theory.color.opacity(0.5)).lineSpacing(3)
                    }
                    .padding(10)
                    .background(RoundedRectangle(cornerRadius: 8).fill(theory.color.opacity(0.03)))
                    
                    // Key thinkers
                    if !theory.thinkers.isEmpty {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("KEY THINKERS").font(.system(size: 9, weight: .bold)).tracking(1).foregroundColor(.white.opacity(0.2))
                            Text(theory.thinkers)
                                .font(.system(size: 10, weight: .medium)).foregroundColor(.white.opacity(0.3)).lineSpacing(2)
                        }
                    }
                    
                    // SunFlow connection
                    if let connection = theory.sunflowConnection {
                        HStack(spacing: 6) {
                            Text("☀️").font(.system(size: 10))
                            Text(connection).font(.system(size: 10, weight: .medium)).foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3).opacity(0.5))
                        }
                        .padding(8)
                        .background(RoundedRectangle(cornerRadius: 6).fill(Color(red: 1.0, green: 0.85, blue: 0.3).opacity(0.02)))
                    }
                }
                .padding(.horizontal, 14).padding(.bottom, 14)
            }
        }
        .background(RoundedRectangle(cornerRadius: 14).fill(Color.white.opacity(0.015))
            .overlay(RoundedRectangle(cornerRadius: 14).stroke(
                revealedTheories.contains(theory.id) ? theory.color.opacity(0.08) : Color.white.opacity(0.02), lineWidth: 1)))
    }
    
    // MARK: - Closing Insight
    
    private var closingInsight: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 6) {
                Text("👁️").font(.system(size: 12))
                Text("NOW THAT YOU'VE PEEKED").font(.system(size: 11, weight: .black)).tracking(1).foregroundColor(.purple)
            }
            
            Text("None of these theories can be proven. None can be fully disproven. That's what makes them theories.\n\nBut here's what they ALL share: they suggest that reality is not what it appears to be. That there's more going on than what your five senses report. That consciousness — YOUR consciousness — might be far more fundamental to the universe than you've been told.\n\nYour Prussian education taught you that you're a random accident on a random rock in a random universe, and that consciousness is just neurons firing.\n\nBut the greatest philosophers, physicists, and mystics across every civilization and every era have said: actually, it might be the other way around. Consciousness might come first. Reality might emerge from mind, not mind from reality.\n\nYou don't have to believe any of this. You just have to be willing to QUESTION. Because questioning is the first step out of the simulation — whether that simulation is digital, cultural, or neurological.\n\nWelcome to the deeper game. 🫠☀️")
                .font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.5)).lineSpacing(3)
        }
        .padding(14)
        .background(RoundedRectangle(cornerRadius: 14).fill(Color.purple.opacity(0.03))
            .overlay(RoundedRectangle(cornerRadius: 14).stroke(Color.purple.opacity(0.08), lineWidth: 1)))
    }
    
    // MARK: - Sources
    
    private var sourcesSection: some View {
        Text("Sources: Plato — Allegory of the Cave; René Descartes — Meditations on First Philosophy (1641); George Berkeley — A Treatise Concerning the Principles of Human Knowledge (1710); Immanuel Kant — Critique of Pure Reason (1781); John Stuart Mill — An Examination of Sir William Hamilton's Philosophy (1865); Hugh Everett III — Many-Worlds Interpretation (1957); Nick Bostrom — Are You Living in a Computer Simulation? (2003); Philip Goff — Galileo's Error: Foundations for a New Science of Consciousness (2019); Donald Hoffman — The Case Against Reality (2019); Einstein — Relativity and the Block Universe; Friedrich Nietzsche — Eternal Recurrence")
            .font(.system(size: 9, weight: .medium)).foregroundColor(.white.opacity(0.12)).lineSpacing(2)
            .padding(10).background(RoundedRectangle(cornerRadius: 8).fill(Color.white.opacity(0.01)))
    }
}

// MARK: - ═══════════════════════════════════════════════════
// REALITY THEORY DATA MODEL
// ═══════════════════════════════════════════════════════════

struct RealityTheory: Identifiable {
    let id: String
    let name: String
    let emoji: String
    let tagline: String
    let explanation: String
    let whatIf: String
    let thinkers: String
    let sunflowConnection: String?
    let mindBlowLevel: Int // 1-5
    let color: Color
    
    static let allTheories: [RealityTheory] = [
        
        // ─────────────────────────────────────────
        // 1. SOLIPSISM
        // ─────────────────────────────────────────
        .init(
            id: "solipsism",
            name: "Solipsism",
            emoji: "🪞",
            tagline: "What if only YOUR mind is real?",
            explanation: "Solipsism is one of the strangest and most unsettling ideas in philosophy. It's the belief that only YOUR own mind is truly real. Everything else — your friends, your family, the entire universe — might just exist inside your consciousness. Like a dream you can't wake up from.\n\nAccording to solipsism, you can never PROVE that anyone else is actually conscious. You can see people talk, laugh, and act alive — but all of that could be part of your mind's projection. Like background characters in your personal simulation.\n\nThere are three main forms:\n\nMetaphysical solipsism says only your mind exists. Reality itself depends on you.\n\nEpistemological solipsism admits other things MIGHT exist, but says you can never truly KNOW that for sure.\n\nMethodological solipsism treats everything as if it's only in your mind — as a way to focus on subjective experience.\n\nIt's an extreme version of the observer effect: without you to perceive reality, reality might not even exist.\n\nPhilosophers often bring up solipsism not because they believe it, but because it exposes the limits of human knowledge. If ALL experience happens inside your mind, how can you ever step OUTSIDE it to confirm anything else is real?",
            whatIf: "What if every person you've ever met, every conversation you've ever had, every sunrise you've ever watched — was your consciousness talking to itself? What if the universe is your mind's attempt to understand its own nature? And what if 'other people' are just mirrors showing you parts of yourself you haven't recognized yet?",
            thinkers: "René Descartes (cogito ergo sum — I think therefore I am), George Berkeley, Immanuel Kant, Ludwig Wittgenstein",
            sunflowConnection: "SunFlow connection: If reality is a projection of mind, then changing your mind literally changes your reality. That's not just philosophy — it's what every awakened tradition has ever taught.",
            mindBlowLevel: 4,
            color: .purple
        ),
        
        // ─────────────────────────────────────────
        // 2. THE DREAM ARGUMENT
        // ─────────────────────────────────────────
        .init(
            id: "dream_argument",
            name: "The Dream Argument",
            emoji: "💤",
            tagline: "How do you know you're awake right now?",
            explanation: "The Dream Argument asks a haunting question: how do you REALLY know you're awake right now?\n\nThink about it. In a dream, everything feels real. You can see, hear, touch, and even feel emotions. But when you wake up, you realize it was all in your mind.\n\nSo what if your 'waking life' is just another layer of the dream?\n\nPhilosophers like René Descartes used this idea to challenge certainty. He said: if my senses can deceive me in dreams, how can I trust them when I'm awake?\n\nIn Eastern philosophies like Hinduism and Buddhism, this concept also appears. They call the world Maya — the grand illusion.\n\nThe Dream Argument doesn't say you ARE dreaming. It just reminds you that your experience of reality might be no more trustworthy than last night's dream.\n\nAnd that makes you wonder: what will it feel like when you finally wake up?",
            whatIf: "What if death is just waking up from this dream? What if déjà vu is a glitch — a moment where the dream layers leak into each other? What if lucid dreamers are people who partially woke up INSIDE the dream? And what if 'enlightenment' in every spiritual tradition is literally the same thing: waking up within the dream and realizing you're the dreamer?",
            thinkers: "René Descartes — Meditations (1641), Zhuangzi (butterfly dream parable, ~300 BCE), Hindu concept of Maya, Buddhist concept of Samsara",
            sunflowConnection: "SunFlow connection: Every awakening tradition says the same thing — you're asleep and don't know it. The alarm clock is awareness itself.",
            mindBlowLevel: 3,
            color: .indigo
        ),
        
        // ─────────────────────────────────────────
        // 3. IDEALISM
        // ─────────────────────────────────────────
        .init(
            id: "idealism",
            name: "Idealism",
            emoji: "💭",
            tagline: "Reality is made of mind, not matter",
            explanation: "Idealism is one of the oldest and boldest ideas in philosophy: the belief that reality itself is MENTAL, not material.\n\nIt says that everything that exists is ultimately made of thoughts, perceptions, or consciousness — not atoms or matter. According to idealists, what we call the 'physical world' is really a kind of shared mental experience.\n\nThe chair you're sitting on, the sky above, even your own body — all these things exist because they are being PERCEIVED.\n\nThe roots go back to Plato, who said the material world is only a shadow of higher, perfect 'Forms' — eternal ideas that exist beyond physical reality.\n\nBut it was Bishop George Berkeley in the 18th century who gave idealism its classic form. He argued: 'To be is to be perceived' — esse est percipi. Objects only exist when they're being perceived by a mind. And when no human is looking? God is — the ultimate observer who sustains the world by constantly perceiving it.\n\nKant's transcendental idealism said the mind doesn't just RECEIVE reality — it SHAPES it. Space, time, and causality aren't 'out there' in the world. They're structures the human mind uses to make sense of experience.\n\nHegel's absolute idealism went even further: the universe itself is a single evolving mind — the Absolute — gradually becoming aware of itself through history, art, and human thought.\n\nIn modern times, some scientists and philosophers have revived idealism, suggesting that consciousness might be the FOUNDATION of reality itself — not a byproduct of the brain. They argue that matter could be the illusion, and mind the true substance of the universe.",
            whatIf: "What if the entire physical universe is consciousness expressing itself as matter? What if atoms aren't building blocks — they're ideas? What if the reason quantum physics is so weird (particles behaving differently when observed) is because observation IS creation? What if Berkeley was right and there IS an ultimate observer — but it's not a bearded man in the sky. It's the consciousness that YOU are a fragment of?",
            thinkers: "Plato (Forms), George Berkeley (esse est percipi), Immanuel Kant (transcendental idealism), G.W.F. Hegel (absolute idealism), Bernardo Kastrup (analytical idealism, modern), Donald Hoffman (The Case Against Reality)",
            sunflowConnection: "SunFlow connection: If reality is mental, then institutions that control your MIND are literally controlling your REALITY. Education, media, religion — they're not just shaping opinions. They're shaping the world itself.",
            mindBlowLevel: 4,
            color: .cyan
        ),
        
        // ─────────────────────────────────────────
        // 4. SIMULATION THEORY
        // ─────────────────────────────────────────
        .init(
            id: "simulation",
            name: "Simulation Theory",
            emoji: "🖥️",
            tagline: "What if reality is a computer program?",
            explanation: "Simulation Theory is the mind-blowing idea that reality itself might be a computer program. It suggests that everything — the stars, the cities, your memories, even YOU — could be part of an incredibly advanced simulation running on some cosmic computer.\n\nThe theory became famous after philosopher Nick Bostrom proposed it in 2003. He argued that if a civilization EVER becomes advanced enough to run realistic simulations of consciousness, then it's statistically more likely that we're IN one of those simulations — not in the original 'base reality.'\n\nEvery law of physics would just be part of the code.\n\nSome scientists even take this seriously. They've looked for 'pixelation' in space — tiny inconsistencies in cosmic radiation that could hint at a digital universe. So far, nothing conclusive. But the MATH behind the idea isn't crazy.\n\nIf any advanced civilization ever creates even ONE ancestor simulation, the number of simulated beings would vastly outnumber 'real' beings. Probability alone suggests we're more likely to be simulated than not.\n\nSimulation Theory doesn't claim to PROVE we're in a simulation. It just says it's very hard to rule out. And if it's true, then the real question isn't 'is the universe real?' — it's 'who or what is running it?'",
            whatIf: "What if glitches in reality (déjà vu, Mandela effects, quantum weirdness) are actual bugs in the code? What if the speed of light is just the processing speed of the simulation? What if the reason we can't find the 'edge' of the universe is because it only renders what's being observed — like a video game that only loads the area around the player? What if 'God' is just the admin?",
            thinkers: "Nick Bostrom — Are You Living in a Computer Simulation? (2003), Elon Musk (public advocate), Neil deGrasse Tyson (says probability is significant), Rizwan Virk — The Simulation Hypothesis",
            sunflowConnection: "SunFlow connection: If we're in a simulation, then the 'rules' of society — money, borders, race, religion — are literally just code. And code can be rewritten. Or at minimum... recognized as arbitrary.",
            mindBlowLevel: 5,
            color: .green
        ),
        
        // ─────────────────────────────────────────
        // 5. MANY WORLDS INTERPRETATION
        // ─────────────────────────────────────────
        .init(
            id: "many_worlds",
            name: "The Many Worlds Interpretation",
            emoji: "🌌",
            tagline: "Every possible outcome creates a new universe",
            explanation: "The Many Worlds Interpretation is one of the wildest ideas in quantum physics. It suggests that every time a quantum event could go two ways — say a particle goes left or right — the universe SPLITS into two versions. One for each outcome.\n\nThat means every decision, every coin flip, every random event doesn't just have ONE result. It creates an entirely NEW reality where the other possibility also happened.\n\nIn one universe, you hit snooze this morning. In another, you got up early and changed the course of your whole life. Somewhere, there's a version of you who made EVERY possible choice you didn't.\n\nThis idea came from physicist Hugh Everett III in 1957, who wanted to explain quantum mechanics without 'collapsing' wave functions. Instead of particles 'choosing' one outcome when observed, he said ALL outcomes happen — just in parallel universes that constantly branch off.\n\nThe math works. The implications are staggering.\n\nAccording to Many Worlds, nothing ever truly disappears or fails. It just exists in another timeline. Every road not taken IS being taken — somewhere.",
            whatIf: "What if right now, infinite versions of you are living every possible variation of your life? What if the 'gut feeling' that you should have made a different choice is actually bleed-through from a timeline where you DID? What if every dream is a window into another branch? And what if death in one timeline just shifts your consciousness to a timeline where you survived?",
            thinkers: "Hugh Everett III (1957), Bryce DeWitt (popularized the term 'many worlds'), David Deutsch — The Fabric of Reality, Sean Carroll — Something Deeply Hidden",
            sunflowConnection: "SunFlow connection: If every choice creates a new reality, then your choices literally shape which universe you inhabit. You're not just making decisions — you're selecting timelines. Choose consciously.",
            mindBlowLevel: 5,
            color: .blue
        ),
        
        // ─────────────────────────────────────────
        // 6. PHENOMENALISM
        // ─────────────────────────────────────────
        .init(
            id: "phenomenalism",
            name: "Phenomenalism",
            emoji: "🌊",
            tagline: "Objects only exist as bundles of possible sensations",
            explanation: "Phenomenalism is the idea that physical objects don't exist as independent 'things out there.' They exist only as collections of sensations — or POTENTIAL experiences. In simple terms: the world is what it feels like to you.\n\nImagine a tree. When you see it, you're really just experiencing colors, shapes, and textures — the PHENOMENA of the tree. But what about when nobody's around?\n\nAccording to phenomenalism, the tree doesn't vanish. It still exists as a SET of possible perceptions. If someone WERE to look, touch, or hear it, they'd have those sensations again.\n\nPhilosophers like John Stuart Mill and Ernst Mach described it like this: objects are nothing more than 'bundles of possible sensory experiences.'\n\nSo the 'real world' isn't made of solid matter. It's made of the POSSIBILITY of perception. If no mind could EVER experience something, phenomenalism says it's meaningless to claim that thing exists at all.\n\nThe chair you're sitting on isn't a chair. It's a collection of textures, pressures, colors, and temperatures that your mind organizes into the CONCEPT of 'chair.' Remove the mind, and what's left? Not a chair. Just... possibility.",
            whatIf: "What if the universe is essentially a vast field of POTENTIAL — and consciousness is what collapses potential into experience? What if 'matter' is just what perception feels like from the inside? What if the reason quantum particles exist as probability waves until observed is because phenomenalism is LITERALLY TRUE at the quantum level — things only become 'real' when perceived?",
            thinkers: "John Stuart Mill, Ernst Mach, A.J. Ayer — Language, Truth and Logic (1936), George Berkeley (precursor)",
            sunflowConnection: "SunFlow connection: If reality is perception, then controlling someone's perception IS controlling their reality. Media, education, religion — they don't just shape what you think. They shape what EXISTS for you.",
            mindBlowLevel: 3,
            color: .teal
        ),
        
        // ─────────────────────────────────────────
        // 7. TIME LOOP HYPOTHESIS
        // ─────────────────────────────────────────
        .init(
            id: "time_loop",
            name: "The Eternal Time Loop",
            emoji: "♾️",
            tagline: "Past, present, and future already exist — all at once",
            explanation: "The Eternal Time Loop hypothesis challenges everything we think we know about time. It suggests that time doesn't actually FLOW forward. Instead, every moment already exists all at once.\n\nPast, present, and future aren't separate. They're like pages in a book. You're not watching time move. You're just flipping through the pages.\n\nIn this view, the universe might be a giant time loop — a perfectly complete structure where every event, every action, every version of you ALREADY EXISTS in its rightful place. Your consciousness is what MOVES through those moments, giving the illusion of time passing.\n\nSome versions of the theory say the loop could even REPEAT — the same universe cycling endlessly, with you reliving your entire life again and again without realizing it.\n\nPhysicists like Einstein hinted at this when he said: 'The distinction between past, present, and future is only a stubbornly persistent illusion.'\n\nThis connects to the 'block universe' theory in physics — the idea that spacetime is a four-dimensional block where all moments exist simultaneously. We don't EXPERIENCE them all at once because our consciousness moves through the block like a cursor.\n\nIn a timeless universe, death isn't 'the end' and birth isn't 'the beginning.' It's all now. Forever.",
            whatIf: "What if you've lived this exact life an infinite number of times? What if déjà vu is your consciousness remembering a previous loop? What if that feeling of 'I was meant to do this' is because you ALREADY DID — in a previous cycle? And what if Nietzsche's eternal recurrence isn't philosophy — it's physics: 'What if a demon said to you: this life as you now live it, you will have to live once more and innumerable times more?'",
            thinkers: "Albert Einstein (block universe), Friedrich Nietzsche (eternal recurrence), Kurt Gödel (closed timelike curves), Julian Barbour — The End of Time",
            sunflowConnection: "SunFlow connection: If you've lived this before, then awakening might be remembering. Not learning something new — REMEMBERING something you've always known.",
            mindBlowLevel: 5,
            color: .orange
        ),
        
        // ─────────────────────────────────────────
        // 8. COSMOPSYCHISM
        // ─────────────────────────────────────────
        .init(
            id: "cosmopsychism",
            name: "Cosmopsychism",
            emoji: "🌀",
            tagline: "The universe is one giant mind — and you're it looking at itself",
            explanation: "Cosmopsychism takes the idea of consciousness to a cosmic level. It says that the entire universe IS one gigantic mind — and everything inside it (stars, galaxies, you, me) are tiny fragments of that single cosmic consciousness.\n\nIn this view, you're not a separate being living IN the universe. You ARE the universe temporarily looking at itself through human eyes. Your thoughts, emotions, and experiences are all part of the cosmos exploring its own depths.\n\nThis isn't just philosophy. Modern philosophers like Philip Goff argue that cosmopsychism might solve the 'hard problem of consciousness' — the question of WHY subjective experience exists at all.\n\nIf consciousness is FUNDAMENTAL (not a byproduct of brains), then the simplest explanation might be: there's ONE consciousness, and everything is a localized expression of it. Your brain doesn't CREATE consciousness. It FILTERS it — narrowing the cosmic mind down to a single human perspective.\n\nAldous Huxley called the brain a 'reducing valve' — taking the infinite and squeezing it into something manageable. When the valve opens wider (meditation, psychedelics, mystical experience, awakening), you temporarily experience the bigger mind.\n\nEvery mystical tradition on Earth has said this: Hinduism (Atman is Brahman — the individual soul IS the universal soul), Buddhism (all is one), Sufism (I am the Truth), Christian mysticism (the kingdom of God is within you).\n\nCosmopsychism is what happens when philosophy catches up with what mystics have been saying for 5,000 years.",
            whatIf: "What if YOU are the universe experiencing itself through the specific lens of your unique life? What if every person you meet is the same consciousness wearing a different costume? What if compassion isn't moral — it's ACCURATE? Hurting others IS hurting yourself, because there's only one 'self' wearing 8 billion masks. What if awakening isn't learning something new — it's the universe REMEMBERING what it is through you?",
            thinkers: "Philip Goff — Galileo's Error (2019), Bernardo Kastrup — Why Materialism Is Baloney (2014), Aldous Huxley — The Doors of Perception, Erwin Schrödinger ('The total number of minds in the universe is one'), Hindu Upanishads, Rumi, Meister Eckhart",
            sunflowConnection: "SunFlow connection: If the universe is one mind, then SunFlow isn't Ron teaching you. It's the universe waking itself up through Ron. And through you, reading this right now. The sun doesn't shine FOR you. It shines AS you. ☀️",
            mindBlowLevel: 5,
            color: Color(red: 1.0, green: 0.85, blue: 0.3)
        ),
    ]
}
