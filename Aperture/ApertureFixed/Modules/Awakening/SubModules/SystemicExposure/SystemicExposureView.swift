// SystemicExposureView.swift
// SYSTEMIC EXPOSURE — "What Else Did They Lie About?"
// ☀️ SunFlow: Reignited
//
// "If they lied about Israel, El Salvador, the US...
//  what ELSE did they lie about?"
//
// This module is the COMPLETE systemic exposure:
// - Turtle Island (the real name, the stolen land)
// - Pre-Columbian African presence (erased history)
// - Colonial crime sequence (6-step extraction)
// - Documented lies (declassified, admitted, proven)
// - El Salvador truth (flag reveal animation)
// - The awakening pattern (how people wake up)
// - Systemic connections (all layers, one system)
//
// Every claim is sourced. Every lie is documented.
// This is not opinion. This is the record they hid.

import SwiftUI

// MARK: - ═══════════════════════════════════════════════════
// MAIN MODULE VIEW
// ═══════════════════════════════════════════════════════════

struct SystemicExposureView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var selectedSection: ExposureSection? = nil
    @State private var showElSalvadorReveal = false
    @State private var showHondurasReveal = false
    @State private var showGuatemalaReveal = false
    @State private var showSolarTheology = false
    @State private var showThe13th = false
    @State private var completedSections: Set<ExposureSection> = []
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 0.02, green: 0.02, blue: 0.06).ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 20) {
                        headerView
                        sectionCards
                        awakenedView
                        sourcesView
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
                    Text("Systemic Exposure").font(.system(size: 17, weight: .bold)).foregroundColor(.white)
                }
            }
            .sheet(item: $selectedSection) { section in
                ExposureSectionDetailView(section: section) {
                    completedSections.insert(section)
                }
            }
            .fullScreenCover(isPresented: $showElSalvadorReveal) {
                ElSalvadorRevealView()
            }
            .fullScreenCover(isPresented: $showHondurasReveal) {
                HondurasRevealView()
            }
            .fullScreenCover(isPresented: $showGuatemalaReveal) {
                GuatemalaRevealView()
            }
            .fullScreenCover(isPresented: $showSolarTheology) {
                SolarTheologyView()
            }
            .fullScreenCover(isPresented: $showThe13th) {
                The13thView()
            }
        }
    }
    
    // MARK: - Header
    
    private var headerView: some View {
        VStack(spacing: 10) {
            Text("🌎").font(.system(size: 50))
            Text("WHAT ELSE DID\nTHEY LIE ABOUT?")
                .font(.system(size: 22, weight: .black)).tracking(1)
                .foregroundColor(.white).multilineTextAlignment(.center)
            Text("If they lied about one thing,\nthey'll lie about anything that serves power.")
                .font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.4))
                .multilineTextAlignment(.center)
            
            // Progress
            HStack(spacing: 4) {
                ForEach(ExposureSection.allCases, id: \.self) { sec in
                    RoundedRectangle(cornerRadius: 2)
                        .fill(completedSections.contains(sec) ? Color.cyan : Color.white.opacity(0.08))
                        .frame(height: 4)
                }
            }
            .padding(.top, 6)
        }
    }
    
    // MARK: - Section Cards
    
    private var sectionCards: some View {
        VStack(spacing: 10) {
            ForEach(ExposureSection.allCases, id: \.self) { section in
                Button {
                    if section == .elSalvador {
                        showElSalvadorReveal = true
                    } else if section == .honduras {
                        showHondurasReveal = true
                    } else if section == .guatemala {
                        showGuatemalaReveal = true
                    } else if section == .solarTheology {
                        showSolarTheology = true
                    } else {
                        selectedSection = section
                    }
                } label: {
                    HStack(spacing: 12) {
                        Text(section.emoji).font(.system(size: 24)).frame(width: 36)
                        VStack(alignment: .leading, spacing: 3) {
                            HStack(spacing: 6) {
                                Text(section.title).font(.system(size: 14, weight: .bold)).foregroundColor(.white)
                                if section == .elSalvador {
                                    Text("🇸🇻").font(.system(size: 12))
                                }
                                if section == .honduras {
                                    Text("🇭🇳").font(.system(size: 12))
                                }
                                if section == .guatemala {
                                    Text("🇬🇹").font(.system(size: 12))
                                }
                                if section == .the13th {
                                    Text("✨").font(.system(size: 12))
                                }
                                if section == .solarTheology {
                                    Text("☀️").font(.system(size: 12))
                                }
                                if completedSections.contains(section) {
                                    Image(systemName: "checkmark.circle.fill").font(.system(size: 11)).foregroundColor(.green)
                                }
                            }
                            Text(section.subtitle).font(.system(size: 10, weight: .medium)).foregroundColor(.white.opacity(0.4))
                        }
                        Spacer()
                        Text(section.duration).font(.system(size: 9, weight: .bold)).foregroundColor(section.color.opacity(0.6))
                        Image(systemName: "chevron.right").font(.system(size: 11)).foregroundColor(.white.opacity(0.15))
                    }
                    .padding(14)
                    .background(RoundedRectangle(cornerRadius: 14).fill(section.color.opacity(0.04))
                        .overlay(RoundedRectangle(cornerRadius: 14).stroke(section.color.opacity(0.1), lineWidth: 1)))
                }
            }
        }
    }
    
    // MARK: - Awakened View
    
    private var awakenedView: some View {
        VStack(spacing: 10) {
            Text("THE AWAKENING PATTERN").font(.system(size: 10, weight: .bold)).tracking(2).foregroundColor(.white.opacity(0.3))
            
            ForEach(SystemicAwakeningStep.steps) { step in
                HStack(alignment: .top, spacing: 10) {
                    ZStack {
                        Circle().fill(step.color.opacity(0.15)).frame(width: 28, height: 28)
                        Text("\(step.number)").font(.system(size: 12, weight: .black)).foregroundColor(step.color)
                    }
                    VStack(alignment: .leading, spacing: 2) {
                        Text(step.title).font(.system(size: 12, weight: .bold)).foregroundColor(step.color)
                        Text(step.description).font(.system(size: 10, weight: .medium)).foregroundColor(.white.opacity(0.4)).lineSpacing(2)
                    }
                }
            }
        }
        .padding(14).background(RoundedRectangle(cornerRadius: 14).fill(Color.white.opacity(0.02)))
    }
    
    // MARK: - Sources
    
    private var sourcesView: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("SOURCES & FURTHER READING").font(.system(size: 9, weight: .bold)).tracking(1).foregroundColor(.white.opacity(0.2))
            
            let sources = [
                "Howard Zinn — A People's History of the United States",
                "Ivan Van Sertima — They Came Before Columbus",
                "William Blum — Killing Hope: US Military & CIA Interventions",
                "Vincent Bevins — The Jakarta Method",
                "John Perkins — Confessions of an Economic Hitman",
                "Peter Chapman — Bananas: How United Fruit Shaped the World",
                "Dana Frank — The Long Honduran Night: Resistance After the Coup",
                "Thomas P. Anderson — The War of the Dispossessed (Football War)",
                "Stephen Schlesinger — Bitter Fruit (Guatemala 1954 coup)",
                "UN Commission for Historical Clarification — Memory of Silence (1999)",
                "Rigoberta Menchú — I, Rigoberta Menchú (1983)",
                "CIA Reading Room — cia.gov/readingroom (declassified)",
                "NSA Archive — nsarchive.gwu.edu",
                "Church Committee Hearings (1975) — Senate records",
                "UN Truth Commission on El Salvador (1993)",
                "Strauss & Howe — The Fourth Turning",
            ]
            
            ForEach(sources, id: \.self) { source in
                Text("• \(source)").font(.system(size: 9, weight: .medium)).foregroundColor(.white.opacity(0.25))
            }
        }
        .padding(12).background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.015)))
    }
}

// MARK: - ═══════════════════════════════════════════════════
// SECTION ENUM
// ═══════════════════════════════════════════════════════════

enum ExposureSection: String, CaseIterable, Identifiable {
    case turtleIsland = "Turtle Island"
    case blackPresence = "Already Here"
    case colonialCrime = "The Colonial Crime"
    case elSalvador = "El Salvador Truth"
    case honduras = "Honduras Truth"
    case guatemala = "Guatemala Truth"
    case documentedLies = "Documented Lies"
    case solarTheology = "Solar Theology"
    case systemicPattern = "The Pattern"
    case whatElse = "What Else?"
    case the13th = "The 13th"
    
    var id: String { rawValue }
    
    var title: String { rawValue }
    
    var emoji: String {
        switch self {
        case .turtleIsland: return "🌎"
        case .blackPresence: return "🔥"
        case .colonialCrime: return "💀"
        case .elSalvador: return "🇸🇻"
        case .honduras: return "🇭🇳"
        case .guatemala: return "🇬🇹"
        case .documentedLies: return "💣"
        case .solarTheology: return "☀️"
        case .systemicPattern: return "🎯"
        case .whatElse: return "⚡"
        case .the13th: return "✨"
        }
    }
    
    var subtitle: String {
        switch self {
        case .turtleIsland: return "The real name they erased. Indigenous land, stolen."
        case .blackPresence: return "Pre-Columbian African presence. Erased to justify slavery."
        case .colonialCrime: return "The 6-step extraction sequence. Land → Genocide → Slavery → Rewrite."
        case .elSalvador: return "US-backed death squads. MS-13 made in LA. The deportation pipeline. The FULL architecture."
        case .honduras: return "The 'Football War' lie. Banana Republic. 2009 coup. They put hermanos against each other."
        case .guatemala: return "CIA's first coup. 36-year genocide. 200,000 Maya killed. THE BLUEPRINT for all coups after."
        case .documentedLies: return "12 proven lies. Declassified. Admitted. On record."
        case .solarTheology: return "37 sun gods. God's Son or God's Sun? The oldest truth they hid."
        case .systemicPattern: return "All lies serve the same masters. Follow the money."
        case .whatElse: return "The question that breaks the matrix. Can never go back."
        case .the13th: return "The deepest layer. 12 + 1 = 13. YOU are the divine spark they hid for 2000 years."
        }
    }
    
    var duration: String {
        switch self {
        case .turtleIsland: return "3 min"
        case .blackPresence: return "3 min"
        case .colonialCrime: return "4 min"
        case .elSalvador: return "8 min"
        case .honduras: return "8 min"
        case .guatemala: return "8 min"
        case .documentedLies: return "6 min"
        case .solarTheology: return "10 min"
        case .systemicPattern: return "3 min"
        case .whatElse: return "2 min"
        case .the13th: return "30 min"
        }
    }
    
    var color: Color {
        switch self {
        case .turtleIsland: return .green
        case .blackPresence: return .orange
        case .colonialCrime: return .red
        case .elSalvador: return .blue
        case .honduras: return Color(red: 0.0, green: 0.38, blue: 0.72)
        case .guatemala: return Color(red: 0.28, green: 0.62, blue: 0.86)
        case .documentedLies: return .red
        case .solarTheology: return Color(red: 1.0, green: 0.85, blue: 0.3)
        case .systemicPattern: return .purple
        case .whatElse: return .cyan
        case .the13th: return Color(red: 1.0, green: 0.85, blue: 0.3)
        }
    }
}

// MARK: - ═══════════════════════════════════════════════════
// AWAKENING STEPS
// ═══════════════════════════════════════════════════════════

struct SystemicAwakeningStep: Identifiable {
    let id = UUID()
    let number: Int
    let title: String
    let description: String
    let color: Color
    
    static let steps: [SystemicAwakeningStep] = [
        SystemicAwakeningStep(number: 1, title: "TRUST THE SYSTEM", description: "They wouldn't lie about important things. News tells truth. Schools teach accurately.", color: .gray),
        SystemicAwakeningStep(number: 2, title: "DISCOVER ONE BIG LIE", description: "Wait... they lied about THAT? The crack in the matrix appears.", color: .yellow),
        SystemicAwakeningStep(number: 3, title: "THE QUESTION EMERGES", description: "If they lied about that... what ELSE did they lie about?", color: .orange),
        SystemicAwakeningStep(number: 4, title: "START INVESTIGATING", description: "Check other narratives. Find MORE lies. Pattern becomes clear.", color: .red),
        SystemicAwakeningStep(number: 5, title: "SEE THE SYSTEM", description: "ALL institutions serve same masters. ALL protect extraction. Fully awake.", color: .purple),
        SystemicAwakeningStep(number: 6, title: "SOVEREIGNTY ACHIEVED", description: "Once you see, you can't unsee. Question everything. Verify everything. Teach others.", color: .cyan),
    ]
}

// MARK: - ═══════════════════════════════════════════════════
// SECTION DETAIL VIEW
// ═══════════════════════════════════════════════════════════

struct ExposureSectionDetailView: View {
    @Environment(\.dismiss) var dismiss
    let section: ExposureSection
    let onComplete: () -> Void
    
    @State private var currentCard = 0
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 0.02, green: 0.02, blue: 0.06).ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 16) {
                        // Section header
                        VStack(spacing: 6) {
                            Text(section.emoji).font(.system(size: 40))
                            Text(section.title.uppercased()).font(.system(size: 18, weight: .black)).tracking(2).foregroundColor(.white)
                        }
                        
                        // Content cards
                        let cards = contentCards(for: section)
                        
                        TabView(selection: $currentCard) {
                            ForEach(Array(cards.enumerated()), id: \.offset) { index, card in
                                exposureCard(card).tag(index)
                            }
                        }
                        .tabViewStyle(.page(indexDisplayMode: .automatic))
                        .frame(minHeight: 500)
                        
                        // Complete
                        if currentCard >= cards.count - 1 {
                            Button {
                                onComplete()
                                dismiss()
                            } label: {
                                HStack(spacing: 6) {
                                    Image(systemName: "checkmark.circle.fill")
                                    Text("SECTION COMPLETE").font(.system(size: 13, weight: .bold))
                                }
                                .foregroundColor(.black).frame(maxWidth: .infinity).padding(.vertical, 12)
                                .background(Capsule().fill(section.color))
                            }
                        }
                        
                        Spacer(minLength: 40)
                    }
                    .padding(20)
                }
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button { dismiss() } label: {
                        Image(systemName: "xmark.circle.fill").foregroundColor(.white.opacity(0.3))
                    }
                }
            }
        }
    }
    
    private func exposureCard(_ card: ExposureCard) -> some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 12) {
                // Title
                HStack(spacing: 8) {
                    if let tag = card.tag {
                        Text(tag).font(.system(size: 8, weight: .bold)).tracking(1).foregroundColor(.black)
                            .padding(.horizontal, 6).padding(.vertical, 3)
                            .background(Capsule().fill(section.color))
                    }
                    Text(card.title).font(.system(size: 16, weight: .bold)).foregroundColor(.white)
                }
                
                // Body
                ForEach(card.content, id: \.self) { line in
                    if line.hasPrefix("##") {
                        Text(line.replacingOccurrences(of: "## ", with: ""))
                            .font(.system(size: 13, weight: .bold)).foregroundColor(section.color).padding(.top, 4)
                    } else if line.hasPrefix("→") {
                        HStack(alignment: .top, spacing: 6) {
                            Text("→").font(.system(size: 11, weight: .bold)).foregroundColor(section.color)
                            Text(line.replacingOccurrences(of: "→ ", with: ""))
                                .font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.7))
                        }
                    } else if line.hasPrefix("✗") || line.hasPrefix("❌") {
                        HStack(alignment: .top, spacing: 6) {
                            Text("✗").font(.system(size: 11, weight: .bold)).foregroundColor(.red)
                            Text(line.replacingOccurrences(of: "✗ ", with: "").replacingOccurrences(of: "❌ ", with: ""))
                                .font(.system(size: 12, weight: .medium)).foregroundColor(.red.opacity(0.7))
                        }
                    } else if line.hasPrefix("✓") || line.hasPrefix("✅") {
                        HStack(alignment: .top, spacing: 6) {
                            Text("✓").font(.system(size: 11, weight: .bold)).foregroundColor(.green)
                            Text(line.replacingOccurrences(of: "✓ ", with: "").replacingOccurrences(of: "✅ ", with: ""))
                                .font(.system(size: 12, weight: .medium)).foregroundColor(.green.opacity(0.7))
                        }
                    } else if line.hasPrefix("⚠️") {
                        Text(line).font(.system(size: 11, weight: .bold)).foregroundColor(.yellow)
                            .padding(8).frame(maxWidth: .infinity, alignment: .leading)
                            .background(RoundedRectangle(cornerRadius: 8).fill(Color.yellow.opacity(0.05)))
                    } else if line.hasPrefix("📊") {
                        Text(line).font(.system(size: 11, weight: .bold, design: .monospaced)).foregroundColor(.cyan.opacity(0.7))
                            .padding(8).frame(maxWidth: .infinity, alignment: .leading)
                            .background(RoundedRectangle(cornerRadius: 8).fill(Color.cyan.opacity(0.03)))
                    } else {
                        Text(line).font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.6)).lineSpacing(3)
                    }
                }
                
                // Source
                if let source = card.source {
                    HStack(spacing: 4) {
                        Image(systemName: "doc.text.fill").font(.system(size: 8)).foregroundColor(.white.opacity(0.2))
                        Text("Source: \(source)").font(.system(size: 9, weight: .medium)).foregroundColor(.white.opacity(0.2))
                    }
                    .padding(.top, 6)
                }
            }
            .padding(16)
        }
        .background(RoundedRectangle(cornerRadius: 16).fill(Color.white.opacity(0.03))
            .overlay(RoundedRectangle(cornerRadius: 16).stroke(section.color.opacity(0.08), lineWidth: 1)))
    }
}

// MARK: - ═══════════════════════════════════════════════════
// CONTENT DATABASE
// ═══════════════════════════════════════════════════════════

struct ExposureCard {
    let title: String
    let content: [String]
    let tag: String?
    let source: String?
}

func contentCards(for section: ExposureSection) -> [ExposureCard] {
    switch section {
        
    // ─────────────────────────────────────────────
    // TURTLE ISLAND
    // ─────────────────────────────────────────────
    case .turtleIsland:
        return [
            ExposureCard(
                title: "The Real Name",
                content: [
                    "## What is Turtle Island?",
                    "→ The Indigenous name for North America",
                    "→ Used by Haudenosaunee (Iroquois), Anishinaabe, Lenape, and many other nations",
                    "→ Based on creation stories shared across cultures",
                    "→ The ORIGINAL name before colonization",
                    "",
                    "## Why You Never Learned This",
                    "→ Colonizers renamed it \"America\" (after Amerigo Vespucci, a cartographer)",
                    "→ Erased Indigenous names, languages, and stories",
                    "→ Made it seem like \"empty\" land with no history",
                    "→ Justified theft by erasing the people who were already here",
                    "",
                    "⚠️ The erasure of a name is the first step in the erasure of a people.",
                ],
                tag: "THE REAL NAME", source: "Haudenosaunee oral tradition; Native-Land.ca"
            ),
            ExposureCard(
                title: "What They Taught You vs. Reality",
                content: [
                    "## What Prussian Schools Taught",
                    "✗ \"Columbus discovered America\" — LIE. 50-100 million people already here.",
                    "✗ \"New World\" — New to WHO? Not to the people living here for 15,000+ years.",
                    "✗ \"Manifest Destiny\" — Theological justification for theft and genocide.",
                    "✗ \"Indians\" — Wrong name. He thought he was in India.",
                    "✗ \"Savage, primitive\" — Projection by the actual savages.",
                    "",
                    "## What Actually Existed",
                    "✓ 50-100 million people across hundreds of distinct nations",
                    "✓ Haudenosaunee confederacy: democratic governance that INFLUENCED the US Constitution",
                    "✓ Advanced agriculture (Three Sisters: corn, beans, squash)",
                    "✓ Astronomical knowledge, trade networks spanning continents",
                    "✓ Sophisticated medicine, ecological management",
                    "✓ More people than Europe at the time",
                    "",
                    "📊 Population of Turtle Island pre-contact: 50-100M. Population of England in 1500: ~3M.",
                ],
                tag: "THE ERASURE", source: "Charles C. Mann — 1491: New Revelations of the Americas Before Columbus"
            ),
            ExposureCard(
                title: "The Genocide They Called 'Settlement'",
                content: [
                    "## What Happened After Contact",
                    "→ 90-95% of Indigenous population killed",
                    "→ Disease (sometimes intentionally spread — smallpox blankets documented)",
                    "→ War, massacres, forced displacement",
                    "→ Children stolen, put in boarding schools (\"Kill the Indian, save the man\")",
                    "→ Languages banned, ceremonies criminalized",
                    "",
                    "## They Called It:",
                    "✗ \"Settlement\" — It was conquest",
                    "✗ \"Expansion\" — It was displacement",
                    "✗ \"Civilization\" — It was genocide",
                    "✗ \"Thanksgiving\" — It was a prelude to extermination",
                    "",
                    "📊 Estimated Indigenous deaths: 45-95 million. This is the largest genocide in human history.",
                    "",
                    "⚠️ They don't call it genocide in school because that word implies a crime. And crimes require accountability.",
                ],
                tag: "GENOCIDE", source: "David Stannard — American Holocaust; Dunbar-Ortiz — An Indigenous Peoples' History of the United States"
            ),
        ]
        
    // ─────────────────────────────────────────────
    // BLACK PRESENCE
    // ─────────────────────────────────────────────
    case .blackPresence:
        return [
            ExposureCard(
                title: "Already Here",
                content: [
                    "## Pre-Columbian African Presence",
                    "What you were NEVER taught: Africans were in the Americas BEFORE Columbus. Before slave ships. Before \"discovery.\"",
                    "",
                    "## The Evidence",
                    "→ Olmec heads (1200 BCE): Giant stone sculptures in Mexico with clearly African features. 2,700 years before Columbus.",
                    "→ Columbus's own journal (1492): Indigenous people told him about \"Black people who came from south-east in boats, trading in gold-tipped spears.\"",
                    "→ Skeletal remains: African DNA found in pre-Columbian Americas",
                    "→ Indigenous oral histories: Multiple nations reference \"Black Gods\" visiting",
                    "→ Botanical evidence: African plants found in Americas pre-1492 (bottle gourd, cotton varieties)",
                    "",
                    "⚠️ Africans were explorers, traders, and migrants. They had AGENCY. They had SOVEREIGNTY. They were HERE.",
                ],
                tag: "PRE-COLUMBIAN", source: "Ivan Van Sertima — They Came Before Columbus (1976)"
            ),
            ExposureCard(
                title: "The Specific Evidence",
                content: [
                    "## 1. The Olmecs (1500-400 BCE)",
                    "→ First major Mesoamerican civilization",
                    "→ Giant stone head sculptures with African facial features",
                    "→ Located in Mexico, 1,000+ years before Vikings arrived",
                    "→ Academic debate continues, but the features are undeniable",
                    "",
                    "## 2. Columbus's Journal (1492)",
                    "→ Documented Indigenous reports of Black traders",
                    "→ Gold-tipped spears (African metallurgy)",
                    "→ Came from the south-east by boat",
                    "",
                    "## 3. The Washitaw Nation",
                    "→ Indigenous Black people in Louisiana/Mississippi",
                    "→ NOT from the transatlantic slave trade",
                    "→ Were HERE. Not brought here.",
                    "→ Recognized by the UN as one of oldest Indigenous groups in Americas",
                    "",
                    "## 4. Linguistic & Botanical Evidence",
                    "→ African language connections to pre-Columbian Mesoamerican languages",
                    "→ African crops in Americas before 1492",
                    "→ Van Sertima documented dozens of cross-continental connections",
                ],
                tag: "EVIDENCE", source: "Van Sertima; Leo Wiener — Africa and the Discovery of America (1920)"
            ),
            ExposureCard(
                title: "Why They Erased This",
                content: [
                    "## Because It Destroys The Narrative",
                    "",
                    "## They WANT You to Believe:",
                    "✗ Black people = slaves brought here (ONLY identity)",
                    "✗ No agency, no history in the Americas",
                    "✗ Slavery is the beginning of Black history here",
                    "✗ \"That's all they were\"",
                    "",
                    "## The Truth Means:",
                    "✓ Africans were explorers, traders, navigators",
                    "✓ Had relationships with Indigenous peoples",
                    "✓ Had sovereignty and autonomy BEFORE colonization",
                    "✓ Were not \"just slaves\"",
                    "✓ Had a history in the Americas INDEPENDENT of enslavement",
                    "",
                    "## Why This Matters:",
                    "→ If Black people had agency before slavery, you can't define them BY slavery",
                    "→ If they were here first, the entire \"brought here\" narrative collapses",
                    "→ If they had sovereignty, enslavement was conquest — not \"natural order\"",
                    "",
                    "⚠️ They erased this because a people with a history of freedom are harder to convince that slavery was their destiny.",
                ],
                tag: "THE ERASURE", source: nil
            ),
        ]
        
    // ─────────────────────────────────────────────
    // COLONIAL CRIME
    // ─────────────────────────────────────────────
    case .colonialCrime:
        return [
            ExposureCard(
                title: "The 6-Step Extraction Sequence",
                content: [
                    "## STEP 1: STEAL THE LAND",
                    "→ Turtle Island = Indigenous land, millions living here",
                    "→ Colonizers: \"Empty land!\" (the Doctrine of Discovery — Papal decree)",
                    "→ Justify with Manifest Destiny, \"civilizing mission\"",
                    "",
                    "## STEP 2: ELIMINATE THE WITNESSES",
                    "→ 90-95% of Indigenous population killed",
                    "→ Disease (sometimes intentional), war, displacement",
                    "→ Forced assimilation, boarding schools, language bans",
                    "",
                    "## STEP 3: ENSLAVE THE EXISTING PEOPLES",
                    "→ Black people already here (pre-colonial African presence) — enslaved",
                    "→ Indigenous peoples also enslaved initially",
                    "→ Both groups stripped of identity and sovereignty",
                ],
                tag: "STEPS 1-3", source: nil
            ),
            ExposureCard(
                title: "The 6-Step Sequence (Continued)",
                content: [
                    "## STEP 4: IMPORT MORE SLAVES",
                    "→ Transatlantic slave trade: 12-15 million Africans kidnapped",
                    "→ 2+ million died during the Middle Passage",
                    "→ Chattel slavery system created — people as property",
                    "→ Industrial-scale extraction of human labor",
                    "",
                    "## STEP 5: REWRITE HISTORY",
                    "→ Erase Indigenous names (Turtle Island → America)",
                    "→ Erase Black presence (\"only brought as slaves\")",
                    "→ Reframe genocide as \"settlement\" and \"discovery\"",
                    "→ Create origin myths (Columbus, Pilgrims, Founding Fathers)",
                    "",
                    "## STEP 6: EDUCATION PERPETUATES THE LIES",
                    "→ Prussian model: train obedience, not critical thinking",
                    "→ False history in every textbook",
                    "→ Erase inconvenient truths across every subject",
                    "→ Programming complete: citizens defend the system that extracted from their ancestors",
                    "",
                    "⚠️ This sequence is not historical. It is ONGOING. The extraction continues — it just changed form.",
                ],
                tag: "STEPS 4-6", source: "Howard Zinn — A People's History of the United States"
            ),
        ]
        
    // ─────────────────────────────────────────────
    // EL SALVADOR (shown via flag reveal — these are fallback cards)
    // ─────────────────────────────────────────────
    case .elSalvador:
        return [
            ExposureCard(
                title: "The War They Lied About",
                content: [
                    "## This launches the El Salvador Flag Reveal experience.",
                    "→ Tap to begin the animated sequence.",
                ],
                tag: "INTERACTIVE", source: nil
            ),
        ]
        
    // ─────────────────────────────────────────────
    // HONDURAS (shown via flag reveal — these are fallback cards)
    // ─────────────────────────────────────────────
    case .honduras:
        return [
            ExposureCard(
                title: "The Original Banana Republic",
                content: [
                    "## This launches the Honduras Flag Reveal experience.",
                    "→ Tap to begin the animated sequence.",
                    "→ The Football War was never about fútbol.",
                ],
                tag: "INTERACTIVE", source: nil
            ),
        ]
        
    // ─────────────────────────────────────────────
    // GUATEMALA (shown via flag reveal)
    // ─────────────────────────────────────────────
    case .guatemala:
        return [
            ExposureCard(
                title: "The Blueprint",
                content: [
                    "## This launches the Guatemala Flag Reveal experience.",
                    "→ Tap to begin the animated sequence.",
                    "→ The CIA's first Latin American coup. The template for everything after.",
                ],
                tag: "INTERACTIVE", source: nil
            ),
        ]
        
    // ─────────────────────────────────────────────
    // DOCUMENTED LIES
    // ─────────────────────────────────────────────
    case .documentedLies:
        return [
            ExposureCard(
                title: "Iraq War — WMDs (2003)",
                content: [
                    "## The Lie",
                    "→ \"Saddam Hussein has weapons of mass destruction\"",
                    "→ Colin Powell presented \"evidence\" to the UN",
                    "→ Congress authorized war based on this claim",
                    "",
                    "## The Truth",
                    "✗ NO weapons of mass destruction found. Ever.",
                    "✗ Intelligence was fabricated or cherry-picked",
                    "✗ War was for oil access and military-industrial contracts",
                    "",
                    "## The Cost",
                    "📊 1,000,000+ Iraqi civilians dead",
                    "📊 4,500+ US soldiers dead, 32,000+ wounded",
                    "📊 $2+ trillion spent (taxpayer money → defense contractors)",
                    "📊 Region destabilized, ISIS emerged from the chaos",
                    "",
                    "## Who Profited",
                    "→ Halliburton (Cheney's company): $39.5B in contracts",
                    "→ ExxonMobil, BP, Shell: Iraqi oil contracts",
                    "→ Lockheed Martin, Raytheon, Boeing: weapons contracts",
                    "",
                    "⚠️ Admitted lie. Zero accountability. War criminals walk free.",
                ],
                tag: "PROVEN LIE", source: "Iraq Survey Group Final Report (2004); Senate Intelligence Committee Report"
            ),
            ExposureCard(
                title: "Gulf of Tonkin — Vietnam (1964)",
                content: [
                    "## The Lie",
                    "→ \"North Vietnam attacked US ships in the Gulf of Tonkin\"",
                    "→ Used to justify full-scale war in Vietnam",
                    "→ Congress passed Gulf of Tonkin Resolution",
                    "",
                    "## The Truth",
                    "✗ The second attack NEVER HAPPENED",
                    "✗ NSA documents declassified in 2005 confirmed it was fabricated",
                    "✗ Johnson administration knew at the time",
                    "",
                    "## The Cost",
                    "📊 3,000,000+ Vietnamese dead",
                    "📊 58,000+ US soldiers dead",
                    "📊 Agent Orange birth defects STILL occurring today",
                    "",
                    "⚠️ Fabricated a military attack to start a war. Declassified. Proven. No consequences.",
                ],
                tag: "PROVEN LIE", source: "NSA declassified documents (2005); Pentagon Papers (Daniel Ellsberg)"
            ),
            ExposureCard(
                title: "CIA Crack Cocaine (1980s)",
                content: [
                    "## The Lie",
                    "→ \"Crack epidemic is an urban drug problem\"",
                    "→ \"Just say no\" — blame the users",
                    "→ War on Drugs to \"protect communities\"",
                    "",
                    "## The Truth",
                    "✗ CIA facilitated cocaine imports to fund Contras (Nicaragua)",
                    "✗ Cocaine flooded Black communities deliberately",
                    "✗ Created crack epidemic to fund illegal war",
                    "✗ Journalist Gary Webb exposed it — found dead with TWO gunshots to the head (ruled \"suicide\")",
                    "",
                    "## The Cost",
                    "📊 Mass incarceration of Black Americans (prison population 500% increase 1970-2000)",
                    "📊 Destroyed families and communities for generations",
                    "📊 Private prisons profited from the bodies",
                    "",
                    "→ Nixon aide John Ehrlichman ADMITTED: \"We couldn't make it illegal to be Black... but by criminalizing their drugs, we could disrupt their communities.\"",
                ],
                tag: "PROVEN LIE", source: "Gary Webb — Dark Alliance; Kerry Committee Report (1989); Ehrlichman interview (Harper's, 2016)"
            ),
            ExposureCard(
                title: "COINTELPRO — FBI vs Black Liberation",
                content: [
                    "## The Lie",
                    "→ \"FBI protects civil rights and keeps Americans safe\"",
                    "",
                    "## The Truth",
                    "✗ FBI ran COINTELPRO (1956-1971) to systematically destroy Black liberation movements",
                    "✗ Fred Hampton: drugged by FBI informant, then shot in his bed by Chicago police (1969). He was 21.",
                    "✗ MLK: FBI sent letter encouraging him to commit suicide",
                    "✗ Malcolm X: infiltrated by FBI informants, assassination facilitated",
                    "✗ Black Panther Party: systematically dismantled through assassinations, frame-ups, disinformation",
                    "",
                    "## Documented Tactics",
                    "→ Assassinations of leaders",
                    "→ Planting informants and provocateurs",
                    "→ Manufacturing evidence for arrests",
                    "→ Sending anonymous letters to destroy marriages and organizations",
                    "→ Creating division between groups",
                    "",
                    "⚠️ All admitted during Church Committee hearings (1975). Declassified. FBI did this.",
                ],
                tag: "PROVEN", source: "Church Committee Report (1975-1976); FBI Vault COINTELPRO files"
            ),
            ExposureCard(
                title: "MKUltra, Tuskegee, Operation Northwoods",
                content: [
                    "## MKUltra (1953-1973)",
                    "✗ CIA mind control experiments on unknowing citizens",
                    "✗ Drugged people with LSD without consent",
                    "✗ Torture, sensory deprivation, psychological abuse",
                    "✗ Director ordered files destroyed in 1973 — some survived",
                    "→ Declassified. Admitted. CIA did this to Americans.",
                    "",
                    "## Tuskegee Experiment (1932-1972)",
                    "✗ Told 399 Black men they were getting \"free healthcare\"",
                    "✗ Actually studying untreated syphilis — WITHHELD treatment",
                    "✗ Ran for 40 YEARS",
                    "✗ Men died, went blind, infected partners",
                    "→ US government deliberately experimented on Black Americans for 4 decades.",
                    "",
                    "## Operation Northwoods (1962)",
                    "✗ US Joint Chiefs proposed FALSE FLAG attacks on American citizens",
                    "✗ Bomb Miami, sink boats, hijack planes — blame Cuba to justify invasion",
                    "✗ JFK rejected it. He was assassinated the following year.",
                    "→ Declassified document. They planned to kill Americans and blame another country.",
                    "",
                    "⚠️ All three: declassified, documented, admitted. Not conspiracy theory. Government records.",
                ],
                tag: "DECLASSIFIED", source: "CIA FOIA; CDC Tuskegee timeline; JFK Assassination Records"
            ),
            ExposureCard(
                title: "Current Ongoing Lies",
                content: [
                    "## \"Democracy\" (Now)",
                    "✗ Your vote matters → Donor class controls both parties, oligarchy confirmed (Princeton study 2014: public opinion has \"near-zero\" impact on policy)",
                    "",
                    "## \"Free Market\" (Now)",
                    "✗ Capitalism rewards hard work → Rigged for elite. Corporate welfare: $4,200/household/year in subsidies to profitable corporations.",
                    "→ Socialism for the rich, capitalism for the poor",
                    "",
                    "## \"Meritocracy\" (Now)",
                    "✗ Anyone can make it → Legacy admissions, two-tier education, inherited wealth determines outcome more than effort",
                    "",
                    "## \"War on Drugs\" (Ongoing)",
                    "✗ Protecting communities → Mass incarceration of Black/Brown people. Nixon aide admitted it was designed to target Black people and the antiwar left.",
                    "",
                    "## \"Humanitarian Interventions\" (Ongoing)",
                    "✗ We bring freedom → Resource extraction, puppet governments. Iraq, Libya, Syria, Afghanistan, El Salvador, Chile, Guatemala, Iran...",
                    "",
                    "⚠️ The pattern: every lie serves corporate profit, elite power, resource extraction, or population control. Follow the money.",
                ],
                tag: "ONGOING", source: "Gilens & Page (Princeton, 2014); Good Jobs First subsidy tracker"
            ),
        ]
        
    // ─────────────────────────────────────────────
    // SOLAR THEOLOGY (shown via its own view)
    // ─────────────────────────────────────────────
    case .solarTheology:
        return [
            ExposureCard(
                title: "God's Son or God's Sun?",
                content: [
                    "## This launches the Solar Theology module.",
                    "→ 37 sun gods who died and were resurrected — before Christianity.",
                    "→ The cross is the zodiac. The crown of thorns is the sun's corona.",
                    "→ 12 apostles = 12 months. 'He is risen' = the sunrise.",
                    "→ The oldest truth they hid from you.",
                ],
                tag: "INTERACTIVE", source: nil
            ),
        ]
        
    // ─────────────────────────────────────────────
    // SYSTEMIC PATTERN
    // ─────────────────────────────────────────────
    case .systemicPattern:
        return [
            ExposureCard(
                title: "All Lies Serve The Same Masters",
                content: [
                    "## The Common Thread",
                    "Every documented lie serves at least one of these:",
                    "",
                    "→ Corporate/elite profit (Iraq → oil contracts, War on Drugs → private prisons)",
                    "→ Resource extraction (El Salvador → cheap labor, Libya → oil)",
                    "→ Population control (COINTELPRO → destroy leaders, crack → destroy communities)",
                    "→ Maintain power structures (false history → prevent questioning)",
                    "",
                    "## Follow The Money",
                    "📊 Iraq War lie → Halliburton made $39.5B",
                    "📊 War on Drugs → Private prisons became $80B industry",
                    "📊 El Salvador → US corporations maintained access to cheap labor",
                    "📊 Vietnam → Defense contractors: Dow Chemical, Bell Helicopter, General Dynamics",
                    "",
                    "## The Rule",
                    "When government or media tells you something:",
                    "→ Ask: \"Who benefits?\"",
                    "→ Check: \"What's the evidence?\"",
                    "→ Follow: \"Where does the money go?\"",
                    "→ Verify with INDEPENDENT sources, not corporate media",
                    "",
                    "⚠️ If it serves power and profit, verify it. If you can't verify it, don't believe it.",
                ],
                tag: "THE PATTERN", source: nil
            ),
            ExposureCard(
                title: "All The Layers — One System",
                content: [
                    "## The Complete Picture",
                    "",
                    "✓ Economic Layer: Debt slavery, Federal Reserve extraction, inflation tax (Money Decoded)",
                    "✓ Political Layer: Donor control, both parties serve capital (Economy Wake-Up)",
                    "✓ Educational Layer: Prussian obedience model vs elite critical thinking",
                    "✓ Historical Layer: Turtle Island erased, genocide renamed, Black presence deleted",
                    "✓ Central America Layer: El Salvador death squads, Honduras banana republic, Guatemala blueprint coup, Northern Triangle architecture",
                    "✓ Solar Theology Layer: 37 sun gods pre-dating Christianity, cross = zodiac, communion = sun eating, oldest truth hidden",
                    "✓ Race Layer: Division programming — fight each other, not the system",
                    "✓ Media Layer: 6 corporations own 90% of what you see (Signal vs Noise)",
                    "✓ Food Layer: Poison in your food while they eat organic (Quantum Nourish)",
                    "✓ Cyclical Layer: Fourth Turning — 80-year resets, we're IN one now",
                    "",
                    "ALL connected. ALL serving extraction. ALL requiring TRUTH to dismantle.",
                    "",
                    "→ The system is not broken. It's working EXACTLY as designed.",
                    "→ It was designed to extract from you.",
                    "→ The only defense is awareness.",
                    "",
                    "⚠️ You're not a conspiracy theorist. You're a pattern recognizer. That's what they're afraid of.",
                ],
                tag: "THE SYSTEM", source: nil
            ),
        ]
        
    // ─────────────────────────────────────────────
    // WHAT ELSE
    // ─────────────────────────────────────────────
    case .whatElse:
        return [
            ExposureCard(
                title: "The Question That Breaks The Matrix",
                content: [
                    "## \"What ELSE did they lie about?\"",
                    "",
                    "This question is the most dangerous thing you can ask.",
                    "",
                    "Because once you catch them in ONE big lie — and you verify it with their OWN declassified documents — you realize:",
                    "",
                    "→ If they lied about Iraq (admitted)",
                    "→ If they lied about Vietnam (declassified)",
                    "→ If they experimented on Black men for 40 years (admitted)",
                    "→ If the FBI assassinated civil rights leaders (declassified)",
                    "→ If the CIA imported crack cocaine (documented)",
                    "→ If they planned false flag attacks on Americans (declassified)",
                    "",
                    "Then the question isn't \"are they lying now?\"",
                    "",
                    "The question is: \"About WHAT are they lying now?\"",
                    "",
                    "⚠️ This isn't paranoia. This is pattern recognition based on THEIR OWN RECORDS.",
                ],
                tag: "THE KEY", source: nil
            ),
            ExposureCard(
                title: "What To Do With This Knowledge",
                content: [
                    "## The Healthy Response",
                    "",
                    "→ Keep questioning. Every narrative. Every \"official\" story.",
                    "→ Follow the money. Who profits? Who loses?",
                    "→ Check independent sources. Not corporate media.",
                    "→ Recognize patterns. Same lies, different contexts.",
                    "→ Teach others. Share what you learn.",
                    "",
                    "## The Unhealthy Response (Avoid This)",
                    "✗ Believing EVERYTHING is a lie (paralysis)",
                    "✗ Trusting NOTHING (paranoia)",
                    "✗ Going down rabbit holes without evidence (distraction)",
                    "✗ Getting angry without getting strategic (burnout)",
                    "",
                    "## The SunFlow Way",
                    "✓ Demand PROOF. Always.",
                    "✓ Follow MONEY. Always.",
                    "✓ Verify INDEPENDENTLY. Always.",
                    "✓ Stay calm. Rage serves the system.",
                    "✓ Teach others. Awakening is contagious.",
                    "",
                    "You're not a conspiracy theorist.",
                    "You're a critical thinker.",
                    "That's exactly what they don't want you to be.",
                    "That's exactly what makes you dangerous to the system.",
                    "That's exactly what SunFlow is.",
                ],
                tag: "SOVEREIGNTY", source: nil
            ),
        ]
        
    // ─────────────────────────────────────────────
    // THE 13TH (shown via its own full module)
    // ─────────────────────────────────────────────
    case .the13th:
        return [
            ExposureCard(
                title: "The Deepest Layer",
                content: [
                    "## This launches The 13th — the divine spark module.",
                    "→ 12 + 1 = 13. YOU are the one they hid.",
                    "→ Christ within. Mary Magdalene. Sophia.",
                    "→ The ultimate theft: your knowledge of who you ARE.",
                ],
                tag: "INTERACTIVE", source: nil
            ),
        ]
    }
}

// MARK: - ═══════════════════════════════════════════════════
// EL SALVADOR FLAG REVEAL ANIMATION
// ═══════════════════════════════════════════════════════════
// Same dissolve pattern as Guadalupe → Tonantzin
// Flag dissolves to reveal truth about US-backed civil war

struct ElSalvadorRevealView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var phase: SalvadorPhase = .flagShowing
    @State private var dissolveProgress: CGFloat = 0
    @State private var glowIntensity: CGFloat = 0
    @State private var textOpacity: CGFloat = 0
    @State private var showTruth = false
    @State private var particleExplosion = false
    @State private var revealTextIndex = 0
    @State private var currentTruthCard = 0
    
    enum SalvadorPhase {
        case flagShowing
        case glowing
        case dissolving
        case truthRevealed
        case teaching
    }
    
    private let introTexts = [
        "Salvadoreño...",
        "You know this flag.",
        "You were taught it means freedom.",
        "Dios, Unión, Libertad.",
        "You were taught to be proud.",
        "But there's something they never told you...",
        "About what happened to your people.",
        "About WHO funded the killers.",
        "About who CREATED the gangs.",
        "About why you really had to leave.",
        "The illusion is about to dissolve...",
    ]
    
    private let truthCards: [(title: String, content: String, stat: String?)] = [
        // Card 1: The Civil War
        (
            "The Civil War (1980-1992)",
            "75,000+ killed. 8,000+ disappeared. 1 million displaced — 20% of the entire population. Families torn apart. Communities erased. Children who grew up knowing nothing but violence. Your family was among them.",
            "📊 UN Truth Commission (1993): 95% of documented atrocities were committed by government forces and US-backed death squads. Not the guerrillas. The government."
        ),
        // Card 2: US Funding & Training
        (
            "The US Role — $6 Billion to Kill Your People",
            "The United States funded the Salvadoran military with $6 BILLION. Trained officers at the School of the Americas in Fort Benning, Georgia — nicknamed the 'School of Assassins.' CIA ran assassination programs. US military advisors on the ground. Your tax dollars — if you pay taxes now — funded the people who killed your neighbors, your family, your country.",
            "📊 At least 11 of the 12 officers cited for the El Mozote massacre were School of Americas graduates. The US literally trained the men who massacred a village of 1,000+."
        ),
        // Card 3: El Mozote
        (
            "El Mozote Massacre (December 1981)",
            "The US-trained Atlacatl Battalion surrounded the village of El Mozote. Over three days, they systematically executed over 1,000 civilians. Men were tortured and shot. Women were raped, then killed. Children — some as young as 2 — were murdered. The youngest victim found in the exhumation was an infant. The US Embassy knew within days. The Reagan administration's response: certify that El Salvador was 'making progress on human rights' so Congress would keep the money flowing.",
            "📊 Reagan certified 'human rights progress' FOUR TIMES while mass graves were being filled with children. A deliberate lie to Congress to keep $1M/day in military aid flowing."
        ),
        // Card 4: Romero & the Nuns
        (
            "They Killed a Saint and 4 Nuns",
            "Archbishop Óscar Romero — assassinated March 24, 1980, shot through the heart while saying mass. The day before, he begged soldiers on national radio: 'Stop the repression.' A US-backed death squad killed him for it. He is now a Catholic saint.\n\nThat same year: Maryknoll missionaries Jean Donovan, Dorothy Kazel, Ita Ford, and Maura Clarke — four American women — were raped and murdered by the Salvadoran National Guard. The US government's response: keep funding the military that killed its own citizens.",
            nil
        ),
        // Card 5: Why They Did It
        (
            "Why They Destroyed Your Country",
            "The US needed El Salvador to stay in its sphere of influence. A leftist government would nationalize resources, raise wages, redistribute land — threatening United Fruit Company, coffee export profits, and Cold War positioning. So they funded death squads to prevent democracy. Cheap labor and resource access were more important than 75,000 lives. Death squads were the tool. Your people were the cost. Corporate profit was the goal.",
            "📊 Follow the money: US corporations needed Central American countries as cheap labor sources and agricultural export zones. Democracy threatened that. Death squads preserved it."
        ),
        // Card 6: MS-13 — MADE IN LOS ANGELES
        (
            "MS-13: Made in Los Angeles, NOT El Salvador",
            "This is the part they NEVER tell you. MS-13 was not born in El Salvador. It was born in LOS ANGELES in the 1980s. Salvadoran refugees — fleeing the war the US funded — arrived in LA with nothing. Traumatized kids with no support system, no resources, no community. They were preyed on by existing gangs (Mexican Mafia, 18th Street). So they formed Mara Salvatrucha for PROTECTION. MS-13 is a direct product of: (1) a US-funded war that displaced a million people, (2) refugees dumped in the most violent neighborhoods in LA, and (3) zero support, zero integration, zero accountability from the country that caused their displacement.",
            "📊 MS-13 was founded in the Rampart area of Los Angeles, California, in the 1980s — by Salvadoran war refugees. It is an American-made gang exported to Central America."
        ),
        // Card 7: The Deportation Pipeline
        (
            "The Deportation Pipeline — Exporting the Problem",
            "Here's where it gets criminal. In the 1990s, MS-13 members committed crimes in the US — on US soil, under US jurisdiction. Instead of prosecuting and incarcerating them HERE, where the crimes occurred, the US mass-deported them to El Salvador. Tens of thousands of gang members — many who had never lived in El Salvador, who barely spoke Spanish — were dumped into a country with NO infrastructure, NO functioning justice system, and NO ability to handle them. A country the US had just finished destroying with a 12-year war.\n\nEl Salvador had no gang culture before this. The US CREATED the gang, then EXPORTED it to a nation it had already bombed into rubble.",
            "📊 Between 1998-2014, the US deported 130,000+ criminals to Central America. El Salvador — population 6 million — absorbed tens of thousands of hardened gang members it had no capacity to process."
        ),
        // Card 8: The Terrorism They Created
        (
            "The Terrorists THEY Made",
            "The deported MS-13 and Barrio 18 members didn't just survive in El Salvador — they THRIVED. A destroyed post-war country with corrupt police, no jobs, traumatized population, and zero infrastructure was the perfect breeding ground. What happened next: Extortion of every business, every bus driver, every family. Recruitment of children as young as 10. Neighborhoods controlled by gang territory. Murder rates that made El Salvador the most dangerous country on Earth (outside of active war zones). Thousands of people murdered every year.\n\nThe US funded the war that destroyed the country. Created the refugee crisis. Birthed the gang in LA. Then deported the gang back. Then watched El Salvador burn.",
            "📊 El Salvador's homicide rate peaked at 103 per 100,000 in 2015 — the highest in the world. For context, the US rate was 5 per 100,000. The US created this."
        ),
        // Card 9: The Immigration Hypocrisy
        (
            "The Hypocrisy: Destabilize, Then Criminalize",
            "And HERE is the ultimate hypocrisy. After the US:\n\n• Funded $6B in death squads (1980-1992)\n• Displaced 1 million Salvadorans\n• Created MS-13 in Los Angeles\n• Deported the gang to El Salvador\n• Watched the country become the most dangerous on Earth\n\n...they then CRIMINALIZE the refugees who flee. They call them 'illegal immigrants.' They separate families at the border. They put children in cages. They say 'go back to your country.'\n\nGO BACK TO WHAT? You destroyed it. You funded the killers. You created the gangs. You exported the violence. And now you police the people running from the fire YOU started?",
            "⚠️ This is not immigration. This is displacement. You don't get to burn someone's house down and then arrest them for being homeless."
        ),
        // Card 10: The Architecture of Control
        (
            "The Architecture: How It All Connects",
            "This is not an accident. This is an architecture:\n\nSTEP 1: Destabilize — Fund coups, death squads, regime change in countries with resources or strategic value (El Salvador, Guatemala, Honduras, Nicaragua, Chile, Iran, Iraq, Libya...)\n\nSTEP 2: Extract — While the country is destabilized, extract resources, maintain cheap labor, install puppet governments friendly to US corporate interests.\n\nSTEP 3: Neglect — When the war ends, provide ZERO reconstruction. Leave the country in ruins.\n\nSTEP 4: Export Problems — Deport criminals, gang members, and undesirables back to the destroyed country instead of handling them domestically.\n\nSTEP 5: Criminalize Refugees — When people flee the chaos YOU created, call them 'illegals,' build walls, militarize borders, separate families.\n\nSTEP 6: Campaign On It — Use 'immigration' as a political weapon. Fearmonger about the very people you displaced. Win elections by demonizing your own victims.",
            "📊 This architecture has been applied to El Salvador, Guatemala, Honduras (the 'Northern Triangle'), Haiti, and dozens more. The playbook is identical every time."
        ),
        // Card 11: They Want To Be The Hero Now
        (
            "Now They Want Credit For 'Fixing' It",
            "The final insult: after decades of destruction, the US now positions itself as the 'solution' to Central American instability. They offer 'aid packages' to address 'root causes of migration.' They send DEA agents to 'fight gangs.' They lecture about 'rule of law.'\n\nYou funded the death squads. You created the gangs. You deported the violence. You destroyed the infrastructure. And now you want to be the HERO?\n\nThis is like an arsonist showing up to the fire they started, wearing a firefighter uniform, and expecting a thank-you.\n\nThe root cause of migration is not poverty. The root cause is not gangs. The root cause is US foreign policy. Full stop.",
            "⚠️ They don't want to fix what they broke. They want to MANAGE what they broke — in a way that still serves their interests."
        ),
        // Card 12: Why You Left — The Real Story
        (
            "Why You Left — The Truth They Owe You",
            "You didn't leave because you wanted to. You didn't leave because your country was 'broken.' You left because the most powerful nation on Earth spent $6 billion breaking it.\n\nYour parents didn't cross a border because they were looking for a better life. They crossed a border because the better life they HAD was destroyed by the country on the other side of that border.\n\nEvery Salvadoran in the US is not an 'immigrant.' Every Salvadoran in the US is living proof of what happens when empire decides your country is less important than its profit margins.\n\nYou don't owe this country gratitude for taking you in. This country owes YOUR country an apology — and reparations — for what it did.\n\nYou are not an immigrant by choice. You are a refugee from a war your host country funded, a gang your host country created, and a crisis your host country engineered.",
            "⚠️ Salvadoreño — you carry the truth in your blood. The war didn't end. It just changed form. And now you're awake to the architecture. That makes you dangerous. That makes you SunFlow."
        ),
    ]
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            // Star field
            ForEach(0..<40, id: \.self) { i in
                Circle().fill(.white.opacity(Double.random(in: 0.1...0.4)))
                    .frame(width: CGFloat.random(in: 1...3))
                    .position(x: CGFloat.random(in: 0...400), y: CGFloat.random(in: 0...800))
            }
            
            VStack(spacing: 0) {
                // Close button
                HStack {
                    Spacer()
                    Button { dismiss() } label: {
                        Image(systemName: "xmark.circle.fill").font(.system(size: 24)).foregroundColor(.white.opacity(0.3))
                    }
                    .padding(20)
                }
                
                if phase == .teaching {
                    teachingPhase
                } else {
                    flagPhase
                }
            }
        }
        .onAppear { startSequence() }
    }
    
    // MARK: - Flag Phase
    
    private var flagPhase: some View {
        VStack(spacing: 0) {
            Spacer()
            
            ZStack {
                // Glow
                if phase != .flagShowing {
                    Circle()
                        .fill(RadialGradient(
                            colors: [Color.blue.opacity(glowIntensity * 0.4), Color.white.opacity(glowIntensity * 0.2), .clear],
                            center: .center, startRadius: 0, endRadius: 180
                        ))
                        .frame(width: 360, height: 360)
                }
                
                // Particles on dissolve
                if particleExplosion {
                    ForEach(0..<40, id: \.self) { i in
                        Circle()
                            .fill(i % 3 == 0 ? Color.blue : (i % 3 == 1 ? Color.white : Color.blue))
                            .frame(width: CGFloat.random(in: 2...5))
                            .offset(
                                x: CGFloat.random(in: -160...160) * dissolveProgress,
                                y: CGFloat.random(in: -200...200) * dissolveProgress
                            )
                            .opacity(Double(1.0 - dissolveProgress))
                    }
                }
                
                // El Salvador Flag SVG (stylized)
                if phase != .truthRevealed && phase != .teaching {
                    salvadorFlagSVG
                        .opacity(Double(1.0 - dissolveProgress))
                        .scaleEffect(1.0 + dissolveProgress * 0.3)
                        .blur(radius: dissolveProgress * 12)
                }
                
                // Truth symbol (appears after dissolve)
                if showTruth {
                    VStack(spacing: 8) {
                        Image(systemName: "eye.fill").font(.system(size: 50)).foregroundColor(.cyan)
                        Text("THE TRUTH").font(.system(size: 14, weight: .black)).tracking(4).foregroundColor(.cyan)
                    }
                    .transition(.scale.combined(with: .opacity))
                }
            }
            .frame(height: 280)
            
            Spacer().frame(height: 30)
            
            // Text
            if revealTextIndex < introTexts.count {
                Text(introTexts[revealTextIndex])
                    .font(.system(size: 18, weight: .bold)).foregroundColor(.white)
                    .opacity(textOpacity).multilineTextAlignment(.center)
                    .padding(.horizontal, 30)
                    .id(revealTextIndex)
            }
            
            Spacer()
            
            // Skip / Continue
            if phase == .truthRevealed {
                Button {
                    withAnimation(.easeInOut(duration: 0.5)) { phase = .teaching }
                } label: {
                    Text("SEE WHAT THEY HID").font(.system(size: 14, weight: .bold)).foregroundColor(.black)
                        .frame(maxWidth: .infinity).padding(.vertical, 14)
                        .background(Capsule().fill(Color.cyan))
                }
                .padding(.horizontal, 40).padding(.bottom, 40)
            }
        }
    }
    
    // MARK: - Teaching Phase
    
    private var teachingPhase: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 16) {
                Text("🇸🇻 EL SALVADOR").font(.system(size: 10, weight: .bold)).tracking(3).foregroundColor(.blue.opacity(0.5))
                Text("What They Never Told You").font(.system(size: 20, weight: .black)).foregroundColor(.white)
                
                TabView(selection: $currentTruthCard) {
                    ForEach(Array(truthCards.enumerated()), id: \.offset) { index, card in
                        VStack(alignment: .leading, spacing: 12) {
                            HStack {
                                Text("\(index + 1)/\(truthCards.count)").font(.system(size: 10, weight: .bold)).foregroundColor(.blue.opacity(0.4))
                                Spacer()
                            }
                            Text(card.title).font(.system(size: 16, weight: .bold)).foregroundColor(.white)
                            Text(card.content).font(.system(size: 13, weight: .medium)).foregroundColor(.white.opacity(0.7)).lineSpacing(4)
                            if let stat = card.stat {
                                Text(stat).font(.system(size: 11, weight: .bold, design: .monospaced)).foregroundColor(.cyan.opacity(0.7))
                                    .padding(10).frame(maxWidth: .infinity, alignment: .leading)
                                    .background(RoundedRectangle(cornerRadius: 8).fill(Color.cyan.opacity(0.04)))
                            }
                        }
                        .padding(16)
                        .background(RoundedRectangle(cornerRadius: 16).fill(Color.white.opacity(0.03))
                            .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.blue.opacity(0.08), lineWidth: 1)))
                        .tag(index)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .automatic))
                .frame(minHeight: 350)
                
                // Sources
                VStack(alignment: .leading, spacing: 4) {
                    Text("SOURCES").font(.system(size: 9, weight: .bold)).tracking(1).foregroundColor(.white.opacity(0.2))
                    Text("• UN Truth Commission on El Salvador (1993)").font(.system(size: 9)).foregroundColor(.white.opacity(0.2))
                    Text("• School of Americas Watch (soaw.org)").font(.system(size: 9)).foregroundColor(.white.opacity(0.2))
                    Text("• Mark Danner — The Massacre at El Mozote (1994)").font(.system(size: 9)).foregroundColor(.white.opacity(0.2))
                    Text("• Raymond Bonner — Weakness and Deceit (1984)").font(.system(size: 9)).foregroundColor(.white.opacity(0.2))
                    Text("• National Security Archive — El Salvador declassified").font(.system(size: 9)).foregroundColor(.white.opacity(0.2))
                    Text("• IIRIRA (1996) — US deportation policy that enabled mass removal").font(.system(size: 9)).foregroundColor(.white.opacity(0.2))
                    Text("• InSight Crime — MS-13 origin & deportation pipeline research").font(.system(size: 9)).foregroundColor(.white.opacity(0.2))
                    Text("• Héctor Silva Ávalos — Infiltrados (MS-13 & state collusion)").font(.system(size: 9)).foregroundColor(.white.opacity(0.2))
                    Text("• US GAO Reports on Central American deportation impacts").font(.system(size: 9)).foregroundColor(.white.opacity(0.2))
                    Text("• Joan Friedland & Jesús Rodríguez — Seeking Safe Ground (2009)").font(.system(size: 9)).foregroundColor(.white.opacity(0.2))
                }
                .padding(10).background(RoundedRectangle(cornerRadius: 8).fill(Color.white.opacity(0.015)))
                
                Button { dismiss() } label: {
                    Text("Return to Module").font(.system(size: 14, weight: .bold)).foregroundColor(.black)
                        .frame(maxWidth: .infinity).padding(.vertical, 12)
                        .background(Capsule().fill(Color.cyan))
                }
                
                Spacer(minLength: 40)
            }
            .padding(20)
        }
    }
    
    // MARK: - El Salvador Flag SVG
    
    private var salvadorFlagSVG: some View {
        VStack(spacing: 0) {
            // Top blue stripe
            Rectangle().fill(Color(red: 0.0, green: 0.32, blue: 0.73)).frame(height: 60)
            // White stripe with coat of arms hint
            ZStack {
                Rectangle().fill(Color.white)
                // Simplified coat of arms
                VStack(spacing: 2) {
                    // Triangle
                    Image(systemName: "triangle.fill").font(.system(size: 20)).foregroundColor(Color(red: 0.0, green: 0.32, blue: 0.73))
                    // Volcanoes hint
                    HStack(spacing: 4) {
                        Image(systemName: "mountain.2.fill").font(.system(size: 8)).foregroundColor(.green)
                    }
                    Text("DIOS UNIÓN LIBERTAD").font(.system(size: 5, weight: .bold)).foregroundColor(Color(red: 0.0, green: 0.32, blue: 0.73))
                }
            }
            .frame(height: 60)
            // Bottom blue stripe
            Rectangle().fill(Color(red: 0.0, green: 0.32, blue: 0.73)).frame(height: 60)
        }
        .frame(width: 240, height: 180)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.white.opacity(0.2), lineWidth: 2))
        .shadow(color: Color.blue.opacity(0.3), radius: 20)
    }
    
    // MARK: - Animation Sequence
    
    private func startSequence() {
        // Text cycling
        cycleText(index: 0)
        
        // Phase 1: Show flag, start glow (3s)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            phase = .glowing
            withAnimation(.easeInOut(duration: 2.5)) { glowIntensity = 1.0 }
        }
        
        // Phase 2: Start dissolve (after all text ~24s, but we overlap at ~18s)
        DispatchQueue.main.asyncAfter(deadline: .now() + 18.0) {
            phase = .dissolving
            particleExplosion = true
            withAnimation(.easeInOut(duration: 3.0)) { dissolveProgress = 1.0 }
        }
        
        // Phase 3: Truth revealed (21s)
        DispatchQueue.main.asyncAfter(deadline: .now() + 21.0) {
            phase = .truthRevealed
            withAnimation(.spring(response: 0.5)) { showTruth = true }
        }
    }
    
    private func cycleText(index: Int) {
        guard index < introTexts.count else { return }
        revealTextIndex = index
        withAnimation(.easeIn(duration: 0.3)) { textOpacity = 1.0 }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.8) {
            withAnimation(.easeOut(duration: 0.3)) { textOpacity = 0 }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                cycleText(index: index + 1)
            }
        }
    }
}
