// TeslaResonanceCourseView.swift
// SunFlow: Reignited — Aperture

import SwiftUI

// MARK: - Hub

struct TeslaResonanceCourseView: View {
    @Environment(\.dismiss) var dismiss
    @State private var progress = TeslaProgress()
    @State private var selectedModule: TeslaModule? = nil
    @State private var showModule = false
    @State private var showCitations = false
    @State private var animatingArcs = false

    private let gold = Color(hex: "#FFD700")
    private let deep = Color(red: 0.02, green: 0.02, blue: 0.08)

    var resonanceScore: Int { progress.resonanceScore }

    var body: some View {
        NavigationStack {
            ZStack {
                deep.ignoresSafeArea()
                // Animated electric arcs background
                electricBackground
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 20) {
                        Spacer().frame(height: 12)
                        heroHeader
                        resonanceGauge
                        citationsBanner
                        moduleGrid
                        Spacer(minLength: 50)
                    }
                    .padding(.horizontal, 18)
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
                    Text("⚡ Resonant Awakening").font(.system(size: 15, weight: .bold)).foregroundColor(.white)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button { showCitations = true } label: {
                        Image(systemName: "books.vertical.fill").font(.system(size: 14)).foregroundColor(gold.opacity(0.7))
                    }
                }
            }
            .withCitationsHint()
            .fullScreenCover(isPresented: $showModule) {
                if let mod = selectedModule { TeslaModuleReaderView(module: mod, progress: $progress) }
            }
            .sheet(isPresented: $showCitations) {
                CourseCreditsModal(citations: TeslaResonanceCitations.all)
            }
            .onAppear { progress.load(); withAnimation(.linear(duration: 8).repeatForever(autoreverses: true)) { animatingArcs = true } }
        }
    }

    private var electricBackground: some View {
        ZStack {
            ForEach(0..<6) { i in
                RoundedRectangle(cornerRadius: 2)
                    .fill(gold.opacity(animatingArcs ? 0.03 : 0.015))
                    .frame(width: 1.5, height: CGFloat.random(in: 40...120))
                    .offset(x: CGFloat(i) * 60 - 140, y: animatingArcs ? CGFloat.random(in: -200...200) : 0)
                    .blur(radius: 1)
            }
        }
        .ignoresSafeArea()
        .animation(.easeInOut(duration: Double.random(in: 2...4)).repeatForever(autoreverses: true), value: animatingArcs)
    }

    private var heroHeader: some View {
        VStack(spacing: 12) {
            ZStack {
                Circle().fill(gold.opacity(0.08)).frame(width: 140, height: 140).blur(radius: 30)
                Circle().stroke(gold.opacity(0.2), lineWidth: 1).frame(width: 130, height: 130)
                Circle().stroke(gold.opacity(0.1), lineWidth: 1).frame(width: 100, height: 100)
                Text("⚡").font(.system(size: 56))
            }
            VStack(spacing: 6) {
                Text("TESLA · RESONANT AWAKENING").font(.system(size: 9, weight: .black)).tracking(2).foregroundColor(gold.opacity(0.6))
                Text("Tesla's Vibrational Keys to\nEnergetic Mastery").font(.system(size: 20, weight: .black)).foregroundColor(.white).multilineTextAlignment(.center)
                Text("9 modules · 27 lessons · Practice-first").font(.system(size: 11)).foregroundColor(.white.opacity(0.35))
            }
        }
    }

    private var resonanceGauge: some View {
        VStack(spacing: 8) {
            HStack {
                Text("RESONANCE SCORE").font(.system(size: 9, weight: .black)).tracking(2).foregroundColor(gold.opacity(0.5))
                Spacer()
                Text("\(resonanceScore)/100").font(.system(size: 12, weight: .black)).foregroundColor(gold.opacity(0.8))
            }
            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    Capsule().fill(Color.white.opacity(0.04)).frame(height: 8)
                    Capsule().fill(LinearGradient(colors: [gold.opacity(0.5), gold], startPoint: .leading, endPoint: .trailing))
                        .frame(width: geo.size.width * CGFloat(resonanceScore) / 100, height: 8)
                        .animation(.spring(response: 0.6), value: resonanceScore)
                }
            }.frame(height: 8)
            HStack {
                Text("You are the primary technology.").font(.system(size: 10)).foregroundColor(.white.opacity(0.35)).italic()
                Spacer()
                let done = progress.completedModules.count
                Text("\(done)/9 modules").font(.system(size: 10)).foregroundColor(.white.opacity(0.3))
            }
        }
        .padding(14)
        .background(RoundedRectangle(cornerRadius: 12).fill(gold.opacity(0.04))
            .overlay(RoundedRectangle(cornerRadius: 12).stroke(gold.opacity(0.1), lineWidth: 1)))
    }

    // First-time citations hint
    private var citationsBanner: some View {
        Button { showCitations = true } label: {
            HStack(spacing: 12) {
                Image(systemName: "books.vertical.fill").font(.system(size: 16)).foregroundColor(gold.opacity(0.7))
                VStack(alignment: .leading, spacing: 2) {
                    Text("Sources, Research & Further Reading")
                        .font(.system(size: 12, weight: .bold)).foregroundColor(.white.opacity(0.7))
                    Text("Tap anytime to see citations and go deeper")
                        .font(.system(size: 9)).foregroundColor(.white.opacity(0.35))
                }
                Spacer()
                Image(systemName: "chevron.right").font(.system(size: 10)).foregroundColor(gold.opacity(0.3))
            }
            .padding(12)
            .background(RoundedRectangle(cornerRadius: 10).fill(gold.opacity(0.04))
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(gold.opacity(0.15), lineWidth: 1)))
        }
    }

    private var moduleGrid: some View {
        VStack(spacing: 10) {
            Text("9-WEEK CURRICULUM").font(.system(size: 9, weight: .black)).tracking(2).foregroundColor(.white.opacity(0.2))
                .frame(maxWidth: .infinity, alignment: .leading)
            ForEach(teslaResonanceCourse) { mod in
                moduleCard(mod)
            }
        }
    }

    private func moduleCard(_ mod: TeslaModule) -> some View {
        let done = progress.completedModules.contains(mod.id)
        let prevDone = mod.number == 1 || progress.completedModules.contains(teslaResonanceCourse[mod.number - 2].id)
        let locked = !prevDone && mod.number > 1
        let modColor = Color(hex: mod.colorHex)

        return Button {
            guard !locked else { return }
            selectedModule = mod
            showModule = true
        } label: {
            HStack(spacing: 14) {
                moduleIcon(mod: mod, done: done, locked: locked, modColor: modColor)
                moduleInfo(mod: mod, done: done, locked: locked, modColor: modColor)
                Spacer()
                if !locked {
                    Image(systemName: "chevron.right").font(.system(size: 10)).foregroundColor(.white.opacity(0.15))
                }
            }
            .padding(13)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(done ? modColor.opacity(0.06) : Color.white.opacity(0.008))
                    .overlay(RoundedRectangle(cornerRadius: 12).stroke(done ? modColor.opacity(0.2) : Color.clear, lineWidth: 1))
            )
            .opacity(locked ? 0.4 : 1)
        }
    }

    private func moduleIcon(mod: TeslaModule, done: Bool, locked: Bool, modColor: Color) -> some View {
        ZStack {
            Circle().fill(modColor.opacity(done ? 0.3 : 0.1)).frame(width: 52, height: 52)
            if done {
                Image(systemName: "checkmark").font(.system(size: 14, weight: .bold)).foregroundColor(modColor)
            } else if locked {
                Image(systemName: "lock.fill").font(.system(size: 14)).foregroundColor(.white.opacity(0.2))
            } else {
                Text(mod.emoji).font(.system(size: 24))
            }
        }
    }

    private func moduleInfo(mod: TeslaModule, done: Bool, locked: Bool, modColor: Color) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack(spacing: 6) {
                Text("Week \(mod.number)").font(.system(size: 8, weight: .black)).tracking(1).foregroundColor(modColor.opacity(0.6))
                Text("·").foregroundColor(.white.opacity(0.2))
                Text("\(mod.lessons.count) lessons").font(.system(size: 8)).foregroundColor(.white.opacity(0.3))
            }
            Text(mod.title).font(.system(size: 14, weight: .bold)).foregroundColor(locked ? .white.opacity(0.3) : .white)
            Text(mod.subtitle).font(.system(size: 9)).foregroundColor(.white.opacity(locked ? 0.2 : 0.4))
            if !locked && !done { moduleProgressBar(mod: mod, modColor: modColor) }
        }
    }

    @ViewBuilder
    private func moduleProgressBar(mod: TeslaModule, modColor: Color) -> some View {
        let frac = progress.completionFraction(for: mod)
        if frac > 0 {
            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    Capsule().fill(Color.white.opacity(0.04)).frame(height: 3)
                    Capsule().fill(modColor).frame(width: geo.size.width * frac, height: 3)
                }
            }.frame(height: 3).padding(.top, 2)
        }
    }
}

// MARK: - Module Reader

struct TeslaModuleReaderView: View {
    let module: TeslaModule
    @Binding var progress: TeslaProgress
    @Environment(\.dismiss) var dismiss
    @State private var tab = 0
    @State private var showCitations = false
    @State private var selectedLesson: TeslaLesson? = nil
    @State private var showLesson = false

    private var accent: Color { Color(hex: module.colorHex) }

    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 0.02, green: 0.02, blue: 0.08).ignoresSafeArea()
                VStack(spacing: 0) {
                    tabBar
                    ScrollView(showsIndicators: false) {
                        VStack(alignment: .leading, spacing: 14) {
                            moduleHero
                            if tab == 0 { lessonsTab }
                            else if tab == 1 { practiceTab }
                            else { quizTab }
                            Spacer(minLength: 40)
                        }
                        .padding(.horizontal, 18).padding(.top, 14)
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button { dismiss() } label: { Image(systemName: "xmark").foregroundColor(.white) }
                }
                ToolbarItem(placement: .principal) {
                    HStack(spacing: 6) {
                        Text(module.emoji)
                        Text(module.title).font(.system(size: 14, weight: .bold)).foregroundColor(.white)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button { showCitations = true } label: {
                        Image(systemName: "books.vertical.fill").font(.system(size: 13)).foregroundColor(accent.opacity(0.7))
                    }
                }
            }
            .sheet(isPresented: $showCitations) {
                CourseCreditsModal(citations: TeslaResonanceCitations.all)
            }
            .fullScreenCover(isPresented: $showLesson) {
                if let lesson = selectedLesson {
                    TeslaLessonView(lesson: lesson, moduleAccent: accent, onComplete: {
                        progress.completeLesson(lesson.id)
                        showLesson = false
                    })
                }
            }
        }
    }

    private var tabBar: some View {
        HStack(spacing: 0) {
            ForEach(Array(["Lessons","Practice","Quiz"].enumerated()), id: \.0) { idx, name in
                Button { withAnimation { tab = idx } } label: {
                    VStack(spacing: 3) {
                        Text(name).font(.system(size: 10, weight: tab == idx ? .black : .medium))
                            .foregroundColor(tab == idx ? accent : .white.opacity(0.35))
                        (tab == idx ? RoundedRectangle(cornerRadius: 1).fill(accent) : RoundedRectangle(cornerRadius: 1).fill(Color.clear))
                            .frame(height: 2).padding(.horizontal, 8)
                    }
                    .frame(maxWidth: .infinity).padding(.vertical, 10)
                }
            }
        }
        .background(Color.white.opacity(0.02))
        .overlay(Rectangle().frame(height: 1).foregroundColor(.white.opacity(0.04)), alignment: .bottom)
    }

    private var moduleHero: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("WEEK \(module.number)").font(.system(size: 8, weight: .black)).tracking(2).foregroundColor(accent.opacity(0.5))
            Text(module.subtitle).font(.system(size: 13, weight: .medium)).foregroundColor(.white.opacity(0.5))
        }
    }

    private var lessonsTab: some View {
        VStack(spacing: 10) {
            ForEach(module.lessons) { lesson in
                let done = progress.completedLessons.contains(lesson.id)
                Button {
                    selectedLesson = lesson
                    showLesson = true
                } label: {
                    HStack(spacing: 12) {
                        ZStack {
                            Circle().fill(done ? accent.opacity(0.25) : accent.opacity(0.08)).frame(width: 44, height: 44)
                            if done { Image(systemName: "checkmark").font(.system(size: 13, weight: .bold)).foregroundColor(accent) }
                            else { Image(systemName: lesson.icon).font(.system(size: 16)).foregroundColor(accent.opacity(0.7)) }
                        }
                        VStack(alignment: .leading, spacing: 4) {
                            Text(lesson.title).font(.system(size: 13, weight: .bold)).foregroundColor(.white)
                            Text("\(lesson.duration) min read").font(.system(size: 9)).foregroundColor(.white.opacity(0.35))
                        }
                        Spacer()
                        Image(systemName: "chevron.right").font(.system(size: 10)).foregroundColor(.white.opacity(0.15))
                    }
                    .padding(12)
                    .background(RoundedRectangle(cornerRadius: 10).fill(done ? accent.opacity(0.05) : Color.white.opacity(0.008))
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(done ? accent.opacity(0.15) : Color.clear, lineWidth: 1)))
                }
            }
            // Mark module complete
            if progress.completedLessons.isSuperset(of: Set(module.lessons.map { $0.id })) && !progress.completedModules.contains(module.id) {
                Button {
                    progress.completeModule(module.id)
                } label: {
                    Text("✓ Mark Week \(module.number) Complete")
                        .font(.system(size: 14, weight: .bold)).foregroundColor(.black)
                        .frame(maxWidth: .infinity).padding(.vertical, 14)
                        .background(RoundedRectangle(cornerRadius: 12).fill(accent))
                }
                .padding(.top, 6)
            }
        }
    }

    private var practiceTab: some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack(spacing: 6) {
                Text("⚗️").font(.system(size: 14))
                Text("THIS WEEK'S PRACTICES").font(.system(size: 9, weight: .black)).tracking(2).foregroundColor(accent.opacity(0.5))
            }
            ForEach(module.lessons) { lesson in
                VStack(alignment: .leading, spacing: 8) {
                    Text(lesson.title).font(.system(size: 12, weight: .black)).foregroundColor(accent.opacity(0.8))
                    Text(lesson.practice).font(.system(size: 12)).foregroundColor(.white.opacity(0.65)).lineSpacing(4)
                }
                .padding(12)
                .background(RoundedRectangle(cornerRadius: 10).fill(accent.opacity(0.04))
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(accent.opacity(0.08), lineWidth: 1)))
            }
            VStack(alignment: .leading, spacing: 8) {
                Text("WEEKLY EXPERIMENT").font(.system(size: 9, weight: .black)).tracking(2).foregroundColor(.white.opacity(0.3))
                Text(module.weeklyExperiment).font(.system(size: 12)).foregroundColor(.white.opacity(0.6)).lineSpacing(4)
            }
            .padding(12)
            .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.008)))

            // Journal prompts
            VStack(alignment: .leading, spacing: 8) {
                Text("JOURNAL PROMPTS").font(.system(size: 9, weight: .black)).tracking(2).foregroundColor(.white.opacity(0.3))
                ForEach(Array(module.lessons.enumerated()), id: \.0) { _, lesson in
                    Text("• \(lesson.journalPrompt)").font(.system(size: 11)).foregroundColor(.white.opacity(0.5)).lineSpacing(3)
                }
            }
            .padding(12)
            .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.008)))
        }
    }

    private var quizTab: some View {
        TeslaQuizView(questions: module.quizQuestions, accent: accent, moduleId: module.id, progress: $progress)
    }
}

// MARK: - Lesson Reader

struct TeslaLessonView: View {
    let lesson: TeslaLesson
    let moduleAccent: Color
    let onComplete: () -> Void
    @Environment(\.dismiss) var dismiss
    @State private var showCitations = false

    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 0.02, green: 0.02, blue: 0.08).ignoresSafeArea()
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 18) {
                        Spacer().frame(height: 8)
                        HStack(spacing: 8) {
                            Image(systemName: lesson.icon).font(.system(size: 14)).foregroundColor(moduleAccent.opacity(0.7))
                            Text("\(lesson.duration) min").font(.system(size: 9, weight: .bold)).foregroundColor(.white.opacity(0.3))
                        }
                        DDMarkdownBodyView(text: lesson.body, accent: moduleAccent)
                        // Practice box
                        VStack(alignment: .leading, spacing: 8) {
                            HStack(spacing: 6) {
                                Text("⚗️").font(.system(size: 13))
                                Text("PRACTICE").font(.system(size: 9, weight: .black)).tracking(2).foregroundColor(moduleAccent.opacity(0.5))
                            }
                            Text(lesson.practice).font(.system(size: 12)).foregroundColor(.white.opacity(0.7)).lineSpacing(4)
                        }
                        .padding(14)
                        .background(RoundedRectangle(cornerRadius: 12).fill(moduleAccent.opacity(0.06))
                            .overlay(RoundedRectangle(cornerRadius: 12).stroke(moduleAccent.opacity(0.12), lineWidth: 1)))
                        // Journal
                        VStack(alignment: .leading, spacing: 8) {
                            Text("📓 JOURNAL").font(.system(size: 9, weight: .black)).tracking(2).foregroundColor(.white.opacity(0.3))
                            Text(lesson.journalPrompt).font(.system(size: 12)).foregroundColor(.white.opacity(0.55)).lineSpacing(4).italic()
                        }
                        .padding(12)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.008)))

                        Button { onComplete() } label: {
                            Text("Complete Lesson ✓")
                                .font(.system(size: 14, weight: .bold)).foregroundColor(.black)
                                .frame(maxWidth: .infinity).padding(.vertical, 14)
                                .background(RoundedRectangle(cornerRadius: 12).fill(moduleAccent))
                        }
                        .padding(.top, 6)
                        Spacer(minLength: 40)
                    }
                    .padding(.horizontal, 18)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button { dismiss() } label: { Image(systemName: "chevron.left").foregroundColor(.white) }
                }
                ToolbarItem(placement: .principal) {
                    Text(lesson.title).font(.system(size: 14, weight: .bold)).foregroundColor(.white)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button { showCitations = true } label: {
                        Image(systemName: "books.vertical.fill").font(.system(size: 13)).foregroundColor(moduleAccent.opacity(0.6))
                    }
                }
            }
            .sheet(isPresented: $showCitations) {
                CourseCreditsModal(citations: TeslaResonanceCitations.all)
            }
        }
    }
}

// MARK: - Quiz

struct TeslaQuizView: View {
    let questions: [TeslaQuizQuestion]
    let accent: Color
    let moduleId: String
    @Binding var progress: TeslaProgress
    @State private var currentQ = 0
    @State private var selectedAnswer: Int? = nil
    @State private var showExplanation = false
    @State private var correctCount = 0
    @State private var done = false

    var body: some View {
        if done {
            quizResultView
        } else if !questions.isEmpty {
            questionView(questions[currentQ])
        } else {
            Text("No questions yet").foregroundColor(.white.opacity(0.4))
        }
    }

    private func questionView(_ q: TeslaQuizQuestion) -> some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack {
                Text("QUIZ").font(.system(size: 8, weight: .black)).tracking(2).foregroundColor(accent.opacity(0.5))
                Spacer()
                Text("\(currentQ + 1)/\(questions.count)").font(.system(size: 11)).foregroundColor(.white.opacity(0.3))
            }
            Text(q.question).font(.system(size: 14, weight: .bold)).foregroundColor(.white).lineSpacing(4)
            ForEach(Array(q.options.enumerated()), id: \.0) { idx, opt in
                let isCorrect = idx == q.correctIndex
                let isSelected = selectedAnswer == idx
                let circleFill: Color = {
                    if !showExplanation { return Color.white.opacity(selectedAnswer == idx ? 0.1 : 0.04) }
                    if isCorrect { return Color.green.opacity(0.3) }
                    if isSelected { return Color.red.opacity(0.2) }
                    return Color.white.opacity(0.04)
                }()
                let strokeColor: Color = (showExplanation && isCorrect) ? Color.green.opacity(0.4) : Color.white.opacity(0.04)
                Button {
                    guard !showExplanation else { return }
                    selectedAnswer = idx
                    if isCorrect { correctCount += 1 }
                    withAnimation { showExplanation = true }
                } label: {
                    HStack(spacing: 10) {
                        ZStack {
                            Circle().fill(circleFill).frame(width: 28, height: 28)
                            if showExplanation && isCorrect {
                                Image(systemName: "checkmark").font(.system(size: 11, weight: .bold)).foregroundColor(.green)
                            }
                        }
                        Text(opt).font(.system(size: 12)).foregroundColor(.white.opacity(0.75)).lineSpacing(3)
                        Spacer()
                    }
                    .padding(12)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.008))
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(strokeColor, lineWidth: 1)))
                }
            }
            if showExplanation {
                Text(q.explanation).font(.system(size: 11)).foregroundColor(accent.opacity(0.8)).lineSpacing(3)
                    .padding(10).background(RoundedRectangle(cornerRadius: 8).fill(accent.opacity(0.05)))
                    .transition(.opacity)
                Button {
                    if currentQ < questions.count - 1 {
                        withAnimation { currentQ += 1; selectedAnswer = nil; showExplanation = false }
                    } else { done = true }
                } label: {
                    Text(currentQ < questions.count - 1 ? "Next →" : "See Results →")
                        .font(.system(size: 14, weight: .bold)).foregroundColor(.black)
                        .frame(maxWidth: .infinity).padding(.vertical, 12)
                        .background(RoundedRectangle(cornerRadius: 10).fill(accent))
                }
            }
        }
    }

    private var quizResultView: some View {
        VStack(spacing: 16) {
            Text(correctCount == questions.count ? "⚡" : correctCount >= questions.count / 2 ? "✨" : "📚")
                .font(.system(size: 48))
            Text("\(correctCount)/\(questions.count) Correct")
                .font(.system(size: 24, weight: .black)).foregroundColor(.white)
            Text(correctCount == questions.count ? "Perfect resonance." : "Review the lesson content and retake when ready.")
                .font(.system(size: 12)).foregroundColor(.white.opacity(0.5)).multilineTextAlignment(.center)
            if correctCount >= questions.count / 2 {
                Button {
                    progress.completeLesson("quiz_\(moduleId)", points: correctCount * 3)
                } label: {
                    Text("Save Progress (+\(correctCount * 3) pts)")
                        .font(.system(size: 14, weight: .bold)).foregroundColor(.black)
                        .frame(maxWidth: .infinity).padding(.vertical, 12)
                        .background(RoundedRectangle(cornerRadius: 10).fill(accent))
                }
            }
        }
        .padding(20)
    }
}
