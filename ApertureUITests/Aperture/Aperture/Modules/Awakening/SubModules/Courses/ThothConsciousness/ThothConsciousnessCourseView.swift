// ThothConsciousnessCourseView.swift
// Interactive visualizations for Thoth's consciousness teachings

import SwiftUI

// MARK: - Main Course View

struct ThothConsciousnessCourseView: View {
  let course = ThothConsciousnessCourse.shared
  @State private var selectedLesson: ThothLesson?
  @Environment(\.dismiss) private var dismiss

  var body: some View {
    NavigationStack {
      ZStack {
        // Deep cyan-black gradient
        LinearGradient(
          colors: [
            Color(hex: "#020810"),
            Color(hex: "#041420"),
            Color(hex: "#020810"),
          ],
          startPoint: .top,
          endPoint: .bottom
        )
        .ignoresSafeArea()

        ScrollView(showsIndicators: false) {
          VStack(spacing: 24) {
            courseHeader

            // Animated eye
            ThothEyeHero()
              .frame(height: 180)

            // Modules
            ForEach(course.modules) { module in
              moduleCard(module)
            }

            Spacer(minLength: 100)
          }
          .padding(.horizontal, 20)
        }
      }
      .navigationTitle("Thoth's Teachings")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .topBarLeading) {
          Button {
            dismiss()
          } label: {
            Image(systemName: "xmark")
              .foregroundColor(Palette.text.secondary)
          }
        }
      }
      .sheet(item: $selectedLesson) { lesson in
        ThothLessonDetailView(lesson: lesson, course: course)
      }
    }
  }

  // MARK: - Header

  private var courseHeader: some View {
    VStack(spacing: 12) {
      ZStack {
        Circle()
          .fill(
            RadialGradient(
              colors: [course.color.opacity(0.4), Color.clear],
              center: .center,
              startRadius: 20,
              endRadius: 60
            )
          )
          .frame(width: 120, height: 120)

        Image(systemName: course.icon)
          .font(.system(size: 50))
          .foregroundColor(course.color)
      }

      Text(course.title)
        .font(.system(size: 28, weight: .bold, design: .rounded))
        .foregroundColor(.white)

      Text(course.subtitle)
        .font(.system(size: 15))
        .foregroundColor(Palette.text.secondary)
        .multilineTextAlignment(.center)

      // Stats
      HStack(spacing: 20) {
        statBadge("7", "Modules")
        statBadge("17", "Lessons")
        statBadge("90", "Minutes")
      }
      .padding(.top, 8)
    }
  }

  private func statBadge(_ value: String, _ label: String) -> some View {
    VStack(spacing: 2) {
      Text(value)
        .font(.system(size: 18, weight: .bold, design: .monospaced))
        .foregroundColor(course.color)
      Text(label)
        .font(.system(size: 10, weight: .medium))
        .foregroundColor(Palette.text.muted)
    }
  }

  // MARK: - Module Card

  private func moduleCard(_ module: ThothModule) -> some View {
    VStack(alignment: .leading, spacing: 16) {
      HStack {
        ZStack {
          Circle()
            .fill(course.color.opacity(0.2))
            .frame(width: 40, height: 40)

          Text("\(module.number)")
            .font(.system(size: 16, weight: .black))
            .foregroundColor(course.color)
        }

        VStack(alignment: .leading, spacing: 2) {
          Text("MODULE \(module.number)")
            .font(.system(size: 10, weight: .bold))
            .foregroundColor(Palette.text.muted)
            .tracking(1)

          Text(module.title)
            .font(.system(size: 17, weight: .bold))
            .foregroundColor(.white)
        }

        Spacer()

        Image(systemName: module.icon)
          .font(.system(size: 20))
          .foregroundColor(course.color.opacity(0.6))
      }

      Text(module.subtitle)
        .font(.system(size: 13))
        .foregroundColor(Palette.text.secondary)

      ForEach(module.lessons) { lesson in
        Button {
          selectedLesson = lesson
        } label: {
          HStack(spacing: 12) {
            Circle()
              .fill(course.color.opacity(0.3))
              .frame(width: 8, height: 8)

            Text(lesson.title)
              .font(.system(size: 14, weight: .medium))
              .foregroundColor(.white)
              .lineLimit(1)

            Spacer()

            Image(systemName: "chevron.right")
              .font(.system(size: 12))
              .foregroundColor(Palette.text.muted)
          }
          .padding(.vertical, 10)
          .padding(.horizontal, 12)
          .background(Color.white.opacity(0.03))
          .cornerRadius(8)
        }
      }
    }
    .padding(16)
    .background(
      RoundedRectangle(cornerRadius: 16)
        .fill(course.color.opacity(0.05))
        .overlay(
          RoundedRectangle(cornerRadius: 16)
            .stroke(course.color.opacity(0.2), lineWidth: 1)
        )
    )
  }
}

// MARK: - Lesson Detail View

struct ThothLessonDetailView: View {
  let lesson: ThothLesson
  let course: ThothConsciousnessCourse
  @Environment(\.dismiss) private var dismiss

  var body: some View {
    NavigationStack {
      ZStack {
        Color(hex: "#020810").ignoresSafeArea()

        ScrollView(showsIndicators: false) {
          VStack(spacing: 24) {
            // Visualization
            visualizationView
              .frame(height: 220)

            // Title
            Text(lesson.title)
              .font(.system(size: 24, weight: .bold))
              .foregroundColor(.white)
              .multilineTextAlignment(.center)
              .padding(.horizontal)

            // Content
            Text(LocalizedStringKey(lesson.content))
              .font(.system(size: 15))
              .foregroundColor(Palette.text.primary)
              .lineSpacing(6)
              .padding(.horizontal, 20)

            // Key Insight
            keyInsightCard

            Spacer(minLength: 100)
          }
          .padding(.top, 20)
        }
      }
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .topBarTrailing) {
          Button("Done") { dismiss() }
            .foregroundColor(course.color)
        }
      }
    }
  }

  @ViewBuilder
  private var visualizationView: some View {
    switch lesson.visualType {
    case .consciousnessField:
      ConsciousnessFieldAnimation()
    case .mirrorPrinciple:
      MirrorPrincipleAnimation()
    case .bookChoosesReader:
      BookChoosesReaderAnimation()
    case .blacksmithMetal:
      BlacksmithMetalAnimation()
    case .fourStages:
      FourStagesAnimation()
    case .ambitionVsAspiration:
      AmbitionVsAspirationAnimation()
    case .surrenderPower:
      SurrenderPowerAnimation()
    case .fourSurrenders:
      FourSurrendersAnimation()
    case .rhythmPrinciple:
      RhythmPrincipleAnimation()
    case .innerVision:
      InnerVisionAnimation()
    case .developingVision:
      DevelopingVisionAnimation()
    case .frequencyDial:
      FrequencyDialAnimation()
    case .threeRanges:
      ThreeRangesAnimation()
    case .frequencyShift:
      FrequencyShiftAnimation()
    case .egoParadox:
      EgoParadoxAnimation()
    case .egoTransparency:
      EgoTransparencyAnimation()
    case .unityConsciousness:
      UnityConsciousnessAnimation()
    case .prismConsciousness:
      PrismConsciousnessAnimation()
    case .dailyWisdom:
      DailyWisdomAnimation()
    case .sacredWork:
      SacredWorkAnimation()
    case .findingTribe:
      FindingTribeAnimation()
    case .ultimateTeaching:
      UltimateTeachingAnimation()
    }
  }

  private var keyInsightCard: some View {
    VStack(alignment: .leading, spacing: 12) {
      HStack {
        Image(systemName: "lightbulb.fill")
          .foregroundColor(course.color)
        Text("KEY INSIGHT")
          .font(.system(size: 11, weight: .bold))
          .foregroundColor(course.color)
          .tracking(1)
      }

      Text(lesson.keyInsight)
        .font(.system(size: 15, weight: .medium))
        .foregroundColor(.white)
        .italic()
    }
    .padding(16)
    .frame(maxWidth: .infinity, alignment: .leading)
    .background(
      RoundedRectangle(cornerRadius: 12)
        .fill(course.color.opacity(0.1))
        .overlay(
          RoundedRectangle(cornerRadius: 12)
            .stroke(course.color.opacity(0.3), lineWidth: 1)
        )
    )
    .padding(.horizontal, 20)
  }
}

// MARK: - Thoth Eye Hero

struct ThothEyeHero: View {
  @State private var eyeScale: CGFloat = 0.8
  @State private var irisRotation: Double = 0
  @State private var pulseOpacity: Double = 0.3

  var body: some View {
    ZStack {
      // Outer glow
      Circle()
        .fill(
          RadialGradient(
            colors: [Color.cyan.opacity(pulseOpacity), Color.clear],
            center: .center,
            startRadius: 30,
            endRadius: 80
          )
        )
        .frame(width: 160, height: 160)

      // Eye shape
      Ellipse()
        .fill(Color.white.opacity(0.9))
        .frame(width: 100, height: 60)
        .scaleEffect(eyeScale)

      // Iris
      ZStack {
        Circle()
          .fill(
            RadialGradient(
              colors: [.cyan, Color(hex: "#004466")],
              center: .center,
              startRadius: 0,
              endRadius: 20
            )
          )
          .frame(width: 40, height: 40)

        // Iris patterns
        ForEach(0..<8, id: \.self) { i in
          Rectangle()
            .fill(Color.cyan.opacity(0.5))
            .frame(width: 1, height: 15)
            .offset(y: 10)
            .rotationEffect(.degrees(Double(i) * 45 + irisRotation))
        }

        // Pupil
        Circle()
          .fill(Color.black)
          .frame(width: 15, height: 15)
      }
      .scaleEffect(eyeScale)

      // Text
      VStack {
        Spacer()
        Text("Consciousness is the fabric")
          .font(.system(size: 12, weight: .medium))
          .foregroundColor(.cyan.opacity(0.8))
      }
    }
    .onAppear {
      withAnimation(.easeInOut(duration: 2).repeatForever(autoreverses: true)) {
        eyeScale = 1.0
        pulseOpacity = 0.5
      }
      withAnimation(.linear(duration: 30).repeatForever(autoreverses: false)) {
        irisRotation = 360
      }
    }
  }
}

// MARK: - Consciousness Field Animation

struct ConsciousnessFieldAnimation: View {
  @State private var particles: [FieldParticle] = []
  @State private var fieldPulse: CGFloat = 1.0

  var body: some View {
    ZStack {
      // Field representation
      ForEach(0..<3, id: \.self) { i in
        Circle()
          .stroke(Color.cyan.opacity(0.3 - Double(i) * 0.1), lineWidth: 1)
          .frame(width: CGFloat(80 + i * 40) * fieldPulse)
      }

      // Center - consciousness
      ZStack {
        Circle()
          .fill(Color.cyan.opacity(0.3))
          .frame(width: 50, height: 50)

        Image(systemName: "sparkle")
          .font(.system(size: 24))
          .foregroundColor(.white)
      }

      // Particles (matter emerging)
      ForEach(particles) { particle in
        Circle()
          .fill(Color.white.opacity(0.6))
          .frame(width: 6, height: 6)
          .offset(x: particle.x, y: particle.y)
      }

      // Labels
      VStack {
        Spacer()
        HStack(spacing: 30) {
          VStack {
            Circle()
              .fill(Color.cyan)
              .frame(width: 8, height: 8)
            Text("Consciousness")
              .font(.system(size: 9))
              .foregroundColor(.gray)
          }

          Text("→")
            .foregroundColor(.gray)

          VStack {
            Circle()
              .fill(Color.white.opacity(0.6))
              .frame(width: 8, height: 8)
            Text("Matter")
              .font(.system(size: 9))
              .foregroundColor(.gray)
          }
        }
      }
    }
    .onAppear {
      generateParticles()
      withAnimation(.easeInOut(duration: 2).repeatForever(autoreverses: true)) {
        fieldPulse = 1.2
      }
    }
  }

  private func generateParticles() {
    for i in 0..<12 {
      let angle = Double(i) * 30 * .pi / 180
      let radius = CGFloat.random(in: 50...80)
      particles.append(
        FieldParticle(
          id: i,
          x: cos(angle) * radius,
          y: sin(angle) * radius
        ))
    }
  }
}

struct FieldParticle: Identifiable {
  let id: Int
  let x: CGFloat
  let y: CGFloat
}

// MARK: - Mirror Principle Animation

struct MirrorPrincipleAnimation: View {
  @State private var innerState: InnerState = .fear

  enum InnerState: String, CaseIterable {
    case fear = "Fear"
    case neutral = "Neutral"
    case love = "Love"

    var color: Color {
      switch self {
      case .fear: return .red
      case .neutral: return .gray
      case .love: return .green
      }
    }

    var outerReflection: String {
      switch self {
      case .fear: return "Threats everywhere"
      case .neutral: return "Mixed signals"
      case .love: return "Opportunities flow"
      }
    }
  }

  var body: some View {
    VStack(spacing: 20) {
      HStack(spacing: 40) {
        // Inner state
        VStack(spacing: 8) {
          ZStack {
            Circle()
              .fill(innerState.color.opacity(0.3))
              .frame(width: 60, height: 60)

            Image(systemName: "person.fill")
              .font(.system(size: 24))
              .foregroundColor(innerState.color)
          }

          Text("Inner State")
            .font(.system(size: 10, weight: .bold))
            .foregroundColor(.gray)

          Text(innerState.rawValue)
            .font(.system(size: 12, weight: .medium))
            .foregroundColor(innerState.color)
        }

        // Mirror line
        VStack {
          Text("=")
            .font(.system(size: 24, weight: .bold))
            .foregroundColor(.cyan)

          Text("mirrors")
            .font(.system(size: 9))
            .foregroundColor(.gray)
        }

        // Outer reflection
        VStack(spacing: 8) {
          ZStack {
            Circle()
              .fill(innerState.color.opacity(0.3))
              .frame(width: 60, height: 60)

            Image(systemName: "globe.americas.fill")
              .font(.system(size: 24))
              .foregroundColor(innerState.color)
          }

          Text("Outer Reality")
            .font(.system(size: 10, weight: .bold))
            .foregroundColor(.gray)

          Text(innerState.outerReflection)
            .font(.system(size: 10, weight: .medium))
            .foregroundColor(innerState.color)
            .multilineTextAlignment(.center)
        }
      }

      // State selector
      HStack(spacing: 8) {
        ForEach(InnerState.allCases, id: \.self) { state in
          Button {
            withAnimation(.spring()) { innerState = state }
          } label: {
            Text(state.rawValue)
              .font(.system(size: 11, weight: innerState == state ? .bold : .medium))
              .foregroundColor(innerState == state ? .white : .gray)
              .padding(.horizontal, 12)
              .padding(.vertical, 6)
              .background(
                Capsule().fill(innerState == state ? state.color : Color.white.opacity(0.1)))
          }
        }
      }
    }
  }
}

// MARK: - Book Chooses Reader Animation

struct BookChoosesReaderAnimation: View {
  @State private var bookGlow: Double = 0.3
  @State private var readerReady: Bool = false

  var body: some View {
    VStack(spacing: 20) {
      HStack(spacing: 40) {
        // Book
        ZStack {
          Circle()
            .fill(Color.cyan.opacity(bookGlow))
            .frame(width: 70, height: 70)

          Image(systemName: "book.closed.fill")
            .font(.system(size: 30))
            .foregroundColor(readerReady ? .cyan : .gray)
        }

        // Connection
        VStack {
          Image(systemName: readerReady ? "arrow.right" : "xmark")
            .font(.system(size: 20, weight: .bold))
            .foregroundColor(readerReady ? .green : .red)

          Text(readerReady ? "Visible" : "Invisible")
            .font(.system(size: 9))
            .foregroundColor(readerReady ? .green : .red)
        }

        // Reader
        ZStack {
          Circle()
            .fill((readerReady ? Color.green : Color.gray).opacity(0.3))
            .frame(width: 70, height: 70)

          Image(systemName: "person.fill")
            .font(.system(size: 30))
            .foregroundColor(readerReady ? .green : .gray)
        }
      }

      Text(
        readerReady
          ? "Consciousness aligned → Teaching appears" : "Not ready → Teaching remains hidden"
      )
      .font(.system(size: 12, weight: .medium))
      .foregroundColor(readerReady ? .green : .orange)

      Button {
        withAnimation(.spring()) { readerReady.toggle() }
      } label: {
        Text(readerReady ? "Show Unready" : "Show Ready")
          .font(.system(size: 12, weight: .semibold))
          .foregroundColor(.white)
          .padding(.horizontal, 16)
          .padding(.vertical, 8)
          .background(Capsule().fill(Color.cyan.opacity(0.3)))
      }
    }
    .onAppear {
      withAnimation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true)) {
        bookGlow = 0.6
      }
    }
  }
}

// MARK: - Frequency Dial Animation

struct FrequencyDialAnimation: View {
  @State private var frequency: Double = 0.3

  var frequencyLabel: String {
    if frequency < 0.33 { return "Survival" }
    if frequency < 0.66 { return "Transitional" }
    return "Mastery"
  }

  var frequencyColor: Color {
    if frequency < 0.33 { return .red }
    if frequency < 0.66 { return .orange }
    return .green
  }

  var body: some View {
    VStack(spacing: 20) {
      // Dial
      ZStack {
        // Background arc
        Circle()
          .trim(from: 0.25, to: 0.75)
          .stroke(Color.white.opacity(0.1), lineWidth: 20)
          .frame(width: 120, height: 120)
          .rotationEffect(.degrees(90))

        // Gradient arc
        Circle()
          .trim(from: 0.25, to: 0.25 + frequency * 0.5)
          .stroke(
            LinearGradient(
              colors: [.red, .orange, .green],
              startPoint: .leading,
              endPoint: .trailing
            ),
            style: StrokeStyle(lineWidth: 20, lineCap: .round)
          )
          .frame(width: 120, height: 120)
          .rotationEffect(.degrees(90))

        // Needle
        Rectangle()
          .fill(Color.white)
          .frame(width: 3, height: 40)
          .offset(y: -20)
          .rotationEffect(.degrees(-90 + frequency * 180))

        // Center
        Circle()
          .fill(Color.white)
          .frame(width: 15, height: 15)

        // Label
        VStack {
          Text(frequencyLabel)
            .font(.system(size: 14, weight: .bold))
            .foregroundColor(frequencyColor)
        }
        .offset(y: 50)
      }

      // Slider
      VStack(spacing: 4) {
        Text("Adjust Frequency")
          .font(.system(size: 10))
          .foregroundColor(.gray)

        Slider(value: $frequency, in: 0...1)
          .accentColor(frequencyColor)
          .frame(width: 160)
      }
    }
  }
}

// MARK: - Three Ranges Animation

struct ThreeRangesAnimation: View {
  var body: some View {
    VStack(spacing: 16) {
      // Survival
      frequencyRow(
        name: "Survival",
        color: .red,
        icon: "exclamationmark.triangle.fill",
        attributes: ["Fear", "Scarcity", "Threat Detection"],
        experience: "Fighting for everything"
      )

      // Transitional
      frequencyRow(
        name: "Transitional",
        color: .orange,
        icon: "arrow.triangle.2.circlepath",
        attributes: ["Hope", "Curiosity", "Openness"],
        experience: "Noticing possibilities"
      )

      // Mastery
      frequencyRow(
        name: "Mastery",
        color: .green,
        icon: "sparkles",
        attributes: ["Love", "Gratitude", "Unity"],
        experience: "Creating reality"
      )
    }
    .padding(.horizontal)
  }

  private func frequencyRow(
    name: String, color: Color, icon: String, attributes: [String], experience: String
  ) -> some View {
    HStack(spacing: 12) {
      ZStack {
        Circle()
          .fill(color.opacity(0.2))
          .frame(width: 40, height: 40)

        Image(systemName: icon)
          .foregroundColor(color)
      }

      VStack(alignment: .leading, spacing: 2) {
        Text(name)
          .font(.system(size: 13, weight: .bold))
          .foregroundColor(color)

        Text(attributes.joined(separator: " • "))
          .font(.system(size: 9))
          .foregroundColor(.gray)

        Text(experience)
          .font(.system(size: 10, weight: .medium))
          .foregroundColor(.white.opacity(0.7))
      }

      Spacer()
    }
    .padding(10)
    .background(RoundedRectangle(cornerRadius: 10).fill(color.opacity(0.1)))
  }
}

// MARK: - Unity Consciousness Animation

struct UnityConsciousnessAnimation: View {
  @State private var connectionOpacity: Double = 0.3
  @State private var pulseScale: CGFloat = 1.0

  var body: some View {
    VStack(spacing: 16) {
      ZStack {
        // Central consciousness
        Circle()
          .fill(
            RadialGradient(
              colors: [.cyan, Color.cyan.opacity(0.1)],
              center: .center,
              startRadius: 0,
              endRadius: 80
            )
          )
          .frame(width: 160, height: 160)
          .scaleEffect(pulseScale)

        // Individual expressions
        ForEach(0..<6, id: \.self) { i in
          let angle = Double(i) * 60 * .pi / 180
          let x = cos(angle) * 60
          let y = sin(angle) * 60

          // Connection line
          Path { path in
            path.move(to: CGPoint(x: 80, y: 80))
            path.addLine(to: CGPoint(x: 80 + x, y: 80 + y))
          }
          .stroke(Color.cyan.opacity(connectionOpacity), lineWidth: 1)

          // Individual point
          Circle()
            .fill(Color.white)
            .frame(width: 12, height: 12)
            .offset(x: x, y: y)
        }

        // Center label
        Text("ONE")
          .font(.system(size: 16, weight: .black, design: .rounded))
          .foregroundColor(.white)
      }
      .frame(width: 160, height: 160)

      Text("Individual consciousness = Universal consciousness")
        .font(.system(size: 11, weight: .medium))
        .foregroundColor(.cyan)

      Text("experiencing itself through unique focal points")
        .font(.system(size: 10))
        .foregroundColor(.gray)
    }
    .onAppear {
      withAnimation(.easeInOut(duration: 2).repeatForever(autoreverses: true)) {
        connectionOpacity = 0.8
        pulseScale = 1.1
      }
    }
  }
}

// MARK: - Prism Consciousness Animation

struct PrismConsciousnessAnimation: View {
  @State private var showSpectrum = false

  var body: some View {
    VStack(spacing: 16) {
      ZStack {
        // White light (universal consciousness)
        if !showSpectrum {
          Rectangle()
            .fill(Color.white)
            .frame(width: 4, height: 50)
            .offset(x: -60, y: -20)
        }

        // Prism
        Triangle()
          .fill(
            LinearGradient(
              colors: [Color.white.opacity(0.3), Color.white.opacity(0.1)],
              startPoint: .top,
              endPoint: .bottom
            )
          )
          .frame(width: 60, height: 60)
          .overlay(
            Triangle()
              .stroke(Color.white.opacity(0.5), lineWidth: 1)
          )

        // Spectrum (individual expressions)
        if showSpectrum {
          ForEach(0..<7, id: \.self) { i in
            Rectangle()
              .fill(spectrumColor(i))
              .frame(width: 3, height: 50)
              .rotationEffect(.degrees(Double(i - 3) * 5))
              .offset(x: 50 + CGFloat(i) * 8, y: CGFloat(i - 3) * 8)
          }
        }
      }
      .frame(height: 100)

      HStack(spacing: 30) {
        VStack {
          Circle()
            .fill(Color.white)
            .frame(width: 12, height: 12)
          Text("One Light")
            .font(.system(size: 9))
            .foregroundColor(.gray)
        }

        Image(systemName: "arrow.right")
          .foregroundColor(.gray)

        VStack {
          HStack(spacing: 2) {
            ForEach(0..<5, id: \.self) { i in
              Circle()
                .fill(spectrumColor(i))
                .frame(width: 8, height: 8)
            }
          }
          Text("Many Colors")
            .font(.system(size: 9))
            .foregroundColor(.gray)
        }
      }

      Button {
        withAnimation(.spring()) { showSpectrum.toggle() }
      } label: {
        Text(showSpectrum ? "Show Unity" : "Show Diversity")
          .font(.system(size: 12, weight: .semibold))
          .foregroundColor(.white)
          .padding(.horizontal, 16)
          .padding(.vertical, 8)
          .background(Capsule().fill(Color.cyan.opacity(0.3)))
      }
    }
  }

  private func spectrumColor(_ index: Int) -> Color {
    let colors: [Color] = [.red, .orange, .yellow, .green, .cyan, .blue, .purple]
    return colors[index % colors.count]
  }
}

struct Triangle: Shape {
  func path(in rect: CGRect) -> Path {
    var path = Path()
    path.move(to: CGPoint(x: rect.midX, y: rect.minY))
    path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
    path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
    path.closeSubpath()
    return path
  }
}

// MARK: - Placeholder Animations (simplified versions)

struct BlacksmithMetalAnimation: View {
  @State private var isForcing = true

  var body: some View {
    VStack(spacing: 16) {
      HStack(spacing: 40) {
        VStack {
          Image(systemName: "hammer.fill")
            .font(.system(size: 30))
            .foregroundColor(isForcing ? .red : .green)
          Text(isForcing ? "Forcing" : "Flowing")
            .font(.system(size: 11, weight: .bold))
            .foregroundColor(isForcing ? .red : .green)
        }

        VStack {
          Image(systemName: isForcing ? "xmark.circle.fill" : "checkmark.circle.fill")
            .font(.system(size: 30))
            .foregroundColor(isForcing ? .red : .green)
          Text(isForcing ? "Cracks" : "Strength")
            .font(.system(size: 11))
            .foregroundColor(.gray)
        }
      }

      Button {
        withAnimation { isForcing.toggle() }
      } label: {
        Text(isForcing ? "Try Surrender" : "Try Force")
          .font(.system(size: 12, weight: .semibold))
          .foregroundColor(.white)
          .padding(.horizontal, 16)
          .padding(.vertical, 8)
          .background(Capsule().fill(Color.cyan.opacity(0.3)))
      }
    }
  }
}

struct FourStagesAnimation: View {
  var body: some View {
    HStack(spacing: 8) {
      ForEach(["Dissolution", "Humility", "Stillness", "Receiving"], id: \.self) { stage in
        VStack(spacing: 6) {
          Circle()
            .fill(Color.cyan.opacity(0.3))
            .frame(width: 40, height: 40)
            .overlay(
              Text(
                "\(["Dissolution", "Humility", "Stillness", "Receiving"].firstIndex(of: stage)! + 1)"
              )
              .font(.system(size: 14, weight: .bold))
              .foregroundColor(.cyan)
            )

          Text(stage)
            .font(.system(size: 8, weight: .medium))
            .foregroundColor(.gray)
            .multilineTextAlignment(.center)
        }
      }
    }
  }
}

struct AmbitionVsAspirationAnimation: View {
  var body: some View {
    HStack(spacing: 30) {
      VStack(spacing: 8) {
        Image(systemName: "trophy.fill")
          .font(.system(size: 30))
          .foregroundColor(.red)
        Text("Ambition")
          .font(.system(size: 12, weight: .bold))
          .foregroundColor(.red)
        Text("Ego-driven\nForced\nExhausting")
          .font(.system(size: 9))
          .foregroundColor(.gray)
          .multilineTextAlignment(.center)
      }

      Text("vs")
        .font(.system(size: 14, weight: .bold))
        .foregroundColor(.gray)

      VStack(spacing: 8) {
        Image(systemName: "leaf.fill")
          .font(.system(size: 30))
          .foregroundColor(.green)
        Text("Aspiration")
          .font(.system(size: 12, weight: .bold))
          .foregroundColor(.green)
        Text("Soul-aligned\nNatural\nEnergizing")
          .font(.system(size: 9))
          .foregroundColor(.gray)
          .multilineTextAlignment(.center)
      }
    }
  }
}

struct SurrenderPowerAnimation: View {
  @State private var gripTight = true

  var body: some View {
    VStack(spacing: 16) {
      HStack(spacing: 30) {
        VStack {
          Image(systemName: gripTight ? "hand.raised.fill" : "hand.wave.fill")
            .font(.system(size: 40))
            .foregroundColor(gripTight ? .red : .green)

          Text(gripTight ? "Grip Tight" : "Release")
            .font(.system(size: 12, weight: .bold))
            .foregroundColor(gripTight ? .red : .green)
        }

        VStack {
          Image(systemName: gripTight ? "xmark" : "checkmark")
            .font(.system(size: 30, weight: .bold))
            .foregroundColor(gripTight ? .red : .green)

          Text(gripTight ? "Blocked" : "Flows")
            .font(.system(size: 11))
            .foregroundColor(.gray)
        }
      }

      Button {
        withAnimation { gripTight.toggle() }
      } label: {
        Text(gripTight ? "Surrender" : "Grip")
          .font(.system(size: 12, weight: .semibold))
          .foregroundColor(.white)
          .padding(.horizontal, 16)
          .padding(.vertical, 8)
          .background(Capsule().fill(Color.cyan.opacity(0.3)))
      }
    }
  }
}

struct FourSurrendersAnimation: View {
  var body: some View {
    VStack(spacing: 8) {
      HStack(spacing: 12) {
        surrenderItem("Outcomes", "target", .blue)
        surrenderItem("Timing", "clock", .orange)
      }
      HStack(spacing: 12) {
        surrenderItem("Methods", "road.lanes", .purple)
        surrenderItem("Identity", "person.fill.questionmark", .cyan)
      }
    }
  }

  private func surrenderItem(_ title: String, _ icon: String, _ color: Color) -> some View {
    VStack(spacing: 4) {
      Image(systemName: icon)
        .font(.system(size: 20))
        .foregroundColor(color)
      Text(title)
        .font(.system(size: 10, weight: .medium))
        .foregroundColor(.gray)
    }
    .frame(width: 80, height: 60)
    .background(RoundedRectangle(cornerRadius: 8).fill(color.opacity(0.1)))
  }
}

struct RhythmPrincipleAnimation: View {
  @State private var phase: CGFloat = 0

  var body: some View {
    VStack(spacing: 16) {
      // Wave
      GeometryReader { geo in
        Path { path in
          let width = geo.size.width
          let height = geo.size.height
          let midY = height / 2

          path.move(to: CGPoint(x: 0, y: midY))

          for x in stride(from: 0, to: width, by: 2) {
            let normalizedX = x / width
            let y = midY + sin((normalizedX + phase) * .pi * 4) * 30
            path.addLine(to: CGPoint(x: x, y: y))
          }
        }
        .stroke(Color.cyan, lineWidth: 2)
      }
      .frame(height: 80)

      Text("Everything flows in cycles")
        .font(.system(size: 12, weight: .medium))
        .foregroundColor(.cyan)

      Text("Action ↔ Rest • Expansion ↔ Contraction")
        .font(.system(size: 10))
        .foregroundColor(.gray)
    }
    .onAppear {
      withAnimation(.linear(duration: 3).repeatForever(autoreverses: false)) {
        phase = 1
      }
    }
  }
}

struct InnerVisionAnimation: View {
  @State private var showInner = false

  var body: some View {
    VStack(spacing: 16) {
      ZStack {
        // Outer layer (effects)
        Circle()
          .fill(Color.gray.opacity(0.3))
          .frame(width: 100, height: 100)

        // Inner layer (causes) - revealed
        if showInner {
          Circle()
            .fill(
              RadialGradient(
                colors: [.cyan, .purple],
                center: .center,
                startRadius: 0,
                endRadius: 40
              )
            )
            .frame(width: 80, height: 80)
        }

        // Eye
        Image(systemName: showInner ? "eye.fill" : "eye.slash.fill")
          .font(.system(size: 30))
          .foregroundColor(showInner ? .cyan : .gray)
      }

      Text(showInner ? "Inner Vision: See causes" : "Physical Sight: See effects")
        .font(.system(size: 12, weight: .medium))
        .foregroundColor(showInner ? .cyan : .gray)

      Button {
        withAnimation { showInner.toggle() }
      } label: {
        Text(showInner ? "Physical Sight" : "Inner Vision")
          .font(.system(size: 12, weight: .semibold))
          .foregroundColor(.white)
          .padding(.horizontal, 16)
          .padding(.vertical, 8)
          .background(Capsule().fill(Color.cyan.opacity(0.3)))
      }
    }
  }
}

struct DevelopingVisionAnimation: View {
  var body: some View {
    VStack(spacing: 12) {
      Image(systemName: "eye.trianglebadge.exclamationmark")
        .font(.system(size: 40))
        .foregroundColor(.cyan)

      Text("Contemplative Gazing")
        .font(.system(size: 14, weight: .bold))
        .foregroundColor(.white)

      VStack(alignment: .leading, spacing: 4) {
        gazeStep("1", "Select natural object")
        gazeStep("2", "Soft, receptive attention")
        gazeStep("3", "Don't seek—allow")
      }
    }
  }

  private func gazeStep(_ num: String, _ text: String) -> some View {
    HStack(spacing: 8) {
      Text(num)
        .font(.system(size: 10, weight: .bold))
        .foregroundColor(.cyan)
      Text(text)
        .font(.system(size: 11))
        .foregroundColor(.gray)
    }
  }
}

struct FrequencyShiftAnimation: View {
  var body: some View {
    VStack(spacing: 12) {
      Text("Frequency Shift ≠ Thinking")
        .font(.system(size: 14, weight: .bold))
        .foregroundColor(.cyan)

      HStack(spacing: 20) {
        VStack {
          Image(systemName: "brain.head.profile")
            .font(.system(size: 24))
            .foregroundColor(.red)
          Text("Mental effort")
            .font(.system(size: 9))
            .foregroundColor(.gray)
          Text("Same frequency")
            .font(.system(size: 8, weight: .medium))
            .foregroundColor(.red)
        }

        VStack {
          Image(systemName: "figure.mind.and.body")
            .font(.system(size: 24))
            .foregroundColor(.green)
          Text("Embodied practice")
            .font(.system(size: 9))
            .foregroundColor(.gray)
          Text("Frequency shifts")
            .font(.system(size: 8, weight: .medium))
            .foregroundColor(.green)
        }
      }
    }
  }
}

struct EgoParadoxAnimation: View {
  @State private var egoSeeking = true

  var body: some View {
    VStack(spacing: 16) {
      ZStack {
        Circle()
          .stroke(egoSeeking ? Color.red.opacity(0.5) : Color.green.opacity(0.5), lineWidth: 3)
          .frame(width: 80, height: 80)

        Image(systemName: "person.fill")
          .font(.system(size: 30))
          .foregroundColor(egoSeeking ? .red : .green)
      }

      Text(egoSeeking ? "Ego seeking power = blocked" : "Simple awareness = flows")
        .font(.system(size: 12, weight: .medium))
        .foregroundColor(egoSeeking ? .red : .green)

      Button {
        withAnimation { egoSeeking.toggle() }
      } label: {
        Text(egoSeeking ? "Release" : "Ego Seek")
          .font(.system(size: 12, weight: .semibold))
          .foregroundColor(.white)
          .padding(.horizontal, 16)
          .padding(.vertical, 8)
          .background(Capsule().fill(Color.cyan.opacity(0.3)))
      }
    }
  }
}

struct EgoTransparencyAnimation: View {
  @State private var transparency: Double = 0.8

  var body: some View {
    VStack(spacing: 16) {
      ZStack {
        // Light behind
        Circle()
          .fill(Color.cyan)
          .frame(width: 60, height: 60)

        // Ego layer
        Circle()
          .fill(Color.black.opacity(transparency))
          .frame(width: 80, height: 80)

        // Person
        Image(systemName: "person.fill")
          .font(.system(size: 30))
          .foregroundColor(.white.opacity(1 - transparency + 0.2))
      }

      Text("Ego Transparency: \(Int((1 - transparency) * 100))%")
        .font(.system(size: 12, weight: .medium))
        .foregroundColor(.cyan)

      Slider(value: $transparency, in: 0...1)
        .accentColor(.cyan)
        .frame(width: 150)
    }
  }
}

// MARK: - Module 8 Animations

struct DailyWisdomAnimation: View {
  @State private var glowPhase: Double = 0

  var body: some View {
    ZStack {
      // Sun rays
      ForEach(0..<8, id: \.self) { i in
        Rectangle()
          .fill(
            LinearGradient(
              colors: [.yellow.opacity(0.8), .orange.opacity(0.3)], startPoint: .bottom,
              endPoint: .top)
          )
          .frame(width: 4, height: 60)
          .offset(y: -50)
          .rotationEffect(.degrees(Double(i) * 45))
          .opacity(0.6 + sin(glowPhase + Double(i) * 0.5) * 0.4)
      }

      // Central sun
      Circle()
        .fill(
          RadialGradient(
            colors: [.yellow, .orange], center: .center, startRadius: 0, endRadius: 30)
        )
        .frame(width: 60, height: 60)
        .shadow(color: .yellow.opacity(0.5), radius: 20)

      // Book icon
      Image(systemName: "book.closed.fill")
        .font(.system(size: 24))
        .foregroundColor(.white)
    }
    .onAppear {
      withAnimation(.linear(duration: 3).repeatForever(autoreverses: false)) {
        glowPhase = .pi * 2
      }
    }
  }
}

struct SacredWorkAnimation: View {
  @State private var hammerRotation: Double = 0
  @State private var sparkOpacity: Double = 0

  var body: some View {
    ZStack {
      // Anvil
      Image(systemName: "square.fill")
        .font(.system(size: 40))
        .foregroundColor(.gray)
        .offset(y: 20)

      // Hammer
      Image(systemName: "hammer.fill")
        .font(.system(size: 30))
        .foregroundColor(.orange)
        .rotationEffect(.degrees(hammerRotation), anchor: .bottom)
        .offset(y: -20)

      // Sparks
      ForEach(0..<5, id: \.self) { _ in
        Circle()
          .fill(.yellow)
          .frame(width: 4, height: 4)
          .offset(x: CGFloat.random(in: -20...20), y: CGFloat.random(in: -10...10))
          .opacity(sparkOpacity)
      }
    }
    .onAppear {
      withAnimation(.easeInOut(duration: 0.5).repeatForever(autoreverses: true)) {
        hammerRotation = -30
      }
      withAnimation(.easeInOut(duration: 0.25).repeatForever(autoreverses: true).delay(0.25)) {
        sparkOpacity = 1
      }
    }
  }
}

struct FindingTribeAnimation: View {
  @State private var pulseScale: CGFloat = 1

  var body: some View {
    ZStack {
      // Connection lines
      ForEach(0..<5, id: \.self) { i in
        Path { path in
          let angle = Double(i) * 72 * .pi / 180
          path.move(to: CGPoint(x: 75, y: 75))
          path.addLine(
            to: CGPoint(
              x: 75 + cos(angle) * 50,
              y: 75 + sin(angle) * 50
            ))
        }
        .stroke(.cyan.opacity(0.5), lineWidth: 2)
      }

      // Central person
      Image(systemName: "person.fill")
        .font(.system(size: 30))
        .foregroundColor(.cyan)
        .scaleEffect(pulseScale)

      // Surrounding people
      ForEach(0..<5, id: \.self) { i in
        Image(systemName: "person.fill")
          .font(.system(size: 20))
          .foregroundColor(.cyan.opacity(0.7))
          .offset(
            x: cos(Double(i) * 72 * .pi / 180) * 50,
            y: sin(Double(i) * 72 * .pi / 180) * 50
          )
      }
    }
    .frame(width: 150, height: 150)
    .onAppear {
      withAnimation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true)) {
        pulseScale = 1.2
      }
    }
  }
}

struct UltimateTeachingAnimation: View {
  @State private var infinityPhase: CGFloat = 0

  var body: some View {
    ZStack {
      // Infinity symbol glow
      Image(systemName: "infinity")
        .font(.system(size: 60, weight: .light))
        .foregroundStyle(
          LinearGradient(
            colors: [.purple, .cyan, .purple],
            startPoint: UnitPoint(x: infinityPhase, y: 0.5),
            endPoint: UnitPoint(x: infinityPhase + 1, y: 0.5)
          )
        )
        .shadow(color: .purple.opacity(0.5), radius: 10)

      // Eye of wisdom
      Image(systemName: "eye.fill")
        .font(.system(size: 20))
        .foregroundColor(.white)
    }
    .onAppear {
      withAnimation(.linear(duration: 3).repeatForever(autoreverses: false)) {
        infinityPhase = 1
      }
    }
  }
}

#Preview {
  ThothConsciousnessCourseView()
}
