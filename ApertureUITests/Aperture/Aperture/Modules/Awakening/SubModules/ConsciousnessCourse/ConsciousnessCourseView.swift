// ConsciousnessCourseView.swift
// PhD-LEVEL CONSCIOUSNESS EDUCATION - Main Hub

import SwiftUI

struct ConsciousnessCourseView: View {
  @State private var progress: CourseProgress = .default
  @State private var selectedModule: ConsciousnessModule?
  @Environment(\.dismiss) var dismiss

  private let db = ConsciousnessCourseDatabase.shared

  var body: some View {
    ZStack {
      Color.black.ignoresSafeArea()

      VStack(spacing: 0) {
        // Header
        courseHeader

        ScrollView {
          VStack(spacing: 24) {
            heroSection
            statsSection
            modulesList
            footerSection
            Spacer(minLength: 40)
          }
          .padding(.horizontal, 20)
        }
      }
    }
    .sheet(item: $selectedModule) { module in
      ModuleDetailView(module: module, progress: $progress)
    }
    .onAppear { loadProgress() }
  }

  // MARK: - Header

  private var courseHeader: some View {
    HStack {
      VStack(alignment: .leading, spacing: 4) {
        Text("Consciousness").font(.system(size: 20, weight: .bold, design: .rounded))
          .foregroundColor(Palette.text.primary)
        Text("PhD-Level Course").font(.system(size: 13, weight: .medium, design: .rounded))
          .foregroundColor(Palette.primary.cyan)
      }
      Spacer()
      Button(action: { dismiss() }) {
        Image(systemName: "xmark.circle.fill").font(.system(size: 28)).foregroundColor(
          Palette.text.secondary)
      }
    }
    .padding(.horizontal, 20).padding(.top, 20).padding(.bottom, 16)
  }

  // MARK: - Hero Section

  private var heroSection: some View {
    VStack(spacing: 16) {
      ZStack {
        Circle()
          .fill(
            RadialGradient(
              colors: [Palette.primary.cyan.opacity(0.4), Color.clear], center: .center,
              startRadius: 0, endRadius: 60)
          )
          .frame(width: 120, height: 120)

        Image(systemName: "brain.head.profile")
          .font(.system(size: 50, weight: .semibold))
          .foregroundStyle(
            LinearGradient(
              colors: [Palette.primary.cyan, Palette.primary.violet], startPoint: .topLeading,
              endPoint: .bottomTrailing)
          )
      }

      Text("The Science & Philosophy\nof Consciousness")
        .font(.system(size: 22, weight: .bold, design: .rounded))
        .foregroundColor(Palette.text.primary)
        .multilineTextAlignment(.center)

      Text("\"The most important subject never taught in school\"")
        .font(.system(size: 14, weight: .medium, design: .rounded))
        .italic()
        .foregroundColor(Palette.text.secondary)
    }
    .padding(.vertical, 8)
  }

  // MARK: - Stats Section

  private var statsSection: some View {
    VStack(spacing: 16) {
      // Progress bar
      VStack(spacing: 8) {
        HStack {
          Text("Course Progress")
            .font(.system(size: 13, weight: .bold, design: .rounded))
            .foregroundColor(Palette.text.secondary)
          Spacer()
          Text("\(progress.completedLessons.count)/\(db.totalLessons) lessons")
            .font(.system(size: 13, weight: .bold, design: .rounded))
            .foregroundColor(Palette.primary.cyan)
        }

        GeometryReader { geo in
          ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 5).fill(Color.white.opacity(0.1)).frame(height: 10)
            RoundedRectangle(cornerRadius: 5)
              .fill(
                LinearGradient(
                  colors: [Palette.primary.cyan, Palette.primary.violet], startPoint: .leading,
                  endPoint: .trailing)
              )
              .frame(width: geo.size.width * progressPercentage, height: 10)
          }
        }
        .frame(height: 10)
      }

      // Stats row
      HStack(spacing: 12) {
        statCard(
          value: "\(db.modules.count)", label: "Modules", icon: "folder.fill",
          color: Palette.primary.violet)
        statCard(
          value: "\(db.totalLessons)", label: "Lessons", icon: "doc.text.fill",
          color: Palette.primary.cyan)
        statCard(
          value: "\(db.totalMinutes / 60)h+", label: "Content", icon: "clock.fill",
          color: Palette.accent.gold)
      }
    }
    .padding(16)
    .background(
      RoundedRectangle(cornerRadius: 16, style: .continuous)
        .fill(Color.white.opacity(0.05))
        .overlay(
          RoundedRectangle(cornerRadius: 16, style: .continuous).stroke(
            Palette.primary.cyan.opacity(0.2), lineWidth: 1))
    )
  }

  private func statCard(value: String, label: String, icon: String, color: Color) -> some View {
    VStack(spacing: 6) {
      Image(systemName: icon).font(.system(size: 16)).foregroundColor(color)
      Text(value).font(.system(size: 18, weight: .bold, design: .rounded)).foregroundColor(
        Palette.text.primary)
      Text(label).font(.system(size: 10, weight: .medium, design: .rounded)).foregroundColor(
        Palette.text.muted)
    }
    .frame(maxWidth: .infinity)
    .padding(.vertical, 12)
    .background(RoundedRectangle(cornerRadius: 12, style: .continuous).fill(color.opacity(0.1)))
  }

  private var progressPercentage: Double {
    guard db.totalLessons > 0 else { return 0 }
    return Double(progress.completedLessons.count) / Double(db.totalLessons)
  }

  // MARK: - Modules List

  private var modulesList: some View {
    VStack(alignment: .leading, spacing: 16) {
      Text("CURRICULUM")
        .font(.system(size: 12, weight: .bold, design: .rounded))
        .tracking(1)
        .foregroundColor(Palette.text.secondary)

      ForEach(db.modules) { module in
        ConsciousnessModuleCard(module: module, progress: progress)
          .onTapGesture {
            HapticManager.shared.cardFlip()
            selectedModule = module
          }
      }
    }
  }

  // MARK: - Footer

  private var footerSection: some View {
    VStack(spacing: 12) {
      HStack(spacing: 8) {
        Text("🐉").font(.system(size: 18))
        Text("DRAGON'S WISDOM").font(.system(size: 12, weight: .bold, design: .rounded)).tracking(1)
          .foregroundColor(Palette.accent.gold)
      }

      Text(
        "\"This course won't give you answers—it will show you that you ARE the answer. The one who questions consciousness is consciousness questioning itself.\""
      )
      .font(.system(size: 13, weight: .medium, design: .rounded))
      .italic()
      .foregroundColor(Palette.accent.gold.opacity(0.9))
      .multilineTextAlignment(.center)
      .lineSpacing(4)
    }
    .padding(16)
    .background(
      RoundedRectangle(cornerRadius: 14, style: .continuous)
        .fill(Palette.accent.gold.opacity(0.1))
        .overlay(
          RoundedRectangle(cornerRadius: 14, style: .continuous).stroke(
            Palette.accent.gold.opacity(0.3), lineWidth: 1))
    )
  }

  // MARK: - Data

  private func loadProgress() {
    if let data = UserDefaults.standard.data(forKey: "consciousness_course_progress"),
      let saved = try? JSONDecoder().decode(CourseProgress.self, from: data)
    {
      progress = saved
    }
  }
}

// MARK: - Module Card

struct ConsciousnessModuleCard: View {
  let module: ConsciousnessModule
  let progress: CourseProgress

  private var completedLessons: Int {
    module.lessons.filter { progress.completedLessons.contains($0.id) }.count
  }

  private var isComplete: Bool {
    completedLessons == module.lessons.count
  }

  var body: some View {
    HStack(spacing: 14) {
      // Module icon
      ZStack {
        RoundedRectangle(cornerRadius: 12, style: .continuous)
          .fill(module.color.opacity(isComplete ? 1.0 : 0.25))
          .frame(width: 52, height: 52)

        if isComplete {
          Image(systemName: "checkmark")
            .font(.system(size: 22, weight: .bold))
            .foregroundColor(.white)
        } else {
          Image(systemName: module.icon)
            .font(.system(size: 22, weight: .semibold))
            .foregroundColor(.white)
        }
      }

      // Info
      VStack(alignment: .leading, spacing: 4) {
        HStack(spacing: 6) {
          Text("Module \(module.number)")
            .font(.system(size: 11, weight: .bold, design: .rounded))
            .foregroundColor(module.color)

          Text("•")
            .foregroundColor(Palette.text.muted)

          Text(module.difficulty.rawValue)
            .font(.system(size: 10, weight: .semibold, design: .rounded))
            .foregroundColor(module.difficulty.color)
        }

        Text(module.title)
          .font(.system(size: 15, weight: .bold, design: .rounded))
          .foregroundColor(Palette.text.primary)

        Text(module.subtitle)
          .font(.system(size: 12, weight: .medium, design: .rounded))
          .foregroundColor(Palette.text.secondary)
          .lineLimit(1)
      }

      Spacer()

      // Progress
      VStack(alignment: .trailing, spacing: 4) {
        Text("\(completedLessons)/\(module.lessons.count)")
          .font(.system(size: 12, weight: .bold, design: .rounded))
          .foregroundColor(isComplete ? Color.green : Palette.text.muted)

        Text("\(module.estimatedMinutes) min")
          .font(.system(size: 10, weight: .medium, design: .rounded))
          .foregroundColor(Palette.text.muted)

        Image(systemName: "chevron.right")
          .font(.system(size: 11, weight: .semibold))
          .foregroundColor(Palette.text.muted)
      }
    }
    .padding(14)
    .background(
      RoundedRectangle(cornerRadius: 16, style: .continuous)
        .fill(Color.white.opacity(0.05))
        .overlay(
          RoundedRectangle(cornerRadius: 16, style: .continuous)
            .stroke(isComplete ? module.color.opacity(0.5) : Color.white.opacity(0.1), lineWidth: 1)
        )
    )
  }
}

// MARK: - Module Detail View

struct ModuleDetailView: View {
  let module: ConsciousnessModule
  @Binding var progress: CourseProgress
  @Environment(\.dismiss) var dismiss

  @State private var selectedLesson: ConsciousnessModule.Lesson?

  var body: some View {
    ZStack {
      LinearGradient(
        colors: [Color.black, module.color.opacity(0.1), Color.black], startPoint: .top,
        endPoint: .bottom
      )
      .ignoresSafeArea()

      VStack(spacing: 0) {
        // Header
        HStack {
          Button(action: { dismiss() }) {
            HStack(spacing: 6) {
              Image(systemName: "chevron.left").font(.system(size: 14, weight: .semibold))
              Text("Course").font(.system(size: 15, weight: .medium))
            }
            .foregroundColor(module.color)
          }
          Spacer()
          Text("Module \(module.number)").font(.system(size: 14, weight: .bold, design: .rounded))
            .foregroundColor(Palette.text.muted)
          Spacer()
          Circle().fill(Color.clear).frame(width: 24, height: 24)
        }
        .padding(.horizontal, 20).padding(.top, 16).padding(.bottom, 12)

        ScrollView {
          VStack(alignment: .leading, spacing: 24) {
            moduleHeader
            overviewSection
            lessonsSection
            Spacer(minLength: 40)
          }
          .padding(.horizontal, 20)
        }
      }
    }
    .sheet(item: $selectedLesson) { lesson in
      LessonView(lesson: lesson, module: module, progress: $progress)
    }
  }

  private var moduleHeader: some View {
    VStack(spacing: 12) {
      ZStack {
        Circle()
          .fill(
            RadialGradient(
              colors: [module.color.opacity(0.4), module.color.opacity(0.05)], center: .center,
              startRadius: 0, endRadius: 45)
          )
          .frame(width: 90, height: 90)
        Image(systemName: module.icon)
          .font(.system(size: 40, weight: .semibold))
          .foregroundColor(module.color)
      }

      Text(module.title)
        .font(.system(size: 24, weight: .bold, design: .rounded))
        .foregroundColor(Palette.text.primary)

      Text(module.subtitle)
        .font(.system(size: 15, weight: .medium, design: .rounded))
        .foregroundColor(module.color)

      HStack(spacing: 16) {
        HStack(spacing: 4) {
          Image(systemName: "clock").font(.system(size: 12))
          Text("\(module.estimatedMinutes) min").font(
            .system(size: 12, weight: .semibold, design: .rounded))
        }
        .foregroundColor(Palette.text.muted)

        HStack(spacing: 4) {
          Image(systemName: "doc.text").font(.system(size: 12))
          Text("\(module.lessons.count) lessons").font(
            .system(size: 12, weight: .semibold, design: .rounded))
        }
        .foregroundColor(Palette.text.muted)

        HStack(spacing: 4) {
          Circle().fill(module.difficulty.color).frame(width: 8, height: 8)
          Text(module.difficulty.rawValue).font(
            .system(size: 12, weight: .semibold, design: .rounded))
        }
        .foregroundColor(module.difficulty.color)
      }
    }
    .frame(maxWidth: .infinity)
  }

  private var overviewSection: some View {
    VStack(alignment: .leading, spacing: 10) {
      Text("OVERVIEW").font(.system(size: 11, weight: .bold, design: .rounded)).tracking(1)
        .foregroundColor(Palette.text.secondary)
      Text(module.overview)
        .font(.system(size: 14, weight: .medium, design: .rounded))
        .foregroundColor(Palette.text.primary)
        .lineSpacing(5)
    }
    .padding(16)
    .background(
      RoundedRectangle(cornerRadius: 14, style: .continuous)
        .fill(Color.white.opacity(0.05))
    )
  }

  private var lessonsSection: some View {
    VStack(alignment: .leading, spacing: 14) {
      Text("LESSONS").font(.system(size: 11, weight: .bold, design: .rounded)).tracking(1)
        .foregroundColor(Palette.text.secondary)

      ForEach(module.lessons) { lesson in
        LessonCard(
          lesson: lesson, module: module, isComplete: progress.completedLessons.contains(lesson.id)
        )
        .onTapGesture {
          HapticManager.shared.light()
          selectedLesson = lesson
        }
      }
    }
  }
}

// MARK: - Lesson Card

struct LessonCard: View {
  let lesson: ConsciousnessModule.Lesson
  let module: ConsciousnessModule
  let isComplete: Bool

  var body: some View {
    HStack(spacing: 14) {
      // Lesson number
      ZStack {
        Circle()
          .fill(isComplete ? Color.green : module.color.opacity(0.25))
          .frame(width: 40, height: 40)

        if isComplete {
          Image(systemName: "checkmark").font(.system(size: 16, weight: .bold)).foregroundColor(
            .white)
        } else {
          Text("\(lesson.number)").font(.system(size: 16, weight: .bold, design: .rounded))
            .foregroundColor(.white)
        }
      }

      VStack(alignment: .leading, spacing: 4) {
        Text(lesson.title)
          .font(.system(size: 15, weight: .bold, design: .rounded))
          .foregroundColor(Palette.text.primary)

        HStack(spacing: 8) {
          HStack(spacing: 4) {
            Image(systemName: "clock").font(.system(size: 10))
            Text("\(lesson.duration) min").font(
              .system(size: 11, weight: .medium, design: .rounded))
          }
          .foregroundColor(Palette.text.muted)

          if !lesson.reflectionPrompts.isEmpty {
            HStack(spacing: 4) {
              Image(systemName: "questionmark.circle").font(.system(size: 10))
              Text("\(lesson.reflectionPrompts.count) prompts").font(
                .system(size: 11, weight: .medium, design: .rounded))
            }
            .foregroundColor(Palette.text.muted)
          }
        }
      }

      Spacer()

      Image(systemName: isComplete ? "checkmark.circle.fill" : "play.circle.fill")
        .font(.system(size: 24))
        .foregroundColor(isComplete ? Color.green : module.color)
    }
    .padding(12)
    .background(
      RoundedRectangle(cornerRadius: 12, style: .continuous)
        .fill(Color.white.opacity(0.05))
        .overlay(
          RoundedRectangle(cornerRadius: 12, style: .continuous)
            .stroke(isComplete ? Color.green.opacity(0.3) : Color.white.opacity(0.1), lineWidth: 1)
        )
    )
  }
}
