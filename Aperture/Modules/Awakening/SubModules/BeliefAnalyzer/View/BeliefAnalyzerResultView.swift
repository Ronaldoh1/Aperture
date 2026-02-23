// BeliefAnalyzerResultView.swift
// SunFlow: Reignited — Aperture
// Reality Decoded: Full Analysis Output

import SwiftUI

// MARK: - Result View

struct BeliefAnalyzerResultView: View {

    let analysis: BeliefAnalysis
    let onRunNew: () -> Void

    @State private var selectedFramework: FrameworkInsight?
    @State private var expandedSections: Set<String> = ["verdict", "collapse"]
    @State private var showFrameworkModal = false
    @State private var verdictAppeared = false

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
                // Verdict Card
                verdictCard

                // Offline warning
                if analysis.isOfflineMode {
                    offlineBanner
                }

                // Framework Tags
                frameworkTags

                // Section: Why It Feels True
                AnalysisSection(
                    id: "why",
                    title: "Why It Feels True",
                    icon: "heart.fill",
                    color: Color(hex: "#9B59B6"),
                    expanded: expandedSections.contains("why"),
                    onToggle: { toggleSection("why") }
                ) {
                    SectionText(text: analysis.whyFeelsTrue)
                }

                // Section: Origin
                AnalysisSection(
                    id: "origin",
                    title: "Origin",
                    icon: "clock.arrow.circlepath",
                    color: Color(hex: "#3498DB"),
                    expanded: expandedSections.contains("origin"),
                    onToggle: { toggleSection("origin") }
                ) {
                    SectionText(text: analysis.origin)
                }

                // Section: Scrutiny Gap
                AnalysisSection(
                    id: "gap",
                    title: "Scrutiny Gap",
                    icon: "magnifyingglass.circle.fill",
                    color: Color(hex: "#E74C3C"),
                    expanded: expandedSections.contains("gap"),
                    onToggle: { toggleSection("gap") }
                ) {
                    SectionText(text: analysis.scrutinyGap)
                }

                // Section: Incentives & Power
                AnalysisSection(
                    id: "power",
                    title: "Incentives & Power Map",
                    icon: "dollarsign.circle.fill",
                    color: Color(hex: "#27AE60"),
                    expanded: expandedSections.contains("power"),
                    onToggle: { toggleSection("power") }
                ) {
                    SectionText(text: analysis.incentivesPowerMap)
                }

                // Section: Psychological Hooks
                AnalysisSection(
                    id: "psych",
                    title: "Psychological Hooks",
                    icon: "brain.head.profile",
                    color: Color(hex: "#E67E22"),
                    expanded: expandedSections.contains("psych"),
                    onToggle: { toggleSection("psych") }
                ) {
                    SectionText(text: analysis.psychologicalHooks)
                }

                // Section: Structural Reinforcement
                AnalysisSection(
                    id: "structure",
                    title: "Structural Reinforcement",
                    icon: "building.2.fill",
                    color: Color(hex: "#1ABC9C"),
                    expanded: expandedSections.contains("structure"),
                    onToggle: { toggleSection("structure") }
                ) {
                    SectionText(text: analysis.structuralReinforcement)
                }

                // Section: Evidence
                AnalysisSection(
                    id: "evidence",
                    title: "Evidence (\(analysis.evidence.count))",
                    icon: "checkmark.seal.fill",
                    color: Color(hex: "#27AE60"),
                    expanded: expandedSections.contains("evidence"),
                    onToggle: { toggleSection("evidence") }
                ) {
                    evidenceList
                }

                // Section: Collapse Tests (always expanded)
                AnalysisSection(
                    id: "collapse",
                    title: "Collapse Tests",
                    icon: "exclamationmark.triangle.fill",
                    color: Color(hex: "#E74C3C"),
                    expanded: true,
                    onToggle: {}
                ) {
                    collapseTestGrid
                }

                // Section: Framework Insights
                AnalysisSection(
                    id: "frameworks",
                    title: "Lens Insights (\(analysis.frameworkInsights.count))",
                    icon: "eye.fill",
                    color: Color(hex: "#FF6B35"),
                    expanded: expandedSections.contains("frameworks"),
                    onToggle: { toggleSection("frameworks") }
                ) {
                    frameworkInsightsList
                }

                // Section: Verdict Detail
                AnalysisSection(
                    id: "verdict",
                    title: "Most Likely Is",
                    icon: "target",
                    color: analysis.outcome.color,
                    expanded: expandedSections.contains("verdict"),
                    onToggle: { toggleSection("verdict") }
                ) {
                    SectionText(text: analysis.mostLikelyIs)
                }

                // Section: Unknown
                AnalysisSection(
                    id: "unknown",
                    title: "What Remains Unknown",
                    icon: "questionmark.circle.fill",
                    color: Color(hex: "#95A5A6"),
                    expanded: expandedSections.contains("unknown"),
                    onToggle: { toggleSection("unknown") }
                ) {
                    SectionText(text: analysis.whatRemainsUnknown)
                }

                // Section: Audit Questions
                AnalysisSection(
                    id: "audit",
                    title: "Practical Audit Questions",
                    icon: "list.bullet.clipboard.fill",
                    color: Color(hex: "#9B59B6"),
                    expanded: expandedSections.contains("audit"),
                    onToggle: { toggleSection("audit") }
                ) {
                    auditQuestions
                }

                // Run New
                runNewButton

                Spacer(minLength: 100)
            }
            .padding(.horizontal, 20)
            .padding(.top, 8)
        }
        .sheet(isPresented: $showFrameworkModal) {
            if let fw = selectedFramework {
                FrameworkDetailModal(insight: fw)
            }
        }
    }

    // MARK: - Verdict Card

    private var verdictCard: some View {
        VStack(spacing: 16) {
            // Outcome badge
            HStack(spacing: 10) {
                Text(analysis.outcome.emoji)
                    .font(.system(size: 32))
                VStack(alignment: .leading, spacing: 2) {
                    Text(analysis.outcome.rawValue.uppercased())
                        .font(.system(size: 13, weight: .black, design: .rounded))
                        .tracking(1.5)
                        .foregroundColor(analysis.outcome.color)
                    Text(analysis.belief)
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundColor(.white)
                        .lineLimit(2)
                }
                Spacer()
                VStack(spacing: 4) {
                    Text(analysis.confidenceRating.rawValue)
                        .font(.system(size: 11, weight: .bold))
                        .foregroundColor(analysis.confidenceRating.color)
                    Text("confidence")
                        .font(.system(size: 9))
                        .foregroundColor(.white.opacity(0.4))
                }
            }

            // Score bar
            VStack(alignment: .leading, spacing: 6) {
                HStack {
                    Text("Scrutiny Score")
                        .font(.system(size: 11))
                        .foregroundColor(.white.opacity(0.5))
                    Spacer()
                    Text("\(Int(analysis.collapseScore * 100))%")
                        .font(.system(size: 11, weight: .bold))
                        .foregroundColor(analysis.outcome.color)
                }
                GeometryReader { geo in
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 4)
                            .fill(Color.white.opacity(0.08))
                            .frame(height: 6)
                        RoundedRectangle(cornerRadius: 4)
                            .fill(
                                LinearGradient(
                                    colors: [Color(hex: "#E74C3C"), Color(hex: "#F39C12"), Color(hex: "#27AE60")],
                                    startPoint: .leading, endPoint: .trailing
                                )
                            )
                            .frame(
                                width: verdictAppeared ? geo.size.width * analysis.collapseScore : 0,
                                height: 6
                            )
                            .animation(.spring(response: 1.2, dampingFraction: 0.8).delay(0.3), value: verdictAppeared)
                    }
                }
                .frame(height: 6)
            }

            // Collapse test summary
            HStack(spacing: 0) {
                let passes = analysis.collapseTests.filter { $0.result == .pass }.count
                let fails  = analysis.collapseTests.filter { $0.result == .fail }.count
                let inc    = analysis.collapseTests.filter { $0.result == .inconclusive }.count

                summaryPill(count: passes, label: "PASS", color: Color(hex: "#27AE60"))
                summaryPill(count: fails, label: "FAIL", color: Color(hex: "#E74C3C"))
                summaryPill(count: inc, label: "?", color: Color(hex: "#F39C12"))
            }
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white.opacity(0.04))
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(analysis.outcome.color.opacity(0.4), lineWidth: 1.5)
                )
        )
        .onAppear { verdictAppeared = true }
    }

    private func summaryPill(count: Int, label: String, color: Color) -> some View {
        HStack(spacing: 4) {
            Text("\(count)")
                .font(.system(size: 16, weight: .black))
                .foregroundColor(color)
            Text(label)
                .font(.system(size: 9, weight: .bold))
                .foregroundColor(color.opacity(0.7))
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 8)
        .background(color.opacity(0.08))
    }

    // MARK: - Offline Banner

    private var offlineBanner: some View {
        HStack(spacing: 8) {
            Image(systemName: "wifi.slash").font(.system(size: 12))
            Text("Offline Mode — Confidence reduced. Reconnect to run full AI analysis.")
                .font(.system(size: 12))
        }
        .foregroundColor(Color(hex: "#F39C12"))
        .padding(12)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(hex: "#F39C12").opacity(0.1))
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(hex: "#F39C12").opacity(0.3), lineWidth: 1))
        )
    }

    // MARK: - Framework Tags

    private var frameworkTags: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                ForEach(analysis.selectedFrameworks) { fw in
                    HStack(spacing: 4) {
                        Image(systemName: fw.icon).font(.system(size: 9))
                        Text(fw.rawValue).font(.system(size: 10, weight: .medium))
                    }
                    .foregroundColor(fw.category.color.opacity(0.9))
                    .padding(.horizontal, 9)
                    .padding(.vertical, 5)
                    .background(Capsule().fill(fw.category.color.opacity(0.1)))
                }
            }
        }
    }

    // MARK: - Evidence List

    private var evidenceList: some View {
        VStack(spacing: 10) {
            let supporting = analysis.evidence.filter { $0.supports }
            let contradicting = analysis.evidence.filter { !$0.supports }

            if !supporting.isEmpty {
                evidenceGroup(title: "Supporting", items: supporting, color: Color(hex: "#27AE60"))
            }
            if !contradicting.isEmpty {
                evidenceGroup(title: "Contradicting", items: contradicting, color: Color(hex: "#E74C3C"))
            }
        }
    }

    private func evidenceGroup(title: String, items: [EvidenceItem], color: Color) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title.uppercased())
                .font(.system(size: 10, weight: .bold))
                .tracking(1.5)
                .foregroundColor(color.opacity(0.7))

            ForEach(items) { item in
                HStack(alignment: .top, spacing: 10) {
                    Image(systemName: item.supports ? "arrow.up.circle.fill" : "arrow.down.circle.fill")
                        .font(.system(size: 14))
                        .foregroundColor(color)
                        .padding(.top, 1)

                    VStack(alignment: .leading, spacing: 4) {
                        Text(item.description)
                            .font(.system(size: 12))
                            .foregroundColor(.white.opacity(0.85))

                        HStack(spacing: 8) {
                            LabelBadge(label: item.label)
                            if let citation = item.citation {
                                Text(citation)
                                    .font(.system(size: 10))
                                    .foregroundColor(.white.opacity(0.3))
                                    .lineLimit(1)
                            }
                        }
                    }
                }
                .padding(10)
                .background(RoundedRectangle(cornerRadius: 10).fill(color.opacity(0.06)))
            }
        }
    }

    // MARK: - Collapse Tests

    private var collapseTestGrid: some View {
        VStack(spacing: 10) {
            ForEach(analysis.collapseTests) { test in
                HStack(alignment: .top, spacing: 12) {
                    VStack(spacing: 4) {
                        Image(systemName: test.result.icon)
                            .font(.system(size: 20))
                            .foregroundColor(test.result.color)
                        Text(test.result.label)
                            .font(.system(size: 8, weight: .bold))
                            .foregroundColor(test.result.color.opacity(0.7))
                    }
                    .frame(width: 40)

                    VStack(alignment: .leading, spacing: 4) {
                        HStack(spacing: 6) {
                            Image(systemName: test.testName.icon).font(.system(size: 11))
                            Text(test.testName.rawValue)
                                .font(.system(size: 12, weight: .bold))
                        }
                        .foregroundColor(.white.opacity(0.9))

                        Text(test.explanation)
                            .font(.system(size: 11))
                            .foregroundColor(.white.opacity(0.55))
                            .fixedSize(horizontal: false, vertical: true)
                    }
                }
                .padding(12)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(test.result.color.opacity(0.06))
                        .overlay(RoundedRectangle(cornerRadius: 12).stroke(test.result.color.opacity(0.15), lineWidth: 1))
                )
            }
        }
    }

    // MARK: - Framework Insights

    private var frameworkInsightsList: some View {
        VStack(spacing: 10) {
            ForEach(analysis.frameworkInsights) { insight in
                Button {
                    selectedFramework = insight
                    showFrameworkModal = true
                } label: {
                    HStack(spacing: 12) {
                        ZStack {
                            Circle()
                                .fill(insight.framework.category.color.opacity(0.15))
                                .frame(width: 40, height: 40)
                            Image(systemName: insight.framework.icon)
                                .font(.system(size: 16))
                                .foregroundColor(insight.framework.category.color)
                        }

                        VStack(alignment: .leading, spacing: 3) {
                            Text(insight.framework.rawValue)
                                .font(.system(size: 12, weight: .bold))
                                .foregroundColor(.white)
                            Text(insight.influenceOnConclusion)
                                .font(.system(size: 11))
                                .foregroundColor(.white.opacity(0.5))
                                .lineLimit(2)
                        }

                        Spacer()

                        Image(systemName: "chevron.right")
                            .font(.system(size: 11))
                            .foregroundColor(.white.opacity(0.2))
                    }
                    .padding(12)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.white.opacity(0.04))
                            .overlay(RoundedRectangle(cornerRadius: 12).stroke(insight.framework.category.color.opacity(0.15), lineWidth: 1))
                    )
                }
            }
        }
    }

    // MARK: - Audit Questions

    private var auditQuestions: some View {
        VStack(alignment: .leading, spacing: 10) {
            ForEach(Array(analysis.practicalAuditQuestions.enumerated()), id: \.offset) { index, question in
                HStack(alignment: .top, spacing: 12) {
                    Text("\(index + 1)")
                        .font(.system(size: 11, weight: .black, design: .rounded))
                        .foregroundColor(Color(hex: "#9B59B6"))
                        .frame(width: 20)

                    Text(question)
                        .font(.system(size: 13))
                        .foregroundColor(.white.opacity(0.8))
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
        }
    }

    // MARK: - Run New Button

    private var runNewButton: some View {
        Button(action: onRunNew) {
            HStack(spacing: 10) {
                Image(systemName: "arrow.counterclockwise.circle.fill")
                    .font(.system(size: 16))
                Text("Analyze Another Belief")
                    .font(.system(size: 14, weight: .bold))
            }
            .foregroundColor(Color(hex: "#FF6B35"))
            .frame(maxWidth: .infinity)
            .padding(16)
            .background(
                RoundedRectangle(cornerRadius: 14)
                    .fill(Color(hex: "#FF6B35").opacity(0.1))
                    .overlay(RoundedRectangle(cornerRadius: 14).stroke(Color(hex: "#FF6B35").opacity(0.3), lineWidth: 1))
            )
        }
    }

    private func toggleSection(_ id: String) {
        withAnimation(.spring(response: 0.35)) {
            if expandedSections.contains(id) {
                expandedSections.remove(id)
            } else {
                expandedSections.insert(id)
            }
        }
    }
}

// MARK: - Analysis Section Wrapper

struct AnalysisSection<Content: View>: View {
    let id: String
    let title: String
    let icon: String
    let color: Color
    let expanded: Bool
    let onToggle: () -> Void
    @ViewBuilder let content: () -> Content

    var body: some View {
        VStack(spacing: 0) {
            Button(action: onToggle) {
                HStack(spacing: 10) {
                    Image(systemName: icon)
                        .font(.system(size: 14))
                        .foregroundColor(color)
                        .frame(width: 20)

                    Text(title)
                        .font(.system(size: 13, weight: .bold))
                        .foregroundColor(.white)

                    Spacer()

                    Image(systemName: expanded ? "chevron.up" : "chevron.down")
                        .font(.system(size: 11))
                        .foregroundColor(.white.opacity(0.3))
                }
                .padding(14)
            }

            if expanded {
                Divider()
                    .background(Color.white.opacity(0.06))

                VStack(alignment: .leading, spacing: 0) {
                    content()
                }
                .padding(14)
                .transition(.move(edge: .top).combined(with: .opacity))
            }
        }
        .background(
            RoundedRectangle(cornerRadius: 14)
                .fill(Color.white.opacity(0.04))
                .overlay(RoundedRectangle(cornerRadius: 14).stroke(color.opacity(0.15), lineWidth: 1))
        )
    }
}

// MARK: - Section Text (inline label coloring)

struct SectionText: View {
    let text: String

    var body: some View {
        Text(attributedText)
            .font(.system(size: 13))
            .foregroundColor(.white.opacity(0.8))
            .fixedSize(horizontal: false, vertical: true)
    }

    private var attributedText: AttributedString {
        var attributed = AttributedString(text)
        // Color [Evidence] green, [Inference] yellow, [Speculation] red
        let labels: [(String, Color)] = [
            ("[Evidence]", Color(hex: "#27AE60")),
            ("[Inference]", Color(hex: "#F39C12")),
            ("[Speculation]", Color(hex: "#E74C3C"))
        ]
        for (label, color) in labels {
            var startIdx = attributed.startIndex
            while startIdx < attributed.endIndex {
                let slice = attributed[startIdx..<attributed.endIndex]
                guard let range = slice.range(of: label, options: .caseInsensitive) else { break }
                // Map slice range back to full string range
                let fullRange = range.lowerBound..<range.upperBound
                attributed[fullRange].foregroundColor = color
                attributed[fullRange].font = .system(size: 11, weight: .bold, design: .rounded)
                startIdx = range.upperBound
            }
        }
        return attributed
    }
}

// MARK: - Label Badge

struct LabelBadge: View {
    let label: ClaimLabel
    var body: some View {
        HStack(spacing: 3) {
            Image(systemName: label.icon).font(.system(size: 8))
            Text(label.rawValue).font(.system(size: 9, weight: .bold))
        }
        .foregroundColor(label.color)
        .padding(.horizontal, 7)
        .padding(.vertical, 3)
        .background(Capsule().fill(label.color.opacity(0.12)))
    }
}

// MARK: - Framework Detail Modal

struct FrameworkDetailModal: View {
    let insight: FrameworkInsight
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            ZStack {
                Color(hex: "#080510").ignoresSafeArea()

                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        // Header
                        HStack(spacing: 14) {
                            ZStack {
                                Circle()
                                    .fill(insight.framework.category.color.opacity(0.15))
                                    .frame(width: 56, height: 56)
                                Image(systemName: insight.framework.icon)
                                    .font(.system(size: 24))
                                    .foregroundColor(insight.framework.category.color)
                            }
                            VStack(alignment: .leading, spacing: 3) {
                                Text(insight.framework.rawValue)
                                    .font(.system(size: 18, weight: .black))
                                    .foregroundColor(.white)
                                Text(insight.framework.category.rawValue)
                                    .font(.system(size: 12))
                                    .foregroundColor(insight.framework.category.color.opacity(0.8))
                            }
                        }

                        // Influence
                        VStack(alignment: .leading, spacing: 8) {
                            Text("INFLUENCE ON CONCLUSION")
                                .font(.system(size: 10, weight: .bold)).tracking(2)
                                .foregroundColor(.white.opacity(0.4))
                            Text(insight.influenceOnConclusion)
                                .font(.system(size: 14))
                                .foregroundColor(.white.opacity(0.85))
                        }

                        // Insights
                        VStack(alignment: .leading, spacing: 10) {
                            Text("KEY INSIGHTS")
                                .font(.system(size: 10, weight: .bold)).tracking(2)
                                .foregroundColor(.white.opacity(0.4))

                            ForEach(Array(insight.insights.enumerated()), id: \.offset) { _, ins in
                                HStack(alignment: .top, spacing: 10) {
                                    Circle()
                                        .fill(insight.framework.category.color)
                                        .frame(width: 5, height: 5)
                                        .padding(.top, 6)
                                    Text(ins)
                                        .font(.system(size: 13))
                                        .foregroundColor(.white.opacity(0.8))
                                }
                            }
                        }

                        // Labels
                        HStack(spacing: 8) {
                            ForEach(insight.labels, id: \.rawValue) { label in
                                LabelBadge(label: label)
                            }
                        }
                    }
                    .padding(24)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button { dismiss() } label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundStyle(.white.opacity(0.5))
                    }
                }
            }
        }
    }
}
