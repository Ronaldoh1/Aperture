// PsyopScannerEntity.swift
// Models for the Psyop Scanner - Detect manipulation, protect your mind

import SwiftUI

// MARK: - Scan Result

struct PsyopScanResult: Identifiable {
  let id = UUID()
  let originalText: String
  let fearScore: Double  // 0.0 - 1.0
  let psyopScore: Int  // 0-10
  let deceptionDetected: Bool
  let urgencyLevel: UrgencyLevel
  let detectedPatterns: [ManipulationPatternResult]
  let psychologicalEffects: [PsychEffect]
  let calmOptions: [CalmOption]
  let timestamp: Date

  var overallThreatLevel: ThreatLevel {
    let combined = fearScore + Double(psyopScore) / 10.0 + (deceptionDetected ? 0.3 : 0)
    if combined > 1.5 { return .high }
    if combined > 0.8 { return .medium }
    return .low
  }
}

// MARK: - Threat Level

enum ThreatLevel: String, CaseIterable {
  case low = "Low"
  case medium = "Medium"
  case high = "High"

  var color: Color {
    switch self {
    case .low: return .green
    case .medium: return .orange
    case .high: return .red
    }
  }

  var icon: String {
    switch self {
    case .low: return "checkmark.shield.fill"
    case .medium: return "exclamationmark.shield.fill"
    case .high: return "xmark.shield.fill"
    }
  }

  var message: String {
    switch self {
    case .low: return "This content appears relatively neutral. Your energy is safe."
    case .medium: return "Some manipulation patterns detected. Stay aware and grounded."
    case .high: return "High manipulation detected. Protect your peace before engaging."
    }
  }
}

// MARK: - Urgency Level

enum UrgencyLevel: String {
  case none = "None"
  case low = "Low"
  case medium = "Medium"
  case high = "High"
  case extreme = "Extreme"

  var color: Color {
    switch self {
    case .none: return .gray
    case .low: return .green
    case .medium: return .yellow
    case .high: return .orange
    case .extreme: return .red
    }
  }
}

// MARK: - Manipulation Pattern

struct ManipulationPatternResult: Identifiable {
  let id = UUID()
  let type: PatternType
  let matchedPhrases: [String]
  let explanation: String
}

enum PatternType: String, CaseIterable {
  case fearMongering = "Fear Mongering"
  case vagueSources = "Vague Sources"
  case divisionTactics = "Division Tactics"
  case scarcityPressure = "Scarcity Pressure"
  case authorityBias = "Authority Bias"
  case emotionalManipulation = "Emotional Manipulation"
  case contradiction = "Contradiction"
  case urgencyPressure = "Urgency Pressure"
  case outrageBait = "Outrage Bait"
  case catastrophizing = "Catastrophizing"

  var icon: String {
    switch self {
    case .fearMongering: return "flame.fill"
    case .vagueSources: return "questionmark.diamond.fill"
    case .divisionTactics: return "arrow.left.arrow.right"
    case .scarcityPressure: return "clock.badge.exclamationmark.fill"
    case .authorityBias: return "person.badge.shield.checkmark.fill"
    case .emotionalManipulation: return "heart.slash.fill"
    case .contradiction: return "arrow.triangle.swap"
    case .urgencyPressure: return "bolt.fill"
    case .outrageBait: return "exclamationmark.bubble.fill"
    case .catastrophizing: return "tornado"
    }
  }

  var color: Color {
    switch self {
    case .fearMongering: return .red
    case .vagueSources: return .orange
    case .divisionTactics: return .purple
    case .scarcityPressure: return .yellow
    case .authorityBias: return .blue
    case .emotionalManipulation: return .pink
    case .contradiction: return .cyan
    case .urgencyPressure: return .orange
    case .outrageBait: return .red
    case .catastrophizing: return .purple
    }
  }
}

// MARK: - Psychological Effect

struct PsychEffect: Identifiable {
  let id = UUID()
  let effect: String
  let severity: EffectSeverity
  let icon: String
  let bodyResponse: String
}

enum EffectSeverity {
  case mild, moderate, severe

  var color: Color {
    switch self {
    case .mild: return .yellow
    case .moderate: return .orange
    case .severe: return .red
    }
  }

  var label: String {
    switch self {
    case .mild: return "Mild"
    case .moderate: return "Moderate"
    case .severe: return "Severe"
    }
  }
}

// MARK: - Calm Option

struct CalmOption: Identifiable {
  let id = UUID()
  let type: CalmOptionType
  let title: String
  let description: String
  let duration: Int?
  let isInteractive: Bool
}

enum CalmOptionType: CaseIterable {
  case breathe
  case groundYourself
  case bodyCheck
  case verify
  case journal
  case ignore
  case waitAndRevisit
  case shareCalmly

  var icon: String {
    switch self {
    case .breathe: return "wind"
    case .groundYourself: return "figure.stand"
    case .bodyCheck: return "heart.text.square.fill"
    case .verify: return "checkmark.seal.fill"
    case .journal: return "note.text"
    case .ignore: return "hand.raised.slash.fill"
    case .waitAndRevisit: return "clock.arrow.circlepath"
    case .shareCalmly: return "bubble.left.and.bubble.right.fill"
    }
  }

  var color: Color {
    switch self {
    case .breathe: return .cyan
    case .groundYourself: return .orange
    case .bodyCheck: return .pink
    case .verify: return .green
    case .journal: return .purple
    case .ignore: return .gray
    case .waitAndRevisit: return .blue
    case .shareCalmly: return .teal
    }
  }
}
