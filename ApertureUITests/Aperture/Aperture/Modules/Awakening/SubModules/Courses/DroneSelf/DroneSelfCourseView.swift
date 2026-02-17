// DroneSelfCourseView.swift
// THE DRONE SELF: Quantum Fields & Embodied Consciousness
// Full Interactive Course View

import SwiftUI

struct DroneSelfCourseView: View {
  let course = DroneSelfCourse.shared
  @State private var selectedModule: DroneModule?
  @State private var selectedLesson: DroneLesson?
  @State private var completedLessons: Set<String> = []
  @State private var expandedModules: Set<String> = []
  @State private var showingExercise: DroneExercise?
  @State private var pilotRatio: Double = 0
  @Environment(\.dismiss) private var dismiss

  private let accentColor = Color(hex: "#00E5FF")
  private let fieldGold = Color(hex: "#FFD700")

  var body: some View {
    ZStack {
      // Quantum field background
      quantumFieldBackground

      ScrollView(showsIndicators: false) {
        VStack(spacing: 24) {
          courseHeader

          pilotStatusCard

          progressSection

          modulesSection

          scientificResourcesSection

          Spacer(minLength: 100)
        }
        .padding(.horizontal, 20)
        .padding(.top, 60)
      }

      // Custom nav bar
      VStack {
        customNavBar
        Spacer()
      }
    }
    .navigationBarHidden(true)
    .sheet(item: $selectedLesson) { lesson in
      DroneLessonDetailView(
        lesson: lesson,
        accentColor: accentColor,
        onComplete: {
          completedLessons.insert(lesson.id)
          saveProgress()
          HapticManager.shared.lessonCompleted()
        }
      )
    }
    .sheet(
      item: Binding(
        get: { showingExercise.map { IdentifiableExercise(exercise: $0) } },
        set: { showingExercise = $0?.exercise }
      )
    ) { item in
      DroneExerciseView(exercise: item.exercise, accentColor: accentColor)
    }
    .onAppear {
      loadProgress()
    }
  }

  // MARK: - Quantum Field Background

  private var quantumFieldBackground: some View {
    ZStack {
      LinearGradient(
        colors: [
          Color(hex: "#040810"),
          Color(hex: "#061018"),
          Color(hex: "#040810"),
        ],
        startPoint: .top,
        endPoint: .bottom
      )
      .ignoresSafeArea()

      // Quantum particles
      GeometryReader { geo in
        ForEach(0..<60, id: \.self) { _ in
          Circle()
            .fill(
              [accentColor, fieldGold, Color.white].randomElement()!
                .opacity(Double.random(in: 0.1...0.35))
            )
            .frame(width: CGFloat.random(in: 1...2.5))
            .position(
              x: CGFloat.random(in: 0...geo.size.width),
              y: CGFloat.random(in: 0...geo.size.height * 3)
            )
            .blur(radius: Double.random(in: 0.3...1))
        }

        // Field wave lines
        ForEach(0..<3, id: \.self) { i in
          WaveFieldLine()
            .stroke(
              accentColor.opacity(0.08 + Double(i) * 0.03),
              lineWidth: 1
            )
            .frame(height: 200)
            .offset(y: CGFloat(i) * 300 + 100)
        }
      }
    }
  }

  // MARK: - Custom Nav Bar

  private var customNavBar: some View {
    HStack {
      Button(action: { dismiss() }) {
        Image(systemName: "chevron.left")
          .font(.system(size: 18, weight: .semibold))
          .foregroundColor(.white)
          .frame(width: 44, height: 44)
          .background(Color.white.opacity(0.1))
          .clipShape(Circle())
      }

      Spacer()

      // Field signal indicator
      HStack(spacing: 4) {
        Image(systemName: "antenna.radiowaves.left.and.right")
          .font(.system(size: 12))
        Text("\(completedLessons.count)/\(totalLessons)")
      }
      .font(.system(size: 14, weight: .bold, design: .rounded))
      .foregroundColor(accentColor)
      .padding(.horizontal, 12)
      .padding(.vertical, 6)
      .background(accentColor.opacity(0.15))
      .clipShape(Capsule())
    }
    .padding(.horizontal, 20)
    .padding(.top, 10)
  }

  // MARK: - Course Header

  private var courseHeader: some View {
    VStack(spacing: 16) {
      // Quantum field icon
      ZStack {
        // Outer field rings
        ForEach(0..<3, id: \.self) { i in
          Circle()
            .stroke(
              accentColor.opacity(0.15 - Double(i) * 0.04),
              lineWidth: 1
            )
            .frame(
              width: 120 + CGFloat(i) * 30,
              height: 120 + CGFloat(i) * 30
            )
        }

        // Core
        Circle()
          .fill(
            RadialGradient(
              colors: [accentColor.opacity(0.5), accentColor.opacity(0.1), Color.clear],
              center: .center,
              startRadius: 10,
              endRadius: 60
            )
          )
          .frame(width: 120, height: 120)

        Image(systemName: "antenna.radiowaves.left.and.right")
          .font(.system(size: 44, weight: .semibold))
          .foregroundStyle(
            LinearGradient(
              colors: [accentColor, fieldGold],
              startPoint: .topLeading,
              endPoint: .bottomTrailing
            )
          )
      }

      Text("The Drone Self")
        .font(.system(size: 28, weight: .bold, design: .rounded))
        .foregroundStyle(
          LinearGradient(
            colors: [accentColor, fieldGold],
            startPoint: .leading,
            endPoint: .trailing
          )
        )

      Text("Quantum Fields & Embodied Consciousness")
        .font(.system(size: 15, weight: .medium, design: .rounded))
        .foregroundColor(accentColor.opacity(0.8))

      Text("Based on Federico Faggin's revolutionary theory")
        .font(.system(size: 12, weight: .medium))
        .foregroundColor(Palette.text.muted)

      // Stats row
      HStack(spacing: 16) {
        statBadge(value: "7", label: "Modules", icon: "folder.fill")
        statBadge(value: "17", label: "Lessons", icon: "doc.text.fill")
        statBadge(value: "~6h", label: "Duration", icon: "clock.fill")
      }
      .padding(.top, 4)
    }
  }

  private func statBadge(value: String, label: String, icon: String) -> some View {
    VStack(spacing: 4) {
      Image(systemName: icon)
        .font(.system(size: 14))
        .foregroundColor(accentColor)
      Text(value)
        .font(.system(size: 16, weight: .bold, design: .rounded))
        .foregroundColor(Palette.text.primary)
      Text(label)
        .font(.system(size: 10, weight: .medium))
        .foregroundColor(Palette.text.muted)
    }
    .frame(maxWidth: .infinity)
    .padding(.vertical, 10)
    .background(
      RoundedRectangle(cornerRadius: 12)
        .fill(Color.white.opacity(0.05))
    )
  }

  // MARK: - Pilot Status Card

  private var pilotStatusCard: some View {
    VStack(spacing: 12) {
      HStack {
        Image(systemName: "person.crop.circle.badge.checkmark")
          .font(.system(size: 16))
          .foregroundColor(fieldGold)
        Text("PILOT STATUS")
          .font(.system(size: 11, weight: .bold, design: .rounded))
          .foregroundColor(fieldGold)
          .tracking(1.5)
        Spacer()
      }

      HStack(spacing: 16) {
        VStack(alignment: .leading, spacing: 4) {
          Text(pilotLevel)
            .font(.system(size: 18, weight: .bold, design: .rounded))
            .foregroundColor(Palette.text.primary)
          Text(pilotDescription)
            .font(.system(size: 12, weight: .medium))
            .foregroundColor(Palette.text.secondary)
        }

        Spacer()

        // Signal strength meter
        HStack(spacing: 3) {
          ForEach(0..<5, id: \.self) { bar in
            RoundedRectangle(cornerRadius: 2)
              .fill(bar < signalBars ? accentColor : Color.white.opacity(0.1))
              .frame(width: 6, height: CGFloat(10 + bar * 5))
          }
        }
      }
    }
    .padding(16)
    .background(
      RoundedRectangle(cornerRadius: 16, style: .continuous)
        .fill(Color.white.opacity(0.05))
        .overlay(
          RoundedRectangle(cornerRadius: 16, style: .continuous)
            .stroke(fieldGold.opacity(0.2), lineWidth: 1)
        )
    )
  }

  private var pilotLevel: String {
    let count = completedLessons.count
    if count == 0 { return "Drone Operator" }
    if count < 5 { return "Awakening Pilot" }
    if count < 10 { return "Conscious Pilot" }
    if count < 15 { return "Field Navigator" }
    return "Interface Architect"
  }

  private var pilotDescription: String {
    let count = completedLessons.count
    if count == 0 { return "Begin your training" }
    if count < 5 { return "Discovering the controls" }
    if count < 10 { return "Taking over from autopilot" }
    if count < 15 { return "Reading the quantum field" }
    return "Designing reality from the field"
  }

  private var signalBars: Int {
    let count = completedLessons.count
    if count == 0 { return 0 }
    if count < 4 { return 1 }
    if count < 8 { return 2 }
    if count < 12 { return 3 }
    if count < 16 { return 4 }
    return 5
  }

  // MARK: - Progress Section

  private var progressSection: some View {
    VStack(spacing: 8) {
      HStack {
        Text("Course Progress")
          .font(.system(size: 14, weight: .bold, design: .rounded))
          .foregroundColor(Palette.text.primary)
        Spacer()
        Text("\(Int(progressPercent * 100))%")
          .font(.system(size: 14, weight: .bold, design: .monospaced))
          .foregroundColor(accentColor)
      }

      GeometryReader { geo in
        ZStack(alignment: .leading) {
          RoundedRectangle(cornerRadius: 4)
            .fill(Color.white.opacity(0.08))
            .frame(height: 8)

          RoundedRectangle(cornerRadius: 4)
            .fill(
              LinearGradient(
                colors: [accentColor, fieldGold],
                startPoint: .leading,
                endPoint: .trailing
              )
            )
            .frame(width: geo.size.width * progressPercent, height: 8)
        }
      }
      .frame(height: 8)
    }
  }

  private var progressPercent: CGFloat {
    guard totalLessons > 0 else { return 0 }
    return CGFloat(completedLessons.count) / CGFloat(totalLessons)
  }

  private var totalLessons: Int {
    course.modules.reduce(0) { $0 + $1.lessons.count }
  }

  // MARK: - Modules Section

  private var modulesSection: some View {
    VStack(spacing: 16) {
      ForEach(course.modules) { module in
        moduleCard(module)
      }
    }
  }

  private func moduleCard(_ module: DroneModule) -> some View {
    let isExpanded = expandedModules.contains(module.id)
    let moduleLessons = Set(module.lessons.map(\.id))
    let moduleCompleted = moduleLessons.isSubset(of: completedLessons)
    let moduleProgress =
      Double(moduleLessons.intersection(completedLessons).count) / Double(module.lessons.count)

    return VStack(spacing: 0) {
      // Module header
      Button {
        withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
          if isExpanded {
            expandedModules.remove(module.id)
          } else {
            expandedModules.insert(module.id)
          }
        }
        HapticManager.shared.tabChanged()
      } label: {
        HStack(spacing: 14) {
          // Module number circle
          ZStack {
            Circle()
              .fill(
                moduleCompleted
                  ? LinearGradient(
                    colors: [accentColor, fieldGold], startPoint: .topLeading,
                    endPoint: .bottomTrailing)
                  : LinearGradient(
                    colors: [accentColor.opacity(0.2), accentColor.opacity(0.1)],
                    startPoint: .topLeading, endPoint: .bottomTrailing)
              )
              .frame(width: 44, height: 44)

            if moduleCompleted {
              Image(systemName: "checkmark")
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.black)
            } else {
              Text("\(module.number)")
                .font(.system(size: 18, weight: .bold, design: .rounded))
                .foregroundColor(accentColor)
            }
          }

          VStack(alignment: .leading, spacing: 2) {
            Text(module.title)
              .font(.system(size: 15, weight: .bold, design: .rounded))
              .foregroundColor(Palette.text.primary)
            Text(module.subtitle)
              .font(.system(size: 12, weight: .medium))
              .foregroundColor(Palette.text.secondary)
          }

          Spacer()

          // Mini progress + chevron
          VStack(spacing: 4) {
            if moduleProgress > 0 && !moduleCompleted {
              Text("\(Int(moduleProgress * 100))%")
                .font(.system(size: 10, weight: .bold, design: .monospaced))
                .foregroundColor(accentColor)
            }
            Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
              .font(.system(size: 12, weight: .semibold))
              .foregroundColor(Palette.text.muted)
          }
        }
        .padding(16)
      }

      // Expanded lessons
      if isExpanded {
        VStack(spacing: 0) {
          Divider()
            .background(accentColor.opacity(0.2))

          ForEach(module.lessons) { lesson in
            lessonRow(lesson)
            if lesson.id != module.lessons.last?.id {
              Divider()
                .background(Color.white.opacity(0.05))
                .padding(.leading, 48)
            }
          }
        }
        .transition(.opacity.combined(with: .move(edge: .top)))
      }
    }
    .background(
      RoundedRectangle(cornerRadius: 16, style: .continuous)
        .fill(Color.white.opacity(0.04))
        .overlay(
          RoundedRectangle(cornerRadius: 16, style: .continuous)
            .stroke(
              moduleCompleted
                ? accentColor.opacity(0.3)
                : Color.white.opacity(0.08),
              lineWidth: 1
            )
        )
    )
  }

  private func lessonRow(_ lesson: DroneLesson) -> some View {
    let isCompleted = completedLessons.contains(lesson.id)

    return Button {
      selectedLesson = lesson
    } label: {
      HStack(spacing: 12) {
        // Completion indicator
        ZStack {
          Circle()
            .stroke(isCompleted ? accentColor : Color.white.opacity(0.2), lineWidth: 2)
            .frame(width: 24, height: 24)
          if isCompleted {
            Circle()
              .fill(accentColor)
              .frame(width: 16, height: 16)
            Image(systemName: "checkmark")
              .font(.system(size: 9, weight: .bold))
              .foregroundColor(.black)
          }
        }

        VStack(alignment: .leading, spacing: 2) {
          Text(lesson.title)
            .font(.system(size: 14, weight: .medium, design: .rounded))
            .foregroundColor(isCompleted ? Palette.text.secondary : Palette.text.primary)
            .lineLimit(2)

          if lesson.exercise != nil {
            HStack(spacing: 4) {
              Image(systemName: "figure.mind.and.body")
                .font(.system(size: 9))
              Text("Exercise included")
                .font(.system(size: 10, weight: .medium))
            }
            .foregroundColor(fieldGold.opacity(0.7))
          }
        }

        Spacer()

        Image(systemName: "chevron.right")
          .font(.system(size: 11, weight: .semibold))
          .foregroundColor(Palette.text.muted)
      }
      .padding(.horizontal, 16)
      .padding(.vertical, 12)
    }
  }

  // MARK: - Scientific Resources

  private var scientificResourcesSection: some View {
    VStack(alignment: .leading, spacing: 12) {
      HStack {
        Image(systemName: "books.vertical.fill")
          .foregroundColor(accentColor)
        Text("SCIENTIFIC RESOURCES")
          .font(.system(size: 11, weight: .bold, design: .rounded))
          .foregroundColor(accentColor)
          .tracking(1)
      }

      let resources: [(String, String, String)] = [
        ("Irreducible — Federico Faggin", "His autobiography & theory", "book.fill"),
        ("Quantum Information Theory", "D'Ariano's foundational work", "atom"),
        ("AWARE Study (2014)", "Near-death consciousness research", "heart.text.square"),
        ("Quantum Biology", "Proven quantum effects in living systems", "leaf.fill"),
        ("No-Cloning Theorem", "Why consciousness can't be copied", "lock.shield.fill"),
      ]

      ForEach(resources, id: \.0) { title, subtitle, icon in
        HStack(spacing: 12) {
          Image(systemName: icon)
            .font(.system(size: 14))
            .foregroundColor(accentColor.opacity(0.7))
            .frame(width: 30)

          VStack(alignment: .leading, spacing: 1) {
            Text(title)
              .font(.system(size: 13, weight: .semibold, design: .rounded))
              .foregroundColor(Palette.text.primary)
            Text(subtitle)
              .font(.system(size: 11, weight: .medium))
              .foregroundColor(Palette.text.muted)
          }

          Spacer()
        }
        .padding(10)
        .background(
          RoundedRectangle(cornerRadius: 10)
            .fill(Color.white.opacity(0.03))
        )
      }

      // Ethical disclaimer
      HStack(alignment: .top, spacing: 8) {
        Image(systemName: "exclamationmark.triangle")
          .font(.system(size: 12))
          .foregroundColor(.orange)
        Text(
          "This model is a THEORY, not absolute truth. Test it in your experience. Your direct knowing is more important than any framework."
        )
        .font(.system(size: 11, weight: .medium, design: .rounded))
        .foregroundColor(Palette.text.muted)
        .lineSpacing(2)
      }
      .padding(12)
      .background(
        RoundedRectangle(cornerRadius: 10)
          .fill(Color.orange.opacity(0.05))
          .overlay(
            RoundedRectangle(cornerRadius: 10)
              .stroke(Color.orange.opacity(0.15), lineWidth: 1)
          )
      )
    }
  }

  // MARK: - Progress Persistence

  private func loadProgress() {
    if let data = UserDefaults.standard.data(forKey: "drone_self_progress"),
      let progress = try? JSONDecoder().decode(DroneProgress.self, from: data)
    {
      completedLessons = Set(progress.completedLessons)
      pilotRatio = progress.pilotRatio ?? 0
    }
  }

  private func saveProgress() {
    let progress = DroneProgress(
      completedLessons: Array(completedLessons),
      lastAccessed: Date(),
      pilotRatio: pilotRatio
    )
    if let data = try? JSONEncoder().encode(progress) {
      UserDefaults.standard.set(data, forKey: "drone_self_progress")
    }
  }
}

// MARK: - Wave Field Line Shape

struct WaveFieldLine: Shape {
  func path(in rect: CGRect) -> Path {
    var path = Path()
    let w = rect.width
    let h = rect.height
    path.move(to: CGPoint(x: 0, y: h / 2))
    for x in stride(from: 0, through: w, by: 2) {
      let y = h / 2 + sin(x / 40) * 20 + cos(x / 60) * 10
      path.addLine(to: CGPoint(x: x, y: y))
    }
    return path
  }
}

// MARK: - Lesson Detail View

struct DroneLessonDetailView: View {
  let lesson: DroneLesson
  let accentColor: Color
  let onComplete: () -> Void
  @State private var isCompleted = false
  @Environment(\.dismiss) private var dismiss

  var body: some View {
    ZStack {
      LinearGradient(
        colors: [Color(hex: "#040810"), Color(hex: "#081018"), Color(hex: "#040810")],
        startPoint: .top,
        endPoint: .bottom
      )
      .ignoresSafeArea()

      ScrollView(showsIndicators: false) {
        VStack(alignment: .leading, spacing: 20) {
          // Header
          HStack {
            Button {
              dismiss()
            } label: {
              HStack(spacing: 6) {
                Image(systemName: "chevron.left")
                Text("Back")
              }
              .foregroundColor(accentColor)
            }
            Spacer()
          }
          .padding(.top, 20)

          // Title
          Text(lesson.title)
            .font(.system(size: 24, weight: .bold, design: .rounded))
            .foregroundStyle(
              LinearGradient(
                colors: [accentColor, Color(hex: "#FFD700")],
                startPoint: .leading,
                endPoint: .trailing
              )
            )

          // Content
          Text(LocalizedStringKey(lesson.content))
            .font(.system(size: 15, weight: .regular, design: .rounded))
            .foregroundColor(Palette.text.primary)
            .lineSpacing(6)

          // Key Insight Box
          VStack(alignment: .leading, spacing: 8) {
            HStack {
              Image(systemName: "lightbulb.fill")
                .foregroundColor(Color(hex: "#FFD700"))
              Text("KEY INSIGHT")
                .font(.system(size: 11, weight: .bold, design: .rounded))
                .foregroundColor(Color(hex: "#FFD700"))
                .tracking(1)
            }
            Text(lesson.keyInsight)
              .font(.system(size: 14, weight: .semibold, design: .rounded))
              .foregroundColor(Palette.text.primary)
              .lineSpacing(4)
          }
          .padding(16)
          .background(
            RoundedRectangle(cornerRadius: 14, style: .continuous)
              .fill(Color(hex: "#FFD700").opacity(0.08))
              .overlay(
                RoundedRectangle(cornerRadius: 14, style: .continuous)
                  .stroke(Color(hex: "#FFD700").opacity(0.2), lineWidth: 1)
              )
          )

          // Exercise (if present)
          if let exercise = lesson.exercise {
            exerciseCard(exercise)
          }

          // Complete Button
          Button {
            if !isCompleted {
              isCompleted = true
              onComplete()
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
              dismiss()
            }
          } label: {
            HStack {
              Image(systemName: isCompleted ? "checkmark.circle.fill" : "arrow.right.circle.fill")
              Text(isCompleted ? "Completed ✓" : "Mark Complete & Continue")
                .font(.system(size: 16, weight: .bold, design: .rounded))
            }
            .foregroundColor(isCompleted ? .black : .black)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .background(
              RoundedRectangle(cornerRadius: 14)
                .fill(isCompleted ? Color.green : accentColor)
            )
          }
          .padding(.top, 8)

          Spacer(minLength: 40)
        }
        .padding(.horizontal, 20)
      }
    }
  }

  private func exerciseCard(_ exercise: DroneExercise) -> some View {
    VStack(alignment: .leading, spacing: 10) {
      HStack {
        Image(systemName: "figure.mind.and.body")
          .foregroundColor(.green)
        Text("PRACTICE EXERCISE")
          .font(.system(size: 11, weight: .bold, design: .rounded))
          .foregroundColor(.green)
          .tracking(1)
        Spacer()
        Text(exercise.duration)
          .font(.system(size: 11, weight: .medium, design: .rounded))
          .foregroundColor(Palette.text.muted)
      }

      Text(exercise.title)
        .font(.system(size: 16, weight: .bold, design: .rounded))
        .foregroundColor(Palette.text.primary)

      Text(exercise.prompt)
        .font(.system(size: 14, weight: .regular, design: .rounded))
        .foregroundColor(Palette.text.secondary)
        .lineSpacing(4)
    }
    .padding(16)
    .background(
      RoundedRectangle(cornerRadius: 14, style: .continuous)
        .fill(Color.green.opacity(0.06))
        .overlay(
          RoundedRectangle(cornerRadius: 14, style: .continuous)
            .stroke(Color.green.opacity(0.2), lineWidth: 1)
        )
    )
  }
}

// MARK: - Exercise View

struct DroneExerciseView: View {
  let exercise: DroneExercise
  let accentColor: Color
  @Environment(\.dismiss) private var dismiss

  var body: some View {
    NavigationStack {
      ZStack {
        Color(hex: "#040810").ignoresSafeArea()

        VStack(spacing: 24) {
          Image(systemName: "figure.mind.and.body")
            .font(.system(size: 50))
            .foregroundColor(.green)

          Text(exercise.title)
            .font(.system(size: 22, weight: .bold, design: .rounded))
            .foregroundColor(Palette.text.primary)

          Text(exercise.duration)
            .font(.system(size: 14, weight: .medium))
            .foregroundColor(accentColor)
            .padding(.horizontal, 14)
            .padding(.vertical, 6)
            .background(Capsule().fill(accentColor.opacity(0.15)))

          Text(exercise.prompt)
            .font(.system(size: 16, weight: .regular, design: .rounded))
            .foregroundColor(Palette.text.secondary)
            .lineSpacing(5)
            .multilineTextAlignment(.center)
            .padding(.horizontal, 20)

          Spacer()

          Button {
            dismiss()
          } label: {
            Text("Done")
              .font(.system(size: 16, weight: .bold, design: .rounded))
              .foregroundColor(.black)
              .frame(maxWidth: .infinity)
              .padding(.vertical, 16)
              .background(RoundedRectangle(cornerRadius: 14).fill(Color.green))
          }
          .padding(.horizontal, 40)
          .padding(.bottom, 40)
        }
        .padding(.top, 40)
      }
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button("Done") { dismiss() }
            .foregroundColor(accentColor)
        }
      }
    }
  }
}

// MARK: - Identifiable Wrapper for Exercise

struct IdentifiableExercise: Identifiable {
  let id = UUID()
  let exercise: DroneExercise
}
