// AwakeningSymptomExplainer.swift
// "WHAT'S HAPPENING TO ME?" — Symptom Database
// ☀️ SunFlow: Reignited — Awakening Guide
//
// Every symptom explained. Biology + Spirit + Relief.
// Searchable. No judgment. Just answers.
//
// "I wish there was someone there to explain it all."
// — This IS that explanation.

import SwiftUI

struct AwakeningSymptomExplainerView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var searchText: String = ""
    @State private var selectedCategory: SymptomCategory = .physical
    @State private var expandedSymptom: UUID?
    
    private let glow = Color(red: 0.6, green: 0.8, blue: 1.0)
    
    var filteredSymptoms: [AwakeningSymptom] {
        let all = AwakeningSymptomDatabase.symptoms.filter { $0.category == selectedCategory }
        if searchText.isEmpty { return all }
        return AwakeningSymptomDatabase.symptoms.filter {
            $0.title.localizedCaseInsensitiveContains(searchText) ||
            $0.keywords.contains(where: { $0.localizedCaseInsensitiveContains(searchText) })
        }
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 0.01, green: 0.01, blue: 0.04).ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 12) {
                        headerView
                        searchBar
                        categoryTabs
                        
                        ForEach(filteredSymptoms) { symptom in
                            symptomCard(symptom)
                        }
                        
                        disclaimerView
                        Spacer(minLength: 40)
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
                    Text("🧠 What's Happening To Me?").font(.system(size: 15, weight: .bold)).foregroundColor(.white)
                }
            }
        }
    }
    
    private var headerView: some View {
        VStack(spacing: 4) {
            Text("Everything you're feeling\nis explained here.").font(.system(size: 14, weight: .bold)).foregroundColor(.white.opacity(0.5))
                .multilineTextAlignment(.center)
            Text("Biology. Spirit. Relief.").font(.system(size: 10, weight: .medium)).foregroundColor(glow.opacity(0.3))
        }
    }
    
    private var searchBar: some View {
        HStack(spacing: 8) {
            Image(systemName: "magnifyingglass").foregroundColor(.white.opacity(0.15))
            TextField("Search symptoms...", text: $searchText)
                .font(.system(size: 13, weight: .medium)).foregroundColor(.white)
        }
        .padding(10).background(RoundedRectangle(cornerRadius: 8).fill(Color.white.opacity(0.03)))
    }
    
    private var categoryTabs: some View {
        HStack(spacing: 4) {
            ForEach(SymptomCategory.allCases, id: \.self) { cat in
                Button { withAnimation { selectedCategory = cat } } label: {
                    HStack(spacing: 3) {
                        Text(cat.emoji).font(.system(size: 10))
                        Text(cat.label).font(.system(size: 9, weight: .bold))
                            .foregroundColor(selectedCategory == cat ? .black : .white.opacity(0.3))
                    }
                    .padding(.horizontal, 8).padding(.vertical, 6)
                    .background(RoundedRectangle(cornerRadius: 6)
                        .fill(selectedCategory == cat ? glow : Color.white.opacity(0.02)))
                }
            }
        }
    }
    
    private func symptomCard(_ symptom: AwakeningSymptom) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            Button {
                withAnimation(.easeInOut(duration: 0.15)) {
                    expandedSymptom = expandedSymptom == symptom.id ? nil : symptom.id
                }
            } label: {
                HStack(spacing: 8) {
                    Text(symptom.emoji).font(.system(size: 16))
                    VStack(alignment: .leading, spacing: 1) {
                        Text(symptom.title).font(.system(size: 13, weight: .bold)).foregroundColor(.white)
                        Text(symptom.oneLiner).font(.system(size: 9, weight: .medium)).foregroundColor(.white.opacity(0.25))
                    }
                    Spacer()
                    Image(systemName: expandedSymptom == symptom.id ? "chevron.up" : "chevron.down")
                        .font(.system(size: 9)).foregroundColor(.white.opacity(0.1))
                }
                .padding(11)
            }
            
            if expandedSymptom == symptom.id {
                VStack(alignment: .leading, spacing: 10) {
                    // Biology
                    explainSection("🧬 BIOLOGY", symptom.biology, .blue)
                    // Spirit
                    explainSection("✨ SPIRITUAL", symptom.spiritual, .purple)
                    // Relief
                    explainSection("💚 RELIEF", symptom.relief, Color(red: 0.3, green: 0.8, blue: 0.5))
                    // Reassurance
                    Text("💬 \(symptom.reassurance)").font(.system(size: 11, weight: .medium, design: .serif))
                        .foregroundColor(glow.opacity(0.4)).italic().lineSpacing(2)
                    
                    if symptom.seekHelp {
                        HStack(spacing: 4) {
                            Text("⚠️").font(.system(size: 9))
                            Text("If this persists or worsens, please consult a healthcare professional.")
                                .font(.system(size: 8, weight: .medium)).foregroundColor(.red.opacity(0.4))
                        }
                    }
                }
                .padding(.horizontal, 11).padding(.bottom, 11)
            }
        }
        .background(RoundedRectangle(cornerRadius: 8).fill(Color.white.opacity(0.012)))
    }
    
    private func explainSection(_ label: String, _ text: String, _ color: Color) -> some View {
        VStack(alignment: .leading, spacing: 3) {
            Text(label).font(.system(size: 8, weight: .black)).tracking(1).foregroundColor(color.opacity(0.5))
            Text(text).font(.system(size: 10, weight: .medium)).foregroundColor(.white.opacity(0.4)).lineSpacing(2)
        }
    }
    
    private var disclaimerView: some View {
        Text("This information is for guidance only and does not replace medical advice. If you're experiencing severe or persistent symptoms, please consult a healthcare professional.")
            .font(.system(size: 8, weight: .medium)).foregroundColor(.white.opacity(0.1)).multilineTextAlignment(.center)
    }
}

// MARK: - ═══════════════════════════════════════════════════
// SYMPTOM DATABASE
// ═══════════════════════════════════════════════════════════

enum SymptomCategory: String, CaseIterable, Codable {
    case physical, emotional, cognitive, spiritual, sleep
    
    var emoji: String {
        switch self { case .physical: return "🦴"; case .emotional: return "💔"; case .cognitive: return "🧠"
        case .spiritual: return "✨"; case .sleep: return "🌙" }
    }
    var label: String { rawValue.capitalized }
}

struct AwakeningSymptom: Identifiable {
    let id = UUID()
    let category: SymptomCategory
    let title: String; let emoji: String; let oneLiner: String
    let biology: String; let spiritual: String; let relief: String; let reassurance: String
    let keywords: [String]; let seekHelp: Bool
}

struct AwakeningSymptomDatabase {
    static let symptoms: [AwakeningSymptom] = [
        
        // ── PHYSICAL ──
        
        AwakeningSymptom(category: .physical,
            title: "Heart Pain / Chest Tightness", emoji: "💚",
            oneLiner: "Your heart chakra is opening",
            biology: "The vagus nerve, which connects your brain to your heart and gut, is activated during emotional processing. Chest tightness often comes from trapped tension in the intercostal muscles and diaphragm. Cortisol and adrenaline cause vasoconstriction, creating pressure sensations.",
            spiritual: "The heart chakra (Anahata) governs love, compassion, and connection to Source. Pain here signals blockages from unresolved grief, fear of vulnerability, or disconnection from divine love. Your heart is cracking open to let more in.",
            relief: "Place both hands on your chest. Breathe deeply — in for 5, out for 7. Visualize green light filling your chest. Speak silently: 'I open to love. I release what no longer serves.' Try chest-opening stretches — cobra pose, doorway stretch. Rose quartz on your chest during meditation.",
            reassurance: "Your heart isn't breaking. It's expanding. The walls you built to protect yourself are dissolving because you don't need them anymore.",
            keywords: ["heart", "chest", "tightness", "pain", "ache", "pressure", "cardiac"], seekHelp: true),
        
        AwakeningSymptom(category: .physical,
            title: "Back Pain (Upper/Lower)", emoji: "🦴",
            oneLiner: "Energy moving through your spine",
            biology: "The spine houses the central nervous system. During periods of intense stress and emotional processing, muscles along the erector spinae group contract and hold tension. The psoas muscle — the 'muscle of the soul' — stores trauma and tightens during fear responses.",
            spiritual: "In kundalini traditions, awakening energy rises from the base of the spine (root chakra) upward. Back pain often corresponds to specific chakra locations: lower back = root/sacral (safety/emotions), mid-back = solar plexus (power), upper back = heart (love/grief).",
            relief: "Cat-cow stretches to mobilize the spine. Child's pose for lower back. Supported fish pose for upper back. Warm baths with epsom salt. Gentle self-massage along the spine. Let the body move however it wants — sway, rock, twist.",
            reassurance: "Your spine is the highway of your nervous system. Energy is moving through it in new patterns. The pain is transit, not destination.",
            keywords: ["back", "spine", "lower back", "upper back", "ache", "tension", "psoas"], seekHelp: true),
        
        AwakeningSymptom(category: .physical,
            title: "Ears Ringing / Tinnitus", emoji: "🔔",
            oneLiner: "Frequency sensitivity expanding",
            biology: "The auditory system processes a wide range of frequencies. During heightened states of awareness, the brain's auditory cortex becomes more sensitive. Stress hormones can also affect the tiny hair cells in the cochlea, creating phantom sounds.",
            spiritual: "Many traditions describe ringing as 'hearing the frequency of the universe' or receiving energetic downloads. Different pitches may correspond to different chakras or energy centers activating. High pitch = crown/third eye. Low hum = root/earth connection.",
            relief: "Don't fight it — observe it. Note which ear (left = receiving, right = sending in some traditions). Grounding exercises reduce intensity. Humming or chanting can harmonize the sensation. If persistent, rule out medical causes.",
            reassurance: "Your perception is expanding to include frequencies you couldn't hear before. The ringing is your antenna adjusting to a wider bandwidth.",
            keywords: ["ears", "ringing", "tinnitus", "buzzing", "humming", "sound", "frequency"], seekHelp: true),
        
        AwakeningSymptom(category: .physical,
            title: "Appetite Changes", emoji: "🥗",
            oneLiner: "Your body is recalibrating what it needs",
            biology: "The hypothalamus regulates appetite via leptin and ghrelin. During major psychological shifts, these hormones fluctuate. Cortisol can suppress or increase appetite. The gut-brain axis means emotional processing directly affects digestion and food preferences.",
            spiritual: "As consciousness shifts, the body naturally rejects lower-vibration foods (heavily processed, chemical-laden) and craves cleaner fuel. This isn't dietary dogma — it's your body's intelligence returning. Many report spontaneous aversion to foods they previously loved.",
            relief: "Listen to your body. Eat when hungry, stop when not. Don't force routines. Fresh fruits, vegetables, and water are generally well-tolerated during shifts. Small frequent meals if appetite is low. Don't judge the changes.",
            reassurance: "Your body is upgrading its fuel preferences. What you used to tolerate, you may no longer need. Trust the intelligence of your own system.",
            keywords: ["appetite", "food", "eating", "hungry", "not hungry", "diet", "cravings"], seekHelp: false),
        
        AwakeningSymptom(category: .physical,
            title: "Pressure Between Eyebrows", emoji: "👁️",
            oneLiner: "Third eye activation",
            biology: "The area between the eyebrows corresponds to the frontal sinuses and the prefrontal cortex beneath. During deep meditation or focused introspection, blood flow to the prefrontal cortex increases. The pineal gland, located deep in the brain, produces DMT-like compounds during altered states.",
            spiritual: "The third eye (Ajna chakra) is the center of intuition, inner vision, and higher perception. Pressure, tingling, or pulsing here indicates activation — your inner sight is coming online. Many report enhanced intuition, vivid dreams, and 'seeing through' deceptions after this opens.",
            relief: "Gentle circular massage between the eyebrows. Alternate nostril breathing (Nadi Shodhana). Indigo/purple visualization. Don't force it open — let it happen naturally. Child's pose with forehead resting on the ground.",
            reassurance: "Your intuition is waking up. The 'third eye' is your capacity to see beyond surface reality. The pressure is the lens focusing.",
            keywords: ["forehead", "third eye", "pressure", "tingling", "eyebrows", "pineal", "ajna"], seekHelp: false),
        
        AwakeningSymptom(category: .physical,
            title: "Extreme Fatigue or Sudden Energy", emoji: "⚡",
            oneLiner: "Your system is oscillating between rebuild and activation",
            biology: "The autonomic nervous system alternates between sympathetic (fight-or-flight, energy) and parasympathetic (rest-and-digest, fatigue). During awakening, this system is being recalibrated. Adrenal glands may be overworked, causing crashes followed by surges.",
            spiritual: "Fatigue = your body demands rest for integration. Surge = kundalini or Source energy flowing. Both are necessary. The cycle mirrors death and rebirth at the cellular level.",
            relief: "Rest when tired — don't push through. Move when energized — don't suppress it. This is not a time for discipline, it's a time for listening. Naps are healing. Walks in nature help regulate both extremes.",
            reassurance: "Your energy will stabilize. Right now your system is like a phone doing a major OS update — it drains the battery, then reboots stronger.",
            keywords: ["tired", "exhausted", "fatigue", "energy", "wired", "hyper", "crash"], seekHelp: false),
        
        AwakeningSymptom(category: .physical,
            title: "Tingling / Vibrations in Body", emoji: "〰️",
            oneLiner: "Energy moving through previously blocked pathways",
            biology: "Paresthesia (tingling) can result from hyperventilation during emotional episodes, increased blood flow during stress responses, or nerve pathway sensitization. The peripheral nervous system becomes more responsive during heightened awareness states.",
            spiritual: "Tingling and vibrations are prana/chi/life force moving through energy meridians. Hands, feet, spine, and crown are common locations. It means blockages are clearing and energy is flowing more freely.",
            relief: "Grounding: bare feet on earth, hold a rock, eat root vegetables. Let the energy move — shaking, dancing, or yoga helps it distribute. Don't tense against it. Warm bath. Deep breathing.",
            reassurance: "You're not having a medical emergency. You're feeling energy you were always too numb to notice before. Your sensitivity is a gift, not a glitch.",
            keywords: ["tingling", "vibration", "buzzing", "electricity", "pins", "needles", "energy"], seekHelp: true),
        
        // ── EMOTIONAL ──
        
        AwakeningSymptom(category: .emotional,
            title: "Uncontrollable Crying", emoji: "😭",
            oneLiner: "Emotional debris clearing out",
            biology: "Crying activates the parasympathetic nervous system, releasing endorphins and oxytocin. During awakening, suppressed emotions (sometimes decades old) surface for processing. The limbic system is purging stored emotional content that the old ego kept locked away.",
            spiritual: "Tears are sacred release. Every tradition honors grief as doorway to transformation. You're not crying because something is wrong — you're crying because walls are falling. The tears contain the residue of who you pretended to be.",
            relief: "Let it flow. Don't analyze it. Don't resist it. Hold yourself or let someone hold you. Warm shower. Journal after (not during). Drink water — you're literally dehydrating as you purge.",
            reassurance: "The crying isn't weakness. It's your body's way of releasing everything that was never really yours — other people's expectations, society's programming, roles you played to survive. Let it go.",
            keywords: ["crying", "tears", "sobbing", "weeping", "emotional", "can't stop"], seekHelp: false),
        
        AwakeningSymptom(category: .emotional,
            title: "\"Why Me?\" — Anger at Being Chosen", emoji: "😤",
            oneLiner: "Rage at the disruption of comfortable illusion",
            biology: "Anger activates the sympathetic nervous system and prefrontal cortex simultaneously. It's the brain's protest response when core beliefs are threatened — a form of cognitive dissonance resolution. The amygdala fires because your identity map is being redrawn.",
            spiritual: "The anger is valid. You were lied to — by institutions, by culture, sometimes by people you loved. The rage isn't about being 'chosen' — it's about realizing you were asleep and nobody told you. Channel it: anger is fuel. It becomes discernment.",
            relief: "Physical movement — punch a pillow, scream into a towel, run hard. Write an angry letter you never send. Then breathe. The anger transforms into clarity if you let it pass through rather than hold it.",
            reassurance: "You didn't ask for this. Nobody does. But the anger means your awareness is sharp enough to see what was hidden. That's not a curse — it's your superpower activating.",
            keywords: ["angry", "rage", "why me", "unfair", "furious", "betrayed", "chosen"], seekHelp: false),
        
        AwakeningSymptom(category: .emotional,
            title: "Feeling Completely Alone", emoji: "🏝️",
            oneLiner: "The bridge between who you were and who you're becoming",
            biology: "Social bonding relies on shared neural models of reality. When your model shifts dramatically, existing bonds feel misaligned. Oxytocin pathways that maintained old relationships are disrupted while new ones haven't formed yet.",
            spiritual: "Solitude is the cocoon. The caterpillar doesn't become a butterfly in public. Your isolation isn't punishment — it's incubation. You're building a new self that will attract aligned connections.",
            relief: "Know this is temporary. Journaling, nature walks, and anonymous online communities of awakened people help. Don't force old friendships to understand — they may not be able to. New people who 'get it' will appear.",
            reassurance: "You're not alone. Millions have walked this path. You just can't see them yet because you're still inside the cocoon. When you emerge, you'll find your people.",
            keywords: ["alone", "lonely", "isolated", "nobody understands", "disconnected", "abandoned"], seekHelp: false),
        
        AwakeningSymptom(category: .emotional,
            title: "Overwhelming Empathy / Feeling Everything", emoji: "🌊",
            oneLiner: "Your empathic filters dissolved",
            biology: "Mirror neurons and the insular cortex process empathy. During awakening, the default mode network (self-boundary maintenance) reduces activity, making you more permeable to others' emotions. Sensory processing sensitivity increases.",
            spiritual: "You're becoming an empath — able to feel the energy of people, rooms, and situations. What was previously blocked by ego armor now flows freely through you. This is a gift that needs management, not suppression.",
            relief: "Learn energy boundaries: visualize a golden shield around you. Limit news/social media. Choose environments carefully. Nature resets your field. Grounding exercises are essential — not optional.",
            reassurance: "Feeling everything isn't a flaw. It's expanded perception. You just need to learn to manage the volume. Think of it as going from a flip phone to a satellite dish — you need new skills.",
            keywords: ["empathy", "feeling", "overwhelmed", "absorbing", "emotions", "sensitive"], seekHelp: false),
        
        // ── COGNITIVE ──
        
        AwakeningSymptom(category: .cognitive,
            title: "Downloads — Sudden Knowing", emoji: "📡",
            oneLiner: "Information arriving from beyond your rational mind",
            biology: "The brain's default mode network, when disrupted, allows novel connections between previously unlinked neural regions. This produces sudden insights — 'aha moments' — that feel like external knowledge arriving. Temporal lobe activity increases, similar to patterns seen in experienced meditators.",
            spiritual: "Downloads are information from higher consciousness / Source / your higher self. They arrive as sudden knowing, images, words, or understanding of complex truths without logical process. They're real. They're not hallucinations.",
            relief: "Write them down immediately — they fade like dreams. Voice memo if writing is too slow. Don't try to understand them all at once. Some are for now, some are for later. Don't share them with people who won't understand yet.",
            reassurance: "You're not making this up. You're receiving information that was always available — you just couldn't hear it over the noise of your old life. Trust it. Verify it. Build with it.",
            keywords: ["downloads", "knowing", "insight", "revelation", "sudden", "understanding", "channel"], seekHelp: false),
        
        AwakeningSymptom(category: .cognitive,
            title: "Seeing Patterns Everywhere", emoji: "🔢",
            oneLiner: "Pattern recognition at a new level",
            biology: "The brain is a pattern-recognition machine. During awakening, the reticular activating system (which filters what you notice) recalibrates. You literally see MORE because your filters are wider. Repeating numbers, connections between events, and synchronicities become visible.",
            spiritual: "The universe communicates through pattern. Numbers (11:11, 333), coincidences, and recurring themes aren't random — they're the language of a reality you're now tuned into. In sacred geometry: pattern IS the foundation of existence.",
            relief: "Keep a synchronicity log. Note what you were thinking when you saw the pattern. Over time, a personal symbolic language emerges. Don't obsess — observe. Pattern recognition is a tool, not an identity.",
            reassurance: "You're not going crazy seeing connections everywhere. You're seeing what was always there. The matrix has always had code — you just gained the ability to read it.",
            keywords: ["patterns", "numbers", "1111", "synchronicity", "coincidence", "signs", "repeating"], seekHelp: false),
        
        AwakeningSymptom(category: .cognitive,
            title: "Memory Fog / Confusion", emoji: "🌫️",
            oneLiner: "Your operating system is mid-update",
            biology: "The hippocampus (memory) and prefrontal cortex (executive function) are both affected during major psychological reorganization. Working memory temporarily declines as cognitive resources are redirected to processing the awakening. Similar to how a computer slows during a major update.",
            spiritual: "Old memories and identities are being released. The confusion is the gap between who you were and who you're becoming. Your mind is literally making room for a new operating system.",
            relief: "External supports: write everything down, set alarms, use lists. Don't make major decisions in the fog. Rest. The clarity returns — usually sharper than before. This is temporary.",
            reassurance: "Your mind isn't failing. It's defragmenting. The fog lifts, and when it does, your thinking will be clearer than it's ever been.",
            keywords: ["foggy", "confused", "forgetful", "memory", "can't think", "brain fog", "lost"], seekHelp: false),
        
        // ── SPIRITUAL ──
        
        AwakeningSymptom(category: .spiritual,
            title: "Feeling Like 'Home' Is Somewhere Else", emoji: "🌌",
            oneLiner: "Nostalgia for a place you've never been",
            biology: "The brain constructs a sense of 'home' through the hippocampus and emotional memory circuits. When your identity matrix shifts, the neural representation of 'belonging' temporarily loses its anchor, creating a sensation of cosmic displacement.",
            spiritual: "Your soul remembers where it came from — Source, the infinite, the non-physical realm. Now that your ego filters are thinner, that memory bleeds through. You feel homesick for a place that isn't physical. Many describe it as 'knowing you're not from here.'",
            relief: "Meditation focused on feeling 'at home within.' Stargazing. Nature immersion. Connection with others who feel the same. The feeling softens as you learn to carry home INSIDE you rather than seeking it externally.",
            reassurance: "You're not crazy for feeling displaced. You're remembering something your conscious mind forgot. Home isn't a place — it's a frequency. And you're finding your way back to it.",
            keywords: ["home", "displaced", "not from here", "starseed", "alien", "don't belong", "homesick"], seekHelp: false),
        
        AwakeningSymptom(category: .spiritual,
            title: "Seeing Through People / Institutions", emoji: "🎭",
            oneLiner: "Your bullshit detector is now military-grade",
            biology: "Enhanced activity in the anterior cingulate cortex (conflict detection) and reduced susceptibility to social conformity biases. Your brain is literally better at detecting incongruence between what people say and what they mean. Micro-expressions and body language become readable.",
            spiritual: "The 'veil' has thinned. You see motivations, manipulations, and programming that were invisible before. Institutions that seemed trustworthy now reveal their patterns of control. People's masks become transparent.",
            relief: "This is a superpower, but it needs boundaries. You can't unsee it, and you shouldn't. But choose when to act on it. Not everyone is ready to hear what you see. Journal your observations. Share selectively.",
            reassurance: "You're not paranoid. You're perceptive. The patterns of control you're seeing are real — and there's an entire library in this app dedicated to understanding them.",
            keywords: ["seeing through", "lies", "manipulation", "fake", "masks", "institutions", "programming"], seekHelp: false),
        
        // ── SLEEP ──
        
        AwakeningSymptom(category: .sleep,
            title: "Insomnia / Needing Only 3-4 Hours", emoji: "🌙",
            oneLiner: "Your pineal gland is activating",
            biology: "The pineal gland produces melatonin, regulating sleep. During intense spiritual/psychological shifts, pineal activity changes dramatically. Cortisol rhythms disrupt. Paradoxically, many report feeling fully rested on minimal sleep — suggesting the body is accessing deeper restorative states during shorter cycles.",
            spiritual: "The 3am-5am window is traditionally called the 'hour of God' across many traditions. Your consciousness is more active and receptive during this time. The downloads, insights, and processing happen when the rational mind is quiet.",
            relief: "Don't fight wakefulness — use it. Meditate. Journal. Create. But also: if your body says sleep, sleep. Reduce blue light. No caffeine after noon. The pattern normalizes over weeks to months.",
            reassurance: "You're not broken because you can't sleep normally. Your system is operating on a different fuel source right now. It will stabilize. Many awakened people settle into a permanent 5-6 hour pattern and feel fantastic.",
            keywords: ["sleep", "insomnia", "awake", "3am", "can't sleep", "wired", "restless"], seekHelp: false),
        
        AwakeningSymptom(category: .sleep,
            title: "Vivid / Lucid / Prophetic Dreams", emoji: "🌀",
            oneLiner: "Your subconscious is speaking louder",
            biology: "REM sleep increases during psychological reorganization. The prefrontal cortex shows altered activation patterns, producing more vivid and lucid dream states. The hippocampus is actively consolidating new neural pathways, creating dreams that feel prophetic because they're processing future-oriented information.",
            spiritual: "Dreams are the primary channel through which higher consciousness communicates. Past lives, future glimpses, symbolic messages, and direct instruction from guides/Source arrive during sleep. Keep a dream journal by your bed.",
            relief: "Write dreams immediately upon waking — they fade within minutes. Look for recurring symbols. Don't interpret too literally — dreams speak in metaphor. Share with trusted awakened friends for perspective.",
            reassurance: "Your dreams are trying to tell you something. They're not random noise — they're signal. Learn to listen, and you gain access to wisdom your waking mind can't reach.",
            keywords: ["dreams", "vivid", "lucid", "prophetic", "nightmare", "symbols", "visions"], seekHelp: false),
    ]
}
