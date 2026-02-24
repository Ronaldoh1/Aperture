// FactoryMindsCourseView.swift
// SunFlow: Reignited — Aperture
//
// FACTORY MINDS: How School Was Built to Obey, Not Think
// UI — Hub, Lesson Reader, Belief Audit Tracker

import SwiftUI

// MARK: - State

class FactoryMindsState: ObservableObject {
    @Published var completedLessons: Set<String> = []
    @Published var selectedLesson: FMLesson? = nil
    @Published var showLesson = false

    private let key = "aperture_factory_minds_progress"

    var totalCompleted: Int { completedLessons.count }
    var progressFraction: Double { Double(completedLessons.count) / Double(factoryMindsCourse.lessons.count) }
    var isComplete: Bool { completedLessons.count == factoryMindsCourse.lessons.count }

    func markComplete(_ id: String) {
        completedLessons.insert(id)
        save()
    }

    func isLessonComplete(_ id: String) -> Bool { completedLessons.contains(id) }

    func save() {
        UserDefaults.standard.set(Array(completedLessons), forKey: key)
    }

    func load() {
        if let arr = UserDefaults.standard.array(forKey: key) as? [String] {
            completedLessons = Set(arr)
        }
    }
}

// MARK: - Hub View

struct FactoryMindsView: View {

    @Environment(\.dismiss) var dismiss
    @StateObject private var state = FactoryMindsState()

    private let accent = Color(red: 0.2, green: 0.85, blue: 0.65)
    private let bg1   = Color(red: 0.02, green: 0.04, blue: 0.06)
    private let bg2   = Color(red: 0.01, green: 0.06, blue: 0.04)

    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [bg1, bg2], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()

                ScrollView(showsIndicators: false) {
                    VStack(spacing: 20) {
                        heroSection
                        progressCard
                        lessonsGrid
                        closingQuote
                        Spacer(minLength: 40)
                    }
                    .padding(.horizontal, 20)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button { dismiss() } label: {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.white)
                    }
                }
                ToolbarItem(placement: .principal) {
                    HStack(spacing: 6) {
                        Text("🏭").font(.system(size: 13))
                        Text("Factory Minds")
                            .font(.system(size: 17, weight: .bold))
                            .foregroundColor(.white)
                    }
                }
            }
            .fullScreenCover(isPresented: $state.showLesson) {
                if let lesson = state.selectedLesson {
                    FactoryMindsLessonView(lesson: lesson, accent: accent, state: state)
                }
            }
            .onAppear { state.load() }
        }
    }

    // MARK: - Hero

    private var heroSection: some View {
        VStack(spacing: 14) {
            Spacer().frame(height: 16)

            ZStack {
                Circle().fill(accent.opacity(0.06)).frame(width: 130, height: 130).blur(radius: 30)
                Circle().fill(accent.opacity(0.04)).frame(width: 80, height: 80).blur(radius: 15)
                Text("🏭").font(.system(size: 52))
            }

            VStack(spacing: 6) {
                Text("FACTORY MINDS").font(.system(size: 11, weight: .black)).tracking(3).foregroundColor(accent.opacity(0.5))

                Text("How School Was Built to Obey, Not Think")
                    .font(.system(size: 20, weight: .black)).foregroundColor(.white)
                    .multilineTextAlignment(.center).lineSpacing(3)

                Text("Audit any belief. Trace its origin.\nDetermine if it's yours.")
                    .font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.35))
                    .multilineTextAlignment(.center).lineSpacing(3)
            }

            HStack(spacing: 16) {
                pill("6 Weeks")
                pill("~150 min")
                pill("Ron Hernandez")
            }
        }
    }

    private func pill(_ text: String) -> some View {
        Text(text).font(.system(size: 9, weight: .bold)).tracking(0.5)
            .foregroundColor(accent.opacity(0.7))
            .padding(.horizontal, 10).padding(.vertical, 5)
            .background(Capsule().fill(accent.opacity(0.06))
                .overlay(Capsule().stroke(accent.opacity(0.12), lineWidth: 1)))
    }

    // MARK: - Progress

    private var progressCard: some View {
        VStack(spacing: 10) {
            HStack {
                Text("YOUR PROGRESS").font(.system(size: 9, weight: .black)).tracking(2).foregroundColor(.white.opacity(0.1))
                Spacer()
                Text("\(state.totalCompleted)/\(factoryMindsCourse.lessons.count) weeks complete")
                    .font(.system(size: 10, weight: .bold)).foregroundColor(accent.opacity(0.5))
            }

            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 3).fill(Color.white.opacity(0.04)).frame(height: 4)
                    RoundedRectangle(cornerRadius: 3).fill(accent.opacity(0.6))
                        .frame(width: max(4, geo.size.width * state.progressFraction), height: 4)
                        .animation(.spring(response: 0.6), value: state.progressFraction)
                }
            }.frame(height: 4)

            if state.isComplete {
                Text("✦ Audit complete. You chose to know. That changes everything. ✦")
                    .font(.system(size: 10, weight: .bold)).foregroundColor(accent.opacity(0.6))
                    .multilineTextAlignment(.center).padding(.top, 4)
            }
        }
        .padding(14)
        .background(RoundedRectangle(cornerRadius: 12).fill(Color.white.opacity(0.015))
            .overlay(RoundedRectangle(cornerRadius: 12).stroke(accent.opacity(0.06), lineWidth: 1)))
    }

    // MARK: - Lessons Grid

    private var lessonsGrid: some View {
        VStack(spacing: 10) {
            HStack {
                Text("MODULES").font(.system(size: 9, weight: .black)).tracking(2).foregroundColor(.white.opacity(0.1))
                Spacer()
            }

            ForEach(factoryMindsCourse.lessons) { lesson in
                lessonCard(lesson)
            }
        }
    }

    private func lessonCard(_ lesson: FMLesson) -> some View {
        let done = state.isLessonComplete(lesson.id)

        return Button {
            state.selectedLesson = lesson
            state.showLesson = true
        } label: {
            HStack(spacing: 14) {
                // Week badge
                ZStack {
                    Circle().fill(done ? accent.opacity(0.2) : Color.white.opacity(0.04))
                        .frame(width: 44, height: 44)
                    if done {
                        Image(systemName: "checkmark").font(.system(size: 14, weight: .bold)).foregroundColor(accent)
                    } else {
                        Text("\(lesson.week)")
                            .font(.system(size: 16, weight: .black)).foregroundColor(.white.opacity(0.4))
                    }
                }

                VStack(alignment: .leading, spacing: 3) {
                    HStack(spacing: 6) {
                        Text("Week \(lesson.week)").font(.system(size: 9, weight: .black)).tracking(1)
                            .foregroundColor(accent.opacity(0.4))
                        if done {
                            Text("DONE").font(.system(size: 7, weight: .black)).tracking(1)
                                .foregroundColor(.black)
                                .padding(.horizontal, 5).padding(.vertical, 2)
                                .background(Capsule().fill(accent))
                        }
                    }
                    Text(lesson.title).font(.system(size: 14, weight: .bold)).foregroundColor(.white)
                    Text(lesson.subtitle).font(.system(size: 10, weight: .medium)).foregroundColor(.white.opacity(0.3))
                }

                Spacer()

                Image(systemName: "chevron.right")
                    .font(.system(size: 10, weight: .semibold))
                    .foregroundColor(accent.opacity(0.25))
            }
            .padding(14)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(done ? accent.opacity(0.05) : Color.white.opacity(0.012))
                    .overlay(RoundedRectangle(cornerRadius: 12)
                        .stroke(done ? accent.opacity(0.15) : Color.white.opacity(0.03), lineWidth: 1))
            )
        }
    }

    // MARK: - Closing Quote

    private var closingQuote: some View {
        VStack(spacing: 6) {
            Text("\"Public school taught you to sit down. Private school taught you to believe. Neither one taught you to question. That is what this course was for.\"")
                .font(.system(size: 11, weight: .medium)).foregroundColor(.white.opacity(0.2))
                .multilineTextAlignment(.center).italic().lineSpacing(3)
            Text("— Ron Hernandez").font(.system(size: 9, weight: .bold)).foregroundColor(accent.opacity(0.3))
        }
        .padding(16)
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.008)))
    }
}

// MARK: - Lesson Reader

struct FactoryMindsLessonView: View {

    let lesson: FMLesson
    let accent: Color
    @ObservedObject var state: FactoryMindsState

    @Environment(\.dismiss) var dismiss
    @State private var showComplete = false
    @State private var flash = false

    var body: some View {
        ZStack {
            Color(red: 0.02, green: 0.04, blue: 0.06).ignoresSafeArea()

            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 24) {

                    // Header
                    VStack(alignment: .leading, spacing: 8) {
                        Text("WEEK \(lesson.week)").font(.system(size: 9, weight: .black)).tracking(3)
                            .foregroundColor(accent.opacity(0.5))

                        Text(lesson.title).font(.system(size: 26, weight: .black)).foregroundColor(.white)
                        Text(lesson.subtitle).font(.system(size: 15, weight: .medium)).foregroundColor(.white.opacity(0.4))
                    }
                    .padding(.top, 20)

                    // Hook
                    VStack(alignment: .leading, spacing: 6) {
                        Text("OPENING HOOK").font(.system(size: 8, weight: .black)).tracking(2)
                            .foregroundColor(accent.opacity(0.3))
                        Text(lesson.hook)
                            .font(.system(size: 14, weight: .medium)).foregroundColor(.white.opacity(0.55))
                            .lineSpacing(5).italic()
                    }
                    .padding(14)
                    .background(RoundedRectangle(cornerRadius: 10).fill(accent.opacity(0.04))
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(accent.opacity(0.1), lineWidth: 1)))

                    // Body
                    FMMarkdownBody(text: lesson.body, accent: accent)

                    // Personal Testimony
                    if let testimony = lesson.personalTestimony {
                        VStack(alignment: .leading, spacing: 8) {
                            HStack(spacing: 6) {
                                Text("🎙️").font(.system(size: 13))
                                Text("PERSONAL TESTIMONY").font(.system(size: 8, weight: .black)).tracking(2)
                                    .foregroundColor(accent.opacity(0.4))
                            }
                            FMMarkdownBody(text: testimony, accent: accent)
                        }
                        .padding(14)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.015))
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(accent.opacity(0.06), lineWidth: 1)))
                    }

                    // Exercise
                    VStack(alignment: .leading, spacing: 8) {
                        Text("✎  \(lesson.exerciseTitle.uppercased())")
                            .font(.system(size: 9, weight: .black)).tracking(2).foregroundColor(accent.opacity(0.5))
                        Text(lesson.exercisePrompt)
                            .font(.system(size: 13, weight: .medium)).foregroundColor(.white.opacity(0.6))
                            .lineSpacing(5)
                    }
                    .padding(14)
                    .background(RoundedRectangle(cornerRadius: 10).fill(accent.opacity(0.05))
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(accent.opacity(0.15), lineWidth: 1)))

                    // Key Takeaway
                    VStack(alignment: .leading, spacing: 6) {
                        Text("KEY TAKEAWAY").font(.system(size: 8, weight: .black)).tracking(2)
                            .foregroundColor(.white.opacity(0.15))
                        Text(lesson.keyTakeaway)
                            .font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.5))
                            .lineSpacing(4)
                    }
                    .padding(12)
                    .background(RoundedRectangle(cornerRadius: 8).fill(Color.white.opacity(0.008)))

                    // Pattern to Spot
                    VStack(alignment: .leading, spacing: 6) {
                        Text("👁  PATTERN TO SPOT").font(.system(size: 8, weight: .black)).tracking(2)
                            .foregroundColor(accent.opacity(0.3))
                        Text(lesson.patternToSpot)
                            .font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.4))
                            .lineSpacing(4).italic()
                    }
                    .padding(12)
                    .background(RoundedRectangle(cornerRadius: 8).fill(Color.white.opacity(0.008)))

                    // Mark Complete Button
                    if state.isLessonComplete(lesson.id) {
                        HStack(spacing: 8) {
                            Image(systemName: "checkmark.circle.fill").foregroundColor(accent)
                            Text("Week \(lesson.week) Complete").font(.system(size: 14, weight: .bold))
                                .foregroundColor(accent.opacity(0.7))
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 14)
                        .background(RoundedRectangle(cornerRadius: 12).fill(accent.opacity(0.06)))
                    } else {
                        Button {
                            withAnimation(.spring(response: 0.3)) { flash = true }
                            state.markComplete(lesson.id)
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                                flash = false
                                showComplete = true
                            }
                        } label: {
                            Text("Mark Week \(lesson.week) Complete →")
                                .font(.system(size: 15, weight: .bold)).foregroundColor(.black)
                                .frame(maxWidth: .infinity).padding(.vertical, 15)
                                .background(RoundedRectangle(cornerRadius: 14)
                                    .fill(flash ? .white : accent))
                                .animation(.easeInOut(duration: 0.2), value: flash)
                        }
                    }

                    Spacer(minLength: 40)
                }
                .padding(.horizontal, 20)
            }

            // Flash overlay
            if flash {
                Color.white.opacity(0.07).ignoresSafeArea()
                    .allowsHitTesting(false)
                    .transition(.opacity)
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
                HStack(spacing: 5) {
                    Text("🏭").font(.system(size: 11))
                    Text(lesson.title).font(.system(size: 15, weight: .bold)).foregroundColor(.white)
                }
            }
        }
        .alert("Week \(lesson.week) Complete", isPresented: $showComplete) {
            Button("Keep Going") { dismiss() }
        } message: {
            Text("The audit never ends. Stay curious. Stay sovereign.")
        }
    }
}

// MARK: - Markdown Body

struct FMMarkdownBody: View {
    let text: String
    let accent: Color

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            ForEach(parsedBlocks(), id: \.id) { block in
                if block.isHeading {
                    Text(block.text)
                        .font(.system(size: 13, weight: .black)).foregroundColor(accent.opacity(0.8))
                        .padding(.top, 6)
                } else {
                    attributedText(block.text)
                        .font(.system(size: 13, weight: .regular)).foregroundColor(.white.opacity(0.6))
                        .lineSpacing(5)
                }
            }
        }
    }

    private func attributedText(_ raw: String) -> Text {
        var result = Text("")
        let parts = raw.components(separatedBy: "**")
        for (i, part) in parts.enumerated() {
            result = result + (i % 2 == 0
                ? Text(part)
                : Text(part).bold().foregroundColor(.white.opacity(0.85)))
        }
        return result
    }

    struct Block: Identifiable {
        let id = UUID()
        let text: String
        let isHeading: Bool
    }

    private func parsedBlocks() -> [Block] {
        let paragraphs = text.components(separatedBy: "\n\n").map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
        return paragraphs.filter { !$0.isEmpty }.map { p in
            if p.hasPrefix("**") && p.hasSuffix("**") {
                let cleaned = p.replacingOccurrences(of: "**", with: "")
                return Block(text: cleaned, isHeading: true)
            }
            return Block(text: p, isHeading: false)
        }
    }
}
