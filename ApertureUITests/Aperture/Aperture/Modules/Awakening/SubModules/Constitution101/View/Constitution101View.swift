// Constitution101View.swift
// Constitution 101 Course UI
// Learn your constitutional rights

import SwiftUI

struct Constitution101View: View {

    @Environment(\.dismiss) private var dismiss
    @State private var selectedModule: ConstitutionModule?
    @State private var completedLessons: Set<String> = []

    var body: some View {

        NavigationStack {

            ZStack {

                constitutionBackground

                ScrollView(showsIndicators: false) {

                    VStack(spacing: 24) {

                        headerSection

                        quoteBanner

                        progressSection

                        modulesSection

                        Spacer(minLength: 100)

                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 20)

                }

            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: { dismiss() }) {
                        HStack(spacing: 4) {
                            Image(systemName: "chevron.left")
                            Text("Back")
                        }
                        .foregroundColor(Palette.text.secondary)
                    }
                }
            }
            .sheet(item: $selectedModule) { module in
                ConstitutionModuleDetailView(module: module, completedLessons: $completedLessons)
            }

        }

    }

    // MARK: - Header

    private var headerSection: some View {

        VStack(spacing: 16) {

            ZStack {
                Circle()
                    .fill(Constitution101Course.color.opacity(0.2))
                    .frame(width: 80, height: 80)

                Image(systemName: Constitution101Course.icon)
                    .font(.system(size: 36))
                    .foregroundColor(Constitution101Course.color)
            }

            Text(Constitution101Course.title)
                .font(.system(size: 24, weight: .black, design: .rounded))
                .foregroundColor(.white)

            Text(Constitution101Course.subtitle)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(Palette.text.secondary)

        }

    }

    // MARK: - Quote

    private var quoteBanner: some View {

        VStack(spacing: 8) {
            Text("\"The Constitution doesn't GIVE you rights. You are BORN with natural rights. The Constitution PROTECTS those rights from government interference.\"")
                .font(.system(size: 13, weight: .medium))
                .foregroundColor(Constitution101Course.color)
                .italic()
                .multilineTextAlignment(.center)
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Constitution101Course.color.opacity(0.1))
        )

    }

    // MARK: - Progress

    private var progressSection: some View {

        let totalLessons = Constitution101Course.modules.reduce(0) { $0 + $1.lessons.count }
        let completedCount = completedLessons.count
        let progress = totalLessons > 0 ? Double(completedCount) / Double(totalLessons) : 0

        return VStack(spacing: 10) {

            HStack {
                Text("YOUR PROGRESS")
                    .font(.system(size: 10, weight: .bold))
                    .foregroundColor(Palette.text.muted)
                    .tracking(1)

                Spacer()

                Text("\(completedCount)/\(totalLessons) lessons")
                    .font(.system(size: 11, weight: .semibold))
                    .foregroundColor(Palette.text.secondary)
            }

            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color.white.opacity(0.1))
                        .frame(height: 8)

                    RoundedRectangle(cornerRadius: 4)
                        .fill(Constitution101Course.color)
                        .frame(width: geo.size.width * progress, height: 8)
                }
            }
            .frame(height: 8)

        }
        .padding(14)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white.opacity(0.05))
        )

    }

    // MARK: - Modules

    private var modulesSection: some View {

        VStack(alignment: .leading, spacing: 16) {

            Text("AMENDMENTS & FOUNDATIONS")
                .font(.system(size: 10, weight: .bold))
                .foregroundColor(Palette.text.muted)
                .tracking(1)

            ForEach(Constitution101Course.modules) { module in
                moduleCard(module)
            }

        }

    }

    private func moduleCard(_ module: ConstitutionModule) -> some View {

        let completedInModule = module.lessons.filter { completedLessons.contains($0.id.uuidString) }.count
        let isCompleted = completedInModule == module.lessons.count

        return Button(action: { 
            HapticManager.shared.cardFlip()
            selectedModule = module 
        }) {

            HStack(spacing: 14) {

                // Amendment number or icon
                ZStack {
                    Circle()
                        .fill(isCompleted ? Constitution101Course.color : Color.white.opacity(0.1))
                        .frame(width: 44, height: 44)

                    if isCompleted {
                        Image(systemName: "checkmark")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.black)
                    } else {
                        Image(systemName: module.icon)
                            .font(.system(size: 18))
                            .foregroundColor(Constitution101Course.color)
                    }
                }

                VStack(alignment: .leading, spacing: 4) {
                    Text(module.title)
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundColor(.white)

                    Text(module.subtitle)
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(Palette.text.secondary)
                        .lineLimit(1)
                }

                Spacer()

                Text("\(completedInModule)/\(module.lessons.count)")
                    .font(.system(size: 11, weight: .semibold))
                    .foregroundColor(Constitution101Course.color)

                Image(systemName: "chevron.right")
                    .font(.system(size: 14))
                    .foregroundColor(Palette.text.muted)

            }
            .padding(14)
            .background(
                RoundedRectangle(cornerRadius: 14)
                    .fill(Color.white.opacity(0.05))
                    .overlay(
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(isCompleted ? Constitution101Course.color.opacity(0.3) : Color.clear, lineWidth: 1)
                    )
            )

        }

    }

    // MARK: - Background

    private var constitutionBackground: some View {

        ZStack {

            LinearGradient(
                colors: [
                    Color(hex: "#0a0f1a"),
                    Color(hex: "#0d1520"),
                    Color(hex: "#0a0f1a")
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            // Subtle document texture
            ForEach(0..<20, id: \.self) { i in
                RoundedRectangle(cornerRadius: 2)
                    .fill(Color.white.opacity(0.02))
                    .frame(width: CGFloat(50 + (i * 7) % 100), height: 1)
                    .position(
                        x: CGFloat((i * 53) % Int(UIScreen.main.bounds.width)),
                        y: CGFloat((i * 71) % Int(UIScreen.main.bounds.height))
                    )
            }

        }

    }

}

// MARK: - Module Detail View

struct ConstitutionModuleDetailView: View {

    let module: ConstitutionModule
    @Binding var completedLessons: Set<String>
    @Environment(\.dismiss) private var dismiss
    @State private var selectedLesson: ConstitutionLesson?

    var body: some View {

        NavigationStack {

            ZStack {

                Color.black.ignoresSafeArea()

                ScrollView(showsIndicators: false) {

                    VStack(spacing: 24) {

                        moduleHeader

                        lessonsSection

                        keyPointsSection

                        Spacer(minLength: 50)

                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 20)

                }

            }
            .navigationTitle(module.title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { dismiss() }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(Palette.text.secondary)
                    }
                }
            }
            .sheet(item: $selectedLesson) { lesson in
                ConstitutionLessonView(lesson: lesson, completedLessons: $completedLessons)
            }

        }

    }

    private var moduleHeader: some View {

        VStack(spacing: 12) {

            Image(systemName: module.icon)
                .font(.system(size: 44))
                .foregroundColor(Constitution101Course.color)

            Text(module.subtitle)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(Palette.text.secondary)
                .multilineTextAlignment(.center)

        }

    }

    private var lessonsSection: some View {

        VStack(alignment: .leading, spacing: 12) {

            Text("LESSONS")
                .font(.system(size: 10, weight: .bold))
                .foregroundColor(Palette.text.muted)
                .tracking(1)

            ForEach(Array(module.lessons.enumerated()), id: \.element.id) { index, lesson in
                lessonRow(lesson, index: index + 1)
            }

        }

    }

    private func lessonRow(_ lesson: ConstitutionLesson, index: Int) -> some View {

        let isCompleted = completedLessons.contains(lesson.id.uuidString)

        return Button(action: { 
            HapticManager.shared.light()
            selectedLesson = lesson 
        }) {

            HStack(spacing: 12) {

                ZStack {
                    Circle()
                        .fill(isCompleted ? Constitution101Course.color : Color.white.opacity(0.1))
                        .frame(width: 32, height: 32)

                    if isCompleted {
                        Image(systemName: "checkmark")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(.black)
                    } else {
                        Text("\(index)")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(Palette.text.secondary)
                    }
                }

                Text(lesson.title)
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)

                Spacer()

                Image(systemName: "chevron.right")
                    .font(.system(size: 12))
                    .foregroundColor(Palette.text.muted)

            }
            .padding(12)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white.opacity(0.05))
            )

        }

    }

    private var keyPointsSection: some View {

        VStack(alignment: .leading, spacing: 12) {

            Text("KEY POINTS")
                .font(.system(size: 10, weight: .bold))
                .foregroundColor(Palette.text.muted)
                .tracking(1)

            ForEach(module.keyPoints, id: \.self) { point in
                HStack(alignment: .top, spacing: 10) {
                    Image(systemName: "star.fill")
                        .font(.system(size: 12))
                        .foregroundColor(Constitution101Course.color)

                    Text(point)
                        .font(.system(size: 13, weight: .medium))
                        .foregroundColor(Palette.text.secondary)
                }
            }

        }
        .padding(14)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Constitution101Course.color.opacity(0.1))
        )

    }

}

// MARK: - Lesson View

struct ConstitutionLessonView: View {

    let lesson: ConstitutionLesson
    @Binding var completedLessons: Set<String>
    @Environment(\.dismiss) private var dismiss

    var body: some View {

        NavigationStack {

            ZStack {

                Color.black.ignoresSafeArea()

                ScrollView(showsIndicators: false) {

                    VStack(alignment: .leading, spacing: 24) {

                        Text(lesson.title)
                            .font(.system(size: 22, weight: .bold, design: .rounded))
                            .foregroundColor(.white)

                        // Original text if available
                        if let originalText = lesson.originalText {
                            originalTextSection(originalText)
                        }

                        // Plain English
                        VStack(alignment: .leading, spacing: 8) {
                            Text("IN PLAIN ENGLISH")
                                .font(.system(size: 10, weight: .bold))
                                .foregroundColor(Constitution101Course.color)
                                .tracking(1)

                            Text(lesson.plainEnglish)
                                .font(.system(size: 15, weight: .medium))
                                .foregroundColor(Palette.text.secondary)
                                .lineSpacing(6)
                        }

                        // Real world application
                        VStack(alignment: .leading, spacing: 8) {
                            Text("REAL WORLD APPLICATION")
                                .font(.system(size: 10, weight: .bold))
                                .foregroundColor(Palette.accent.gold)
                                .tracking(1)

                            Text(lesson.realWorldApplication)
                                .font(.system(size: 15, weight: .medium))
                                .foregroundColor(Palette.text.secondary)
                                .lineSpacing(6)
                        }
                        .padding(14)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Palette.accent.gold.opacity(0.1))
                        )

                        // Key cases
                        if !lesson.keyCases.isEmpty {
                            keyCasesSection
                        }

                        completeButton

                        Spacer(minLength: 50)

                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 20)

                }

            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { dismiss() }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(Palette.text.secondary)
                    }
                }
            }

        }

    }

    private func originalTextSection(_ text: String) -> some View {

        VStack(alignment: .leading, spacing: 8) {

            Text("ORIGINAL TEXT")
                .font(.system(size: 10, weight: .bold))
                .foregroundColor(Palette.text.muted)
                .tracking(1)

            Text(text)
                .font(.system(size: 14, weight: .medium, design: .serif))
                .foregroundColor(Palette.text.secondary)
                .italic()
                .lineSpacing(4)

        }
        .padding(14)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white.opacity(0.03))
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.white.opacity(0.1), lineWidth: 1)
                )
        )

    }

    private var keyCasesSection: some View {

        VStack(alignment: .leading, spacing: 12) {

            Text("LANDMARK CASES")
                .font(.system(size: 10, weight: .bold))
                .foregroundColor(Palette.text.muted)
                .tracking(1)

            ForEach(lesson.keyCases) { courtCase in
                caseCard(courtCase)
            }

        }

    }

    private func caseCard(_ courtCase: ConstitutionCase) -> some View {

        VStack(alignment: .leading, spacing: 8) {

            HStack {
                Text(courtCase.name)
                    .font(.system(size: 15, weight: .bold))
                    .foregroundColor(.white)

                Spacer()

                Text(courtCase.year)
                    .font(.system(size: 12, weight: .semibold, design: .monospaced))
                    .foregroundColor(Constitution101Course.color)
            }

            Text(courtCase.summary)
                .font(.system(size: 13, weight: .medium))
                .foregroundColor(Palette.text.secondary)

            HStack(spacing: 6) {
                Image(systemName: "arrow.right.circle.fill")
                    .foregroundColor(Constitution101Course.color)
                Text("Impact: \(courtCase.impact)")
                    .foregroundColor(Constitution101Course.color)
            }
            .font(.system(size: 12, weight: .semibold))

        }
        .padding(14)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white.opacity(0.05))
        )

    }

    private var completeButton: some View {

        let isCompleted = completedLessons.contains(lesson.id.uuidString)

        return Button(action: {
            if isCompleted {
                completedLessons.remove(lesson.id.uuidString)
            } else {
                completedLessons.insert(lesson.id.uuidString)
                let generator = UINotificationFeedbackGenerator()
                generator.notificationOccurred(.success)
            }
        }) {
            HStack(spacing: 10) {
                Image(systemName: isCompleted ? "checkmark.circle.fill" : "circle")
                Text(isCompleted ? "Completed" : "Mark as Complete")
            }
            .font(.system(size: 16, weight: .bold))
            .foregroundColor(isCompleted ? .black : .white)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .background(
                RoundedRectangle(cornerRadius: 14)
                    .fill(isCompleted ? Constitution101Course.color : Color.white.opacity(0.1))
            )
        }

    }

}

// MARK: - Preview

#Preview {
    Constitution101View()
}
