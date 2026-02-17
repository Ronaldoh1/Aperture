// AwakeningEntity.swift
// NPC → GOD MODE

import Foundation
import SwiftUI

// MARK: - User Level System

enum AwakeningLevel: Int, CaseIterable, Codable {
  case npc = 1
  case glitch = 2
  case patternRecognition = 3
  case deconditioning = 4
  case systemOverride = 5
  case godMode = 6

  var title: String {
    switch self {
    case .npc: return "NPC Mode"
    case .glitch: return "Glitch in the Matrix"
    case .patternRecognition: return "Pattern Recognition"
    case .deconditioning: return "Deconditioning"
    case .systemOverride: return "System Override"
    case .godMode: return "GOD MODE"
    }
  }

  var subtitle: String {
    switch self {
    case .npc: return "Running default programming"
    case .glitch: return "First cognitive dissonance detected"
    case .patternRecognition: return "Spotting manipulation in real-time"
    case .deconditioning: return "Actively shedding programming"
    case .systemOverride: return "Operating from internal authority"
    case .godMode: return "Complete integration. Welcome home."
    }
  }

  var icon: String {
    switch self {
    case .npc: return "person.fill.questionmark"
    case .glitch: return "exclamationmark.triangle.fill"
    case .patternRecognition: return "eye.fill"
    case .deconditioning: return "arrow.triangle.2.circlepath"
    case .systemOverride: return "bolt.shield.fill"
    case .godMode: return "sun.max.fill"
    }
  }

  var color: Color {
    switch self {
    case .npc: return Color.gray
    case .glitch: return Color.yellow
    case .patternRecognition: return Palette.primary.cyan
    case .deconditioning: return Palette.primary.violet
    case .systemOverride: return Palette.primary.orange
    case .godMode: return Palette.accent.gold
    }
  }

  var dragonMessage: String {
    switch self {
    case .npc:
      return "You're still running their programs. That's okay - awareness is the first step."
    case .glitch: return "You felt it. Something doesn't add up. Trust that feeling."
    case .patternRecognition:
      return "Now you're seeing it everywhere. The patterns. The manipulation. The loops."
    case .deconditioning: return "Shedding skin is uncomfortable. The old you is dying. Let it."
    case .systemOverride: return "You no longer need external validation. You ARE the authority."
    case .godMode: return "Welcome home. You were never separate. Now go help others remember."
    }
  }

  var requiredScore: Int {
    switch self {
    case .npc: return 0
    case .glitch: return 10
    case .patternRecognition: return 30
    case .deconditioning: return 60
    case .systemOverride: return 100
    case .godMode: return 150
    }
  }

  var nextLevel: AwakeningLevel? {
    AwakeningLevel(rawValue: rawValue + 1)
  }
}

// MARK: - Daily Check-In Entity

struct DailyCheckIn: Codable, Identifiable {
  let id: UUID
  let date: Date
  let unconsciousnessMoment: String
  let emotionalIntensity: Int
  let category: UnconsciousnessCategory
  let insight: String?

  init(
    id: UUID = UUID(), date: Date = Date(), unconsciousnessMoment: String, emotionalIntensity: Int,
    category: UnconsciousnessCategory, insight: String? = nil
  ) {
    self.id = id
    self.date = date
    self.unconsciousnessMoment = unconsciousnessMoment
    self.emotionalIntensity = emotionalIntensity
    self.category = category
    self.insight = insight
  }

  enum UnconsciousnessCategory: String, Codable, CaseIterable {
    case reactivity = "Reactivity"
    case autopilot = "Autopilot"
    case distraction = "Distraction"
    case peoplepleasing = "People-Pleasing"
    case avoidance = "Avoidance"
    case comparison = "Comparison"
    case consumption = "Consumption"
    case judgment = "Judgment"

    var icon: String {
      switch self {
      case .reactivity: return "flame.fill"
      case .autopilot: return "repeat"
      case .distraction: return "sparkles.tv.fill"
      case .peoplepleasing: return "person.2.fill"
      case .avoidance: return "eye.slash.fill"
      case .comparison: return "arrow.left.arrow.right"
      case .consumption: return "cart.fill"
      case .judgment: return "hand.point.up.fill"
      }
    }

    var color: Color {
      switch self {
      case .reactivity: return Palette.primary.red
      case .autopilot: return Palette.primary.orange
      case .distraction: return Palette.primary.cyan
      case .peoplepleasing: return Palette.primary.violet
      case .avoidance: return Color.gray
      case .comparison: return Palette.primary.blue
      case .consumption: return Color.green
      case .judgment: return Palette.accent.gold
      }
    }

    var description: String {
      switch self {
      case .reactivity: return "Responding emotionally without thinking"
      case .autopilot: return "Going through motions without awareness"
      case .distraction: return "Escaping into entertainment or scrolling"
      case .peoplepleasing: return "Abandoning self to satisfy others"
      case .avoidance: return "Refusing to face something uncomfortable"
      case .comparison: return "Measuring self against others"
      case .consumption: return "Buying or eating to fill a void"
      case .judgment: return "Criticizing self or others harshly"
      }
    }
  }
}

// MARK: - Cognitive Dissonance Entity

struct CognitiveDissonanceEntry: Codable, Identifiable {
  let id: UUID
  let date: Date
  let trigger: String
  let whatIWasTaught: String
  let whatIObserved: String
  let emotionalIntensity: Int
  var resolved: Bool
  var resolution: String?
  let domain: DissonanceDomain

  init(
    id: UUID = UUID(), date: Date = Date(), trigger: String, whatIWasTaught: String,
    whatIObserved: String, emotionalIntensity: Int, resolved: Bool = false,
    resolution: String? = nil, domain: DissonanceDomain
  ) {
    self.id = id
    self.date = date
    self.trigger = trigger
    self.whatIWasTaught = whatIWasTaught
    self.whatIObserved = whatIObserved
    self.emotionalIntensity = emotionalIntensity
    self.resolved = resolved
    self.resolution = resolution
    self.domain = domain
  }

  enum DissonanceDomain: String, Codable, CaseIterable {
    case education = "Education"
    case finance = "Finance"
    case health = "Health"
    case politics = "Politics"
    case religion = "Religion"
    case relationships = "Relationships"
    case career = "Career"
    case media = "Media"
    case science = "Science"
    case history = "History"

    var icon: String {
      switch self {
      case .education: return "graduationcap.fill"
      case .finance: return "dollarsign.circle.fill"
      case .health: return "heart.fill"
      case .politics: return "building.columns.fill"
      case .religion: return "book.closed.fill"
      case .relationships: return "heart.circle.fill"
      case .career: return "briefcase.fill"
      case .media: return "newspaper.fill"
      case .science: return "atom"
      case .history: return "clock.fill"
      }
    }

    var color: Color {
      switch self {
      case .education: return Palette.primary.blue
      case .finance: return Color.green
      case .health: return Palette.primary.red
      case .politics: return Palette.primary.orange
      case .religion: return Palette.primary.violet
      case .relationships: return Color.pink
      case .career: return Palette.primary.cyan
      case .media: return Color.gray
      case .science: return Palette.accent.cyan
      case .history: return Palette.accent.gold
      }
    }
  }
}

// MARK: - Reality Audit Entity

struct RealityAuditEntry: Codable, Identifiable {
  let id: UUID
  let domain: AuditDomain
  let belief: String
  var status: BeliefStatus
  let origin: String?
  var evidence: String?
  var notes: String?
  var lastExamined: Date

  init(
    id: UUID = UUID(), domain: AuditDomain, belief: String, status: BeliefStatus = .inherited,
    origin: String? = nil, evidence: String? = nil, notes: String? = nil,
    lastExamined: Date = Date()
  ) {
    self.id = id
    self.domain = domain
    self.belief = belief
    self.status = status
    self.origin = origin
    self.evidence = evidence
    self.notes = notes
    self.lastExamined = lastExamined
  }

  enum AuditDomain: String, Codable, CaseIterable {
    case money = "Money & Success"
    case authority = "Authority & Government"
    case education = "Education & Learning"
    case relationships = "Relationships"
    case health = "Health & Body"
    case spirituality = "Spirituality"
    case career = "Career & Purpose"
    case identity = "Identity & Self"

    var icon: String {
      switch self {
      case .money: return "dollarsign.circle.fill"
      case .authority: return "building.columns.fill"
      case .education: return "graduationcap.fill"
      case .relationships: return "heart.circle.fill"
      case .health: return "heart.fill"
      case .spirituality: return "sparkles"
      case .career: return "briefcase.fill"
      case .identity: return "person.fill"
      }
    }

    var color: Color {
      switch self {
      case .money: return Color.green
      case .authority: return Palette.primary.orange
      case .education: return Palette.primary.blue
      case .relationships: return Color.pink
      case .health: return Palette.primary.red
      case .spirituality: return Palette.primary.violet
      case .career: return Palette.primary.cyan
      case .identity: return Palette.accent.gold
      }
    }
  }

  enum BeliefStatus: String, Codable, CaseIterable {
    case inherited = "Inherited"
    case examining = "Examining"
    case integrated = "Integrated"
    case discarded = "Discarded"

    var color: Color {
      switch self {
      case .inherited: return Palette.primary.red
      case .examining: return Palette.primary.orange
      case .integrated: return Color.green
      case .discarded: return Palette.primary.violet
      }
    }

    var icon: String {
      switch self {
      case .inherited: return "arrow.down.circle.fill"
      case .examining: return "magnifyingglass.circle.fill"
      case .integrated: return "checkmark.circle.fill"
      case .discarded: return "xmark.circle.fill"
      }
    }
  }
}

// MARK: - Question Entry

struct QuestionEntry: Codable, Identifiable {
  let id: UUID
  let question: String
  let category: QuestionCategory
  var reflection: String?
  let askedDate: Date
  var answeredDate: Date?

  var isAnswered: Bool {
    answeredDate != nil && reflection != nil && !(reflection?.isEmpty ?? true)
  }

  init(
    id: UUID = UUID(), question: String, category: QuestionCategory, reflection: String? = nil,
    askedDate: Date = Date(), answeredDate: Date? = nil
  ) {
    self.id = id
    self.question = question
    self.category = category
    self.reflection = reflection
    self.askedDate = askedDate
    self.answeredDate = answeredDate
  }

  enum QuestionCategory: String, Codable, CaseIterable {
    case fundamentals = "Fundamental Beliefs"
    case authority = "Authority & Power"
    case identity = "Identity & Self"
    case purpose = "Purpose & Meaning"
    case relationships = "Relationships"
    case reality = "Nature of Reality"

    var icon: String {
      switch self {
      case .fundamentals: return "building.columns.fill"
      case .authority: return "crown.fill"
      case .identity: return "person.fill.questionmark"
      case .purpose: return "star.fill"
      case .relationships: return "person.2.fill"
      case .reality: return "globe.americas.fill"
      }
    }

    var color: Color {
      switch self {
      case .fundamentals: return Palette.primary.orange
      case .authority: return Palette.primary.red
      case .identity: return Palette.primary.violet
      case .purpose: return Palette.accent.gold
      case .relationships: return Color.pink
      case .reality: return Palette.primary.cyan
      }
    }
  }
}

// MARK: - User Awakening Profile

struct AwakeningProfile: Codable {
  var currentLevel: AwakeningLevel
  var checkIns: [DailyCheckIn]
  var dissonanceLog: [CognitiveDissonanceEntry]
  var auditEntries: [RealityAuditEntry]
  var questionHistory: [QuestionEntry]
  var startDate: Date
  var lastActiveDate: Date

  var totalCheckIns: Int {
    checkIns.count
  }

  var totalDissonanceEntries: Int {
    dissonanceLog.count
  }

  var resolvedDissonances: Int {
    dissonanceLog.filter { $0.resolved }.count
  }

  var examinedBeliefs: Int {
    auditEntries.filter { $0.status == .integrated || $0.status == .discarded }.count
  }

  var totalBeliefs: Int {
    auditEntries.count
  }

  var answeredQuestions: Int {
    questionHistory.filter { $0.isAnswered }.count
  }

  var totalQuestions: Int {
    questionHistory.count
  }

  var currentScore: Int {
    var score = 0
    score += min(checkIns.count, 50)
    score += min(dissonanceLog.count * 2, 40)
    score += min(resolvedDissonances, 20)
    score += min(examinedBeliefs * 3, 60)
    score += min(answeredQuestions * 2, 40)

    let daysSinceStart =
      Calendar.current.dateComponents([.day], from: startDate, to: Date()).day ?? 0
    if daysSinceStart >= 7 { score += 10 }
    if daysSinceStart >= 30 { score += 20 }
    if daysSinceStart >= 90 { score += 30 }

    return score
  }

  var progressToNextLevel: Double {
    let current = currentLevel.requiredScore
    guard let next = currentLevel.nextLevel else { return 1.0 }
    let nextScore = next.requiredScore
    let score = currentScore

    if score >= nextScore { return 1.0 }
    if score <= current { return 0.0 }

    return Double(score - current) / Double(nextScore - current)
  }

  static var `default`: AwakeningProfile {
    AwakeningProfile(
      currentLevel: .npc,
      checkIns: [],
      dissonanceLog: [],
      auditEntries: [],
      questionHistory: [],
      startDate: Date(),
      lastActiveDate: Date()
    )
  }
}

// MARK: - Question Bank

enum QuestionBank {
  static let questions: [QuestionEntry.QuestionCategory: [String]] = [
    .fundamentals: [
      "Why do I believe what I believe about success?",
      "Who taught me what's 'normal'?",
      "What would I do if I knew I couldn't fail?",
      "What belief am I most afraid to question?",
      "If I had no memory of my past, who would I be?",
      "What do I believe about myself that I've never examined?",
      "What 'truth' have I accepted without evidence?",
      "Which of my beliefs serve me vs. serve others?",
    ],
    .authority: [
      "Who benefits from my obedience?",
      "What would happen if I stopped seeking permission?",
      "When did I first learn to doubt my own judgment?",
      "Who told me I needed an authority to validate my truth?",
      "What am I accepting as 'just how things are'?",
      "Who profits from my compliance?",
      "What rules do I follow that I've never questioned?",
      "When do I give away my power without realizing it?",
    ],
    .identity: [
      "Who am I without my job title?",
      "What parts of 'me' are actually inherited programming?",
      "What would I do differently if no one was watching?",
      "Am I living my life or performing a role?",
      "What am I pretending not to know about myself?",
      "Who would I be if I stopped defending my identity?",
      "What mask do I wear most often?",
      "What would I have to give up to be fully authentic?",
    ],
    .purpose: [
      "What am I avoiding by staying busy?",
      "What would I do if money was irrelevant?",
      "What dream did I abandon to be 'practical'?",
      "What would I create if I had unlimited resources?",
      "What legacy am I actually building?",
      "What would I regret not doing on my deathbed?",
      "What am I here to contribute?",
      "What problem am I uniquely positioned to solve?",
    ],
    .relationships: [
      "Who am I trying to please at my own expense?",
      "What relationship patterns keep repeating?",
      "What am I tolerating that I shouldn't?",
      "Who do I become around certain people?",
      "What boundaries have I failed to set?",
      "Who am I trying to save instead of living my own life?",
      "What am I not saying that needs to be said?",
      "Which relationships drain me vs. energize me?",
    ],
    .reality: [
      "What if everything I was taught about reality is wrong?",
      "How much of what I experience is filtered through programming?",
      "What am I perceiving that others are missing?",
      "What 'conspiracy theory' might actually be true?",
      "What's the difference between my thoughts and who I am?",
      "If consciousness is primary, what does that mean for 'my' life?",
      "What patterns do I see that others don't?",
      "What would change if I knew I was eternal?",
    ],
  ]

  static func getRandomQuestion() -> QuestionEntry {
    let allQuestions = questions.flatMap { category, questionList in
      questionList.map { (category, $0) }
    }
    let random = allQuestions.randomElement()!
    return QuestionEntry(question: random.1, category: random.0)
  }

  static func getQuestion(for category: QuestionEntry.QuestionCategory) -> QuestionEntry {
    let categoryQuestions = questions[category] ?? []
    let randomQuestion = categoryQuestions.randomElement() ?? "What am I not seeing?"
    return QuestionEntry(question: randomQuestion, category: category)
  }
}
