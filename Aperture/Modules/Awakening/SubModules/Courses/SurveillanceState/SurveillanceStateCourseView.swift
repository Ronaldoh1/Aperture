// SurveillanceStateCourseView.swift
// SunFlow: Reignited — Aperture

import SwiftUI

// MARK: - State

class SurveillanceStateProgress: ObservableObject {
    @Published var completedLessons: Set<String> = []
    @Published var selectedLesson: SSLesson? = nil
    @Published var showLesson = false

    private let key = "aperture_surveillance_state_progress"

    var totalCompleted: Int { completedLessons.count }
    var fraction: Double { Double(completedLessons.count) / Double(surveillanceStateCourse.count) }
    var isComplete: Bool { completedLessons.count == surveillanceStateCourse.count }

    func markComplete(_ id: String) { completedLessons.insert(id); save() }
    func isDone(_ id: String) -> Bool { completedLessons.contains(id) }

    func save() { UserDefaults.standard.set(Array(completedLessons), forKey: key) }
    func load() {
        if let arr = UserDefaults.standard.array(forKey: key) as? [String] {
            completedLessons = Set(arr)
        }
    }
}

// MARK: - Hub

struct SurveillanceStateCourseView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var progress = SurveillanceStateProgress()

    let accent = Color(red: 0.95, green: 0.35, blue: 0.25)   // surveillance red-orange
    let bg     = Color(red: 0.03, green: 0.01, blue: 0.01)

    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [bg, Color(red: 0.05, green: 0.01, blue: 0.01)],
                               startPoint: .top, endPoint: .bottom).ignoresSafeArea()

                ScrollView(showsIndicators: false) {
                    VStack(spacing: 20) {
                        hero
                        progressCard
                        warningBanner
                        lessonsList
                        closingStatement
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
                            .font(.system(size: 16, weight: .semibold)).foregroundColor(.white)
                    }
                }
                ToolbarItem(placement: .principal) {
                    HStack(spacing: 6) {
                        Text("👁️").font(.system(size: 13))
                        Text("Surveillance State")
                            .font(.system(size: 17, weight: .bold)).foregroundColor(.white)
                    }
                }
            }
            .fullScreenCover(isPresented: $progress.showLesson) {
                if let lesson = progress.selectedLesson {
                    SSLessonView(lesson: lesson, accent: accent, progress: progress)
                }
            }
            .onAppear { progress.load() }
        }
    }

    // MARK: Hero

    private var hero: some View {
        VStack(spacing: 14) {
            Spacer().frame(height: 16)
            ZStack {
                Circle().fill(accent.opacity(0.08)).frame(width: 140, height: 140).blur(radius: 35)
                Text("👁️").font(.system(size: 54))
            }
            VStack(spacing: 6) {
                Text("SURVEILLANCE STATE").font(.system(size: 10, weight: .black)).tracking(3)
                    .foregroundColor(accent.opacity(0.5))
                Text("When Safety Becomes a Cage")
                    .font(.system(size: 21, weight: .black)).foregroundColor(.white)
                    .multilineTextAlignment(.center)
                Text("Historical evidence. Documented programs.\nYour rights. Your response.")
                    .font(.system(size: 11, weight: .medium)).foregroundColor(.white.opacity(0.3))
                    .multilineTextAlignment(.center).lineSpacing(3)
            }
            HStack(spacing: 14) {
                sspill("5 Lessons"); sspill("~90 min"); sspill("Historical Record")
            }
        }
    }

    private func sspill(_ text: String) -> some View {
        Text(text).font(.system(size: 9, weight: .bold)).tracking(0.5)
            .foregroundColor(accent.opacity(0.7))
            .padding(.horizontal, 10).padding(.vertical, 5)
            .background(Capsule().fill(accent.opacity(0.06))
                .overlay(Capsule().stroke(accent.opacity(0.12), lineWidth: 1)))
    }

    // MARK: Progress

    private var progressCard: some View {
        VStack(spacing: 10) {
            HStack {
                Text("PROGRESS").font(.system(size: 9, weight: .black)).tracking(2)
                    .foregroundColor(.white.opacity(0.1))
                Spacer()
                Text("\(progress.totalCompleted)/\(surveillanceStateCourse.count) complete")
                    .font(.system(size: 10, weight: .bold)).foregroundColor(accent.opacity(0.5))
            }
            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 3).fill(Color.white.opacity(0.04)).frame(height: 4)
                    RoundedRectangle(cornerRadius: 3).fill(accent.opacity(0.7))
                        .frame(width: max(4, geo.size.width * progress.fraction), height: 4)
                        .animation(.spring(response: 0.6), value: progress.fraction)
                }
            }.frame(height: 4)
            if progress.isComplete {
                Text("✦ Now you know the architecture. Stay sovereign. ✦")
                    .font(.system(size: 10, weight: .bold)).foregroundColor(accent.opacity(0.6))
                    .multilineTextAlignment(.center).padding(.top, 4)
            }
        }
        .padding(14)
        .background(RoundedRectangle(cornerRadius: 12).fill(Color.white.opacity(0.015))
            .overlay(RoundedRectangle(cornerRadius: 12).stroke(accent.opacity(0.06), lineWidth: 1)))
    }

    // MARK: Warning Banner

    private var warningBanner: some View {
        HStack(spacing: 10) {
            Text("📌").font(.system(size: 14))
            Text("Everything in this course is sourced from congressional hearings, court records, declassified documents, and public contracts. This is not conspiracy. This is the documented record.")
                .font(.system(size: 10, weight: .medium)).foregroundColor(.white.opacity(0.4))
                .lineSpacing(3)
        }
        .padding(12)
        .background(RoundedRectangle(cornerRadius: 10).fill(accent.opacity(0.04))
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(accent.opacity(0.1), lineWidth: 1)))
    }

    // MARK: Lessons List

    private var lessonsList: some View {
        VStack(spacing: 10) {
            HStack {
                Text("LESSONS").font(.system(size: 9, weight: .black)).tracking(2)
                    .foregroundColor(.white.opacity(0.1))
                Spacer()
            }
            ForEach(surveillanceStateCourse) { lesson in
                ssLessonCard(lesson)
            }
        }
    }

    private func ssLessonCard(_ lesson: SSLesson) -> some View {
        let done = progress.isDone(lesson.id)
        return Button {
            progress.selectedLesson = lesson
            progress.showLesson = true
        } label: {
            HStack(spacing: 14) {
                ZStack {
                    Circle().fill(done ? accent.opacity(0.2) : Color.white.opacity(0.04))
                        .frame(width: 44, height: 44)
                    if done {
                        Image(systemName: "checkmark").font(.system(size: 14, weight: .bold))
                            .foregroundColor(accent)
                    } else {
                        Text("\(lesson.lessonNumber)").font(.system(size: 16, weight: .black))
                            .foregroundColor(.white.opacity(0.4))
                    }
                }
                VStack(alignment: .leading, spacing: 3) {
                    HStack(spacing: 6) {
                        Text("Lesson \(lesson.lessonNumber)").font(.system(size: 9, weight: .black))
                            .tracking(1).foregroundColor(accent.opacity(0.4))
                        if done {
                            Text("COMPLETE").font(.system(size: 7, weight: .black)).tracking(1)
                                .foregroundColor(.black).padding(.horizontal, 5).padding(.vertical, 2)
                                .background(Capsule().fill(accent))
                        }
                    }
                    Text(lesson.title).font(.system(size: 14, weight: .bold)).foregroundColor(.white)
                    Text(lesson.subtitle).font(.system(size: 10, weight: .medium))
                        .foregroundColor(.white.opacity(0.3))
                }
                Spacer()
                Image(systemName: "chevron.right").font(.system(size: 10, weight: .semibold))
                    .foregroundColor(accent.opacity(0.25))
            }
            .padding(14)
            .background(RoundedRectangle(cornerRadius: 12)
                .fill(done ? accent.opacity(0.05) : Color.white.opacity(0.012))
                .overlay(RoundedRectangle(cornerRadius: 12)
                    .stroke(done ? accent.opacity(0.15) : Color.white.opacity(0.03), lineWidth: 1)))
        }
    }

    private var closingStatement: some View {
        Text("\"The price of liberty is eternal vigilance.\" — Thomas Jefferson\n\nThe surveillance state does not announce itself. It expands through each crisis, each security emergency, each temporary measure that becomes permanent. Knowing its history and its architecture is the first line of defense.")
            .font(.system(size: 10, weight: .medium)).foregroundColor(.white.opacity(0.2))
            .multilineTextAlignment(.center).lineSpacing(4).italic()
            .padding(14)
            .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.008)))
    }
}

// MARK: - Lesson Reader

struct SSLessonView: View {
    let lesson: SSLesson
    let accent: Color
    @ObservedObject var progress: SurveillanceStateProgress

    @Environment(\.dismiss) var dismiss
    @State private var showComplete = false
    @State private var selectedTab = 0

    var body: some View {
        ZStack {
            Color(red: 0.03, green: 0.01, blue: 0.01).ignoresSafeArea()
            VStack(spacing: 0) {
                // Tab bar
                HStack(spacing: 0) {
                    ForEach(Array(["Content", "Case Study", "Timeline"].enumerated()), id: \.0) { idx, tab in
                        Button { withAnimation { selectedTab = idx } } label: {
                            Text(tab).font(.system(size: 11, weight: selectedTab == idx ? .black : .medium))
                                .foregroundColor(selectedTab == idx ? accent : .white.opacity(0.3))
                                .frame(maxWidth: .infinity).padding(.vertical, 10)
                                .background(selectedTab == idx ? accent.opacity(0.08) : Color.clear)
                        }
                    }
                }
                .background(Color.white.opacity(0.02))
                .overlay(Rectangle().frame(height: 1).foregroundColor(.white.opacity(0.04)), alignment: .bottom)

                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 20) {
                        // Header
                        VStack(alignment: .leading, spacing: 6) {
                            Text("LESSON \(lesson.lessonNumber)").font(.system(size: 9, weight: .black))
                                .tracking(3).foregroundColor(accent.opacity(0.5))
                            Text(lesson.title).font(.system(size: 24, weight: .black)).foregroundColor(.white)
                            Text(lesson.subtitle).font(.system(size: 13, weight: .medium))
                                .foregroundColor(.white.opacity(0.4))
                        }
                        .padding(.top, 20)

                        if selectedTab == 0 {
                            mainContent
                        } else if selectedTab == 1 {
                            caseStudyContent
                        } else {
                            timelineContent
                        }

                        // Mark complete
                        if progress.isDone(lesson.id) {
                            completedBadge
                        } else {
                            markCompleteButton
                        }

                        Spacer(minLength: 40)
                    }
                    .padding(.horizontal, 20)
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
                Text(lesson.title).font(.system(size: 15, weight: .bold)).foregroundColor(.white).lineLimit(1)
            }
        }
        .alert("Lesson \(lesson.lessonNumber) Complete", isPresented: $showComplete) {
            Button("Continue") { dismiss() }
        } message: {
            Text("Stay vigilant. Stay sovereign.")
        }
    }

    private var mainContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Hook
            Text(lesson.hook).font(.system(size: 13, weight: .medium)).foregroundColor(.white.opacity(0.55))
                .lineSpacing(5).italic()
                .padding(14)
                .background(RoundedRectangle(cornerRadius: 10).fill(accent.opacity(0.04))
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(accent.opacity(0.1), lineWidth: 1)))

            // Body
            SSMarkdownBody(text: lesson.body, accent: accent)

            // Pattern Alert
            ssInfoBlock("⚠️  PATTERN ALERT", lesson.patternAlert, color: .orange)

            // Sovereignty Tip
            ssInfoBlock("🔒  SOVEREIGNTY TIP", lesson.sovereigntyTip, color: accent)

            // Reflection
            ssInfoBlock("❓  REFLECTION", lesson.reflectionPrompt, color: .white.opacity(0.5))
        }
    }

    private var caseStudyContent: some View {
        Group {
            if let cs = lesson.caseStudy {
                VStack(alignment: .leading, spacing: 14) {
                    // Era badge
                    Text(cs.era).font(.system(size: 10, weight: .black)).tracking(2)
                        .foregroundColor(accent.opacity(0.6))
                        .padding(.horizontal, 10).padding(.vertical, 5)
                        .background(Capsule().fill(accent.opacity(0.08)))

                    Text(cs.title).font(.system(size: 20, weight: .black)).foregroundColor(.white)

                    VStack(spacing: 10) {
                        csRow("What Happened", cs.whatHappened)
                        csRow("Who Was Targeted", cs.whoItTargeted)
                        csRow("Legal Cover Used", cs.legalCover)
                        csRow("Outcome", cs.outcome)
                        csRow("Parallels Today", cs.parallelsToday)
                    }
                }
            } else {
                Text("No case study for this lesson.")
                    .font(.system(size: 13)).foregroundColor(.white.opacity(0.3))
                    .padding(.top, 20)
            }
        }
    }

    private func csRow(_ label: String, _ text: String) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(label.uppercased()).font(.system(size: 8, weight: .black)).tracking(2)
                .foregroundColor(accent.opacity(0.4))
            Text(text).font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.6))
                .lineSpacing(4)
        }
        .padding(12)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(RoundedRectangle(cornerRadius: 8).fill(Color.white.opacity(0.012)))
    }

    private var timelineContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            if lesson.timeline.isEmpty {
                Text("No timeline for this lesson.")
                    .font(.system(size: 13)).foregroundColor(.white.opacity(0.3)).padding(.top, 20)
            } else {
                ForEach(lesson.timeline) { event in
                    HStack(alignment: .top, spacing: 14) {
                        VStack {
                            Text(event.year).font(.system(size: 11, weight: .black))
                                .foregroundColor(accent).frame(width: 50)
                            Rectangle().fill(accent.opacity(0.2)).frame(width: 1)
                        }
                        VStack(alignment: .leading, spacing: 4) {
                            Text(event.event).font(.system(size: 13, weight: .bold)).foregroundColor(.white)
                            Text(event.significance).font(.system(size: 11, weight: .medium))
                                .foregroundColor(.white.opacity(0.45)).lineSpacing(3)
                        }
                        Spacer()
                    }
                    .padding(12)
                    .background(RoundedRectangle(cornerRadius: 8).fill(Color.white.opacity(0.012)))
                }
            }
        }
    }

    private func ssInfoBlock(_ label: String, _ text: String, color: Color) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(label).font(.system(size: 9, weight: .black)).tracking(1.5).foregroundColor(color.opacity(0.7))
            Text(text).font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.55))
                .lineSpacing(4)
        }
        .padding(12)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(RoundedRectangle(cornerRadius: 8).fill(Color.white.opacity(0.008))
            .overlay(RoundedRectangle(cornerRadius: 8).stroke(color.opacity(0.1), lineWidth: 1)))
    }

    private var completedBadge: some View {
        HStack(spacing: 8) {
            Image(systemName: "checkmark.circle.fill").foregroundColor(accent)
            Text("Lesson Complete").font(.system(size: 14, weight: .bold)).foregroundColor(accent.opacity(0.7))
        }
        .frame(maxWidth: .infinity).padding(.vertical, 14)
        .background(RoundedRectangle(cornerRadius: 12).fill(accent.opacity(0.06)))
    }

    private var markCompleteButton: some View {
        Button {
            progress.markComplete(lesson.id)
            showComplete = true
        } label: {
            Text("Mark Lesson \(lesson.lessonNumber) Complete →")
                .font(.system(size: 15, weight: .bold)).foregroundColor(.white)
                .frame(maxWidth: .infinity).padding(.vertical, 15)
                .background(RoundedRectangle(cornerRadius: 14).fill(accent))
        }
    }
}

// MARK: - Markdown

struct SSMarkdownBody: View {
    let text: String
    let accent: Color

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ForEach(parsed(), id: \.id) { block in
                if block.isHeading {
                    Text(block.text).font(.system(size: 13, weight: .black))
                        .foregroundColor(accent.opacity(0.8)).padding(.top, 6)
                } else {
                    boldText(block.text)
                        .font(.system(size: 13)).foregroundColor(.white.opacity(0.6)).lineSpacing(5)
                }
            }
        }
    }

    private func boldText(_ raw: String) -> Text {
        var result = Text("")
        let parts = raw.components(separatedBy: "**")
        for (i, part) in parts.enumerated() {
            result = result + (i % 2 == 0
                ? Text(part)
                : Text(part).bold().foregroundColor(.white.opacity(0.85)))
        }
        return result
    }

    struct Block: Identifiable { let id = UUID(); let text: String; let isHeading: Bool }

    private func parsed() -> [Block] {
        text.components(separatedBy: "\n\n")
            .map { $0.trimmingCharacters(in: .whitespacesAndNewlines) }
            .filter { !$0.isEmpty }
            .map { p in
                if p.hasPrefix("**") && p.hasSuffix("**") {
                    return Block(text: p.replacingOccurrences(of: "**", with: ""), isHeading: true)
                }
                return Block(text: p, isHeading: false)
            }
    }
}
