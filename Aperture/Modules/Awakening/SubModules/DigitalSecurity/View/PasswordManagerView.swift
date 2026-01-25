// PasswordManagerView.swift
// Password Manager Deep Dive UI

import SwiftUI

struct PasswordManagerView: View {

    @Environment(\.dismiss) private var dismiss
    @State private var selectedLesson: PasswordLesson?
    @State private var completedLessons: Set<String> = []

    var body: some View {

        NavigationStack {

            ZStack {

                passwordBackground

                ScrollView(showsIndicators: false) {

                    VStack(spacing: 24) {

                        headerSection

                        overviewSection

                        lessonsSection

                        toolsSection

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
            .sheet(item: $selectedLesson) { lesson in
                PasswordLessonView(lesson: lesson, completedLessons: $completedLessons)
            }

        }

    }

    // MARK: - Header

    private var headerSection: some View {

        VStack(spacing: 16) {

            ZStack {
                Circle()
                    .fill(PasswordManagerModule.color.opacity(0.2))
                    .frame(width: 80, height: 80)

                Image(systemName: PasswordManagerModule.icon)
                    .font(.system(size: 36))
                    .foregroundColor(PasswordManagerModule.color)
            }

            Text(PasswordManagerModule.title)
                .font(.system(size: 24, weight: .black, design: .rounded))
                .foregroundColor(.white)

            Text(PasswordManagerModule.subtitle)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(Palette.text.secondary)

        }

    }

    // MARK: - Overview

    private var overviewSection: some View {

        VStack(alignment: .leading, spacing: 12) {

            Text("WHY THIS MATTERS")
                .font(.system(size: 10, weight: .bold))
                .foregroundColor(Palette.text.muted)
                .tracking(1)

            Text(PasswordManagerModule.overview)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(Palette.text.secondary)
                .lineSpacing(4)

        }
        .padding(14)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white.opacity(0.05))
        )

    }

    // MARK: - Lessons

    private var lessonsSection: some View {

        VStack(alignment: .leading, spacing: 16) {

            Text("LESSONS")
                .font(.system(size: 10, weight: .bold))
                .foregroundColor(Palette.text.muted)
                .tracking(1)

            ForEach(Array(PasswordManagerModule.lessons.enumerated()), id: \.element.id) { index, lesson in
                lessonCard(lesson, index: index + 1)
            }

        }

    }

    private func lessonCard(_ lesson: PasswordLesson, index: Int) -> some View {

        let isCompleted = completedLessons.contains(lesson.id.uuidString)

        return Button(action: { selectedLesson = lesson }) {

            HStack(spacing: 14) {

                ZStack {
                    Circle()
                        .fill(isCompleted ? PasswordManagerModule.color : Color.white.opacity(0.1))
                        .frame(width: 40, height: 40)

                    if isCompleted {
                        Image(systemName: "checkmark")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.black)
                    } else {
                        Text("\(index)")
                            .font(.system(size: 16, weight: .bold, design: .rounded))
                            .foregroundColor(PasswordManagerModule.color)
                    }
                }

                Text(lesson.title)
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)

                Spacer()

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
                            .stroke(isCompleted ? PasswordManagerModule.color.opacity(0.3) : Color.clear, lineWidth: 1)
                    )
            )

        }

    }

    // MARK: - Tools Section

    private var toolsSection: some View {

        VStack(alignment: .leading, spacing: 12) {

            Text("RECOMMENDED TOOLS")
                .font(.system(size: 10, weight: .bold))
                .foregroundColor(Palette.text.muted)
                .tracking(1)

            HStack(spacing: 12) {

                toolCard(
                    name: "Bitwarden",
                    type: "Best Free",
                    color: .blue
                )

                toolCard(
                    name: "1Password",
                    type: "Best Overall",
                    color: .indigo
                )

            }

            HStack(spacing: 12) {

                toolCard(
                    name: "Proton Pass",
                    type: "Privacy Focus",
                    color: .purple
                )

                toolCard(
                    name: "HaveIBeenPwned",
                    type: "Check Breaches",
                    color: .orange
                )

            }

        }

    }

    private func toolCard(name: String, type: String, color: Color) -> some View {

        VStack(alignment: .leading, spacing: 4) {

            Text(name)
                .font(.system(size: 14, weight: .bold))
                .foregroundColor(.white)

            Text(type)
                .font(.system(size: 11, weight: .medium))
                .foregroundColor(color)

        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(12)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(color.opacity(0.15))
        )

    }

    // MARK: - Background

    private var passwordBackground: some View {

        LinearGradient(
            colors: [
                Color(hex: "#1a0f0a"),
                Color(hex: "#201510"),
                Color(hex: "#1a0f0a")
            ],
            startPoint: .top,
            endPoint: .bottom
        )
        .ignoresSafeArea()

    }

}

// MARK: - Lesson View

struct PasswordLessonView: View {

    let lesson: PasswordLesson
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

                        // Steps
                        if !lesson.steps.isEmpty {
                            stepsSection
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

    private var stepsSection: some View {

        VStack(alignment: .leading, spacing: 12) {

            Text("STEP BY STEP")
                .font(.system(size: 10, weight: .bold))
                .foregroundColor(PasswordManagerModule.color)
                .tracking(1)

            ForEach(lesson.steps) { step in
                stepCard(step)
            }

        }

    }

    private func stepCard(_ step: PasswordStep) -> some View {

        HStack(alignment: .top, spacing: 12) {

            ZStack {
                Circle()
                    .fill(PasswordManagerModule.color)
                    .frame(width: 28, height: 28)

                Text("\(step.number)")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(.black)
            }

            VStack(alignment: .leading, spacing: 4) {

                Text(step.title)
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(.white)

                Text(step.description)
                    .font(.system(size: 13, weight: .medium))
                    .foregroundColor(Palette.text.secondary)

                if let tip = step.tip {
                    HStack(alignment: .top, spacing: 4) {
                        Image(systemName: "lightbulb.fill")
                            .font(.system(size: 10))
                            .foregroundColor(Palette.accent.gold)

                        Text(tip)
                            .font(.system(size: 11, weight: .medium))
                            .foregroundColor(Palette.accent.gold)
                    }
                    .padding(.top, 4)
                }

            }

        }
        .padding(12)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white.opacity(0.05))
        )

    }

    private var warningsSection: some View {

        VStack(alignment: .leading, spacing: 8) {

            Text("⚠️ IMPORTANT")
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
                    .fill(isCompleted ? PasswordManagerModule.color : Color.white.opacity(0.1))
            )
        }

    }

}

// MARK: - Preview

#Preview {
    PasswordManagerView()
}
