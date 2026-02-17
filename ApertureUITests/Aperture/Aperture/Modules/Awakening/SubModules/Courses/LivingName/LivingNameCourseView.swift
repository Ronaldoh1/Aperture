// LivingNameCourseView.swift
// THE LIVING NAME - Golden light pulsing UI
// ☀️ SunFlow: Reignited

import SwiftUI

struct LivingNameCourseView: View {
  @Environment(\.dismiss) var dismiss
  @State private var selectedModule: LivingNameModule?
  @State private var pulsePhase: CGFloat = 0
  @State private var lightRays: CGFloat = 0
  @State private var particleOffset: CGFloat = 0
  @State private var hebrewGlow: CGFloat = 0

  private let course = LivingNameCourse.shared

  var body: some View {
    NavigationStack {
      ZStack {
        // Golden light background
        goldenBackground

        // Light ray particles
        lightParticles

        ScrollView(showsIndicators: false) {
          VStack(spacing: 28) {
            headerSection

            hebrewSection

            introSection

            modulesSection

            Spacer(minLength: 120)
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
        LivingNameModuleDetailView(module: module, color: course.color)
      }
      .onAppear {
        startAnimations()
      }
    }
  }

  // MARK: - Golden Background

  private var goldenBackground: some View {
    ZStack {
      // Base dark gradient
      LinearGradient(
        colors: [
          Color.black,
          Color(hex: "1a1400"),
          Color(hex: "261a00"),
          Color(hex: "1a1400"),
          Color.black,
        ],
        startPoint: .top,
        endPoint: .bottom
      )
      .ignoresSafeArea()

      // Pulsing golden glow from center
      RadialGradient(
        colors: [
          course.color.opacity(0.2 + pulsePhase * 0.1),
          course.color.opacity(0.08),
          Color.clear,
        ],
        center: .center,
        startRadius: 50,
        endRadius: 450
      )
      .ignoresSafeArea()

      // Light rays emanating from center
      LightRays(phase: lightRays, rayCount: 12)
        .stroke(
          course.color.opacity(0.15),
          lineWidth: 1.5
        )
        .blur(radius: 1)
        .ignoresSafeArea()
    }
  }

  // MARK: - Light Particles

  private var lightParticles: some View {
    GeometryReader { geo in
      ForEach(0..<30, id: \.self) { i in
        Circle()
          .fill(course.color.opacity(Double.random(in: 0.3...0.6)))
          .frame(width: CGFloat.random(in: 2...4))
          .position(
            x: CGFloat.random(in: 0...geo.size.width),
            y: (geo.size.height - CGFloat(i) * 30 - particleOffset).truncatingRemainder(
              dividingBy: geo.size.height + 100)
          )
          .blur(radius: CGFloat.random(in: 0.5...1.5))
      }
    }
    .allowsHitTesting(false)
  }

  // MARK: - Header

  private var headerSection: some View {
    VStack(spacing: 20) {
      // Icon with pulsing light
      ZStack {
        // Outer glow rings
        ForEach(0..<4, id: \.self) { i in
          Circle()
            .stroke(
              course.color.opacity(0.25 - Double(i) * 0.05),
              lineWidth: 2
            )
            .frame(width: 100 + CGFloat(i) * 35, height: 100 + CGFloat(i) * 35)
            .scaleEffect(1 + pulsePhase * 0.03)
        }

        // Inner glow
        Circle()
          .fill(
            RadialGradient(
              colors: [
                course.color.opacity(0.5),
                course.color.opacity(0.2),
                Color.clear,
              ],
              center: .center,
              startRadius: 0,
              endRadius: 50
            )
          )
          .frame(width: 100, height: 100)
          .scaleEffect(1 + pulsePhase * 0.08)

        // Text icon
        Text("יֵשׁוּעַ")
          .font(.system(size: 28, weight: .bold))
          .foregroundColor(course.color)
          .shadow(color: course.color, radius: 10)
          .shadow(color: course.color.opacity(0.5), radius: 20)
      }
      .accessibilityLabel("Yeshua in Hebrew letters")

      // Title
      VStack(spacing: 8) {
        Text("THE LIVING NAME")
          .font(.system(size: 12, weight: .bold, design: .rounded))
          .tracking(4)
          .foregroundColor(course.color)

        Text("What They Buried")
          .font(.system(size: 28, weight: .bold, design: .rounded))
          .foregroundColor(Palette.text.primary)

        Text("When They Changed His Name")
          .font(.system(size: 18, weight: .medium, design: .rounded))
          .foregroundColor(Palette.text.secondary)
      }

      // Course stats
      HStack(spacing: 16) {
        LivingNameStatPill(
          icon: "square.stack.3d.up", value: "6", label: "Modules", color: course.color)
        LivingNameStatPill(
          icon: "text.book.closed", value: "18", label: "Lessons", color: course.color)
        LivingNameStatPill(icon: "clock", value: "4h", label: "Duration", color: course.color)
      }
    }
  }

  // MARK: - Hebrew Section

  private var hebrewSection: some View {
    VStack(spacing: 16) {
      Text("THE SACRED LETTERS")
        .font(.system(size: 11, weight: .bold, design: .rounded))
        .tracking(2)
        .foregroundColor(Palette.text.muted)

      HStack(spacing: 20) {
        HebrewLetterView(
          letter: "י", name: "YUD", meaning: "Divine Spark", color: course.color, delay: 0)
        HebrewLetterView(
          letter: "ש", name: "SHIN", meaning: "Eternal Fire", color: course.color, delay: 0.2)
        HebrewLetterView(
          letter: "ו", name: "VAV", meaning: "Connection", color: course.color, delay: 0.4)
        HebrewLetterView(
          letter: "ע", name: "AYIN", meaning: "Inner Eye", color: course.color, delay: 0.6)
      }

      Text("Together: The divine spark, through fire, connects you to spiritual sight")
        .font(.system(size: 13, weight: .medium, design: .rounded))
        .foregroundColor(Palette.text.secondary)
        .multilineTextAlignment(.center)
        .padding(.horizontal)
    }
    .padding(.vertical, 20)
    .background(
      RoundedRectangle(cornerRadius: 16)
        .fill(course.color.opacity(0.08))
        .overlay(
          RoundedRectangle(cornerRadius: 16)
            .stroke(course.color.opacity(0.2), lineWidth: 1)
        )
    )
  }

  // MARK: - Intro Section

  private var introSection: some View {
    VStack(alignment: .leading, spacing: 14) {
      HStack(spacing: 10) {
        Image(systemName: "exclamationmark.triangle.fill")
          .foregroundColor(.red)
        Text("SUPPRESSED TRUTH")
          .font(.system(size: 11, weight: .bold, design: .rounded))
          .tracking(2)
          .foregroundColor(.red)
      }

      Text(
        "The man you know as Jesus was never called that. Not by his mother. Not by his followers. His name was Yeshua—and it wasn't just a name."
      )
      .font(.system(size: 16, weight: .medium, design: .rounded))
      .foregroundColor(Palette.text.primary)
      .lineSpacing(4)

      Text(
        "It was a vibration. A code. A map back to the divine. They didn't just change his name—they buried a key."
      )
      .font(.system(size: 15, weight: .regular, design: .rounded))
      .foregroundColor(Palette.text.secondary)
      .lineSpacing(4)

      // Key revelations
      VStack(alignment: .leading, spacing: 10) {
        LivingNameKeyPoint(
          text: "Yeshua → Iēsous → Iesus → Jesus: each step stripped the vibration",
          color: course.color)
        LivingNameKeyPoint(
          text: "Council of Nicaea (325 AD): Constantine needed control, not awakening",
          color: course.color)
        LivingNameKeyPoint(
          text: "The Gospel of Thomas buried: 'The kingdom is within you'", color: course.color)
        LivingNameKeyPoint(
          text: "The Christ is an inner anointing—not just a person to worship", color: course.color
        )
      }
      .padding(.top, 8)
    }
    .padding(18)
    .background(
      RoundedRectangle(cornerRadius: 16)
        .fill(Color.red.opacity(0.08))
        .overlay(
          RoundedRectangle(cornerRadius: 16)
            .stroke(Color.red.opacity(0.25), lineWidth: 1)
        )
    )
  }

  // MARK: - Modules Section

  private var modulesSection: some View {
    VStack(alignment: .leading, spacing: 16) {
      HStack {
        Image(systemName: "list.bullet.rectangle.portrait.fill")
          .foregroundColor(course.color)
        Text("COURSE MODULES")
          .font(.system(size: 11, weight: .bold, design: .rounded))
          .tracking(2)
          .foregroundColor(course.color)
      }

      ForEach(course.modules) { module in
        LivingNameModuleCard(module: module, color: course.color) {
          HapticManager.shared.medium()
          selectedModule = module
        }
      }
    }
  }

  // MARK: - Animations

  private func startAnimations() {
    withAnimation(.easeInOut(duration: 2.5).repeatForever(autoreverses: true)) {
      pulsePhase = 1
    }

    withAnimation(.linear(duration: 30).repeatForever(autoreverses: false)) {
      lightRays = .pi * 2
    }

    withAnimation(.linear(duration: 15).repeatForever(autoreverses: false)) {
      particleOffset = 600
    }

    withAnimation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true)) {
      hebrewGlow = 1
    }
  }
}

// MARK: - Light Rays Shape

struct LightRays: Shape {
  var phase: CGFloat
  var rayCount: Int

  var animatableData: CGFloat {
    get { phase }
    set { phase = newValue }
  }

  func path(in rect: CGRect) -> Path {
    var path = Path()
    let center = CGPoint(x: rect.midX, y: rect.midY)
    let radius = max(rect.width, rect.height)

    for i in 0..<rayCount {
      let angle = (CGFloat(i) / CGFloat(rayCount)) * .pi * 2 + phase
      let endX = center.x + cos(angle) * radius
      let endY = center.y + sin(angle) * radius

      path.move(to: center)
      path.addLine(to: CGPoint(x: endX, y: endY))
    }

    return path
  }
}

// MARK: - Hebrew Letter View

struct HebrewLetterView: View {
  let letter: String
  let name: String
  let meaning: String
  let color: Color
  let delay: Double

  @State private var glowing = false

  var body: some View {
    VStack(spacing: 6) {
      Text(letter)
        .font(.system(size: 32, weight: .bold))
        .foregroundColor(color)
        .shadow(color: glowing ? color : .clear, radius: 8)

      Text(name)
        .font(.system(size: 9, weight: .bold, design: .rounded))
        .foregroundColor(Palette.text.secondary)

      Text(meaning)
        .font(.system(size: 8, weight: .medium))
        .foregroundColor(Palette.text.muted)
    }
    .frame(width: 70)
    .onAppear {
      DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
        withAnimation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true)) {
          glowing = true
        }
      }
    }
  }
}

// MARK: - Supporting Views

struct LivingNameStatPill: View {
  let icon: String
  let value: String
  let label: String
  let color: Color

  var body: some View {
    VStack(spacing: 4) {
      HStack(spacing: 4) {
        Image(systemName: icon)
          .font(.system(size: 11))
        Text(value)
          .font(.system(size: 14, weight: .bold, design: .rounded))
      }
      .foregroundColor(color)

      Text(label)
        .font(.system(size: 10, weight: .medium))
        .foregroundColor(Palette.text.muted)
    }
    .padding(.horizontal, 14)
    .padding(.vertical, 8)
    .background(Capsule().fill(color.opacity(0.15)))
  }
}

struct LivingNameKeyPoint: View {
  let text: String
  let color: Color

  var body: some View {
    HStack(alignment: .top, spacing: 10) {
      Image(systemName: "checkmark.circle.fill")
        .font(.system(size: 14))
        .foregroundColor(color)

      Text(text)
        .font(.system(size: 14, weight: .medium, design: .rounded))
        .foregroundColor(Palette.text.secondary)
    }
  }
}

struct LivingNameModuleCard: View {
  let module: LivingNameModule
  let color: Color
  let action: () -> Void

  var body: some View {
    Button(action: action) {
      HStack(spacing: 14) {
        ZStack {
          RoundedRectangle(cornerRadius: 12)
            .fill(color.opacity(0.2))
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
          .font(.system(size: 18))
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
  }
}

// MARK: - Module Detail View

struct LivingNameModuleDetailView: View {
  let module: LivingNameModule
  let color: Color
  @Environment(\.dismiss) var dismiss
  @State private var selectedLesson: LivingNameLesson?

  var body: some View {
    NavigationStack {
      ZStack {
        LinearGradient(
          colors: [Color.black, Color(hex: "1a1400"), Color.black],
          startPoint: .top,
          endPoint: .bottom
        )
        .ignoresSafeArea()

        ScrollView(showsIndicators: false) {
          VStack(spacing: 24) {
            VStack(spacing: 14) {
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

            VStack(alignment: .leading, spacing: 12) {
              Text("LESSONS")
                .font(.system(size: 11, weight: .bold, design: .rounded))
                .tracking(2)
                .foregroundColor(Palette.text.muted)
                .padding(.horizontal, 20)

              ForEach(Array(module.lessons.enumerated()), id: \.element.id) { index, lesson in
                LivingNameLessonRow(lesson: lesson, number: index + 1, color: color) {
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
          Button("Done") { dismiss() }
            .foregroundColor(color)
        }
      }
      .sheet(item: $selectedLesson) { lesson in
        LivingNameLessonView(lesson: lesson, color: color)
      }
    }
  }
}

struct LivingNameLessonRow: View {
  let lesson: LivingNameLesson
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
          .background(Circle().fill(color.opacity(0.15)))

        Text(lesson.title)
          .font(.system(size: 15, weight: .semibold, design: .rounded))
          .foregroundColor(Palette.text.primary)
          .lineLimit(2)
          .multilineTextAlignment(.leading)

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
  }
}

// MARK: - Lesson View

struct LivingNameLessonView: View {
  let lesson: LivingNameLesson
  let color: Color
  @Environment(\.dismiss) var dismiss

  var body: some View {
    NavigationStack {
      ZStack {
        Color.black.ignoresSafeArea()

        ScrollView(showsIndicators: false) {
          VStack(alignment: .leading, spacing: 24) {
            Text(lesson.title)
              .font(.system(size: 26, weight: .bold, design: .rounded))
              .foregroundColor(Palette.text.primary)

            Text(LocalizedStringKey(lesson.content))
              .font(.system(size: 16, weight: .regular, design: .rounded))
              .foregroundColor(Palette.text.secondary)
              .lineSpacing(6)

            // Key Insight
            VStack(alignment: .leading, spacing: 10) {
              HStack(spacing: 8) {
                Image(systemName: "lightbulb.fill")
                  .foregroundColor(color)
                Text("KEY INSIGHT")
                  .font(.system(size: 11, weight: .bold, design: .rounded))
                  .tracking(1.5)
                  .foregroundColor(color)
              }

              Text(lesson.keyInsight)
                .font(.system(size: 15, weight: .medium, design: .rounded))
                .foregroundColor(Palette.text.primary)
                .italic()
            }
            .padding(16)
            .background(
              RoundedRectangle(cornerRadius: 12)
                .fill(color.opacity(0.12))
                .overlay(
                  RoundedRectangle(cornerRadius: 12)
                    .stroke(color.opacity(0.3), lineWidth: 1)
                )
            )

            // Practice
            VStack(alignment: .leading, spacing: 10) {
              HStack(spacing: 8) {
                Image(systemName: "figure.mind.and.body")
                  .foregroundColor(.cyan)
                Text("PRACTICE")
                  .font(.system(size: 11, weight: .bold, design: .rounded))
                  .tracking(1.5)
                  .foregroundColor(.cyan)
              }

              Text(lesson.practice)
                .font(.system(size: 15, weight: .medium, design: .rounded))
                .foregroundColor(Palette.text.secondary)
            }
            .padding(16)
            .background(
              RoundedRectangle(cornerRadius: 12)
                .fill(Color.cyan.opacity(0.1))
                .overlay(
                  RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.cyan.opacity(0.25), lineWidth: 1)
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
          Button("Done") { dismiss() }
            .foregroundColor(color)
        }
      }
    }
  }
}

#Preview {
  LivingNameCourseView()
}
