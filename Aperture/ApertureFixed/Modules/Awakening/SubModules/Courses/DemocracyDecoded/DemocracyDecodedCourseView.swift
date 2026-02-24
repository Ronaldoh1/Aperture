// DemocracyDecodedCourseView.swift
// SunFlow: Reignited — Aperture
//
// DEMOCRACY DECODED — Full UI
// Hub → Course Select → Module Reader → Quiz Engine → Belief Audit → RCV Simulator

import SwiftUI

// MARK: - App State

class DemocracyDecodedState: ObservableObject {
    @Published var progress = DDProgress()
    @Published var selectedCourse: DDCourse? = nil
    @Published var selectedModule: DDModule? = nil
    @Published var showModule = false
    @Published var showRCVSimulator = false

    private let key = "aperture_democracy_decoded_v1"

    var totalModules: Int { allDemocracyDecodedCourses.flatMap { $0.modules }.count }
    var completedCount: Int { progress.completedModules.count }
    var overallFraction: Double { Double(completedCount) / Double(max(totalModules, 1)) }

    func open(_ module: DDModule) { selectedModule = module; showModule = true }

    func save() {
        if let data = try? JSONEncoder().encode(progress) {
            UserDefaults.standard.set(data, forKey: key)
        }
    }

    func load() {
        if let data = UserDefaults.standard.data(forKey: key),
           let decoded = try? JSONDecoder().decode(DDProgress.self, from: data) {
            progress = decoded
        }
    }
}

// MARK: ══════════════════════════════════════════════════════
// MAIN HUB
// ══════════════════════════════════════════════════════════

struct DemocracyDecodedHubView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var state = DemocracyDecodedState()

    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 0.02, green: 0.03, blue: 0.06).ignoresSafeArea()

                ScrollView(showsIndicators: false) {
                    VStack(spacing: 22) {
                        heroHeader
                        overallProgress
                        rcvSimCard
                        ForEach(allDemocracyDecodedCourses) { course in
                            courseCard(course)
                        }
                        disclaimer
                        Spacer(minLength: 40)
                    }
                    .padding(.horizontal, 18)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button { dismiss() } label: {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 16, weight: .semibold)).foregroundColor(.white)
                    }
                }
                ToolbarItem(placement: .principal) {
                    HStack(spacing: 6) {
                        Text("🗳️").font(.system(size: 13))
                        Text("Democracy Decoded")
                            .font(.system(size: 17, weight: .bold)).foregroundColor(.white)
                    }
                }
            }
            .fullScreenCover(isPresented: $state.showModule) {
                if let module = state.selectedModule,
                   let course = allDemocracyDecodedCourses.first(where: { $0.modules.contains { $0.id == module.id } }) {
                    DDModuleReaderView(module: module, course: course, state: state)
                }
            }
            .fullScreenCover(isPresented: $state.showRCVSimulator) {
                RCVSimulatorView()
            }
            .onAppear { state.load() }
        }
    }

    // MARK: — Hero

    private var heroHeader: some View {
        VStack(spacing: 14) {
            Spacer().frame(height: 12)
            ZStack {
                Circle().fill(Color.blue.opacity(0.07)).frame(width: 150, height: 150).blur(radius: 40)
                Text("🗳️").font(.system(size: 54))
            }
            VStack(spacing: 6) {
                Text("DEMOCRACY DECODED").font(.system(size: 10, weight: .black)).tracking(3)
                    .foregroundColor(.blue.opacity(0.5))
                Text("How Elections, Money & Reform Actually Work")
                    .font(.system(size: 20, weight: .black)).foregroundColor(.white)
                    .multilineTextAlignment(.center).lineSpacing(3)
                Text("3 courses · 13 modules · Quizzes that reveal your hidden assumptions")
                    .font(.system(size: 11, weight: .medium)).foregroundColor(.white.opacity(0.3))
                    .multilineTextAlignment(.center)
            }
        }
    }

    // MARK: — Overall Progress

    private var overallProgress: some View {
        VStack(spacing: 10) {
            HStack {
                Text("OVERALL PROGRESS").font(.system(size: 9, weight: .black)).tracking(2)
                    .foregroundColor(.white.opacity(0.1))
                Spacer()
                Text("\(state.completedCount)/\(state.totalModules) modules · \(Int(state.overallFraction * 100))%")
                    .font(.system(size: 10, weight: .bold)).foregroundColor(.blue.opacity(0.5))
            }
            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 4).fill(Color.white.opacity(0.04)).frame(height: 6)
                    RoundedRectangle(cornerRadius: 4).fill(
                        LinearGradient(colors: [.blue, Color(hex: "#34C78A"), Color(hex: "#FF7B3A")],
                                       startPoint: .leading, endPoint: .trailing)
                    )
                    .frame(width: max(6, geo.size.width * state.overallFraction), height: 6)
                    .animation(.spring(response: 0.6), value: state.overallFraction)
                }
            }.frame(height: 6)
            if state.completedCount > 0 {
                Text("Score: \(state.progress.totalScore) pts  ·  Best streak: \(state.completedCount) modules completed")
                    .font(.system(size: 9, weight: .bold)).foregroundColor(.blue.opacity(0.4))
            }
        }
        .padding(14)
        .background(RoundedRectangle(cornerRadius: 12).fill(Color.white.opacity(0.015))
            .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.blue.opacity(0.06), lineWidth: 1)))
    }

    // MARK: — RCV Simulator Card

    private var rcvSimCard: some View {
        Button { state.showRCVSimulator = true } label: {
            HStack(spacing: 14) {
                ZStack {
                    RoundedRectangle(cornerRadius: 10).fill(Color(hex: "#FF7B3A").opacity(0.15))
                        .frame(width: 52, height: 52)
                    Text("🏆").font(.system(size: 26))
                }
                VStack(alignment: .leading, spacing: 4) {
                    HStack(spacing: 6) {
                        Text("RCV Simulator").font(.system(size: 15, weight: .black)).foregroundColor(.white)
                        Text("INTERACTIVE").font(.system(size: 7, weight: .black)).tracking(1)
                            .foregroundColor(.black)
                            .padding(.horizontal, 6).padding(.vertical, 2)
                            .background(Capsule().fill(Color(hex: "#FF7B3A")))
                    }
                    Text("Run a ranked-choice election — see how RCV changes outcomes vs. plurality voting")
                        .font(.system(size: 10, weight: .medium)).foregroundColor(.white.opacity(0.4))
                        .lineSpacing(2)
                }
                Spacer()
                Image(systemName: "play.fill").font(.system(size: 14))
                    .foregroundColor(Color(hex: "#FF7B3A").opacity(0.6))
            }
            .padding(14)
            .background(RoundedRectangle(cornerRadius: 12)
                .fill(Color(hex: "#FF7B3A").opacity(0.04))
                .overlay(RoundedRectangle(cornerRadius: 12)
                    .stroke(Color(hex: "#FF7B3A").opacity(0.15), lineWidth: 1)))
        }
    }

    // MARK: — Course Card

    private func courseCard(_ course: DDCourse) -> some View {
        let completedInCourse = course.modules.filter { state.progress.isDone($0.id) }.count
        let fraction = Double(completedInCourse) / Double(course.modules.count)

        return VStack(alignment: .leading, spacing: 0) {
            // Course Header
            HStack(spacing: 12) {
                ZStack {
                    RoundedRectangle(cornerRadius: 10).fill(course.accent.opacity(0.15)).frame(width: 48, height: 48)
                    Text(course.emoji).font(.system(size: 24))
                }
                VStack(alignment: .leading, spacing: 3) {
                    Text("COURSE \(course.number)").font(.system(size: 8, weight: .black)).tracking(2)
                        .foregroundColor(course.accent.opacity(0.5))
                    Text(course.title).font(.system(size: 15, weight: .black)).foregroundColor(.white)
                    Text(course.subtitle).font(.system(size: 10, weight: .medium)).foregroundColor(.white.opacity(0.35))
                }
                Spacer()
                VStack(alignment: .trailing, spacing: 3) {
                    Text("\(completedInCourse)/\(course.modules.count)").font(.system(size: 12, weight: .black))
                        .foregroundColor(course.accent.opacity(0.7))
                    Text(course.level).font(.system(size: 8, weight: .medium)).foregroundColor(.white.opacity(0.2))
                }
            }
            .padding(14)

            // Course progress bar
            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    Rectangle().fill(Color.white.opacity(0.04)).frame(height: 3)
                    Rectangle().fill(course.accent.opacity(0.6))
                        .frame(width: max(0, geo.size.width * fraction), height: 3)
                        .animation(.spring(response: 0.5), value: fraction)
                }
            }
            .frame(height: 3)

            // Modules list
            VStack(spacing: 0) {
                ForEach(course.modules) { module in
                    moduleRow(module, course: course)
                }
            }
        }
        .background(RoundedRectangle(cornerRadius: 14)
            .fill(Color.white.opacity(0.012))
            .overlay(RoundedRectangle(cornerRadius: 14).stroke(course.accent.opacity(0.08), lineWidth: 1)))
    }

    private func moduleRow(_ module: DDModule, course: DDCourse) -> some View {
        let done = state.progress.isDone(module.id)
        let score = state.progress.score(module.id)

        return Button {
            state.open(module)
        } label: {
            HStack(spacing: 12) {
                ZStack {
                    Circle().fill(done ? course.accent.opacity(0.2) : Color.white.opacity(0.04))
                        .frame(width: 36, height: 36)
                    if done {
                        Image(systemName: "checkmark").font(.system(size: 12, weight: .bold))
                            .foregroundColor(course.accent)
                    } else {
                        Text(module.emoji).font(.system(size: 16))
                    }
                }
                VStack(alignment: .leading, spacing: 2) {
                    Text(module.title).font(.system(size: 13, weight: .bold))
                        .foregroundColor(done ? .white.opacity(0.5) : .white)
                    Text(module.subtitle).font(.system(size: 9, weight: .medium))
                        .foregroundColor(.white.opacity(0.25))
                }
                Spacer()
                HStack(spacing: 6) {
                    if let s = score {
                        Text("\(s)pts").font(.system(size: 9, weight: .bold))
                            .foregroundColor(course.accent.opacity(0.6))
                    }
                    Text("\(module.readingTime)min").font(.system(size: 9, weight: .medium))
                        .foregroundColor(.white.opacity(0.2))
                    Image(systemName: "chevron.right").font(.system(size: 9, weight: .semibold))
                        .foregroundColor(.white.opacity(0.15))
                }
            }
            .padding(.horizontal, 14).padding(.vertical, 10)
            .background(done ? course.accent.opacity(0.02) : Color.clear)
        }
    }

    // MARK: — Disclaimer

    private var disclaimer: some View {
        Text("All data sourced from OpenSecrets, FairVote, Brennan Center, Congressional Research Service, and peer-reviewed political science research. This course presents multiple perspectives and does not advocate for any political party.")
            .font(.system(size: 9, weight: .medium)).foregroundColor(.white.opacity(0.15))
            .multilineTextAlignment(.center).lineSpacing(3)
            .padding(12)
            .background(RoundedRectangle(cornerRadius: 8).fill(Color.white.opacity(0.005)))
    }
}

// MARK: ══════════════════════════════════════════════════════
// MODULE READER
// ══════════════════════════════════════════════════════════

struct DDModuleReaderView: View {
    let module: DDModule
    let course: DDCourse
    @ObservedObject var state: DemocracyDecodedState
    @Environment(\.dismiss) var dismiss

    @State private var currentTab = 0
    @State private var showQuiz = false
    @State private var quizScore = 0
    @State private var quizDone = false
    @State private var beliefSlider: Double = 50

    private var tabs: [String] { ["Content", "Belief Audit", "Quiz", "Action"] }

    var body: some View {
        ZStack {
            Color(red: 0.02, green: 0.03, blue: 0.06).ignoresSafeArea()

            VStack(spacing: 0) {
                // Tab bar
                HStack(spacing: 0) {
                    ForEach(Array(tabs.enumerated()), id: \.0) { idx, name in
                        Button { withAnimation { currentTab = idx } } label: {
                            VStack(spacing: 3) {
                                Text(name).font(.system(size: 11, weight: currentTab == idx ? .black : .medium))
                                    .foregroundColor(currentTab == idx ? course.accent : .white.opacity(0.3))
                                if currentTab == idx {
                                    RoundedRectangle(cornerRadius: 1).fill(course.accent)
                                        .frame(height: 2).padding(.horizontal, 8)
                                } else {
                                    Color.clear.frame(height: 2).padding(.horizontal, 8)
                                }
                            }
                            .frame(maxWidth: .infinity).padding(.vertical, 10)
                        }
                    }
                }
                .background(Color.white.opacity(0.02))
                .overlay(Rectangle().frame(height: 1).foregroundColor(.white.opacity(0.04)), alignment: .bottom)

                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 20) {
                        moduleHeader
                        keyStatsRow

                        if currentTab == 0 { contentTab }
                        else if currentTab == 1 { beliefAuditTab }
                        else if currentTab == 2 { quizTab }
                        else { actionTab }

                        Spacer(minLength: 40)
                    }
                    .padding(.horizontal, 18).padding(.top, 16)
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button { dismiss() } label: {
                    Image(systemName: "xmark").font(.system(size: 14, weight: .semibold)).foregroundColor(.white)
                }
            }
            ToolbarItem(placement: .principal) {
                Text(module.title).font(.system(size: 14, weight: .bold)).foregroundColor(.white).lineLimit(1)
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                if state.progress.isDone(module.id) {
                    Image(systemName: "checkmark.circle.fill").foregroundColor(course.accent)
                        .font(.system(size: 16))
                }
            }
        }
    }

    // MARK: — Header

    private var moduleHeader: some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack(spacing: 8) {
                Text("COURSE \(course.number) · MODULE \(module.number)")
                    .font(.system(size: 8, weight: .black)).tracking(2)
                    .foregroundColor(course.accent.opacity(0.5))
                Spacer()
                Text("\(module.readingTime) min").font(.system(size: 9, weight: .medium))
                    .foregroundColor(.white.opacity(0.2))
            }
            Text(module.title).font(.system(size: 22, weight: .black)).foregroundColor(.white)
            Text(module.subtitle).font(.system(size: 13, weight: .medium)).foregroundColor(.white.opacity(0.4))
        }
    }

    // MARK: — Key Stats Row

    private var keyStatsRow: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(module.keyStats) { stat in
                    VStack(spacing: 4) {
                        Text(stat.number).font(.system(size: 18, weight: .black)).foregroundColor(stat.color)
                        Text(stat.label).font(.system(size: 8, weight: .medium)).foregroundColor(.white.opacity(0.35))
                            .multilineTextAlignment(.center).lineLimit(2)
                    }
                    .frame(width: 110)
                    .padding(10)
                    .background(RoundedRectangle(cornerRadius: 10).fill(stat.color.opacity(0.06))
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(stat.color.opacity(0.1), lineWidth: 1)))
                }
            }
        }
    }

    // MARK: — Content Tab

    private var contentTab: some View {
        DDMarkdownBodyView(text: module.body, accent: course.accent)
    }

    // MARK: — Belief Audit Tab

    private var beliefAuditTab: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Header card
            VStack(alignment: .leading, spacing: 8) {
                HStack(spacing: 6) {
                    Text("🧠").font(.system(size: 16))
                    Text("BELIEF AUDIT").font(.system(size: 9, weight: .black)).tracking(2)
                        .foregroundColor(course.accent.opacity(0.7))
                }
                Text("Surface assumptions you may never have examined")
                    .font(.system(size: 11, weight: .medium)).foregroundColor(.white.opacity(0.35))
            }

            if let prompt = module.beliefAuditPrompt {
                VStack(alignment: .leading, spacing: 12) {
                    Text(prompt)
                        .font(.system(size: 13, weight: .medium)).foregroundColor(.white.opacity(0.7))
                        .lineSpacing(5)
                        .padding(14)
                        .background(RoundedRectangle(cornerRadius: 10).fill(course.accent.opacity(0.05))
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(course.accent.opacity(0.12), lineWidth: 1)))

                    // Confidence slider
                    VStack(alignment: .leading, spacing: 10) {
                        Text("BEFORE READING THIS MODULE, HOW CONFIDENT WERE YOU IN YOUR PRIOR BELIEF?")
                            .font(.system(size: 8, weight: .black)).tracking(1.5)
                            .foregroundColor(.white.opacity(0.25))

                        HStack(spacing: 10) {
                            Text("Not at all").font(.system(size: 9)).foregroundColor(.white.opacity(0.3))
                            Slider(value: $beliefSlider, in: 0...100)
                                .accentColor(course.accent)
                            Text("Completely").font(.system(size: 9)).foregroundColor(.white.opacity(0.3))
                        }
                        Text("\(Int(beliefSlider))% confident")
                            .font(.system(size: 12, weight: .black)).foregroundColor(course.accent)
                    }
                    .padding(14)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.015)))
                }
            } else {
                Text("This module's bias audit is embedded in the quiz questions.")
                    .font(.system(size: 12)).foregroundColor(.white.opacity(0.3)).italic()
            }

            // Pattern explanation
            VStack(alignment: .leading, spacing: 8) {
                Text("WHY THIS MATTERS").font(.system(size: 9, weight: .black)).tracking(2)
                    .foregroundColor(.white.opacity(0.2))
                Text("Political beliefs are usually absorbed before they're examined. The question isn't whether your current view is right or wrong — it's whether you arrived at it through evidence and reasoning, or through the environment you grew up in. The quiz that follows surfaces where your inherited assumptions may diverge from documented facts.")
                    .font(.system(size: 11, weight: .medium)).foregroundColor(.white.opacity(0.4))
                    .lineSpacing(4)
            }
            .padding(12)
            .background(RoundedRectangle(cornerRadius: 8).fill(Color.white.opacity(0.008)))

            Button { withAnimation { currentTab = 2 } } label: {
                Text("Continue to Quiz →")
                    .font(.system(size: 14, weight: .bold)).foregroundColor(.black)
                    .frame(maxWidth: .infinity).padding(.vertical, 14)
                    .background(RoundedRectangle(cornerRadius: 12).fill(course.accent))
            }
        }
    }

    // MARK: — Quiz Tab

    private var quizTab: some View {
        Group {
            if !module.quiz.isEmpty {
                DDQuizEngineView(
                    questions: module.quiz,
                    accent: course.accent,
                    onComplete: { score in
                        quizScore = score
                        quizDone = true
                        let earned = score
                        state.progress.markComplete(module.id, score: earned)
                        state.save()
                    }
                )
            } else {
                Text("Complete the content and belief audit to mark this module done.")
                    .font(.system(size: 12)).foregroundColor(.white.opacity(0.3)).italic()
                    .padding(.top, 20)
            }
        }
    }

    // MARK: — Action Tab

    private var actionTab: some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading, spacing: 8) {
                HStack(spacing: 6) {
                    Text("⚡").font(.system(size: 16))
                    Text("YOUR NEXT MOVE").font(.system(size: 9, weight: .black)).tracking(2)
                        .foregroundColor(course.accent.opacity(0.7))
                }
                Text(module.actionStep)
                    .font(.system(size: 14, weight: .medium)).foregroundColor(.white.opacity(0.7))
                    .lineSpacing(6)
                    .padding(14)
                    .background(RoundedRectangle(cornerRadius: 10).fill(course.accent.opacity(0.06))
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(course.accent.opacity(0.15), lineWidth: 1)))
            }

            if state.progress.isDone(module.id) {
                HStack(spacing: 8) {
                    Image(systemName: "checkmark.circle.fill").foregroundColor(course.accent)
                    VStack(alignment: .leading, spacing: 2) {
                        Text("Module Complete").font(.system(size: 14, weight: .bold)).foregroundColor(course.accent.opacity(0.8))
                        if let s = state.progress.score(module.id) {
                            Text("Quiz score: \(s) pts").font(.system(size: 10)).foregroundColor(.white.opacity(0.3))
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(14)
                .background(RoundedRectangle(cornerRadius: 12).fill(course.accent.opacity(0.06)))
            } else {
                Button {
                    state.progress.markComplete(module.id, score: 0)
                    state.save()
                } label: {
                    Text("Mark Complete (Skip Quiz) →")
                        .font(.system(size: 14, weight: .bold)).foregroundColor(course.accent)
                        .frame(maxWidth: .infinity).padding(.vertical, 14)
                        .background(RoundedRectangle(cornerRadius: 12)
                            .stroke(course.accent.opacity(0.3), lineWidth: 1))
                }
            }
        }
    }
}

// MARK: ══════════════════════════════════════════════════════
// QUIZ ENGINE
// ══════════════════════════════════════════════════════════

struct DDQuizEngineView: View {
    let questions: [DDQuestion]
    let accent: Color
    let onComplete: (Int) -> Void

    @State private var currentQ = 0
    @State private var selectedAnswer: Int? = nil
    @State private var showResult = false
    @State private var correctCount = 0
    @State private var answeredAll = false
    @State private var scores: [Bool] = []

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            if answeredAll {
                quizCompleteView
            } else {
                questionView
            }
        }
    }

    private var questionView: some View {
        let q = questions[currentQ]
        return VStack(alignment: .leading, spacing: 14) {
            // Progress
            HStack {
                Text("QUESTION \(currentQ + 1) OF \(questions.count)")
                    .font(.system(size: 9, weight: .black)).tracking(2).foregroundColor(accent.opacity(0.5))
                Spacer()
                ForEach(0..<questions.count, id: \.self) { i in
                    Circle()
                        .fill(i < scores.count
                              ? (scores[i] ? Color.green : Color.red)
                              : (i == currentQ ? accent : Color.white.opacity(0.15)))
                        .frame(width: 8, height: 8)
                }
            }

            Text(q.question)
                .font(.system(size: 15, weight: .bold)).foregroundColor(.white).lineSpacing(4)
                .padding(14)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.015)))

            // Answers
            ForEach(Array(q.options.enumerated()), id: \.0) { idx, option in
                answerButton(option, index: idx, correct: q.correctIndex, question: q)
            }

            // Bias note after answering
            if showResult, let bias = q.beliefBias {
                VStack(alignment: .leading, spacing: 6) {
                    Text("🧠  ASSUMPTION REVEALED").font(.system(size: 8, weight: .black)).tracking(2)
                        .foregroundColor(.purple.opacity(0.7))
                    Text(bias).font(.system(size: 11, weight: .medium)).foregroundColor(.white.opacity(0.5))
                        .lineSpacing(4).italic()
                }
                .padding(12)
                .background(RoundedRectangle(cornerRadius: 8).fill(Color.purple.opacity(0.06))
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.purple.opacity(0.1), lineWidth: 1)))
                .transition(.opacity.combined(with: .scale(scale: 0.95)))
            }

            // Next button
            if showResult {
                Button {
                    withAnimation(.spring(response: 0.3)) {
                        if currentQ < questions.count - 1 {
                            currentQ += 1
                            selectedAnswer = nil
                            showResult = false
                        } else {
                            answeredAll = true
                            onComplete(correctCount * 10)
                        }
                    }
                } label: {
                    Text(currentQ < questions.count - 1 ? "Next Question →" : "See Results →")
                        .font(.system(size: 14, weight: .bold)).foregroundColor(.black)
                        .frame(maxWidth: .infinity).padding(.vertical, 14)
                        .background(RoundedRectangle(cornerRadius: 12).fill(accent))
                }
                .transition(.opacity)
            }
        }
    }

    private func answerButton(_ text: String, index: Int, correct: Int, question: DDQuestion) -> some View {
        let selected = selectedAnswer == index
        let isCorrect = index == correct
        let revealed = showResult

        var bg: Color {
            if !revealed { return selected ? accent.opacity(0.15) : Color.white.opacity(0.012) }
            if isCorrect { return Color.green.opacity(0.15) }
            if selected && !isCorrect { return Color.red.opacity(0.12) }
            return Color.white.opacity(0.008)
        }

        var border: Color {
            if !revealed { return selected ? accent.opacity(0.4) : Color.white.opacity(0.04) }
            if isCorrect { return Color.green.opacity(0.5) }
            if selected && !isCorrect { return Color.red.opacity(0.4) }
            return Color.white.opacity(0.04)
        }

        var icon: String {
            if !revealed { return selected ? "circle.fill" : "circle" }
            if isCorrect { return "checkmark.circle.fill" }
            if selected { return "xmark.circle.fill" }
            return "circle"
        }

        var iconColor: Color {
            if !revealed { return selected ? accent : .white.opacity(0.2) }
            if isCorrect { return .green }
            if selected { return .red }
            return .white.opacity(0.15)
        }

        return Button {
            guard !revealed else { return }
            withAnimation(.spring(response: 0.3)) {
                selectedAnswer = index
                showResult = true
                scores.append(isCorrect)
                if isCorrect { correctCount += 1 }
            }
        } label: {
            HStack(spacing: 12) {
                Image(systemName: icon).font(.system(size: 16, weight: .bold)).foregroundColor(iconColor)
                Text(text).font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.75))
                    .lineSpacing(3).multilineTextAlignment(.leading)
                Spacer()
            }
            .padding(12)
            .background(RoundedRectangle(cornerRadius: 10).fill(bg)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(border, lineWidth: 1)))
        }
        .disabled(revealed)
        .animation(.easeInOut(duration: 0.2), value: revealed)
    }

    // MARK: Explanation reveal

    private var quizCompleteView: some View {
        let pct = Int((Double(correctCount) / Double(questions.count)) * 100)
        let grade: String
        let message: String
        switch pct {
        case 90...100: grade = "🥇"; message = "Excellent. Your civics knowledge is strong."
        case 70...89:  grade = "🥈"; message = "Solid — you have a real foundation to build on."
        case 50...69:  grade = "🥉"; message = "Good start. The questions you missed often reflect common assumptions. Review the Belief Audit."
        default:       grade = "📚"; message = "Several of your answers reflect common misconceptions. This is exactly what this course is for — check the explanations below."
        }

        return VStack(alignment: .leading, spacing: 14) {
            // Score card
            VStack(spacing: 8) {
                Text(grade).font(.system(size: 44))
                Text("\(correctCount)/\(questions.count) Correct — \(pct)%")
                    .font(.system(size: 20, weight: .black)).foregroundColor(accent)
                Text(message).font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.5))
                    .multilineTextAlignment(.center).lineSpacing(3)
            }
            .frame(maxWidth: .infinity)
            .padding(20)
            .background(RoundedRectangle(cornerRadius: 12).fill(accent.opacity(0.06))
                .overlay(RoundedRectangle(cornerRadius: 12).stroke(accent.opacity(0.12), lineWidth: 1)))

            // All explanations
            Text("ANSWER EXPLANATIONS").font(.system(size: 9, weight: .black)).tracking(2)
                .foregroundColor(.white.opacity(0.2))

            ForEach(Array(questions.enumerated()), id: \.0) { idx, q in
                VStack(alignment: .leading, spacing: 8) {
                    HStack(alignment: .top, spacing: 8) {
                        Text(idx < scores.count && scores[idx] ? "✓" : "✗")
                            .font(.system(size: 14, weight: .black))
                            .foregroundColor(idx < scores.count && scores[idx] ? .green : .red)
                        Text(q.question).font(.system(size: 11, weight: .bold)).foregroundColor(.white.opacity(0.7))
                            .lineSpacing(3)
                    }
                    Text("Correct: \(q.options[q.correctIndex])")
                        .font(.system(size: 10, weight: .bold)).foregroundColor(.green.opacity(0.7))
                    Text(q.explanation).font(.system(size: 10, weight: .medium)).foregroundColor(.white.opacity(0.5))
                        .lineSpacing(3)
                }
                .padding(12)
                .background(RoundedRectangle(cornerRadius: 8).fill(Color.white.opacity(0.008)))
            }
        }
    }
}

// MARK: ══════════════════════════════════════════════════════
// RCV SIMULATOR
// ══════════════════════════════════════════════════════════

struct RCVSimulatorView: View {
    @Environment(\.dismiss) var dismiss

    @State private var scenario = 0
    @State private var showResult = false
    @State private var simulationRound = 0
    @State private var animating = false

    let scenarios: [(name: String, description: String, candidates: [(name: String, party: String, emoji: String)], votes: [[Int]]) ] = [
        (
            name: "2000 Florida — The Nader Effect",
            description: "The election that changed history. Al Gore lost Florida by 537 votes. Ralph Nader got 97,421 Florida votes — mostly from voters who preferred Gore to Bush. What if Florida had used RCV?",
            candidates: [
                ("Al Gore", "Democrat", "🔵"),
                ("George W. Bush", "Republican", "🔴"),
                ("Ralph Nader", "Green Party", "🟢")
            ],
            // Approximate vote distributions (simplified for simulation)
            // Each row: voter group. Each value: their ranking (0=first choice, 1=second, 2=third)
            // Gore voters: 2,912,253 | Bush voters: 2,912,790 | Nader voters: 97,421
            votes: [] // Handled in simulation logic
        ),
        (
            name: "3-Way Primary: Moderate vs Two Extremes",
            description: "A moderate candidate and two extreme candidates split a primary. Under plurality voting, the vote splits and an extreme wins with 38%. Under RCV, the moderate wins because they're most voters' second choice.",
            candidates: [
                ("Alex Moderate", "Independent", "🟡"),
                ("Dana Right", "Party Right", "🔴"),
                ("Blake Left", "Party Left", "🔵")
            ],
            votes: []
        ),
        (
            name: "Alaska 2022 Senate Race",
            description: "Lisa Murkowski (moderate Republican) vs Kelly Tshibaka (Trump-endorsed Republican) vs Patricia Chesbro (Democrat). Under RCV with nonpartisan primary, Murkowski won. Under old closed primary, Tshibaka likely would have won.",
            candidates: [
                ("Lisa Murkowski", "Mod. Republican", "🟣"),
                ("Kelly Tshibaka", "Trump-backed Rep.", "🔴"),
                ("Patricia Chesbro", "Democrat", "🔵")
            ],
            votes: []
        )
    ]

    struct RoundResult: Identifiable {
        let id = UUID()
        let round: Int
        let totals: [(name: String, votes: Int, pct: Double, emoji: String, eliminated: Bool)]
        let eliminated: String?
        let winner: String?
    }

    @State private var results: [RoundResult] = []

    // MARK: - Sub-views (extracted to help Swift type-checker)

    private let accentColor = Color(hex: "#FF7B3A")

    private var scenarioPicker: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("CHOOSE A SCENARIO").font(.system(size: 9, weight: .black)).tracking(2)
                .foregroundColor(.white.opacity(0.2))
            ForEach(Array(scenarios.enumerated()), id: \.0) { idx, s in
                Button { scenario = idx; results = []; showResult = false } label: {
                    HStack(spacing: 10) {
                        Circle().fill(scenario == idx ? Color(hex: "#FF7B3A") : Color.white.opacity(0.1))
                            .frame(width: 10, height: 10)
                        Text(s.name).font(.system(size: 12, weight: scenario == idx ? .bold : .medium))
                            .foregroundColor(scenario == idx ? .white : .white.opacity(0.4))
                        Spacer()
                    }
                    .padding(12)
                    .background(RoundedRectangle(cornerRadius: 8)
                        .fill(scenario == idx ? Color(hex: "#FF7B3A").opacity(0.08) : Color.white.opacity(0.01)))
                }
            }
        }
    }

    private var candidatesList: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("CANDIDATES").font(.system(size: 9, weight: .black)).tracking(2)
                .foregroundColor(.white.opacity(0.2))
            ForEach(Array(scenarios[scenario].candidates.enumerated()), id: \.0) { _, c in
                HStack(spacing: 10) {
                    Text(c.emoji).font(.system(size: 20))
                    VStack(alignment: .leading, spacing: 2) {
                        Text(c.name).font(.system(size: 12, weight: .bold)).foregroundColor(.white)
                        Text(c.party).font(.system(size: 9)).foregroundColor(.white.opacity(0.3))
                    }
                }
                .padding(10)
                .background(RoundedRectangle(cornerRadius: 8).fill(Color.white.opacity(0.012)))
            }
        }
    }

    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 0.02, green: 0.03, blue: 0.06).ignoresSafeArea()

                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 20) {
                        scenarioPicker

                        // Scenario description
                        Text(scenarios[scenario].description)
                            .font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.5))
                            .lineSpacing(4).italic()
                            .padding(12)
                            .background(RoundedRectangle(cornerRadius: 8).fill(Color.white.opacity(0.008)))

                        candidatesList

                        // Run simulation
                        Button {
                            withAnimation { runSimulation() }
                        } label: {
                            Text("Run Both Voting Systems →")
                                .font(.system(size: 15, weight: .bold)).foregroundColor(.black)
                                .frame(maxWidth: .infinity).padding(.vertical, 15)
                                .background(RoundedRectangle(cornerRadius: 14).fill(Color(hex: "#FF7B3A")))
                        }

                        // Results
                        if showResult { simulationResults }

                        Spacer(minLength: 40)
                    }
                    .padding(.horizontal, 18).padding(.top, 16)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button { dismiss() } label: {
                        Image(systemName: "xmark").font(.system(size: 14, weight: .semibold)).foregroundColor(.white)
                    }
                }
                ToolbarItem(placement: .principal) {
                    Text("RCV Simulator").font(.system(size: 16, weight: .bold)).foregroundColor(.white)
                }
            }
        }
    }

    private func runSimulation() {
        results = generateResults(for: scenario)
        showResult = true
    }

    private func generateResults(for s: Int) -> [RoundResult] {
        switch s {
        case 0: // 2000 Florida Nader
            let pluralityResult = RoundResult(
                round: 0,
                totals: [
                    ("Gore 🔵", 2912253, 48.84, "🔵", false),
                    ("Bush 🔴", 2912790, 48.85, "🔴", false),
                    ("Nader 🟢", 97421, 1.63, "🟢", true)
                ],
                eliminated: nil,
                winner: "Bush 🔴 (by 537 votes)"
            )
            let rcvRound1 = RoundResult(
                round: 1,
                totals: [
                    ("Gore", 2912253, 48.84, "🔵", false),
                    ("Bush", 2912790, 48.85, "🔴", false),
                    ("Nader", 97421, 1.63, "🟢", true)
                ],
                eliminated: "Nader (last place — eliminated)",
                winner: nil
            )
            let rcvRound2 = RoundResult(
                round: 2,
                totals: [
                    ("Gore", 3002953, 50.35, "🔵", false),   // ~92% of Nader's votes
                    ("Bush", 2919511, 48.95, "🔴", false)     // ~8% of Nader's votes
                ],
                eliminated: nil,
                winner: "Gore 🔵 — MAJORITY WINNER (RCV changes outcome)"
            )
            return [pluralityResult, rcvRound1, rcvRound2]

        case 1: // 3-way moderate
            let pluralityResult = RoundResult(
                round: 0,
                totals: [
                    ("Dana Right", 38000, 38.0, "🔴", false),
                    ("Alex Moderate", 32000, 32.0, "🟡", false),
                    ("Blake Left", 30000, 30.0, "🔵", true)
                ],
                eliminated: nil,
                winner: "Dana Right 🔴 (plurality — 38%, not majority)"
            )
            let rcvRound1 = RoundResult(
                round: 1,
                totals: [
                    ("Dana Right", 38000, 38.0, "🔴", false),
                    ("Alex Moderate", 32000, 32.0, "🟡", false),
                    ("Blake Left", 30000, 30.0, "🔵", true)
                ],
                eliminated: "Blake Left (eliminated — last place)",
                winner: nil
            )
            let rcvRound2 = RoundResult(
                round: 2,
                totals: [
                    ("Alex Moderate", 56500, 56.5, "🟡", false),   // Moderate + most left votes
                    ("Dana Right", 43500, 43.5, "🔴", false)
                ],
                eliminated: nil,
                winner: "Alex Moderate 🟡 — MAJORITY WINNER (RCV reverses outcome)"
            )
            return [pluralityResult, rcvRound1, rcvRound2]

        default: // Alaska 2022
            let pluralityResult = RoundResult(
                round: 0,
                totals: [
                    ("Tshibaka", 45800, 46.0, "🔴", false),
                    ("Murkowski", 39300, 39.4, "🟣", false),
                    ("Chesbro", 14700, 14.7, "🔵", true)
                ],
                eliminated: nil,
                winner: "Tshibaka 🔴 (plurality — would have won under old system)"
            )
            let rcvRound1 = RoundResult(
                round: 1,
                totals: [
                    ("Tshibaka", 45800, 46.0, "🔴", false),
                    ("Murkowski", 39300, 39.4, "🟣", false),
                    ("Chesbro", 14700, 14.7, "🔵", true)
                ],
                eliminated: "Chesbro (eliminated — last place)",
                winner: nil
            )
            let rcvRound2 = RoundResult(
                round: 2,
                totals: [
                    ("Murkowski", 52200, 53.7, "🟣", false),   // Most Democrat 2nd-choices
                    ("Tshibaka", 45000, 46.3, "🔴", false)
                ],
                eliminated: nil,
                winner: "Murkowski 🟣 — MAJORITY WINNER (RCV protects moderate)"
            )
            return [pluralityResult, rcvRound1, rcvRound2]
        }
    }

    private var simulationResults: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Plurality result
            resultBlock(
                title: "🗳️  PLURALITY VOTING (Current System)",
                result: results[0],
                color: .red
            )

            Text("VS.").font(.system(size: 18, weight: .black)).foregroundColor(.white.opacity(0.3))
                .frame(maxWidth: .infinity, alignment: .center)

            // RCV rounds
            VStack(alignment: .leading, spacing: 12) {
                Text("🏆  RANKED CHOICE VOTING").font(.system(size: 9, weight: .black)).tracking(2)
                    .foregroundColor(Color(hex: "#FF7B3A").opacity(0.7))

                ForEach(Array(results.dropFirst().enumerated()), id: \.0) { idx, round in
                    resultBlock(
                        title: round.winner != nil ? "Final Round \(idx + 1)" : "Round \(idx + 1) — Elimination",
                        result: round,
                        color: Color(hex: "#FF7B3A")
                    )
                }
            }

            // Key takeaway
            if let lastResult = results.last, let winner = lastResult.winner {
                VStack(alignment: .leading, spacing: 6) {
                    Text("KEY INSIGHT").font(.system(size: 9, weight: .black)).tracking(2)
                        .foregroundColor(.white.opacity(0.25))
                    Text("Under RCV, \(winner.contains("reverses") || winner.contains("changes") || winner.contains("protects") ? "the outcome changes from plurality voting" : "the same winner is confirmed with majority support"). This is the spoiler effect — and RCV eliminates it.")
                        .font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.5))
                        .lineSpacing(4)
                }
                .padding(12)
                .background(RoundedRectangle(cornerRadius: 8).fill(Color(hex: "#FF7B3A").opacity(0.06)))
            }
        }
    }

    private func resultBlock(title: String, result: RoundResult, color: Color) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title).font(.system(size: 10, weight: .black)).tracking(1.5).foregroundColor(color)

            ForEach(result.totals, id: \.name) { candidate in
                HStack(spacing: 8) {
                    Text(candidate.emoji).font(.system(size: 16))
                    Text(candidate.name).font(.system(size: 11, weight: .bold))
                        .foregroundColor(candidate.eliminated ? .white.opacity(0.25) : .white)
                        .frame(width: 110, alignment: .leading)
                    GeometryReader { geo in
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 3).fill(Color.white.opacity(0.04)).frame(height: 18)
                            RoundedRectangle(cornerRadius: 3)
                                .fill(candidate.eliminated ? Color.white.opacity(0.1) : color.opacity(0.5))
                                .frame(width: max(4, geo.size.width * (candidate.pct / 100)), height: 18)
                        }
                    }
                    .frame(height: 18)
                    Text(String(format: "%.1f%%", candidate.pct))
                        .font(.system(size: 10, weight: .bold))
                        .foregroundColor(candidate.eliminated ? .white.opacity(0.2) : color.opacity(0.8))
                        .frame(width: 45, alignment: .trailing)
                }
            }

            if let elim = result.eliminated {
                Text("⚡ \(elim)").font(.system(size: 10, weight: .bold))
                    .foregroundColor(.orange.opacity(0.7)).padding(.top, 2)
            }

            if let winner = result.winner {
                Text("🏆 \(winner)").font(.system(size: 11, weight: .black))
                    .foregroundColor(color).padding(.top, 4)
                    .padding(8).background(RoundedRectangle(cornerRadius: 6).fill(color.opacity(0.08)))
            }
        }
        .padding(14)
        .background(RoundedRectangle(cornerRadius: 12).fill(color.opacity(0.04))
            .overlay(RoundedRectangle(cornerRadius: 12).stroke(color.opacity(0.12), lineWidth: 1)))
    }
}

// MARK: ══════════════════════════════════════════════════════
// MARKDOWN RENDERER
// ══════════════════════════════════════════════════════════

struct DDMarkdownBodyView: View {
    let text: String
    let accent: Color

    var body: some View {
        VStack(alignment: .leading, spacing: 11) {
            ForEach(parseBlocks(), id: \.id) { block in
                if block.isHeading {
                    Text(block.content)
                        .font(.system(size: 13, weight: .black))
                        .foregroundColor(accent.opacity(0.85))
                        .padding(.top, 8)
                } else if block.isBullet {
                    HStack(alignment: .top, spacing: 8) {
                        Text("—").font(.system(size: 12)).foregroundColor(accent.opacity(0.5))
                            .padding(.top, 1)
                        buildText(block.content)
                            .font(.system(size: 13))
                            .foregroundColor(.white.opacity(0.65))
                            .lineSpacing(4)
                    }
                } else {
                    buildText(block.content)
                        .font(.system(size: 13))
                        .foregroundColor(.white.opacity(0.65))
                        .lineSpacing(5)
                }
            }
        }
    }

    private func buildText(_ raw: String) -> Text {
        var result = Text("")
        let parts = raw.components(separatedBy: "**")
        for (i, part) in parts.enumerated() {
            result = result + (i % 2 == 0
                ? Text(part)
                : Text(part).bold().foregroundColor(.white.opacity(0.9)))
        }
        return result
    }

    struct Block: Identifiable {
        let id = UUID()
        let content: String
        let isHeading: Bool
        let isBullet: Bool
    }

    private func parseBlocks() -> [Block] {
        let raw = text.trimmingCharacters(in: .whitespacesAndNewlines)
        return raw.components(separatedBy: "\n\n")
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            .filter { !$0.isEmpty }
            .flatMap { para -> [Block] in
                if para.hasPrefix("**") && para.hasSuffix("**") {
                    let clean = para.replacingOccurrences(of: "**", with: "")
                    return [Block(content: clean, isHeading: true, isBullet: false)]
                }
                // Handle bullet lists (— or - prefixed lines)
                if para.contains("\n— ") || para.hasPrefix("— ") {
                    return para.components(separatedBy: "\n").compactMap { line in
                        let trimmed = line.trimmingCharacters(in: .whitespaces)
                        if trimmed.isEmpty { return nil }
                        if trimmed.hasPrefix("— ") {
                            return Block(content: String(trimmed.dropFirst(2)), isHeading: false, isBullet: true)
                        }
                        return Block(content: trimmed, isHeading: false, isBullet: false)
                    }
                }
                return [Block(content: para, isHeading: false, isBullet: false)]
            }
    }
}
