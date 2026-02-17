// SolarTheologyCourseView.swift
// Aperture
//
// Interactive course view for Solar Theology
// Features: Animated reveals, symbol comparisons, calendar visualizations

import SwiftUI

// MARK: - Main Course View

struct SolarTheologyCourseView: View {
  @Environment(\.dismiss) private var dismiss
  @StateObject private var progressManager = CourseProgressManager.shared
  @State private var selectedModule: SolarTheologyModule?
  @State private var showLesson: SolarTheologyLesson?

  private let course = SolarTheologyCourseContent.course

  var body: some View {
    NavigationStack {
      ZStack {
        // Cosmic background with sun imagery
        solarBackground

        ScrollView(showsIndicators: false) {
          VStack(spacing: 24) {
            // Header
            courseHeader

            // Progress card
            progressCard

            // Modules
            ForEach(course.modules) { module in
              ModuleCard(
                module: module,
                progress: progressManager.progress(for: "solar_theology")
              ) {
                selectedModule = module
              }
            }

            // Attribution
            attributionCard

            Spacer(minLength: 100)
          }
          .padding()
        }
      }
      .navigationTitle("")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .topBarLeading) {
          Button {
            dismiss()
          } label: {
            Image(systemName: "xmark.circle.fill")
              .font(.title2)
              .foregroundStyle(.white.opacity(0.7))
          }
        }
      }
      .sheet(item: $selectedModule) { module in
        SolarModuleDetailView(module: module)
      }
      .sheet(item: $showLesson) { lesson in
        LessonRevealView(lesson: lesson)
      }
    }
  }

  // MARK: - Solar Background

  private var solarBackground: some View {
    ZStack {
      Color(hex: "#0a0a1a")
        .ignoresSafeArea()

      // Radial sun glow at top
      RadialGradient(
        colors: [
          Color(hex: "#FFD700").opacity(0.15),
          Color(hex: "#FF8C00").opacity(0.08),
          Color.clear,
        ],
        center: .top,
        startRadius: 0,
        endRadius: 400
      )
      .ignoresSafeArea()

      // Subtle zodiac pattern
      GeometryReader { geo in
        ForEach(0..<12, id: \.self) { i in
          let angle = Double(i) * 30
          Circle()
            .stroke(Color(hex: "#FFD700").opacity(0.05), lineWidth: 1)
            .frame(width: 300, height: 300)
            .offset(
              x: cos(angle * .pi / 180) * 100,
              y: sin(angle * .pi / 180) * 100
            )
            .position(x: geo.size.width / 2, y: 200)
        }
      }
    }
  }

  // MARK: - Course Header

  private var courseHeader: some View {
    VStack(spacing: 16) {
      // Animated sun icon
      ZStack {
        // Outer glow rings
        ForEach(0..<3, id: \.self) { i in
          Circle()
            .stroke(Color(hex: "#FFD700").opacity(0.2 - Double(i) * 0.05), lineWidth: 1)
            .frame(width: CGFloat(100 + i * 20), height: CGFloat(100 + i * 20))
        }

        // Sun core
        Circle()
          .fill(
            RadialGradient(
              colors: [Color(hex: "#FFF4E0"), Color(hex: "#FFD700"), Color(hex: "#FF8C00")],
              center: .center,
              startRadius: 0,
              endRadius: 40
            )
          )
          .frame(width: 70, height: 70)

        // Cross symbol (solar cross)
        Image(systemName: "plus")
          .font(.system(size: 30, weight: .light))
          .foregroundColor(Color(hex: "#8B4513").opacity(0.6))
      }
      .frame(height: 140)

      Text("SOLAR THEOLOGY")
        .font(.system(size: 28, weight: .black, design: .rounded))
        .tracking(4)
        .foregroundStyle(
          LinearGradient(
            colors: [Color(hex: "#FFD700"), Color(hex: "#FFA500")],
            startPoint: .leading,
            endPoint: .trailing
          )
        )

      Text("The Astrotheological Origins of Religion")
        .font(.subheadline)
        .foregroundColor(.white.opacity(0.7))

      Text(course.description)
        .font(.caption)
        .foregroundColor(.white.opacity(0.5))
        .multilineTextAlignment(.center)
        .padding(.horizontal)
    }
  }

  // MARK: - Progress Card

  private var progressCard: some View {
    let totalLessons = course.modules.flatMap { $0.lessons }.count
    let completedCount = 0  // TODO: Track actual progress

    return VStack(spacing: 12) {
      HStack {
        VStack(alignment: .leading, spacing: 4) {
          Text("YOUR AWAKENING")
            .font(.caption.bold())
            .foregroundColor(.white.opacity(0.5))
            .tracking(1)

          Text("\(completedCount) / \(totalLessons) Revelations")
            .font(.headline)
            .foregroundColor(.white)
        }

        Spacer()

        // Sun progress indicator
        ZStack {
          Circle()
            .stroke(Color.white.opacity(0.1), lineWidth: 3)

          Circle()
            .trim(from: 0, to: CGFloat(completedCount) / CGFloat(totalLessons))
            .stroke(
              LinearGradient(
                colors: [Color(hex: "#FFD700"), Color(hex: "#FF6B00")],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
              ),
              style: StrokeStyle(lineWidth: 3, lineCap: .round)
            )
            .rotationEffect(.degrees(-90))

          Image(systemName: "sun.max.fill")
            .font(.caption)
            .foregroundColor(Color(hex: "#FFD700"))
        }
        .frame(width: 40, height: 40)
      }

      ProgressView(value: Double(completedCount), total: Double(totalLessons))
        .tint(Color(hex: "#FFD700"))
    }
    .padding()
    .background(
      RoundedRectangle(cornerRadius: 16)
        .fill(Color.white.opacity(0.05))
        .overlay(
          RoundedRectangle(cornerRadius: 16)
            .stroke(Color(hex: "#FFD700").opacity(0.2), lineWidth: 1)
        )
    )
  }

  // MARK: - Attribution

  private var attributionCard: some View {
    VStack(spacing: 12) {
      Image(systemName: "quote.opening")
        .font(.title2)
        .foregroundColor(Color(hex: "#FFD700").opacity(0.5))

      Text(
        "\"Once you understand how this stuff works, you begin to see that the story goes back to India. Goes back to the Hindus. Goes back to Egypt.\""
      )
      .font(.subheadline.italic())
      .foregroundColor(.white.opacity(0.7))
      .multilineTextAlignment(.center)

      Text("— Jordan Maxwell")
        .font(.caption.bold())
        .foregroundColor(Color(hex: "#FFD700"))
    }
    .padding()
    .background(
      RoundedRectangle(cornerRadius: 16)
        .fill(Color.white.opacity(0.03))
    )
  }
}

// MARK: - Module Card

struct ModuleCard: View {
  let module: SolarTheologyModule
  let progress: UserCourseProgress
  let onTap: () -> Void

  @State private var isExpanded = false

  var body: some View {
    VStack(spacing: 0) {
      // Module header
      Button(action: onTap) {
        HStack(spacing: 16) {
          // Icon
          ZStack {
            Circle()
              .fill(Color(hex: "#FFD700").opacity(0.2))
              .frame(width: 50, height: 50)

            Image(systemName: module.icon)
              .font(.title2)
              .foregroundColor(Color(hex: "#FFD700"))
          }

          VStack(alignment: .leading, spacing: 4) {
            Text(module.title)
              .font(.headline)
              .foregroundColor(.white)

            Text(module.subtitle)
              .font(.caption)
              .foregroundColor(.white.opacity(0.6))
          }

          Spacer()

          // Lesson count
          VStack(spacing: 2) {
            Text("\(module.lessons.count)")
              .font(.headline.bold())
              .foregroundColor(Color(hex: "#FFD700"))

            Text("lessons")
              .font(.caption2)
              .foregroundColor(.white.opacity(0.5))
          }

          Image(systemName: "chevron.right")
            .font(.caption)
            .foregroundColor(.white.opacity(0.3))
        }
        .padding()
        .background(
          RoundedRectangle(cornerRadius: 16)
            .fill(Color.white.opacity(0.05))
            .overlay(
              RoundedRectangle(cornerRadius: 16)
                .stroke(Color.white.opacity(0.1), lineWidth: 1)
            )
        )
      }
      .buttonStyle(PlainButtonStyle())
    }
  }
}

// MARK: - Module Detail View

struct SolarModuleDetailView: View {
  let module: SolarTheologyModule
  @Environment(\.dismiss) private var dismiss
  @State private var selectedLesson: SolarTheologyLesson?

  var body: some View {
    NavigationStack {
      ZStack {
        Color(hex: "#0a0a1a")
          .ignoresSafeArea()

        ScrollView(showsIndicators: false) {
          VStack(spacing: 24) {
            // Module header
            moduleHeader

            // Lessons
            ForEach(module.lessons) { lesson in
              SolarLessonCard(lesson: lesson) {
                selectedLesson = lesson
              }
            }

            Spacer(minLength: 100)
          }
          .padding()
        }
      }
      .navigationTitle(module.title)
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .topBarTrailing) {
          Button {
            dismiss()
          } label: {
            Image(systemName: "xmark.circle.fill")
              .foregroundStyle(.white.opacity(0.7))
          }
        }
      }
      .sheet(item: $selectedLesson) { lesson in
        LessonRevealView(lesson: lesson)
      }
    }
  }

  private var moduleHeader: some View {
    VStack(spacing: 16) {
      ZStack {
        Circle()
          .fill(Color(hex: "#FFD700").opacity(0.2))
          .frame(width: 80, height: 80)

        Image(systemName: module.icon)
          .font(.system(size: 35))
          .foregroundColor(Color(hex: "#FFD700"))
      }

      Text(module.subtitle)
        .font(.subheadline)
        .foregroundColor(.white.opacity(0.7))
    }
  }
}

// MARK: - Lesson Card

struct SolarLessonCard: View {
  let lesson: SolarTheologyLesson
  let onTap: () -> Void

  var body: some View {
    Button(action: onTap) {
      HStack(spacing: 16) {
        // Sacred geometry preview
        ZStack {
          Circle()
            .fill(lesson.accentColor.opacity(0.2))
            .frame(width: 50, height: 50)

          Image(systemName: lesson.icon)
            .font(.title3)
            .foregroundColor(lesson.accentColor)
        }

        VStack(alignment: .leading, spacing: 4) {
          Text(lesson.title)
            .font(.subheadline.bold())
            .foregroundColor(.white)

          Text(lesson.subtitle)
            .font(.caption)
            .foregroundColor(.white.opacity(0.6))
        }

        Spacer()

        // Reveal type indicator
        Image(systemName: revealIcon)
          .font(.caption)
          .foregroundColor(lesson.accentColor.opacity(0.7))

        Image(systemName: "chevron.right")
          .font(.caption)
          .foregroundColor(.white.opacity(0.3))
      }
      .padding()
      .background(
        RoundedRectangle(cornerRadius: 12)
          .fill(Color.white.opacity(0.03))
          .overlay(
            RoundedRectangle(cornerRadius: 12)
              .stroke(lesson.accentColor.opacity(0.2), lineWidth: 1)
          )
      )
    }
    .buttonStyle(PlainButtonStyle())
  }

  private var revealIcon: String {
    switch lesson.revealType {
    case .wordOrigin: return "textformat.abc"
    case .symbolMatch: return "star.fill"
    case .timelineEvent: return "clock.fill"
    case .mapConnection: return "globe"
    case .calendarCycle: return "calendar"
    }
  }
}

// MARK: - Lesson Reveal View (The Magic Happens Here!)

struct LessonRevealView: View {
  let lesson: SolarTheologyLesson
  @Environment(\.dismiss) private var dismiss
  @State private var currentSection = 0
  @State private var showReveal = false
  @State private var revealProgress: CGFloat = 0

  var body: some View {
    ZStack {
      // Background
      Color(hex: "#0a0a1a")
        .ignoresSafeArea()

      VStack(spacing: 0) {
        // Header
        lessonHeader

        // Content
        TabView(selection: $currentSection) {
          ForEach(lesson.sections.indices, id: \.self) { index in
            SectionView(
              section: lesson.sections[index],
              accentColor: lesson.accentColor,
              showReveal: currentSection == index ? showReveal : false
            )
            .tag(index)
          }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))

        // Navigation
        navigationBar
      }
    }
    .onChange(of: currentSection) { _, _ in
      showReveal = false
    }
  }

  private var lessonHeader: some View {
    VStack(spacing: 12) {
      HStack {
        Button {
          dismiss()
        } label: {
          Image(systemName: "xmark.circle.fill")
            .font(.title2)
            .foregroundStyle(.white.opacity(0.5))
        }

        Spacer()

        // Progress dots
        HStack(spacing: 6) {
          ForEach(lesson.sections.indices, id: \.self) { index in
            Circle()
              .fill(currentSection >= index ? lesson.accentColor : Color.white.opacity(0.2))
              .frame(width: 8, height: 8)
          }
        }

        Spacer()

        // Sacred geometry earned
        Image(systemName: lesson.sacredGeometry.sfSymbol)
          .font(.title2)
          .foregroundColor(lesson.accentColor.opacity(0.5))
      }
      .padding()

      Text(lesson.title)
        .font(.title2.bold())
        .foregroundColor(.white)

      Text(lesson.subtitle)
        .font(.subheadline)
        .foregroundColor(lesson.accentColor)
    }
    .padding(.bottom)
  }

  private var navigationBar: some View {
    HStack(spacing: 20) {
      // Back button
      Button {
        if currentSection > 0 {
          withAnimation { currentSection -= 1 }
        }
      } label: {
        HStack {
          Image(systemName: "chevron.left")
          Text("Back")
        }
        .foregroundColor(currentSection > 0 ? .white : .white.opacity(0.3))
      }
      .disabled(currentSection == 0)

      Spacer()

      // Reveal / Next button
      if lesson.sections[currentSection].revealContent != nil && !showReveal {
        Button {
          withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
            showReveal = true
          }
          HapticManager.shared.medium()
        } label: {
          HStack {
            Image(systemName: "eye.fill")
            Text("REVEAL")
          }
          .font(.headline)
          .foregroundColor(.black)
          .padding(.horizontal, 24)
          .padding(.vertical, 12)
          .background(lesson.accentColor)
          .cornerRadius(12)
        }
      } else {
        Button {
          if currentSection < lesson.sections.count - 1 {
            withAnimation { currentSection += 1 }
          } else {
            // Award badge and dismiss
            _ = SacredBadgeManager.shared.awardBadge(
              forLesson: lesson.id,
              lessonTitle: lesson.title,
              courseId: "solar_theology"
            )
            dismiss()
          }
        } label: {
          HStack {
            Text(currentSection < lesson.sections.count - 1 ? "Next" : "Complete")
            Image(
              systemName: currentSection < lesson.sections.count - 1 ? "chevron.right" : "checkmark"
            )
          }
          .foregroundColor(.white)
        }
      }
    }
    .padding()
    .background(Color.black.opacity(0.3))
  }
}

// MARK: - Section View

struct SectionView: View {
  let section: SolarTheologySection
  let accentColor: Color
  let showReveal: Bool

  var body: some View {
    ScrollView(showsIndicators: false) {
      VStack(spacing: 24) {
        switch section.type {
        case .narration:
          narrationView
        case .quote:
          quoteView
        case .reveal:
          revealView
        case .comparison:
          comparisonView
        case .calendar:
          calendarView
        case .etymology:
          etymologyView
        }
      }
      .padding()
    }
  }

  private var narrationView: some View {
    Text(section.content)
      .font(.title3)
      .foregroundColor(.white.opacity(0.9))
      .multilineTextAlignment(.center)
      .padding()
  }

  private var quoteView: some View {
    VStack(spacing: 16) {
      Image(systemName: "quote.opening")
        .font(.largeTitle)
        .foregroundColor(accentColor.opacity(0.5))

      Text(section.content)
        .font(.title3.italic())
        .foregroundColor(.white.opacity(0.9))
        .multilineTextAlignment(.center)

      if let attribution = section.revealContent {
        Text(attribution)
          .font(.caption.bold())
          .foregroundColor(accentColor)
      }
    }
    .padding()
    .background(
      RoundedRectangle(cornerRadius: 16)
        .fill(Color.white.opacity(0.03))
    )
  }

  private var revealView: some View {
    VStack(spacing: 24) {
      // Initial content
      Text(section.content)
        .font(.title3)
        .foregroundColor(.white.opacity(0.9))
        .multilineTextAlignment(.center)

      // Reveal content (animated)
      if showReveal, let revealContent = section.revealContent {
        VStack(spacing: 16) {
          Divider()
            .background(accentColor)

          Text(revealContent)
            .font(.title3.bold())
            .foregroundColor(accentColor)
            .multilineTextAlignment(.center)
            .transition(
              .asymmetric(
                insertion: .scale.combined(with: .opacity),
                removal: .opacity
              ))
        }
        .padding()
        .background(
          RoundedRectangle(cornerRadius: 16)
            .fill(accentColor.opacity(0.1))
            .overlay(
              RoundedRectangle(cornerRadius: 16)
                .stroke(accentColor.opacity(0.3), lineWidth: 2)
            )
        )
      }
    }
    .padding()
  }

  private var comparisonView: some View {
    VStack(spacing: 24) {
      Text(section.content)
        .font(.headline)
        .foregroundColor(.white.opacity(0.7))

      if let comparison = section.comparison {
        HStack(spacing: 16) {
          // Tradition 1
          VStack(spacing: 8) {
            Text(comparison.tradition1)
              .font(.caption.bold())
              .foregroundColor(.white.opacity(0.5))

            Text(comparison.symbol1)
              .font(.subheadline.bold())
              .foregroundColor(.white)
              .multilineTextAlignment(.center)
          }
          .frame(maxWidth: .infinity)
          .padding()
          .background(Color.white.opacity(0.05))
          .cornerRadius(12)

          // Connection arrow
          VStack {
            Image(systemName: "equal")
              .font(.title2)
              .foregroundColor(accentColor)
          }

          // Tradition 2
          VStack(spacing: 8) {
            Text(comparison.tradition2)
              .font(.caption.bold())
              .foregroundColor(.white.opacity(0.5))

            Text(comparison.symbol2)
              .font(.subheadline.bold())
              .foregroundColor(.white)
              .multilineTextAlignment(.center)
          }
          .frame(maxWidth: .infinity)
          .padding()
          .background(Color.white.opacity(0.05))
          .cornerRadius(12)
        }

        // Connection explanation
        Text(comparison.connection)
          .font(.subheadline)
          .foregroundColor(accentColor)
          .multilineTextAlignment(.center)
          .padding()
          .background(
            RoundedRectangle(cornerRadius: 12)
              .fill(accentColor.opacity(0.1))
          )
      }
    }
    .padding()
  }

  private var calendarView: some View {
    VStack(spacing: 16) {
      // Calendar visualization
      Text(section.content)
        .font(.body)
        .foregroundColor(.white.opacity(0.9))
        .multilineTextAlignment(.center)
        .padding()
        .background(
          RoundedRectangle(cornerRadius: 16)
            .fill(Color.white.opacity(0.05))
            .overlay(
              RoundedRectangle(cornerRadius: 16)
                .stroke(accentColor.opacity(0.3), lineWidth: 1)
            )
        )
    }
    .padding()
  }

  private var etymologyView: some View {
    VStack(spacing: 24) {
      // Etymology breakdown with visual
      Text(section.content)
        .font(.title3)
        .foregroundColor(.white.opacity(0.9))
        .multilineTextAlignment(.center)

      if showReveal, let breakdown = section.revealContent {
        VStack(spacing: 16) {
          // Arrow down
          Image(systemName: "arrow.down")
            .font(.title)
            .foregroundColor(accentColor)

          Text(breakdown)
            .font(.title3.bold())
            .foregroundColor(accentColor)
            .multilineTextAlignment(.center)
            .padding()
            .background(
              RoundedRectangle(cornerRadius: 16)
                .fill(accentColor.opacity(0.1))
                .overlay(
                  RoundedRectangle(cornerRadius: 16)
                    .stroke(accentColor, lineWidth: 2)
                )
            )
        }
        .transition(.move(edge: .bottom).combined(with: .opacity))
      }
    }
    .padding()
  }
}

// MARK: - Preview

#Preview {
  SolarTheologyCourseView()
}
