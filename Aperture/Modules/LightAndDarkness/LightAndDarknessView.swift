// LightAndDarknessView.swift
// LIGHT & DARKNESS — Module Hub + Course Viewer
// ☀️ SunFlow: Reignited
//
// "The greatest story ever told. Decoded."
// Pattern recognition meets astro-theology.

import SwiftUI

// MARK: — Module Hub

struct LightAndDarknessView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var state = LDState()

    private let gold    = Color(red: 1.0,  green: 0.82, blue: 0.36)
    private let deep    = Color(red: 0.55, green: 0.35, blue: 1.0)
    private let crimson = Color(red: 1.0,  green: 0.35, blue: 0.25)

    var body: some View {
        NavigationStack {
            ZStack {
                // Background
                LinearGradient(
                    colors: [
                        Color(red: 0.02, green: 0.01, blue: 0.07),
                        Color(red: 0.04, green: 0.02, blue: 0.12)
                    ],
                    startPoint: .top, endPoint: .bottom
                ).ignoresSafeArea()

                ScrollView(showsIndicators: false) {
                    VStack(spacing: 0) {
                        heroHeader
                            .padding(.horizontal, 20)
                            .padding(.top, 12)
                            .padding(.bottom, 28)

                        courseList
                            .padding(.horizontal, 20)
                            .padding(.bottom, 40)
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button { dismiss() } label: {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundColor(.white.opacity(0.6))
                    }
                }
                ToolbarItem(placement: .principal) {
                    HStack(spacing: 6) {
                        Text("☀️").font(.system(size: 13))
                        Text("Light & Darkness")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.white)
                    }
                }
            }
            .fullScreenCover(item: $state.selectedCourse) { course in
                LDCourseView(course: course, state: state)
            }
        }
    }

    // MARK: — Hero Header

    private var heroHeader: some View {
        VStack(spacing: 14) {
            // Glow orb
            ZStack {
                Circle()
                    .fill(gold.opacity(0.06))
                    .frame(width: 140, height: 140)
                    .blur(radius: 40)
                Circle()
                    .fill(crimson.opacity(0.04))
                    .frame(width: 80, height: 80)
                    .blur(radius: 20)
                Text("🌗").font(.system(size: 52))
            }
            .frame(height: 100)

            VStack(spacing: 6) {
                Text("The Greatest Story Ever Told")
                    .font(.system(size: 22, weight: .black))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)

                Text("Decoded")
                    .font(.system(size: 13, weight: .bold))
                    .tracking(4)
                    .foregroundColor(gold.opacity(0.5))
            }

            Text("Every religion on Earth tells the same story.\nNot because they copied each other —\nbecause they all looked at the same sky.")
                .font(.system(size: 12, weight: .medium))
                .foregroundColor(.white.opacity(0.35))
                .multilineTextAlignment(.center)
                .lineSpacing(3)
                .padding(.top, 2)

            // Progress indicator
            if state.totalCompleted > 0 {
                HStack(spacing: 6) {
                    ForEach(lightAndDarknessCourses, id: \.id) { course in
                        let completed = state.completedLessons[course.id]?.count ?? 0
                        let total = course.lessons.count
                        RoundedRectangle(cornerRadius: 2)
                            .fill(completed == total ? course.accentColor : Color.white.opacity(0.08))
                            .frame(height: 3)
                    }
                }
                .padding(.top, 4)

                Text("\(state.totalCompleted) of \(lightAndDarknessCourses.flatMap(\.lessons).count) lessons completed")
                    .font(.system(size: 9, weight: .bold))
                    .tracking(1)
                    .foregroundColor(.white.opacity(0.15))
            }
        }
    }

    // MARK: — Course List

    private var courseList: some View {
        VStack(spacing: 10) {
            Text("FOUR COURSES")
                .font(.system(size: 8, weight: .black))
                .tracking(3)
                .foregroundColor(.white.opacity(0.1))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 4)

            ForEach(lightAndDarknessCourses) { course in
                courseCard(course)
            }
        }
    }

    private func courseCard(_ course: LDCourse) -> some View {
        let completed   = state.completedLessons[course.id]?.count ?? 0
        let total       = course.lessons.count
        let isStarted   = completed > 0
        let isComplete  = completed == total

        return Button { state.selectedCourse = course } label: {
            HStack(spacing: 14) {
                // Number badge
                ZStack {
                    Circle()
                        .fill(isComplete ? course.accentColor : course.accentColor.opacity(0.08))
                        .frame(width: 44, height: 44)
                    if isComplete {
                        Image(systemName: "checkmark")
                            .font(.system(size: 14, weight: .black))
                            .foregroundColor(.black)
                    } else {
                        Text(course.emoji)
                            .font(.system(size: 20))
                    }
                }

                VStack(alignment: .leading, spacing: 3) {
                    HStack(spacing: 6) {
                        Text("0\(course.number)")
                            .font(.system(size: 9, weight: .black))
                            .tracking(1)
                            .foregroundColor(course.accentColor.opacity(0.4))
                        if isStarted && !isComplete {
                            Text("IN PROGRESS")
                                .font(.system(size: 7, weight: .black))
                                .tracking(1)
                                .foregroundColor(course.accentColor.opacity(0.5))
                                .padding(.horizontal, 5)
                                .padding(.vertical, 2)
                                .background(RoundedRectangle(cornerRadius: 3).fill(course.accentColor.opacity(0.08)))
                        }
                    }

                    Text(course.title)
                        .font(.system(size: 15, weight: .bold))
                        .foregroundColor(.white)

                    Text(course.subtitle)
                        .font(.system(size: 10, weight: .medium))
                        .foregroundColor(.white.opacity(0.3))

                    HStack(spacing: 8) {
                        Text("~\(course.estimatedMinutes) min")
                            .font(.system(size: 8, weight: .medium))
                            .foregroundColor(.white.opacity(0.15))
                        Text("·")
                            .foregroundColor(.white.opacity(0.1))
                        Text("\(total) lessons")
                            .font(.system(size: 8, weight: .medium))
                            .foregroundColor(.white.opacity(0.15))
                    }
                }

                Spacer()

                VStack(alignment: .trailing, spacing: 6) {
                    Image(systemName: "chevron.right")
                        .font(.system(size: 10))
                        .foregroundColor(course.accentColor.opacity(0.2))

                    if isStarted {
                        Text("\(completed)/\(total)")
                            .font(.system(size: 9, weight: .bold))
                            .foregroundColor(course.accentColor.opacity(0.4))
                    }
                }
            }
            .padding(14)
            .background(
                RoundedRectangle(cornerRadius: 14)
                    .fill(course.accentColor.opacity(0.025))
                    .overlay(
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(
                                isComplete ? course.accentColor.opacity(0.2) : course.accentColor.opacity(0.06),
                                lineWidth: 1
                            )
                    )
            )
        }
        .buttonStyle(.plain)
    }
}

// MARK: — Course Detail View

struct LDCourseView: View {
    let course: LDCourse
    @ObservedObject var state: LDState
    @Environment(\.dismiss) var dismiss
    @State private var selectedLesson: LDLesson?
    @State private var showLesson = false

    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    colors: [
                        Color(red: 0.02, green: 0.01, blue: 0.07),
                        Color(red: 0.04, green: 0.02, blue: 0.12)
                    ],
                    startPoint: .top, endPoint: .bottom
                ).ignoresSafeArea()

                ScrollView(showsIndicators: false) {
                    VStack(spacing: 0) {
                        courseHero
                            .padding(.horizontal, 20)
                            .padding(.top, 8)
                            .padding(.bottom, 24)

                        lessonList
                            .padding(.horizontal, 20)
                            .padding(.bottom, 40)
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button { dismiss() } label: {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundColor(.white.opacity(0.6))
                    }
                }
                ToolbarItem(placement: .principal) {
                    HStack(spacing: 5) {
                        Text(course.emoji).font(.system(size: 13))
                        Text(course.title)
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.white)
                    }
                }
            }
            .fullScreenCover(item: $selectedLesson) { lesson in
                LDLessonView(
                    lesson: lesson,
                    course: course,
                    state: state,
                    allLessons: course.lessons,
                    onDismiss: { selectedLesson = nil }
                )
            }
        }
    }

    // MARK: — Course Hero

    private var courseHero: some View {
        let completed = state.completedLessons[course.id]?.count ?? 0
        let total = course.lessons.count

        return VStack(spacing: 14) {
            ZStack {
                Circle()
                    .fill(course.accentColor.opacity(0.06))
                    .frame(width: 120, height: 120)
                    .blur(radius: 30)
                Text(course.emoji).font(.system(size: 48))
            }
            .frame(height: 80)

            VStack(spacing: 5) {
                Text("Course 0\(course.number)".uppercased())
                    .font(.system(size: 9, weight: .black))
                    .tracking(3)
                    .foregroundColor(course.accentColor.opacity(0.4))

                Text(course.title)
                    .font(.system(size: 24, weight: .black))
                    .foregroundColor(.white)

                Text(course.subtitle)
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(.white.opacity(0.35))
            }

            Text("\"" + course.tagline + "\"")
                .font(.system(size: 11, weight: .medium))
                .foregroundColor(course.accentColor.opacity(0.5))
                .multilineTextAlignment(.center)
                .lineSpacing(3)
                .padding(.horizontal, 10)
                .padding(.top, 2)

            // Progress bar
            VStack(spacing: 4) {
                GeometryReader { geo in
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 2)
                            .fill(Color.white.opacity(0.04))
                        RoundedRectangle(cornerRadius: 2)
                            .fill(course.accentColor)
                            .frame(width: geo.size.width * (total > 0 ? CGFloat(completed) / CGFloat(total) : 0))
                    }
                }
                .frame(height: 3)

                Text("\(completed) of \(total) lessons")
                    .font(.system(size: 9, weight: .medium))
                    .foregroundColor(.white.opacity(0.2))
            }
        }
    }

    // MARK: — Lesson List

    private var lessonList: some View {
        VStack(spacing: 8) {
            Text("LESSONS")
                .font(.system(size: 8, weight: .black))
                .tracking(3)
                .foregroundColor(.white.opacity(0.1))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 4)

            ForEach(Array(course.lessons.enumerated()), id: \.element.id) { index, lesson in
                let isCompleted = state.completedLessons[course.id]?.contains(lesson.id) ?? false

                Button { selectedLesson = lesson } label: {
                    HStack(spacing: 12) {
                        ZStack {
                            Circle()
                                .fill(isCompleted ? course.accentColor : Color.white.opacity(0.03))
                                .frame(width: 32, height: 32)
                            if isCompleted {
                                Image(systemName: "checkmark")
                                    .font(.system(size: 11, weight: .black))
                                    .foregroundColor(.black)
                            } else {
                                Text("\(index + 1)")
                                    .font(.system(size: 12, weight: .bold))
                                    .foregroundColor(.white.opacity(0.3))
                            }
                        }

                        VStack(alignment: .leading, spacing: 2) {
                            Text(lesson.title)
                                .font(.system(size: 13, weight: .bold))
                                .foregroundColor(.white)
                                .multilineTextAlignment(.leading)

                            Text(lesson.keyTakeaway.prefix(60) + "...")
                                .font(.system(size: 9, weight: .medium))
                                .foregroundColor(.white.opacity(0.2))
                                .lineLimit(2)
                        }

                        Spacer()

                        Image(systemName: "chevron.right")
                            .font(.system(size: 9))
                            .foregroundColor(course.accentColor.opacity(0.2))
                    }
                    .padding(12)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(isCompleted ? course.accentColor.opacity(0.04) : Color.white.opacity(0.015))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(isCompleted ? course.accentColor.opacity(0.15) : Color.white.opacity(0.03), lineWidth: 1)
                            )
                    )
                }
                .buttonStyle(.plain)
            }
        }
    }
}

// MARK: — Lesson Reader

struct LDLessonView: View {
    let lesson: LDLesson
    let course: LDCourse
    @ObservedObject var state: LDState
    let allLessons: [LDLesson]
    let onDismiss: () -> Void

    @Environment(\.dismiss) var dismiss
    @State private var scrollOffset: CGFloat = 0
    @State private var showCompleteFlash = false

    private var isCompleted: Bool {
        state.completedLessons[course.id]?.contains(lesson.id) ?? false
    }

    private var nextLesson: LDLesson? {
        guard let idx = allLessons.firstIndex(where: { $0.id == lesson.id }),
              idx + 1 < allLessons.count else { return nil }
        return allLessons[idx + 1]
    }

    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 0.02, green: 0.01, blue: 0.07).ignoresSafeArea()

                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 0) {
                        // Lesson header
                        VStack(alignment: .leading, spacing: 10) {
                            Text(course.title.uppercased())
                                .font(.system(size: 8, weight: .black))
                                .tracking(2)
                                .foregroundColor(course.accentColor.opacity(0.4))

                            Text(lesson.title)
                                .font(.system(size: 22, weight: .black))
                                .foregroundColor(.white)
                                .lineSpacing(2)

                            Rectangle()
                                .fill(course.accentColor.opacity(0.2))
                                .frame(height: 1)
                                .padding(.vertical, 4)
                        }
                        .padding(.horizontal, 22)
                        .padding(.top, 12)
                        .padding(.bottom, 20)

                        // Body — rendered with simple markdown-style bold
                        MarkdownBodyView(text: lesson.body, accentColor: course.accentColor)
                            .padding(.horizontal, 22)

                        // Key Takeaway
                        keyTakeawayBlock
                            .padding(.horizontal, 22)
                            .padding(.top, 28)

                        // Pattern to spot
                        if let pattern = lesson.patternToSpot {
                            patternBlock(pattern)
                                .padding(.horizontal, 22)
                                .padding(.top, 14)
                        }

                        // Complete / Next
                        actionBlock
                            .padding(.horizontal, 22)
                            .padding(.top, 28)
                            .padding(.bottom, 50)
                    }
                }

                // Completion flash
                if showCompleteFlash {
                    VStack {
                        Spacer()
                        Text("✓ Lesson Complete")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(.black)
                            .padding(.horizontal, 24)
                            .padding(.vertical, 12)
                            .background(Capsule().fill(course.accentColor))
                            .padding(.bottom, 60)
                    }
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button { dismiss() } label: {
                        Image(systemName: "xmark")
                            .font(.system(size: 13, weight: .semibold))
                            .foregroundColor(.white.opacity(0.4))
                    }
                }
                ToolbarItem(placement: .principal) {
                    if isCompleted {
                        HStack(spacing: 4) {
                            Image(systemName: "checkmark.circle.fill")
                                .font(.system(size: 12))
                                .foregroundColor(course.accentColor)
                            Text("Completed")
                                .font(.system(size: 13, weight: .medium))
                                .foregroundColor(course.accentColor.opacity(0.7))
                        }
                    }
                }
            }
        }
    }

    private var keyTakeawayBlock: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("KEY TAKEAWAY")
                .font(.system(size: 8, weight: .black))
                .tracking(2)
                .foregroundColor(course.accentColor.opacity(0.4))

            Text(lesson.keyTakeaway)
                .font(.system(size: 12, weight: .medium))
                .foregroundColor(.white.opacity(0.6))
                .lineSpacing(4)
        }
        .padding(14)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(course.accentColor.opacity(0.03))
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(course.accentColor.opacity(0.08), lineWidth: 1))
        )
    }

    private func patternBlock(_ pattern: String) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 6) {
                Text("🔍")
                    .font(.system(size: 12))
                Text("SPOT THIS IN THE WILD")
                    .font(.system(size: 8, weight: .black))
                    .tracking(2)
                    .foregroundColor(.white.opacity(0.25))
            }

            Text(pattern)
                .font(.system(size: 11, weight: .medium))
                .foregroundColor(.white.opacity(0.4))
                .lineSpacing(3)
        }
        .padding(14)
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.01)))
    }

    private var actionBlock: some View {
        VStack(spacing: 10) {
            if !isCompleted {
                Button {
                    withAnimation(.easeOut(duration: 0.3)) {
                        state.markComplete(courseId: course.id, lessonId: lesson.id)
                        showCompleteFlash = true
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.8) {
                        withAnimation { showCompleteFlash = false }
                    }
                } label: {
                    Text("Mark as Complete")
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(.black)
                        .padding(.vertical, 14)
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 12).fill(course.accentColor))
                }
            }

            if let next = nextLesson {
                Button {
                    if !isCompleted {
                        state.markComplete(courseId: course.id, lessonId: lesson.id)
                    }
                    dismiss()
                    // Navigation to next lesson handled by parent
                } label: {
                    HStack {
                        Text("Next: \(next.title)")
                            .font(.system(size: 12, weight: .bold))
                            .foregroundColor(course.accentColor.opacity(0.7))
                        Spacer()
                        Image(systemName: "arrow.right")
                            .font(.system(size: 11))
                            .foregroundColor(course.accentColor.opacity(0.4))
                    }
                    .padding(12)
                    .background(RoundedRectangle(cornerRadius: 10).fill(course.accentColor.opacity(0.04)))
                }
            } else if isCompleted {
                VStack(spacing: 4) {
                    Text("🌟 Course Complete")
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(course.accentColor)
                    Text("The pattern is yours now.")
                        .font(.system(size: 10, weight: .medium))
                        .foregroundColor(.white.opacity(0.2))
                }
                .frame(maxWidth: .infinity)
                .padding(14)
                .background(RoundedRectangle(cornerRadius: 12).fill(course.accentColor.opacity(0.04)))
            }
        }
    }
}

// MARK: — Simple Markdown Body Renderer

struct MarkdownBodyView: View {
    let text: String
    let accentColor: Color

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ForEach(parsedParagraphs, id: \.id) { para in
                paragraphView(para)
                    .padding(.bottom, para.type == .heading ? 6 : 14)
            }
        }
    }

    private func paragraphView(_ para: MDParagraph) -> some View {
        Group {
            switch para.type {
            case .heading:
                Text(para.plainText)
                    .font(.system(size: 11, weight: .black))
                    .tracking(1)
                    .foregroundColor(accentColor.opacity(0.5))
                    .padding(.top, 10)

            case .body:
                styledText(para.segments)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    private func styledText(_ segments: [MDSegment]) -> some View {
        var result = Text("")
        for seg in segments {
            if seg.bold {
                result = result + Text(seg.text)
                    .font(.system(size: 13, weight: .bold))
                    .foregroundColor(.white.opacity(0.85))
            } else {
                result = result + Text(seg.text)
                    .font(.system(size: 13, weight: .regular))
                    .foregroundColor(.white.opacity(0.55))
            }
        }
        return result.lineSpacing(5)
    }

    // MARK: — Parser

    private struct MDParagraph: Identifiable {
        let id = UUID()
        let type: MDType
        let segments: [MDSegment]
        var plainText: String { segments.map(\.text).joined() }
    }
    private struct MDSegment { let text: String; let bold: Bool }
    private enum MDType { case heading, body }

    private var parsedParagraphs: [MDParagraph] {
        let lines = text.components(separatedBy: "\n\n")
        return lines.compactMap { raw in
            let trimmed = raw.trimmingCharacters(in: .whitespacesAndNewlines)
            guard !trimmed.isEmpty else { return nil }
            if trimmed.hasPrefix("**") && trimmed.hasSuffix("**") {
                let inner = String(trimmed.dropFirst(2).dropLast(2))
                return MDParagraph(type: .heading, segments: [MDSegment(text: inner, bold: true)])
            }
            return MDParagraph(type: .body, segments: parseInline(trimmed))
        }
    }

    private func parseInline(_ text: String) -> [MDSegment] {
        var segments: [MDSegment] = []
        var remaining = text
        while !remaining.isEmpty {
            if let boldStart = remaining.range(of: "**"),
               let boldEnd = remaining.range(of: "**", range: boldStart.upperBound..<remaining.endIndex) {
                let before = String(remaining[remaining.startIndex..<boldStart.lowerBound])
                if !before.isEmpty { segments.append(MDSegment(text: before, bold: false)) }
                let boldText = String(remaining[boldStart.upperBound..<boldEnd.lowerBound])
                segments.append(MDSegment(text: boldText, bold: true))
                remaining = String(remaining[boldEnd.upperBound...])
            } else {
                segments.append(MDSegment(text: remaining, bold: false))
                break
            }
        }
        return segments
    }
}

// MARK: — State

class LDState: ObservableObject {
    @Published var selectedCourse: LDCourse?
    @Published var completedLessons: [String: Set<String>] = [:]  // courseId → Set<lessonId>

    var totalCompleted: Int {
        completedLessons.values.reduce(0) { $0 + $1.count }
    }

    init() { load() }

    func markComplete(courseId: String, lessonId: String) {
        if completedLessons[courseId] == nil { completedLessons[courseId] = [] }
        completedLessons[courseId]?.insert(lessonId)
        save()
    }

    private func save() {
        let encoded = completedLessons.mapValues { Array($0) }
        if let data = try? JSONEncoder().encode(encoded) {
            UserDefaults.standard.set(data, forKey: "aperture_ld_progress")
        }
    }

    private func load() {
        guard let data = UserDefaults.standard.data(forKey: "aperture_ld_progress"),
              let decoded = try? JSONDecoder().decode([String: [String]].self, from: data) else { return }
        completedLessons = decoded.mapValues { Set($0) }
    }
}

// LDCourse already conforms to Identifiable via LightAndDarknessData.swift
