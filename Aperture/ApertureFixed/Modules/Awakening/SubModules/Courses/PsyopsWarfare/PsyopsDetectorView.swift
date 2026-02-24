// PsyopsDetectorView.swift
// SunFlow: Reignited — Aperture
// Psychological Warfare Detector — AI-powered. Unlocked after completing all 10 psyops lessons.

import SwiftUI

// MARK: - Detection Result

struct PsyopsDetectionResult: Identifiable {
    let id = UUID()
    let manipulationScore: Int          // 0-100
    let verdict: String
    let biasesTargeted: [String]
    let signaturesFound: [PsyopsSignature]
    let probableIntent: String
    let sourceAnalysis: String
    let recommendation: String
    let rawAnalysis: String
}

struct PsyopsSignature: Identifiable {
    let id = UUID()
    let name: String
    let found: Bool
    let evidence: String
}

// MARK: - Main View

struct PsyopsDetectorView: View {
    @Environment(\.dismiss) var dismiss

    // Unlock gate
    private var isUnlocked: Bool {
        let progress = PsyopsProgress.load()
        return progress.completedLessons.count >= psyopsLessons.count
    }

    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 0.03, green: 0.02, blue: 0.05).ignoresSafeArea()
                if isUnlocked {
                    DetectorActiveView()
                } else {
                    DetectorLockedView()
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button { dismiss() } label: {
                        Image(systemName: "chevron.left").foregroundColor(.white)
                    }
                }
                ToolbarItem(placement: .principal) {
                    HStack(spacing: 6) {
                        Image(systemName: isUnlocked ? "eye.fill" : "lock.fill")
                            .font(.system(size: 12)).foregroundColor(isUnlocked ? Color(hex: "#E74C3C") : .white.opacity(0.4))
                        Text("Psyops Detector").font(.system(size: 16, weight: .bold)).foregroundColor(.white)
                    }
                }
            }
        }
    }
}

// MARK: - Locked State

struct DetectorLockedView: View {
    @State private var pulseAnim = false
    private let accent = Color(hex: "#E74C3C")

    private var completedCount: Int { PsyopsProgress.load().completedLessons.count }
    private var totalNeeded: Int { psyopsLessons.count }
    private var pct: Double { Double(completedCount) / Double(totalNeeded) }

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 28) {
                Spacer().frame(height: 20)
                lockAnimation
                lockMessage
                progressToUnlock
                lessonStatus
                Spacer(minLength: 40)
            }
            .padding(.horizontal, 24)
        }
    }

    private var lockAnimation: some View {
        ZStack {
            ForEach(0..<4) { i in
                Circle()
                    .stroke(accent.opacity(pulseAnim ? 0.04 : 0.12), lineWidth: 1)
                    .frame(width: CGFloat(70 + i * 35), height: CGFloat(70 + i * 35))
                    .scaleEffect(pulseAnim ? 1.15 : 1.0)
                    .animation(.easeInOut(duration: 2.5).delay(Double(i) * 0.35).repeatForever(autoreverses: true), value: pulseAnim)
            }
            VStack(spacing: 6) {
                Image(systemName: "lock.shield.fill")
                    .font(.system(size: 44)).foregroundColor(accent.opacity(0.7))
                Text("CLASSIFIED").font(.system(size: 10, weight: .black)).tracking(4).foregroundColor(accent.opacity(0.5))
            }
        }
        .frame(height: 180)
        .onAppear { withAnimation { pulseAnim = true } }
    }

    private var lockMessage: some View {
        VStack(spacing: 12) {
            Text("Psychological Warfare\nDetector").font(.system(size: 26, weight: .black)).foregroundColor(.white).multilineTextAlignment(.center)
            Text("AI-powered analysis of any text, headline, speech, or social media post for manipulation signatures, targeted biases, and probable intent.")
                .font(.system(size: 14)).foregroundColor(.white.opacity(0.5)).multilineTextAlignment(.center).lineSpacing(4)
            Text("This tool is unlocked by completing the Psyops Master Course.\nYou can't wield the detector until you know what you're detecting.")
                .font(.system(size: 12)).foregroundColor(accent.opacity(0.7)).multilineTextAlignment(.center).lineSpacing(4)
                .padding(14)
                .background(RoundedRectangle(cornerRadius: 12).fill(accent.opacity(0.06))
                    .overlay(RoundedRectangle(cornerRadius: 12).stroke(accent.opacity(0.2), lineWidth: 1)))
        }
    }

    private var progressToUnlock: some View {
        VStack(spacing: 10) {
            HStack {
                Text("UNLOCK PROGRESS").font(.system(size: 10, weight: .black)).tracking(2).foregroundColor(.white.opacity(0.4))
                Spacer()
                Text("\(completedCount)/\(totalNeeded) lessons").font(.system(size: 12, weight: .bold)).foregroundColor(accent)
            }
            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 4).fill(Color.white.opacity(0.06)).frame(height: 8)
                    RoundedRectangle(cornerRadius: 4).fill(accent).frame(width: geo.size.width * pct, height: 8)
                }
            }
            .frame(height: 8)
            Text("\(totalNeeded - completedCount) lessons remaining to unlock the detector")
                .font(.system(size: 11)).foregroundColor(.white.opacity(0.35))
        }
        .padding(16)
        .background(RoundedRectangle(cornerRadius: 14).fill(Color.white.opacity(0.03)))
    }

    private var lessonStatus: some View {
        let progress = PsyopsProgress.load()
        return VStack(alignment: .leading, spacing: 8) {
            Text("LESSON STATUS").font(.system(size: 10, weight: .black)).tracking(2).foregroundColor(.white.opacity(0.4))
            ForEach(psyopsLessons) { lesson in
                let done = progress.completedLessons.contains(lesson.id)
                HStack(spacing: 10) {
                    Image(systemName: done ? "checkmark.circle.fill" : "circle")
                        .font(.system(size: 14))
                        .foregroundColor(done ? lesson.module.color : .white.opacity(0.2))
                    Text("L\(lesson.number) · \(lesson.title)").font(.system(size: 12)).foregroundColor(done ? .white.opacity(0.7) : .white.opacity(0.3))
                    Spacer()
                    if done { Text("✓").font(.system(size: 11, weight: .bold)).foregroundColor(lesson.module.color) }
                }
            }
        }
        .padding(16)
        .background(RoundedRectangle(cornerRadius: 14).fill(Color.white.opacity(0.03)))
    }
}

// MARK: - Active Detector

struct DetectorActiveView: View {
    @State private var inputText = ""
    @State private var isAnalyzing = false
    @State private var result: PsyopsDetectionResult? = nil
    @State private var errorMessage: String? = nil
    @State private var showHistory = false
    @State private var analysisHistory: [PsyopsDetectionResult] = []

    private let accent = Color(hex: "#E74C3C")
    private let maxChars = 2000

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
                detectorHeader
                inputSection
                if isAnalyzing { analyzingIndicator }
                if let err = errorMessage { errorCard(err) }
                if let res = result { ResultCard(result: res, accent: accent) }
                if !analysisHistory.isEmpty { historySection }
                Spacer(minLength: 40)
            }
            .padding(.horizontal, 18)
            .padding(.top, 12)
        }
    }

    private var detectorHeader: some View {
        HStack(spacing: 12) {
            ZStack {
                Circle().fill(accent.opacity(0.15)).frame(width: 48, height: 48)
                Image(systemName: "eye.fill").font(.system(size: 22)).foregroundColor(accent)
            }
            VStack(alignment: .leading, spacing: 3) {
                Text("DETECTOR ONLINE").font(.system(size: 10, weight: .black)).tracking(2).foregroundColor(accent)
                Text("Paste any text for AI analysis").font(.system(size: 14)).foregroundColor(.white.opacity(0.7))
                Text("Headlines · Speeches · Social posts · Articles · Emails")
                    .font(.system(size: 10)).foregroundColor(.white.opacity(0.35))
            }
            Spacer()
        }
        .padding(14)
        .background(RoundedRectangle(cornerRadius: 14).fill(accent.opacity(0.06))
            .overlay(RoundedRectangle(cornerRadius: 14).stroke(accent.opacity(0.2), lineWidth: 1)))
    }

    private var inputSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text("INPUT TEXT").font(.system(size: 10, weight: .black)).tracking(2).foregroundColor(.white.opacity(0.4))
                Spacer()
                Text("\(inputText.count)/\(maxChars)").font(.system(size: 10)).foregroundColor(.white.opacity(0.3))
            }

            TextEditor(text: $inputText)
                .font(.system(size: 13))
                .foregroundColor(.white)
                .scrollContentBackground(.hidden)
                .frame(minHeight: 140, maxHeight: 220)
                .padding(12)
                .background(RoundedRectangle(cornerRadius: 12).fill(Color.white.opacity(0.04))
                    .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.white.opacity(0.08), lineWidth: 1)))
                .onChange(of: inputText) { _, newVal in
                    if newVal.count > maxChars { inputText = String(newVal.prefix(maxChars)) }
                }

            exampleButtons
            analyzeButton
        }
    }

    private var exampleButtons: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                Text("Try:").font(.system(size: 11)).foregroundColor(.white.opacity(0.3))
                ForEach(exampleTexts, id: \.label) { ex in
                    Button {
                        inputText = ex.text
                        result = nil
                        errorMessage = nil
                    } label: {
                        Text(ex.label).font(.system(size: 11, weight: .medium))
                            .foregroundColor(.white.opacity(0.6)).padding(.horizontal, 10).padding(.vertical, 5)
                            .background(Color.white.opacity(0.05)).clipShape(Capsule())
                    }
                }
            }
        }
    }

    private var analyzeButton: some View {
        Button {
            guard !inputText.trimmingCharacters(in: .whitespaces).isEmpty else { return }
            analyzeText()
        } label: {
            HStack(spacing: 8) {
                Image(systemName: isAnalyzing ? "circle.dotted" : "waveform.path.ecg.rectangle.fill")
                    .font(.system(size: 16))
                Text(isAnalyzing ? "Analyzing..." : "Run Psyops Analysis")
                    .font(.system(size: 15, weight: .black))
            }
            .foregroundColor(.black)
            .frame(maxWidth: .infinity).padding(.vertical, 14)
            .background(inputText.isEmpty || isAnalyzing
                ? RoundedRectangle(cornerRadius: 14).fill(Color.white.opacity(0.15))
                : RoundedRectangle(cornerRadius: 14).fill(accent))
        }
        .disabled(inputText.isEmpty || isAnalyzing)
    }

    private var analyzingIndicator: some View {
        HStack(spacing: 12) {
            ProgressView().tint(accent)
            VStack(alignment: .leading, spacing: 3) {
                Text("Scanning for manipulation signatures...").font(.system(size: 13)).foregroundColor(.white.opacity(0.7))
                Text("Analyzing bias exploitation, intent patterns, emotional engineering")
                    .font(.system(size: 11)).foregroundColor(.white.opacity(0.4))
            }
        }
        .padding(16)
        .background(RoundedRectangle(cornerRadius: 12).fill(Color.white.opacity(0.04)))
    }

    private func errorCard(_ message: String) -> some View {
        HStack(spacing: 10) {
            Image(systemName: "exclamationmark.triangle.fill").foregroundColor(.orange)
            Text(message).font(.system(size: 13)).foregroundColor(.orange)
        }
        .padding(14)
        .background(RoundedRectangle(cornerRadius: 12).fill(Color.orange.opacity(0.08)))
    }

    private var historySection: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("RECENT ANALYSES").font(.system(size: 10, weight: .black)).tracking(2).foregroundColor(.white.opacity(0.4))
            ForEach(analysisHistory.prefix(3)) { r in
                HStack(spacing: 12) {
                    ScoreBadge(score: r.manipulationScore, size: 36)
                    VStack(alignment: .leading, spacing: 2) {
                        Text(r.verdict).font(.system(size: 12, weight: .bold)).foregroundColor(.white).lineLimit(1)
                        Text(r.probableIntent).font(.system(size: 11)).foregroundColor(.white.opacity(0.4)).lineLimit(1)
                    }
                    Spacer()
                }
                .padding(12)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.03)))
            }
        }
    }

    private func analyzeText() {
        isAnalyzing = true
        errorMessage = nil
        result = nil

        let prompt = """
You are a psychological operations analyst trained in cognitive bias exploitation, propaganda techniques, and information warfare. Analyze the following text for psychological manipulation.

TEXT TO ANALYZE:
---
\(inputText)
---

Respond with a JSON object in exactly this format (no markdown, no backticks, raw JSON only):
{
  "manipulation_score": <integer 0-100>,
  "verdict": "<one compelling sentence verdict>",
  "biases_targeted": ["<bias1>", "<bias2>"],
  "signatures": [
    {"name": "Emotional Before Facts", "found": true/false, "evidence": "<brief evidence or 'Not detected'>"},
    {"name": "Manufactured Urgency", "found": true/false, "evidence": "<brief evidence or 'Not detected'>"},
    {"name": "Us vs Them Binary", "found": true/false, "evidence": "<brief evidence or 'Not detected'>"},
    {"name": "Social Proof Pressure", "found": true/false, "evidence": "<brief evidence or 'Not detected'>"},
    {"name": "Perfect Villain Frame", "found": true/false, "evidence": "<brief evidence or 'Not detected'>"},
    {"name": "Authority Mimicry", "found": true/false, "evidence": "<brief evidence or 'Not detected'>"},
    {"name": "Fear Then Solution", "found": true/false, "evidence": "<brief evidence or 'Not detected'>"},
    {"name": "Overton Shift", "found": true/false, "evidence": "<brief evidence or 'Not detected'>"}
  ],
  "probable_intent": "<what behavior or belief is this trying to produce>",
  "source_analysis": "<who likely created this and why>",
  "recommendation": "<one actionable defense for the reader>",
  "raw_analysis": "<2-3 sentence neutral summary of what you found>"
}
"""

        Task {
            do {
                let response = try await callClaudeAPI(prompt: prompt)
                let cleaned = response.trimmingCharacters(in: .whitespacesAndNewlines)
                    .replacingOccurrences(of: "```json", with: "")
                    .replacingOccurrences(of: "```", with: "")
                    .trimmingCharacters(in: .whitespacesAndNewlines)

                guard let data = cleaned.data(using: .utf8),
                      let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                    await MainActor.run {
                        errorMessage = "Could not parse analysis. Try again."
                        isAnalyzing = false
                    }
                    return
                }

                let parsed = parseDetectionResult(json: json)
                await MainActor.run {
                    result = parsed
                    if let r = result { analysisHistory.insert(r, at: 0) }
                    isAnalyzing = false
                }
            } catch {
                await MainActor.run {
                    errorMessage = "Analysis failed: \(error.localizedDescription)"
                    isAnalyzing = false
                }
            }
        }
    }

    private func callClaudeAPI(prompt: String) async throws -> String {
        var request = URLRequest(url: URL(string: "https://api.anthropic.com/v1/messages")!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let body: [String: Any] = [
            "model": "claude-sonnet-4-20250514",
            "max_tokens": 1200,
            "messages": [["role": "user", "content": prompt]]
        ]
        request.httpBody = try JSONSerialization.data(withJSONObject: body)
        let (data, _) = try await URLSession.shared.data(for: request)
        let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
        let content = (json?["content"] as? [[String: Any]])?.first
        return (content?["text"] as? String) ?? ""
    }

    private func parseDetectionResult(json: [String: Any]) -> PsyopsDetectionResult {
        let score = json["manipulation_score"] as? Int ?? 50
        let sigRaw = json["signatures"] as? [[String: Any]] ?? []
        let sigs = sigRaw.map { s -> PsyopsSignature in
            PsyopsSignature(
                name: s["name"] as? String ?? "",
                found: s["found"] as? Bool ?? false,
                evidence: s["evidence"] as? String ?? ""
            )
        }
        return PsyopsDetectionResult(
            manipulationScore: score,
            verdict: json["verdict"] as? String ?? "Analysis complete",
            biasesTargeted: json["biases_targeted"] as? [String] ?? [],
            signaturesFound: sigs,
            probableIntent: json["probable_intent"] as? String ?? "",
            sourceAnalysis: json["source_analysis"] as? String ?? "",
            recommendation: json["recommendation"] as? String ?? "",
            rawAnalysis: json["raw_analysis"] as? String ?? ""
        )
    }

    private let exampleTexts: [(label: String, text: String)] = [
        (label: "BREAKING headline", text: "BREAKING: Scientists ALARMED by shocking new data the government refuses to release. Share before they delete this. What they're hiding could affect your family."),
        (label: "Clean news", text: "The city council voted 5-2 Tuesday to approve a $3.2 million road repair contract for the downtown corridor, scheduled to begin in March 2025."),
        (label: "Political speech", text: "They want to take everything from you — your freedom, your guns, your children's future. The radical left is destroying this country. Only we can stop them. Are you with us?"),
        (label: "Health claim", text: "Big Pharma DOESN'T want you to know this one natural remedy that doctors are trained to suppress. Thousands are healing themselves. The truth is being censored."),
    ]
}

// MARK: - Result Card

struct ResultCard: View {
    let result: PsyopsDetectionResult
    let accent: Color
    @State private var expanded = false

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            scoreHeader
            Divider().background(Color.white.opacity(0.08))
            verdictBlock
            signaturesGrid
            intentBlock
            if expanded { expandedDetails }
            expandToggle
        }
        .padding(16)
        .background(RoundedRectangle(cornerRadius: 16)
            .fill(Color.white.opacity(0.04))
            .overlay(RoundedRectangle(cornerRadius: 16).stroke(scoreColor(result.manipulationScore).opacity(0.3), lineWidth: 1)))
    }

    private var scoreHeader: some View {
        HStack(spacing: 14) {
            ScoreBadge(score: result.manipulationScore, size: 64)
            VStack(alignment: .leading, spacing: 6) {
                Text(scoreLabel(result.manipulationScore))
                    .font(.system(size: 11, weight: .black)).tracking(2)
                    .foregroundColor(scoreColor(result.manipulationScore))
                Text("MANIPULATION SCORE").font(.system(size: 9, weight: .black)).tracking(1.5).foregroundColor(.white.opacity(0.35))
                if !result.biasesTargeted.isEmpty {
                    HStack(spacing: 6) {
                        ForEach(result.biasesTargeted.prefix(2), id: \.self) { bias in
                            Text(bias).font(.system(size: 9, weight: .bold))
                                .foregroundColor(.black).padding(.horizontal, 6).padding(.vertical, 3)
                                .background(scoreColor(result.manipulationScore)).clipShape(Capsule())
                        }
                    }
                }
            }
            Spacer()
        }
    }

    private var verdictBlock: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("VERDICT").font(.system(size: 10, weight: .black)).tracking(2).foregroundColor(.white.opacity(0.4))
            Text(result.verdict).font(.system(size: 14, weight: .bold)).foregroundColor(.white).lineSpacing(3)
        }
    }

    private var signaturesGrid: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("SIGNATURE SCAN").font(.system(size: 10, weight: .black)).tracking(2).foregroundColor(.white.opacity(0.4))
            let found = result.signaturesFound.filter { $0.found }
            let notFound = result.signaturesFound.filter { !$0.found }
            if !found.isEmpty {
                VStack(alignment: .leading, spacing: 6) {
                    ForEach(found) { sig in
                        HStack(alignment: .top, spacing: 8) {
                            Image(systemName: "exclamationmark.triangle.fill")
                                .font(.system(size: 10)).foregroundColor(.red).padding(.top, 2)
                            VStack(alignment: .leading, spacing: 2) {
                                Text(sig.name).font(.system(size: 12, weight: .bold)).foregroundColor(.red)
                                Text(sig.evidence).font(.system(size: 11)).foregroundColor(.white.opacity(0.6)).lineSpacing(3)
                            }
                        }
                    }
                }
                .padding(10)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.red.opacity(0.06)))
            }
            if !notFound.isEmpty && expanded {
                HStack(spacing: 6) {
                    ForEach(notFound) { sig in
                        Text("✓ \(sig.name)").font(.system(size: 9)).foregroundColor(.green.opacity(0.6))
                            .padding(.horizontal, 6).padding(.vertical, 3)
                            .background(Color.green.opacity(0.05)).clipShape(Capsule())
                    }
                }
            }
        }
    }

    private var intentBlock: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("PROBABLE INTENT").font(.system(size: 10, weight: .black)).tracking(2).foregroundColor(.white.opacity(0.4))
            Text(result.probableIntent).font(.system(size: 13)).foregroundColor(.white.opacity(0.8)).lineSpacing(4)
        }
    }

    private var expandedDetails: some View {
        VStack(alignment: .leading, spacing: 14) {
            Divider().background(Color.white.opacity(0.06))
            VStack(alignment: .leading, spacing: 6) {
                Text("SOURCE ANALYSIS").font(.system(size: 10, weight: .black)).tracking(2).foregroundColor(.white.opacity(0.4))
                Text(result.sourceAnalysis).font(.system(size: 13)).foregroundColor(.white.opacity(0.75)).lineSpacing(4)
            }
            VStack(alignment: .leading, spacing: 6) {
                Text("YOUR DEFENSE").font(.system(size: 10, weight: .black)).tracking(2).foregroundColor(.green.opacity(0.7))
                HStack(alignment: .top, spacing: 8) {
                    Image(systemName: "shield.fill").font(.system(size: 14)).foregroundColor(.green)
                    Text(result.recommendation).font(.system(size: 13)).foregroundColor(.white.opacity(0.8)).lineSpacing(4)
                }
            }
            .padding(12)
            .background(RoundedRectangle(cornerRadius: 10).fill(Color.green.opacity(0.06))
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.green.opacity(0.2), lineWidth: 1)))
            VStack(alignment: .leading, spacing: 6) {
                Text("ANALYSIS SUMMARY").font(.system(size: 10, weight: .black)).tracking(2).foregroundColor(.white.opacity(0.4))
                Text(result.rawAnalysis).font(.system(size: 12)).foregroundColor(.white.opacity(0.6)).lineSpacing(4)
            }
        }
    }

    private var expandToggle: some View {
        Button { withAnimation(.spring(response: 0.3)) { expanded.toggle() } } label: {
            HStack {
                Text(expanded ? "Show Less" : "Show Full Analysis")
                    .font(.system(size: 12, weight: .bold)).foregroundColor(accent)
                Image(systemName: expanded ? "chevron.up" : "chevron.down")
                    .font(.system(size: 11)).foregroundColor(accent)
            }
            .frame(maxWidth: .infinity).padding(.vertical, 8)
            .background(accent.opacity(0.06)).clipShape(RoundedRectangle(cornerRadius: 8))
        }
    }

    private func scoreColor(_ s: Int) -> Color {
        if s < 25 { return .green }
        if s < 50 { return .yellow }
        if s < 75 { return .orange }
        return .red
    }
    private func scoreLabel(_ s: Int) -> String {
        if s < 20 { return "CLEAN CONTENT" }
        if s < 40 { return "MILD BIAS" }
        if s < 60 { return "MODERATE PSYOP" }
        if s < 80 { return "HIGH MANIPULATION" }
        return "FULL PSYOP"
    }
}

// MARK: - Score Badge

struct ScoreBadge: View {
    let score: Int
    let size: CGFloat

    private var color: Color {
        if score < 25 { return .green }
        if score < 50 { return .yellow }
        if score < 75 { return .orange }
        return .red
    }

    var body: some View {
        ZStack {
            Circle().fill(color.opacity(0.15)).frame(width: size, height: size)
            Circle().stroke(color.opacity(0.4), lineWidth: 2).frame(width: size, height: size)
            Text("\(score)").font(.system(size: size * 0.32, weight: .black)).foregroundColor(color)
        }
    }
}
