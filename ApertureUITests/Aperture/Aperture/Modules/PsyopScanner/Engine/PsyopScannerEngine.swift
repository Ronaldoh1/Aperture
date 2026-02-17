// PsyopScannerEngine.swift
// Local AI core for Aperture - Offline-first manipulation detection
// No cloud dependency, keeps it private and fast

import Foundation

final class PsyopScannerEngine {
  static let shared = PsyopScannerEngine()
  private init() {}

  // MARK: - Word Lists

  private let negativeWords = [
    "bad", "worse", "worst", "terrible", "horrible", "awful", "disaster",
    "crisis", "threat", "danger", "fear", "panic", "alarm", "shock",
    "outrage", "tragic", "devastating", "catastrophic", "deadly", "fatal",
  ]

  private let urgentWords = [
    "urgent", "crisis", "emergency", "disaster", "threat", "warning",
    "alert", "imminent", "catastrophe", "breaking", "critical", "immediate",
  ]

  private let vagueSourcePatterns = [
    "sources say", "experts believe", "some people", "anonymous",
    "reportedly", "it is said", "many think", "insiders claim",
    "according to sources", "officials say", "studies show",
  ]

  private let divisionPatterns = [
    "us vs them", "divide", "conflict", "enemy", "opposition", "battle",
    "fight against", "war on", "those people", "the other side", "they want",
    "real americans", "the elite", "wake up", "sheep",
  ]

  private let scarcityPatterns = [
    "limited", "shortage", "running out", "scarce", "last chance",
    "while supplies last", "only a few left", "act now", "don't miss",
  ]

  private let emotionalTriggers = [
    "outraged", "furious", "heartbreaking", "shocking", "unbelievable",
    "disgusting", "horrifying", "terrifying", "sickening", "infuriating",
    "must see", "you won't believe", "will make you cry",
  ]

  private let outrageBaitPatterns = [
    "slammed", "destroyed", "owned", "blasted", "ripped", "eviscerated",
    "humiliated", "crushed", "obliterated", "exposes", "caught",
  ]

  // MARK: - Main Analysis

  func analyze(text: String) -> PsyopScanResult {
    let lowercasedText = text.lowercased()
    let wordCount = max(text.split(separator: " ").count, 1)

    let fearScore = calculateFearScore(text: lowercasedText, wordCount: wordCount)
    let psyopScore = calculatePsyopScore(text: lowercasedText)
    let deceptionDetected = detectDeception(text: lowercasedText)
    let urgencyLevel = calculateUrgencyLevel(text: lowercasedText)
    let patterns = detectPatterns(text: lowercasedText)
    let threatLevel = calculateThreatLevel(fearScore, psyopScore, deceptionDetected)
    let effects = generatePsychEffects(
      fearScore: fearScore, psyopScore: psyopScore, deception: deceptionDetected, patterns: patterns
    )
    let calmOptions = generateCalmOptions(threatLevel: threatLevel)

    return PsyopScanResult(
      originalText: text,
      fearScore: fearScore,
      psyopScore: psyopScore,
      deceptionDetected: deceptionDetected,
      urgencyLevel: urgencyLevel,
      detectedPatterns: patterns,
      psychologicalEffects: effects,
      calmOptions: calmOptions,
      timestamp: Date()
    )
  }

  private func calculateFearScore(text: String, wordCount: Int) -> Double {
    let negCount = negativeWords.reduce(0) { count, word in
      count + text.components(separatedBy: word).count - 1
    }
    let sentimentNeg = Double(negCount) / Double(wordCount)
    let urgentCount = urgentWords.reduce(0) { count, word in
      count + (text.contains(word) ? 1 : 0)
    }
    let emotionalCount = emotionalTriggers.reduce(0) { count, trigger in
      count + (text.contains(trigger) ? 1 : 0)
    }
    let fearScore = sentimentNeg * (1.0 + Double(urgentCount) * 0.2 + Double(emotionalCount) * 0.15)
    return min(fearScore, 1.0)
  }

  private func calculatePsyopScore(text: String) -> Int {
    var score = 0
    score += divisionPatterns.reduce(0) { count, pattern in count + (text.contains(pattern) ? 2 : 0)
    }
    score += scarcityPatterns.reduce(0) { count, pattern in count + (text.contains(pattern) ? 1 : 0)
    }
    score += emotionalTriggers.reduce(0) { count, trigger in
      count + (text.contains(trigger) ? 1 : 0)
    }
    score += outrageBaitPatterns.reduce(0) { count, pattern in
      count + (text.contains(pattern) ? 2 : 0)
    }
    return min(score, 10)
  }

  private func detectDeception(text: String) -> Bool {
    let hasVagueSources = vagueSourcePatterns.contains { text.contains($0) }
    let contradictionIndicators = ["but", "however", "although", "despite", "yet"]
    let contradictionCount = contradictionIndicators.filter { text.contains($0) }.count
    return hasVagueSources || contradictionCount >= 2
  }

  private func calculateUrgencyLevel(text: String) -> UrgencyLevel {
    let urgentCount = urgentWords.reduce(0) { count, word in count + (text.contains(word) ? 1 : 0) }
    switch urgentCount {
    case 0: return .none
    case 1: return .low
    case 2: return .medium
    case 3: return .high
    default: return .extreme
    }
  }

  private func detectPatterns(text: String) -> [ManipulationPatternResult] {
    var patterns: [ManipulationPatternResult] = []

    let fearMatches = urgentWords.filter { text.contains($0) }
    if !fearMatches.isEmpty {
      patterns.append(
        ManipulationPatternResult(
          type: .fearMongering, matchedPhrases: fearMatches,
          explanation: "Uses fear-inducing words to trigger your fight-or-flight response."))
    }

    let sourceMatches = vagueSourcePatterns.filter { text.contains($0) }
    if !sourceMatches.isEmpty {
      patterns.append(
        ManipulationPatternResult(
          type: .vagueSources, matchedPhrases: sourceMatches,
          explanation: "Attributes claims to unverifiable sources."))
    }

    let divisionMatches = divisionPatterns.filter { text.contains($0) }
    if !divisionMatches.isEmpty {
      patterns.append(
        ManipulationPatternResult(
          type: .divisionTactics, matchedPhrases: divisionMatches,
          explanation: "Creates us-vs-them framing to trigger tribal instincts."))
    }

    let outrageMatches = outrageBaitPatterns.filter { text.contains($0) }
    if !outrageMatches.isEmpty {
      patterns.append(
        ManipulationPatternResult(
          type: .outrageBait, matchedPhrases: outrageMatches,
          explanation: "Classic outrage bait designed to make you angry and share."))
    }

    return patterns
  }

  private func generatePsychEffects(
    fearScore: Double, psyopScore _: Int, deception: Bool, patterns: [ManipulationPatternResult]
  ) -> [PsychEffect] {
    var effects: [PsychEffect] = []

    if fearScore > 0.3 {
      effects.append(
        PsychEffect(
          effect: "Anxiety activation — nervous system may shift into fight-or-flight",
          severity: fearScore > 0.6 ? .severe : .moderate, icon: "bolt.heart.fill",
          bodyResponse: "Elevated heart rate, shallow breathing"))
    }

    if patterns.contains(where: { $0.type == .outrageBait || $0.type == .divisionTactics }) {
      effects.append(
        PsychEffect(
          effect: "Rage trigger — designed to hijack your prefrontal cortex with anger",
          severity: .severe, icon: "flame.fill", bodyResponse: "Blood pressure spike, urge to react"
        ))
    }

    if deception {
      effects.append(
        PsychEffect(
          effect: "Confusion induction — contradictory claims create cognitive dissonance",
          severity: .moderate, icon: "questionmark.circle.fill",
          bodyResponse: "Mental fog, difficulty focusing"))
    }

    if effects.isEmpty {
      effects.append(
        PsychEffect(
          effect: "Minimal emotional manipulation detected", severity: .mild,
          icon: "checkmark.circle.fill", bodyResponse: "Your nervous system appears unaffected"))
    }

    return effects
  }

  private func generateCalmOptions(threatLevel: ThreatLevel) -> [CalmOption] {
    var options: [CalmOption] = []

    if threatLevel == .high {
      options.append(
        CalmOption(
          type: .breathe, title: "Breathe First",
          description: "Your nervous system needs 90 seconds to reset.", duration: 90,
          isInteractive: true))
      options.append(
        CalmOption(
          type: .bodyCheck, title: "Body Scan", description: "Notice where you're holding tension.",
          duration: 30, isInteractive: true))
    }

    if threatLevel == .medium {
      options.append(
        CalmOption(
          type: .breathe, title: "3 Deep Breaths",
          description: "Activate your parasympathetic nervous system.", duration: 30,
          isInteractive: true))
    }

    if threatLevel != .low {
      options.append(
        CalmOption(
          type: .groundYourself, title: "5-4-3-2-1 Grounding",
          description: "Reconnect with the present moment.", duration: 60, isInteractive: true))
    }

    options.append(
      CalmOption(
        type: .waitAndRevisit, title: "Wait 24 Hours",
        description: "If it still matters tomorrow, engage with a clear head.", duration: nil,
        isInteractive: false))
    options.append(
      CalmOption(
        type: .verify, title: "Verify Before Believing",
        description: "Cross-check with 3+ independent sources.", duration: nil, isInteractive: false
      ))
    options.append(
      CalmOption(
        type: .ignore, title: "Choose Peace", description: "You are not obligated to engage.",
        duration: nil, isInteractive: false))

    return options
  }

  private func calculateThreatLevel(_ fearScore: Double, _ psyopScore: Int, _ deception: Bool)
    -> ThreatLevel
  {
    let combined = fearScore + Double(psyopScore) / 10.0 + (deception ? 0.3 : 0)
    if combined > 1.5 { return .high }
    if combined > 0.8 { return .medium }
    return .low
  }
}
