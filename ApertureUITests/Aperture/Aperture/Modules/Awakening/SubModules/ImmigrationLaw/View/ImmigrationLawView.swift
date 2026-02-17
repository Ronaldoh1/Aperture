// ImmigrationLawView.swift
// Immigration Law Basics Course UI

import SwiftUI

struct ImmigrationLawView: View {
  @Environment(\.dismiss) private var dismiss
  @State private var selectedModule: ImmigrationModule?
  @State private var completedLessons: Set<String> = []

  var body: some View {
    NavigationStack {
      ZStack {
        immigrationBackground

        ScrollView(showsIndicators: false) {
          VStack(spacing: 24) {
            headerSection

            disclaimerBanner

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
        ImmigrationModuleDetailView(module: module, completedLessons: $completedLessons)
      }
    }
  }

  // MARK: - Header

  private var headerSection: some View {
    VStack(spacing: 16) {
      ZStack {
        Circle()
          .fill(ImmigrationLawCourse.color.opacity(0.2))
          .frame(width: 80, height: 80)

        Image(systemName: ImmigrationLawCourse.icon)
          .font(.system(size: 36))
          .foregroundColor(ImmigrationLawCourse.color)
      }

      Text(ImmigrationLawCourse.title)
        .font(.system(size: 24, weight: .black, design: .rounded))
        .foregroundColor(.white)

      Text(ImmigrationLawCourse.subtitle)
        .font(.system(size: 14, weight: .medium))
        .foregroundColor(Palette.text.secondary)
    }
  }

  // MARK: - Disclaimer

  private var disclaimerBanner: some View {
    HStack(alignment: .top, spacing: 10) {
      Image(systemName: "exclamationmark.triangle.fill")
        .foregroundColor(.orange)

      Text(
        "This is educational information, NOT legal advice. Immigration law changes frequently. Always consult a qualified immigration attorney for your specific situation."
      )
      .font(.system(size: 11, weight: .medium))
      .foregroundColor(.orange)
    }
    .padding(12)
    .background(
      RoundedRectangle(cornerRadius: 10)
        .fill(Color.orange.opacity(0.1))
    )
  }

  // MARK: - Progress

  private var progressSection: some View {
    let totalLessons = ImmigrationLawCourse.modules.reduce(0) { $0 + $1.lessons.count }
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
            .fill(ImmigrationLawCourse.color)
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

      ForEach(ImmigrationLawCourse.modules) { module in
        moduleCard(module)
      }
    }
  }

  private func moduleCard(_ module: ImmigrationModule) -> some View {
    let completedInModule = module.lessons.filter { completedLessons.contains($0.id.uuidString) }
      .count
    let isCompleted = completedInModule == module.lessons.count

    return Button(action: { selectedModule = module }) {
      HStack(spacing: 14) {
        ZStack {
          Circle()
            .fill(isCompleted ? ImmigrationLawCourse.color : Color.white.opacity(0.1))
            .frame(width: 44, height: 44)

          if isCompleted {
            Image(systemName: "checkmark")
              .font(.system(size: 18, weight: .bold))
              .foregroundColor(.black)
          } else {
            Image(systemName: module.icon)
              .font(.system(size: 18))
              .foregroundColor(ImmigrationLawCourse.color)
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
          .foregroundColor(ImmigrationLawCourse.color)

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
              .stroke(
                isCompleted ? ImmigrationLawCourse.color.opacity(0.3) : Color.clear, lineWidth: 1)
          )
      )
    }
  }

  // MARK: - Background

  private var immigrationBackground: some View {
    LinearGradient(
      colors: [
        Color(hex: "#1a0a1a"),
        Color(hex: "#200d20"),
        Color(hex: "#1a0a1a"),
      ],
      startPoint: .top,
      endPoint: .bottom
    )
    .ignoresSafeArea()
  }
}

// MARK: - Module Detail View

struct ImmigrationModuleDetailView: View {
  let module: ImmigrationModule
  @Binding var completedLessons: Set<String>
  @Environment(\.dismiss) private var dismiss
  @State private var selectedLesson: ImmigrationLesson?

  var body: some View {
    NavigationStack {
      ZStack {
        Color.black.ignoresSafeArea()

        ScrollView(showsIndicators: false) {
          VStack(spacing: 24) {
            moduleHeader

            lessonsSection

            keyFactsSection

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
        ImmigrationLessonView(lesson: lesson, completedLessons: $completedLessons)
      }
    }
  }

  private var moduleHeader: some View {
    VStack(spacing: 12) {
      Image(systemName: module.icon)
        .font(.system(size: 44))
        .foregroundColor(ImmigrationLawCourse.color)

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

  private func lessonRow(_ lesson: ImmigrationLesson, index: Int) -> some View {
    let isCompleted = completedLessons.contains(lesson.id.uuidString)

    return Button(action: { selectedLesson = lesson }) {
      HStack(spacing: 12) {
        ZStack {
          Circle()
            .fill(isCompleted ? ImmigrationLawCourse.color : Color.white.opacity(0.1))
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

  private var keyFactsSection: some View {
    VStack(alignment: .leading, spacing: 12) {
      Text("KEY FACTS")
        .font(.system(size: 10, weight: .bold))
        .foregroundColor(Palette.text.muted)
        .tracking(1)

      ForEach(module.keyFacts, id: \.self) { fact in
        HStack(alignment: .top, spacing: 10) {
          Image(systemName: "info.circle.fill")
            .font(.system(size: 14))
            .foregroundColor(ImmigrationLawCourse.color)

          Text(fact)
            .font(.system(size: 13, weight: .medium))
            .foregroundColor(Palette.text.secondary)
        }
      }
    }
    .padding(14)
    .background(
      RoundedRectangle(cornerRadius: 12)
        .fill(ImmigrationLawCourse.color.opacity(0.1))
    )
  }
}

// MARK: - Lesson View

struct ImmigrationLessonView: View {
  let lesson: ImmigrationLesson
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

            // Important notes
            if !lesson.importantNotes.isEmpty {
              importantNotesSection
            }

            // Common mistakes
            if !lesson.commonMistakes.isEmpty {
              commonMistakesSection
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

  private var importantNotesSection: some View {
    VStack(alignment: .leading, spacing: 12) {
      Text("⚠️ IMPORTANT")
        .font(.system(size: 10, weight: .bold))
        .foregroundColor(.orange)
        .tracking(1)

      ForEach(lesson.importantNotes, id: \.self) { note in
        HStack(alignment: .top, spacing: 8) {
          Text("•")
            .foregroundColor(.orange)
          Text(note)
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

  private var commonMistakesSection: some View {
    VStack(alignment: .leading, spacing: 12) {
      Text("❌ COMMON MISTAKES TO AVOID")
        .font(.system(size: 10, weight: .bold))
        .foregroundColor(.red)
        .tracking(1)

      ForEach(lesson.commonMistakes, id: \.self) { mistake in
        HStack(alignment: .top, spacing: 8) {
          Text("✗")
            .foregroundColor(.red)
          Text(mistake)
            .foregroundColor(Palette.text.secondary)
        }
        .font(.system(size: 13, weight: .medium))
      }
    }
    .padding(14)
    .background(
      RoundedRectangle(cornerRadius: 12)
        .fill(Color.red.opacity(0.1))
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
          .fill(isCompleted ? ImmigrationLawCourse.color : Color.white.opacity(0.1))
      )
    }
  }
}

// MARK: - Preview

#Preview {
  ImmigrationLawView()
}
