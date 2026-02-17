// SignalVsNoiseView.swift
// SIGNAL vs NOISE — See Through The Static
// ☀️ SunFlow: Reignited
//
// "The news isn't broken — the noise IS the strategy."
// Layer 1: Noise Detector — Run any headline through the filter
// Layer 2: Signal Tracker — What actually matters right now
// Layer 3: Pattern Map — Connect the distraction to the action
//
// Scanner catches manipulation in products.
// Timeline catches manipulation in history.
// This catches manipulation in REAL TIME.

import SwiftUI

// MARK: - ═══════════════════════════════════════════════════

// DATA MODELS
// ═══════════════════════════════════════════════════════════

enum SignalSection: String, CaseIterable, Identifiable {
  case noiseDetector = "Noise Detector"
  case signalTracker = "Signal Tracker"
  case patternMap = "Pattern Map"
  case mediaLiteracy = "Media Literacy"
  case myFeed = "My Signal Feed"
  case history = "Scan History"

  var id: String {
    rawValue
  }

  var icon: String {
    switch self {
    case .noiseDetector: return "antenna.radiowaves.left.and.right"
    case .signalTracker: return "target"
    case .patternMap: return "point.3.connected.trianglepath.dotted"
    case .mediaLiteracy: return "book.closed.fill"
    case .myFeed: return "line.3.horizontal.decrease.circle.fill"
    case .history: return "clock.arrow.circlepath"
    }
  }

  var color: Color {
    switch self {
    case .noiseDetector: return Color(red: 1.0, green: 0.4, blue: 0.3)
    case .signalTracker: return Color(red: 0.3, green: 0.8, blue: 0.5)
    case .patternMap: return Color(red: 0.6, green: 0.4, blue: 1.0)
    case .mediaLiteracy: return Color(red: 0.4, green: 0.7, blue: 1.0)
    case .myFeed: return .cyan
    case .history: return .orange
    }
  }

  var subtitle: String {
    switch self {
    case .noiseDetector: return "Analyze any headline instantly"
    case .signalTracker: return "What actually matters right now"
    case .patternMap: return "See what the noise is hiding"
    case .mediaLiteracy: return "Level up your information armor"
    case .myFeed: return "Your curated signal feed"
    case .history: return "Past analyses & patterns"
    }
  }
}

// MARK: - Headline Analysis

struct HeadlineAnalysis: Identifiable, Codable {
  let id: String
  let headline: String
  let source: String
  let analyzedAt: Date
  let noiseScore: Int  // 0-100, higher = more noise
  let signalScore: Int  // 0-100, higher = more signal
  let tactics: [ManipulationTactic]
  let verdict: HeadlineVerdict
  let whyItMatters: String?
  let whatToWatchInstead: String?
  let emotionalTarget: String

  init(
    id: String = UUID().uuidString, headline: String, source: String = "",
    analyzedAt: Date = Date(), noiseScore: Int, signalScore: Int,
    tactics: [ManipulationTactic], verdict: HeadlineVerdict,
    whyItMatters: String? = nil, whatToWatchInstead: String? = nil,
    emotionalTarget: String = "outrage"
  ) {
    self.id = id
    self.headline = headline
    self.source = source
    self.analyzedAt = analyzedAt
    self.noiseScore = noiseScore
    self.signalScore = signalScore
    self.tactics = tactics
    self.verdict = verdict
    self.whyItMatters = whyItMatters
    self.whatToWatchInstead = whatToWatchInstead
    self.emotionalTarget = emotionalTarget
  }
}

enum HeadlineVerdict: String, Codable {
  case pureSignal = "Pure Signal"
  case mostlySignal = "Mostly Signal"
  case mixed = "Mixed"
  case mostlyNoise = "Mostly Noise"
  case pureNoise = "Pure Noise"
  case psyop = "Active Psyop"

  var color: Color {
    switch self {
    case .pureSignal: return .green
    case .mostlySignal: return Color(red: 0.5, green: 0.8, blue: 0.3)
    case .mixed: return .yellow
    case .mostlyNoise: return .orange
    case .pureNoise: return .red
    case .psyop: return Color(red: 0.8, green: 0.0, blue: 0.0)
    }
  }

  var icon: String {
    switch self {
    case .pureSignal: return "checkmark.shield.fill"
    case .mostlySignal: return "checkmark.circle.fill"
    case .mixed: return "exclamationmark.triangle.fill"
    case .mostlyNoise: return "speaker.wave.3.fill"
    case .pureNoise: return "speaker.slash.fill"
    case .psyop: return "eye.trianglebadge.exclamationmark.fill"
    }
  }
}

struct ManipulationTactic: Identifiable, Codable {
  let id: String
  let name: String
  let description: String
  let severity: Int  // 1-5

  init(id: String = UUID().uuidString, name: String, description: String, severity: Int) {
    self.id = id
    self.name = name
    self.description = description
    self.severity = severity
  }
}

// MARK: - Signal Item

struct SignalItem: Identifiable, Codable {
  let id: String
  let title: String
  let summary: String
  let category: SignalCategory
  let impactLevel: Int  // 1-5
  let whyItMatters: String
  let whileYouWereDistracted: String?
  let dateRelevant: Date

  init(
    id: String = UUID().uuidString, title: String, summary: String, category: SignalCategory,
    impactLevel: Int, whyItMatters: String, whileYouWereDistracted: String? = nil,
    dateRelevant: Date = Date()
  ) {
    self.id = id
    self.title = title
    self.summary = summary
    self.category = category
    self.impactLevel = impactLevel
    self.whyItMatters = whyItMatters
    self.whileYouWereDistracted = whileYouWereDistracted
    self.dateRelevant = dateRelevant
  }
}

enum SignalCategory: String, CaseIterable, Codable {
  case policy = "Policy & Law"
  case finance = "Money & Markets"
  case health = "Health & Science"
  case rights = "Rights & Freedom"
  case environment = "Environment"
  case tech = "Tech & Privacy"
  case global = "Global Moves"
  case food = "Food & Agriculture"

  var icon: String {
    switch self {
    case .policy: return "building.columns.fill"
    case .finance: return "dollarsign.circle.fill"
    case .health: return "cross.circle.fill"
    case .rights: return "hand.raised.fill"
    case .environment: return "leaf.fill"
    case .tech: return "lock.shield.fill"
    case .food: return "fork.knife"
    case .global: return "globe.americas.fill"
    }
  }

  var color: Color {
    switch self {
    case .policy: return .blue
    case .finance: return .green
    case .health: return .red
    case .rights: return .purple
    case .environment: return Color(red: 0.3, green: 0.7, blue: 0.4)
    case .tech: return .cyan
    case .global: return .orange
    case .food: return Color(red: 0.8, green: 0.6, blue: 0.2)
    }
  }
}

// MARK: - Pattern Map

struct DistractionPattern: Identifiable, Codable {
  let id: String
  let distraction: String
  let distractionType: String
  let coverageDuration: String
  let whileYouWatched: [String]
  let whoBenefited: String
  let lessonsLearned: String

  init(
    id: String = UUID().uuidString, distraction: String, distractionType: String,
    coverageDuration: String, whileYouWatched: [String], whoBenefited: String,
    lessonsLearned: String
  ) {
    self.id = id
    self.distraction = distraction
    self.distractionType = distractionType
    self.coverageDuration = coverageDuration
    self.whileYouWatched = whileYouWatched
    self.whoBenefited = whoBenefited
    self.lessonsLearned = lessonsLearned
  }
}

// MARK: - ═══════════════════════════════════════════════════

// NOISE ANALYSIS ENGINE
// ═══════════════════════════════════════════════════════════

final class NoiseDetectorEngine {
  static let shared = NoiseDetectorEngine()
  private init() {}

  // MARK: - Keyword Databases

  private let emotionalBaitWords: [String: Int] = [
    "slammed": 4, "destroyed": 4, "obliterated": 5, "eviscerated": 5,
    "shocking": 3, "outrage": 4, "furious": 4, "disgusting": 4,
    "unbelievable": 3, "heartbreaking": 3, "terrifying": 4,
    "bombshell": 4, "explosive": 4, "stunning": 3, "jaw-dropping": 3,
    "horrifying": 4, "sickening": 4, "infuriating": 4,
    "must see": 2, "you won't believe": 3, "will make you cry": 3,
    "breaking": 2, "urgent": 2, "developing": 1, "just in": 2,
    "ripped": 3, "blasted": 3, "owned": 3, "crushed": 3,
    "claps back": 3, "fires back": 3, "takes aim": 3, "goes off": 3,
    "epic": 2, "brutal": 3, "savage": 3, "insane": 2, "wild": 2,
  ]

  private let vagueSourceIndicators = [
    "sources say", "experts believe", "some people", "anonymous sources",
    "reportedly", "it is said", "many think", "insiders claim",
    "according to sources", "officials say", "studies show",
    "critics argue", "some worry", "observers note", "people are saying",
  ]

  private let divisionLanguage = [
    "us vs", "them vs", "the left", "the right", "liberals",
    "conservatives", "woke", "anti-woke", "culture war",
    "real americans", "the elite", "coastal elite", "flyover",
    "snowflake", "nazi", "communist", "socialist", "fascist",
    "those people", "the other side", "enemy within",
  ]

  private let scarcityTriggers = [
    "running out", "shortage", "limited", "last chance",
    "before it's too late", "while you still can", "act now",
    "ticking clock", "deadline", "window closing",
  ]

  private let spectacleIndicators = [
    "celebrity", "drama", "feud", "fight", "beef",
    "caught on camera", "went viral", "internet explodes",
    "twitter reacts", "fans are", "social media",
    "look at", "spotted", "rumored", "dating",
    "wardrobe malfunction", "red carpet", "leaked",
  ]

  private let signalIndicators: [String: Int] = [
    "policy": 3, "legislation": 4, "regulation": 4, "budget": 3,
    "trade deal": 4, "treaty": 4, "signed into law": 5,
    "executive order": 4, "amendment": 4, "ruling": 3,
    "scientific study": 3, "peer reviewed": 4, "data shows": 3,
    "investigation found": 3, "audit revealed": 4,
    "infrastructure": 3, "patent": 2, "FDA approved": 3,
    "supply chain": 3, "interest rate": 3, "inflation": 3,
    "surveillance": 4, "privacy": 3, "encryption": 3,
    "sanctions": 4, "tariff": 3, "subsidy": 3,
  ]

  // MARK: - Analysis

  func analyze(headline: String, source: String = "") -> HeadlineAnalysis {
    let lowered = headline.lowercased()
    let words = lowered.split(separator: " ")
    let wordCount = max(words.count, 1)

    // Score emotional bait
    var emotionScore = 0
    var detectedTactics: [ManipulationTactic] = []
    var emotionalTargets: [String] = []

    for (word, severity) in emotionalBaitWords {
      if lowered.contains(word) {
        emotionScore += severity
        if severity >= 3 {
          emotionalTargets.append(word)
        }
      }
    }

    if emotionScore > 0 {
      detectedTactics.append(
        ManipulationTactic(
          name: "Emotional Bait",
          description:
            "Uses loaded language to trigger emotional reaction before rational thought. Detected: \(emotionalTargets.prefix(3).joined(separator: ", "))",
          severity: min(emotionScore / 3, 5)
        ))
    }

    // Score vague sourcing
    var vagueScore = 0
    for pattern in vagueSourceIndicators {
      if lowered.contains(pattern) { vagueScore += 2 }
    }
    if vagueScore > 0 {
      detectedTactics.append(
        ManipulationTactic(
          name: "Vague Sourcing",
          description:
            "Claims authority without naming specific sources. Ask: WHO said this? Where's the data?",
          severity: min(vagueScore, 5)
        ))
    }

    // Score division language
    var divisionScore = 0
    for pattern in divisionLanguage {
      if lowered.contains(pattern) { divisionScore += 3 }
    }
    if divisionScore > 0 {
      detectedTactics.append(
        ManipulationTactic(
          name: "Division Programming",
          description:
            "Frames issue as us-vs-them to prevent nuanced thinking. Ask: who benefits from this division?",
          severity: min(divisionScore / 2, 5)
        ))
    }

    // Score scarcity
    var scarcityScore = 0
    for pattern in scarcityTriggers {
      if lowered.contains(pattern) { scarcityScore += 2 }
    }
    if scarcityScore > 0 {
      detectedTactics.append(
        ManipulationTactic(
          name: "Artificial Urgency",
          description:
            "Creates false scarcity or time pressure to bypass critical thinking. Real emergencies don't need clickbait.",
          severity: min(scarcityScore, 5)
        ))
    }

    // Score spectacle
    var spectacleScore = 0
    for pattern in spectacleIndicators {
      if lowered.contains(pattern) { spectacleScore += 2 }
    }
    if spectacleScore > 0 {
      detectedTactics.append(
        ManipulationTactic(
          name: "Spectacle Distraction",
          description:
            "Celebrity/drama content designed to consume attention that could go toward things that affect your life.",
          severity: min(spectacleScore / 2, 5)
        ))
    }

    // Score signal content
    var signalScore = 0
    for (word, weight) in signalIndicators {
      if lowered.contains(word) { signalScore += weight }
    }

    // Question marks in headlines (often opinon disguised as fact)
    let questionMarkCount = headline.filter { $0 == "?" }.count
    if questionMarkCount > 0 {
      detectedTactics.append(
        ManipulationTactic(
          name: "Betteridge's Law",
          description:
            "Headlines ending in a question mark can usually be answered 'No.' This format lets outlets publish speculation as news.",
          severity: 2
        ))
    }

    // ALL CAPS detection
    let capsWords = words.filter { $0.count > 2 && $0 == $0.uppercased() }
    if capsWords.count >= 2 {
      detectedTactics.append(
        ManipulationTactic(
          name: "CAPS LOCK SCREAMING",
          description:
            "All-caps words are visual shouting designed to trigger urgency. Actual breaking news doesn't need to yell.",
          severity: 3
        ))
    }

    // Calculate final scores
    let rawNoise =
      emotionScore + vagueScore + divisionScore + scarcityScore + spectacleScore
      + (questionMarkCount * 2) + (capsWords.count * 3)
    let rawSignal = signalScore

    let normalizedNoise = min(rawNoise * 5, 100)
    let normalizedSignal = min(max(rawSignal * 8, 100 - normalizedNoise), 100)

    // Determine verdict
    let verdict: HeadlineVerdict
    if normalizedNoise >= 80 && detectedTactics.count >= 3 {
      verdict = .psyop
    } else if normalizedNoise >= 70 {
      verdict = .pureNoise
    } else if normalizedNoise >= 50 {
      verdict = .mostlyNoise
    } else if normalizedSignal >= 70 {
      verdict = .pureSignal
    } else if normalizedSignal >= 50 {
      verdict = .mostlySignal
    } else {
      verdict = .mixed
    }

    // Determine emotional target
    let primaryEmotion: String
    if divisionScore > emotionScore {
      primaryEmotion = "tribal identity / anger"
    } else if scarcityScore > emotionScore {
      primaryEmotion = "fear / anxiety"
    } else if spectacleScore > emotionScore {
      primaryEmotion = "curiosity / gossip"
    } else if emotionScore > 5 {
      primaryEmotion = "outrage / moral panic"
    } else {
      primaryEmotion = "general attention"
    }

    // Generate what to watch instead
    let watchInstead: String?
    if normalizedNoise > 50 {
      watchInstead =
        "Instead of reacting to this headline, ask: What policy changes, financial moves, or regulatory decisions happened today that got zero coverage?"
    } else {
      watchInstead = nil
    }

    return HeadlineAnalysis(
      headline: headline, source: source,
      noiseScore: normalizedNoise, signalScore: normalizedSignal,
      tactics: detectedTactics, verdict: verdict,
      whyItMatters: normalizedSignal > 50
        ? "This contains actual information that could affect your life, finances, or rights."
        : nil,
      whatToWatchInstead: watchInstead,
      emotionalTarget: primaryEmotion
    )
  }

  // MARK: - Quick Filter Questions

  static let filterQuestions: [(question: String, explanation: String, icon: String)] = [
    (
      "Does this headline make me FEEL something immediately?",
      "If yes, that's by design. Real journalism informs first, provokes second. Manipulation provokes first because once you're emotional, your critical thinking shuts off. That's neuroscience, not opinion.",
      "heart.fill"
    ),
    (
      "Does this affect MY life directly, or is it spectacle?",
      "Ask: Will this change my rent, my health, my rights, or my family's safety? If no, it's entertainment disguised as news. Entertainment isn't bad — but knowing the difference is power.",
      "person.fill"
    ),
    (
      "Is this reporting a DECISION or a REACTION to a decision?",
      "Decisions change the world: laws passed, budgets signed, regulations changed. Reactions are content: 'Twitter explodes,' 'Celebrity slams,' 'Fans outraged.' One matters. One is noise.",
      "doc.text.fill"
    ),
    (
      "Who benefits from me being outraged about THIS right now?",
      "Follow the attention. If everyone is watching a celebrity feud, who's passing a bill? If everyone is debating a tweet, who's signing a trade deal? The noise isn't accidental — it's strategic.",
      "eye.fill"
    ),
    (
      "Is the source named and verifiable?",
      "'Sources say' means nothing. 'A 2024 study published in The Lancet found...' means everything. If you can't trace the claim to a name, institution, or dataset, it's vapor.",
      "checkmark.shield.fill"
    ),
  ]
}

// MARK: - ═══════════════════════════════════════════════════

// SIGNAL VS NOISE MANAGER
// ═══════════════════════════════════════════════════════════

@MainActor
class SignalNoiseManager: ObservableObject {
  static let shared = SignalNoiseManager()

  @Published var scanHistory: [HeadlineAnalysis] = []
  @Published var savedSignals: [SignalItem] = []
  @Published var totalScans: Int = 0
  @Published var noiseBlocked: Int = 0
  @Published var signalFound: Int = 0
  @Published var trackedCategories: Set<SignalCategory> = Set(SignalCategory.allCases)

  private let historyKey = "signal.noise.history"
  private let signalsKey = "signal.noise.saved"
  private let statsKey = "signal.noise.stats"

  init() {
    load()
  }

  func saveScan(_ analysis: HeadlineAnalysis) {
    scanHistory.insert(analysis, at: 0)
    if scanHistory.count > 100 { scanHistory = Array(scanHistory.prefix(100)) }
    totalScans += 1
    if analysis.noiseScore >= 60 { noiseBlocked += 1 }
    if analysis.signalScore >= 60 { signalFound += 1 }
    persist()
  }

  func saveSignal(_ signal: SignalItem) {
    savedSignals.insert(signal, at: 0)
    persistSignals()
  }

  var noisePercentage: Int {
    guard totalScans > 0 else { return 0 }
    return Int((Double(noiseBlocked) / Double(totalScans)) * 100)
  }

  private func load() {
    if let data = UserDefaults.standard.data(forKey: historyKey),
      let decoded = try? JSONDecoder().decode([HeadlineAnalysis].self, from: data)
    {
      scanHistory = decoded
    }
    if let data = UserDefaults.standard.data(forKey: signalsKey),
      let decoded = try? JSONDecoder().decode([SignalItem].self, from: data)
    {
      savedSignals = decoded
    }
    if let data = UserDefaults.standard.data(forKey: statsKey),
      let decoded = try? JSONDecoder().decode(SignalNoiseStats.self, from: data)
    {
      totalScans = decoded.totalScans
      noiseBlocked = decoded.noiseBlocked
      signalFound = decoded.signalFound
    }
  }

  private func persist() {
    if let data = try? JSONEncoder().encode(scanHistory) {
      UserDefaults.standard.set(data, forKey: historyKey)
    }
    let stats = SignalNoiseStats(
      totalScans: totalScans, noiseBlocked: noiseBlocked, signalFound: signalFound)
    if let data = try? JSONEncoder().encode(stats) {
      UserDefaults.standard.set(data, forKey: statsKey)
    }
  }

  private func persistSignals() {
    if let data = try? JSONEncoder().encode(savedSignals) {
      UserDefaults.standard.set(data, forKey: signalsKey)
    }
  }
}

private struct SignalNoiseStats: Codable {
  let totalScans: Int
  let noiseBlocked: Int
  let signalFound: Int
}

// MARK: - ═══════════════════════════════════════════════════

// CONTENT DATABASE
// ═══════════════════════════════════════════════════════════

enum SignalNoiseContentDatabase {
  // MARK: - Pattern Map (Historical Examples)

  static let patterns: [DistractionPattern] = [
    DistractionPattern(
      distraction: "Will Smith slaps Chris Rock at the Oscars",
      distractionType: "Celebrity Spectacle",
      coverageDuration: "72+ hours of wall-to-wall coverage across every major network",
      whileYouWatched: [
        "The STOCK Act enforcement report revealed Congress members trading stocks on insider knowledge with zero consequences",
        "The Federal Reserve continued its largest monetary policy shift in decades",
        "Multiple state legislatures passed voter restriction laws with minimal coverage",
      ],
      whoBenefited:
        "Every politician and corporation that needed public attention elsewhere. The slap consumed the entire national conversation for a week.",
      lessonsLearned:
        "Celebrity spectacle is the most reliable distraction tool because it triggers both tribal identity (picking sides) and emotional engagement (outrage/humor). No policy analysis can compete with two famous people in conflict."
    ),
    DistractionPattern(
      distraction: "Balloon over US airspace dominates news cycle",
      distractionType: "Manufactured Crisis / Geopolitical Theater",
      coverageDuration: "10+ days of continuous coverage, live tracking on every network",
      whileYouWatched: [
        "East Palestine, Ohio train derailment released toxic chemicals into air and water affecting thousands",
        "Multiple bills affecting digital privacy were advanced through committee",
        "Social Security funding discussions were held with minimal public awareness",
      ],
      whoBenefited:
        "Both governments used the incident for political posturing. Defense contractors saw stock increases. Meanwhile, residents in Ohio were literally being poisoned with vinyl chloride.",
      lessonsLearned:
        "When something becomes 24/7 coverage and it involves a foreign 'threat,' check what domestic story just got buried. The pattern is reliable: foreign spectacle hides domestic failure."
    ),
    DistractionPattern(
      distraction: "Daily tweet/social media outrage cycle",
      distractionType: "Perpetual Engagement Machine",
      coverageDuration: "Constant — each cycle lasts 4-8 hours before the next one replaces it",
      whileYouWatched: [
        "Algorithm changes at major platforms reduced reach for independent journalism by 30-60%",
        "Lobbying expenditures hit record highs with near-zero media coverage",
        "Corporate consolidation continued across healthcare, media, and food industries",
      ],
      whoBenefited:
        "Social media platforms (engagement = ad revenue). Politicians (outrage = donations). Media companies (clicks = survival). The outrage economy is a $200B+ industry.",
      lessonsLearned:
        "The outrage cycle isn't a bug — it's the product. Every second you spend angry about a tweet is a second you're not reading a policy document, attending a city council meeting, or organizing in your community."
    ),
    DistractionPattern(
      distraction: "Celebrity relationship drama / breakup coverage",
      distractionType: "Parasocial Distraction",
      coverageDuration: "Days to weeks of coverage, social media amplification",
      whileYouWatched: [
        "Pharmaceutical pricing negotiations happened behind closed doors",
        "Zoning laws were changed in multiple cities affecting housing affordability",
        "Trade agreements were renegotiated with implications for domestic jobs",
      ],
      whoBenefited:
        "Entertainment media (ad revenue), celebrities (relevance), and every institution that benefits from an uninformed public. Parasocial investment in celebrity lives is the modern bread and circuses.",
      lessonsLearned:
        "If you know more about a celebrity's relationship than your city council's voting record, the system is working exactly as designed. Your attention was stolen, not given."
    ),
    DistractionPattern(
      distraction: "Partisan 'culture war' debate of the week",
      distractionType: "Manufactured Division",
      coverageDuration: "5-14 days before replaced by next culture war topic",
      whileYouWatched: [
        "Bipartisan bills that actually affect your wallet passed with zero cable news coverage",
        "Corporate tax loopholes remained untouched while the public argued about social issues",
        "Military spending increased with virtually no public debate",
        "Water and infrastructure systems continued to deteriorate in multiple states",
      ],
      whoBenefited:
        "Both political parties benefit from culture wars because they keep voters emotionally engaged and tribally loyal without requiring either party to deliver material improvements. Corporations benefit because divided people don't organize against shared economic interests.",
      lessonsLearned:
        "Culture wars are cheaper than policy. It costs nothing to tweet about a social issue. It costs billions to fix infrastructure, healthcare, or education. Follow the money to find the motive."
    ),
  ]

  // MARK: - Signal Examples (What Actually Matters)

  static let exampleSignals: [SignalItem] = [
    SignalItem(
      title: "FDA's 'Closer to Zero' Heavy Metal Limits Are Voluntary",
      summary:
        "The FDA set action levels for lead in baby food at 10-20 ppb but made compliance voluntary, not mandatory. Health experts say this will only reduce exposure by 20-30%.",
      category: .food, impactLevel: 5,
      whyItMatters:
        "Your baby's food can legally contain lead and arsenic above levels other countries ban. Voluntary means no enforcement. No enforcement means no change.",
      whileYouWereDistracted: "This story got one news cycle while celebrity drama got 72 hours."
    ),
    SignalItem(
      title: "Algorithm Changes Reduce Independent News Reach",
      summary:
        "Major social platforms changed algorithms to favor entertainment and engagement content over news. Independent journalism pages saw 30-60% reach drops.",
      category: .tech, impactLevel: 4,
      whyItMatters:
        "The platforms that control how you see the world quietly made it harder to see real journalism. This isn't censorship — it's algorithmic burial, which is worse because it's invisible.",
      whileYouWereDistracted:
        "You probably noticed your feed getting 'lighter' but didn't know it was by design."
    ),
    SignalItem(
      title: "Corporate Consolidation in Healthcare Accelerates",
      summary:
        "Hospital systems continue merging, reducing competition. In many regions, one or two systems control all healthcare options, enabling price increases.",
      category: .health, impactLevel: 5,
      whyItMatters:
        "When one company owns every hospital in your area, they set the price. Your 'choice' of healthcare is an illusion. This affects your bills directly.",
      whileYouWereDistracted: nil
    ),
    SignalItem(
      title: "Digital Privacy Bills Advance Quietly",
      summary:
        "Multiple bills affecting how companies collect, store, and sell your personal data are moving through committee with minimal public awareness.",
      category: .tech, impactLevel: 4,
      whyItMatters:
        "These bills determine whether your location data, health data, browsing history, and biometric data can be sold. This is about your digital autonomy.",
      whileYouWereDistracted:
        "The tech lobby spent millions ensuring this didn't trend on social media."
    ),
    SignalItem(
      title: "Water Infrastructure Aging Across Major Cities",
      summary:
        "EPA reports indicate that water infrastructure in dozens of major cities is past its designed lifespan, with lead pipes still servicing millions of homes.",
      category: .environment, impactLevel: 5,
      whyItMatters:
        "Flint wasn't an anomaly — it was a preview. The water pipes in your city may be older than your grandparents. This is a slow-motion crisis that doesn't trend because it's not dramatic.",
      whileYouWereDistracted: nil
    ),
    SignalItem(
      title: "Lobbying Expenditures Hit Record Highs",
      summary:
        "Corporate lobbying spending reached new records. Top spenders include pharmaceutical, tech, and defense companies.",
      category: .policy, impactLevel: 4,
      whyItMatters:
        "For every dollar a corporation spends on lobbying, they see $200+ in return through favorable legislation. This is legal corruption and it determines more about your life than any election.",
      whileYouWereDistracted:
        "Lobbying spending reports don't go viral. Celebrity feuds do. That's the system working."
    ),
  ]

  // MARK: - Media Literacy Lessons

  static let mediaLessons: [(title: String, content: String, icon: String)] = [
    (
      "The Attention Economy",
      """
      Your attention is the most valuable resource on Earth. Every headline, notification, and \
      breaking news alert is competing for it. Social media companies, news networks, and content \
      creators all profit from your engagement — measured in seconds, clicks, and emotional reactions. \
      When you understand that your attention is the product being sold, you start spending it like \
      the currency it is. The question isn't 'what should I watch?' — it's 'who profits from me \
      watching THIS instead of THAT?'
      """, "eye.fill"
    ),

    (
      "Manufacturing Consent",
      """
      Noam Chomsky identified five filters through which news passes before reaching you: (1) Media \
      ownership — who owns the network determines what gets covered. (2) Advertising — sponsors don't \
      want controversial content near their ads. (3) Sourcing — journalists depend on official sources \
      who control the narrative. (4) Flak — organized attacks on stories that threaten power. (5) \
      Common enemy — uniting audiences against a shared threat (real or manufactured) to prevent \
      internal questioning. Every story you consume has passed through these filters. That doesn't \
      mean it's false — it means it's shaped.
      """, "funnel.fill"
    ),

    (
      "Outrage Is a Product",
      """
      Outrage generates 6x more engagement than any other emotion. Social media algorithms learned \
      this early and optimized for it. The result: your feed is engineered to make you angry, because \
      angry people scroll longer, share more, and click more ads. This isn't a conspiracy theory — \
      it's documented in internal documents from every major platform. When you feel outrage from a \
      headline, pause and ask: am I being informed, or am I being milked for engagement?
      """, "flame.fill"
    ),

    (
      "The 24-Hour Cycle vs Reality",
      """
      Nothing important happens every 24 hours. But cable news has 24 hours to fill. This creates a \
      structural incentive to manufacture urgency from non-events. A policy that takes 18 months to \
      implement gets 30 seconds of coverage. A celebrity tweet gets 48 hours. The mismatch between \
      what matters and what fills airtime is not accidental — it's the business model. Important \
      things are slow, complex, and boring. The news cycle rewards fast, simple, and dramatic.
      """, "clock.fill"
    ),

    (
      "The Firehose Strategy",
      """
      When everything is 'breaking news,' nothing is. This is deliberate. Flooding the information \
      space with constant stimulation creates a state of learned helplessness — 'there's too much, I \
      can't keep up, I'll just disengage.' That disengagement is the goal. An overwhelmed public \
      doesn't organize, doesn't question, and doesn't vote on policy. The firehose doesn't inform \
      you — it drowns you.
      """, "drop.triangle.fill"
    ),

    (
      "Following the Money",
      """
      Three questions that cut through 90% of media noise: (1) Who funded this story's source? \
      (2) Who advertises on this platform? (3) Who owns this media company? A pharmaceutical \
      company's ad revenue won't lead to critical drug pricing coverage. A defense contractor's \
      ownership won't lead to anti-war reporting. This isn't corruption — it's incentive structure. \
      And it shapes every story you see.
      """, "dollarsign.circle.fill"
    ),

    (
      "Your Local Signal",
      """
      The most important information for your daily life comes from local government, not national \
      news. Your city council determines your rent, your zoning, your police budget, your school \
      funding, and your water quality. Yet most people can name zero city council members but know \
      every detail of national drama. That's not an accident — national drama is designed to absorb \
      the attention that would otherwise go toward holding local power accountable.
      """, "map.fill"
    ),
  ]
}

// MARK: - ═══════════════════════════════════════════════════

// MAIN HUB VIEW
// ═══════════════════════════════════════════════════════════

struct SignalVsNoiseView: View {
  @Environment(\.dismiss) var dismiss
  @StateObject private var manager = SignalNoiseManager.shared
  @State private var selectedSection: SignalSection? = nil
  @State private var pulsePhase: CGFloat = 0

  var body: some View {
    NavigationStack {
      ZStack {
        signalBackground

        ScrollView(showsIndicators: false) {
          VStack(spacing: 24) {
            heroSection

            if manager.totalScans > 0 { statsCard }

            sectionGrid
            quickFilterPreview
            patternPreview

            Spacer(minLength: 120)
          }
          .padding(.horizontal, 20)
        }
      }
      .navigationTitle("")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarLeading) {
          Button {
            dismiss()
          } label: {
            Image(systemName: "chevron.left").font(.system(size: 16, weight: .semibold))
              .foregroundColor(.white)
          }
        }
        ToolbarItem(placement: .principal) {
          HStack(spacing: 6) {
            Image(systemName: "antenna.radiowaves.left.and.right").foregroundColor(.cyan)
            Text("Signal vs Noise").font(.system(size: 17, weight: .bold)).foregroundColor(.white)
          }
        }
      }
      .sheet(item: $selectedSection) { section in
        sectionDestination(section)
      }
    }
  }

  private var signalBackground: some View {
    LinearGradient(
      colors: [
        Color(red: 0.03, green: 0.05, blue: 0.10), Color(red: 0.05, green: 0.06, blue: 0.14),
        Color(red: 0.02, green: 0.03, blue: 0.08),
      ],
      startPoint: .top, endPoint: .bottom
    ).ignoresSafeArea()
      .overlay(
        Circle().fill(Color.cyan.opacity(0.03)).frame(width: 300).blur(radius: 60).offset(
          x: 80, y: -80)
      )
  }

  private var heroSection: some View {
    VStack(spacing: 12) {
      ZStack {
        Circle().fill(Color.cyan.opacity(0.08)).frame(width: 80, height: 80)
          .scaleEffect(1 + sin(pulsePhase) * 0.08)
        Image(systemName: "antenna.radiowaves.left.and.right")
          .font(.system(size: 34)).foregroundColor(.cyan)
      }
      .onAppear {
        withAnimation(.easeInOut(duration: 3).repeatForever(autoreverses: true)) {
          pulsePhase = .pi * 2
        }
      }

      Text("SEE THROUGH THE STATIC")
        .font(.system(size: 10, weight: .bold)).tracking(4)
        .foregroundColor(.cyan.opacity(0.4))

      Text("Signal vs Noise")
        .font(.system(size: 28, weight: .bold, design: .rounded))
        .foregroundColor(.white)

      Text("The noise isn't broken news.\nThe noise IS the strategy.")
        .font(.system(size: 13, weight: .medium))
        .foregroundColor(.white.opacity(0.5))
        .multilineTextAlignment(.center).lineSpacing(4)
    }
    .padding(.top, 10)
  }

  private var statsCard: some View {
    HStack(spacing: 0) {
      statPill("\(manager.totalScans)", "Scanned", .cyan)
      statPill("\(manager.noiseBlocked)", "Noise Caught", .red)
      statPill("\(manager.signalFound)", "Signal Found", .green)
      statPill("\(manager.noisePercentage)%", "Noise Rate", .orange)
    }
    .padding(12)
    .background(
      RoundedRectangle(cornerRadius: 14).fill(Color.cyan.opacity(0.04))
        .overlay(RoundedRectangle(cornerRadius: 14).stroke(Color.cyan.opacity(0.1), lineWidth: 1)))
  }

  private func statPill(_ value: String, _ label: String, _ color: Color) -> some View {
    VStack(spacing: 2) {
      Text(value).font(.system(size: 16, weight: .bold)).foregroundColor(color)
      Text(label).font(.system(size: 8, weight: .medium)).foregroundColor(.white.opacity(0.3))
    }
    .frame(maxWidth: .infinity)
  }

  private var sectionGrid: some View {
    VStack(spacing: 8) {
      HStack {
        Text("MODULES").font(.system(size: 10, weight: .bold)).tracking(2).foregroundColor(
          .white.opacity(0.3))
        Spacer()
      }
      LazyVGrid(
        columns: [GridItem(.flexible(), spacing: 10), GridItem(.flexible(), spacing: 10)],
        spacing: 10
      ) {
        ForEach(SignalSection.allCases) { section in
          Button {
            selectedSection = section
          } label: {
            HStack(spacing: 10) {
              Image(systemName: section.icon).font(.system(size: 18)).foregroundColor(section.color)
                .frame(width: 28)
              VStack(alignment: .leading, spacing: 2) {
                Text(section.rawValue).font(.system(size: 12, weight: .bold)).foregroundColor(
                  .white)
                Text(section.subtitle).font(.system(size: 9)).foregroundColor(.white.opacity(0.4))
              }
              Spacer()
            }
            .padding(12)
            .background(
              RoundedRectangle(cornerRadius: 12).fill(section.color.opacity(0.06))
                .overlay(
                  RoundedRectangle(cornerRadius: 12).stroke(
                    section.color.opacity(0.12), lineWidth: 1)))
          }
        }
      }
    }
  }

  private var quickFilterPreview: some View {
    VStack(alignment: .leading, spacing: 12) {
      HStack(spacing: 6) {
        Image(systemName: "shield.lefthalf.filled").foregroundColor(
          Color(red: 1.0, green: 0.4, blue: 0.3))
        Text("THE 4 FILTER QUESTIONS").font(.system(size: 10, weight: .bold)).tracking(2)
          .foregroundColor(Color(red: 1.0, green: 0.4, blue: 0.3).opacity(0.7))
        Spacer()
      }
      Text("Run any headline through these before reacting:")
        .font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.5))

      ForEach(Array(NoiseDetectorEngine.filterQuestions.prefix(4).enumerated()), id: \.offset) {
        i, q in
        HStack(alignment: .top, spacing: 10) {
          Text("\(i + 1)").font(.system(size: 12, weight: .bold))
            .foregroundColor(.black).frame(width: 22, height: 22)
            .background(Circle().fill(Color(red: 1.0, green: 0.4, blue: 0.3)))
          Text(q.question).font(.system(size: 12, weight: .medium)).foregroundColor(
            .white.opacity(0.7)
          ).lineSpacing(2)
        }
      }

      Button {
        selectedSection = .noiseDetector
      } label: {
        Text("Try the Noise Detector →").font(.system(size: 12, weight: .bold))
          .foregroundColor(.cyan)
      }
    }
    .padding(16)
    .background(
      RoundedRectangle(cornerRadius: 16).fill(Color(red: 1.0, green: 0.4, blue: 0.3).opacity(0.04))
        .overlay(
          RoundedRectangle(cornerRadius: 16).stroke(
            Color(red: 1.0, green: 0.4, blue: 0.3).opacity(0.12), lineWidth: 1)))
  }

  private var patternPreview: some View {
    VStack(alignment: .leading, spacing: 10) {
      HStack(spacing: 6) {
        Image(systemName: "point.3.connected.trianglepath.dotted").foregroundColor(.purple)
        Text("PATTERN MAP PREVIEW").font(.system(size: 10, weight: .bold)).tracking(2)
          .foregroundColor(.purple.opacity(0.6))
        Spacer()
      }
      let p = SignalNoiseContentDatabase.patterns[0]
      VStack(alignment: .leading, spacing: 6) {
        Text("DISTRACTION").font(.system(size: 8, weight: .bold)).tracking(1).foregroundColor(
          .red.opacity(0.5))
        Text(p.distraction).font(.system(size: 13, weight: .semibold)).foregroundColor(.white)
        Text(p.coverageDuration).font(.system(size: 10)).foregroundColor(.white.opacity(0.3))
        Text("WHILE YOU WATCHED").font(.system(size: 8, weight: .bold)).tracking(1).foregroundColor(
          .green.opacity(0.5)
        ).padding(.top, 4)
        Text(p.whileYouWatched[0]).font(.system(size: 11, weight: .medium)).foregroundColor(
          .green.opacity(0.7)
        ).lineLimit(2)
        Text("+ \(p.whileYouWatched.count - 1) more...").font(.system(size: 10, weight: .medium))
          .foregroundColor(.white.opacity(0.3))
      }
      Button {
        selectedSection = .patternMap
      } label: {
        Text("See All Patterns →").font(.system(size: 12, weight: .bold)).foregroundColor(.purple)
      }
    }
    .padding(16)
    .background(
      RoundedRectangle(cornerRadius: 16).fill(Color.purple.opacity(0.04))
        .overlay(
          RoundedRectangle(cornerRadius: 16).stroke(Color.purple.opacity(0.12), lineWidth: 1)))
  }

  @ViewBuilder
  private func sectionDestination(_ section: SignalSection) -> some View {
    switch section {
    case .noiseDetector: NoiseDetectorView(manager: manager)
    case .signalTracker: SignalTrackerView(manager: manager)
    case .patternMap: PatternMapView()
    case .mediaLiteracy: MediaLiteracyView()
    case .myFeed: SignalFeedView(manager: manager)
    case .history: ScanHistoryView(manager: manager)
    }
  }
}

// MARK: - ═══════════════════════════════════════════════════

// NOISE DETECTOR VIEW (Layer 1)
// ═══════════════════════════════════════════════════════════

struct NoiseDetectorView: View {
  @Environment(\.dismiss) var dismiss
  @ObservedObject var manager: SignalNoiseManager
  @State private var headlineInput = ""
  @State private var sourceInput = ""
  @State private var analysis: HeadlineAnalysis? = nil
  @State private var showFilterGuide = false

  private let engine = NoiseDetectorEngine.shared

  var body: some View {
    NavigationStack {
      ZStack {
        Color(red: 0.03, green: 0.03, blue: 0.08).ignoresSafeArea()

        ScrollView(showsIndicators: false) {
          VStack(spacing: 20) {
            // Input
            VStack(alignment: .leading, spacing: 8) {
              Text("Paste or type any headline:").font(.system(size: 12, weight: .bold))
                .foregroundColor(.white.opacity(0.5))
              TextEditor(text: $headlineInput)
                .frame(minHeight: 80).scrollContentBackground(.hidden)
                .font(.system(size: 15)).foregroundColor(.white)
                .padding(12).background(
                  RoundedRectangle(cornerRadius: 12).fill(Color.white.opacity(0.06)))

              TextField("Source (optional)", text: $sourceInput)
                .font(.system(size: 13)).foregroundColor(.white).padding(10)
                .background(RoundedRectangle(cornerRadius: 8).fill(Color.white.opacity(0.04)))

              Button {
                let trimmed = headlineInput.trimmingCharacters(in: .whitespacesAndNewlines)
                guard !trimmed.isEmpty else { return }
                let result = engine.analyze(headline: trimmed, source: sourceInput)
                analysis = result
                manager.saveScan(result)
              } label: {
                HStack(spacing: 8) {
                  Image(systemName: "antenna.radiowaves.left.and.right")
                  Text("SCAN FOR NOISE")
                    .font(.system(size: 14, weight: .bold))
                }
                .foregroundColor(.black).frame(maxWidth: .infinity).padding(.vertical, 12)
                .background(Capsule().fill(Color.cyan))
              }
            }

            // Results
            if let a = analysis {
              analysisCard(a)
            }

            // Filter Guide
            Button {
              showFilterGuide.toggle()
            } label: {
              HStack(spacing: 6) {
                Image(systemName: "questionmark.circle.fill")
                Text("The 5 Filter Questions")
                  .font(.system(size: 13, weight: .medium))
              }.foregroundColor(.white.opacity(0.4))
            }

            if showFilterGuide {
              filterGuide
            }

            Spacer(minLength: 40)
          }
          .padding(20)
        }
      }
      .navigationTitle("Noise Detector")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button {
            dismiss()
          } label: {
            Image(systemName: "xmark.circle.fill").foregroundColor(.white.opacity(0.3))
          }
        }
      }
    }
  }

  private func analysisCard(_ a: HeadlineAnalysis) -> some View {
    VStack(alignment: .leading, spacing: 14) {
      // Verdict
      HStack(spacing: 10) {
        Image(systemName: a.verdict.icon).font(.system(size: 24)).foregroundColor(a.verdict.color)
        VStack(alignment: .leading, spacing: 2) {
          Text(a.verdict.rawValue).font(.system(size: 16, weight: .bold)).foregroundColor(
            a.verdict.color)
          Text("Targeting: \(a.emotionalTarget)").font(.system(size: 10, weight: .medium))
            .foregroundColor(.white.opacity(0.4))
        }
        Spacer()
      }

      // Score bars
      HStack(spacing: 16) {
        VStack(alignment: .leading, spacing: 4) {
          HStack(spacing: 4) {
            Text("NOISE").font(.system(size: 9, weight: .bold)).tracking(1).foregroundColor(.red)
            Spacer()
            Text("\(a.noiseScore)%").font(.system(size: 11, weight: .bold)).foregroundColor(.red)
          }
          ProgressView(value: Double(a.noiseScore), total: 100)
            .progressViewStyle(LinearProgressViewStyle(tint: .red))
        }
        VStack(alignment: .leading, spacing: 4) {
          HStack(spacing: 4) {
            Text("SIGNAL").font(.system(size: 9, weight: .bold)).tracking(1).foregroundColor(.green)
            Spacer()
            Text("\(a.signalScore)%").font(.system(size: 11, weight: .bold)).foregroundColor(.green)
          }
          ProgressView(value: Double(a.signalScore), total: 100)
            .progressViewStyle(LinearProgressViewStyle(tint: .green))
        }
      }

      // Tactics detected
      if !a.tactics.isEmpty {
        VStack(alignment: .leading, spacing: 8) {
          Text("MANIPULATION TACTICS DETECTED").font(.system(size: 9, weight: .bold)).tracking(1)
            .foregroundColor(.orange.opacity(0.6))
          ForEach(a.tactics) { tactic in
            VStack(alignment: .leading, spacing: 4) {
              HStack(spacing: 6) {
                HStack(spacing: 2) {
                  ForEach(0..<tactic.severity, id: \.self) { _ in
                    Image(systemName: "exclamationmark.triangle.fill").font(.system(size: 8))
                      .foregroundColor(.orange)
                  }
                }
                Text(tactic.name).font(.system(size: 12, weight: .bold)).foregroundColor(.white)
              }
              Text(tactic.description).font(.system(size: 11, weight: .regular)).foregroundColor(
                .white.opacity(0.6)
              ).lineSpacing(2)
            }
            .padding(10).background(
              RoundedRectangle(cornerRadius: 8).fill(Color.orange.opacity(0.04)))
          }
        }
      }

      // What to watch instead
      if let watch = a.whatToWatchInstead {
        VStack(alignment: .leading, spacing: 4) {
          Text("REDIRECT YOUR ATTENTION").font(.system(size: 9, weight: .bold)).tracking(1)
            .foregroundColor(.cyan.opacity(0.6))
          Text(watch).font(.system(size: 12, weight: .medium)).foregroundColor(.cyan.opacity(0.8))
            .lineSpacing(3)
        }
        .padding(10).background(RoundedRectangle(cornerRadius: 8).fill(Color.cyan.opacity(0.04)))
      }

      // Why it matters
      if let why = a.whyItMatters {
        VStack(alignment: .leading, spacing: 4) {
          Text("WHY THIS MATTERS").font(.system(size: 9, weight: .bold)).tracking(1)
            .foregroundColor(.green.opacity(0.6))
          Text(why).font(.system(size: 12, weight: .medium)).foregroundColor(.green.opacity(0.8))
            .lineSpacing(3)
        }
        .padding(10).background(RoundedRectangle(cornerRadius: 8).fill(Color.green.opacity(0.04)))
      }
    }
    .padding(16)
    .background(
      RoundedRectangle(cornerRadius: 16).fill(Color.white.opacity(0.03))
        .overlay(
          RoundedRectangle(cornerRadius: 16).stroke(a.verdict.color.opacity(0.2), lineWidth: 1)))
  }

  private var filterGuide: some View {
    VStack(alignment: .leading, spacing: 12) {
      ForEach(Array(NoiseDetectorEngine.filterQuestions.enumerated()), id: \.offset) { _, q in
        VStack(alignment: .leading, spacing: 6) {
          HStack(spacing: 6) {
            Image(systemName: q.icon).font(.system(size: 14)).foregroundColor(.cyan)
            Text(q.question).font(.system(size: 13, weight: .bold)).foregroundColor(.white)
          }
          Text(q.explanation).font(.system(size: 11, weight: .regular)).foregroundColor(
            .white.opacity(0.5)
          ).lineSpacing(3)
        }
        .padding(12).background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.03)))
      }
    }
  }
}

// MARK: - ═══════════════════════════════════════════════════

// SIGNAL TRACKER VIEW (Layer 2)
// ═══════════════════════════════════════════════════════════

struct SignalTrackerView: View {
  @Environment(\.dismiss) var dismiss
  @ObservedObject var manager: SignalNoiseManager
  @State private var selectedCategory: SignalCategory? = nil

  private let signals = SignalNoiseContentDatabase.exampleSignals

  var body: some View {
    NavigationStack {
      ZStack {
        Color(red: 0.03, green: 0.03, blue: 0.08).ignoresSafeArea()

        ScrollView(showsIndicators: false) {
          VStack(spacing: 16) {
            Text(
              "What's actually happening while the noise machine runs.\nThese are the stories that affect your life."
            )
            .font(.system(size: 13, weight: .medium)).foregroundColor(.white.opacity(0.5))
            .multilineTextAlignment(.center).lineSpacing(3)

            // Category filter
            ScrollView(.horizontal, showsIndicators: false) {
              HStack(spacing: 8) {
                Button {
                  selectedCategory = nil
                } label: {
                  Text("All").font(.system(size: 11, weight: .medium))
                    .foregroundColor(selectedCategory == nil ? .white : .white.opacity(0.4))
                    .padding(.horizontal, 12).padding(.vertical, 6)
                    .background(
                      Capsule().fill(
                        selectedCategory == nil
                          ? Color.cyan.opacity(0.3) : Color.white.opacity(0.04)))
                }
                ForEach(SignalCategory.allCases, id: \.self) { cat in
                  Button {
                    selectedCategory = cat
                  } label: {
                    HStack(spacing: 4) {
                      Image(systemName: cat.icon).font(.system(size: 10))
                      Text(cat.rawValue).font(.system(size: 10, weight: .medium))
                    }
                    .foregroundColor(selectedCategory == cat ? .white : .white.opacity(0.4))
                    .padding(.horizontal, 10).padding(.vertical, 6)
                    .background(
                      Capsule().fill(
                        selectedCategory == cat ? cat.color.opacity(0.3) : Color.white.opacity(0.04)
                      ))
                  }
                }
              }
            }

            let filtered =
              selectedCategory == nil ? signals : signals.filter { $0.category == selectedCategory }

            ForEach(filtered) { signal in
              signalCard(signal)
            }

            Spacer(minLength: 40)
          }
          .padding(20)
        }
      }
      .navigationTitle("Signal Tracker")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button {
            dismiss()
          } label: {
            Image(systemName: "xmark.circle.fill").foregroundColor(.white.opacity(0.3))
          }
        }
      }
    }
  }

  private func signalCard(_ signal: SignalItem) -> some View {
    VStack(alignment: .leading, spacing: 10) {
      HStack(spacing: 8) {
        Image(systemName: signal.category.icon).font(.system(size: 14)).foregroundColor(
          signal.category.color)
        Text(signal.category.rawValue).font(.system(size: 10, weight: .bold)).foregroundColor(
          signal.category.color)
        Spacer()
        HStack(spacing: 2) {
          ForEach(0..<signal.impactLevel, id: \.self) { _ in
            Image(systemName: "exclamationmark").font(.system(size: 8, weight: .bold))
              .foregroundColor(.red)
          }
        }
      }

      Text(signal.title).font(.system(size: 14, weight: .bold)).foregroundColor(.white).lineSpacing(
        2)
      Text(signal.summary).font(.system(size: 12, weight: .regular)).foregroundColor(
        .white.opacity(0.6)
      ).lineSpacing(3)

      VStack(alignment: .leading, spacing: 4) {
        Text("WHY THIS MATTERS TO YOU").font(.system(size: 8, weight: .bold)).tracking(1)
          .foregroundColor(.green.opacity(0.5))
        Text(signal.whyItMatters).font(.system(size: 11, weight: .medium)).foregroundColor(
          .green.opacity(0.7)
        ).lineSpacing(3)
      }
      .padding(10).background(RoundedRectangle(cornerRadius: 8).fill(Color.green.opacity(0.04)))

      if let distracted = signal.whileYouWereDistracted {
        VStack(alignment: .leading, spacing: 4) {
          Text("WHY YOU DIDN'T HEAR ABOUT THIS").font(.system(size: 8, weight: .bold)).tracking(1)
            .foregroundColor(.orange.opacity(0.5))
          Text(distracted).font(.system(size: 11, weight: .medium)).foregroundColor(
            .orange.opacity(0.7)
          ).lineSpacing(3)
        }
        .padding(10).background(RoundedRectangle(cornerRadius: 8).fill(Color.orange.opacity(0.04)))
      }

      Button {
        manager.saveSignal(signal)
      } label: {
        HStack(spacing: 4) {
          Image(systemName: "bookmark").font(.system(size: 10))
          Text("Save to My Feed").font(.system(size: 11, weight: .medium))
        }.foregroundColor(.cyan.opacity(0.6))
      }
    }
    .padding(14)
    .background(
      RoundedRectangle(cornerRadius: 14).fill(Color.white.opacity(0.03))
        .overlay(
          RoundedRectangle(cornerRadius: 14).stroke(
            signal.category.color.opacity(0.1), lineWidth: 1)))
  }
}

// MARK: - ═══════════════════════════════════════════════════

// PATTERN MAP VIEW (Layer 3)
// ═══════════════════════════════════════════════════════════

struct PatternMapView: View {
  @Environment(\.dismiss) var dismiss
  @State private var expandedId: String? = nil

  var body: some View {
    NavigationStack {
      ZStack {
        Color(red: 0.03, green: 0.03, blue: 0.08).ignoresSafeArea()

        ScrollView(showsIndicators: false) {
          VStack(spacing: 14) {
            Text("Every major distraction hides a real move.\nHere's the pattern, exposed.")
              .font(.system(size: 13, weight: .medium)).foregroundColor(.white.opacity(0.5))
              .multilineTextAlignment(.center).lineSpacing(3).padding(.bottom, 8)

            ForEach(SignalNoiseContentDatabase.patterns) { pattern in
              patternCard(pattern)
            }

            Spacer(minLength: 40)
          }
          .padding(20)
        }
      }
      .navigationTitle("Pattern Map")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button {
            dismiss()
          } label: {
            Image(systemName: "xmark.circle.fill").foregroundColor(.white.opacity(0.3))
          }
        }
      }
    }
  }

  private func patternCard(_ pattern: DistractionPattern) -> some View {
    let isExpanded = expandedId == pattern.id
    return VStack(alignment: .leading, spacing: 0) {
      Button {
        withAnimation(.spring(response: 0.3)) { expandedId = isExpanded ? nil : pattern.id }
      } label: {
        VStack(alignment: .leading, spacing: 6) {
          HStack(spacing: 8) {
            Image(systemName: "speaker.wave.3.fill").font(.system(size: 14)).foregroundColor(.red)
            Text("DISTRACTION").font(.system(size: 8, weight: .bold)).tracking(1).foregroundColor(
              .red.opacity(0.6))
            Spacer()
            Text(pattern.distractionType).font(.system(size: 9, weight: .medium)).foregroundColor(
              .white.opacity(0.3))
            Image(systemName: isExpanded ? "chevron.up" : "chevron.down").font(.system(size: 11))
              .foregroundColor(.white.opacity(0.3))
          }
          Text(pattern.distraction).font(.system(size: 14, weight: .bold)).foregroundColor(.white)
          Text(pattern.coverageDuration).font(.system(size: 10, weight: .medium)).foregroundColor(
            .white.opacity(0.3))
        }
        .padding(14)
      }

      if isExpanded {
        VStack(alignment: .leading, spacing: 14) {
          Divider().background(Color.white.opacity(0.08))

          VStack(alignment: .leading, spacing: 8) {
            Text("WHILE YOU WATCHED").font(.system(size: 9, weight: .bold)).tracking(1)
              .foregroundColor(.green.opacity(0.6))
            ForEach(Array(pattern.whileYouWatched.enumerated()), id: \.offset) { _, item in
              HStack(alignment: .top, spacing: 8) {
                Image(systemName: "target").font(.system(size: 10)).foregroundColor(.green).padding(
                  .top, 2)
                Text(item).font(.system(size: 12, weight: .medium)).foregroundColor(
                  .green.opacity(0.8)
                ).lineSpacing(2)
              }
            }
          }

          VStack(alignment: .leading, spacing: 4) {
            Text("WHO BENEFITED").font(.system(size: 9, weight: .bold)).tracking(1).foregroundColor(
              .purple.opacity(0.6))
            Text(pattern.whoBenefited).font(.system(size: 12, weight: .regular)).foregroundColor(
              .purple.opacity(0.7)
            ).lineSpacing(3)
          }
          .padding(10).background(
            RoundedRectangle(cornerRadius: 8).fill(Color.purple.opacity(0.04)))

          VStack(alignment: .leading, spacing: 4) {
            Text("LESSON").font(.system(size: 9, weight: .bold)).tracking(1).foregroundColor(
              .cyan.opacity(0.6))
            Text(pattern.lessonsLearned).font(.system(size: 12, weight: .medium, design: .rounded))
              .foregroundColor(.cyan.opacity(0.7)).lineSpacing(3)
          }
          .padding(10).background(RoundedRectangle(cornerRadius: 8).fill(Color.cyan.opacity(0.04)))
        }
        .padding(.horizontal, 14).padding(.bottom, 14)
      }
    }
    .background(
      RoundedRectangle(cornerRadius: 14).fill(Color.white.opacity(0.03))
        .overlay(
          RoundedRectangle(cornerRadius: 14).stroke(
            isExpanded ? Color.red.opacity(0.15) : Color.white.opacity(0.05), lineWidth: 1)))
  }
}

// MARK: - ═══════════════════════════════════════════════════

// MEDIA LITERACY VIEW
// ═══════════════════════════════════════════════════════════

struct MediaLiteracyView: View {
  @Environment(\.dismiss) var dismiss

  var body: some View {
    NavigationStack {
      ZStack {
        Color(red: 0.03, green: 0.03, blue: 0.08).ignoresSafeArea()
        ScrollView(showsIndicators: false) {
          VStack(spacing: 14) {
            ForEach(Array(SignalNoiseContentDatabase.mediaLessons.enumerated()), id: \.offset) {
              _, lesson in
              VStack(alignment: .leading, spacing: 10) {
                HStack(spacing: 8) {
                  Image(systemName: lesson.icon).font(.system(size: 18))
                    .foregroundColor(Color(red: 0.4, green: 0.7, blue: 1.0))
                  Text(lesson.title).font(.system(size: 15, weight: .bold)).foregroundColor(.white)
                }
                Text(lesson.content).font(.system(size: 13, weight: .regular)).foregroundColor(
                  .white.opacity(0.7)
                ).lineSpacing(5)
              }
              .padding(16)
              .background(
                RoundedRectangle(cornerRadius: 16).fill(
                  Color(red: 0.4, green: 0.7, blue: 1.0).opacity(0.03)
                )
                .overlay(
                  RoundedRectangle(cornerRadius: 16).stroke(
                    Color(red: 0.4, green: 0.7, blue: 1.0).opacity(0.1), lineWidth: 1)))
            }
            Spacer(minLength: 40)
          }
          .padding(20)
        }
      }
      .navigationTitle("Media Literacy")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button {
            dismiss()
          } label: {
            Image(systemName: "xmark.circle.fill").foregroundColor(.white.opacity(0.3))
          }
        }
      }
    }
  }
}

// MARK: - ═══════════════════════════════════════════════════

// SIGNAL FEED VIEW (Saved Signals)
// ═══════════════════════════════════════════════════════════

struct SignalFeedView: View {
  @Environment(\.dismiss) var dismiss
  @ObservedObject var manager: SignalNoiseManager

  var body: some View {
    NavigationStack {
      ZStack {
        Color(red: 0.03, green: 0.03, blue: 0.08).ignoresSafeArea()
        if manager.savedSignals.isEmpty {
          VStack(spacing: 12) {
            Image(systemName: "line.3.horizontal.decrease.circle").font(.system(size: 40))
              .foregroundColor(.white.opacity(0.1))
            Text("No saved signals yet").font(.system(size: 16, weight: .bold)).foregroundColor(
              .white.opacity(0.3))
            Text("Save stories from the Signal Tracker\nto build your custom feed.")
              .font(.system(size: 12)).foregroundColor(.white.opacity(0.2)).multilineTextAlignment(
                .center)
          }
        } else {
          ScrollView(showsIndicators: false) {
            VStack(spacing: 10) {
              ForEach(manager.savedSignals) { signal in
                HStack(spacing: 10) {
                  Image(systemName: signal.category.icon).foregroundColor(signal.category.color)
                    .frame(width: 24)
                  VStack(alignment: .leading, spacing: 2) {
                    Text(signal.title).font(.system(size: 13, weight: .bold)).foregroundColor(
                      .white
                    ).lineLimit(2)
                    Text(signal.category.rawValue).font(.system(size: 10)).foregroundColor(
                      signal.category.color)
                  }
                  Spacer()
                }
                .padding(12).background(
                  RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.03)))
              }
              Spacer(minLength: 40)
            }
            .padding(20)
          }
        }
      }
      .navigationTitle("My Signal Feed")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button {
            dismiss()
          } label: {
            Image(systemName: "xmark.circle.fill").foregroundColor(.white.opacity(0.3))
          }
        }
      }
    }
  }
}

// MARK: - ═══════════════════════════════════════════════════

// SCAN HISTORY VIEW
// ═══════════════════════════════════════════════════════════

struct ScanHistoryView: View {
  @Environment(\.dismiss) var dismiss
  @ObservedObject var manager: SignalNoiseManager

  var body: some View {
    NavigationStack {
      ZStack {
        Color(red: 0.03, green: 0.03, blue: 0.08).ignoresSafeArea()
        if manager.scanHistory.isEmpty {
          VStack(spacing: 12) {
            Image(systemName: "clock.arrow.circlepath").font(.system(size: 40)).foregroundColor(
              .white.opacity(0.1))
            Text("No scans yet").font(.system(size: 16, weight: .bold)).foregroundColor(
              .white.opacity(0.3))
            Text("Use the Noise Detector to analyze headlines.").font(.system(size: 12))
              .foregroundColor(.white.opacity(0.2))
          }
        } else {
          ScrollView(showsIndicators: false) {
            VStack(spacing: 10) {
              ForEach(manager.scanHistory) { scan in
                HStack(spacing: 10) {
                  Image(systemName: scan.verdict.icon).foregroundColor(scan.verdict.color).frame(
                    width: 24)
                  VStack(alignment: .leading, spacing: 2) {
                    Text(scan.headline).font(.system(size: 12, weight: .medium)).foregroundColor(
                      .white
                    ).lineLimit(2)
                    HStack(spacing: 8) {
                      Text(scan.verdict.rawValue).font(.system(size: 10, weight: .bold))
                        .foregroundColor(scan.verdict.color)
                      Text("Noise: \(scan.noiseScore)%").font(.system(size: 9)).foregroundColor(
                        .red.opacity(0.6))
                      Text("Signal: \(scan.signalScore)%").font(.system(size: 9)).foregroundColor(
                        .green.opacity(0.6))
                    }
                  }
                  Spacer()
                }
                .padding(12).background(
                  RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.03)))
              }
              Spacer(minLength: 40)
            }
            .padding(20)
          }
        }
      }
      .navigationTitle("Scan History")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button {
            dismiss()
          } label: {
            Image(systemName: "xmark.circle.fill").foregroundColor(.white.opacity(0.3))
          }
        }
      }
    }
  }
}
