// YouTubeDocumentariesView.swift
// AWAKENING DOCUMENTARIES - Searchable list with embedded videos and summaries

import SwiftUI
import WebKit

// MARK: - Documentary Data Model

struct Documentary: Identifiable {
  let id: String
  let title: String
  let creator: String
  let duration: String
  let youtubeID: String
  let thumbnailURL: String
  let category: DocCategory
  let summary: String
  let keyPoints: [String]
  let dateAdded: Date

  var youtubeURL: String {
    "https://www.youtube.com/watch?v=\(youtubeID)"
  }

  var embedURL: String {
    "https://www.youtube.com/embed/\(youtubeID)"
  }
}

enum DocCategory: String, CaseIterable {
  case consciousness = "Consciousness"
  case religion = "Religion Exposed"
  case history = "Hidden History"
  case science = "Suppressed Science"
  case finance = "Financial Systems"
  case health = "Health & Body"
  case spirituality = "Spirituality"
  case politics = "Politics Exposed"

  var icon: String {
    switch self {
    case .consciousness: return "brain.head.profile"
    case .religion: return "cross.fill"
    case .history: return "clock.fill"
    case .science: return "atom"
    case .finance: return "dollarsign.circle.fill"
    case .health: return "heart.fill"
    case .spirituality: return "sparkles"
    case .politics: return "building.columns.fill"
    }
  }

  var color: Color {
    switch self {
    case .consciousness: return Color(hex: "#9C27B0")
    case .religion: return Color(hex: "#8B0000")
    case .history: return Color(hex: "#FFD700")
    case .science: return Color(hex: "#00BCD4")
    case .finance: return Color(hex: "#4CAF50")
    case .health: return Color(hex: "#E91E63")
    case .spirituality: return Color(hex: "#7C5CFF")
    case .politics: return Color(hex: "#FF5722")
    }
  }
}

// MARK: - Documentary Database

struct DocumentaryDatabase {
  static let shared = DocumentaryDatabase()

  let documentaries: [Documentary] = [
    // ═══════════════════════════════════════════════════════════════
    // RELIGION & ASTROTHEOLOGY
    // ═══════════════════════════════════════════════════════════════

    Documentary(
      id: "sun_son_decoded",
      title: "The Sun/Son Decoded: Christianity as Solar Mythology",
      creator: "Solara",
      duration: "58:42",
      youtubeID: "SeVLf8dYWRo",
      thumbnailURL: "https://img.youtube.com/vi/SeVLf8dYWRo/maxresdefault.jpg",
      category: .religion,
      summary: """
        This documentary reveals the astrotheological foundations of Christianity, showing how the story of Jesus is a metaphorical encoding of the sun's annual journey through the zodiac.

        The Egyptians understood the sun as conscious energy that interfaces directly with human biology. They built temples aligned to capture dawn light for activation of the pineal gland - the "third eye" that every mystical tradition references.

        Key revelations:
        • December 25th (winter solstice): The sun "dies" for 3 days, then is "born again" - matching the Christ narrative
        • 12 disciples = 12 zodiac signs the sun passes through annually
        • Easter (spring equinox) = resurrection when light conquers darkness
        • The Eye of Horus is an anatomical diagram of the brain, with the pineal gland at center
        • "Let your eye be single and your body will be full of light" (Matthew 6:22) is instruction for pineal activation
        • The word "son" and "sun" being connected was intentional encoding

        The documentary explains the Precession of the Equinoxes - the 25,920-year cycle where Earth wobbles on its axis, creating astrological ages of ~2,160 years each. We are transitioning from Pisces (faith, following) to Aquarius (knowledge, direct experience).

        The Egyptian mystery schools taught sungazing protocols for consciousness expansion - practices that cost nothing and threaten every institution that profits from mediating your access to the divine.
        """,
      keyPoints: [
        "Jesus story = sun's annual journey encoded in metaphor",
        "December 25 is winter solstice, not historical birthday",
        "12 disciples = 12 zodiac signs",
        "Eye of Horus = brain anatomy with pineal gland at center",
        "Pisces → Aquarius age transition happening now",
        "Direct solar practices threaten institutional religion",
      ],
      dateAdded: Date()
    ),

    Documentary(
      id: "zeitgeist_religion",
      title: "Zeitgeist: The Greatest Story Ever Told",
      creator: "Peter Joseph",
      duration: "39:00",
      youtubeID: "pTbIu8Lv4Ws",
      thumbnailURL: "https://img.youtube.com/vi/pTbIu8Lv4Ws/maxresdefault.jpg",
      category: .religion,
      summary: """
        The first part of the groundbreaking Zeitgeist documentary examines the astronomical and mythological origins of major religions.

        The film presents evidence that the Jesus story follows the same pattern as earlier sun god myths:
        • Horus (Egypt), Mithra (Persia), Dionysus (Greece), Krishna (India) - all share virgin birth, 12 disciples, death and resurrection narratives
        • These are not historical coincidences but represent the same solar allegory told by different cultures

        The documentary traces how Christianity absorbed pagan sun worship while pretending to oppose it. Constantine's Council of Nicaea (325 CE) merged Christian and pagan practices for political unity.

        Key astronomical correspondences:
        • The three stars of Orion's belt ("Three Kings") align with Sirius to point to sunrise on December 25
        • The Southern Cross constellation relates to crucifixion symbolism
        • The "Age of Pisces" fish symbolism throughout early Christianity

        The film argues that religious institutions deliberately obscured these connections to maintain authority over populations who could otherwise access spiritual truth directly.
        """,
      keyPoints: [
        "Multiple pre-Christian gods share identical narratives",
        "Horus, Mithra, Dionysus, Krishna - same sun allegory",
        "Three Kings = Orion's belt pointing to December 25 sunrise",
        "Constantine merged Christian/pagan for political control",
        "Fish symbol = Age of Pisces",
        "Institutions hide astronomical origins to maintain control",
      ],
      dateAdded: Date()
    ),

    // ═══════════════════════════════════════════════════════════════
    // CONSCIOUSNESS & SPIRITUALITY
    // ═══════════════════════════════════════════════════════════════

    Documentary(
      id: "inner_worlds",
      title: "Inner Worlds, Outer Worlds",
      creator: "Daniel Schmidt",
      duration: "2:02:00",
      youtubeID: "aXuTt7c3Jkg",
      thumbnailURL: "https://img.youtube.com/vi/aXuTt7c3Jkg/maxresdefault.jpg",
      category: .consciousness,
      summary: """
        A stunning exploration of the vibratory nature of reality, this four-part documentary reveals the connection between ancient mysticism and modern physics.

        Part 1 - Akasha: The primordial field from which all matter emerges. Ancient cultures called it different names (Akasha, Qi, Prana, Logos) but described the same underlying unified field that modern physics now recognizes.

        Part 2 - The Spiral: Nature's fundamental pattern from galaxies to DNA to seashells. The Fibonacci sequence and golden ratio appear everywhere because they represent the mathematics of consciousness unfolding into form.

        Part 3 - The Serpent and the Lotus: The kundalini energy that rises through the chakras, documented in every ancient culture (India's kundalini, Egypt's uraeus serpent, Mesoamerica's feathered serpent). This is the same biological mechanism with different names.

        Part 4 - Beyond Thinking: The trap of identification with thought and the path to pure awareness. Meditation practices across all traditions point to the same recognition - you are not your thoughts; you are the awareness witnessing them.

        The film beautifully illustrates how every wisdom tradition discovered the same truths because they were investigating the same reality - human consciousness interfacing with the unified field.
        """,
      keyPoints: [
        "Akasha/Qi/Prana = unified field modern physics describes",
        "Fibonacci/golden ratio = mathematics of consciousness",
        "Kundalini = serpent energy in ALL ancient cultures",
        "Chakras appear worldwide because they're biological reality",
        "Meditation reveals: you are awareness, not thoughts",
        "All traditions discovered the same underlying truth",
      ],
      dateAdded: Date()
    ),

    Documentary(
      id: "dmt_spirit_molecule",
      title: "DMT: The Spirit Molecule",
      creator: "Mitch Schultz",
      duration: "1:14:00",
      youtubeID: "LtT6Xkk-kzk",
      thumbnailURL: "https://img.youtube.com/vi/LtT6Xkk-kzk/maxresdefault.jpg",
      category: .consciousness,
      summary: """
        Based on Dr. Rick Strassman's groundbreaking research, this documentary explores DMT (dimethyltryptamine) - the most powerful naturally occurring psychedelic, produced by your own pineal gland.

        Key findings from Strassman's DEA-approved studies:
        • DMT is produced naturally in the human brain
        • Pineal gland releases DMT during birth, death, and near-death experiences
        • Subjects consistently reported contact with "entities" and visits to other dimensions
        • Many described the experience as "more real than real"

        The implications:
        • Your brain has built-in hardware for accessing non-ordinary states
        • The pineal gland (third eye) is the biological interface
        • Ancient cultures knew this and developed practices to activate it
        • The "spirit world" may be as real as the physical world - accessed through specific brain chemistry

        The documentary features interviews with leading researchers, philosophers, and individuals who've experienced DMT. It raises profound questions about the nature of consciousness and reality.

        Why this matters for awakening: Understanding that mystical experiences have a biological basis doesn't diminish them - it reveals that humans are designed for expanded consciousness.
        """,
      keyPoints: [
        "DMT produced naturally by human pineal gland",
        "Released during birth, death, near-death experiences",
        "Subjects report experiences 'more real than real'",
        "Consistent contact with 'entities' across subjects",
        "Third eye/pineal gland is biological interface",
        "Humans have built-in hardware for expanded consciousness",
      ],
      dateAdded: Date()
    ),

    // ═══════════════════════════════════════════════════════════════
    // HIDDEN HISTORY
    // ═══════════════════════════════════════════════════════════════

    Documentary(
      id: "revelation_pyramids",
      title: "The Revelation of the Pyramids",
      creator: "Patrice Pooyard",
      duration: "1:46:00",
      youtubeID: "2fS9ixfQ_no",
      thumbnailURL: "https://img.youtube.com/vi/2fS9ixfQ_no/maxresdefault.jpg",
      category: .history,
      summary: """
        This documentary presents evidence that the Great Pyramid of Giza encodes advanced mathematical and geographical knowledge that supposedly "primitive" cultures shouldn't have possessed.

        Key revelations:
        • The Great Pyramid is aligned to true north with 3/60ths of a single degree accuracy
        • Modern construction with laser levels cannot consistently achieve this precision
        • The pyramid encodes the dimensions of Earth, the speed of light, and mathematical constants
        • Multiple ancient sites worldwide (Easter Island, Nazca, Angkor Wat, etc.) align on a single great circle around Earth

        The implications:
        • A lost advanced civilization predated known history
        • They had precise knowledge of Earth's dimensions thousands of years before "discovery"
        • The math encoded in these structures suggests intentional information preservation
        • Official history dramatically underestimates ancient human capability

        The documentary challenges the narrative that humans have progressed linearly from primitive to advanced, suggesting instead that advanced knowledge was lost and we are only now rediscovering it.
        """,
      keyPoints: [
        "Pyramid aligned to true north with impossible precision",
        "Encodes Earth's dimensions, speed of light, Pi",
        "Ancient sites worldwide align on single great circle",
        "Evidence of lost advanced civilization",
        "Official history underestimates ancient capability",
        "Advanced knowledge was lost, now being rediscovered",
      ],
      dateAdded: Date()
    ),

    Documentary(
      id: "out_of_shadows",
      title: "Out of Shadows",
      creator: "Mike Smith",
      duration: "1:17:00",
      youtubeID: "MY8Nfzcn1qQ",
      thumbnailURL: "https://img.youtube.com/vi/MY8Nfzcn1qQ/maxresdefault.jpg",
      category: .history,
      summary: """
        Created by a Hollywood stuntman, this documentary exposes how mainstream media and entertainment are used for propaganda and mind control.

        Key topics covered:
        • Operation Mockingbird: CIA program to control American media (documented, declassified)
        • MKUltra: CIA mind control experiments (documented, declassified)
        • How entertainment industry pushes specific narratives
        • The use of symbolism in media and music

        The film connects declassified government documents to current media practices, showing how psychological manipulation techniques developed in the mid-20th century continue to operate.

        Important context: While some claims in this documentary are well-documented (Operation Mockingbird, MKUltra), viewers should independently verify specific assertions and distinguish between documented facts and interpretations.

        Why it matters: Understanding that media is used as a tool of influence helps you recognize when you're being programmed rather than informed.
        """,
      keyPoints: [
        "Operation Mockingbird: documented CIA media control",
        "MKUltra: documented CIA mind control experiments",
        "Entertainment industry pushes controlled narratives",
        "Symbolism in media has specific purposes",
        "Declassified documents prove historical programs",
        "Awareness helps recognize programming",
      ],
      dateAdded: Date()
    ),

    // ═══════════════════════════════════════════════════════════════
    // FINANCIAL SYSTEMS
    // ═══════════════════════════════════════════════════════════════

    Documentary(
      id: "money_masters",
      title: "The Money Masters",
      creator: "Bill Still",
      duration: "3:35:00",
      youtubeID: "mDlnM481Gcg",
      thumbnailURL: "https://img.youtube.com/vi/mDlnM481Gcg/maxresdefault.jpg",
      category: .finance,
      summary: """
        A comprehensive history of central banking and how a small group of private bankers gained control of the money supply in most nations.

        Key historical events covered:
        • Bank of England (1694): First central bank, privately owned
        • First Bank of the United States (1791): Hamilton vs Jefferson debate
        • Andrew Jackson's "Bank War" against the Second Bank
        • The Federal Reserve Act (1913): How it passed during Christmas recess
        • The role of banking families (Rothschilds, Morgans, Warburgs)

        The core revelation:
        • Money is created as debt by private banks
        • Every dollar in existence is owed back to banks with interest
        • Interest requires more debt to be created (infinite growth required)
        • This system mathematically guarantees debt slavery

        The film argues that most wars are banker wars - conflicts engineered to create debt that enriches the banking class. It traces how governments that try to create their own money (Lincoln's Greenbacks, Kennedy's Treasury notes) face opposition.

        While nearly 4 hours long, this documentary provides essential understanding of how the financial matrix operates.
        """,
      keyPoints: [
        "Central banks are privately owned, not government institutions",
        "Money is created as debt - every dollar owed with interest",
        "System requires infinite growth on finite planet",
        "Major wars correlate with banking interests",
        "Leaders who oppose central banks face consequences",
        "Federal Reserve passed during Christmas recess (1913)",
      ],
      dateAdded: Date()
    ),

    Documentary(
      id: "money_mental_game",
      title: "The Mental Game of Money Poor People Don't Understand",
      creator: "Solara",
      duration: "25:41",
      youtubeID: "BaEGSXpe1w8",
      thumbnailURL: "https://img.youtube.com/vi/BaEGSXpe1w8/maxresdefault.jpg",
      category: .finance,
      summary: """
        This documentary exposes how two completely different systems of financial knowledge operate in the world - what gets taught to ordinary people versus what gets passed down in wealthy families.

        **The Programming:**
        Your parents taught you poverty thinking disguised as wisdom:
        • "Money doesn't grow on trees" - teaches scarcity mindset
        • "Get a good education and you'll be fine" - creates educated workers, not wealth builders
        • "Money isn't everything" - shuts down ambition that threatens their worldview

        These beliefs are passed down for generations, never questioned, never tested against reality. And if you question them, you're punished - because your success would mean their beliefs were wrong.

        **How Wealth Actually Works:**

        The Rothschilds didn't get wealthy by working hard - they created a private courier network faster than any government. They knew about Waterloo before the British government did. While everyone panicked and sold, they bought. Information asymmetry is how wealth is built.

        Poor people think: Money = payment for time (24-hour ceiling)
        Wealthy people think: Money = return on value creation (no ceiling)

        **The Psychological Traps:**
        • Loss aversion: Fear of losing $500 overwhelms excitement of winning $1,000
        • Being broke makes you risk-averse; being risk-averse keeps you broke
        • Your environment sets your reference point - if everyone around you is broke, making $50K feels rich

        **The System Explained:**
        • Insurance: Designed to collect premiums and deny claims - 20-30% goes to admin/profits, not healthcare
        • Inflation: Theft - new money goes to corporations first, reaches workers after prices rise (Cantillon Effect)
        • The system punishes savers and rewards debtors - wealthy people hold assets, not cash

        **The Real Rules:**
        Build leverage, control systems (don't work within them), develop information advantages, cultivate powerful relationships, take risks others fear. These aren't taught in school because an educated population is harder to control than an indoctrinated one.
        """,
      keyPoints: [
        "Two systems of knowledge: what poor learn vs what wealthy inherit",
        "Parents teach poverty thinking disguised as wisdom",
        "Rothschilds used information asymmetry, not hard work",
        "Time-for-money has ceiling; value creation has none",
        "Loss aversion keeps broke people broke",
        "Inflation is theft - Cantillon Effect benefits those who get money first",
        "System punishes savers, rewards debtors",
        "Your environment sets your financial reference point",
      ],
      dateAdded: Date()
    ),

    Documentary(
      id: "american_dream_1971",
      title: "The American Dream Died In 1971 And No One Told You",
      creator: "Prof. Jiang",
      duration: "14:34",
      youtubeID: "ZoztoRNB2Fw",
      thumbnailURL: "https://img.youtube.com/vi/ZoztoRNB2Fw/maxresdefault.jpg",
      category: .finance,
      summary: """
        Prof. Jiang delivers a devastating breakdown of what actually happened in 1971 - the year the American Dream was murdered. Using data from WTFhappenedin1971.com, he shows how every chart reveals the same pattern: something broke that year and was never fixed.

        **The Data:**
        Before 1971: Work hard, get ahead. That was the deal.
        After 1971: Productivity increased 60%, but wages only increased 16%.
        Where did the other 44% go? To executives, to the ownership class. The money didn't disappear - it was taken from you.

        **Two Events in August 1971:**

        **1. The Nixon Shock**
        Nixon took America off the gold standard. Before 1971, every dollar was backed by gold - the government couldn't just print money. After? Fiat currency. Print, print, print. A 1971 dollar is worth 14 cents today.

        Who benefits from inflation? Not workers. Asset owners - because asset prices rise with inflation. The Nixon Shock was a massive wealth transfer from workers to owners.

        **2. The Powell Memo**
        The same month, lawyer Lewis Powell wrote a confidential memo to the US Chamber of Commerce - a blueprint for corporations to take over American institutions: universities, media, courts, think tanks, government.

        Two months later? Nixon appointed Powell to the Supreme Court. Coincidence?

        **What Died:**
        • Single-income families (60% of households before → necessity of dual income after)
        • Affordable housing (2x median income → 8x median income)
        • Pensions (company responsibility → your 401k risk)
        • The social contract (work hard = get ahead)

        **Why You Don't Know This:**
        The people who broke the system control the narrative. They own the media, fund the universities, control the think tanks. They need you to blame yourself - because if you knew the system was rigged, you might fight back.

        The American Dream didn't fail. It was killed in 1971 with a memo and a policy change by people still in power. They never told you because they needed you to keep believing in a corpse.

        **Credit:** Prof. Jiang creates exceptional educational content exposing systemic truths. This analysis draws on WTFhappenedin1971.com data.
        """,
      keyPoints: [
        "Productivity up 60% since 1971, wages only up 16%",
        "Nixon Shock: Ended gold standard, enabled infinite money printing",
        "Powell Memo: Blueprint for corporate takeover of institutions",
        "Both events happened August 1971 - coordination, not coincidence",
        "Housing: 2x income (1971) → 8x income (today)",
        "1971 dollar worth only 14 cents today",
        "Single-income families became impossible",
        "System controllers own media/universities - suppress this history",
      ],
      dateAdded: Date()
    ),

    // ═══════════════════════════════════════════════════════════════
    // HEALTH & SUPPRESSED SCIENCE
    // ═══════════════════════════════════════════════════════════════

    Documentary(
      id: "resonance_beings_frequency",
      title: "Resonance: Beings of Frequency",
      creator: "James Russell",
      duration: "1:28:00",
      youtubeID: "pNok2Zvj7Y0",
      thumbnailURL: "https://img.youtube.com/vi/pNok2Zvj7Y0/maxresdefault.jpg",
      category: .health,
      summary: """
        This documentary explores the Schumann Resonance - Earth's natural electromagnetic frequency of 7.83 Hz - and how modern technology is disrupting our biological connection to it.

        Key scientific concepts:
        • Earth has a natural electromagnetic "heartbeat" (Schumann Resonance)
        • Human brainwaves (especially alpha waves) synchronize with this frequency
        • Every cell in your body responds to electromagnetic fields
        • We've bathed the planet in artificial EMF millions of times stronger than natural background

        The biological impact:
        • Circadian rhythm disruption from artificial light
        • Melatonin suppression (cancer risk, sleep disorders, mood issues)
        • Cell membrane disruption affecting nutrient transport
        • Possible link to modern epidemics of anxiety, depression, insomnia

        The evolutionary perspective: For millions of years, life evolved in tune with Earth's natural frequencies. In just 100 years, we've surrounded ourselves with frequencies our biology never adapted to.

        The documentary doesn't claim all EMF is dangerous, but argues we've dramatically underestimated the biological importance of natural electromagnetic environments.
        """,
      keyPoints: [
        "Earth has natural 7.83 Hz frequency (Schumann Resonance)",
        "Human brainwaves synchronize with Earth's frequency",
        "Artificial EMF millions of times stronger than natural",
        "Melatonin suppression links to cancer, depression, insomnia",
        "100 years of EMF vs millions of years of evolution",
        "Biology requires natural electromagnetic environment",
      ],
      dateAdded: Date()
    ),

    // ═══════════════════════════════════════════════════════════════
    // POLITICS EXPOSED
    // ═══════════════════════════════════════════════════════════════

    Documentary(
      id: "politicians_morons",
      title: "Why Politicians Are Mostly Morons: The Selection Process",
      creator: "Prof Jiang Xueqin",
      duration: "17:37",
      youtubeID: "E3-YjC5hOHk",
      thumbnailURL: "https://img.youtube.com/vi/E3-YjC5hOHk/maxresdefault.jpg",
      category: .politics,
      summary: """
        This documentary reveals a structural problem in democracies: the selection process that elevates politicians has nothing to do with competence and everything to do with entirely different qualities.

        **The Core Problem:**
        The skills required to WIN elections (fundraising, generating headlines, being telegenic, projecting confidence) have almost nothing to do with the skills required to GOVERN (understanding complex policy, managing bureaucracies, making decisions under uncertainty).

        **Case Studies:**

        **Pete Hegseth (Secretary of Defense):**
        • Never ran a large organization or made national security policy
        • Came from Fox & Friends Weekend - a morning TV show
        • Couldn't name a single ASEAN nation during confirmation
        • Shared classified military strike plans in an unsecured Signal chat
        • Accidentally included a journalist (The Atlantic's editor)
        • Now oversees 3.4 million employees and $850 billion budget

        **Robert F. Kennedy Jr. (HHS Secretary):**
        • Promoted debunked vaccine-autism link for decades
        • Over 40 studies with 5.6 million people found NO link
        • Refused to say vaccines don't cause autism during confirmation
        • Was confirmed anyway

        **Marjorie Taylor Greene:**
        • Promoted "Jewish space laser" wildfire conspiracy
        • Later introduced amendment to fund space lasers for border
        • Controversy IS her brand - generates attention and tribal loyalty
        • Remains in Congress with committee assignments

        **The Structural Mismatch:**
        • Voters select for likability, tribal affiliation, name recognition
        • They reward confidence over competence, simple answers over complicated truths
        • The person who knows nothing can promise anything
        • The person unburdened by expertise can offer confident simple answers
        • This is an advantage in campaigns and a DISASTER in governance

        **Why It Doesn't Change:**
        • System doesn't punish stupidity - it often rewards it
        • Tribe protects its own; base rallies around those attacked
        • The stupider the statement, the tighter in-group bonds become
        • Consequences are slow, blame is shifted

        **The Conclusion:**
        The morons are not an accident - they are a product. The system optimizes for political survival, not competence. Until voters reward expertise over entertainment, substance over sound bites, competence over charisma - the product will remain the same.
        """,
      keyPoints: [
        "Election skills ≠ governing skills - structural mismatch",
        "Selection process screens for charisma, not competence",
        "Case studies: Hegseth, RFK Jr., MTG - unqualified but selected",
        "Voters select for likability and tribal affiliation",
        "System rewards controversy - stupidity becomes brand",
        "Person who knows nothing can promise anything",
        "Morons are not accident - they're the product of the system",
        "System optimizes for political survival, not competence",
      ],
      dateAdded: Date()
    ),
  ]

  func search(query: String, category: DocCategory? = nil) -> [Documentary] {
    var results = documentaries

    if let category = category {
      results = results.filter { $0.category == category }
    }

    if !query.isEmpty {
      let lowercaseQuery = query.lowercased()
      results = results.filter {
        $0.title.lowercased().contains(lowercaseQuery)
          || $0.summary.lowercased().contains(lowercaseQuery)
          || $0.creator.lowercased().contains(lowercaseQuery)
          || $0.keyPoints.joined().lowercased().contains(lowercaseQuery)
      }
    }

    return results
  }
}

// MARK: - Main View

struct YouTubeDocumentariesView: View {
  @State private var searchText = ""
  @State private var selectedCategory: DocCategory?
  @State private var selectedDocumentary: Documentary?
  @Environment(\.dismiss) private var dismiss

  private let db = DocumentaryDatabase.shared

  var filteredDocs: [Documentary] {
    db.search(query: searchText, category: selectedCategory)
  }

  var body: some View {
    ZStack {
      // Background
      PaletteGradients.cosmicBackground.ignoresSafeArea()

      VStack(spacing: 0) {
        // Header
        headerSection

        // Search
        searchBar

        // Category Filter
        categoryFilter

        // Documentary List
        ScrollView(showsIndicators: false) {
          LazyVStack(spacing: 16) {
            ForEach(filteredDocs) { doc in
              DocumentaryCard(documentary: doc) {
                selectedDocumentary = doc
              }
            }

            if filteredDocs.isEmpty {
              emptyState
            }

            Spacer(minLength: 100)
          }
          .padding(.horizontal, 20)
          .padding(.top, 16)
        }
      }
    }
    .navigationBarTitleDisplayMode(.inline)
    .toolbar {
      ToolbarItem(placement: .navigationBarTrailing) {
        Text("\(filteredDocs.count) docs")
          .font(.system(size: 12, weight: .bold, design: .rounded))
          .foregroundColor(Palette.accent.gold)
      }
    }
    .sheet(item: $selectedDocumentary) { doc in
      DocumentaryDetailView(documentary: doc)
    }
  }

  // MARK: - Header

  private var headerSection: some View {
    VStack(spacing: 8) {
      HStack {
        VStack(alignment: .leading, spacing: 4) {
          Text("📺 DOCUMENTARIES")
            .font(.system(size: 12, weight: .bold, design: .rounded))
            .foregroundColor(Palette.accent.gold)
            .tracking(2)

          Text("Truth They Don't Show on TV")
            .font(.system(size: 20, weight: .black, design: .rounded))
            .foregroundColor(.white)
        }
        Spacer()
      }
    }
    .padding(.horizontal, 20)
    .padding(.top, 16)
    .padding(.bottom, 8)
  }

  // MARK: - Search Bar

  private var searchBar: some View {
    HStack(spacing: 12) {
      Image(systemName: "magnifyingglass")
        .font(.system(size: 16))
        .foregroundColor(Palette.text.muted)

      TextField("Search documentaries...", text: $searchText)
        .font(.system(size: 16, weight: .medium, design: .rounded))
        .foregroundColor(.white)

      if !searchText.isEmpty {
        Button(action: { searchText = "" }) {
          Image(systemName: "xmark.circle.fill")
            .foregroundColor(Palette.text.muted)
        }
      }
    }
    .padding(12)
    .background(
      RoundedRectangle(cornerRadius: 12)
        .fill(Color.white.opacity(0.08))
    )
    .padding(.horizontal, 20)
  }

  // MARK: - Category Filter

  private var categoryFilter: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack(spacing: 8) {
        DocCategoryChip(
          title: "All",
          icon: "square.grid.2x2",
          color: Palette.accent.gold,
          isSelected: selectedCategory == nil
        ) {
          selectedCategory = nil
        }

        ForEach(DocCategory.allCases, id: \.rawValue) { category in
          DocCategoryChip(
            title: category.rawValue,
            icon: category.icon,
            color: category.color,
            isSelected: selectedCategory == category
          ) {
            selectedCategory = selectedCategory == category ? nil : category
          }
        }
      }
      .padding(.horizontal, 20)
      .padding(.vertical, 12)
    }
  }

  // MARK: - Empty State

  private var emptyState: some View {
    VStack(spacing: 16) {
      Image(systemName: "magnifyingglass")
        .font(.system(size: 50))
        .foregroundColor(Palette.text.muted)

      Text("No documentaries found")
        .font(.system(size: 18, weight: .bold, design: .rounded))
        .foregroundColor(.white)

      Text("Try a different search or category")
        .font(.system(size: 14, weight: .medium))
        .foregroundColor(Palette.text.secondary)
    }
    .padding(.top, 60)
  }
}

// MARK: - Category Chip

struct DocCategoryChip: View {
  let title: String
  let icon: String
  let color: Color
  let isSelected: Bool
  let action: () -> Void

  var body: some View {
    Button(action: {
      HapticManager.shared.selectionChanged()
      action()
    }) {
      HStack(spacing: 6) {
        Image(systemName: icon)
          .font(.system(size: 12))
        Text(title)
          .font(.system(size: 12, weight: .bold, design: .rounded))
      }
      .foregroundColor(isSelected ? .black : color)
      .padding(.horizontal, 12)
      .padding(.vertical, 8)
      .background(
        Capsule()
          .fill(isSelected ? color : color.opacity(0.15))
      )
    }
  }
}

// MARK: - Documentary Card

struct DocumentaryCard: View {
  let documentary: Documentary
  let onTap: () -> Void

  var body: some View {
    Button(action: {
      HapticManager.shared.cardFlip()
      onTap()
    }) {
      VStack(alignment: .leading, spacing: 12) {
        // Thumbnail
        ZStack(alignment: .bottomTrailing) {
          AsyncImage(url: URL(string: documentary.thumbnailURL)) { image in
            image
              .resizable()
              .aspectRatio(16 / 9, contentMode: .fill)
          } placeholder: {
            Rectangle()
              .fill(Color.white.opacity(0.1))
              .aspectRatio(16 / 9, contentMode: .fill)
              .overlay(
                Image(systemName: "play.rectangle.fill")
                  .font(.system(size: 40))
                  .foregroundColor(Palette.text.muted)
              )
          }
          .frame(height: 180)
          .clipped()
          .cornerRadius(12)

          // Duration badge
          Text(documentary.duration)
            .font(.system(size: 11, weight: .bold, design: .rounded))
            .foregroundColor(.white)
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(Color.black.opacity(0.8))
            .cornerRadius(4)
            .padding(8)
        }

        // Info
        VStack(alignment: .leading, spacing: 8) {
          // Category
          HStack(spacing: 6) {
            Image(systemName: documentary.category.icon)
              .font(.system(size: 10))
            Text(documentary.category.rawValue.uppercased())
              .font(.system(size: 10, weight: .bold, design: .rounded))
              .tracking(1)
          }
          .foregroundColor(documentary.category.color)

          // Title
          Text(documentary.title)
            .font(.system(size: 16, weight: .bold, design: .rounded))
            .foregroundColor(.white)
            .lineLimit(2)
            .multilineTextAlignment(.leading)

          // Creator
          Text("by \(documentary.creator)")
            .font(.system(size: 12, weight: .medium))
            .foregroundColor(Palette.text.secondary)

          // Key points preview
          HStack(spacing: 4) {
            Image(systemName: "key.fill")
              .font(.system(size: 10))
            Text("\(documentary.keyPoints.count) key insights")
              .font(.system(size: 11, weight: .medium))
          }
          .foregroundColor(Palette.text.muted)
        }
        .padding(.horizontal, 4)
      }
      .padding(12)
      .background(
        RoundedRectangle(cornerRadius: 16)
          .fill(Color.white.opacity(0.05))
          .overlay(
            RoundedRectangle(cornerRadius: 16)
              .stroke(documentary.category.color.opacity(0.2), lineWidth: 1)
          )
      )
    }
    .buttonStyle(ScaleButtonStyle())
  }
}

// MARK: - Documentary Detail View

struct DocumentaryDetailView: View {
  let documentary: Documentary
  @Environment(\.dismiss) private var dismiss

  var body: some View {
    ZStack {
      PaletteGradients.cosmicBackground.ignoresSafeArea()

      ScrollView(showsIndicators: false) {
        VStack(alignment: .leading, spacing: 24) {
          // Embedded Video
          YouTubePlayerView(videoID: documentary.youtubeID)
            .frame(height: 220)
            .cornerRadius(16)

          // Title Section
          VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 6) {
              Image(systemName: documentary.category.icon)
                .font(.system(size: 12))
              Text(documentary.category.rawValue.uppercased())
                .font(.system(size: 11, weight: .bold, design: .rounded))
                .tracking(1)
            }
            .foregroundColor(documentary.category.color)

            Text(documentary.title)
              .font(.system(size: 22, weight: .black, design: .rounded))
              .foregroundColor(.white)

            HStack(spacing: 16) {
              Label(documentary.creator, systemImage: "person.fill")
              Label(documentary.duration, systemImage: "clock.fill")
            }
            .font(.system(size: 13, weight: .medium))
            .foregroundColor(Palette.text.secondary)
          }

          // Watch on YouTube Button
          Link(destination: URL(string: documentary.youtubeURL)!) {
            HStack {
              Image(systemName: "play.rectangle.fill")
              Text("Watch on YouTube")
            }
            .font(.system(size: 14, weight: .bold, design: .rounded))
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 14)
            .background(Color.red)
            .cornerRadius(12)
          }

          // Summary
          VStack(alignment: .leading, spacing: 12) {
            Text("📝 SUMMARY")
              .font(.system(size: 12, weight: .bold, design: .rounded))
              .foregroundColor(Palette.accent.gold)
              .tracking(2)

            Text(documentary.summary)
              .font(.system(size: 15, weight: .regular, design: .rounded))
              .foregroundColor(Palette.text.primary)
              .lineSpacing(6)
          }

          // Key Points
          VStack(alignment: .leading, spacing: 12) {
            Text("🔑 KEY INSIGHTS")
              .font(.system(size: 12, weight: .bold, design: .rounded))
              .foregroundColor(Palette.accent.gold)
              .tracking(2)

            ForEach(documentary.keyPoints, id: \.self) { point in
              HStack(alignment: .top, spacing: 12) {
                Circle()
                  .fill(documentary.category.color)
                  .frame(width: 6, height: 6)
                  .padding(.top, 6)

                Text(point)
                  .font(.system(size: 14, weight: .medium, design: .rounded))
                  .foregroundColor(Palette.text.secondary)
              }
            }
          }
          .padding(16)
          .background(
            RoundedRectangle(cornerRadius: 16)
              .fill(documentary.category.color.opacity(0.1))
          )

          Spacer(minLength: 50)
        }
        .padding(.horizontal, 20)
        .padding(.top, 20)
      }

      // Close button
      VStack {
        HStack {
          Spacer()
          Button(action: { dismiss() }) {
            Image(systemName: "xmark")
              .font(.system(size: 16, weight: .semibold))
              .foregroundColor(.white)
              .frame(width: 36, height: 36)
              .background(Color.black.opacity(0.5))
              .clipShape(Circle())
          }
          .padding(.trailing, 20)
          .padding(.top, 20)
        }
        Spacer()
      }
    }
  }
}

// MARK: - YouTube Player View

struct YouTubePlayerView: UIViewRepresentable {
  let videoID: String

  func makeUIView(context _: Context) -> WKWebView {
    let config = WKWebViewConfiguration()
    config.allowsInlineMediaPlayback = true
    config.mediaTypesRequiringUserActionForPlayback = []

    let webView = WKWebView(frame: .zero, configuration: config)
    webView.scrollView.isScrollEnabled = false
    webView.isOpaque = false
    webView.backgroundColor = .clear
    webView.scrollView.backgroundColor = .clear

    return webView
  }

  func updateUIView(_ webView: WKWebView, context _: Context) {
    let embedHTML = """
      <!DOCTYPE html>
      <html>
      <head>
          <meta name="viewport" content="width=device-width, initial-scale=1">
          <style>
              body { margin: 0; background: #000; }
              .container { position: relative; padding-bottom: 56.25%; height: 0; overflow: hidden; }
              .container iframe { position: absolute; top: 0; left: 0; width: 100%; height: 100%; border: 0; border-radius: 16px; }
          </style>
      </head>
      <body>
          <div class="container">
              <iframe src="https://www.youtube.com/embed/\(videoID)?playsinline=1&rel=0" allowfullscreen></iframe>
          </div>
      </body>
      </html>
      """

    webView.loadHTMLString(embedHTML, baseURL: nil)
  }
}
