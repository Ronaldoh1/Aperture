// SourceLibraryView.swift
// Transparency Layer — "Here are the receipts. Go read them yourself."
// Every claim traced back. Every source linked. Every door opened.
// ☀️ SunFlow: Reignited

import SwiftUI

// MARK: - Source Library View (lives in More tab)

struct SourceLibraryView: View {
    
    @State private var selectedCategory: SourceCategory = .all
    @State private var searchText: String = ""
    @State private var showTransparencyNote: Bool = true
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [Color(hex: "#07070d"), Color(hex: "#0a0a14"), Color(hex: "#07070d")],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 24) {
                    
                    // Transparency Note
                    if showTransparencyNote {
                        transparencyBanner
                    }
                    
                    // Search
                    searchBar
                    
                    // Category Chips
                    categoryChips
                    
                    // Course Sources Section
                    courseSourcesSection
                    
                    // Further Reading Section
                    furtherReadingSection
                    
                    // Primary Texts Section
                    primaryTextsSection
                    
                    // Footer
                    footerNote
                    
                    Spacer(minLength: 100)
                }
                .padding(.horizontal, 20)
                .padding(.top, 12)
            }
        }
        .navigationTitle("Sources & Further Reading")
        .navigationBarTitleDisplayMode(.large)
    }
    
    // MARK: - Transparency Banner
    
    private var transparencyBanner: some View {
        VStack(spacing: 14) {
            HStack(spacing: 10) {
                ZStack {
                    Circle()
                        .fill(Palette.accent.gold.opacity(0.15))
                        .frame(width: 36, height: 36)
                    Image(systemName: "checkmark.shield.fill")
                        .font(.system(size: 16))
                        .foregroundColor(Palette.accent.gold)
                }
                
                Text("Our Commitment to Transparency")
                    .font(.system(size: 16, weight: .bold, design: .rounded))
                    .foregroundColor(Palette.text.primary)
                
                Spacer()
                
                Button(action: { withAnimation { showTransparencyNote = false } }) {
                    Image(systemName: "xmark")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(Palette.text.muted)
                }
            }
            
            Text("Every piece of knowledge in Aperture can be traced back to its original source — ancient texts, academic scholarship, archaeological records, and peer-reviewed research. We don't ask you to take our word for it. We give you the sources and encourage you to explore them yourself.")
                .font(.system(size: 13, weight: .medium, design: .rounded))
                .foregroundColor(Palette.text.secondary)
                .lineSpacing(4)
            
            Text("This is not a closed system. It's a starting point. The further reading below will take you far beyond this app — and that's exactly how it should be.")
                .font(.system(size: 13, weight: .medium, design: .rounded))
                .foregroundColor(Palette.text.secondary)
                .lineSpacing(4)
            
            Divider().background(Palette.accent.gold.opacity(0.15))
            
            HStack(spacing: 6) {
                Image(systemName: "book.fill")
                    .font(.system(size: 11))
                    .foregroundColor(Palette.primary.cyan)
                Text("All sources listed are for educational purposes. Aperture does not claim ownership of any referenced works.")
                    .font(.system(size: 11, weight: .medium))
                    .foregroundColor(Palette.text.muted)
                    .lineSpacing(2)
            }
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Palette.accent.gold.opacity(0.04))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Palette.accent.gold.opacity(0.12), lineWidth: 1)
                )
        )
    }
    
    // MARK: - Search Bar
    
    private var searchBar: some View {
        HStack(spacing: 10) {
            Image(systemName: "magnifyingglass")
                .font(.system(size: 14))
                .foregroundColor(Palette.text.muted)
            
            TextField("Search sources...", text: $searchText)
                .font(.system(size: 14, weight: .medium, design: .rounded))
                .foregroundColor(Palette.text.primary)
                .tint(Palette.accent.gold)
            
            if !searchText.isEmpty {
                Button(action: { searchText = "" }) {
                    Image(systemName: "xmark.circle.fill")
                        .font(.system(size: 14))
                        .foregroundColor(Palette.text.muted)
                }
            }
        }
        .padding(12)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white.opacity(0.05))
                .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.white.opacity(0.08), lineWidth: 1))
        )
    }
    
    // MARK: - Category Chips
    
    private var categoryChips: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                ForEach(SourceCategory.allCases, id: \.self) { category in
                    Button(action: { withAnimation(.spring(response: 0.3)) { selectedCategory = category } }) {
                        HStack(spacing: 5) {
                            Text(category.icon)
                                .font(.system(size: 12))
                            Text(category.label)
                                .font(.system(size: 12, weight: .semibold, design: .rounded))
                        }
                        .foregroundColor(selectedCategory == category ? .black : Palette.text.secondary)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 7)
                        .background(
                            Capsule().fill(selectedCategory == category ? Palette.accent.gold : Color.white.opacity(0.06))
                        )
                    }
                }
            }
        }
    }
    
    // MARK: - Course Sources Section
    
    private var courseSourcesSection: some View {
        VStack(alignment: .leading, spacing: 14) {
            sectionHeader(icon: "book.closed.fill", title: "COURSE CITATIONS", subtitle: "Sources referenced in each Alexandria course")
            
            let courses = filteredCourses
            
            if courses.isEmpty {
                emptyState("No courses match your search.")
            } else {
                ForEach(courses, id: \.id) { course in
                    CourseSourceCard(course: course)
                }
            }
        }
    }
    
    // MARK: - Further Reading Section
    
    private var furtherReadingSection: some View {
        VStack(alignment: .leading, spacing: 14) {
            sectionHeader(icon: "books.vertical.fill", title: "FURTHER READING", subtitle: "Go deeper — books, texts, and scholarship beyond the app")
            
            let readings = filteredReadings
            
            if readings.isEmpty {
                emptyState("No readings match your search.")
            } else {
                ForEach(readings) { reading in
                    FurtherReadingCard(reading: reading)
                }
            }
        }
    }
    
    // MARK: - Primary Texts Section
    
    private var primaryTextsSection: some View {
        VStack(alignment: .leading, spacing: 14) {
            sectionHeader(icon: "scroll.fill", title: "PRIMARY TEXTS", subtitle: "The original sources — many available free online")
            
            let texts = filteredPrimaryTexts
            
            if texts.isEmpty {
                emptyState("No texts match your search.")
            } else {
                ForEach(texts) { text in
                    PrimaryTextCard(text: text)
                }
            }
        }
    }
    
    // MARK: - Footer
    
    private var footerNote: some View {
        VStack(spacing: 10) {
            Divider().background(Palette.accent.gold.opacity(0.15))
            
            Text("\"The Library of Alexandria was burned. But knowledge doesn't die — it waits for someone to remember.\"")
                .font(.system(size: 12, weight: .medium, design: .serif))
                .italic()
                .foregroundColor(Palette.text.muted)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 20)
            
            Text("— The Chronokeeper")
                .font(.system(size: 10, weight: .bold))
                .foregroundColor(Palette.accent.gold.opacity(0.5))
            
            Text("Know a source we should add? Let us know in Settings → Feedback.")
                .font(.system(size: 11, weight: .medium))
                .foregroundColor(Palette.text.muted)
                .padding(.top, 8)
        }
        .padding(.top, 16)
    }
    
    // MARK: - Helpers
    
    private func sectionHeader(icon: String, title: String, subtitle: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack(spacing: 6) {
                Image(systemName: icon)
                    .font(.system(size: 12))
                    .foregroundColor(Palette.accent.gold)
                Text(title)
                    .font(.system(size: 11, weight: .bold)).tracking(1.5)
                    .foregroundColor(Palette.accent.gold.opacity(0.8))
            }
            Text(subtitle)
                .font(.system(size: 12, weight: .medium))
                .foregroundColor(Palette.text.muted)
        }
        .padding(.top, 8)
    }
    
    private func emptyState(_ text: String) -> some View {
        Text(text)
            .font(.system(size: 13, weight: .medium))
            .foregroundColor(Palette.text.muted)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 20)
    }
    
    // MARK: - Filtering
    
    private var filteredCourses: [AlexandriaCourse] {
        let courses = AlexandriaCourseRegistry.allCourses
        let search = searchText.lowercased()
        
        return courses.filter { course in
            let matchesCategory = selectedCategory == .all || courseMatchesCategory(course, selectedCategory)
            let matchesSearch = search.isEmpty ||
                course.title.lowercased().contains(search) ||
                course.sources.joined().lowercased().contains(search)
            return matchesCategory && matchesSearch
        }
    }
    
    private var filteredReadings: [FurtherReading] {
        let search = searchText.lowercased()
        return FurtherReading.all.filter { reading in
            let matchesCategory = selectedCategory == .all || reading.category == selectedCategory
            let matchesSearch = search.isEmpty ||
                reading.title.lowercased().contains(search) ||
                reading.author.lowercased().contains(search)
            return matchesCategory && matchesSearch
        }
    }
    
    private var filteredPrimaryTexts: [PrimaryText] {
        let search = searchText.lowercased()
        return PrimaryText.all.filter { text in
            let matchesCategory = selectedCategory == .all || text.category == selectedCategory
            let matchesSearch = search.isEmpty ||
                text.title.lowercased().contains(search) ||
                text.origin.lowercased().contains(search)
            return matchesCategory && matchesSearch
        }
    }
    
    private func courseMatchesCategory(_ course: AlexandriaCourse, _ category: SourceCategory) -> Bool {
        let id = course.id.lowercased()
        switch category {
        case .all: return true
        case .gnostic: return ["gospel_of_judas", "christ_consciousness", "crucifixion_initiation", "elohim", "cross_solar_portal", "antichrist_decoded", "baphomet_mirror"].contains(id)
        case .ancient: return ["anunnaki", "lemuria_atlantis", "nephilim_watchers", "twelve_plus_one", "one_forty_four_thousand"].contains(id)
        case .esoteric: return ["alchemy", "abracadabra", "tarot_arcana", "urantia_gaia"].contains(id)
        case .power: return ["guilt_and_power", "antichrist_decoded", "tonantzin"].contains(id)
        case .nutrition: return false
        case .science: return false
        }
    }
}

// MARK: - Source Category

enum SourceCategory: String, CaseIterable {
    case all, gnostic, ancient, esoteric, power, nutrition, science
    
    var label: String {
        switch self {
        case .all: return "All"
        case .gnostic: return "Gnostic"
        case .ancient: return "Ancient Civ"
        case .esoteric: return "Esoteric"
        case .power: return "Power & Control"
        case .nutrition: return "Nutrition"
        case .science: return "Science"
        }
    }
    
    var icon: String {
        switch self {
        case .all: return "📚"
        case .gnostic: return "✨"
        case .ancient: return "🏛️"
        case .esoteric: return "🔮"
        case .power: return "⚖️"
        case .nutrition: return "🧬"
        case .science: return "⚛️"
        }
    }
}

// MARK: - Course Source Card

struct CourseSourceCard: View {
    let course: AlexandriaCourse
    @State private var isExpanded: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // Header
            Button(action: { withAnimation(.spring(response: 0.3)) { isExpanded.toggle() } }) {
                HStack(spacing: 10) {
                    Text(course.icon)
                        .font(.system(size: 20))
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text(course.title)
                            .font(.system(size: 14, weight: .bold, design: .rounded))
                            .foregroundColor(Palette.text.primary)
                        Text("\(course.sources.count) sources cited")
                            .font(.system(size: 11, weight: .medium))
                            .foregroundColor(Palette.text.muted)
                    }
                    
                    Spacer()
                    
                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(Palette.text.muted)
                }
            }
            .padding(14)
            
            // Expanded Sources
            if isExpanded {
                VStack(alignment: .leading, spacing: 8) {
                    ForEach(course.sources, id: \.self) { source in
                        HStack(alignment: .top, spacing: 8) {
                            Image(systemName: "doc.text.fill")
                                .font(.system(size: 10))
                                .foregroundColor(course.color.opacity(0.6))
                                .frame(width: 14)
                                .padding(.top, 2)
                            
                            Text(source)
                                .font(.system(size: 12, weight: .medium, design: .rounded))
                                .foregroundColor(Palette.text.secondary)
                                .lineSpacing(2)
                                .textSelection(.enabled)
                        }
                    }
                }
                .padding(.horizontal, 14)
                .padding(.bottom, 14)
                .transition(.opacity.combined(with: .move(edge: .top)))
            }
        }
        .background(
            RoundedRectangle(cornerRadius: 14)
                .fill(Color.white.opacity(0.03))
                .overlay(
                    RoundedRectangle(cornerRadius: 14)
                        .stroke(isExpanded ? course.color.opacity(0.2) : Color.white.opacity(0.06), lineWidth: 1)
                )
        )
    }
}

// MARK: - Further Reading Data

struct FurtherReading: Identifiable {
    let id = UUID()
    let title: String
    let author: String
    let year: String
    let description: String
    let category: SourceCategory
    let icon: String
    
    static let all: [FurtherReading] = [
        // Gnostic
        FurtherReading(title: "The Nag Hammadi Scriptures", author: "Marvin Meyer (editor)", year: "2007",
                       description: "The definitive English translation of all Nag Hammadi texts discovered in Egypt, 1945. Includes the Gospel of Thomas, Gospel of Philip, and Apocryphon of John.",
                       category: .gnostic, icon: "📜"),
        FurtherReading(title: "The Gnostic Gospels", author: "Elaine Pagels", year: "1979",
                       description: "Pulitzer Prize-winning examination of the Nag Hammadi texts and how they challenge orthodox Christianity. Accessible entry point to Gnostic thought.",
                       category: .gnostic, icon: "📖"),
        FurtherReading(title: "The Unseen Realm", author: "Michael S. Heiser", year: "2015",
                       description: "Academic analysis of the Divine Council in Hebrew scripture. What 'Elohim' really means, the Watchers, Nephilim, and supernatural worldview of the Bible's authors.",
                       category: .gnostic, icon: "📖"),
        FurtherReading(title: "Reversing Hermon", author: "Michael S. Heiser", year: "2017",
                       description: "Deep scholarship on 1 Enoch, the Watchers tradition, and how the New Testament authors understood the Nephilim narrative.",
                       category: .gnostic, icon: "📖"),
        FurtherReading(title: "Not in His Image", author: "John Lamb Lash", year: "2006",
                       description: "Radical re-reading of Gnostic myth, focusing on Sophia and the Archons as a framework for understanding institutional religion.",
                       category: .gnostic, icon: "📖"),
        
        // Ancient Civilizations
        FurtherReading(title: "Fingerprints of the Gods", author: "Graham Hancock", year: "1995",
                       description: "The foundational text on lost civilizations. Explores evidence for advanced pre-Ice Age societies through geology, mythology, and astronomy.",
                       category: .ancient, icon: "🗿"),
        FurtherReading(title: "Magicians of the Gods", author: "Graham Hancock", year: "2015",
                       description: "Follow-up to Fingerprints with updated evidence including Göbekli Tepe and Younger Dryas comet impact research.",
                       category: .ancient, icon: "🗿"),
        FurtherReading(title: "History Begins at Sumer", author: "Samuel Noah Kramer", year: "1956",
                       description: "Academic survey of Sumerian civilization — the first schools, laws, literature, and creation accounts. Primary source scholarship.",
                       category: .ancient, icon: "🏛️"),
        FurtherReading(title: "The 12th Planet", author: "Zecharia Sitchin", year: "1976",
                       description: "Controversial translation of Sumerian texts proposing the Anunnaki as extraterrestrial beings. Foundational text in ancient astronaut theory.",
                       category: .ancient, icon: "🛸"),
        FurtherReading(title: "Maps of the Ancient Sea Kings", author: "Charles Hapgood", year: "1966",
                       description: "Analysis of medieval maps (including the Piri Reis map) showing coastlines that shouldn't have been known. Einstein wrote the foreword.",
                       category: .ancient, icon: "🗺️"),
        
        // Esoteric
        FurtherReading(title: "The Way of Tarot", author: "Alejandro Jodorowsky", year: "2009",
                       description: "The Tarot as a map of consciousness, not fortune telling. Deep symbolic analysis by the legendary filmmaker and psychomagic practitioner.",
                       category: .esoteric, icon: "🃏"),
        FurtherReading(title: "Psychology and Alchemy", author: "Carl G. Jung", year: "1944",
                       description: "Jung's masterwork connecting alchemical symbolism to the process of individuation. The gold was always consciousness.",
                       category: .esoteric, icon: "⚗️"),
        FurtherReading(title: "The Emerald Tablet", author: "Dennis William Hauck", year: "1999",
                       description: "Practical guide to alchemical transformation using the Hermetic principles of the Emerald Tablet attributed to Hermes Trismegistus.",
                       category: .esoteric, icon: "💎"),
        FurtherReading(title: "The Hero with a Thousand Faces", author: "Joseph Campbell", year: "1949",
                       description: "The monomyth — the universal hero's journey across all cultures. The blueprint behind every awakening narrative, including yours.",
                       category: .esoteric, icon: "🦸"),
        
        // Power & Control
        FurtherReading(title: "Propaganda", author: "Edward Bernays", year: "1928",
                       description: "The nephew of Freud wrote the literal playbook on mass manipulation. Still used today. Read it to see the patterns.",
                       category: .power, icon: "📺"),
        FurtherReading(title: "Manufacturing Consent", author: "Noam Chomsky & Edward Herman", year: "1988",
                       description: "How mass media functions as a propaganda system. The 5 filters that shape everything you see on the news.",
                       category: .power, icon: "📰"),
        FurtherReading(title: "The Creature from Jekyll Island", author: "G. Edward Griffin", year: "1994",
                       description: "The history of the Federal Reserve — how it was created, by whom, and why. Follow the money, always.",
                       category: .power, icon: "🏦"),
        
        // Nutrition
        FurtherReading(title: "Metabolical", author: "Robert Lustig, MD", year: "2021",
                       description: "How processed food, pharma, and politics are destroying our health. The science behind why the Kill List chemicals matter.",
                       category: .nutrition, icon: "🍎"),
        FurtherReading(title: "Seed Oil-Free", author: "Dr. Chris Knobbe", year: "2020",
                       description: "Ophthalmologist's research linking seed oils (canola, soybean) to chronic disease. The data they don't want you to see.",
                       category: .nutrition, icon: "🧴"),
        FurtherReading(title: "The Case Against Fluoride", author: "Paul Connett, James Beck, H. Spedding Micklem", year: "2010",
                       description: "Three scientists present the evidence against water fluoridation. Peer-reviewed and heavily footnoted.",
                       category: .nutrition, icon: "💧"),
        
        // Science
        FurtherReading(title: "The Electric Universe", author: "Wallace Thornhill & David Talbott", year: "2007",
                       description: "Plasma cosmology and electromagnetic forces as the primary shapers of the universe. Challenges gravity-centric models.",
                       category: .science, icon: "⚡"),
        FurtherReading(title: "Morphic Resonance", author: "Rupert Sheldrake", year: "2009",
                       description: "Cambridge biologist's theory that memory is inherent in nature. Explains the 144,000 critical mass concept through science.",
                       category: .science, icon: "🧬"),
        FurtherReading(title: "Science Set Free", author: "Rupert Sheldrake", year: "2012",
                       description: "Challenges the 10 dogmas of mainstream science. What happens when a Cambridge PhD questions the unquestionable.",
                       category: .science, icon: "🔬")
    ]
}

// MARK: - Further Reading Card

struct FurtherReadingCard: View {
    let reading: FurtherReading
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Text(reading.icon)
                .font(.system(size: 24))
                .frame(width: 36)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(reading.title)
                    .font(.system(size: 14, weight: .bold, design: .rounded))
                    .foregroundColor(Palette.text.primary)
                    .lineLimit(2)
                
                Text("\(reading.author) · \(reading.year)")
                    .font(.system(size: 11, weight: .semibold))
                    .foregroundColor(Palette.accent.gold.opacity(0.7))
                
                Text(reading.description)
                    .font(.system(size: 12, weight: .medium, design: .rounded))
                    .foregroundColor(Palette.text.muted)
                    .lineSpacing(2)
                    .lineLimit(3)
                
                HStack(spacing: 4) {
                    Text(reading.category.icon)
                        .font(.system(size: 9))
                    Text(reading.category.label)
                        .font(.system(size: 9, weight: .bold))
                        .foregroundColor(Palette.text.muted)
                }
                .padding(.top, 2)
            }
        }
        .padding(14)
        .background(
            RoundedRectangle(cornerRadius: 14)
                .fill(Color.white.opacity(0.03))
                .overlay(
                    RoundedRectangle(cornerRadius: 14)
                        .stroke(Color.white.opacity(0.06), lineWidth: 1)
                )
        )
    }
}

// MARK: - Primary Texts Data

struct PrimaryText: Identifiable {
    let id = UUID()
    let title: String
    let origin: String
    let date: String
    let description: String
    let availability: String
    let category: SourceCategory
    
    static let all: [PrimaryText] = [
        PrimaryText(title: "The Nag Hammadi Library", origin: "Upper Egypt", date: "~2nd-4th century CE, discovered 1945",
                    description: "52 Gnostic texts including the Gospel of Thomas, Gospel of Philip, Apocryphon of John, and Gospel of Truth. The texts the church tried to destroy.",
                    availability: "Free at gnosis.org • Marvin Meyer translation (2007)", category: .gnostic),
        PrimaryText(title: "1 Enoch (Book of Enoch)", origin: "Ethiopian/Judean", date: "~3rd century BCE",
                    description: "The Watchers, the Nephilim, the fallen angels. Removed from the biblical canon at the Council of Laodicea (~363 CE) but preserved in the Ethiopian Orthodox tradition.",
                    availability: "Free at sacred-texts.com • R.H. Charles translation", category: .gnostic),
        PrimaryText(title: "The Dead Sea Scrolls", origin: "Qumran, Israel", date: "~3rd century BCE - 1st century CE, discovered 1947",
                    description: "Over 900 manuscripts including the oldest known copies of Hebrew Bible texts and previously unknown religious writings.",
                    availability: "Digital access: deadseascrolls.org.il • Leon Levy Digital Library", category: .gnostic),
        PrimaryText(title: "The Gospel of Judas", origin: "Egypt (Codex Tchacos)", date: "~280 CE, authenticated 2006",
                    description: "Sethian Gnostic text presenting Judas as the only disciple who understood Jesus' true teaching. Published by National Geographic.",
                    availability: "National Geographic translation (2006) • Marvin Meyer edition", category: .gnostic),
        PrimaryText(title: "The Emerald Tablet", origin: "Attributed to Hermes Trismegistus", date: "~6th-8th century CE (earliest Arabic versions)",
                    description: "'As above, so below.' The foundational text of Hermetic philosophy and alchemy. 15 lines that influenced Newton, Jung, and every alchemist.",
                    availability: "Free at sacred-texts.com • Multiple translations available", category: .esoteric),
        PrimaryText(title: "Pistis Sophia", origin: "Egyptian Coptic", date: "~3rd century CE",
                    description: "Gnostic text describing Sophia's fall from the Pleroma, her repentance, and restoration. Core source for the Cosmos module's cosmology.",
                    availability: "G.R.S. Mead translation • Free at gnosis.org", category: .gnostic),
        PrimaryText(title: "Sefer Yetzirah (Book of Formation)", origin: "Hebrew Kabbalistic", date: "~2nd-6th century CE",
                    description: "The oldest Kabbalistic text. Describes creation through the 22 Hebrew letters and 10 Sefirot. Foundation for understanding 'I create as I speak.'",
                    availability: "Aryeh Kaplan translation (1990)", category: .esoteric),
        PrimaryText(title: "The Urantia Book", origin: "Chicago, USA", date: "1955",
                    description: "2,097-page cosmological text describing the universe's structure, Earth's hidden history, and the life of Jesus from a cosmic perspective.",
                    availability: "Free at urantia.org • Complete text available online", category: .esoteric),
        PrimaryText(title: "Enuma Elish", origin: "Babylonian", date: "~1900-1200 BCE",
                    description: "The Babylonian creation epic. Describes the Anunnaki, cosmic battles, and the creation of humans. Predates Genesis by over a millennium.",
                    availability: "L.W. King translation • Free at sacred-texts.com", category: .ancient),
        PrimaryText(title: "The Epic of Atrahasis", origin: "Sumerian/Akkadian", date: "~1700 BCE",
                    description: "Sumerian flood narrative and creation account. Describes the Anunnaki creating humans as workers. Source material for the Genesis flood story.",
                    availability: "W.G. Lambert & A.R. Millard translation", category: .ancient),
        PrimaryText(title: "Timaeus & Critias", origin: "Plato, Athens", date: "~360 BCE",
                    description: "The original source for the Atlantis account. Plato describes an advanced civilization destroyed 9,000 years before his time.",
                    availability: "Free at Project Gutenberg • Multiple translations", category: .ancient),
        PrimaryText(title: "The Hesiod Theogony", origin: "Greece", date: "~700 BCE",
                    description: "Greek cosmogony — the birth of the gods, Titans, and the structure of the cosmos. Foundation for understanding Western mythological patterns.",
                    availability: "Free at sacred-texts.com • Hugh G. Evelyn-White translation", category: .ancient)
    ]
}

// MARK: - Primary Text Card

struct PrimaryTextCard: View {
    let text: PrimaryText
    @State private var isExpanded: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Button(action: { withAnimation(.spring(response: 0.3)) { isExpanded.toggle() } }) {
                HStack(spacing: 10) {
                    Image(systemName: "scroll.fill")
                        .font(.system(size: 16))
                        .foregroundColor(Palette.accent.gold.opacity(0.6))
                        .frame(width: 24)
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text(text.title)
                            .font(.system(size: 14, weight: .bold, design: .rounded))
                            .foregroundColor(Palette.text.primary)
                            .multilineTextAlignment(.leading)
                        Text("\(text.origin) · \(text.date)")
                            .font(.system(size: 11, weight: .medium))
                            .foregroundColor(Palette.text.muted)
                            .lineLimit(1)
                    }
                    
                    Spacer()
                    
                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                        .font(.system(size: 11, weight: .bold))
                        .foregroundColor(Palette.text.muted)
                }
            }
            .padding(14)
            
            if isExpanded {
                VStack(alignment: .leading, spacing: 8) {
                    Text(text.description)
                        .font(.system(size: 12, weight: .medium, design: .rounded))
                        .foregroundColor(Palette.text.secondary)
                        .lineSpacing(3)
                    
                    HStack(alignment: .top, spacing: 6) {
                        Image(systemName: "link")
                            .font(.system(size: 10))
                            .foregroundColor(Palette.primary.cyan)
                            .padding(.top, 2)
                        Text(text.availability)
                            .font(.system(size: 11, weight: .semibold, design: .rounded))
                            .foregroundColor(Palette.primary.cyan.opacity(0.8))
                            .lineSpacing(2)
                    }
                    .padding(8)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Palette.primary.cyan.opacity(0.05))
                    )
                }
                .padding(.horizontal, 14)
                .padding(.bottom, 14)
                .transition(.opacity.combined(with: .move(edge: .top)))
            }
        }
        .background(
            RoundedRectangle(cornerRadius: 14)
                .fill(Color.white.opacity(0.03))
                .overlay(
                    RoundedRectangle(cornerRadius: 14)
                        .stroke(isExpanded ? Palette.accent.gold.opacity(0.15) : Color.white.opacity(0.06), lineWidth: 1)
                )
        )
    }
}
