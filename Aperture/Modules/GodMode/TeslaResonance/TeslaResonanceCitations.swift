// TeslaResonanceCitations.swift + CourseCreditsModal (app-wide)
// SunFlow: Reignited — Aperture
//
// CourseCreditsModal is reusable across ALL courses and views.
// Pass any [CourseCitation] array to show appropriate sources.
// Consistent ⊕ books icon in navbar — shown everywhere citations exist.

import SwiftUI

// MARK: - Citation Model

struct CourseCitation: Identifiable {
    let id: String
    let type: CitationType
    let title: String
    let author: String
    let year: String?
    let publisher: String?
    let url: String?
    let doi: String?
    let note: String?        // credibility/caveat note
    let tags: [String]       // e.g. ["peer-reviewed", "replicated", "contested"]

    enum CitationType: String {
        case peerReviewed    = "Peer-Reviewed Study"
        case book            = "Book"
        case journal         = "Journal"
        case interview       = "Interview / Talk"
        case institution     = "Research Institution"
        case furtherReading  = "Further Reading"
    }

    var icon: String {
        switch type {
        case .peerReviewed:  return "doc.text.magnifyingglass"
        case .book:          return "book.closed.fill"
        case .journal:       return "newspaper.fill"
        case .interview:     return "waveform.and.mic"
        case .institution:   return "building.columns.fill"
        case .furtherReading: return "arrow.up.right.square"
        }
    }

    var tagColor: Color {
        if tags.contains("peer-reviewed") || tags.contains("replicated") { return .green }
        if tags.contains("contested") || tags.contains("speculative") { return .orange }
        return .blue
    }
}

// MARK: - Tesla Course Citations

enum TeslaResonanceCitations {
    static let all: [CourseCitation] = [

        // ── Module 1: Vibrational Reality ───────────────────────────
        CourseCitation(
            id: "schumann_1952",
            type: .peerReviewed,
            title: "Über die strahlungslosen Eigenschwingungen einer leitenden Kugel (On the free oscillations of a conducting sphere)",
            author: "Schumann, W.O.",
            year: "1952",
            publisher: "Zeitschrift für Naturforschung A",
            url: nil,
            doi: "10.1515/zna-1952-0202",
            note: "Original paper establishing Earth's electromagnetic resonance at ~7.83 Hz. Foundational — this is established physics.",
            tags: ["peer-reviewed", "replicated", "foundational"]
        ),

        CourseCitation(
            id: "heartmath_hrv",
            type: .institution,
            title: "Heart Rate Variability, Coherence & Emotional Regulation Research",
            author: "HeartMath Institute",
            year: "1991–2024",
            publisher: "HeartMath Institute",
            url: "https://www.heartmath.org/research/",
            doi: nil,
            note: "Extensive peer-reviewed research on heart-brain coherence, HRV, and bioelectric fields. Well-replicated. Some claims extend into more speculative territory.",
            tags: ["peer-reviewed", "institution", "replicated"]
        ),

        CourseCitation(
            id: "tesla_biography",
            type: .book,
            title: "Tesla: Man Out of Time",
            author: "Cheney, Margaret",
            year: "1981",
            publisher: "Prentice-Hall",
            url: "https://www.goodreads.com/book/show/15959.Tesla",
            doi: nil,
            note: "Most comprehensive and scholarly biography. Source for Tesla's documented obsessions with 3-6-9, mental visualization, resonance, and ether.",
            tags: ["biography", "documented-history"]
        ),

        // ── Module 2: Brain as Receiver / Biofield ──────────────────
        CourseCitation(
            id: "kastrup_consciousness",
            type: .book,
            title: "Decoding Schopenhauer's Metaphysics",
            author: "Kastrup, Bernardo",
            year: "2020",
            publisher: "Iff Books",
            url: "https://www.bernardo-kastrup.com",
            doi: nil,
            note: "Philosophical and mathematical case for consciousness as fundamental — the 'transmission model.' Published philosopher with PhD in computer engineering. Peer-reviewed chapters available.",
            tags: ["peer-reviewed", "philosophical"]
        ),

        CourseCitation(
            id: "heartmath_biofield",
            type: .peerReviewed,
            title: "The Coherent Heart: Heart-Brain Interactions, Psychophysiological Coherence, and the Emergence of System-Wide Order",
            author: "McCraty, R., Atkinson, M., Tomasino, D., & Bradley, R.T.",
            year: "2009",
            publisher: "Integral Review",
            url: "https://www.heartmath.org/research/research-library/",
            doi: nil,
            note: "Peer-reviewed. Establishes heart's electromagnetic field is detectable outside body and changes measurably with emotional state.",
            tags: ["peer-reviewed", "replicated"]
        ),

        CourseCitation(
            id: "garjajev_dna",
            type: .journal,
            title: "The Phantom DNA Effect and Biocomputer Model",
            author: "Garjajev, P. et al.",
            year: "1993–2002",
            publisher: "Institute of Control Sciences, Russian Academy of Sciences",
            url: nil,
            doi: nil,
            note: "Controversial. Research was conducted at legitimate institutions in Russia but has not been independently replicated in Western peer-reviewed journals. Treat as preliminary hypothesis, not established fact.",
            tags: ["contested", "preliminary"]
        ),

        CourseCitation(
            id: "epigenetics_lipton",
            type: .book,
            title: "The Biology of Belief",
            author: "Lipton, Bruce H., PhD",
            year: "2005",
            publisher: "Mountain of Love / Elite Books",
            url: "https://www.brucelipton.com/books/biology-of-belief/",
            doi: nil,
            note: "Former Stanford medical school faculty. His core epigenetics claims (environment affects gene expression) are mainstream science. Some of his further extrapolations are debated.",
            tags: ["mainstream-core", "extrapolations-contested"]
        ),

        // ── Module 3: Portals / Sacred Sites ────────────────────────
        CourseCitation(
            id: "dragon_project",
            type: .institution,
            title: "The Dragon Project: Measuring Anomalous Fields at Sacred Sites",
            author: "Devereux, Paul; Don, N.S.; Targ, R.",
            year: "1983–1994",
            publisher: "Oxford",
            url: "https://www.pauldevereux.co.uk",
            doi: nil,
            note: "11-year study with magnetometers at Stonehenge, Rollright Stones, and other UK sites. Published in peer-reviewed parapsychology journals. Findings show correlations; mechanisms remain debated.",
            tags: ["peer-reviewed", "contested-interpretation"]
        ),

        CourseCitation(
            id: "burke_sacred_geometry",
            type: .book,
            title: "Seed of Knowledge, Stone of Plenty",
            author: "Burke, John & Halberg, Kaj",
            year: "2005",
            publisher: "Council Oak Books",
            url: nil,
            doi: nil,
            note: "Documents electromagnetic measurements at prehistoric sites. Burke is an engineer, not an archaeologist — methodology is more rigorous than most popular treatment of this topic.",
            tags: ["field-research", "empirical"]
        ),

        CourseCitation(
            id: "welwood_bypassing",
            type: .journal,
            title: "Principles of Integral Psychotherapy (including 'spiritual bypassing' concept)",
            author: "Welwood, John",
            year: "1984",
            publisher: "Journal of Transpersonal Psychology",
            url: nil,
            doi: nil,
            note: "Coined 'spiritual bypassing.' Peer-reviewed transpersonal psychology journal. The concept is now widely accepted in clinical psychology.",
            tags: ["peer-reviewed", "clinical-psychology"]
        ),

        // ── Module 4: Entrainment / Solfeggio ───────────────────────
        CourseCitation(
            id: "huygens_entrainment",
            type: .journal,
            title: "Horologium Oscillatorium (On the pendulum clock)",
            author: "Huygens, Christiaan",
            year: "1673",
            publisher: "Paris",
            url: nil,
            doi: nil,
            note: "Original discovery of mechanical entrainment. Foundational physics — completely established.",
            tags: ["foundational", "established-physics"]
        ),

        CourseCitation(
            id: "528hz_rein",
            type: .peerReviewed,
            title: "Effect of Conscious Intention on Human DNA",
            author: "Rein, Glen & McCraty, R.",
            year: "1993",
            publisher: "Proc. of the Annual Conference of the Inst. for Psychotronics Research",
            url: nil,
            doi: nil,
            note: "Limited sample sizes. Published in conference proceedings, not major peer-reviewed journal. 528 Hz / DNA repair connection is suggestive, not definitively proven. More research needed.",
            tags: ["preliminary", "limited-sample", "needs-replication"]
        ),

        CourseCitation(
            id: "horowitz_528",
            type: .book,
            title: "The Book of 528: Prosperity Key of Love",
            author: "Horowitz, Leonard G.",
            year: "2011",
            publisher: "Tetrahedron Publishing",
            url: nil,
            doi: nil,
            note: "Popular book, not primary research. Horowitz is a controversial figure — some of his claims go well beyond the supporting evidence. The 528 Hz frequency itself has more credible research behind it than his broader claims.",
            tags: ["popular-book", "treat-critically"]
        ),

        CourseCitation(
            id: "jeannerod_mental_simulation",
            type: .peerReviewed,
            title: "Mental imagery in the motor context",
            author: "Jeannerod, Marc",
            year: "1995",
            publisher: "Neuropsychologia, 33(11)",
            url: nil,
            doi: "10.1016/0028-3932(95)00033-M",
            note: "Establishes that motor imagery activates largely the same neural circuits as actual movement. Foundational neuroscience, well-replicated.",
            tags: ["peer-reviewed", "replicated", "foundational"]
        ),

        // ── Module 5: Sacred Geometry / Vortex Math ─────────────────
        CourseCitation(
            id: "rodin_vortex",
            type: .furtherReading,
            title: "Vortex Based Mathematics",
            author: "Rodin, Marko",
            year: "2010",
            publisher: "Self-published / RodinAerodynamics.org",
            url: "https://rodinaerodynamics.org",
            doi: nil,
            note: "Independently developed mathematical system. Not published in peer-reviewed mathematics journals. Interesting patterns — treat as a mathematical curiosity and working model, not established physics.",
            tags: ["speculative", "not-peer-reviewed"]
        ),

        CourseCitation(
            id: "fibonacci_nature",
            type: .book,
            title: "The Divine Proportion: A Study in Mathematical Beauty",
            author: "Huntley, H.E.",
            year: "1970",
            publisher: "Dover Publications",
            url: nil,
            doi: nil,
            note: "Classic mathematical text on Fibonacci/Golden Ratio in nature. The natural patterns (sunflower spirals, nautilus, etc.) are documented fact. The interpretations vary.",
            tags: ["established-math", "patterns-documented"]
        ),

        CourseCitation(
            id: "saturn_hexagon",
            type: .institution,
            title: "Saturn's Hexagonal Storm at the North Pole",
            author: "NASA/JPL-Caltech / Cassini Mission",
            year: "2006–2017",
            publisher: "NASA",
            url: "https://www.nasa.gov/mission_pages/cassini/",
            doi: nil,
            note: "NASA-documented observation. The hexagonal polar vortex on Saturn is established scientific fact observed by the Cassini spacecraft.",
            tags: ["peer-reviewed", "established-science", "NASA"]
        ),

        // ── Module 7: Earthing / Grounding ──────────────────────────
        CourseCitation(
            id: "earthing_chevalier",
            type: .peerReviewed,
            title: "Earthing: Health Implications of Reconnecting the Human Body to the Earth's Surface Electrons",
            author: "Chevalier, G., Sinatra, S.T., Oschman, J.L., Sokal, K., & Sokal, P.",
            year: "2012",
            publisher: "Journal of Environmental and Public Health",
            url: "https://pubmed.ncbi.nlm.nih.gov/22291721/",
            doi: "10.1155/2012/291541",
            note: "Peer-reviewed. Open access. Systematic review of earthing research including inflammatory markers, cortisol, sleep, and blood viscosity. Well-designed studies, though field is still developing.",
            tags: ["peer-reviewed", "open-access", "replicated"]
        ),

        CourseCitation(
            id: "shinrin_yoku",
            type: .peerReviewed,
            title: "Effect of Forest Therapy on the Human Psycho-neuro-endocrino-immune Network",
            author: "Li, Q. et al.",
            year: "2010",
            publisher: "Environmental Health and Preventive Medicine",
            url: "https://pubmed.ncbi.nlm.nih.gov/19585099/",
            doi: "10.1007/s12199-010-0130-9",
            note: "Japanese research on forest bathing (Shinrin-yoku). Peer-reviewed. Shows measurable reductions in cortisol, NK cell activity increases. Field has extensive Japanese research backing.",
            tags: ["peer-reviewed", "replicated", "strong-evidence"]
        ),

        CourseCitation(
            id: "tsai_40hz_gamma",
            type: .peerReviewed,
            title: "Gamma frequency entrainment attenuates amyloid load and modifies microglia",
            author: "Iaccarino, H.F., Singer, A.C., Martorell, A.J., Rudenko, A., Gao, F., Gillingham, T.Z., & Tsai, L.",
            year: "2016",
            publisher: "Nature, 540(7632)",
            url: "https://pubmed.ncbi.nlm.nih.gov/27929004/",
            doi: "10.1038/nature20587",
            note: "High-impact peer-reviewed study in Nature. 40 Hz stimulation reduced Alzheimer's markers in mice. Currently in human clinical trials. Tsai Lab at MIT Picower Institute.",
            tags: ["peer-reviewed", "nature-journal", "in-clinical-trials"]
        ),

        // ── Module 8: Toning / Sound Healing ────────────────────────
        CourseCitation(
            id: "weitzberg_no",
            type: .peerReviewed,
            title: "Humming Greatly Increases Nasal Nitric Oxide",
            author: "Weitzberg, E. & Lundberg, J.O.",
            year: "2002",
            publisher: "American Journal of Respiratory and Critical Care Medicine, 166(2)",
            url: "https://pubmed.ncbi.nlm.nih.gov/12119221/",
            doi: "10.1164/rccm.200202-138BC",
            note: "Peer-reviewed. One of the most direct, cleanly replicated studies connecting toning/humming to measurable physiology. Nitric oxide is a vasodilator with antiviral and neurotransmitter roles.",
            tags: ["peer-reviewed", "replicated", "strong-evidence"]
        ),

        CourseCitation(
            id: "goldman_healing_sounds",
            type: .book,
            title: "Healing Sounds: The Power of Harmonics",
            author: "Goldman, Jonathan",
            year: "1992",
            publisher: "Inner Traditions",
            url: "https://www.healingsounds.com",
            doi: nil,
            note: "Well-researched popular book. Goldman has worked with scientists. Claims vary in evidential support — core acoustic claims are more defensible than some healing applications.",
            tags: ["popular-book", "some-research-base"]
        ),

        // ── Module 9: Collective Consciousness ──────────────────────
        CourseCitation(
            id: "maharishi_effect",
            type: .peerReviewed,
            title: "Effect of the Maharishi Technology of the Unified Field: Crime Rate Changes",
            author: "Dillbeck, M.C. & Rainforth, M.V.",
            year: "1996",
            publisher: "Journal of Crime and Justice",
            url: nil,
            doi: nil,
            note: "Peer-reviewed study documenting crime rate correlation with TM practice. Replicated across multiple cities. Critics question methodology and controlling for other variables. Findings are statistically significant but interpretation is debated.",
            tags: ["peer-reviewed", "replicated", "interpretation-debated"]
        ),

        CourseCitation(
            id: "global_consciousness",
            type: .institution,
            title: "Global Consciousness Project",
            author: "Nelson, R. (Princeton)",
            year: "1998–present",
            publisher: "Global Consciousness Project",
            url: "http://noosphere.princeton.edu",
            doi: nil,
            note: "Ongoing Princeton-based project. 27+ years of data. Statistical anomalies on RNG network during global events are documented. Mechanistic explanation remains unknown — correlation without established causation.",
            tags: ["ongoing-research", "princeton", "unexplained-correlation"]
        ),

        CourseCitation(
            id: "pear_lab",
            type: .institution,
            title: "Princeton Engineering Anomalies Research (PEAR) Laboratory",
            author: "Jahn, R.G. & Dunne, B.J.",
            year: "1979–2007",
            publisher: "Princeton University",
            url: "https://www.princeton.edu/~pear/",
            doi: nil,
            note: "28 years of peer-reviewed research at Princeton on human intention and random event generators. Results are small but statistically significant and survived peer review. Laboratory closed in 2007; data is public.",
            tags: ["peer-reviewed", "princeton", "small-effect-size"]
        ),

        // ── Further Reading ──────────────────────────────────────────
        CourseCitation(
            id: "further_oschman",
            type: .furtherReading,
            title: "Energy Medicine: The Scientific Basis",
            author: "Oschman, James L.",
            year: "2000",
            publisher: "Churchill Livingstone",
            url: nil,
            doi: nil,
            note: "Best-researched book connecting bioelectromagnetics to physiology. Oschman is a cell biologist. Balances established science with emerging research.",
            tags: ["further-reading", "scientific", "recommended"]
        ),

        CourseCitation(
            id: "further_mcdougall",
            type: .furtherReading,
            title: "The Brain That Changes Itself",
            author: "Doidge, Norman",
            year: "2007",
            publisher: "Penguin",
            url: nil,
            doi: nil,
            note: "Excellent mainstream neuroscience on neuroplasticity. Provides scientific grounding for the 'soul upgrade' concepts in concrete, peer-reviewed terms.",
            tags: ["further-reading", "mainstream-science", "recommended"]
        ),

        CourseCitation(
            id: "further_dispenza",
            type: .furtherReading,
            title: "Breaking the Habit of Being Yourself",
            author: "Dispenza, Joe",
            year: "2012",
            publisher: "Hay House",
            url: nil,
            doi: nil,
            note: "Bridges neuroscience and quantum field theory for personal transformation. More accessible than Oschman. Some claims are ahead of the evidence — read alongside more conservative sources.",
            tags: ["further-reading", "popular-science", "some-claims-ahead-of-evidence"]
        ),

        CourseCitation(
            id: "further_tesla_autobiography",
            type: .furtherReading,
            title: "My Inventions: The Autobiography of Nikola Tesla",
            author: "Tesla, Nikola",
            year: "1919 (originally published in Electrical Experimenter magazine)",
            publisher: "Hart Brothers (1982 reprint)",
            url: "https://gutenberg.org/ebooks/13562",
            doi: nil,
            note: "Free on Project Gutenberg. Tesla in his own words. Source for his documented obsessions, working methods, and philosophy. Essential primary source.",
            tags: ["primary-source", "free-access", "tesla-directly"]
        ),
    ]
}

// MARK: - Course Credits Modal (App-Wide Reusable)

struct CourseCreditsModal: View {
    let citations: [CourseCitation]
    @Environment(\.dismiss) var dismiss
    @State private var filter: CourseCitation.CitationType? = nil
    @State private var showFurtherOnly = false

    private var filtered: [CourseCitation] {
        if showFurtherOnly {
            return citations.filter { $0.type == .furtherReading }
        }
        if let f = filter { return citations.filter { $0.type == f } }
        return citations
    }

    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 0.02, green: 0.02, blue: 0.08).ignoresSafeArea()
                VStack(spacing: 0) {
                    filterBar
                    ScrollView(showsIndicators: false) {
                        VStack(alignment: .leading, spacing: 0) {
                            credibilityNote
                            VStack(spacing: 8) {
                                ForEach(filtered) { citation in
                                    CitationCard(citation: citation)
                                }
                            }.padding(.horizontal, 16).padding(.top, 4).padding(.bottom, 40)
                        }
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button { dismiss() } label: {
                        Image(systemName: "xmark").foregroundColor(.white)
                    }
                }
                ToolbarItem(placement: .principal) {
                    HStack(spacing: 6) {
                        Image(systemName: "books.vertical.fill").font(.system(size: 12))
                        Text("Sources & Credits").font(.system(size: 15, weight: .bold))
                    }.foregroundColor(.white)
                }
            }
        }
    }

    private var filterBar: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                filterChip("All", selected: filter == nil && !showFurtherOnly) {
                    filter = nil; showFurtherOnly = false
                }
                filterChip("📚 Further Reading", selected: showFurtherOnly) {
                    showFurtherOnly.toggle(); filter = nil
                }
                filterChip("🔬 Peer-Reviewed", selected: filter == .peerReviewed) {
                    filter = filter == .peerReviewed ? nil : .peerReviewed; showFurtherOnly = false
                }
                filterChip("📖 Books", selected: filter == .book) {
                    filter = filter == .book ? nil : .book; showFurtherOnly = false
                }
                filterChip("🏛 Institutions", selected: filter == .institution) {
                    filter = filter == .institution ? nil : .institution; showFurtherOnly = false
                }
            }
            .padding(.horizontal, 16).padding(.vertical, 10)
        }
        .background(Color.white.opacity(0.02))
    }

    private func filterChip(_ label: String, selected: Bool, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Text(label).font(.system(size: 10, weight: selected ? .black : .medium))
                .foregroundColor(selected ? .black : .white.opacity(0.5))
                .padding(.horizontal, 10).padding(.vertical, 6)
                .background(Capsule().fill(selected ? Color.white : Color.white.opacity(0.04)))
        }
    }

    private var credibilityNote: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("HOW TO USE THESE SOURCES").font(.system(size: 8, weight: .black)).tracking(2).foregroundColor(.white.opacity(0.3))
            Text("Sources are tagged by evidential quality. 🟢 Peer-reviewed/replicated = strongest evidence. 🟠 Contested/preliminary = treat as working hypothesis. Read the notes — they tell you exactly what to trust and what to question. Links open in your browser so you can verify everything directly.")
                .font(.system(size: 10)).foregroundColor(.white.opacity(0.45)).lineSpacing(3)
        }
        .padding(14)
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.02)))
        .padding(.horizontal, 16).padding(.top, 12).padding(.bottom, 8)
    }
}

struct CitationCard: View {
    let citation: CourseCitation

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(alignment: .top, spacing: 10) {
                Image(systemName: citation.icon).font(.system(size: 13)).foregroundColor(citation.tagColor.opacity(0.8))
                    .frame(width: 20)
                VStack(alignment: .leading, spacing: 3) {
                    Text(citation.title).font(.system(size: 11, weight: .bold)).foregroundColor(.white).lineSpacing(2)
                    Text(citation.author).font(.system(size: 9)).foregroundColor(.white.opacity(0.4))
                    if let year = citation.year, let pub = citation.publisher {
                        Text("\(year) · \(pub)").font(.system(size: 8)).foregroundColor(.white.opacity(0.25))
                    }
                }
            }

            // Tags
            HStack(spacing: 6) {
                ForEach(citation.tags.prefix(3), id: \.self) { tag in
                    Text(tag).font(.system(size: 7, weight: .bold)).tracking(0.3)
                        .foregroundColor(tagColor(tag).opacity(0.9))
                        .padding(.horizontal, 6).padding(.vertical, 3)
                        .background(Capsule().fill(tagColor(tag).opacity(0.1)))
                }
            }

            // Credibility note
            if let note = citation.note {
                Text(note).font(.system(size: 9)).foregroundColor(.white.opacity(0.4)).lineSpacing(2).italic()
            }

            // DOI / URL action
            if citation.url != nil || citation.doi != nil {
                HStack(spacing: 12) {
                    if let url = citation.url, let u = URL(string: url) {
                        Link(destination: u) {
                            HStack(spacing: 4) {
                                Image(systemName: "arrow.up.right.square").font(.system(size: 9))
                                Text("View Source").font(.system(size: 9, weight: .bold))
                            }.foregroundColor(.blue.opacity(0.7))
                        }
                    }
                    if let doi = citation.doi, let u = URL(string: "https://doi.org/\(doi)") {
                        Link(destination: u) {
                            HStack(spacing: 4) {
                                Image(systemName: "doc.text.magnifyingglass").font(.system(size: 9))
                                Text("DOI").font(.system(size: 9, weight: .bold))
                            }.foregroundColor(.green.opacity(0.7))
                        }
                    }
                    Spacer()
                }
            }
        }
        .padding(12)
        .background(RoundedRectangle(cornerRadius: 10)
            .fill(Color.white.opacity(0.008))
            .overlay(RoundedRectangle(cornerRadius: 10)
                .stroke(citation.tagColor.opacity(0.12), lineWidth: 1)))
    }

    private func tagColor(_ tag: String) -> Color {
        switch tag {
        case "peer-reviewed", "replicated", "foundational", "established-physics", "established-science", "strong-evidence": return .green
        case "contested", "speculative", "preliminary", "not-peer-reviewed", "treat-critically": return .orange
        case "further-reading", "recommended": return .blue
        default: return .white.opacity(0.3)
        }
    }
}

// MARK: - First-Time Citations Hint (One-shot onboarding)

struct CitationsFirstTimeHint: ViewModifier {
    @State private var showHint = false
    @State private var didDismiss = false
    private let storageKey = "aperture_citations_hint_shown_v1"

    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            if showHint && !didDismiss {
                citationsHintBubble
                    .transition(.opacity.combined(with: .scale(scale: 0.9, anchor: .bottomTrailing)))
                    .padding(.trailing, 16).padding(.bottom, 60)
            }
        }
        .onAppear {
            let shown = UserDefaults.standard.bool(forKey: storageKey)
            if !shown {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                    withAnimation(.spring(response: 0.4, dampingFraction: 0.7)) {
                        showHint = true
                    }
                    // Auto-dismiss after 4 seconds
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5.2) {
                        withAnimation { showHint = false }
                    }
                }
                UserDefaults.standard.set(true, forKey: storageKey)
            }
        }
    }

    private var citationsHintBubble: some View {
        HStack(spacing: 8) {
            Image(systemName: "books.vertical.fill").font(.system(size: 12)).foregroundColor(.yellow)
            VStack(alignment: .leading, spacing: 2) {
                Text("Sources & Citations").font(.system(size: 11, weight: .bold)).foregroundColor(.white)
                Text("Tap the books icon anytime to\nverify sources and dig deeper.")
                    .font(.system(size: 9)).foregroundColor(.white.opacity(0.5)).lineSpacing(2)
            }
            Button {
                withAnimation { showHint = false; didDismiss = true }
            } label: {
                Image(systemName: "xmark").font(.system(size: 9)).foregroundColor(.white.opacity(0.4))
            }
        }
        .padding(12)
        .background(RoundedRectangle(cornerRadius: 12)
            .fill(Color(red: 0.1, green: 0.1, blue: 0.2).opacity(0.95))
            .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.yellow.opacity(0.2), lineWidth: 1)))
        .shadow(color: .black.opacity(0.4), radius: 12, x: 0, y: 6)
    }
}

extension View {
    /// Shows a one-time tooltip pointing to the citations button.
    /// Apply to any view that has a citations button in its toolbar.
    func withCitationsHint() -> some View {
        modifier(CitationsFirstTimeHint())
    }
}
