// AIConsciousnessCourseView.swift
// Interactive course view for AI & Consciousness
// ☀️ SunFlow: Reignited

import SwiftUI

struct AIConsciousnessCourseView: View {
  @Environment(\.dismiss) var dismiss
  @State private var selectedModule: AIModule?
  @State private var glowPulse = false

  private let course = AIConsciousnessCourse.shared

  var body: some View {
    NavigationStack {
      ZStack {
        // Cyber-consciousness background
        LinearGradient(
          colors: [
            Color.black,
            course.color.opacity(0.1),
            Color(hex: "0a0a1a"),
            Color.black,
          ],
          startPoint: .top,
          endPoint: .bottom
        )
        .ignoresSafeArea()

        // Neural network particles
        GeometryReader { geo in
          ForEach(0..<20, id: \.self) { _ in
            Circle()
              .fill(course.color.opacity(Double.random(in: 0.1...0.3)))
              .frame(width: CGFloat.random(in: 2...4))
              .position(
                x: CGFloat.random(in: 0...geo.size.width),
                y: CGFloat.random(in: 0...geo.size.height)
              )
              .blur(radius: 1)
          }
        }

        ScrollView(showsIndicators: false) {
          VStack(spacing: 24) {
            headerSection

            modulesSection

            Spacer(minLength: 100)
          }
          .padding(.horizontal, 20)
          .padding(.top, 20)
        }
      }
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarLeading) {
          Button {
            dismiss()
          } label: {
            HStack(spacing: 4) {
              Image(systemName: "chevron.left")
              Text("Back")
            }
            .foregroundColor(course.color)
          }
        }
      }
      .sheet(item: $selectedModule) { module in
        AIModuleDetailView(module: module, color: course.color)
      }
      .onAppear {
        withAnimation(.easeInOut(duration: 2).repeatForever(autoreverses: true)) {
          glowPulse = true
        }
      }
    }
  }

  // MARK: - Header

  private var headerSection: some View {
    VStack(spacing: 16) {
      // Animated brain icon
      ZStack {
        // Pulsing glow
        Circle()
          .fill(
            RadialGradient(
              colors: [course.color.opacity(glowPulse ? 0.4 : 0.2), Color.clear],
              center: .center,
              startRadius: 0,
              endRadius: 80
            )
          )
          .frame(width: 160, height: 160)

        // Circuit pattern overlay
        Circle()
          .stroke(course.color.opacity(0.2), lineWidth: 1)
          .frame(width: 120, height: 120)

        Circle()
          .stroke(course.color.opacity(0.15), lineWidth: 1)
          .frame(width: 100, height: 100)

        Image(systemName: "brain.head.profile")
          .font(.system(size: 56, weight: .semibold))
          .foregroundStyle(
            LinearGradient(
              colors: [course.color, course.color.opacity(0.7)],
              startPoint: .topLeading,
              endPoint: .bottomTrailing
            )
          )
          .shadow(color: course.color.opacity(0.5), radius: 15)
      }
      .accessibilityHidden(true)

      Text(course.title)
        .font(.system(size: 28, weight: .bold, design: .rounded))
        .foregroundColor(Palette.text.primary)

      Text(course.subtitle)
        .font(.system(size: 16, weight: .medium, design: .rounded))
        .foregroundColor(Palette.text.secondary)
        .multilineTextAlignment(.center)

      // Dragon intro
      HStack(alignment: .top, spacing: 10) {
        Text("🐉")
          .font(.system(size: 16))

        Text(
          "\"They're building minds in silicon and nobody's asking what a mind actually IS. Finally, the question humanity dodged for millennia has an expiration date.\""
        )
        .font(.system(size: 13, weight: .medium, design: .rounded))
        .italic()
        .foregroundColor(course.color.opacity(0.9))
        .lineSpacing(4)
      }
      .padding(14)
      .background(
        RoundedRectangle(cornerRadius: 12, style: .continuous)
          .fill(course.color.opacity(0.1))
          .overlay(
            RoundedRectangle(cornerRadius: 12, style: .continuous)
              .stroke(course.color.opacity(0.3), lineWidth: 1)
          )
      )

      // Course stats
      HStack(spacing: 20) {
        statPill(icon: "square.stack.3d.up", value: "4", label: "Modules")
        statPill(icon: "text.book.closed", value: "12", label: "Lessons")
        statPill(icon: "clock", value: "2.5h", label: "Duration")
      }
    }
  }

  private func statPill(icon: String, value: String, label: String) -> some View {
    VStack(spacing: 4) {
      HStack(spacing: 4) {
        Image(systemName: icon)
          .font(.system(size: 11))
        Text(value)
          .font(.system(size: 14, weight: .bold, design: .rounded))
      }
      .foregroundColor(course.color)

      Text(label)
        .font(.system(size: 10, weight: .medium))
        .foregroundColor(Palette.text.muted)
    }
    .padding(.horizontal, 14)
    .padding(.vertical, 8)
    .background(
      Capsule()
        .fill(course.color.opacity(0.1))
    )
  }

  // MARK: - Modules Section

  private var modulesSection: some View {
    VStack(alignment: .leading, spacing: 16) {
      HStack {
        Text("COURSE MODULES")
          .font(.system(size: 12, weight: .bold, design: .rounded))
          .tracking(2)
          .foregroundColor(Palette.text.muted)

        Spacer()
      }

      ForEach(course.modules) { module in
        AIModuleCard(module: module, color: course.color) {
          selectedModule = module
        }
      }
    }
  }
}

// MARK: - Module Card

struct AIModuleCard: View {
  let module: AIModule
  let color: Color
  let action: () -> Void

  var body: some View {
    Button(action: {
      HapticManager.shared.medium()
      action()
    }) {
      HStack(spacing: 14) {
        // Module number with circuit aesthetic
        ZStack {
          RoundedRectangle(cornerRadius: 12)
            .fill(color.opacity(0.15))
            .frame(width: 50, height: 50)

          Text("\(module.number)")
            .font(.system(size: 22, weight: .bold, design: .monospaced))
            .foregroundColor(color)
        }

        VStack(alignment: .leading, spacing: 4) {
          Text(module.title)
            .font(.system(size: 16, weight: .bold, design: .rounded))
            .foregroundColor(Palette.text.primary)

          Text(module.subtitle)
            .font(.system(size: 13, weight: .medium))
            .foregroundColor(Palette.text.secondary)

          Text("\(module.lessons.count) lessons")
            .font(.system(size: 11, weight: .medium))
            .foregroundColor(Palette.text.muted)
        }

        Spacer()

        Image(systemName: module.icon)
          .font(.system(size: 20))
          .foregroundColor(color.opacity(0.7))

        Image(systemName: "chevron.right")
          .font(.system(size: 14, weight: .semibold))
          .foregroundColor(Palette.text.muted)
      }
      .padding(16)
      .background(
        RoundedRectangle(cornerRadius: 16)
          .fill(Color.white.opacity(0.04))
          .overlay(
            RoundedRectangle(cornerRadius: 16)
              .stroke(color.opacity(0.2), lineWidth: 1)
          )
      )
    }
    .buttonStyle(ScaleButtonStyle())
    .accessibilityElement(children: .combine)
    .accessibilityLabel(
      "Module \(module.number): \(module.title). \(module.subtitle). \(module.lessons.count) lessons."
    )
    .accessibilityHint("Double tap to open module")
  }
}

// MARK: - Module Detail View

struct AIModuleDetailView: View {
  let module: AIModule
  let color: Color
  @Environment(\.dismiss) var dismiss
  @State private var selectedLesson: AILesson?

  var body: some View {
    NavigationStack {
      ZStack {
        Color.black.ignoresSafeArea()

        ScrollView(showsIndicators: false) {
          VStack(spacing: 20) {
            // Module header
            VStack(spacing: 12) {
              ZStack {
                Circle()
                  .fill(color.opacity(0.2))
                  .frame(width: 80, height: 80)

                Image(systemName: module.icon)
                  .font(.system(size: 36, weight: .semibold))
                  .foregroundColor(color)
              }

              Text("Module \(module.number)")
                .font(.system(size: 12, weight: .bold, design: .rounded))
                .foregroundColor(color)

              Text(module.title)
                .font(.system(size: 24, weight: .bold, design: .rounded))
                .foregroundColor(Palette.text.primary)

              Text(module.subtitle)
                .font(.system(size: 15, weight: .medium))
                .foregroundColor(Palette.text.secondary)
            }
            .padding(.top, 20)

            // Lessons
            VStack(alignment: .leading, spacing: 12) {
              Text("LESSONS")
                .font(.system(size: 12, weight: .bold, design: .rounded))
                .tracking(2)
                .foregroundColor(Palette.text.muted)
                .padding(.horizontal, 20)

              ForEach(Array(module.lessons.enumerated()), id: \.element.id) { index, lesson in
                AILessonRow(
                  lesson: lesson,
                  number: index + 1,
                  color: color
                ) {
                  selectedLesson = lesson
                }
                .padding(.horizontal, 20)
              }
            }

            Spacer(minLength: 100)
          }
        }
      }
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button("Done") {
            dismiss()
          }
          .foregroundColor(color)
        }
      }
      .sheet(item: $selectedLesson) { lesson in
        AILessonView(lesson: lesson, color: color)
      }
    }
  }
}

// MARK: - Lesson Row

struct AILessonRow: View {
  let lesson: AILesson
  let number: Int
  let color: Color
  let action: () -> Void

  var body: some View {
    Button(action: {
      HapticManager.shared.light()
      action()
    }) {
      HStack(spacing: 14) {
        Text("\(number)")
          .font(.system(size: 14, weight: .bold, design: .monospaced))
          .foregroundColor(color)
          .frame(width: 28, height: 28)
          .background(
            Circle()
              .fill(color.opacity(0.15))
          )

        Text(lesson.title)
          .font(.system(size: 15, weight: .semibold, design: .rounded))
          .foregroundColor(Palette.text.primary)

        Spacer()

        Image(systemName: "chevron.right")
          .font(.system(size: 12, weight: .semibold))
          .foregroundColor(Palette.text.muted)
      }
      .padding(14)
      .background(
        RoundedRectangle(cornerRadius: 12)
          .fill(Color.white.opacity(0.03))
      )
    }
    .buttonStyle(PlainButtonStyle())
    .accessibilityLabel("Lesson \(number): \(lesson.title)")
    .accessibilityHint("Double tap to start lesson")
  }
}

// MARK: - Lesson View

struct AILessonView: View {
  let lesson: AILesson
  let color: Color
  @Environment(\.dismiss) var dismiss

  var body: some View {
    NavigationStack {
      ZStack {
        Color.black.ignoresSafeArea()

        ScrollView(showsIndicators: false) {
          VStack(alignment: .leading, spacing: 24) {
            // Header
            Text(lesson.title)
              .font(.system(size: 26, weight: .bold, design: .rounded))
              .foregroundColor(Palette.text.primary)

            // Content
            Text(LocalizedStringKey(lesson.content))
              .font(.system(size: 16, weight: .regular, design: .rounded))
              .foregroundColor(Palette.text.secondary)
              .lineSpacing(6)

            // Key Insight
            VStack(alignment: .leading, spacing: 10) {
              HStack(spacing: 8) {
                Image(systemName: "lightbulb.fill")
                  .foregroundColor(Palette.accent.gold)
                Text("KEY INSIGHT")
                  .font(.system(size: 11, weight: .bold, design: .rounded))
                  .tracking(1.5)
                  .foregroundColor(Palette.accent.gold)
              }

              Text(lesson.keyInsight)
                .font(.system(size: 15, weight: .medium, design: .rounded))
                .foregroundColor(Palette.text.primary)
                .italic()
            }
            .padding(16)
            .background(
              RoundedRectangle(cornerRadius: 12)
                .fill(Palette.accent.gold.opacity(0.1))
                .overlay(
                  RoundedRectangle(cornerRadius: 12)
                    .stroke(Palette.accent.gold.opacity(0.3), lineWidth: 1)
                )
            )

            // Dragon Quote
            HStack(alignment: .top, spacing: 12) {
              Text("🐉")
                .font(.system(size: 24))

              Text(lesson.dragonQuote)
                .font(.system(size: 14, weight: .medium, design: .rounded))
                .foregroundColor(color.opacity(0.9))
                .italic()
                .lineSpacing(4)
            }
            .padding(16)
            .background(
              RoundedRectangle(cornerRadius: 12)
                .fill(color.opacity(0.1))
                .overlay(
                  RoundedRectangle(cornerRadius: 12)
                    .stroke(color.opacity(0.3), lineWidth: 1)
                )
            )

            Spacer(minLength: 100)
          }
          .padding(20)
        }
      }
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button("Done") {
            dismiss()
          }
          .foregroundColor(color)
        }
      }
    }
  }
}

// MARK: - Identifiable Conformance

extension AIModule: Equatable {
  static func == (lhs: AIModule, rhs: AIModule) -> Bool {
    lhs.id == rhs.id
  }
}

extension AILesson: Equatable {
  static func == (lhs: AILesson, rhs: AILesson) -> Bool {
    lhs.id == rhs.id
  }
}

#Preview {
  AIConsciousnessCourseView()
}
