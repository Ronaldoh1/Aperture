// ChakraHealingView.swift
// CHAKRA HEALING — "Your Energy Map"
// ☀️ SunFlow: Reignited — Awakening Guide
//
// 7 energy centers. Biology + Spirit + Practice.
// Guided healing. Prayers. Mantras. Yoga.
// Body scan. Voice-guided meditation.
//
// "I didn't know about the downloads...
//  brutal. Chakras can be reset and restored
//  and there are prayers they can follow."

import SwiftUI

// MARK: - ═══════════════════════════════════════════════════
// CHAKRA HEALING HUB
// ═══════════════════════════════════════════════════════════

struct ChakraHealingView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var selectedChakra: Int = 0
    @State private var showPractice: Bool = false
    @State private var showBodyScan: Bool = false
    @State private var expandedSections: Set<String> = []
    
    private let chakras = ChakraDatabase.allChakras
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 0.01, green: 0.01, blue: 0.04).ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 14) {
                        headerView
                        chakraSpine
                        chakraDetail(chakras[selectedChakra])
                        
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
                    Text("🌀 Chakra Healing").font(.system(size: 17, weight: .bold)).foregroundColor(.white)
                }
            }
            .sheet(isPresented: $showPractice) {
                guidedPracticeSheet(chakras[selectedChakra])
            }
        }
    }
    
    // MARK: - Header
    
    private var headerView: some View {
        VStack(spacing: 6) {
            Text("Your body is a map of energy centers.\nWhen they're blocked, you feel it.\nLet's clear the channels.").font(.system(size: 12, weight: .medium))
                .foregroundColor(.white.opacity(0.35)).multilineTextAlignment(.center).lineSpacing(2)
            
            HStack(spacing: 12) {
                miniStat("7", "Centers")
                miniStat("7", "Prayers")
                miniStat("7", "Practices")
            }
        }
    }
    
    private func miniStat(_ val: String, _ label: String) -> some View {
        VStack(spacing: 1) {
            Text(val).font(.system(size: 13, weight: .black)).foregroundColor(.white.opacity(0.4))
            Text(label).font(.system(size: 7, weight: .bold)).foregroundColor(.white.opacity(0.12))
        }
    }
    
    // MARK: - Chakra Spine (Visual Selector)
    
    private var chakraSpine: some View {
        HStack(spacing: 4) {
            ForEach(Array(chakras.enumerated()), id: \.offset) { index, chakra in
                Button {
                    withAnimation(.easeInOut(duration: 0.2)) { selectedChakra = index }
                } label: {
                    VStack(spacing: 3) {
                        Circle().fill(chakra.color.opacity(selectedChakra == index ? 0.6 : 0.15))
                            .frame(width: selectedChakra == index ? 28 : 20, height: selectedChakra == index ? 28 : 20)
                            .overlay(Text(chakra.emoji).font(.system(size: selectedChakra == index ? 14 : 10)))
                        Text(chakra.shortName).font(.system(size: 6, weight: .bold))
                            .foregroundColor(selectedChakra == index ? chakra.color : .white.opacity(0.15))
                    }
                    .frame(maxWidth: .infinity)
                }
            }
        }
        .padding(10).background(RoundedRectangle(cornerRadius: 12).fill(Color.white.opacity(0.01)))
    }
    
    // MARK: - Chakra Detail
    
    private func chakraDetail(_ chakra: ChakraData) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            // Title
            VStack(alignment: .leading, spacing: 3) {
                HStack(spacing: 6) {
                    Circle().fill(chakra.color).frame(width: 12, height: 12)
                    Text(chakra.name).font(.system(size: 18, weight: .black)).foregroundColor(.white)
                }
                Text(chakra.sanskritName + " — " + chakra.meaning).font(.system(size: 11, weight: .medium)).foregroundColor(chakra.color.opacity(0.5))
                Text(chakra.location).font(.system(size: 10, weight: .medium)).foregroundColor(.white.opacity(0.2))
            }
            
            // Element + Associations
            HStack(spacing: 8) {
                assocPill(chakra.element, "Element")
                assocPill(chakra.color.description.isEmpty ? "Color" : chakra.colorName, "Color")
                assocPill(chakra.mantra, "Mantra")
                assocPill("\(chakra.frequency)Hz", "Frequency")
            }
            
            // Overview
            sectionCard("Overview", chakra.overview, chakra.color)
            
            // Body correlation
            sectionCard("🧬 Body Connection", chakra.bodyConnection, .blue)
            
            // Imbalance signs
            sectionCard("⚠️ Signs of Imbalance", chakra.imbalanceSigns, .orange)
            
            // Healing practices
            sectionCard("💚 Healing Practices", chakra.healingPractices, Color(red: 0.3, green: 0.8, blue: 0.5))
            
            // Yoga poses
            sectionCard("🧘 Yoga Poses", chakra.yogaPoses, .cyan)
            
            // Prayer / Mantra
            VStack(alignment: .leading, spacing: 6) {
                Text("🙏 PRAYER / MEDITATION").font(.system(size: 9, weight: .black)).tracking(1).foregroundColor(chakra.color.opacity(0.5))
                Text(chakra.prayer).font(.system(size: 12, weight: .medium, design: .serif))
                    .foregroundColor(.white.opacity(0.5)).lineSpacing(4).italic()
            }
            .padding(12).background(RoundedRectangle(cornerRadius: 10).fill(chakra.color.opacity(0.02))
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(chakra.color.opacity(0.06), lineWidth: 1)))
            
            // Affirmations
            VStack(alignment: .leading, spacing: 4) {
                Text("💬 AFFIRMATIONS").font(.system(size: 9, weight: .black)).tracking(1).foregroundColor(.white.opacity(0.15))
                ForEach(chakra.affirmations, id: \.self) { aff in
                    Text("• \(aff)").font(.system(size: 11, weight: .medium)).foregroundColor(.white.opacity(0.35))
                }
            }
            .padding(10).background(RoundedRectangle(cornerRadius: 8).fill(Color.white.opacity(0.01)))
            
            // Crystals and Foods
            HStack(spacing: 8) {
                VStack(alignment: .leading, spacing: 3) {
                    Text("💎 CRYSTALS").font(.system(size: 8, weight: .black)).tracking(1).foregroundColor(.white.opacity(0.1))
                    Text(chakra.crystals.joined(separator: ", ")).font(.system(size: 9, weight: .medium)).foregroundColor(.white.opacity(0.25))
                }
                .frame(maxWidth: .infinity, alignment: .leading).padding(8)
                .background(RoundedRectangle(cornerRadius: 6).fill(Color.white.opacity(0.01)))
                
                VStack(alignment: .leading, spacing: 3) {
                    Text("🥗 FOODS").font(.system(size: 8, weight: .black)).tracking(1).foregroundColor(.white.opacity(0.1))
                    Text(chakra.foods.joined(separator: ", ")).font(.system(size: 9, weight: .medium)).foregroundColor(.white.opacity(0.25))
                }
                .frame(maxWidth: .infinity, alignment: .leading).padding(8)
                .background(RoundedRectangle(cornerRadius: 6).fill(Color.white.opacity(0.01)))
            }
            
            // Start guided practice
            Button { showPractice = true } label: {
                HStack(spacing: 6) {
                    Text("🌀").font(.system(size: 14))
                    Text("Begin \(chakra.shortName) Healing Practice").font(.system(size: 14, weight: .bold)).foregroundColor(.black)
                }
                .padding(.vertical, 14).frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 12).fill(chakra.color.opacity(0.8)))
            }
            
            // Nav
            HStack {
                if selectedChakra > 0 {
                    Button { withAnimation { selectedChakra -= 1 } } label: {
                        Text("← \(chakras[selectedChakra - 1].shortName)").font(.system(size: 11, weight: .bold)).foregroundColor(.white.opacity(0.2))
                    }
                }
                Spacer()
                if selectedChakra < 6 {
                    Button { withAnimation { selectedChakra += 1 } } label: {
                        Text("\(chakras[selectedChakra + 1].shortName) →").font(.system(size: 11, weight: .bold)).foregroundColor(chakras[selectedChakra + 1].color.opacity(0.5))
                    }
                }
            }
        }
    }
    
    // MARK: - Components
    
    private func assocPill(_ text: String, _ label: String) -> some View {
        VStack(spacing: 1) {
            Text(text).font(.system(size: 10, weight: .bold)).foregroundColor(.white.opacity(0.4))
            Text(label).font(.system(size: 6, weight: .bold)).foregroundColor(.white.opacity(0.1))
        }
        .frame(maxWidth: .infinity).padding(5).background(RoundedRectangle(cornerRadius: 4).fill(Color.white.opacity(0.015)))
    }
    
    private func sectionCard(_ title: String, _ body: String, _ color: Color) -> some View {
        let key = title + String(selectedChakra)
        return VStack(alignment: .leading, spacing: 0) {
            Button {
                withAnimation(.easeInOut(duration: 0.15)) {
                    if expandedSections.contains(key) { expandedSections.remove(key) } else { expandedSections.insert(key) }
                }
            } label: {
                HStack {
                    Text(title).font(.system(size: 11, weight: .bold)).foregroundColor(.white)
                    Spacer()
                    Image(systemName: expandedSections.contains(key) ? "chevron.up" : "chevron.down")
                        .font(.system(size: 8)).foregroundColor(.white.opacity(0.1))
                }
                .padding(10)
            }
            if expandedSections.contains(key) {
                Text(body).font(.system(size: 10, weight: .medium)).foregroundColor(.white.opacity(0.4)).lineSpacing(2)
                    .padding(.horizontal, 10).padding(.bottom, 10)
            }
        }
        .background(RoundedRectangle(cornerRadius: 8).fill(color.opacity(0.01)))
    }
    
    // MARK: - Guided Practice Sheet
    
    private func guidedPracticeSheet(_ chakra: ChakraData) -> some View {
        NavigationStack {
            ZStack {
                Color(red: 0.02, green: 0.02, blue: 0.06).ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 16) {
                        // Breathing glow
                        ZStack {
                            Circle().fill(chakra.color.opacity(0.05)).frame(width: 120, height: 120).blur(radius: 25)
                            Text(chakra.emoji).font(.system(size: 40))
                        }
                        
                        Text("\(chakra.shortName) HEALING").font(.system(size: 16, weight: .black)).tracking(2).foregroundColor(chakra.color)
                        
                        // Step-by-step guided practice
                        VStack(alignment: .leading, spacing: 10) {
                            practiceStep(1, "Find a quiet, comfortable space. Sit or lie down.", chakra.color)
                            practiceStep(2, "Close your eyes. Take 3 deep breaths — in through the nose, out through the mouth.", chakra.color)
                            practiceStep(3, "Place your awareness on your \(chakra.location.lowercased()). Feel the space there.", chakra.color)
                            practiceStep(4, "Visualize a sphere of \(chakra.colorName.lowercased()) light spinning gently at this center. With each breath, it grows brighter.", chakra.color)
                            practiceStep(5, "Chant the mantra '\(chakra.mantra)' three times, feeling the vibration at this center: \(chakra.mantra)... \(chakra.mantra)... \(chakra.mantra)...", chakra.color)
                            practiceStep(6, "Now speak the prayer:", chakra.color)
                        }
                        
                        // Prayer
                        Text(chakra.prayer).font(.system(size: 13, weight: .medium, design: .serif))
                            .foregroundColor(chakra.color.opacity(0.6)).lineSpacing(4).italic()
                            .padding(14).background(RoundedRectangle(cornerRadius: 10).fill(chakra.color.opacity(0.02))
                                .overlay(RoundedRectangle(cornerRadius: 10).stroke(chakra.color.opacity(0.06), lineWidth: 1)))
                        
                        VStack(alignment: .leading, spacing: 10) {
                            practiceStep(7, "Repeat each affirmation silently:", chakra.color)
                            ForEach(chakra.affirmations, id: \.self) { aff in
                                Text("   \"\(aff)\"").font(.system(size: 11, weight: .medium, design: .serif)).foregroundColor(.white.opacity(0.35)).italic()
                            }
                            practiceStep(8, "Sit in silence for 2-5 minutes. Feel the energy flowing freely.", chakra.color)
                            practiceStep(9, "When ready, gently open your eyes. Drink water. Ground yourself.", chakra.color)
                        }
                        
                        Text("You've just cleared and restored your \(chakra.shortName.lowercased()).\nDo this daily for best results.")
                            .font(.system(size: 11, weight: .medium)).foregroundColor(.white.opacity(0.25)).multilineTextAlignment(.center)
                        
                        Button { showPractice = false } label: {
                            Text("Complete ✓").font(.system(size: 14, weight: .bold)).foregroundColor(.black)
                                .padding(14).frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 12).fill(chakra.color))
                        }
                    }
                    .padding(20)
                }
            }
        }
    }
    
    private func practiceStep(_ num: Int, _ text: String, _ color: Color) -> some View {
        HStack(alignment: .top, spacing: 8) {
            Text("\(num)").font(.system(size: 10, weight: .black))
                .foregroundColor(color).frame(width: 18, height: 18)
                .background(Circle().fill(color.opacity(0.1)))
            Text(text).font(.system(size: 11, weight: .medium)).foregroundColor(.white.opacity(0.45)).lineSpacing(2)
        }
    }
}

// MARK: - ═══════════════════════════════════════════════════
// CHAKRA DATABASE — 7 Full Chakras
// ═══════════════════════════════════════════════════════════

struct ChakraData: Identifiable {
    let id = UUID()
    let number: Int; let name: String; let shortName: String; let sanskritName: String
    let meaning: String; let location: String; let color: Color; let colorName: String
    let emoji: String; let element: String; let mantra: String; let frequency: Int
    let overview: String; let bodyConnection: String; let imbalanceSigns: String
    let healingPractices: String; let yogaPoses: String; let prayer: String
    let affirmations: [String]; let crystals: [String]; let foods: [String]
}

struct ChakraDatabase {
    static let allChakras: [ChakraData] = [
        
        // ── 1. ROOT ──
        ChakraData(number: 1, name: "Root Chakra", shortName: "Root", sanskritName: "Muladhara",
            meaning: "Root support — foundation of existence", location: "Base of spine / perineum",
            color: .red, colorName: "Red", emoji: "🔴", element: "Earth", mantra: "LAM", frequency: 396,
            overview: "Your foundation. Survival, safety, grounding, physical identity. This is where your sense of 'I exist' and 'I belong here' lives. When balanced: you feel safe, stable, and present. When blocked: fear, anxiety, financial stress, feeling ungrounded.",
            bodyConnection: "Corresponds to the adrenal glands (cortisol/adrenaline production), the skeletal system (bones, teeth), the legs and feet, the large intestine, and the kidneys. The adrenal response — fight or flight — is rooted here. Chronic fear literally depletes this center.",
            imbalanceSigns: "Anxiety and fear without clear cause. Financial instability or obsession with money. Lower back pain, leg/knee problems. Fatigue and lethargy. Feeling 'spacey' or ungrounded. Hoarding or inability to let go. Trust issues. Eating disorders related to survival.",
            healingPractices: "Walk barefoot on earth (grounding/earthing). Spend time in nature — forests, mountains, gardens. Red foods: beets, tomatoes, strawberries, red peppers. Physical exercise — especially legs (squats, walking, dancing). Declutter your space. Address financial fears directly. Drumming and deep bass sounds.",
            yogaPoses: "Mountain Pose (Tadasana) — standing tall, rooted. Tree Pose (Vrksasana) — balance and grounding. Warrior I (Virabhadrasana I) — strength and stability. Garland Pose (Malasana) — deep squat, connecting to earth. Bridge Pose — grounding through the spine.",
            prayer: "Divine Source, ground me in your strength.\nRoot me in the earth like an ancient tree.\nLet my foundation be unshakable.\nI release all fear of survival.\nI am safe. I am held. I am home.\nFrom this root, let all else grow.\nLAM. LAM. LAM.\nAnd so it is.",
            affirmations: ["I am safe and secure in this world", "I have everything I need", "I am grounded, stable, and strong", "The earth supports me completely", "I release all fear and trust life"],
            crystals: ["Red Jasper", "Garnet", "Black Tourmaline", "Hematite", "Smoky Quartz"],
            foods: ["Beets", "Red peppers", "Tomatoes", "Root vegetables", "Protein-rich foods"]),
        
        // ── 2. SACRAL ──
        ChakraData(number: 2, name: "Sacral Chakra", shortName: "Sacral", sanskritName: "Svadhisthana",
            meaning: "One's own dwelling — the seat of creativity", location: "Lower abdomen, 2 inches below navel",
            color: .orange, colorName: "Orange", emoji: "🟠", element: "Water", mantra: "VAM", frequency: 417,
            overview: "Your creative and emotional center. Pleasure, sexuality, relationships, and the ability to FEEL. This is where passion, desire, and emotional fluidity live. When balanced: creative flow, healthy relationships, emotional resilience. When blocked: guilt, emotional numbness, creative blocks, relationship dysfunction.",
            bodyConnection: "Corresponds to reproductive organs (ovaries, testes), the bladder, kidneys, and lower digestive system. Governs bodily fluids — blood, lymph, tears. Hormones like estrogen, testosterone, and progesterone are regulated here. Hip tension = sacral blockage.",
            imbalanceSigns: "Emotional volatility or emotional numbness. Low libido or sexual dysfunction. Hip pain, lower back pain, urinary issues. Creative blocks — can't make art, write, or innovate. Guilt around pleasure. Codependency or fear of intimacy. Addiction (seeking external stimulation for what's missing internally).",
            healingPractices: "Hip-opening movements — dancing, swimming, hip circles. Creative expression — paint, write, cook, build with no goal. Orange foods: oranges, mangoes, carrots, sweet potatoes. Water rituals — baths, ocean, rain. Healthy sensuality — massage, intimacy, touch. Process old guilt through journaling.",
            yogaPoses: "Pigeon Pose (Kapotasana) — deep hip opening. Goddess Pose (Utkata Konasana) — sacral power. Bound Angle Pose (Baddha Konasana) — hip and groin opening. Reclined Butterfly — surrender and release. Happy Baby — playful release.",
            prayer: "Divine Source, restore my creative fire.\nLet the waters of emotion flow freely through me\nwithout drowning or drying.\nI release all guilt around pleasure and feeling.\nMy creativity is sacred. My emotions are wisdom.\nI am allowed to FEEL everything.\nVAM. VAM. VAM.\nAnd so it is.",
            affirmations: ["I honor my emotions as sacred messengers", "I deserve pleasure and joy", "My creativity flows freely and abundantly", "I am comfortable in my body", "I release guilt and embrace my desires"],
            crystals: ["Carnelian", "Orange Calcite", "Tiger's Eye", "Moonstone", "Sunstone"],
            foods: ["Oranges", "Mangoes", "Carrots", "Sweet potatoes", "Coconut water"]),
        
        // ── 3. SOLAR PLEXUS ──
        ChakraData(number: 3, name: "Solar Plexus Chakra", shortName: "Solar Plexus", sanskritName: "Manipura",
            meaning: "Lustrous gem — city of jewels", location: "Upper abdomen / stomach area",
            color: .yellow, colorName: "Yellow", emoji: "🟡", element: "Fire", mantra: "RAM", frequency: 528,
            overview: "Your personal power center. Confidence, willpower, self-esteem, and the ability to ACT. This is your inner fire — the engine that turns intention into manifestation. When balanced: confident, decisive, strong sense of self. When blocked: low self-worth, indecision, people-pleasing, digestive issues.",
            bodyConnection: "Corresponds to the pancreas, liver, stomach, spleen, and digestive system. The 'gut feeling' is literal — your enteric nervous system (second brain) contains 500 million neurons. Stomach butterflies, nausea during stress, and digestive problems all correlate to solar plexus imbalance.",
            imbalanceSigns: "Low self-esteem and shame spirals. Digestive problems — IBS, acid reflux, bloating. Difficulty making decisions. People-pleasing and inability to say no. Control issues — either too rigid or too passive. Chronic fatigue. Victim mentality.",
            healingPractices: "Core strengthening — planks, crunches, martial arts. Yellow foods: bananas, corn, pineapple, ginger, turmeric. Set boundaries deliberately — say 'no' to one thing today. Journaling about personal power — when did you give it away? Sunlight exposure. Fire ceremonies or candle meditation.",
            yogaPoses: "Boat Pose (Navasana) — core fire activation. Warrior III (Virabhadrasana III) — power and balance. Plank Pose — sustained willpower. Bow Pose (Dhanurasana) — opening and igniting. Sun Salutations — activating inner fire.",
            prayer: "Divine Source, ignite my inner fire.\nBurn away every doubt, every shame, every lie\nthat told me I was not enough.\nI reclaim my power. I reclaim my voice.\nI am the author of my life.\nNo person, no institution, no system\ndefines my worth. I do.\nRAM. RAM. RAM.\nAnd so it is.",
            affirmations: ["I am powerful and I know my worth", "I honor my boundaries and speak my truth", "I am the architect of my own life", "My willpower is strong and clear", "I release all shame and stand in my power"],
            crystals: ["Citrine", "Yellow Jasper", "Pyrite", "Amber", "Tiger's Eye"],
            foods: ["Bananas", "Pineapple", "Corn", "Ginger", "Turmeric"]),
        
        // ── 4. HEART ──
        ChakraData(number: 4, name: "Heart Chakra", shortName: "Heart", sanskritName: "Anahata",
            meaning: "Unstruck — untouched by pain", location: "Center of chest",
            color: Color(red: 0.2, green: 0.8, blue: 0.4), colorName: "Green", emoji: "💚", element: "Air", mantra: "YAM", frequency: 639,
            overview: "The bridge between lower (physical) and upper (spiritual) chakras. Love, compassion, forgiveness, connection to Source. Anahata means 'unstruck' — the part of you that remains untouched by any pain. When balanced: unconditional love, empathy, forgiveness. When blocked: grief, resentment, chest pain, isolation.",
            bodyConnection: "Corresponds to the thymus gland (immune system), heart, lungs, circulatory system, arms, and hands. The vagus nerve — your body's main calming circuit — runs through this center. Heart coherence (measurable via HRV) directly reflects heart chakra balance.",
            imbalanceSigns: "Chest tightness or heart palpitations. Difficulty giving or receiving love. Resentment and inability to forgive. Respiratory issues — asthma, shallow breathing. Codependency or emotional withdrawal. Fear of intimacy. Feeling disconnected from Source/God/Universe.",
            healingPractices: "Chest-opening stretches. Loving-kindness (metta) meditation — send love to self, then others. Green foods: leafy greens, avocado, green tea, matcha. Forgiveness practices — write a letter you never send. Spend time with animals. Hug someone. Heart-focused breathing from HeartMath. Rose essential oil.",
            yogaPoses: "Camel Pose (Ustrasana) — deep chest opening. Cobra Pose (Bhujangasana) — heart lift. Fish Pose (Matsyasana) — throat and heart opening. Bridge Pose with hands interlaced — heart expansion. Eagle Arms (Garudasana) — upper back release.",
            prayer: "Divine Source, open my heart.\nDissolve every wall I built to protect myself\nfrom love, from connection, from You.\nI forgive those who hurt me.\nI forgive myself for closing.\nLet Your love flow through me like a river\nthat never stops, never judges, never withholds.\nI am love. I am loved. I am love itself.\nYAM. YAM. YAM.\nAnd so it is.",
            affirmations: ["I give and receive love freely", "I forgive myself and others with grace", "My heart is open and healing", "I am connected to the infinite love of Source", "Love flows through me to all beings"],
            crystals: ["Rose Quartz", "Green Aventurine", "Jade", "Emerald", "Rhodonite"],
            foods: ["Leafy greens", "Avocado", "Green tea", "Broccoli", "Kiwi"]),
        
        // ── 5. THROAT ──
        ChakraData(number: 5, name: "Throat Chakra", shortName: "Throat", sanskritName: "Vishuddha",
            meaning: "Purification — the pure voice", location: "Throat / neck area",
            color: .blue, colorName: "Blue", emoji: "🔵", element: "Ether/Sound", mantra: "HAM", frequency: 741,
            overview: "Your truth center. Communication, authentic self-expression, speaking your reality into existence. When balanced: clear communication, creative expression, speaking truth without fear. When blocked: sore throats, inability to express feelings, fear of judgment, lying to yourself or others.",
            bodyConnection: "Corresponds to the thyroid gland (metabolism, growth), parathyroid, jaw, neck, mouth, tongue, and vocal cords. Thyroid imbalances — hypo or hyper — often correlate with unexpressed truths. Jaw tension (TMJ) = swallowed words.",
            imbalanceSigns: "Chronic sore throat or thyroid issues. Fear of speaking up or being heard. Gossiping or lying. Jaw clenching / TMJ. Inability to express emotions verbally. Feeling 'voiceless' in relationships or work. Social anxiety.",
            healingPractices: "Singing, humming, chanting — any vocalization. Write and speak your truth — journal then read aloud. Blue foods: blueberries, blackberries. Neck stretches and rolls. Drink warm tea with honey. Say what you've been avoiding saying. Record voice memos of your authentic thoughts.",
            yogaPoses: "Fish Pose (Matsyasana) — throat opening. Shoulder Stand (Sarvangasana) — thyroid stimulation. Plow Pose (Halasana) — throat compression and release. Lion's Breath (Simhasana) — powerful vocal release. Neck rolls and stretches.",
            prayer: "Divine Source, free my voice.\nLet me speak the truth that lives inside me\nwithout fear, without apology, without shrinking.\nMy words are powerful. My truth matters.\nI release every time I was silenced,\nevery time I silenced myself.\nFrom this moment, I speak my reality into being.\nHAM. HAM. HAM.\nAnd so it is.",
            affirmations: ["I speak my truth with clarity and love", "My voice matters and deserves to be heard", "I express myself freely and authentically", "I release the need for others' approval to speak", "My words create my reality"],
            crystals: ["Lapis Lazuli", "Aquamarine", "Blue Lace Agate", "Sodalite", "Turquoise"],
            foods: ["Blueberries", "Blackberries", "Herbal teas", "Honey", "Coconut water"]),
        
        // ── 6. THIRD EYE ──
        ChakraData(number: 6, name: "Third Eye Chakra", shortName: "Third Eye", sanskritName: "Ajna",
            meaning: "Command center — beyond wisdom", location: "Forehead, between eyebrows",
            color: .indigo, colorName: "Indigo", emoji: "🟣", element: "Light", mantra: "OM", frequency: 852,
            overview: "Your intuition center. Inner vision, insight, imagination, and the ability to see beyond physical reality. This is where 'downloads' arrive and pattern recognition activates. When balanced: strong intuition, clear vision, vivid dreams. When blocked: headaches, overthinking, disconnection from intuition, illusion.",
            bodyConnection: "Corresponds to the pineal gland (melatonin, DMT-related compounds), pituitary gland, eyes, and the brain's visual processing centers. The pineal gland — called 'the seat of the soul' by Descartes — is light-sensitive and calcifies with fluoride and toxins. Decalcification restores function.",
            imbalanceSigns: "Headaches and migraines (especially forehead). Difficulty trusting intuition. Overthinking and analysis paralysis. Nightmares or inability to remember dreams. Poor concentration. Feeling disconnected from purpose. Living in fantasy or delusion.",
            healingPractices: "Meditation — especially with eyes closed, focusing on the point between brows. Indigo/purple visualization. Reduce fluoride intake (filtered water). Sungazing at dawn/dusk (carefully). Dream journaling immediately upon waking. Trust your gut more — act on intuition daily. Fasting or light eating clears the channel.",
            yogaPoses: "Child's Pose (Balasana) — forehead on ground. Downward Dog (Adho Mukha) — blood flow to third eye. Forward Folds — inversion for the brain. Alternate Nostril Breathing (Nadi Shodhana) — balances hemispheres. Seated Meditation — stillness activates.",
            prayer: "Divine Source, open my inner eye.\nLet me see what is hidden.\nLet me know what is true.\nClear the fog of illusion,\nthe noise of deception,\nthe blindness of conditioning.\nI trust the vision you give me,\neven when it frightens me.\nMy intuition is divine. My sight is sacred.\nOM. OM. OM.\nAnd so it is.",
            affirmations: ["I trust my intuition completely", "I see clearly through all illusion", "My inner vision guides me to truth", "I am open to divine insight and wisdom", "I see the patterns that others miss"],
            crystals: ["Amethyst", "Fluorite", "Labradorite", "Lapis Lazuli", "Azurite"],
            foods: ["Purple grapes", "Eggplant", "Purple cabbage", "Cacao", "Omega-3 rich foods"]),
        
        // ── 7. CROWN ──
        ChakraData(number: 7, name: "Crown Chakra", shortName: "Crown", sanskritName: "Sahasrara",
            meaning: "Thousand-petaled lotus — infinite connection", location: "Top of the head",
            color: .purple, colorName: "Violet/White", emoji: "👑", element: "Thought/Consciousness", mantra: "Silence/OM", frequency: 963,
            overview: "Your connection to Source, the divine, the infinite. Unity consciousness, enlightenment, transcendence. This is where you meet God/Source/Universe directly — no intermediary needed. When balanced: peace, purpose, connection to all things. When blocked: spiritual disconnection, cynicism, existential dread, feeling meaningless.",
            bodyConnection: "Corresponds to the cerebral cortex, the central nervous system, and the pineal/pituitary axis. The crown connects to the entire body through the nervous system — when open, every other chakra receives clearer signals. Neurologically associated with gamma brain waves (40+ Hz) — the frequency of peak consciousness.",
            imbalanceSigns: "Spiritual disconnection or nihilism. Feeling purposeless or meaningless. Excessive attachment to material world. Inability to meditate or be still. Depression rooted in existential void. Closed-mindedness. Neurological issues.",
            healingPractices: "Silent meditation — just being, no doing. Prayer and devotion — to whatever you call the divine. Fasting (spiritual, not extreme). Spending time in sacred spaces — nature, temples, mountains. Violet/white visualization at the crown. Studying sacred texts. Service to others. Gratitude practice.",
            yogaPoses: "Headstand (Sirsasana) — modified with wall support. Lotus Pose (Padmasana) — seated meditation. Corpse Pose (Savasana) — total surrender. Prayer Pose (Anjali Mudra) — hands at crown. Tree Pose — grounded connection to sky.",
            prayer: "Divine Source — God — Universe — Infinite One —\nI open the crown of my being to You.\nPour Your light through me.\nLet me remember that I am not separate from You.\nI am not separate from anything.\nThe illusion of isolation dissolves.\nI am a drop that remembers it is the ocean.\nFill me. Guide me. Use me.\nI surrender to the truth of what I am.\nOM. Silence. OM.\nAnd so it is. And so it always was.",
            affirmations: ["I am one with the infinite", "Divine light flows through me always", "I am connected to Source at all times", "I trust the universe completely", "I am both the drop and the ocean"],
            crystals: ["Clear Quartz", "Amethyst", "Selenite", "Diamond", "Howlite"],
            foods: ["Fasting/Light eating", "Herbal tea", "Pure water", "Mushrooms", "Sacred cacao"]),
    ]
}
