// SolarSovereigntyCourseView.swift
// Interactive visualizations for circadian rhythm and solar alignment

import SwiftUI

// MARK: - Main Course View

struct SolarSovereigntyCourseView: View {
  let course = SolarSovereigntyCourse.shared
  @State private var selectedLesson: SolarLesson?
  @ObservedObject var streakManager = StreakManager.shared
  @Environment(\.dismiss) private var dismiss

  var body: some View {
    NavigationStack {
      ZStack {
        // Warm solar gradient
        LinearGradient(
          colors: [
            Color(hex: "#1a0f00"),
            Color(hex: "#2a1a0a"),
            Color(hex: "#1a0f00"),
          ],
          startPoint: .top,
          endPoint: .bottom
        )
        .ignoresSafeArea()

        ScrollView(showsIndicators: false) {
          VStack(spacing: 24) {
            courseHeader

            // Daily Practice Streak Card
            solarStreakCard

            // Animated sun
            SunriseHero()
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
      .navigationTitle("Solar Sovereignty")
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

        ToolbarItem(placement: .topBarTrailing) {
          // Streak badge
          MiniStreakBadge(practiceId: "solar_sovereignty")
        }
      }
      .sheet(item: $selectedLesson) { lesson in
        SolarLessonDetailView(lesson: lesson, course: course)
      }
    }
  }

  // MARK: - Solar Streak Card

  private var solarStreakCard: some View {
    let streak = streakManager.streak(for: "solar_sovereignty")

    return VStack(spacing: 12) {
      HStack {
        VStack(alignment: .leading, spacing: 4) {
          Text("DAILY SUNRISE RITUAL")
            .font(.system(size: 10, weight: .bold))
            .foregroundColor(.orange.opacity(0.7))
            .tracking(1)

          Text("60 seconds to sovereignty")
            .font(.system(size: 14, weight: .medium))
            .foregroundColor(.white)
        }

        Spacer()

        // Streak display
        VStack(alignment: .trailing, spacing: 2) {
          HStack(spacing: 4) {
            Image(systemName: "flame.fill")
              .foregroundColor((streak?.currentStreak ?? 0) > 0 ? .orange : .gray)
            Text("\(streak?.currentStreak ?? 0)")
              .font(.system(size: 20, weight: .bold, design: .rounded))
              .foregroundColor((streak?.currentStreak ?? 0) > 0 ? .orange : .gray)
          }
          Text("day streak")
            .font(.system(size: 9))
            .foregroundColor(.white.opacity(0.4))
        }
      }

      // Week view
      HStack(spacing: 6) {
        ForEach(0..<7, id: \.self) { i in
          let date = Calendar.current.date(byAdding: .day, value: -(6 - i), to: Date()) ?? Date()
          let completed =
            streak?.completionHistory.contains { Calendar.current.isDate($0, inSameDayAs: date) }
            ?? false

          VStack(spacing: 4) {
            ZStack {
              Circle()
                .fill(completed ? Color.orange : Color.white.opacity(0.1))
                .frame(width: 32, height: 32)

              if completed {
                Image(systemName: "sun.max.fill")
                  .font(.system(size: 14))
                  .foregroundColor(.white)
              }
            }

            Text(dayLabel(for: date))
              .font(.system(size: 8, weight: .medium))
              .foregroundColor(.white.opacity(0.4))
          }
        }
      }

      // Complete button
      if !(streak?.isCompletedToday ?? false) {
        Button {
          streakManager.logCompletion(for: "solar_sovereignty")
        } label: {
          HStack {
            Image(systemName: "sun.max.fill")
            Text("Mark Today's Ritual Complete")
              .font(.system(size: 14, weight: .semibold))
          }
          .foregroundColor(.black)
          .frame(maxWidth: .infinity)
          .padding(.vertical, 12)
          .background(
            RoundedRectangle(cornerRadius: 10)
              .fill(Color.orange)
          )
        }
      } else {
        HStack {
          Image(systemName: "checkmark.seal.fill")
            .foregroundColor(.green)
          Text("Today's ritual complete!")
            .font(.system(size: 14, weight: .medium))
            .foregroundColor(.green)
        }
        .padding(.vertical, 8)
      }
    }
    .padding(16)
    .background(
      RoundedRectangle(cornerRadius: 16)
        .fill(Color.orange.opacity(0.1))
        .overlay(
          RoundedRectangle(cornerRadius: 16)
            .stroke(Color.orange.opacity(0.3), lineWidth: 1)
        )
    )
  }

  private func dayLabel(for date: Date) -> String {
    let calendar = Calendar.current
    if calendar.isDateInToday(date) { return "Today" }

    let formatter = DateFormatter()
    formatter.dateFormat = "EEE"
    return String(formatter.string(from: date).prefix(1))
  }

  // MARK: - Header

  private var courseHeader: some View {
    VStack(spacing: 12) {
      ZStack {
        Circle()
          .fill(
            RadialGradient(
              colors: [Color.orange.opacity(0.5), Color.clear],
              center: .center,
              startRadius: 20,
              endRadius: 60
            )
          )
          .frame(width: 120, height: 120)

        Image(systemName: course.icon)
          .font(.system(size: 50))
          .foregroundColor(.orange)
      }

      Text(course.title)
        .font(.system(size: 28, weight: .bold, design: .rounded))
        .foregroundColor(.white)

      Text(course.subtitle)
        .font(.system(size: 15))
        .foregroundColor(Palette.text.secondary)
    }
  }

  // MARK: - Module Card

  private func moduleCard(_ module: SolarModule) -> some View {
    VStack(alignment: .leading, spacing: 16) {
      HStack {
        ZStack {
          Circle()
            .fill(Color.orange.opacity(0.2))
            .frame(width: 40, height: 40)

          Text("\(module.number)")
            .font(.system(size: 16, weight: .black))
            .foregroundColor(.orange)
        }

        VStack(alignment: .leading, spacing: 2) {
          Text("GATE \(module.number)")
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
          .foregroundColor(.orange.opacity(0.6))
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
              .fill(Color.orange.opacity(0.3))
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
        .fill(Color.orange.opacity(0.05))
        .overlay(
          RoundedRectangle(cornerRadius: 16)
            .stroke(Color.orange.opacity(0.2), lineWidth: 1)
        )
    )
  }
}

// MARK: - Lesson Detail View

struct SolarLessonDetailView: View {
  let lesson: SolarLesson
  let course: SolarSovereigntyCourse
  @Environment(\.dismiss) private var dismiss

  var body: some View {
    NavigationStack {
      ZStack {
        Color(hex: "#1a0f00").ignoresSafeArea()

        ScrollView(showsIndicators: false) {
          VStack(spacing: 24) {
            // Visualization
            visualizationView
              .frame(height: 280)

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
          Button("Done") {
            dismiss()
          }
          .foregroundColor(.orange)
        }
      }
    }
  }

  @ViewBuilder
  private var visualizationView: some View {
    switch lesson.visualType {
    case .circadianOverview:
      CircadianSystemDiagram()
    case .twoProcessModel:
      TwoProcessModelView()
    case .clockGenes:
      ClockGenesView()
    case .egyptianSolar:
      EgyptianSolarView()
    case .pinealGland:
      PinealGlandView()
    case .dailyPractice:
      DailyPracticeView()
    }
  }

  private var keyInsightCard: some View {
    VStack(alignment: .leading, spacing: 12) {
      HStack {
        Image(systemName: "sun.max.fill")
          .foregroundColor(.orange)
        Text("KEY INSIGHT")
          .font(.system(size: 11, weight: .bold))
          .foregroundColor(.orange)
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
        .fill(Color.orange.opacity(0.1))
        .overlay(
          RoundedRectangle(cornerRadius: 12)
            .stroke(Color.orange.opacity(0.3), lineWidth: 1)
        )
    )
    .padding(.horizontal, 20)
  }
}

// MARK: - Sunrise Hero Animation

struct SunriseHero: View {
  @State private var sunPosition: CGFloat = 0
  @State private var rayRotation: Double = 0

  var body: some View {
    ZStack {
      // Horizon line
      Rectangle()
        .fill(
          LinearGradient(
            colors: [Color.orange.opacity(0.3), Color.clear],
            startPoint: .bottom,
            endPoint: .top
          )
        )
        .frame(height: 60)
        .offset(y: 60)

      // Sun
      ZStack {
        // Rays
        ForEach(0..<12, id: \.self) { i in
          Rectangle()
            .fill(Color.orange.opacity(0.3))
            .frame(width: 2, height: 40)
            .offset(y: -50)
            .rotationEffect(.degrees(Double(i) * 30 + rayRotation))
        }

        // Sun body
        Circle()
          .fill(
            RadialGradient(
              colors: [.yellow, .orange],
              center: .center,
              startRadius: 0,
              endRadius: 30
            )
          )
          .frame(width: 60, height: 60)
      }
      .offset(y: 60 - sunPosition)

      // Label
      VStack {
        Spacer()
        Text("Align with the oldest rhythm")
          .font(.system(size: 12, weight: .medium))
          .foregroundColor(.orange.opacity(0.8))
      }
    }
    .onAppear {
      withAnimation(.easeOut(duration: 2)) {
        sunPosition = 80
      }
      withAnimation(.linear(duration: 20).repeatForever(autoreverses: false)) {
        rayRotation = 360
      }
    }
  }
}

// MARK: - Circadian System Diagram

struct CircadianSystemDiagram: View {
  @State private var showLabels = false

  var body: some View {
    VStack(spacing: 16) {
      ZStack {
        // Body silhouette
        Image(systemName: "figure.stand")
          .font(.system(size: 100))
          .foregroundColor(.white.opacity(0.1))

        // Brain/SCN
        VStack(spacing: 4) {
          ZStack {
            Circle()
              .fill(Color.purple.opacity(0.3))
              .frame(width: 40)

            Image(systemName: "brain")
              .font(.system(size: 20))
              .foregroundColor(.purple)
          }

          if showLabels {
            Text("SCN")
              .font(.system(size: 8, weight: .bold))
              .foregroundColor(.purple)
          }
        }
        .offset(y: -70)

        // Sun input
        HStack {
          Image(systemName: "sun.max.fill")
            .foregroundColor(.yellow)
          Image(systemName: "arrow.right")
            .foregroundColor(.yellow.opacity(0.6))
          Image(systemName: "eye.fill")
            .foregroundColor(.cyan)
        }
        .font(.system(size: 14))
        .offset(x: -60, y: -70)

        // Pineal gland
        ZStack {
          Circle()
            .fill(Color.orange.opacity(0.3))
            .frame(width: 20)

          Circle()
            .fill(Color.orange)
            .frame(width: 8)
        }
        .offset(x: 20, y: -65)

        // Peripheral organs
        VStack(spacing: 8) {
          organIndicator("heart.fill", .red, "Heart")
          organIndicator("leaf.fill", .green, "Gut")
          organIndicator("drop.fill", .blue, "Liver")
        }
        .offset(y: 20)
        .opacity(showLabels ? 1 : 0.5)
      }

      // Legend
      HStack(spacing: 20) {
        legendItem("Light Input", .yellow)
        legendItem("Master Clock", .purple)
        legendItem("Peripheral Clocks", .green)
      }
    }
    .onAppear {
      withAnimation(.easeIn(duration: 1).delay(0.5)) {
        showLabels = true
      }
    }
  }

  private func organIndicator(_ icon: String, _ color: Color, _ label: String) -> some View {
    HStack(spacing: 4) {
      Image(systemName: icon)
        .font(.system(size: 12))
        .foregroundColor(color)
      if showLabels {
        Text(label)
          .font(.system(size: 9))
          .foregroundColor(.gray)
      }
    }
  }

  private func legendItem(_ text: String, _ color: Color) -> some View {
    HStack(spacing: 4) {
      Circle()
        .fill(color)
        .frame(width: 8, height: 8)
      Text(text)
        .font(.system(size: 10))
        .foregroundColor(.gray)
    }
  }
}

// MARK: - Two Process Model View

struct TwoProcessModelView: View {
  @State private var time: CGFloat = 0

  var body: some View {
    VStack(spacing: 16) {
      Text("The Two-Process Model")
        .font(.system(size: 14, weight: .bold))
        .foregroundColor(.white)

      // Graph
      ZStack {
        // Background
        RoundedRectangle(cornerRadius: 8)
          .fill(Color.white.opacity(0.05))

        // Grid lines
        VStack(spacing: 20) {
          ForEach(0..<4, id: \.self) { _ in
            Divider().background(Color.white.opacity(0.1))
          }
        }
        .padding(.horizontal)

        // Process C (Circadian) - sinusoidal
        CircadianWave(color: .orange, label: "C", amplitude: 30)

        // Process S (Homeostatic) - sawtooth
        HomeostaticWave(color: .cyan, label: "S")

        // Time labels
        HStack {
          Text("7am")
          Spacer()
          Text("Sleep")
            .padding(.horizontal, 8)
            .background(Color.purple.opacity(0.3))
            .cornerRadius(4)
          Spacer()
          Text("7am")
        }
        .font(.system(size: 9))
        .foregroundColor(.gray)
        .padding(.horizontal, 8)
        .offset(y: 60)
      }
      .frame(height: 140)
      .padding(.horizontal)

      // Legend
      HStack(spacing: 20) {
        HStack(spacing: 4) {
          Circle().fill(Color.orange).frame(width: 8)
          Text("Circadian (C)")
            .font(.system(size: 10))
            .foregroundColor(.gray)
        }

        HStack(spacing: 4) {
          Circle().fill(Color.cyan).frame(width: 8)
          Text("Homeostatic (S)")
            .font(.system(size: 10))
            .foregroundColor(.gray)
        }
      }

      Text("Aligned = Feel alert during day, sleepy at night")
        .font(.system(size: 11, weight: .medium))
        .foregroundColor(.green)
    }
  }
}

struct CircadianWave: View {
  let color: Color
  let label: String
  let amplitude: CGFloat

  var body: some View {
    GeometryReader { geo in
      Path { path in
        let width = geo.size.width - 32
        let height = geo.size.height
        let midY = height / 2

        path.move(to: CGPoint(x: 16, y: midY))

        for x in stride(from: 0, to: width, by: 2) {
          let normalizedX = x / width
          let y = midY - sin(normalizedX * .pi * 2) * amplitude
          path.addLine(to: CGPoint(x: x + 16, y: y))
        }
      }
      .stroke(color, lineWidth: 2)
    }
  }
}

struct HomeostaticWave: View {
  let color: Color
  let label: String

  var body: some View {
    GeometryReader { geo in
      Path { path in
        let width = geo.size.width - 32
        let height = geo.size.height
        let midY = height / 2

        // Rising during wake
        path.move(to: CGPoint(x: 16, y: midY + 20))
        path.addLine(to: CGPoint(x: width * 0.6, y: midY - 30))

        // Drop during sleep
        path.addLine(to: CGPoint(x: width * 0.6, y: midY + 20))

        // Rising again
        path.addLine(to: CGPoint(x: width + 16, y: midY - 10))
      }
      .stroke(color, lineWidth: 2)
    }
  }
}

// MARK: - Clock Genes View

struct ClockGenesView: View {
  @State private var rotation: Double = 0

  var body: some View {
    VStack(spacing: 16) {
      Text("The Molecular Clock")
        .font(.system(size: 14, weight: .bold))
        .foregroundColor(.white)

      ZStack {
        // Outer ring
        Circle()
          .stroke(Color.white.opacity(0.2), lineWidth: 2)
          .frame(width: 160, height: 160)

        // Gene cycle
        ForEach(
          Array(zip(["BMAL1", "CLOCK", "PER", "CRY"].indices, ["BMAL1", "CLOCK", "PER", "CRY"])),
          id: \.0
        ) { index, gene in
          geneNode(gene, color: geneColor(index), angle: Double(index) * 90 + rotation)
        }

        // Arrows
        ForEach(0..<4, id: \.self) { i in
          Image(systemName: "arrow.right")
            .font(.system(size: 10))
            .foregroundColor(.white.opacity(0.4))
            .rotationEffect(.degrees(Double(i) * 90 + 45 + rotation))
            .offset(x: 0, y: 0)
        }

        // Center
        Text("24h")
          .font(.system(size: 14, weight: .bold, design: .monospaced))
          .foregroundColor(.orange)
      }
      .frame(height: 180)

      // Legend
      HStack(spacing: 16) {
        VStack(alignment: .leading) {
          Text("Activators")
            .font(.system(size: 9, weight: .bold))
            .foregroundColor(.green)
          Text("BMAL1 + CLOCK")
            .font(.system(size: 8))
            .foregroundColor(.gray)
        }

        VStack(alignment: .leading) {
          Text("Inhibitors")
            .font(.system(size: 9, weight: .bold))
            .foregroundColor(.red)
          Text("PER + CRY")
            .font(.system(size: 8))
            .foregroundColor(.gray)
        }
      }
    }
    .onAppear {
      withAnimation(.linear(duration: 10).repeatForever(autoreverses: false)) {
        rotation = 360
      }
    }
  }

  private func geneNode(_ name: String, color: Color, angle: Double) -> some View {
    let radius: CGFloat = 65
    let x = cos((angle - 90) * .pi / 180) * radius
    let y = sin((angle - 90) * .pi / 180) * radius

    return ZStack {
      Circle()
        .fill(color.opacity(0.3))
        .frame(width: 40, height: 40)

      Text(name)
        .font(.system(size: 8, weight: .bold))
        .foregroundColor(color)
    }
    .offset(x: x, y: y)
  }

  private func geneColor(_ index: Int) -> Color {
    switch index {
    case 0: return .blue
    case 1: return .green
    case 2: return .red
    case 3: return .purple
    default: return .gray
    }
  }
}

// MARK: - Egyptian Solar View

struct EgyptianSolarView: View {
  @State private var glowIntensity: Double = 0.3

  var body: some View {
    VStack(spacing: 16) {
      ZStack {
        // Ra disc
        Circle()
          .fill(
            RadialGradient(
              colors: [.yellow, .orange.opacity(glowIntensity)],
              center: .center,
              startRadius: 20,
              endRadius: 60
            )
          )
          .frame(width: 100, height: 100)

        // Eye of Horus overlay
        Image(systemName: "eye.fill")
          .font(.system(size: 30))
          .foregroundColor(.white.opacity(0.8))
      }

      Text("RA")
        .font(.system(size: 24, weight: .black, design: .serif))
        .foregroundColor(.orange)
        .tracking(8)

      Text("The Original Authority")
        .font(.system(size: 12, weight: .medium))
        .foregroundColor(.gray)

      HStack(spacing: 20) {
        VStack {
          Image(systemName: "checkmark.circle.fill")
            .foregroundColor(.green)
          Text("Alignment")
            .font(.system(size: 10))
            .foregroundColor(.gray)
          Text("Ma'at")
            .font(.system(size: 9, weight: .bold))
            .foregroundColor(.green)
        }

        VStack {
          Image(systemName: "xmark.circle.fill")
            .foregroundColor(.red)
          Text("Misalignment")
            .font(.system(size: 10))
            .foregroundColor(.gray)
          Text("Isfet")
            .font(.system(size: 9, weight: .bold))
            .foregroundColor(.red)
        }
      }
    }
    .onAppear {
      withAnimation(.easeInOut(duration: 2).repeatForever(autoreverses: true)) {
        glowIntensity = 0.6
      }
    }
  }
}

// MARK: - Pineal Gland View

struct PinealGlandView: View {
  @State private var pulseScale: CGFloat = 1.0

  var body: some View {
    VStack(spacing: 16) {
      ZStack {
        // Brain outline
        Image(systemName: "brain.head.profile")
          .font(.system(size: 80))
          .foregroundColor(.purple.opacity(0.2))

        // Pineal gland
        ZStack {
          Circle()
            .fill(Color.orange.opacity(0.3))
            .frame(width: 30, height: 30)
            .scaleEffect(pulseScale)

          Circle()
            .fill(Color.orange)
            .frame(width: 15, height: 15)

          Image(systemName: "eye.fill")
            .font(.system(size: 8))
            .foregroundColor(.white)
        }
        .offset(x: -5, y: -10)

        // Light path
        Path { path in
          path.move(to: CGPoint(x: -60, y: -20))
          path.addLine(to: CGPoint(x: -5, y: -10))
        }
        .stroke(Color.yellow, style: StrokeStyle(lineWidth: 2, dash: [4, 4]))
      }
      .frame(height: 100)

      Text("Pineal Gland")
        .font(.system(size: 16, weight: .bold))
        .foregroundColor(.orange)

      Text("Your interface with light")
        .font(.system(size: 12))
        .foregroundColor(.gray)

      // Functions
      HStack(spacing: 20) {
        VStack {
          Image(systemName: "moon.fill")
            .foregroundColor(.purple)
          Text("Melatonin")
            .font(.system(size: 9))
            .foregroundColor(.gray)
        }

        VStack {
          Image(systemName: "sparkles")
            .foregroundColor(.cyan)
          Text("DMT?")
            .font(.system(size: 9))
            .foregroundColor(.gray)
        }

        VStack {
          Image(systemName: "eye.trianglebadge.exclamationmark")
            .foregroundColor(.orange)
          Text("Intuition")
            .font(.system(size: 9))
            .foregroundColor(.gray)
        }
      }
    }
    .onAppear {
      withAnimation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true)) {
        pulseScale = 1.3
      }
    }
  }
}

// MARK: - Daily Practice View

struct DailyPracticeView: View {
  @ObservedObject var streakManager = StreakManager.shared
  @State private var isRunning = false
  @State private var timeRemaining = 60
  @State private var showCompletion = false

  private var streak: PracticeStreak? {
    streakManager.streak(for: "solar_sovereignty")
  }

  var body: some View {
    VStack(spacing: 16) {
      Text("60 Seconds to Alignment")
        .font(.system(size: 16, weight: .bold))
        .foregroundColor(.orange)

      // Timer circle
      ZStack {
        Circle()
          .stroke(Color.white.opacity(0.1), lineWidth: 8)
          .frame(width: 100, height: 100)

        Circle()
          .trim(from: 0, to: CGFloat(timeRemaining) / 60.0)
          .stroke(Color.orange, style: StrokeStyle(lineWidth: 8, lineCap: .round))
          .frame(width: 100, height: 100)
          .rotationEffect(.degrees(-90))
          .animation(.linear(duration: 1), value: timeRemaining)

        VStack {
          Text("\(timeRemaining)")
            .font(.system(size: 28, weight: .bold, design: .monospaced))
            .foregroundColor(.white)
          Text(isRunning ? "breathe" : "seconds")
            .font(.system(size: 10))
            .foregroundColor(.gray)
        }
      }
      .onTapGesture {
        if !isRunning && !(streak?.isCompletedToday ?? false) {
          startPractice()
        }
      }

      // Start button or completed status
      if streak?.isCompletedToday == true {
        HStack(spacing: 6) {
          Image(systemName: "checkmark.circle.fill")
          Text("Completed Today")
        }
        .font(.system(size: 14, weight: .semibold))
        .foregroundColor(.green)
      } else if !isRunning {
        Button {
          startPractice()
        } label: {
          Text("Begin Practice")
            .font(.system(size: 14, weight: .bold))
            .foregroundColor(.black)
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            .background(Capsule().fill(Color.orange))
        }
      }

      // Steps
      VStack(alignment: .leading, spacing: 8) {
        stepRow(1, "Sunrise intention", "sun.max.fill")
        stepRow(2, "Deep breath", "wind")
        stepRow(3, "Energy word", "text.bubble")
        stepRow(4, "Streak extends", "flame.fill")
      }

      // Streak display
      if let currentStreak = streak {
        HStack {
          if currentStreak.currentStreak > 0 {
            Image(systemName: "flame.fill")
              .foregroundColor(.orange)
          }
          Text("\(currentStreak.currentStreak) day streak")
            .font(.system(size: 12, weight: .bold))
            .foregroundColor(.orange)

          if currentStreak.longestStreak > currentStreak.currentStreak {
            Text("• Best: \(currentStreak.longestStreak)")
              .font(.system(size: 10))
              .foregroundColor(.orange.opacity(0.6))
          }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
        .background(Color.orange.opacity(0.2))
        .cornerRadius(20)
      }
    }
    .sheet(isPresented: $showCompletion) {
      if let s = streak {
        StreakCelebrationView(streak: s)
      }
    }
  }

  private func startPractice() {
    isRunning = true
    timeRemaining = 60
    HapticManager.shared.light()

    Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
      if timeRemaining > 0 {
        timeRemaining -= 1
        if timeRemaining == 30 {
          HapticManager.shared.light()
        }
      } else {
        timer.invalidate()
        completePractice()
      }
    }
  }

  private func completePractice() {
    isRunning = false
    HapticManager.shared.success()
    streakManager.logCompletion(for: "solar_sovereignty")
    showCompletion = true
  }

  private func stepRow(_ num: Int, _ text: String, _ icon: String) -> some View {
    HStack(spacing: 8) {
      Text("\(num)")
        .font(.system(size: 10, weight: .bold))
        .foregroundColor(.orange)
        .frame(width: 16)

      Image(systemName: icon)
        .font(.system(size: 12))
        .foregroundColor(.orange.opacity(0.6))

      Text(text)
        .font(.system(size: 12))
        .foregroundColor(.white)
    }
  }
}

// MARK: - Preview

#Preview {
  SolarSovereigntyCourseView()
}
