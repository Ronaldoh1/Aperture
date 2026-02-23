// BeliefAnalyzerService.swift
// SunFlow: Reignited — Aperture
// Reality Decoded: AI-powered belief analysis via Anthropic API + offline fallback

import Foundation
import Combine
import Network

// MARK: - Service Protocol

protocol BeliefAnalyzerServiceType {
    func analyze(belief: String, frameworks: [AnalysisFramework], beliefType: BeliefType) async throws -> BeliefAnalysis
    func classifyBelief(_ text: String) async -> BeliefType
    var isOnline: Bool { get }
}

// MARK: - Service Implementation

final class BeliefAnalyzerService: BeliefAnalyzerServiceType {

    static let shared = BeliefAnalyzerService()

    private let monitor = NWPathMonitor()
    private(set) var isOnline: Bool = true

    // Replace with your Anthropic API key (or load from Keychain/Config)
    // For production: store in Keychain, never hardcode
    private let apiKey: String = {
        // Load from KeychainManager or Config plist
        if let key = KeychainManager.shared.getString(forKey: .apiKey) { return key }
        return "" // Set your key via KeychainManager.shared.save("sk-ant-...", forKey: .apiKey)
    }()

    private let apiURL = URL(string: "https://api.anthropic.com/v1/messages")!
    private let model  = "claude-opus-4-6"

    private init() {
        monitor.pathUpdateHandler = { [weak self] path in
            self?.isOnline = path.status == .satisfied
        }
        monitor.start(queue: DispatchQueue(label: "belief.network"))
    }

    // MARK: - Classify Belief Type (lightweight)

    func classifyBelief(_ text: String) async -> BeliefType {
        let lower = text.lowercased()
        let keywords: [(BeliefType, [String])] = [
            (.religious,     ["god", "divine", "church", "prayer", "faith", "heaven", "sin", "prophet", "scripture", "holy", "sacred", "allah", "christ", "karma", "soul"]),
            (.economic,      ["money", "market", "economy", "capital", "wealth", "profit", "tax", "trade", "bank", "inflation", "growth", "work"]),
            (.political,     ["government", "democracy", "power", "vote", "election", "law", "freedom", "rights", "war", "state", "policy", "leader"]),
            (.psychological, ["mind", "trauma", "fear", "anxiety", "ego", "behavior", "emotion", "confidence", "happiness", "memory"]),
            (.cultural,      ["tradition", "culture", "race", "gender", "history", "identity", "community", "norm", "society", "art"]),
        ]
        var scores: [BeliefType: Int] = [:]
        for (type, words) in keywords {
            scores[type] = words.filter { lower.contains($0) }.count
        }
        return scores.max(by: { $0.value < $1.value })?.key ?? .other
    }

    // MARK: - Main Analysis

    func analyze(belief: String, frameworks: [AnalysisFramework], beliefType: BeliefType) async throws -> BeliefAnalysis {
        if isOnline && !apiKey.isEmpty {
            return try await analyzeOnline(belief: belief, frameworks: frameworks, beliefType: beliefType)
        } else {
            return try await analyzeOffline(belief: belief, frameworks: frameworks, beliefType: beliefType)
        }
    }

    // MARK: - Online: Claude API

    private func analyzeOnline(belief: String, frameworks: [AnalysisFramework], beliefType: BeliefType) async throws -> BeliefAnalysis {
        let frameworkList = frameworks.map { $0.rawValue }.joined(separator: ", ")
        let prompt = buildPrompt(belief: belief, frameworks: frameworkList, beliefType: beliefType)

        var request = URLRequest(url: apiURL)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(apiKey, forHTTPHeaderField: "x-api-key")
        request.setValue("2023-06-01", forHTTPHeaderField: "anthropic-version")

        let body: [String: Any] = [
            "model": model,
            "max_tokens": 4096,
            "messages": [
                ["role": "user", "content": prompt]
            ]
        ]

        request.httpBody = try JSONSerialization.data(withJSONObject: body)

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            // Fallback to offline if API fails
            return try await analyzeOffline(belief: belief, frameworks: frameworks, beliefType: beliefType)
        }

        let apiResponse = try JSONDecoder().decode(AnthropicResponse.self, from: data)
        let rawText = apiResponse.content.first?.text ?? ""

        return parseAnalysisResponse(rawText, belief: belief, beliefType: beliefType, frameworks: frameworks, isOffline: false)
    }

    // MARK: - Prompt Builder

    private func buildPrompt(belief: String, frameworks: String, beliefType: BeliefType) -> String {
        """
        You are SunFlow's Reality Decoder — a rigorous, neutral belief analysis engine. Analyze the following belief with intellectual honesty and zero bias toward confirming or denying it.

        BELIEF: "\(belief)"
        TYPE: \(beliefType.displayName)
        ANALYTICAL FRAMEWORKS: \(frameworks)

        Respond ONLY with a valid JSON object matching this exact structure. Label every claim as [Evidence], [Inference], or [Speculation]:

        {
          "whyFeelsTrue": "string — psychological/social appeal of this belief [Evidence/Inference/Speculation labeled inline]",
          "scrutinyGap": "string — what conditions allow this belief to persist without challenge",
          "origin": "string — historical/cultural roots",
          "incentivesPowerMap": "string — who benefits from this belief being held",
          "psychologicalHooks": "string — cognitive biases and emotional triggers involved",
          "structuralReinforcement": "string — systems, institutions, media that sustain it",
          "evidence": [
            {"description": "string", "supports": true/false, "citation": "string or null", "qualityScore": 0.0-1.0, "label": "Evidence|Inference|Speculation"}
          ],
          "collapseTests": [
            {"testName": "Evidence Robustness|Incentive Distortion Risk|Punishment of Dissent|Transparency Level|Historical Reversals|Predictive Accuracy", "result": "pass|fail|inconclusive", "explanation": "string"}
          ],
          "frameworkInsights": [
            {"framework": "framework name exactly as given", "insights": ["string", "string"], "influenceOnConclusion": "string", "labels": ["Evidence|Inference|Speculation"]}
          ],
          "mostLikelyIs": "string — best explanation given available evidence",
          "confidenceRating": "High|Medium|Low|Unknown",
          "whatRemainsUnknown": "string",
          "practicalAuditQuestions": ["string x 5-7"],
          "outcome": "Survives scrutiny|Partially survives|Collapses under scrutiny|Insufficient evidence"
        }

        Rules:
        - Be intellectually honest. Do not confirm or deny based on ideology.
        - Label every factual claim with [Evidence], every reasoned leap with [Inference], every conjecture with [Speculation].
        - Provide evidence BOTH supporting and contradicting the belief.
        - All 6 collapse tests must be included.
        - Framework insights must correspond to the frameworks listed above.
        - Respond ONLY with the JSON object. No preamble, no markdown fences.
        """
    }

    // MARK: - Parse API Response

    private func parseAnalysisResponse(
        _ json: String,
        belief: String,
        beliefType: BeliefType,
        frameworks: [AnalysisFramework],
        isOffline: Bool
    ) -> BeliefAnalysis {
        guard let data = json.data(using: .utf8),
              let raw = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else {
            return fallbackAnalysis(belief: belief, beliefType: beliefType, frameworks: frameworks, isOffline: isOffline)
        }

        // Evidence
        let evidenceRaw = raw["evidence"] as? [[String: Any]] ?? []
        let evidence: [EvidenceItem] = evidenceRaw.compactMap { dict in
            guard let desc = dict["description"] as? String else { return nil }
            let supports = dict["supports"] as? Bool ?? true
            let citation = dict["citation"] as? String
            let quality  = dict["qualityScore"] as? Double ?? 0.5
            let labelStr = dict["label"] as? String ?? "Evidence"
            let label    = ClaimLabel(rawValue: labelStr) ?? .evidence
            return EvidenceItem(description: desc, supports: supports, citation: citation, qualityScore: quality, label: label)
        }

        // Collapse Tests
        let testsRaw = raw["collapseTests"] as? [[String: Any]] ?? []
        let collapseTests: [CollapseTest] = CollapseTestName.allCases.compactMap { testName in
            if let match = testsRaw.first(where: { ($0["testName"] as? String) == testName.rawValue }) {
                let resultStr = match["result"] as? String ?? "inconclusive"
                let result    = CollapseTestResult(rawValue: resultStr) ?? .inconclusive
                let explanation = match["explanation"] as? String ?? "Analysis inconclusive."
                return CollapseTest(testName: testName, result: result, explanation: explanation)
            }
            return CollapseTest(testName: testName, result: .inconclusive, explanation: "Insufficient data for this test.")
        }

        // Framework Insights
        let insightsRaw = raw["frameworkInsights"] as? [[String: Any]] ?? []
        let frameworkInsights: [FrameworkInsight] = insightsRaw.compactMap { dict in
            guard let fwName = dict["framework"] as? String,
                  let fw = frameworks.first(where: { $0.rawValue == fwName }),
                  let insights = dict["insights"] as? [String] else { return nil }
            let influence = dict["influenceOnConclusion"] as? String ?? ""
            let labelsRaw = dict["labels"] as? [String] ?? ["Inference"]
            let labels    = labelsRaw.compactMap { ClaimLabel(rawValue: $0) }
            return FrameworkInsight(framework: fw, insights: insights, influenceOnConclusion: influence, labels: labels)
        }

        // Verdict
        let outcomeStr    = raw["outcome"] as? String ?? "Insufficient evidence"
        let confidenceStr = raw["confidenceRating"] as? String ?? "Unknown"
        let outcome    = AnalysisOutcome(rawValue: outcomeStr) ?? .insufficient
        let confidence = ConfidenceRating(rawValue: confidenceStr) ?? .unknown
        let auditQs    = raw["practicalAuditQuestions"] as? [String] ?? []

        return BeliefAnalysis(
            belief: belief,
            beliefType: beliefType,
            selectedFrameworks: frameworks,
            whyFeelsTrue:             raw["whyFeelsTrue"] as? String ?? "",
            scrutinyGap:              raw["scrutinyGap"] as? String ?? "",
            origin:                   raw["origin"] as? String ?? "",
            incentivesPowerMap:       raw["incentivesPowerMap"] as? String ?? "",
            psychologicalHooks:       raw["psychologicalHooks"] as? String ?? "",
            structuralReinforcement:  raw["structuralReinforcement"] as? String ?? "",
            evidence:                 evidence,
            collapseTests:            collapseTests,
            frameworkInsights:        frameworkInsights,
            mostLikelyIs:             raw["mostLikelyIs"] as? String ?? "",
            confidenceRating:         confidence,
            whatRemainsUnknown:       raw["whatRemainsUnknown"] as? String ?? "",
            practicalAuditQuestions:  auditQs,
            outcome:                  outcome,
            isOfflineMode:            isOffline
        )
    }

    // MARK: - Offline Analysis (packaged KB patterns)

    private func analyzeOffline(belief: String, frameworks: [AnalysisFramework], beliefType: BeliefType) async throws -> BeliefAnalysis {
        // Simulate processing delay
        try await Task.sleep(nanoseconds: 1_500_000_000)

        let defaultFrameworkInsights: [FrameworkInsight] = frameworks.prefix(5).map { fw in
            FrameworkInsight(
                framework: fw,
                insights: offlineInsights(for: fw, belief: belief),
                influenceOnConclusion: "This lens reveals patterns consistent with \(beliefType.displayName.lowercased()) belief formation.",
                labels: [.inference, .speculation]
            )
        }

        let collapseTests: [CollapseTest] = [
            CollapseTest(testName: .evidenceRobustness,   result: .inconclusive, explanation: "[Offline Mode] Evidence quality cannot be verified without real-time retrieval. Treat as requiring online analysis for full confidence."),
            CollapseTest(testName: .incentiveDistortion,  result: .inconclusive, explanation: "[Offline Mode] Incentive mapping requires live context. Offline analysis uses pattern matching only."),
            CollapseTest(testName: .punishmentOfDissent,  result: .inconclusive, explanation: "[Offline Mode] Historical dissent data requires online retrieval for this specific belief."),
            CollapseTest(testName: .transparencyLevel,    result: .inconclusive, explanation: "[Offline Mode] Transparency audit requires full context access."),
            CollapseTest(testName: .historicalReversals,  result: .inconclusive, explanation: "[Offline Mode] Historical pattern matching limited to packaged knowledge base."),
            CollapseTest(testName: .predictiveAccuracy,   result: .inconclusive, explanation: "[Offline Mode] Predictive track record requires real-time data.")
        ]

        return BeliefAnalysis(
            belief: belief,
            beliefType: beliefType,
            selectedFrameworks: frameworks,
            whyFeelsTrue: "[Offline Mode] This belief likely persists because of social reinforcement, emotional resonance, and alignment with pre-existing worldviews — core drivers of belief adoption across all categories. [Inference]",
            scrutinyGap: "[Offline Mode] The primary scrutiny gap is the separation between the feeling of certainty and the availability of verifiable evidence. [Inference]",
            origin: "[Offline Mode] Requires online retrieval for specific historical origin analysis.",
            incentivesPowerMap: "[Offline Mode] Power mapping unavailable without real-time data. Re-run online for full analysis.",
            psychologicalHooks: "[Offline Mode] Common hooks: confirmation bias, authority bias, social proof, sunk cost fallacy. [Evidence — cognitive science literature]",
            structuralReinforcement: "[Offline Mode] Institutional reinforcement patterns detected in most belief systems analyzed.",
            evidence: [
                EvidenceItem(description: "[Offline Mode] Limited to packaged knowledge. Connect to internet for full evidence retrieval.", supports: true, citation: nil, qualityScore: 0.3, label: .speculation)
            ],
            collapseTests: collapseTests,
            frameworkInsights: defaultFrameworkInsights,
            mostLikelyIs: "[Offline Mode] Analysis incomplete. For full reality decoding, run analysis with internet connection.",
            confidenceRating: .low,
            whatRemainsUnknown: "Everything requiring real-time data retrieval. This is a partial offline analysis only.",
            practicalAuditQuestions: [
                "Who benefits if I believe this?",
                "What evidence would change my mind?",
                "Who is punished for questioning this?",
                "Can this belief be falsified? How?",
                "What would I believe if I grew up in a different culture?"
            ],
            outcome: .insufficient,
            isOfflineMode: true
        )
    }

    // MARK: - Offline Insight Patterns

    private func offlineInsights(for framework: AnalysisFramework, belief: String) -> [String] {
        switch framework {
        case .cognitivebias:
            return ["Confirmation bias likely plays a role in sustaining this belief [Inference]", "Availability heuristic may amplify perceived frequency of supporting evidence [Inference]"]
        case .incentiveTheory:
            return ["Someone has a material or social incentive to promote this belief [Inference]", "Identifying who benefits most reveals structural motivation [Inference]"]
        case .socialIdentity:
            return ["Belief reinforces in-group identity and tribal cohesion [Evidence — social psychology]", "Questioning may feel like a threat to identity, not just ideas [Evidence]"]
        case .bayesianUpdating:
            return ["New evidence should update the probability this belief is true [Evidence — Bayesian framework]", "Prior probability depends heavily on cultural exposure [Inference]"]
        case .institutionalCapture:
            return ["Institutions often sustain beliefs that justify their authority [Inference]", "Check whether the institution that promotes this belief also benefits from its acceptance [Inference]"]
        default:
            return ["Pattern analysis limited in offline mode [Speculation]", "Full \(framework.rawValue) analysis requires online processing [Inference]"]
        }
    }
}

// MARK: - Anthropic API Response Model

private struct AnthropicResponse: Codable {
    let content: [ContentBlock]

    struct ContentBlock: Codable {
        let type: String
        let text: String
    }
}

// MARK: - Fallback Analysis

private func fallbackAnalysis(belief: String, beliefType: BeliefType, frameworks: [AnalysisFramework], isOffline: Bool) -> BeliefAnalysis {
    BeliefAnalysis(
        belief: belief,
        beliefType: beliefType,
        selectedFrameworks: frameworks,
        whyFeelsTrue: "Analysis could not be parsed. Try again with a clearer belief statement.",
        scrutinyGap: "N/A",
        origin: "N/A",
        incentivesPowerMap: "N/A",
        psychologicalHooks: "N/A",
        structuralReinforcement: "N/A",
        evidence: [],
        collapseTests: CollapseTestName.allCases.map {
            CollapseTest(testName: $0, result: .inconclusive, explanation: "Parse error — re-run analysis.")
        },
        frameworkInsights: [],
        mostLikelyIs: "Analysis failed. Please try again.",
        confidenceRating: .unknown,
        whatRemainsUnknown: "Everything — analysis could not be completed.",
        practicalAuditQuestions: [],
        outcome: .insufficient,
        isOfflineMode: isOffline
    )
}
