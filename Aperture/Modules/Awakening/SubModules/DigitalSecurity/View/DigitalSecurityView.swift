// DigitalSecurityView.swift
// Digital Security Course - Protect Your Privacy

import SwiftUI

struct DigitalSecurityView: View {

    @Environment(\.dismiss) private var dismiss
    @State private var selectedModule: DigitalSecurityModule?
    @State private var completedLessons: Set<String> = []

    var body: some View {

        NavigationStack {

            ZStack {

                securityBackground

                ScrollView(showsIndicators: false) {

                    VStack(spacing: 24) {

                        headerSection

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
                DigitalSecurityModuleView(module: module, completedLessons: $completedLessons)
            }

        }

    }

    // MARK: - Header

    private var headerSection: some View {

        VStack(spacing: 16) {

            ZStack {
                Circle()
                    .fill(DigitalSecurityCourse.color.opacity(0.2))
                    .frame(width: 80, height: 80)

                Image(systemName: DigitalSecurityCourse.icon)
                    .font(.system(size: 36))
                    .foregroundColor(DigitalSecurityCourse.color)
            }

            Text(DigitalSecurityCourse.title)
                .font(.system(size: 24, weight: .black, design: .rounded))
                .foregroundColor(.white)

            Text(DigitalSecurityCourse.subtitle)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(Palette.text.secondary)
                .multilineTextAlignment(.center)

            // Quote
            VStack(spacing: 4) {
                Text(DigitalSecurityCourse.quote)
                    .font(.system(size: 13, weight: .medium, design: .rounded))
                    .foregroundColor(DigitalSecurityCourse.color)
                    .italic()

                Text("— \(DigitalSecurityCourse.quoteAuthor)")
                    .font(.system(size: 11, weight: .medium))
                    .foregroundColor(Palette.text.muted)
            }
            .padding(.top, 8)

        }

    }

    // MARK: - Progress

    private var progressSection: some View {

        let totalLessons = DigitalSecurityCourse.modules.reduce(0) { $0 + $1.lessons.count }
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
                        .fill(DigitalSecurityCourse.color)
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

            Text("MODULES")
                .font(.system(size: 10, weight: .bold))
                .foregroundColor(Palette.text.muted)
                .tracking(1)

            ForEach(DigitalSecurityCourse.modules) { module in
                moduleCard(module)
            }

        }

    }

    private func moduleCard(_ module: DigitalSecurityModule) -> some View {

        let completedInModule = module.lessons.filter { completedLessons.contains($0.id.uuidString) }.count
        let isCompleted = completedInModule == module.lessons.count

        return Button(action: { selectedModule = module }) {

            HStack(spacing: 14) {

                // Module number
                ZStack {
                    Circle()
                        .fill(isCompleted ? DigitalSecurityCourse.color : Color.white.opacity(0.1))
                        .frame(width: 44, height: 44)

                    if isCompleted {
                        Image(systemName: "checkmark")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.black)
                    } else {
                        Text("\(module.number)")
                            .font(.system(size: 18, weight: .bold, design: .rounded))
                            .foregroundColor(DigitalSecurityCourse.color)
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

                VStack(alignment: .trailing, spacing: 4) {
                    Text(module.duration)
                        .font(.system(size: 11, weight: .medium))
                        .foregroundColor(Palette.text.muted)

                    Text("\(completedInModule)/\(module.lessons.count)")
                        .font(.system(size: 10, weight: .semibold))
                        .foregroundColor(DigitalSecurityCourse.color)
                }

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
                            .stroke(isCompleted ? DigitalSecurityCourse.color.opacity(0.3) : Color.clear, lineWidth: 1)
                    )
            )

        }

    }

    // MARK: - Background

    private var securityBackground: some View {

        ZStack {

            LinearGradient(
                colors: [
                    Color(hex: "#0a0f0a"),
                    Color(hex: "#0d1810"),
                    Color(hex: "#0a0f0a")
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            // Matrix-style effect
            ForEach(0..<30, id: \.self) { i in
                Text("01")
                    .font(.system(size: 8, weight: .light, design: .monospaced))
                    .foregroundColor(DigitalSecurityCourse.color.opacity(0.1))
                    .position(
                        x: CGFloat((i * 47) % Int(UIScreen.main.bounds.width)),
                        y: CGFloat((i * 83) % Int(UIScreen.main.bounds.height))
                    )
            }

        }

    }

}

// MARK: - Module Detail View

struct DigitalSecurityModuleView: View {

    let module: DigitalSecurityModule
    @Binding var completedLessons: Set<String>
    @Environment(\.dismiss) private var dismiss
    @State private var selectedLesson: DigitalSecurityLesson?

    var body: some View {

        NavigationStack {

            ZStack {

                Color.black.ignoresSafeArea()

                ScrollView(showsIndicators: false) {

                    VStack(spacing: 24) {

                        moduleHeader

                        lessonsSection

                        keyTakeawaysSection

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
                LessonDetailView(lesson: lesson, completedLessons: $completedLessons)
            }

        }

    }

    private var moduleHeader: some View {

        VStack(spacing: 12) {

            Image(systemName: module.icon)
                .font(.system(size: 40))
                .foregroundColor(DigitalSecurityCourse.color)

            Text(module.subtitle)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(Palette.text.secondary)

            Text(module.duration)
                .font(.system(size: 12, weight: .semibold))
                .foregroundColor(Palette.text.muted)

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

    private func lessonRow(_ lesson: DigitalSecurityLesson, index: Int) -> some View {

        let isCompleted = completedLessons.contains(lesson.id.uuidString)

        return Button(action: { selectedLesson = lesson }) {

            HStack(spacing: 12) {

                ZStack {
                    Circle()
                        .fill(isCompleted ? DigitalSecurityCourse.color : Color.white.opacity(0.1))
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
                    .lineLimit(2)
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

    private var keyTakeawaysSection: some View {

        VStack(alignment: .leading, spacing: 12) {

            Text("KEY TAKEAWAYS")
                .font(.system(size: 10, weight: .bold))
                .foregroundColor(Palette.text.muted)
                .tracking(1)

            ForEach(module.keyTakeaways, id: \.self) { takeaway in
                HStack(alignment: .top, spacing: 10) {
                    Image(systemName: "checkmark.circle.fill")
                        .font(.system(size: 14))
                        .foregroundColor(DigitalSecurityCourse.color)

                    Text(takeaway)
                        .font(.system(size: 13, weight: .medium))
                        .foregroundColor(Palette.text.secondary)
                }
            }

        }
        .padding(14)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(DigitalSecurityCourse.color.opacity(0.1))
        )

    }

}

// MARK: - Lesson Detail View

struct LessonDetailView: View {

    let lesson: DigitalSecurityLesson
    @Binding var completedLessons: Set<String>
    @Environment(\.dismiss) private var dismiss

    var body: some View {

        NavigationStack {

            ZStack {

                Color.black.ignoresSafeArea()

                ScrollView(showsIndicators: false) {

                    VStack(alignment: .leading, spacing: 24) {

                        // Title
                        Text(lesson.title)
                            .font(.system(size: 22, weight: .bold, design: .rounded))
                            .foregroundColor(.white)

                        // Content
                        Text(lesson.content)
                            .font(.system(size: 15, weight: .medium))
                            .foregroundColor(Palette.text.secondary)
                            .lineSpacing(6)

                        // Facts
                        if !lesson.facts.isEmpty {
                            factsSection
                        }

                        // Action Items
                        if !lesson.actionItems.isEmpty {
                            actionItemsSection
                        }

                        // Complete button
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

    private var factsSection: some View {

        VStack(alignment: .leading, spacing: 12) {

            Text("KEY FACTS")
                .font(.system(size: 10, weight: .bold))
                .foregroundColor(Palette.text.muted)
                .tracking(1)

            ForEach(lesson.facts) { fact in
                factCard(fact)
            }

        }

    }

    private func factCard(_ fact: SecurityFact) -> some View {

        HStack(alignment: .top, spacing: 12) {

            Image(systemName: fact.icon)
                .font(.system(size: 20))
                .foregroundColor(DigitalSecurityCourse.color)
                .frame(width: 30)

            VStack(alignment: .leading, spacing: 4) {

                Text(fact.title)
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(.white)

                Text(fact.description)
                    .font(.system(size: 13, weight: .medium))
                    .foregroundColor(Palette.text.secondary)

                if let source = fact.source {
                    Text("Source: \(source)")
                        .font(.system(size: 10, weight: .medium))
                        .foregroundColor(Palette.text.muted)
                        .italic()
                }

            }

        }
        .padding(12)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white.opacity(0.05))
        )

    }

    private var actionItemsSection: some View {

        VStack(alignment: .leading, spacing: 12) {

            Text("ACTION ITEMS")
                .font(.system(size: 10, weight: .bold))
                .foregroundColor(Palette.accent.gold)
                .tracking(1)

            ForEach(lesson.actionItems, id: \.self) { item in
                HStack(alignment: .top, spacing: 10) {
                    Image(systemName: "arrow.right.circle.fill")
                        .font(.system(size: 14))
                        .foregroundColor(Palette.accent.gold)

                    Text(item)
                        .font(.system(size: 13, weight: .medium))
                        .foregroundColor(Palette.text.secondary)
                }
            }

        }
        .padding(14)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Palette.accent.gold.opacity(0.1))
        )

    }

    private var completeButton: some View {

        let isCompleted = completedLessons.contains(lesson.id.uuidString)

        return Button(action: {
            if isCompleted {
                completedLessons.remove(lesson.id.uuidString)
            } else {
                completedLessons.insert(lesson.id.uuidString)
                // Haptic
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
                    .fill(isCompleted ? DigitalSecurityCourse.color : Color.white.opacity(0.1))
            )
        }

    }

}

// MARK: - Preview

#Preview {

    DigitalSecurityView()

}
