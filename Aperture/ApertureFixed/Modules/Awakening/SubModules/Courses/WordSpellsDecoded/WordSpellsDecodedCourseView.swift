// WordSpellsDecodedCourseView.swift
// SunFlow: Reignited — Aperture
//
// WORD SPELLS DECODED: Trigger Words, Manufactured Fear, and How Language Controls Thought

import SwiftUI

// MARK: - Progress State

class WSDProgress: ObservableObject {
    @Published var completedLessons: Set<String> = []
    @Published var selectedLesson: WSDLesson? = nil
    @Published var showLesson = false

    private let key = "aperture_word_spells_progress"

    var totalCompleted: Int { completedLessons.count }
    var fraction: Double { Double(completedLessons.count) / Double(wordSpellsDecodedCourse.count) }
    var isComplete: Bool { completedLessons.count == wordSpellsDecodedCourse.count }

    func markComplete(_ id: String) { completedLessons.insert(id); save() }
    func isDone(_ id: String) -> Bool { completedLessons.contains(id) }

    func save() { UserDefaults.standard.set(Array(completedLessons), forKey: key) }
    func load() {
        if let arr = UserDefaults.standard.array(forKey: key) as? [String] {
            completedLessons = Set(arr)
        }
    }
}

// MARK: - Hub View

struct WordSpellsDecodedCourseView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var progress = WSDProgress()

    let accent = Color(red: 0.95, green: 0.75, blue: 0.15)   // gold — language/alchemy energy
    let bg     = Color(red: 0.02, green: 0.02, blue: 0.04)

    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [bg, Color(red: 0.04, green: 0.02, blue: 0.01)],
                               startPoint: .top, endPoint: .bottom).ignoresSafeArea()

                ScrollView(showsIndicators: false) {
                    VStack(spacing: 20) {
                        heroSection
                        progressCard
                        warningCard
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
                            .font(.system(size: 16, weight: .semibold)).foregroundColor(.white)
                    }
                }
                ToolbarItem(placement: .principal) {
                    HStack(spacing: 6) {
                        Text("🔤").font(.system(size: 13))
                        Text("Word Spells Decoded")
                            .font(.system(size: 16, weight: .bold)).foregroundColor(.white)
                    }
                }
            }
            .fullScreenCover(isPresented: $progress.showLesson) {
                if let lesson = progress.selectedLesson {
                    WSDLessonView(lesson: lesson, accent: accent, progress: progress)
                }
            }
            .onAppear { progress.load() }
        }
    }

    // MARK: — Hero

    private var heroSection: some View {
        VStack(spacing: 14) {
            Spacer().frame(height: 16)
            ZStack {
                Circle().fill(accent.opacity(0.07)).frame(width: 140, height: 140).blur(radius: 35)
                Text("🔤").font(.system(size: 52))
            }
            VStack(spacing: 6) {
                Text("WORD SPELLS DECODED").font(.system(size: 10, weight: .black)).tracking(3)
                    .foregroundColor(accent.opacity(0.5))
                Text("Trigger Words, Manufactured Fear & How Language Controls Thought")
                    .font(.system(size: 19, weight: .black)).foregroundColor(.white)
                    .multilineTextAlignment(.center).lineSpacing(3)
                Text("Capitalism. Socialism. Woke. MAGA. Deep State.\nStrip the spell. Find the claim.")
                    .font(.system(size: 11, weight: .medium)).foregroundColor(.white.opacity(0.3))
                    .multilineTextAlignment(.center).lineSpacing(3)
            }
            HStack(spacing: 12) {
                wsdPill("5 Lessons")
                wsdPill("~75 min")
                wsdPill("No Sacred Cows")
            }
        }
    }

    private func wsdPill(_ text: String) -> some View {
        Text(text).font(.system(size: 9, weight: .bold)).tracking(0.5)
            .foregroundColor(accent.opacity(0.7))
            .padding(.horizontal, 10).padding(.vertical, 5)
            .background(Capsule().fill(accent.opacity(0.06))
                .overlay(Capsule().stroke(accent.opacity(0.12), lineWidth: 1)))
    }

    // MARK: — Progress

    private var progressCard: some View {
        VStack(spacing: 10) {
            HStack {
                Text("YOUR PROGRESS").font(.system(size: 9, weight: .black)).tracking(2)
                    .foregroundColor(.white.opacity(0.1))
                Spacer()
                Text("\(progress.totalCompleted)/\(wordSpellsDecodedCourse.count) complete")
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
                Text("✦ The spells are broken. You see the words for what they are. ✦")
                    .font(.system(size: 10, weight: .bold)).foregroundColor(accent.opacity(0.6))
                    .multilineTextAlignment(.center).padding(.top, 4)
            }
        }
        .padding(14)
        .background(RoundedRectangle(cornerRadius: 12).fill(Color.white.opacity(0.015))
            .overlay(RoundedRectangle(cornerRadius: 12).stroke(accent.opacity(0.06), lineWidth: 1)))
    }

    // MARK: — Warning card

    private var warningCard: some View {
        HStack(spacing: 10) {
            Text("⚖️").font(.system(size: 16))
            Text("This course examines trigger words from all political directions — left, right, and center. If one lesson feels more uncomfortable than the others, that discomfort is the signal.")
                .font(.system(size: 10, weight: .medium)).foregroundColor(.white.opacity(0.4))
                .lineSpacing(3)
        }
        .padding(12)
        .background(RoundedRectangle(cornerRadius: 10).fill(accent.opacity(0.04))
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(accent.opacity(0.1), lineWidth: 1)))
    }

    // MARK: — Lessons Grid

    private var lessonsGrid: some View {
        VStack(spacing: 10) {
            HStack {
                Text("LESSONS").font(.system(size: 9, weight: .black)).tracking(2)
                    .foregroundColor(.white.opacity(0.1))
                Spacer()
            }
            ForEach(wordSpellsDecodedCourse) { lesson in
                wsdLessonCard(lesson)
            }
        }
    }

    private func wsdLessonCard(_ lesson: WSDLesson) -> some View {
        let done = progress.isDone(lesson.id)
        return Button {
            progress.selectedLesson = lesson
            progress.showLesson = true
        } label: {
            HStack(spacing: 14) {
                ZStack {
                    Circle()
                        .fill(done ? accent.opacity(0.2) : Color.white.opacity(0.04))
                        .frame(width: 44, height: 44)
                    if done {
                        Image(systemName: "checkmark")
                            .font(.system(size: 14, weight: .bold)).foregroundColor(accent)
                    } else {
                        Text("\(lesson.lessonNumber)")
                            .font(.system(size: 16, weight: .black)).foregroundColor(.white.opacity(0.4))
                    }
                }
                VStack(alignment: .leading, spacing: 3) {
                    HStack(spacing: 6) {
                        Text("Lesson \(lesson.lessonNumber)")
                            .font(.system(size: 9, weight: .black)).tracking(1)
                            .foregroundColor(accent.opacity(0.4))
                        if done {
                            Text("DECODED").font(.system(size: 7, weight: .black)).tracking(1)
                                .foregroundColor(.black)
                                .padding(.horizontal, 5).padding(.vertical, 2)
                                .background(Capsule().fill(accent))
                        }
                    }
                    Text(lesson.title).font(.system(size: 14, weight: .bold)).foregroundColor(.white)
                    Text(lesson.subtitle).font(.system(size: 10, weight: .medium))
                        .foregroundColor(.white.opacity(0.3))
                }
                Spacer()
                Image(systemName: "chevron.right")
                    .font(.system(size: 10, weight: .semibold)).foregroundColor(accent.opacity(0.25))
            }
            .padding(14)
            .background(RoundedRectangle(cornerRadius: 12)
                .fill(done ? accent.opacity(0.05) : Color.white.opacity(0.012))
                .overlay(RoundedRectangle(cornerRadius: 12)
                    .stroke(done ? accent.opacity(0.15) : Color.white.opacity(0.03), lineWidth: 1)))
        }
    }

    private var closingQuote: some View {
        Text("\"The first thing they control is the vocabulary. Once they define the words, they define the reality. Reclaim the words and you reclaim your mind.\"")
            .font(.system(size: 10, weight: .medium)).foregroundColor(.white.opacity(0.2))
            .multilineTextAlignment(.center).italic().lineSpacing(4)
            .padding(14)
            .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.008)))
    }
}

// MARK: - Lesson Reader

struct WSDLessonView: View {
    let lesson: WSDLesson
    let accent: Color
    @ObservedObject var progress: WSDProgress

    @Environment(\.dismiss) var dismiss
    @State private var selectedTab = 0
    @State private var showComplete = false
    @State private var expandedWordID: UUID? = nil

    var tabs: [String] {
        var t = ["Content"]
        if !lesson.wordBreakdowns.isEmpty { t.append("Word Cards") }
        t.append("Response Tools")
        return t
    }

    var body: some View {
        ZStack {
            Color(red: 0.02, green: 0.02, blue: 0.04).ignoresSafeArea()

            VStack(spacing: 0) {
                // Tab bar
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 0) {
                        ForEach(Array(tabs.enumerated()), id: \.0) { idx, tab in
                            Button { withAnimation { selectedTab = idx } } label: {
                                Text(tab)
                                    .font(.system(size: 11, weight: selectedTab == idx ? .black : .medium))
                                    .foregroundColor(selectedTab == idx ? accent : .white.opacity(0.3))
                                    .padding(.horizontal, 16).padding(.vertical, 10)
                                    .background(selectedTab == idx ? accent.opacity(0.08) : Color.clear)
                            }
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

                        // Tab content
                        if selectedTab == 0 {
                            mainContent
                        } else if tabs[selectedTab] == "Word Cards" {
                            wordCardsContent
                        } else {
                            responseToolsContent
                        }

                        // Completion
                        if progress.isDone(lesson.id) {
                            HStack(spacing: 8) {
                                Image(systemName: "checkmark.circle.fill").foregroundColor(accent)
                                Text("Lesson Complete").font(.system(size: 14, weight: .bold))
                                    .foregroundColor(accent.opacity(0.7))
                            }
                            .frame(maxWidth: .infinity).padding(.vertical, 14)
                            .background(RoundedRectangle(cornerRadius: 12).fill(accent.opacity(0.06)))
                        } else {
                            Button {
                                progress.markComplete(lesson.id)
                                showComplete = true
                            } label: {
                                Text("Mark Lesson \(lesson.lessonNumber) Complete →")
                                    .font(.system(size: 15, weight: .bold)).foregroundColor(.black)
                                    .frame(maxWidth: .infinity).padding(.vertical, 15)
                                    .background(RoundedRectangle(cornerRadius: 14).fill(accent))
                            }
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
            Button("Keep Going") { dismiss() }
        } message: {
            Text("The spell is broken. You see the word — and what's behind it.")
        }
    }

    // MARK: — Content Tab

    private var mainContent: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Hook
            Text(lesson.hook)
                .font(.system(size: 13, weight: .medium)).foregroundColor(.white.opacity(0.55))
                .lineSpacing(5).italic()
                .padding(14)
                .background(RoundedRectangle(cornerRadius: 10).fill(accent.opacity(0.04))
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(accent.opacity(0.1), lineWidth: 1)))

            // Body
            WSDMarkdownBody(text: lesson.body, accent: accent)

            // America Already Has This
            if !lesson.americaAlreadyHasThis.isEmpty {
                wsdInfoBlock("🇺🇸  AMERICA ALREADY HAS THIS", lesson.americaAlreadyHasThis, color: accent)
            }

            // Reflection
            wsdInfoBlock("❓  REFLECTION", lesson.reflectionPrompt, color: .white.opacity(0.4))
        }
    }

    private func wsdInfoBlock(_ label: String, _ text: String, color: Color) -> some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(label).font(.system(size: 9, weight: .black)).tracking(1.5)
                .foregroundColor(color.opacity(0.8))
            Text(text).font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.55))
                .lineSpacing(4)
        }
        .padding(12)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(RoundedRectangle(cornerRadius: 8).fill(Color.white.opacity(0.008))
            .overlay(RoundedRectangle(cornerRadius: 8).stroke(color.opacity(0.08), lineWidth: 1)))
    }

    // MARK: — Word Cards Tab

    private var wordCardsContent: some View {
        VStack(spacing: 12) {
            Text("Tap a word to expand the full breakdown — what it triggers, what it actually means, where it already exists in America, and exactly how to respond.")
                .font(.system(size: 10, weight: .medium)).foregroundColor(.white.opacity(0.3))
                .lineSpacing(3).padding(.bottom, 4)

            ForEach(lesson.wordBreakdowns) { breakdown in
                wordCard(breakdown)
            }
        }
    }

    private func wordCard(_ wd: WSDWordBreakdown) -> some View {
        let isExpanded = expandedWordID == wd.id

        return VStack(alignment: .leading, spacing: 0) {
            // Header — always visible
            Button {
                withAnimation(.spring(response: 0.35, dampingFraction: 0.8)) {
                    expandedWordID = isExpanded ? nil : wd.id
                }
            } label: {
                HStack(spacing: 12) {
                    // Word pill
                    Text(wd.word.uppercased())
                        .font(.system(size: 13, weight: .black)).tracking(1)
                        .foregroundColor(.black)
                        .padding(.horizontal, 12).padding(.vertical, 6)
                        .background(Capsule().fill(accent))

                    Spacer()

                    // Emotion preview
                    Text(wd.emotionalTrigger.components(separatedBy: ".").first ?? "")
                        .font(.system(size: 9, weight: .medium)).foregroundColor(.white.opacity(0.3))
                        .lineLimit(1)

                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                        .font(.system(size: 10, weight: .semibold)).foregroundColor(accent.opacity(0.5))
                }
                .padding(14)
            }

            // Expanded content
            if isExpanded {
                VStack(alignment: .leading, spacing: 12) {
                    Divider().background(Color.white.opacity(0.06))

                    wordRow("🔴  WHAT IT TRIGGERS", wd.emotionalTrigger, color: .red.opacity(0.7))
                    wordRow("📖  WHAT IT ACTUALLY MEANS", wd.actualDefinition, color: accent)
                    wordRow("🇺🇸  ALREADY EXISTS IN AMERICA", wd.americanReality, color: .green.opacity(0.7))
                    wordRow("🎯  HOW IT'S DEPLOYED", wd.whoUsesIt, color: .orange.opacity(0.7))

                    // Disarm script — special highlight
                    VStack(alignment: .leading, spacing: 6) {
                        Text("💬  WHAT TO SAY WHEN SOMEONE USES IT")
                            .font(.system(size: 9, weight: .black)).tracking(1.5)
                            .foregroundColor(accent.opacity(0.9))
                        Text(wd.disarmScript)
                            .font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.8))
                            .lineSpacing(4).italic()
                    }
                    .padding(12)
                    .background(RoundedRectangle(cornerRadius: 8).fill(accent.opacity(0.08))
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(accent.opacity(0.2), lineWidth: 1)))
                }
                .padding(14)
            }
        }
        .background(RoundedRectangle(cornerRadius: 12)
            .fill(isExpanded ? Color.white.opacity(0.025) : Color.white.opacity(0.012))
            .overlay(RoundedRectangle(cornerRadius: 12)
                .stroke(isExpanded ? accent.opacity(0.2) : Color.white.opacity(0.04), lineWidth: 1)))
    }

    private func wordRow(_ label: String, _ text: String, color: Color) -> some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(label).font(.system(size: 9, weight: .black)).tracking(1.5)
                .foregroundColor(color)
            Text(text).font(.system(size: 11, weight: .medium)).foregroundColor(.white.opacity(0.6))
                .lineSpacing(4)
        }
    }

    // MARK: — Response Tools Tab

    private var responseToolsContent: some View {
        VStack(alignment: .leading, spacing: 14) {

            // Response script
            VStack(alignment: .leading, spacing: 8) {
                HStack(spacing: 6) {
                    Text("🗣️").font(.system(size: 14))
                    Text("RESPONSE SCRIPT").font(.system(size: 9, weight: .black)).tracking(2)
                        .foregroundColor(accent.opacity(0.6))
                }
                Text(lesson.responseScript)
                    .font(.system(size: 13, weight: .medium)).foregroundColor(.white.opacity(0.7))
                    .lineSpacing(5)
            }
            .padding(14)
            .background(RoundedRectangle(cornerRadius: 10).fill(accent.opacity(0.05))
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(accent.opacity(0.15), lineWidth: 1)))

            // The 3-second pause reminder
            VStack(alignment: .leading, spacing: 8) {
                Text("⏸  THE 3-SECOND PAUSE").font(.system(size: 9, weight: .black)).tracking(2)
                    .foregroundColor(.white.opacity(0.3))
                VStack(alignment: .leading, spacing: 6) {
                    pauseStep("1", "Notice the emotional response — don't suppress it, just notice it")
                    pauseStep("2", "Ask: Am I reacting to the word or to an actual specific claim?")
                    pauseStep("3", "Ask for specificity before responding: 'What exactly do you mean by that?'")
                }
            }
            .padding(14)
            .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.012)))

            // Precision questions
            VStack(alignment: .leading, spacing: 8) {
                Text("❓  PRECISION QUESTIONS THAT WORK").font(.system(size: 9, weight: .black)).tracking(2)
                    .foregroundColor(.white.opacity(0.3))
                VStack(alignment: .leading, spacing: 8) {
                    precisionQ("\"Which specific policy or action are you describing?\"")
                    precisionQ("\"What's the evidence that this fits that definition?\"")
                    precisionQ("\"What would need to be true for this concern to be addressed?\"")
                    precisionQ("\"Can you explain the difference between this and [existing program]?\"")
                    precisionQ("\"What would change your mind about this?\"")
                }
            }
            .padding(14)
            .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.012)))

            // Steelman reminder
            VStack(alignment: .leading, spacing: 8) {
                Text("🛡  THE STEELMAN MOVE").font(.system(size: 9, weight: .black)).tracking(2)
                    .foregroundColor(.white.opacity(0.3))
                Text("Before responding, restate the best version of what they're saying:\n\n\"So what I hear you saying is — [best version of their concern]. Is that right?\"\n\nThis demonstrates genuine listening, often earns reciprocal good faith, and forces you to engage with the actual argument — not the trigger word.")
                    .font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.5))
                    .lineSpacing(4)
            }
            .padding(14)
            .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.012)))

            // When to exit
            VStack(alignment: .leading, spacing: 8) {
                Text("🚪  WHEN TO WALK AWAY").font(.system(size: 9, weight: .black)).tracking(2)
                    .foregroundColor(.white.opacity(0.3))
                Text("Not every conversation is worth engaging. Exit when:\n• Emotional tone escalates regardless of what you say\n• The same trigger word repeats after you've asked for specificity\n• The goal is clearly performance, not communication\n• Aggression increases when you demonstrate knowledge\n\nThe exit line: \"I see it differently. I don't think we'll resolve this right now — but I appreciate you sharing your perspective.\"")
                    .font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.5))
                    .lineSpacing(4)
            }
            .padding(14)
            .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.012)))

            // Reflection
            wsdInfoBlock("❓  REFLECTION", lesson.reflectionPrompt, color: .white.opacity(0.35))
        }
    }

    private func pauseStep(_ num: String, _ text: String) -> some View {
        HStack(alignment: .top, spacing: 10) {
            Text(num).font(.system(size: 11, weight: .black)).foregroundColor(accent)
                .frame(width: 20)
            Text(text).font(.system(size: 11, weight: .medium)).foregroundColor(.white.opacity(0.55))
                .lineSpacing(3)
        }
    }

    private func precisionQ(_ q: String) -> some View {
        Text(q).font(.system(size: 11, weight: .medium)).foregroundColor(.white.opacity(0.6))
            .lineSpacing(3).italic()
            .padding(10)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(RoundedRectangle(cornerRadius: 6).fill(Color.white.opacity(0.008)))
    }
}

// MARK: - Markdown Renderer

struct WSDMarkdownBody: View {
    let text: String
    let accent: Color

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ForEach(parsed(), id: \.id) { block in
                if block.isHeading {
                    Text(block.text)
                        .font(.system(size: 13, weight: .black))
                        .foregroundColor(accent.opacity(0.8))
                        .padding(.top, 6)
                } else {
                    buildBoldText(block.text)
                        .font(.system(size: 13))
                        .foregroundColor(.white.opacity(0.6))
                        .lineSpacing(5)
                }
            }
        }
    }

    private func buildBoldText(_ raw: String) -> Text {
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
