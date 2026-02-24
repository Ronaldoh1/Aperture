// BeliefAnalyzerEntity.swift
// SunFlow: Reignited — Aperture
// Reality Decoded: Belief Analyzer — Data Models

import Foundation
import SwiftUI

// MARK: - Belief Type

enum BeliefType: String, CaseIterable, Codable {
    case religious    = "religious"
    case economic     = "economic"
    case political    = "political"
    case psychological = "psychological"
    case cultural     = "cultural"
    case other        = "other"

    var displayName: String {
        switch self {
        case .religious:     return "Religious / Spiritual"
        case .economic:      return "Economic"
        case .political:     return "Political"
        case .psychological: return "Psychological"
        case .cultural:      return "Cultural"
        case .other:         return "Other"
        }
    }

    var icon: String {
        switch self {
        case .religious:     return "cross.circle.fill"
        case .economic:      return "dollarsign.circle.fill"
        case .political:     return "building.columns.fill"
        case .psychological: return "brain.head.profile"
        case .cultural:      return "globe.americas.fill"
        case .other:         return "questionmark.circle.fill"
        }
    }

    var color: Color {
        switch self {
        case .religious:     return Color(hex: "#9B59B6")
        case .economic:      return Color(hex: "#27AE60")
        case .political:     return Color(hex: "#E74C3C")
        case .psychological: return Color(hex: "#3498DB")
        case .cultural:      return Color(hex: "#E67E22")
        case .other:         return Color(hex: "#95A5A6")
        }
    }
}

// MARK: - Analysis Framework (25 Lenses)

enum AnalysisFramework: String, CaseIterable, Codable, Identifiable {
    // Psychology
    case cognitivebias        = "Cognitive Bias Framework"
    case attachmentTheory     = "Attachment Theory"
    case narrativePsychology  = "Narrative Psychology"
    case socialIdentity       = "Social Identity Theory"
    case scarcityCognitiveLoad = "Scarcity & Cognitive Load"

    // Power & Incentives
    case incentiveTheory      = "Incentive Theory"
    case principalAgent       = "Principal–Agent Problem"
    case institutionalCapture = "Institutional Capture"
    case gameTheory           = "Game Theory"
    case powerLaw             = "Power Law Distribution Analysis"

    // Systems & Logic
    case systemsThinking      = "Systems Thinking"
    case bayesianUpdating     = "Bayesian Updating"
    case evidenceQuality      = "Evidence Quality Scoring"
    case predictionTrack      = "Prediction Track Record"
    case collapseStress       = "Collapse Stress Test"

    // Media & Information
    case mediaEcology         = "Media Ecology"
    case informationCascade   = "Information Cascade Theory"
    case propagandaAnalysis   = "Propaganda Analysis"

    // Historical & Cultural
    case historicalReversal   = "Historical Reversal Pattern"
    case mythopoetics         = "Mythopoetics"
    case anthropologicalLens  = "Anthropological Lens"

    // Economics & Sociology
    case marxistCritique      = "Marxist Critique"
    case eliteTheory          = "Elite Theory"
    case statusSignaling      = "Status Signaling"
    case mimetics             = "Mimetic Theory"

    var id: String { rawValue }

    var category: FrameworkCategory {
        switch self {
        case .cognitivebias, .attachmentTheory, .narrativePsychology, .socialIdentity, .scarcityCognitiveLoad:
            return .psychology
        case .incentiveTheory, .principalAgent, .institutionalCapture, .gameTheory, .powerLaw:
            return .power
        case .systemsThinking, .bayesianUpdating, .evidenceQuality, .predictionTrack, .collapseStress:
            return .systems
        case .mediaEcology, .informationCascade, .propagandaAnalysis:
            return .media
        case .historicalReversal, .mythopoetics, .anthropologicalLens:
            return .historical
        case .marxistCritique, .eliteTheory, .statusSignaling, .mimetics:
            return .sociology
        }
    }

    var icon: String {
        switch self {
        case .cognitivebias:         return "brain"
        case .attachmentTheory:      return "heart.fill"
        case .narrativePsychology:   return "book.fill"
        case .socialIdentity:        return "person.3.fill"
        case .scarcityCognitiveLoad: return "hourglass"
        case .incentiveTheory:       return "dollarsign"
        case .principalAgent:        return "person.2.fill"
        case .institutionalCapture:  return "building.2.fill"
        case .gameTheory:            return "gamecontroller.fill"
        case .powerLaw:              return "chart.bar.fill"
        case .systemsThinking:       return "network"
        case .bayesianUpdating:      return "function"
        case .evidenceQuality:       return "checkmark.seal.fill"
        case .predictionTrack:       return "target"
        case .collapseStress:        return "exclamationmark.triangle.fill"
        case .mediaEcology:          return "antenna.radiowaves.left.and.right"
        case .informationCascade:    return "arrow.down.right.and.arrow.up.left"
        case .propagandaAnalysis:    return "megaphone.fill"
        case .historicalReversal:    return "clock.arrow.circlepath"
        case .mythopoetics:          return "sparkles"
        case .anthropologicalLens:   return "globe"
        case .marxistCritique:       return "hammer"
        case .eliteTheory:           return "crown.fill"
        case .statusSignaling:       return "star.fill"
        case .mimetics:              return "arrow.triangle.2.circlepath"
        }
    }
}

enum FrameworkCategory: String, CaseIterable {
    case psychology  = "Psychology"
    case power       = "Power & Incentives"
    case systems     = "Systems & Logic"
    case media       = "Media & Information"
    case historical  = "Historical & Cultural"
    case sociology   = "Economics & Sociology"

    var color: Color {
        switch self {
        case .psychology:  return Color(hex: "#3498DB")
        case .power:       return Color(hex: "#E74C3C")
        case .systems:     return Color(hex: "#27AE60")
        case .media:       return Color(hex: "#F39C12")
        case .historical:  return Color(hex: "#9B59B6")
        case .sociology:   return Color(hex: "#1ABC9C")
        }
    }
}

// MARK: - Default Frameworks by Belief Type

extension AnalysisFramework {
    static func defaults(for type: BeliefType) -> [AnalysisFramework] {
        switch type {
        case .religious:
            return [.socialIdentity, .incentiveTheory, .institutionalCapture, .bayesianUpdating, .narrativePsychology]
        case .economic:
            return [.incentiveTheory, .gameTheory, .powerLaw, .systemsThinking, .evidenceQuality]
        case .political:
            return [.incentiveTheory, .principalAgent, .mediaEcology, .socialIdentity, .bayesianUpdating]
        case .psychological:
            return [.cognitivebias, .attachmentTheory, .narrativePsychology, .scarcityCognitiveLoad, .bayesianUpdating]
        case .cultural:
            return [.mythopoetics, .anthropologicalLens, .socialIdentity, .mimetics, .historicalReversal]
        case .other:
            return [.cognitivebias, .incentiveTheory, .systemsThinking, .bayesianUpdating, .evidenceQuality]
        }
    }
}

// MARK: - Claim Label

enum ClaimLabel: String, Codable {
    case evidence    = "Evidence"
    case inference   = "Inference"
    case speculation = "Speculation"

    var color: Color {
        switch self {
        case .evidence:    return Color(hex: "#27AE60")
        case .inference:   return Color(hex: "#F39C12")
        case .speculation: return Color(hex: "#E74C3C")
        }
    }

    var icon: String {
        switch self {
        case .evidence:    return "checkmark.circle.fill"
        case .inference:   return "arrow.triangle.branch"
        case .speculation: return "questionmark.circle.fill"
        }
    }
}

// MARK: - Collapse Test

enum CollapseTestName: String, Codable, CaseIterable {
    case evidenceRobustness    = "Evidence Robustness"
    case incentiveDistortion   = "Incentive Distortion Risk"
    case punishmentOfDissent   = "Punishment of Dissent"
    case transparencyLevel     = "Transparency Level"
    case historicalReversals   = "Historical Reversals"
    case predictiveAccuracy    = "Predictive Accuracy"

    var icon: String {
        switch self {
        case .evidenceRobustness:   return "magnifyingglass"
        case .incentiveDistortion:  return "dollarsign.circle"
        case .punishmentOfDissent:  return "hand.raised.slash.fill"
        case .transparencyLevel:    return "eye.fill"
        case .historicalReversals:  return "clock.arrow.circlepath"
        case .predictiveAccuracy:   return "chart.line.uptrend.xyaxis"
        }
    }
}

enum CollapseTestResult: String, Codable {
    case pass        = "pass"
    case fail        = "fail"
    case inconclusive = "inconclusive"

    var color: Color {
        switch self {
        case .pass:         return Color(hex: "#27AE60")
        case .fail:         return Color(hex: "#E74C3C")
        case .inconclusive: return Color(hex: "#F39C12")
        }
    }

    var icon: String {
        switch self {
        case .pass:         return "checkmark.circle.fill"
        case .fail:         return "xmark.circle.fill"
        case .inconclusive: return "minus.circle.fill"
        }
    }

    var label: String {
        switch self {
        case .pass:         return "PASS"
        case .fail:         return "FAIL"
        case .inconclusive: return "?"
        }
    }
}

// MARK: - Analysis Outcome

enum AnalysisOutcome: String, Codable {
    case survives    = "Survives scrutiny"
    case partial     = "Partially survives"
    case collapses   = "Collapses under scrutiny"
    case insufficient = "Insufficient evidence"

    var color: Color {
        switch self {
        case .survives:     return Color(hex: "#27AE60")
        case .partial:      return Color(hex: "#F39C12")
        case .collapses:    return Color(hex: "#E74C3C")
        case .insufficient: return Color(hex: "#95A5A6")
        }
    }

    var icon: String {
        switch self {
        case .survives:     return "checkmark.shield.fill"
        case .partial:      return "shield.lefthalf.filled"
        case .collapses:    return "shield.slash.fill"
        case .insufficient: return "questionmark.circle.fill"
        }
    }

    var emoji: String {
        switch self {
        case .survives:     return "🛡️"
        case .partial:      return "⚠️"
        case .collapses:    return "💥"
        case .insufficient: return "🔍"
        }
    }
}

enum ConfidenceRating: String, Codable {
    case high    = "High"
    case medium  = "Medium"
    case low     = "Low"
    case unknown = "Unknown"

    var color: Color {
        switch self {
        case .high:    return Color(hex: "#27AE60")
        case .medium:  return Color(hex: "#F39C12")
        case .low:     return Color(hex: "#E74C3C")
        case .unknown: return Color(hex: "#95A5A6")
        }
    }
}

// MARK: - Analysis Result Models

struct EvidenceItem: Codable, Identifiable {
    let id: UUID
    let description: String
    let supports: Bool
    let citation: String?
    let qualityScore: Double
    let label: ClaimLabel

    init(description: String, supports: Bool, citation: String? = nil, qualityScore: Double = 0.5, label: ClaimLabel = .evidence) {
        self.id = UUID()
        self.description = description
        self.supports = supports
        self.citation = citation
        self.qualityScore = qualityScore
        self.label = label
    }
}

struct CollapseTest: Codable, Identifiable {
    let id: UUID
    let testName: CollapseTestName
    let result: CollapseTestResult
    let explanation: String
    let citations: [String]

    init(testName: CollapseTestName, result: CollapseTestResult, explanation: String, citations: [String] = []) {
        self.id = UUID()
        self.testName = testName
        self.result = result
        self.explanation = explanation
        self.citations = citations
    }
}

struct FrameworkInsight: Codable, Identifiable {
    let id: UUID
    let framework: AnalysisFramework
    let insights: [String]
    let influenceOnConclusion: String
    let labels: [ClaimLabel]

    init(framework: AnalysisFramework, insights: [String], influenceOnConclusion: String, labels: [ClaimLabel]) {
        self.id = UUID()
        self.framework = framework
        self.insights = insights
        self.influenceOnConclusion = influenceOnConclusion
        self.labels = labels
    }
}

// MARK: - Full Analysis Module

struct BeliefAnalysis: Codable, Identifiable {
    let id: UUID
    let createdAt: Date
    let belief: String
    let beliefType: BeliefType
    let selectedFrameworks: [AnalysisFramework]

    // Sections
    let whyFeelsTrue: String
    let scrutinyGap: String
    let origin: String
    let incentivesPowerMap: String
    let psychologicalHooks: String
    let structuralReinforcement: String

    // Analysis
    let evidence: [EvidenceItem]
    let collapseTests: [CollapseTest]
    let frameworkInsights: [FrameworkInsight]

    // Verdict
    let mostLikelyIs: String
    let confidenceRating: ConfidenceRating
    let whatRemainsUnknown: String
    let practicalAuditQuestions: [String]
    let outcome: AnalysisOutcome
    let isOfflineMode: Bool

    init(
        belief: String,
        beliefType: BeliefType,
        selectedFrameworks: [AnalysisFramework],
        whyFeelsTrue: String,
        scrutinyGap: String,
        origin: String,
        incentivesPowerMap: String,
        psychologicalHooks: String,
        structuralReinforcement: String,
        evidence: [EvidenceItem],
        collapseTests: [CollapseTest],
        frameworkInsights: [FrameworkInsight],
        mostLikelyIs: String,
        confidenceRating: ConfidenceRating,
        whatRemainsUnknown: String,
        practicalAuditQuestions: [String],
        outcome: AnalysisOutcome,
        isOfflineMode: Bool = false
    ) {
        self.id = UUID()
        self.createdAt = Date()
        self.belief = belief
        self.beliefType = beliefType
        self.selectedFrameworks = selectedFrameworks
        self.whyFeelsTrue = whyFeelsTrue
        self.scrutinyGap = scrutinyGap
        self.origin = origin
        self.incentivesPowerMap = incentivesPowerMap
        self.psychologicalHooks = psychologicalHooks
        self.structuralReinforcement = structuralReinforcement
        self.evidence = evidence
        self.collapseTests = collapseTests
        self.frameworkInsights = frameworkInsights
        self.mostLikelyIs = mostLikelyIs
        self.confidenceRating = confidenceRating
        self.whatRemainsUnknown = whatRemainsUnknown
        self.practicalAuditQuestions = practicalAuditQuestions
        self.outcome = outcome
        self.isOfflineMode = isOfflineMode
    }

    // Aggregated collapse score
    var collapseScore: Double {
        guard !collapseTests.isEmpty else { return 0.5 }
        let passes = Double(collapseTests.filter { $0.result == .pass }.count)
        let fails  = Double(collapseTests.filter { $0.result == .fail }.count)
        let total  = Double(collapseTests.count)
        let frameworkDepth = frameworkInsights.isEmpty ? 1.0 :
            Double(frameworkInsights.reduce(0) { $0 + $1.insights.count }) / Double(frameworkInsights.count)
        return (passes / total) * 0.6 + (1.0 - fails / total) * 0.3 + min(frameworkDepth / 5.0, 1.0) * 0.1
    }

    var inconclusiveRatio: Double {
        guard !collapseTests.isEmpty else { return 1.0 }
        return Double(collapseTests.filter { $0.result == .inconclusive }.count) / Double(collapseTests.count)
    }
}

// MARK: - Input State

struct BeliefAnalyzerInput {
    var belief: String = ""
    var detectedType: BeliefType = .other
    var selectedFrameworks: [AnalysisFramework] = []
    var advancedMode: Bool = false
    var isAnalyzing: Bool = false
    var error: String? = nil
}
