// BeliefAnalyzerView.swift
// SunFlow: Reignited — Aperture
// Reality Decoded: Input + Framework Selection + Analysis Trigger

import SwiftUI

// MARK: - Main View

struct BeliefAnalyzerView: View {

    @StateObject private var vm = BeliefAnalyzerViewModel()
    @Environment(\.dismiss) private var dismiss
    @Namespace private var animation

    var body: some View {
        ZStack {
            // Background
            backgroundGradient

            // Content
            Group {
                if let analysis = vm.completedAnalysis {
                    BeliefAnalyzerResultView(analysis: analysis) {
                        withAnimation(.spring(response: 0.5)) {
                            vm.completedAnalysis = nil
                            vm.input = BeliefAnalyzerInput()
                        }
                    }
                } else {
                    inputFlow
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button { dismiss() } label: {
                    Image(systemName: "xmark.circle.fill")
                        .font(.title2)
                        .foregroundStyle(.white.opacity(0.6))
                }
            }
            ToolbarItem(placement: .principal) {
                VStack(spacing: 0) {
                    Text("REALITY DECODED")
                        .font(.system(size: 11, weight: .black, design: .rounded))
                        .tracking(3)
                        .foregroundStyle(
                            LinearGradient(colors: [Color(hex: "#FF6B35"), Color(hex: "#FFD700")],
                                           startPoint: .leading, endPoint: .trailing)
                        )
                    Text("Belief Analyzer")
                        .font(.system(size: 10, weight: .medium))
                        .foregroundColor(.white.opacity(0.4))
                }
            }
        }
    }

    // MARK: - Background

    private var backgroundGradient: some View {
        LinearGradient(
            colors: [
                Color(hex: "#080510"),
                Color(hex: "#0D0A1A"),
                Color(hex: "#080510")
            ],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .ignoresSafeArea()
    }

    // MARK: - Input Flow

    private var inputFlow: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 28) {
                // Hero
                heroSection

                // Belief Input
                beliefInputSection

                // Type Detection
                if !vm.input.belief.isEmpty {
                    typeDetectionSection
                }

                // Framework Selection
                if !vm.input.belief.isEmpty {
                    frameworkSection
                }

                // Analyze Button
                if !vm.input.belief.trimmingCharacters(in: .whitespaces).isEmpty {
                    analyzeButton
                }

                // History
                if !vm.analysisHistory.isEmpty {
                    historySection
                }

                Spacer(minLength: 100)
            }
            .padding(.horizontal, 20)
            .padding(.top, 8)
        }
    }

    // MARK: - Hero

    private var heroSection: some View {
        VStack(spacing: 12) {
            ZStack {
                Circle()
                    .fill(Color(hex: "#FF6B35").opacity(0.15))
                    .frame(width: 80, height: 80)
                Circle()
                    .fill(Color(hex: "#FF6B35").opacity(0.08))
                    .frame(width: 100, height: 100)
                Image(systemName: "eye.trianglebadge.exclamationmark")
                    .font(.system(size: 36))
                    .foregroundStyle(
                        LinearGradient(colors: [Color(hex: "#FF6B35"), Color(hex: "#FFD700")],
                                       startPoint: .top, endPoint: .bottom)
                    )
            }

            Text("What do you believe?")
                .font(.system(size: 22, weight: .black, design: .rounded))
                .foregroundColor(.white)

            Text("Enter any belief, claim, or narrative.\nWe'll run it through up to 25 analytical lenses.")
                .font(.system(size: 13))
                .foregroundColor(.white.opacity(0.5))
                .multilineTextAlignment(.center)

            if !vm.service.isOnline {
                offlineBanner
            }
        }
        .padding(.top, 12)
    }

    private var offlineBanner: some View {
        HStack(spacing: 8) {
            Image(systemName: "wifi.slash")
                .font(.system(size: 11))
            Text("Offline Mode — Limited analysis. Connect for full AI scrutiny.")
                .font(.system(size: 11, weight: .medium))
        }
        .foregroundColor(Color(hex: "#F39C12"))
        .padding(.horizontal, 14)
        .padding(.vertical, 8)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(hex: "#F39C12").opacity(0.1))
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(hex: "#F39C12").opacity(0.3), lineWidth: 1))
        )
    }

    // MARK: - Belief Input

    private var beliefInputSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("THE BELIEF")
                .font(.system(size: 11, weight: .bold, design: .rounded))
                .tracking(2)
                .foregroundColor(.white.opacity(0.4))

            ZStack(alignment: .topLeading) {
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.white.opacity(0.04))
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(
                                vm.input.belief.isEmpty
                                    ? Color.white.opacity(0.08)
                                    : Color(hex: "#FF6B35").opacity(0.4),
                                lineWidth: 1.5
                            )
                    )

                if vm.input.belief.isEmpty {
                    Text("e.g. \"Religious leaders are divinely guided.\"")
                        .font(.system(size: 15))
                        .foregroundColor(.white.opacity(0.2))
                        .padding(16)
                        .allowsHitTesting(false)
                }

                TextEditor(text: $vm.input.belief)
                    .font(.system(size: 15))
                    .foregroundColor(.white)
                    .scrollContentBackground(.hidden)
                    .background(.clear)
                    .padding(12)
                    .frame(minHeight: 90, maxHeight: 160)
                    .onChange(of: vm.input.belief) { _, _ in
                        vm.onBeliefChanged()
                    }
            }

            HStack {
                Text("\(vm.input.belief.count) characters")
                    .font(.system(size: 11))
                    .foregroundColor(.white.opacity(0.2))
                Spacer()
                if !vm.input.belief.isEmpty {
                    Button {
                        withAnimation { vm.input.belief = "" }
                    } label: {
                        Text("Clear")
                            .font(.system(size: 11, weight: .medium))
                            .foregroundColor(.white.opacity(0.3))
                    }
                }
            }
        }
    }

    // MARK: - Type Detection

    private var typeDetectionSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("DETECTED TYPE")
                .font(.system(size: 11, weight: .bold, design: .rounded))
                .tracking(2)
                .foregroundColor(.white.opacity(0.4))

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(BeliefType.allCases, id: \.self) { type in
                        TypeChip(type: type, isSelected: vm.input.detectedType == type) {
                            vm.input.detectedType = type
                            vm.refreshDefaultFrameworks()
                        }
                    }
                }
                .padding(.horizontal, 2)
            }
        }
    }

    // MARK: - Framework Section

    private var frameworkSection: some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack {
                Text("ANALYTICAL LENSES")
                    .font(.system(size: 11, weight: .bold, design: .rounded))
                    .tracking(2)
                    .foregroundColor(.white.opacity(0.4))
                Spacer()
                Button {
                    withAnimation(.spring(response: 0.4)) {
                        vm.input.advancedMode.toggle()
                    }
                } label: {
                    HStack(spacing: 5) {
                        Image(systemName: vm.input.advancedMode ? "chevron.up.circle.fill" : "plus.circle.fill")
                            .font(.system(size: 13))
                        Text(vm.input.advancedMode ? "Collapse" : "Advanced Mode")
                            .font(.system(size: 12, weight: .semibold))
                    }
                    .foregroundColor(Color(hex: "#FF6B35"))
                }
            }

            // Selected frameworks chips
            if !vm.input.selectedFrameworks.isEmpty {
                selectedFrameworksRow
            }

            // Advanced: all 25 grouped
            if vm.input.advancedMode {
                advancedFrameworkPicker
            }

            // Quick actions
            HStack(spacing: 10) {
                Button {
                    vm.selectAllFrameworks()
                } label: {
                    Label("All 25", systemImage: "square.grid.3x3.fill")
                        .font(.system(size: 11, weight: .semibold))
                        .foregroundColor(.white.opacity(0.6))
                        .padding(.horizontal, 12)
                        .padding(.vertical, 7)
                        .background(RoundedRectangle(cornerRadius: 8).fill(Color.white.opacity(0.05)))
                }
                Button {
                    vm.refreshDefaultFrameworks()
                } label: {
                    Label("Reset Default", systemImage: "arrow.counterclockwise")
                        .font(.system(size: 11, weight: .semibold))
                        .foregroundColor(.white.opacity(0.6))
                        .padding(.horizontal, 12)
                        .padding(.vertical, 7)
                        .background(RoundedRectangle(cornerRadius: 8).fill(Color.white.opacity(0.05)))
                }
            }
        }
    }

    private var selectedFrameworksRow: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                ForEach(vm.input.selectedFrameworks) { fw in
                    FrameworkChip(framework: fw, isDefault: true) {
                        vm.toggleFramework(fw)
                    }
                }
            }
        }
    }

    private var advancedFrameworkPicker: some View {
        VStack(alignment: .leading, spacing: 16) {
            ForEach(FrameworkCategory.allCases, id: \.rawValue) { category in
                let categoryFrameworks = AnalysisFramework.allCases.filter { $0.category == category }
                VStack(alignment: .leading, spacing: 10) {
                    Text(category.rawValue.uppercased())
                        .font(.system(size: 10, weight: .bold, design: .rounded))
                        .tracking(2)
                        .foregroundColor(category.color.opacity(0.8))

                    FlowLayout(spacing: 8) {
                        ForEach(categoryFrameworks) { fw in
                            FrameworkChip(
                                framework: fw,
                                isDefault: vm.input.selectedFrameworks.contains(fw)
                            ) {
                                vm.toggleFramework(fw)
                            }
                        }
                    }
                }
            }
        }
        .padding(16)
        .background(RoundedRectangle(cornerRadius: 14).fill(Color.white.opacity(0.03)))
        .overlay(RoundedRectangle(cornerRadius: 14).stroke(Color.white.opacity(0.05), lineWidth: 1))
        .transition(.move(edge: .top).combined(with: .opacity))
    }

    // MARK: - Analyze Button

    private var analyzeButton: some View {
        VStack(spacing: 12) {
            if vm.input.isAnalyzing {
                analyzingIndicator
            } else {
                Button { Task { await vm.runAnalysis() } } label: {
                    HStack(spacing: 12) {
                        Image(systemName: "eye.trianglebadge.exclamationmark")
                            .font(.system(size: 18, weight: .bold))
                        VStack(alignment: .leading, spacing: 1) {
                            Text("ANALYZE BELIEF")
                                .font(.system(size: 15, weight: .black, design: .rounded))
                                .tracking(1)
                            Text("\(vm.input.selectedFrameworks.count) lenses selected")
                                .font(.system(size: 11))
                                .opacity(0.7)
                        }
                        Spacer()
                        Image(systemName: "arrow.right.circle.fill")
                            .font(.system(size: 20))
                    }
                    .foregroundColor(.black)
                    .padding(18)
                    .background(
                        LinearGradient(
                            colors: [Color(hex: "#FF6B35"), Color(hex: "#FFD700")],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                    )
                }

                if let error = vm.input.error {
                    Text(error)
                        .font(.system(size: 12))
                        .foregroundColor(Color(hex: "#E74C3C"))
                        .multilineTextAlignment(.center)
                }
            }
        }
    }

    private var analyzingIndicator: some View {
        VStack(spacing: 16) {
            ZStack {
                Circle()
                    .stroke(Color.white.opacity(0.1), lineWidth: 3)
                    .frame(width: 60, height: 60)
                Circle()
                    .trim(from: 0, to: 0.7)
                    .stroke(
                        LinearGradient(colors: [Color(hex: "#FF6B35"), Color(hex: "#FFD700")],
                                       startPoint: .leading, endPoint: .trailing),
                        style: StrokeStyle(lineWidth: 3, lineCap: .round)
                    )
                    .frame(width: 60, height: 60)
                    .rotationEffect(.degrees(vm.analyzerRotation))
                    .onAppear { vm.startRotationAnimation() }

                Image(systemName: "eye.trianglebadge.exclamationmark")
                    .font(.system(size: 22))
                    .foregroundStyle(
                        LinearGradient(colors: [Color(hex: "#FF6B35"), Color(hex: "#FFD700")],
                                       startPoint: .top, endPoint: .bottom)
                    )
            }

            VStack(spacing: 4) {
                Text(vm.analysisPhase)
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.white)
                Text(vm.service.isOnline ? "Running AI analysis..." : "Running offline analysis...")
                    .font(.system(size: 11))
                    .foregroundColor(.white.opacity(0.4))
            }
        }
        .frame(maxWidth: .infinity)
        .padding(24)
        .background(RoundedRectangle(cornerRadius: 16).fill(Color.white.opacity(0.04)))
    }

    // MARK: - History

    private var historySection: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("PREVIOUS ANALYSES")
                    .font(.system(size: 11, weight: .bold, design: .rounded))
                    .tracking(2)
                    .foregroundColor(.white.opacity(0.4))
                Spacer()
                Button {
                    withAnimation { vm.analysisHistory.removeAll() }
                } label: {
                    Text("Clear")
                        .font(.system(size: 11))
                        .foregroundColor(.white.opacity(0.3))
                }
            }

            ForEach(vm.analysisHistory.prefix(5)) { analysis in
                HistoryRow(analysis: analysis) {
                    vm.completedAnalysis = analysis
                }
            }
        }
    }
}

// MARK: - Type Chip

struct TypeChip: View {
    let type: BeliefType
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 6) {
                Image(systemName: type.icon)
                    .font(.system(size: 11))
                Text(type.displayName)
                    .font(.system(size: 12, weight: isSelected ? .bold : .medium))
            }
            .foregroundColor(isSelected ? .black : type.color.opacity(0.8))
            .padding(.horizontal, 12)
            .padding(.vertical, 7)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(isSelected ? type.color : type.color.opacity(0.1))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(isSelected ? type.color : type.color.opacity(0.3), lineWidth: 1)
                    )
            )
        }
    }
}

// MARK: - Framework Chip

struct FrameworkChip: View {
    let framework: AnalysisFramework
    let isDefault: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 5) {
                Image(systemName: framework.icon)
                    .font(.system(size: 10))
                Text(framework.rawValue)
                    .font(.system(size: 11, weight: isDefault ? .bold : .medium))
                    .lineLimit(1)
                if isDefault {
                    Image(systemName: "xmark")
                        .font(.system(size: 8, weight: .bold))
                        .opacity(0.7)
                }
            }
            .foregroundColor(isDefault ? framework.category.color : framework.category.color.opacity(0.7))
            .padding(.horizontal, 10)
            .padding(.vertical, 6)
            .background(
                Capsule()
                    .fill(isDefault ? framework.category.color.opacity(0.15) : Color.white.opacity(0.04))
                    .overlay(
                        Capsule()
                            .stroke(isDefault ? framework.category.color.opacity(0.4) : Color.white.opacity(0.08), lineWidth: 1)
                    )
            )
        }
    }
}

// MARK: - History Row

struct HistoryRow: View {
    let analysis: BeliefAnalysis
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 12) {
                Text(analysis.outcome.emoji)
                    .font(.system(size: 22))

                VStack(alignment: .leading, spacing: 3) {
                    Text(analysis.belief)
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundColor(.white)
                        .lineLimit(1)
                    Text("\(analysis.outcome.rawValue) · \(analysis.confidenceRating.rawValue) confidence")
                        .font(.system(size: 11))
                        .foregroundColor(analysis.outcome.color.opacity(0.8))
                }

                Spacer()

                Image(systemName: "chevron.right")
                    .font(.system(size: 12))
                    .foregroundColor(.white.opacity(0.2))
            }
            .padding(14)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.white.opacity(0.04))
                    .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.white.opacity(0.06), lineWidth: 1))
            )
        }
    }
}


// MARK: - ViewModel

@MainActor
final class BeliefAnalyzerViewModel: ObservableObject {
    @Published var input = BeliefAnalyzerInput()
    @Published var completedAnalysis: BeliefAnalysis?
    @Published var analysisHistory: [BeliefAnalysis] = []
    @Published var analyzerRotation: Double = 0
    @Published var analysisPhase: String = "Classifying belief..."

    let service = BeliefAnalyzerService.shared

    private let analysisPhases = [
        "Classifying belief...",
        "Loading analytical lenses...",
        "Running collapse tests...",
        "Mapping incentive structures...",
        "Scoring evidence quality...",
        "Computing verdict..."
    ]
    private var phaseIndex = 0
    private var phaseTimer: Timer?

    // MARK: - Belief Changed

    func onBeliefChanged() {
        guard !input.belief.isEmpty else { return }
        Task {
            input.detectedType = await service.classifyBelief(input.belief)
            refreshDefaultFrameworks()
        }
    }

    func refreshDefaultFrameworks() {
        input.selectedFrameworks = AnalysisFramework.defaults(for: input.detectedType)
    }

    func toggleFramework(_ fw: AnalysisFramework) {
        if input.selectedFrameworks.contains(fw) {
            input.selectedFrameworks.removeAll { $0 == fw }
        } else {
            input.selectedFrameworks.append(fw)
        }
    }

    func selectAllFrameworks() {
        input.selectedFrameworks = AnalysisFramework.allCases
    }

    // MARK: - Run Analysis

    func runAnalysis() async {
        let belief = input.belief.trimmingCharacters(in: .whitespaces)
        guard !belief.isEmpty else {
            input.error = "Please enter a belief to analyze."
            return
        }
        guard !input.selectedFrameworks.isEmpty else {
            input.error = "Select at least one analytical lens."
            return
        }

        input.error = nil
        input.isAnalyzing = true
        startPhaseAnimation()

        do {
            let analysis = try await service.analyze(
                belief: belief,
                frameworks: input.selectedFrameworks,
                beliefType: input.detectedType
            )
            stopPhaseAnimation()
            input.isAnalyzing = false
            analysisHistory.insert(analysis, at: 0)
            withAnimation(.spring(response: 0.6)) {
                completedAnalysis = analysis
            }
        } catch {
            stopPhaseAnimation()
            input.isAnalyzing = false
            input.error = "Analysis failed: \(error.localizedDescription). Try again."
        }
    }

    // MARK: - Animations

    func startRotationAnimation() {
        withAnimation(.linear(duration: 1).repeatForever(autoreverses: false)) {
            analyzerRotation = 360
        }
    }

    private func startPhaseAnimation() {
        phaseIndex = 0
        analysisPhase = analysisPhases[0]
        phaseTimer = Timer.scheduledTimer(withTimeInterval: 1.8, repeats: true) { [weak self] _ in
            guard let self else { return }
            Task { @MainActor in
                self.phaseIndex = (self.phaseIndex + 1) % self.analysisPhases.count
                withAnimation(.easeInOut(duration: 0.3)) {
                    self.analysisPhase = self.analysisPhases[self.phaseIndex]
                }
            }
        }
    }

    private func stopPhaseAnimation() {
        phaseTimer?.invalidate()
        phaseTimer = nil
    }
}
