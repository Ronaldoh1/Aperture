// KnowYourRightsView.swift
// Know Your Rights Course UI
// Filter by immigration status to see relevant content

import SwiftUI

struct KnowYourRightsView: View {

    @Environment(\.dismiss) private var dismiss
    @State private var selectedStatus: ImmigrationStatus = .all
    @State private var selectedModule: RightsModule?
    @State private var showingQuickReference = false
    @State private var completedLessons: Set<String> = []

    var filteredModules: [RightsModule] {
        KnowYourRightsCourse.modules.filter { module in
            module.applicableTo.contains(.all) || module.applicableTo.contains(selectedStatus)
        }
    }

    var body: some View {

        NavigationStack {

            ZStack {

                rightsBackground

                ScrollView(showsIndicators: false) {

                    VStack(spacing: 24) {

                        headerSection

                        statusSelector

                        disclaimerBanner

                        quickReferenceButton

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
                RightsModuleDetailView(module: module, completedLessons: $completedLessons)
            }
            .sheet(isPresented: $showingQuickReference) {
                QuickRightsReferenceView()
            }

        }

    }

    // MARK: - Header

    private var headerSection: some View {

        VStack(spacing: 16) {

            ZStack {
                Circle()
                    .fill(KnowYourRightsCourse.color.opacity(0.2))
                    .frame(width: 80, height: 80)

                Image(systemName: KnowYourRightsCourse.icon)
                    .font(.system(size: 36))
                    .foregroundColor(KnowYourRightsCourse.color)
            }

            Text(KnowYourRightsCourse.title)
                .font(.system(size: 24, weight: .black, design: .rounded))
                .foregroundColor(.white)

            Text(KnowYourRightsCourse.subtitle)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(Palette.text.secondary)

        }

    }

    // MARK: - Status Selector

    private var statusSelector: some View {

        VStack(alignment: .leading, spacing: 12) {

            Text("FILTER BY STATUS")
                .font(.system(size: 10, weight: .bold))
                .foregroundColor(Palette.text.muted)
                .tracking(1)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(ImmigrationStatus.allCases, id: \.self) { status in
                        statusButton(status)
                    }
                }
            }

        }

    }

    private func statusButton(_ status: ImmigrationStatus) -> some View {

        let isSelected = selectedStatus == status

        return Button(action: {
            withAnimation(.spring(response: 0.3)) {
                selectedStatus = status
            }
        }) {
            Text(status.rawValue)
                .font(.system(size: 13, weight: .semibold))
                .foregroundColor(isSelected ? .black : .white)
                .padding(.horizontal, 14)
                .padding(.vertical, 8)
                .background(
                    Capsule()
                        .fill(isSelected ? KnowYourRightsCourse.color : Color.white.opacity(0.1))
                )
        }

    }

    // MARK: - Disclaimer

    private var disclaimerBanner: some View {

        HStack(alignment: .top, spacing: 10) {
            Image(systemName: "exclamationmark.triangle.fill")
                .foregroundColor(.orange)

            Text(KnowYourRightsCourse.disclaimer)
                .font(.system(size: 11, weight: .medium))
                .foregroundColor(.orange)
        }
        .padding(12)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.orange.opacity(0.1))
        )

    }

    // MARK: - Quick Reference Button

    private var quickReferenceButton: some View {

        Button(action: { showingQuickReference = true }) {
            HStack {
                Image(systemName: "shield.checkered")
                    .font(.title3)
                Text("Quick Reference: Scripts to Memorize")
                    .font(.system(size: 14, weight: .semibold))
                Spacer()
                Image(systemName: "chevron.right")
            }
            .foregroundColor(Palette.accent.gold)
            .padding(14)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Palette.accent.gold.opacity(0.15))
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Palette.accent.gold.opacity(0.3), lineWidth: 1)
                    )
            )
        }

    }

    // MARK: - Modules

    private var modulesSection: some View {

        VStack(alignment: .leading, spacing: 16) {

            HStack {
                Text("MODULES")
                    .font(.system(size: 10, weight: .bold))
                    .foregroundColor(Palette.text.muted)
                    .tracking(1)

                Spacer()

                Text("\(filteredModules.count) applicable")
                    .font(.system(size: 10, weight: .medium))
                    .foregroundColor(Palette.text.muted)
            }

            ForEach(filteredModules) { module in
                moduleCard(module)
            }

        }

    }

    private func moduleCard(_ module: RightsModule) -> some View {

        let completedInModule = module.lessons.filter { completedLessons.contains($0.id.uuidString) }.count

        return Button(action: { selectedModule = module }) {

            HStack(spacing: 14) {

                ZStack {
                    Circle()
                        .fill(KnowYourRightsCourse.color.opacity(0.2))
                        .frame(width: 44, height: 44)

                    Image(systemName: module.icon)
                        .font(.system(size: 18))
                        .foregroundColor(KnowYourRightsCourse.color)
                }

                VStack(alignment: .leading, spacing: 4) {
                    Text(module.title)
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)

                    Text(module.subtitle)
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(Palette.text.secondary)
                        .lineLimit(1)
                }

                Spacer()

                VStack(alignment: .trailing, spacing: 4) {
                    Text("\(completedInModule)/\(module.lessons.count)")
                        .font(.system(size: 11, weight: .semibold))
                        .foregroundColor(KnowYourRightsCourse.color)

                    // Status badges
                    if !module.applicableTo.contains(.all) {
                        HStack(spacing: 2) {
                            ForEach(module.applicableTo, id: \.self) { status in
                                Text(statusIcon(status))
                                    .font(.system(size: 10))
                            }
                        }
                    }
                }

                Image(systemName: "chevron.right")
                    .font(.system(size: 14))
                    .foregroundColor(Palette.text.muted)

            }
            .padding(14)
            .background(
                RoundedRectangle(cornerRadius: 14)
                    .fill(Color.white.opacity(0.05))
            )

        }

    }

    private func statusIcon(_ status: ImmigrationStatus) -> String {
        switch status {
        case .citizen: return "🇺🇸"
        case .greenCard: return "💳"
        case .visa: return "📄"
        case .undocumented: return "🛡️"
        case .all: return "👥"
        }
    }

    // MARK: - Background

    private var rightsBackground: some View {

        LinearGradient(
            colors: [
                Color(hex: "#0a1a0a"),
                Color(hex: "#0d200d"),
                Color(hex: "#0a1a0a")
            ],
            startPoint: .top,
            endPoint: .bottom
        )
        .ignoresSafeArea()

    }

}

// MARK: - Module Detail View

struct RightsModuleDetailView: View {

    let module: RightsModule
    @Binding var completedLessons: Set<String>
    @Environment(\.dismiss) private var dismiss
    @State private var selectedLesson: RightsLesson?

    var body: some View {

        NavigationStack {

            ZStack {

                Color.black.ignoresSafeArea()

                ScrollView(showsIndicators: false) {

                    VStack(spacing: 24) {

                        moduleHeader

                        lessonsSection

                        keyRightsSection

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
                RightsLessonView(lesson: lesson, completedLessons: $completedLessons)
            }

        }

    }

    private var moduleHeader: some View {

        VStack(spacing: 12) {

            Image(systemName: module.icon)
                .font(.system(size: 44))
                .foregroundColor(KnowYourRightsCourse.color)

            Text(module.subtitle)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(Palette.text.secondary)

            // Applicable to badges
            HStack(spacing: 6) {
                ForEach(module.applicableTo, id: \.self) { status in
                    Text(status.rawValue)
                        .font(.system(size: 10, weight: .semibold))
                        .foregroundColor(.white)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(
                            Capsule()
                                .fill(KnowYourRightsCourse.color.opacity(0.3))
                        )
                }
            }

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

    private func lessonRow(_ lesson: RightsLesson, index: Int) -> some View {

        let isCompleted = completedLessons.contains(lesson.id.uuidString)

        return Button(action: { selectedLesson = lesson }) {

            HStack(spacing: 12) {

                ZStack {
                    Circle()
                        .fill(isCompleted ? KnowYourRightsCourse.color : Color.white.opacity(0.1))
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

    private var keyRightsSection: some View {

        VStack(alignment: .leading, spacing: 12) {

            Text("KEY RIGHTS")
                .font(.system(size: 10, weight: .bold))
                .foregroundColor(Palette.text.muted)
                .tracking(1)

            ForEach(module.keyRights, id: \.self) { right in
                HStack(alignment: .top, spacing: 10) {
                    Image(systemName: "checkmark.shield.fill")
                        .font(.system(size: 14))
                        .foregroundColor(KnowYourRightsCourse.color)

                    Text(right)
                        .font(.system(size: 13, weight: .medium))
                        .foregroundColor(Palette.text.secondary)
                }
            }

        }
        .padding(14)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(KnowYourRightsCourse.color.opacity(0.1))
        )

    }

}

// MARK: - Lesson View

struct RightsLessonView: View {

    let lesson: RightsLesson
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

                        Text(lesson.content)
                            .font(.system(size: 15, weight: .medium))
                            .foregroundColor(Palette.text.secondary)
                            .lineSpacing(6)

                        // Scenarios
                        if !lesson.scenarios.isEmpty {
                            scenariosSection
                        }

                        // Scripts
                        if !lesson.scripts.isEmpty {
                            scriptsSection
                        }

                        // Warnings
                        if !lesson.warnings.isEmpty {
                            warningsSection
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

    private var scenariosSection: some View {

        VStack(alignment: .leading, spacing: 12) {

            Text("REAL SCENARIOS")
                .font(.system(size: 10, weight: .bold))
                .foregroundColor(Palette.text.muted)
                .tracking(1)

            ForEach(lesson.scenarios) { scenario in
                scenarioCard(scenario)
            }

        }

    }

    private func scenarioCard(_ scenario: RightsScenario) -> some View {

        VStack(alignment: .leading, spacing: 12) {

            // Situation
            Text(scenario.situation)
                .font(.system(size: 15, weight: .bold))
                .foregroundColor(.white)

            // Your rights
            VStack(alignment: .leading, spacing: 4) {
                Text("YOUR RIGHTS:")
                    .font(.system(size: 10, weight: .bold))
                    .foregroundColor(KnowYourRightsCourse.color)

                ForEach(scenario.yourRights, id: \.self) { right in
                    HStack(alignment: .top, spacing: 6) {
                        Text("✓")
                            .foregroundColor(KnowYourRightsCourse.color)
                        Text(right)
                            .foregroundColor(Palette.text.secondary)
                    }
                    .font(.system(size: 13, weight: .medium))
                }
            }

            // What to say
            VStack(alignment: .leading, spacing: 4) {
                Text("SAY THIS:")
                    .font(.system(size: 10, weight: .bold))
                    .foregroundColor(Palette.accent.gold)

                Text("\"\(scenario.whatToSay)\"")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(Palette.accent.gold)
                    .italic()
            }
            .padding(10)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(Palette.accent.gold.opacity(0.1))
            )

            // What NOT to do
            VStack(alignment: .leading, spacing: 4) {
                Text("DO NOT:")
                    .font(.system(size: 10, weight: .bold))
                    .foregroundColor(.red)

                ForEach(scenario.whatNOTtoDo, id: \.self) { dont in
                    HStack(alignment: .top, spacing: 6) {
                        Text("✗")
                            .foregroundColor(.red)
                        Text(dont)
                            .foregroundColor(Palette.text.secondary)
                    }
                    .font(.system(size: 13, weight: .medium))
                }
            }

        }
        .padding(14)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white.opacity(0.05))
        )

    }

    private var scriptsSection: some View {

        VStack(alignment: .leading, spacing: 12) {

            Text("SCRIPTS TO MEMORIZE")
                .font(.system(size: 10, weight: .bold))
                .foregroundColor(Palette.accent.gold)
                .tracking(1)

            ForEach(lesson.scripts, id: \.self) { script in
                HStack {
                    Text("\"\(script)\"")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(Palette.accent.gold)
                        .italic()

                    Spacer()

                    Button(action: {
                        UIPasteboard.general.string = script
                        let generator = UIImpactFeedbackGenerator(style: .light)
                        generator.impactOccurred()
                    }) {
                        Image(systemName: "doc.on.doc")
                            .font(.system(size: 14))
                            .foregroundColor(Palette.text.muted)
                    }
                }
                .padding(10)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Palette.accent.gold.opacity(0.1))
                )
            }

        }

    }

    private var warningsSection: some View {

        VStack(alignment: .leading, spacing: 8) {

            Text("⚠️ WARNINGS")
                .font(.system(size: 10, weight: .bold))
                .foregroundColor(.orange)
                .tracking(1)

            ForEach(lesson.warnings, id: \.self) { warning in
                HStack(alignment: .top, spacing: 8) {
                    Text("•")
                        .foregroundColor(.orange)
                    Text(warning)
                        .foregroundColor(.orange)
                }
                .font(.system(size: 13, weight: .medium))
            }

        }
        .padding(14)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.orange.opacity(0.1))
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
                    .fill(isCompleted ? KnowYourRightsCourse.color : Color.white.opacity(0.1))
            )
        }

    }

}

// MARK: - Preview

#Preview {
    KnowYourRightsView()
}
