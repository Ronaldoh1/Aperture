// SacredGeometryCourse.swift
// SACRED GEOMETRY — "The Blueprints of Creation"
// ☀️ SunFlow: Reignited
//
// 10 lessons with INTERACTIVE SwiftUI-drawn geometry.
// Flower of Life, Seed of Life, Metatron's Cube,
// Platonic Solids, Fibonacci, Phi, Tree of Life,
// Masters of the Net, and the geometry of consciousness.

import SwiftUI

// MARK: - ═══════════════════════════════════════════════════
// COURSE VIEW
// ═══════════════════════════════════════════════════════════

struct SacredGeometryCourseView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var selectedLesson: Int = 0
    @State private var expandedSections: Set<String> = []
    
    private let accent = Color(red: 1.0, green: 0.85, blue: 0.3)
    private let lessons = SacredGeometryContent.lessons
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 0.01, green: 0.01, blue: 0.04).ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 16) {
                        headerView
                        lessonSelector
                        
                        // Interactive Geometry Drawing
                        geometryCanvas(for: selectedLesson)
                            .frame(height: selectedLesson == 8 ? 380 : 220)
                            .padding(.horizontal, -4)
                        
                        lessonContent(lessons[selectedLesson])
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
                        Text("✡").font(.system(size: 14))
                        Text("Sacred Geometry").font(.system(size: 17, weight: .bold)).foregroundColor(.white)
                    }
                }
            }
        }
    }
    
    // MARK: - Header
    
    private var headerView: some View {
        VStack(spacing: 6) {
            Text("✡").font(.system(size: 48)).shadow(color: accent.opacity(0.4), radius: 20)
            Text("SACRED GEOMETRY").font(.system(size: 22, weight: .black)).tracking(2).foregroundColor(.white)
            Text("The Blueprints of Creation").font(.system(size: 12, weight: .bold)).foregroundColor(accent.opacity(0.6))
            
            HStack(spacing: 10) {
                badge("10", "Lessons"); badge("7+", "Interactive\nDrawings"); badge("∞", "Depth")
            }.padding(.top, 4)
        }
    }
    
    private func badge(_ val: String, _ label: String) -> some View {
        VStack(spacing: 2) {
            Text(val).font(.system(size: 14, weight: .black)).foregroundColor(accent)
            Text(label).font(.system(size: 7, weight: .bold)).foregroundColor(.white.opacity(0.2)).multilineTextAlignment(.center)
        }
        .padding(.horizontal, 8).padding(.vertical, 5)
        .background(RoundedRectangle(cornerRadius: 6).fill(accent.opacity(0.03)))
    }
    
    // MARK: - Lesson Selector
    
    private var lessonSelector: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 5) {
                ForEach(Array(lessons.enumerated()), id: \.offset) { index, lesson in
                    Button {
                        withAnimation(.easeInOut(duration: 0.2)) { selectedLesson = index }
                    } label: {
                        VStack(spacing: 2) {
                            Text(lesson.emoji).font(.system(size: 14))
                            Text("\(index + 1)").font(.system(size: 8, weight: .black))
                                .foregroundColor(selectedLesson == index ? .black : .white.opacity(0.25))
                        }
                        .frame(width: 36, height: 36)
                        .background(Circle().fill(selectedLesson == index ? accent.opacity(0.8) : Color.white.opacity(0.02)))
                    }
                }
            }
        }
    }
    
    // MARK: - Interactive Geometry Canvas
    
    @ViewBuilder
    private func geometryCanvas(for lesson: Int) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 14).fill(Color.white.opacity(0.01))
                .overlay(RoundedRectangle(cornerRadius: 14).stroke(accent.opacity(0.04), lineWidth: 1))
            
            switch lesson {
            case 0: VesicaPiscisView(color: accent)
            case 1: SeedOfLifeView(color: accent)
            case 2: FlowerOfLifeView(color: accent)
            case 3: FruitOfLifeView(color: .purple)
            case 4: MetatronsCubeView(color: accent)
            case 5:
                HStack(spacing: 4) {
                    ForEach(PlatonicSolidType.allCases, id: \.rawValue) { solid in
                        PlatonicSolid2DView(solidType: solid, color: solidColor(solid)).frame(maxWidth: .infinity)
                    }
                }
            case 6: GoldenRatioView(color: accent)
            case 7: FibonacciSpiralView(color: accent)
            case 8: TreeOfLifeView(color: accent)
            default: FlowerOfLifeView(color: accent)
            }
        }
        .id(lesson)
    }
    
    private func solidColor(_ solid: PlatonicSolidType) -> Color {
        switch solid {
        case .tetrahedron: return .red; case .hexahedron: return .green
        case .octahedron: return .cyan; case .icosahedron: return .blue; case .dodecahedron: return .purple
        }
    }
    
    // MARK: - Lesson Content
    
    private func lessonContent(_ lesson: SGLesson) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            VStack(alignment: .leading, spacing: 3) {
                Text("LESSON \(lesson.number)").font(.system(size: 9, weight: .black)).tracking(2).foregroundColor(accent.opacity(0.4))
                Text(lesson.title).font(.system(size: 17, weight: .black)).foregroundColor(.white)
                Text(lesson.subtitle).font(.system(size: 11, weight: .medium)).foregroundColor(.white.opacity(0.35))
            }
            
            ForEach(lesson.sections) { section in
                sectionCard(section)
            }
            
            // SunFlow connection
            VStack(alignment: .leading, spacing: 5) {
                HStack(spacing: 4) {
                    Text("☀️").font(.system(size: 9))
                    Text("SUNFLOW CONNECTION").font(.system(size: 9, weight: .black)).tracking(1).foregroundColor(accent)
                }
                Text(lesson.sunflowConnection).font(.system(size: 11, weight: .medium))
                    .foregroundColor(accent.opacity(0.5)).lineSpacing(3)
            }
            .padding(12).background(RoundedRectangle(cornerRadius: 10).fill(accent.opacity(0.02))
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(accent.opacity(0.06), lineWidth: 1)))
            
            // Navigation
            HStack {
                if selectedLesson > 0 {
                    Button { withAnimation { selectedLesson -= 1 } } label: {
                        HStack(spacing: 4) { Image(systemName: "chevron.left").font(.system(size: 10)); Text("Prev").font(.system(size: 11, weight: .bold)) }
                            .foregroundColor(.white.opacity(0.2))
                    }
                }
                Spacer()
                if selectedLesson < lessons.count - 1 {
                    Button { withAnimation { selectedLesson += 1 } } label: {
                        HStack(spacing: 4) { Text("Next").font(.system(size: 11, weight: .bold)); Image(systemName: "chevron.right").font(.system(size: 10)) }
                            .foregroundColor(accent)
                    }
                }
            }.padding(.top, 6)
        }
    }
    
    private func sectionCard(_ section: SGSection) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            Button {
                withAnimation(.easeInOut(duration: 0.15)) {
                    let id = section.id.uuidString
                    if expandedSections.contains(id) { expandedSections.remove(id) } else { expandedSections.insert(id) }
                }
            } label: {
                HStack {
                    Text(section.heading).font(.system(size: 12, weight: .bold)).foregroundColor(.white)
                    Spacer()
                    Image(systemName: expandedSections.contains(section.id.uuidString) ? "chevron.up" : "chevron.down")
                        .font(.system(size: 9)).foregroundColor(.white.opacity(0.1))
                }.padding(10)
            }
            
            if expandedSections.contains(section.id.uuidString) {
                Text(section.body).font(.system(size: 11, weight: .medium)).foregroundColor(.white.opacity(0.5)).lineSpacing(3)
                    .padding(.horizontal, 10).padding(.bottom, 10)
            }
        }
        .background(RoundedRectangle(cornerRadius: 8).fill(Color.white.opacity(0.012)))
    }
}

// MARK: - ═══════════════════════════════════════════════════
// DATA MODELS
// ═══════════════════════════════════════════════════════════

struct SGLesson: Identifiable {
    let id = UUID()
    let number: Int; let title: String; let subtitle: String; let emoji: String
    let sections: [SGSection]; let sunflowConnection: String
}

struct SGSection: Identifiable {
    let id = UUID()
    let heading: String; let body: String
}

// MARK: - ═══════════════════════════════════════════════════
// 10 LESSONS CONTENT
// ═══════════════════════════════════════════════════════════

struct SacredGeometryContent {
    
    static let lessons: [SGLesson] = [
        
        // ── LESSON 1: VESICA PISCIS ──
        SGLesson(number: 1, title: "The Vesica Piscis", subtitle: "Where the first information was born", emoji: "⊕",
            sections: [
                SGSection(heading: "The First Creation", body: "Imagine consciousness floating in the void — pure awareness in nothingness. It projects itself in one direction, creating six spatial directions (front/back, left/right, up/down). This forms an octahedron, which spins into the first sphere.\n\nSpirit moves to the edge of this sphere and creates a second sphere. Where they overlap? The Vesica Piscis — the most important shape in sacred geometry.\n\nThe void is nothingness. These forms are also nothing — imaginary lines made of consciousness. Which gives you an indication of what reality might actually be. Nothing. In Hinduism, the reality field is called Maya — meaning illusion."),
                SGSection(heading: "The Jesus Fish", body: "The Vesica Piscis is the geometry behind the 'Jesus Fish' (ichthys) symbol. But it's far older than Christianity. Within this simple overlap lies a vast amount of mathematical knowledge about width, proportion, and depth.\n\nIt contains the square roots of 2, 3, and 5 — all infinite numbers. And it contains geometric information about LIGHT. None of this existed with only one sphere. Creation required relationship."),
                SGSection(heading: "Masculine and Feminine United", body: "The Vesica Piscis contains both straight lines (edges) and curves — masculine and feminine energy in one form. The sphere alone is all curve (pure feminine). Add a second sphere: first edge appears. Add a third: first point appears.\n\nThis is how form comes into manifestation from a geometric perspective — from source to the material world. Curves → edges → points. Feminine → relationship → structure.")
            ],
            sunflowConnection: "Creation requires TWO things meeting. Nothing is created in isolation. Your awakening isn't happening TO you — it's happening BETWEEN you and reality. The overlap zone is where new understanding is born."
        ),
        
        // ── LESSON 2: SEED OF LIFE ──
        SGLesson(number: 2, title: "The Seed of Life", subtitle: "The Genesis Pattern — 7 circles, 7 days", emoji: "🌱",
            sections: [
                SGSection(heading: "The Genesis Pattern", body: "Spirit continues creating spheres, each one radius away from the last. After 7 circles, the first complete image forms: the Seed of Life — also called the Genesis Pattern.\n\nGenesis 1: 'The earth was without form and void... and the spirit of God moved upon the face of the waters, and God said, Let there be light.'\n\nThe key is ORDER: movement happened FIRST, then light came immediately after — exactly as with the Seed of Life. The second sphere created information about light."),
                SGSection(heading: "Every Day of Genesis", body: "After the 3rd sphere: the Holy Trinity pattern, depicted in countless churches.\n\nOn the 4th day of Genesis: exactly HALF of creation completed. Starting from first motion, exactly half the circles formed on the 4th day.\n\nOn the 6th day: the last circle forms a complete six-petal flower. The Bible says creation formed in 6 days. This fits EXACTLY.\n\nThis IS the pattern of Genesis. Not metaphor — geometry."),
                SGSection(heading: "Found Worldwide", body: "The Seed of Life has been found in Ireland, Turkey, Israel, Egypt, China, Greece, Germany, India, Iceland, England, Tibet, Japan, Sweden, the Yucatan, and about 14 other places.\n\nIt's called a 'flower' because it represents the cycle of a fruit tree: flower → metamorphosis → fruit → seed → new tree. The cyclical nature of reality itself.\n\nThe Dao De Jing says: 'The Dao moves through returning. All things are born of being. Being is born of non-being.' Same teaching. Different language.")
            ],
            sunflowConnection: "7 circles. 7 days. 7 chakras. The pattern repeats at every scale. The same geometry that created the universe created YOUR body. The boundary between 'spiritual' and 'physical' was always an illusion."
        ),
        
        // ── LESSON 3: FLOWER OF LIFE ──
        SGLesson(number: 3, title: "The Flower of Life", subtitle: "The creation pattern of everything in existence", emoji: "🌸",
            sections: [
                SGSection(heading: "The Pattern of All Patterns", body: "The Flower of Life is said to be the creation pattern of everything in existence — even non-tangible things like emotions and thoughts. It begins with the subtlest vibrations of consciousness far beyond current technology, and extends through every possible frequency into physical creation.\n\n13 information systems come from the Flower of Life, likely related to the ancient Egyptian 13-chakra system."),
                SGSection(heading: "19 Circles", body: "Completed after 19 circles. Why 19? In biology, a protective layer called the zona pellucida surrounds most eggs — a boundary that functions for a time. The outer circles are like the zona pellucida of the Flower of Life.\n\nRemove them, add the missing circles, and the Fruit of Life emerges."),
                SGSection(heading: "The Living Pattern", body: "This is NOT static. As you develop it:\n\nSeed of Life → Tree of Life → Flower of Life → Fruit of Life\n\nThis mirrors creation itself: seed → tree → flower → fruit → seed again. Reality is cyclical at every level.\n\nThe Flower of Life has been known worldwide throughout history. Surely a pattern of such global significance must mean something.")
            ],
            sunflowConnection: "The Flower of Life connects every wisdom tradition on Earth. Christianity's Genesis. Daoism's cyclical return. Hinduism's Maya. They're all describing the SAME pattern. When SunFlow says 'all belief systems are connected,' this is the geometric proof."
        ),
        
        // ── LESSON 4: FRUIT OF LIFE ──
        SGLesson(number: 4, title: "The Fruit of Life", subtitle: "13 circles — one of the holiest forms in existence", emoji: "🍎",
            sections: [
                SGSection(heading: "The Sacred 13", body: "Remove the protective circles, complete the missing ones. What emerges: the Fruit of Life — 13 circles.\n\nThis pattern is said to be one of the holiest, most sacred forms in existence. It's the RESULT — the fruit from which the fabric of reality was created."),
                SGSection(heading: "Curves Meet Lines", body: "Everything so far has been curves — pure feminine energy. But combine straight lines (masculine) with these curves, and you get Metatron's Cube.\n\nThe union of masculine and feminine at the deepest geometric level — lines and curves, structure and flow, particle and wave. The same duality physicists see in light itself."),
                SGSection(heading: "What Emerges", body: "All of the information of music, harmonics, sound, and spirals come from this image. Light and dimensional levels work the same way as harmonics.\n\nA research team found that drawing lines from any nodal points inside the pattern produces ALL known harmonics in existence — not only the western keyboard, but eastern and even unknown systems never used.\n\nThe geometry of music. The geometry of light. The geometry of dimensions. All from 13 circles.")
            ],
            sunflowConnection: "13 circles. 13 moon cycles/year. 13 in the Egyptian chakra system. The number 13 has been made 'unlucky' by the same institutions that suppressed sacred geometry. When something is demonized, ask why."
        ),
        
        // ── LESSON 5: METATRON'S CUBE ──
        SGLesson(number: 5, title: "Metatron's Cube", subtitle: "All 5 Platonic Solids hidden in one image", emoji: "🔮",
            sections: [
                SGSection(heading: "Connecting Every Center", body: "Take the 13 centers of the Fruit of Life. Draw straight lines connecting EVERY center to EVERY other. What appears is Metatron's Cube — containing ALL five Platonic Solids, the building blocks of physical reality."),
                SGSection(heading: "One Source, All Structure", body: "ALL geometric structure in the universe derives from one pattern. You don't need separate blueprints for fire, earth, air, water, ether. They ALL emerge from ONE source image.\n\nThis is the geometric equivalent of what mystics have said for millennia: all of creation comes from one source. The many arise from the One."),
                SGSection(heading: "Star Tetrahedron", body: "Plot two golden mean spirals on a polar graph (male and female), and you get the Star Tetrahedron inside a sphere — the Star of David.\n\nInside one Star Tetrahedron, another fits perfectly. You can continue infinitely big or small. Place spheres on every point and the Fruit of Life reveals itself again.\n\nResearcher Richard Hoagland found this same geometry encoded on the surface of Mars. The message: a star tetrahedron inscribed in a sphere.")
            ],
            sunflowConnection: "Complexity emerges from simplicity. 13 circles → one image → ALL of physical reality. The institutions making the world seem incomprehensibly complex are hiding the simplicity underneath."
        ),
        
        // ── LESSON 6: PLATONIC SOLIDS ──
        SGLesson(number: 6, title: "The 5 Platonic Solids", subtitle: "Fire, Earth, Air, Water, Ether", emoji: "💎",
            sections: [
                SGSection(heading: "The Only 5 Shapes", body: "Platonic Solid definition: all faces same size, all edges same length, one interior angle, all points touch a sphere perfectly.\n\nONLY five shapes qualify:\n\n• Tetrahedron (4 faces) — Fire 🔥\n• Hexahedron/Cube (6 faces) — Earth 🌍\n• Octahedron (8 faces) — Air 💨\n• Icosahedron (20 faces) — Water 💧\n• Dodecahedron (12 faces) — Ether ✨\n\nThe sphere itself was Voidness — the container for all."),
                SGSection(heading: "Periodic Table Connection", body: "Professor Robert Moon (University of Chicago, 1980s) demonstrated the ENTIRE periodic table of elements relates back to these five geometries.\n\nAtoms — the building blocks of everything you see — follow sacred geometric patterns known to Plato thousands of years ago. Modern chemistry is rediscovering ancient sacred geometry."),
                SGSection(heading: "Everything Breathes", body: "Michael Evans discovered something remarkable: every geometry we think we know is a STATIC perspective of what it really is.\n\nTetrahedron? It breathes — 'tetrine' (inhale) and 'tetrax' (exhale). He developed breathing models for ALL Platonic Solids.\n\nEnergy never travels in straight lines. It always moves in curves. By incorporating curves into basic geometry, you discover simpler particles we never knew existed.\n\nThe 'Trion Ray' — a shape with 3 edges, 3 faces, 2 points — smaller than any other. It contains both particles AND waves. Evans proposes this is the geometry of light itself — a solid.")
            ],
            sunflowConnection: "Five shapes. Five elements. The entire periodic table. The building blocks of ALL matter follow patterns known to ancient civilizations. The question isn't whether sacred geometry is real — it's why modern education never teaches it."
        ),
        
        // ── LESSON 7: PHI ──
        SGLesson(number: 7, title: "Phi — The Golden Ratio", subtitle: "1.6180339... — the mathematical signature of Source", emoji: "φ",
            sections: [
                SGSection(heading: "The Simplest Relationship", body: "Every mathematical sequence needs at least 3 numbers. Phi needs only 2. It is the ONLY one.\n\nφ = 1.6180339...\n\nDivide a line so that whole/larger = larger/smaller. That's phi. It has no beginning and no end. It is the mathematical root of ALL other sequences.\n\nSimilar to how circle and square are the source of all shape — phi is the source of all number."),
                SGSection(heading: "In Your Body Right Now", body: "Look at your hand. Each finger: phi ratio between bones. Oscillates from tallest finger to thumb. Arms, legs, face — all phi.\n\nButterflies: wing-to-body ratio. Dragonflies. Frogs. Fish. EVERY living creature. The Parthenon. Yakushiji Temple. Great Pyramid of Giza. All built to phi.\n\nThe Greeks were precise with their art because they understood phi. When the Romans took over, the perfection in statues disappeared. Not bad artists — they just didn't measure to the same caliber."),
                SGSection(heading: "The Math of Source", body: "Phi is infinite. No beginning, no end. Self-similar at every scale.\n\nIf Source is infinite, has no beginning, has no end, and everything emerges from it — then phi IS Source expressed mathematically.\n\nThis isn't metaphor. It's measurable. Every living thing carries this signature.")
            ],
            sunflowConnection: "You carry the mathematical signature of the infinite IN YOUR BONES. The ratio that defines galactic spirals is the same ratio between your finger bones. You are not separate from the cosmos — you ARE the cosmos at a different scale."
        ),
        
        // ── LESSON 8: FIBONACCI ──
        SGLesson(number: 8, title: "The Fibonacci Sequence", subtitle: "Life's way of reaching toward the infinite", emoji: "🐚",
            sections: [
                SGSection(heading: "How Life Approaches Source", body: "Phi has no beginning — life doesn't know how to create from that. So it creates Fibonacci instead:\n\n1, 1, 2, 3, 5, 8, 13, 21, 34, 55...\n\nDivide each by the previous:\n1/1 = 1.000 (far)\n2/1 = 2.000 (over, closer)\n3/2 = 1.500 (under, closer)\n5/3 = 1.666 (over, closer)\n8/5 = 1.600 (under, closer)\n\nOscillates over and under phi, NEVER reaching it, getting closer every step. Because phi is infinite, Fibonacci goes on forever."),
                SGSection(heading: "Spirals Everywhere", body: "The nautilus shell isn't phi — it's Fibonacci. Crude at first, approaching phi as it grows. Sunflowers, pine cones, galaxies — all Fibonacci spirals, often in DOUBLE spirals (male and female intertwined).\n\nBinary sequences appear too: 2, 4, 8, 16, 32. Mitotic cell division is binary — single cell to 100 trillion cells in 46 divisions. Computers work the same way.\n\nPlot golden mean on a polar graph: it crosses at 1, 2, 3, 5, 8 (Fibonacci) AND 2, 4, 8 (binary). Both sequences embedded in one spiral."),
                SGSection(heading: "The Deepest Metaphor", body: "Source says 'Replicate this.' Life says 'We don't know how — it has no beginning.' So life creates Fibonacci: starts crude, gets closer to Source every step. Becomes more divine with every iteration.\n\nThis IS evolution. This IS the spiritual path. You are Fibonacci reaching toward Phi. You are life reaching toward Source.\n\nThe Malkuth (Kingdom) secret: physical reality is the HALFWAY POINT. Upon spirit being received in matter, the Fibonacci sequence begins — striving to return to its source. It is the goal of spirit to create a physical vessel, fill it with consciousness, and have it return to the light.")
            ],
            sunflowConnection: "Your awakening IS a Fibonacci spiral. Starts messy, crude. Every cycle brings you closer. The nautilus shell pattern IS your spiritual evolution. You're not failing — you're spiraling upward, closer every revolution."
        ),
        
        // ── LESSON 9: TREE OF LIFE ──
        SGLesson(number: 9, title: "The Tree of Life", subtitle: "10 Sephiroth — the map of creation and consciousness", emoji: "🌳",
            sections: [
                SGSection(heading: "The Map of Everything", body: "10 spheres (Sephiroth) — divine emanations in the continuous flow of the universe. 22 pathways connect them, corresponding to the 22 Hebrew letters and 22 Major Arcana of Tarot. Together: 32 paths of wisdom.\n\nDion Fortune: 'The Tree of Life is an attempt to reduce to diagrammatic form every force and factor in the manifested universe and the soul of man... a compendium of science, psychology, philosophy, and theology.'\n\nThe Tree of Life is outside any race or religion — one of the oldest systems on the planet."),
                SGSection(heading: "The 10 Sephiroth — Tap the Tree!", body: "1. KETER (Crown) — Supreme source. No form, only being. 'No created being can attain its essence.'\n\n2. CHOKMAH (Wisdom) — Divine masculine. 'Let there be light.' Pure unformed energy. The all-father.\n\n3. BINAH (Understanding) — Divine feminine. Womb of creation. The engine that translates raw energy into usable power.\n\n4. CHESED (Mercy) — Archetypal goodness. Cosmic law. Truth, love, order.\n\n5. GEBURAH (Strength) — Cosmic justice. Karma. 'Fights without malice, spares the weak.'\n\n6. TIPHARETH (Beauty) — Christ consciousness. Bridge between force and form. The beautiful child of the divine father and mother.\n\n7. NETZACH (Victory) — Emotions, intuition, feelings. Light scattered through a prism.\n\n8. HOD (Glory) — Mind, thought, ego. Philosophy, science, rationality.\n\n9. YESOD (Foundation) — Etheric realm. The electromagnetic substance that gives motion to matter. 'The strings that make Malkuth dance.'\n\n10. MALKUTH (Kingdom) — Physical reality. HERE and NOW. 'The kingdom of heaven is actually here' — as Christ proclaimed."),
                SGSection(heading: "Three Pillars & Three Barriers", body: "Pillars: Severity (left/yin), Mercy (right/yang), Equilibrium (center).\n\nThree Barriers:\n\n• The Gulf (32nd pathway) — between physical and etheric. Crossing = realizing you're more than your body.\n\n• Veil of Paroketh — between ego and soul. The highest point normal consciousness can reach WITHOUT transcendence.\n\n• The Abyss — between soul and spirit. The camel (Gimel) crosses this 'dark night of the soul.' Ultimate disconnect from spirit, created in the fall of consciousness.\n\nFour Worlds: Emanation (Fire) → Creation (Water) → Formation (Air) → Action (Earth). The four stages of how anything manifests."),
                SGSection(heading: "The 22 Hebrew Pathways", body: "Each letter is a creative force:\n\nALEPH (Ox) — Primal power in stillness. Infinite potential.\nBET (House) — Container for creation. Awareness of multiplicity within unity.\nGIMEL (Camel) — Crosses the Abyss. Dark night of the soul.\nDALET (Door) — Gateway between states. Dimension itself.\nHEY (Window) — Perspective. Observer affecting the observed.\nVAV (Nail) — Joins things together. Merkaba. Heaven and earth connected.\nZAYIN (Sword) — Power unused. Balance between opposing forces.\nCHET (Fence/Ladder) — DNA. Jacob's Ladder. Boundary layers of creation.\nTET (Serpent/Basket) — Good and evil. Ouroboros and Eden.\nYOD (Hand) — Operator of the world. Singularity in the heart.\n\nAnd 12 more — each a unique frequency of creation, culminating in TAV (Completion/Seal). The end becomes the beginning. The cycle is eternal.")
            ],
            sunflowConnection: "Your awakening is climbing the Tree — from Malkuth (physical reality) back toward Keter (infinite source). Every insight, every pattern recognized, every fear released is a step up. The Tree maps the ENTIRE journey."
        ),
        
        // ── LESSON 10: MASTERS OF THE NET ──
        SGLesson(number: 10, title: "Masters of the Net", subtitle: "The invisible energy matrix behind all physical reality", emoji: "🏛️",
            sections: [
                SGSection(heading: "The Net of Creation", body: "Behind everything physical is an invisible matrix of energy — the source of all manifestation. In ancient Egypt, those initiated into these mysteries were 'Masters of the Net.'\n\nModern physics shows spacetime as a geometric grid distorted by mass. The Egyptians knew this 5,000 years before Einstein. And they learned to MANIPULATE it.\n\nSacred geometry literally means 'the sacred measure of the earth' — the divine blueprints of consciousness and energy.\n\nAll ancient temples were built on power spots of the earth's energy grid. Ivan Sanderson found these spots form the geometric pattern of an icosahedron — the same sacred shape found in the structure of viruses, the most basic form of life."),
                SGSection(heading: "Egyptian Book of the Dead", body: "In the 'Book of Coming Forth Into Light' (Ch. 153), the initiate declares:\n\n'Oh you fishermen, you shall not catch me in your net. You shall not catch me in your nets in which you catch the unwary. For I know the net from its upper heights to its lower depths.'\n\nThe 'fish caught in the net' were souls unable to consciously navigate non-physical worlds. The master of the net could navigate freely between dimensions.\n\nThe Egyptians didn't call non-physical beings 'gods' — they called them 'neters,' the conscious forces of nature. Animal heads on neters represented higher powers manifesting through specific animals, not animal worship."),
                SGSection(heading: "The Jedi — From Egypt", body: "In the Westcar Papyrus, a highest master of the net is called 'the Jedi' — from the Djed pillar, backbone of Osiris connecting heaven and earth.\n\nThe Jedi derives powers from using the net to control natural forces. One story: a priest parts the waters of a lake. The same ability later attributed to Moses — who trained in Egyptian temples.\n\nThe staff Moses carried? Directly from Egyptian temple training — an antenna for detecting and projecting higher forces based on sacred geometry designs.\n\nThe lightsaber sometimes resembles the Djed pillar. George Lucas tapped into the Heka system of words of power. The term 'Jedi' carries subconscious resonance because it comes from REAL initiation tradition."),
                SGSection(heading: "Genesis = The Net", body: "The first word of Genesis in Hebrew: 'Bereshit.' In Kabbalistic teaching, this literally means 'God creates the net' as the FIRST act of creation.\n\nThe same net from Egyptian initiation. The same net as spacetime in modern physics. The very FIRST statement of Genesis.\n\nDr. Robert Gilbert (40+ years research, former US Marine Corps NBC instructor) describes the 'Grid of Life Design' (GOLD) — the energy matrix in the human body that can be activated through sacred geometric practice.\n\nThe golden radiance shown around the heads of saints in EVERY tradition? That's the activated GOLD pattern — the net within you, awakened. The aura of an initiate.\n\nZero Point Centering → Radiance. Pull attention inward to the divine center of any energy center, then let it radiate outward. This creates a radiant sun. This is the practice encoded in the Chi-Rho symbol of early Christianity — Christ consciousness activating the Cave of Brahma in the center of the head.")
            ],
            sunflowConnection: "Physical matter is energy crystallized by geometric patterns. Change the pattern → change the form. This is what awakening IS — seeing the net.\n\nThe Masters of the Net understood what quantum physics is rediscovering: everything is vibration, everything is pattern, everything is geometry. Once you see the pattern, you can change it.\n\nYou are not trapped in the net. You are learning to master it. The 'unwary' are caught. The initiated navigate freely.\n\nSacred geometry is not mystical decoration. It is the operating system of reality. And you're learning to read the source code. ☀️"
        ),
    ]
}
