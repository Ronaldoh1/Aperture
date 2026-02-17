// ArrowOfTimeCourseView.swift
// Interactive visualizations for the Arrow of Time course

import SwiftUI

// MARK: - Main Course View

struct ArrowOfTimeCourseView: View {
  let course = ArrowOfTimeCourse.shared
  @State private var selectedModule: ArrowModule?
  @State private var selectedLesson: ArrowLesson?
  @Environment(\.dismiss) private var dismiss

  var body: some View {
    NavigationStack {
      ZStack {
        // Deep space background
        LinearGradient(
          colors: [
            Color(hex: "#0a0014"),
            Color(hex: "#1a0a2e"),
            Color(hex: "#0a0014"),
          ],
          startPoint: .top,
          endPoint: .bottom
        )
        .ignoresSafeArea()

        ScrollView(showsIndicators: false) {
          VStack(spacing: 24) {
            courseHeader

            // Animated hero
            ShatteringCupHero()
              .frame(height: 200)

            // Modules
            ForEach(course.modules) { module in
              moduleCard(module)
            }

            Spacer(minLength: 100)
          }
          .padding(.horizontal, 20)
        }
      }
      .navigationTitle("Arrow of Time")
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
        LessonDetailView(lesson: lesson, course: course)
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
              endRadius: 50
            )
          )
          .frame(width: 100, height: 100)

        Image(systemName: course.icon)
          .font(.system(size: 40))
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
        statBadge("3", "Modules")
        statBadge("9", "Lessons")
        statBadge("45", "Minutes")
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

  private func moduleCard(_ module: ArrowModule) -> some View {
    VStack(alignment: .leading, spacing: 16) {
      // Module header
      HStack {
        ZStack {
          Circle()
            .fill(course.color.opacity(0.2))
            .frame(width: 40, height: 40)

          Text("\(module.number)")
            .font(.system(size: 16, weight: .black, design: .rounded))
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

      // Lessons
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

            Spacer()

            Image(systemName: "chevron.right")
              .font(.system(size: 12, weight: .semibold))
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
        .fill(Color.white.opacity(0.05))
        .overlay(
          RoundedRectangle(cornerRadius: 16)
            .stroke(course.color.opacity(0.2), lineWidth: 1)
        )
    )
  }
}

// MARK: - Lesson Detail View

struct LessonDetailView: View {
  let lesson: ArrowLesson
  let course: ArrowOfTimeCourse
  @Environment(\.dismiss) private var dismiss

  var body: some View {
    NavigationStack {
      ZStack {
        Color(hex: "#0a0014").ignoresSafeArea()

        ScrollView(showsIndicators: false) {
          VStack(spacing: 24) {
            // Animation area
            animationView
              .frame(height: 200)

            // Title
            Text(lesson.title)
              .font(.system(size: 24, weight: .bold))
              .foregroundColor(.white)
              .multilineTextAlignment(.center)
              .padding(.horizontal)

            // Content
            Text(LocalizedStringKey(lesson.content))
              .font(.system(size: 15, weight: .regular))
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
          .foregroundColor(course.color)
        }
      }
    }
  }

  @ViewBuilder
  private var animationView: some View {
    switch lesson.animationType {
    case .shatteringCup:
      ShatteringCupAnimation()
    case .cardShuffle:
      CardShuffleAnimation()
    case .entropyIncrease:
      EntropyIncreaseAnimation()
    case .cosmicSpring:
      CosmicSpringAnimation()
    case .dissipativeStructure:
      DissipativeStructureAnimation()
    case .memoryFormation:
      MemoryFormationAnimation()
    case .causationArrow:
      CausationArrowAnimation()
    case .cosmicPerspective:
      CosmicPerspectiveAnimation()
    case .reversibleEquations:
      ReversibleEquationsAnimation()
    }
  }

  private var keyInsightCard: some View {
    VStack(alignment: .leading, spacing: 12) {
      HStack {
        Image(systemName: "lightbulb.fill")
          .foregroundColor(.yellow)
        Text("KEY INSIGHT")
          .font(.system(size: 11, weight: .bold))
          .foregroundColor(.yellow)
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
        .fill(Color.yellow.opacity(0.1))
        .overlay(
          RoundedRectangle(cornerRadius: 12)
            .stroke(Color.yellow.opacity(0.3), lineWidth: 1)
        )
    )
    .padding(.horizontal, 20)
  }
}

// MARK: - Shattering Cup Hero

struct ShatteringCupHero: View {
  @State private var isShattered = false
  @State private var pieces: [CupPiece] = []

  var body: some View {
    ZStack {
      if isShattered {
        ForEach(pieces) { piece in
          CupPieceView(piece: piece)
        }
      } else {
        // Intact cup
        VStack(spacing: 4) {
          Image(systemName: "cup.and.saucer.fill")
            .font(.system(size: 60))
            .foregroundColor(.white.opacity(0.8))

          Text("Tap to shatter")
            .font(.system(size: 12))
            .foregroundColor(.gray)
        }
      }
    }
    .onTapGesture {
      shatterCup()
    }
    .onAppear {
      generatePieces()
    }
  }

  private func generatePieces() {
    pieces = (0..<12).map { i in
      CupPiece(
        id: i,
        rotation: Double.random(in: 0...360),
        xOffset: CGFloat.random(in: -100...100),
        yOffset: CGFloat.random(in: 20...120),
        delay: Double(i) * 0.02
      )
    }
  }

  private func shatterCup() {
    HapticManager.shared.heavy()
    withAnimation(.spring(response: 0.3, dampingFraction: 0.5)) {
      isShattered = true
    }

    // Reset after delay
    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
      withAnimation {
        isShattered = false
      }
    }
  }
}

struct CupPiece: Identifiable {
  let id: Int
  let rotation: Double
  let xOffset: CGFloat
  let yOffset: CGFloat
  let delay: Double
}

struct CupPieceView: View {
  let piece: CupPiece
  @State private var animate = false

  var body: some View {
    Image(systemName: "triangle.fill")
      .font(.system(size: CGFloat.random(in: 8...16)))
      .foregroundColor(.white.opacity(0.6))
      .rotationEffect(.degrees(animate ? piece.rotation : 0))
      .offset(
        x: animate ? piece.xOffset : 0,
        y: animate ? piece.yOffset : 0
      )
      .onAppear {
        withAnimation(.easeOut(duration: 0.6).delay(piece.delay)) {
          animate = true
        }
      }
  }
}

// MARK: - Shattering Cup Animation (Lesson)

struct ShatteringCupAnimation: View {
  @State private var showForward = true

  var body: some View {
    VStack(spacing: 16) {
      HStack(spacing: 40) {
        // Before
        VStack {
          Image(systemName: "cup.and.saucer.fill")
            .font(.system(size: 40))
            .foregroundColor(.white)
          Text("Low Entropy")
            .font(.system(size: 10, weight: .medium))
            .foregroundColor(.green)
        }

        // Arrow
        VStack {
          Image(systemName: showForward ? "arrow.right" : "arrow.left")
            .font(.system(size: 24, weight: .bold))
            .foregroundColor(showForward ? .green : .red)

          Text(showForward ? "10⁻⁶⁸ sec" : "10⁶⁸ years")
            .font(.system(size: 8, weight: .medium, design: .monospaced))
            .foregroundColor(showForward ? .green : .red)
        }

        // After
        VStack {
          HStack(spacing: 4) {
            ForEach(0..<4, id: \.self) { _ in
              Image(systemName: "triangle.fill")
                .font(.system(size: 12))
                .foregroundColor(.white.opacity(0.6))
                .rotationEffect(.degrees(Double.random(in: 0...360)))
            }
          }
          Text("High Entropy")
            .font(.system(size: 10, weight: .medium))
            .foregroundColor(.red)
        }
      }

      Button {
        withAnimation { showForward.toggle() }
      } label: {
        Text(showForward ? "Show Reverse (Impossible)" : "Show Forward (Natural)")
          .font(.system(size: 12, weight: .semibold))
          .foregroundColor(.white)
          .padding(.horizontal, 16)
          .padding(.vertical, 8)
          .background(Capsule().fill(Color.purple.opacity(0.3)))
      }
    }
  }
}

// MARK: - Card Shuffle Animation

struct CardShuffleAnimation: View {
  @State private var isSorted = true
  @State private var cards: [CardItem] = (0..<6).map { CardItem(id: $0, value: $0 + 1) }

  var body: some View {
    VStack(spacing: 16) {
      HStack(spacing: 8) {
        ForEach(cards) { card in
          ZStack {
            RoundedRectangle(cornerRadius: 4)
              .fill(isSorted ? Color.green.opacity(0.3) : Color.red.opacity(0.3))
              .frame(width: 30, height: 45)

            Text("\(card.value)")
              .font(.system(size: 14, weight: .bold, design: .monospaced))
              .foregroundColor(.white)
          }
        }
      }

      HStack(spacing: 20) {
        VStack {
          Text(isSorted ? "1" : "720")
            .font(.system(size: 24, weight: .bold, design: .monospaced))
            .foregroundColor(isSorted ? .green : .red)
          Text("arrangements")
            .font(.system(size: 10))
            .foregroundColor(.gray)
        }

        Text(isSorted ? "Low Entropy" : "High Entropy")
          .font(.system(size: 12, weight: .bold))
          .foregroundColor(isSorted ? .green : .red)
      }

      Button {
        withAnimation(.spring()) {
          if isSorted {
            cards.shuffle()
          } else {
            cards.sort { $0.value < $1.value }
          }
          isSorted.toggle()
        }
        HapticManager.shared.light()
      } label: {
        Text(isSorted ? "Shuffle" : "Sort")
          .font(.system(size: 12, weight: .semibold))
          .foregroundColor(.white)
          .padding(.horizontal, 20)
          .padding(.vertical, 8)
          .background(Capsule().fill(Color.purple.opacity(0.3)))
      }
    }
  }
}

struct CardItem: Identifiable {
  let id: Int
  let value: Int
}

// MARK: - Entropy Increase Animation

struct EntropyIncreaseAnimation: View {
  @State private var entropy: Double = 0
  @State private var isAnimating = false

  var body: some View {
    VStack(spacing: 20) {
      // Arrow visualization
      ZStack {
        // Background track
        RoundedRectangle(cornerRadius: 8)
          .fill(Color.white.opacity(0.1))
          .frame(height: 40)

        // Entropy fill
        GeometryReader { geo in
          RoundedRectangle(cornerRadius: 8)
            .fill(
              LinearGradient(
                colors: [.green, .yellow, .orange, .red],
                startPoint: .leading,
                endPoint: .trailing
              )
            )
            .frame(width: geo.size.width * entropy)
        }
        .frame(height: 40)

        // Labels
        HStack {
          Text("Big Bang")
            .font(.system(size: 9, weight: .bold))
          Spacer()
          Text("Heat Death")
            .font(.system(size: 9, weight: .bold))
        }
        .foregroundColor(.white)
        .padding(.horizontal, 8)
      }
      .frame(height: 40)
      .padding(.horizontal)

      // Current state
      HStack {
        Text("Entropy:")
          .font(.system(size: 12))
          .foregroundColor(.gray)

        Text("10^\(Int(entropy * 123))")
          .font(.system(size: 16, weight: .bold, design: .monospaced))
          .foregroundColor(.white)

        Text("/ 10^123")
          .font(.system(size: 12, design: .monospaced))
          .foregroundColor(.gray)
      }

      Text("← We are here (barely started)")
        .font(.system(size: 10))
        .foregroundColor(.yellow)
    }
    .onAppear {
      withAnimation(.easeOut(duration: 2)) {
        entropy = 0.15  // We're only ~15% toward max entropy
      }
    }
  }
}

// MARK: - Cosmic Spring Animation

struct CosmicSpringAnimation: View {
  @State private var springTension: CGFloat = 1.0
  @State private var isUnwinding = false

  var body: some View {
    VStack(spacing: 16) {
      // Spring visualization
      ZStack {
        // Coiled spring
        ForEach(0..<8, id: \.self) { i in
          Circle()
            .stroke(Color.purple.opacity(0.6), lineWidth: 2)
            .frame(width: 20 + CGFloat(i) * 15 * springTension)
        }
      }
      .frame(height: 120)

      HStack(spacing: 30) {
        VStack {
          Text("Big Bang")
            .font(.system(size: 10, weight: .bold))
            .foregroundColor(.green)
          Text("Wound tight")
            .font(.system(size: 9))
            .foregroundColor(.gray)
        }

        Image(systemName: "arrow.right")
          .foregroundColor(.purple)

        VStack {
          Text("Now")
            .font(.system(size: 10, weight: .bold))
            .foregroundColor(.yellow)
          Text("Still unwinding")
            .font(.system(size: 9))
            .foregroundColor(.gray)
        }

        Image(systemName: "arrow.right")
          .foregroundColor(.purple)

        VStack {
          Text("Heat Death")
            .font(.system(size: 10, weight: .bold))
            .foregroundColor(.red)
          Text("Fully released")
            .font(.system(size: 9))
            .foregroundColor(.gray)
        }
      }
    }
    .onAppear {
      withAnimation(.easeInOut(duration: 3).repeatForever(autoreverses: true)) {
        springTension = 1.3
      }
    }
  }
}

// MARK: - Dissipative Structure Animation

struct DissipativeStructureAnimation: View {
  @State private var particlePhase: CGFloat = 0

  var body: some View {
    VStack(spacing: 16) {
      ZStack {
        // Low entropy input (sun)
        Circle()
          .fill(Color.yellow)
          .frame(width: 30)
          .offset(x: -80)

        // Arrows in
        ForEach(0..<3, id: \.self) { i in
          Image(systemName: "arrow.right")
            .foregroundColor(.yellow.opacity(0.8))
            .offset(x: -50, y: CGFloat(i - 1) * 15)
        }

        // You (ordered structure)
        ZStack {
          Circle()
            .fill(Color.purple.opacity(0.3))
            .frame(width: 60)

          Image(systemName: "figure.stand")
            .font(.system(size: 30))
            .foregroundColor(.white)
        }

        // Arrows out (more!)
        ForEach(0..<5, id: \.self) { i in
          Image(systemName: "arrow.right")
            .foregroundColor(.red.opacity(0.6))
            .offset(x: 50, y: CGFloat(i - 2) * 12)
        }

        // High entropy output
        Circle()
          .fill(Color.red.opacity(0.5))
          .frame(width: 40)
          .offset(x: 80)
      }
      .frame(height: 80)

      HStack(spacing: 30) {
        VStack {
          Text("Low entropy")
            .font(.system(size: 10, weight: .bold))
            .foregroundColor(.yellow)
          Text("Food, sunlight")
            .font(.system(size: 9))
            .foregroundColor(.gray)
        }

        VStack {
          Text("You")
            .font(.system(size: 10, weight: .bold))
            .foregroundColor(.purple)
          Text("Local order")
            .font(.system(size: 9))
            .foregroundColor(.gray)
        }

        VStack {
          Text("High entropy")
            .font(.system(size: 10, weight: .bold))
            .foregroundColor(.red)
          Text("Heat, waste")
            .font(.system(size: 9))
            .foregroundColor(.gray)
        }
      }

      Text("Net result: Universe entropy INCREASES")
        .font(.system(size: 11, weight: .medium))
        .foregroundColor(.orange)
    }
  }
}

// MARK: - Memory Formation Animation

struct MemoryFormationAnimation: View {
  @State private var memories: [MemoryDot] = []

  var body: some View {
    VStack(spacing: 16) {
      // Brain with memories
      ZStack {
        Image(systemName: "brain")
          .font(.system(size: 50))
          .foregroundColor(.purple.opacity(0.3))

        ForEach(memories) { memory in
          Circle()
            .fill(Color.cyan)
            .frame(width: 8)
            .offset(x: memory.x, y: memory.y)
            .transition(.scale.combined(with: .opacity))
        }
      }
      .frame(height: 80)

      Text("Memories form from ORDER")
        .font(.system(size: 12, weight: .bold))
        .foregroundColor(.cyan)

      Text("Low entropy → Records possible")
        .font(.system(size: 11))
        .foregroundColor(.gray)

      Text("High entropy → No structure to record")
        .font(.system(size: 11))
        .foregroundColor(.gray)
    }
    .onAppear {
      addMemories()
    }
  }

  private func addMemories() {
    for i in 0..<6 {
      DispatchQueue.main.asyncAfter(deadline: .now() + Double(i) * 0.3) {
        withAnimation {
          memories.append(
            MemoryDot(
              id: i,
              x: CGFloat.random(in: -30...30),
              y: CGFloat.random(in: -20...20)
            ))
        }
      }
    }
  }
}

struct MemoryDot: Identifiable {
  let id: Int
  let x: CGFloat
  let y: CGFloat
}

// MARK: - Causation Arrow Animation

struct CausationArrowAnimation: View {
  @State private var showCausation = false

  var body: some View {
    VStack(spacing: 20) {
      HStack(spacing: 30) {
        // Cause
        VStack {
          ZStack {
            Circle()
              .fill(Color.blue.opacity(0.3))
              .frame(width: 50)
            Image(systemName: "hand.tap.fill")
              .foregroundColor(.blue)
          }
          Text("Cause")
            .font(.system(size: 10, weight: .bold))
            .foregroundColor(.blue)
          Text("Low entropy")
            .font(.system(size: 9))
            .foregroundColor(.gray)
        }

        // Arrow
        VStack {
          Image(systemName: "arrow.right")
            .font(.system(size: 24, weight: .bold))
            .foregroundColor(.green)
            .opacity(showCausation ? 1 : 0.3)

          Text("Statistical flow")
            .font(.system(size: 9))
            .foregroundColor(.gray)
        }

        // Effect
        VStack {
          ZStack {
            Circle()
              .fill(Color.orange.opacity(0.3))
              .frame(width: 50)
            Image(systemName: "lightbulb.fill")
              .foregroundColor(.orange)
              .opacity(showCausation ? 1 : 0.3)
          }
          Text("Effect")
            .font(.system(size: 10, weight: .bold))
            .foregroundColor(.orange)
          Text("High entropy")
            .font(.system(size: 9))
            .foregroundColor(.gray)
        }
      }

      Text("Causation isn't fundamental—it emerges from probability")
        .font(.system(size: 11, weight: .medium))
        .foregroundColor(.purple)
        .multilineTextAlignment(.center)
    }
    .onAppear {
      withAnimation(.easeInOut(duration: 1).repeatForever(autoreverses: true)) {
        showCausation = true
      }
    }
  }
}

// MARK: - Cosmic Perspective Animation

struct CosmicPerspectiveAnimation: View {
  @State private var scale: CGFloat = 0.5
  @State private var opacity: Double = 0

  var body: some View {
    VStack(spacing: 16) {
      ZStack {
        // Universe expanding
        ForEach(0..<5, id: \.self) { i in
          Circle()
            .stroke(Color.purple.opacity(Double(5 - i) / 10), lineWidth: 1)
            .frame(width: CGFloat(40 + i * 30) * scale)
        }

        // You
        Circle()
          .fill(Color.yellow)
          .frame(width: 10)

        Text("You")
          .font(.system(size: 8, weight: .bold))
          .foregroundColor(.yellow)
          .offset(y: 15)
      }
      .frame(height: 120)

      Text("Brief window. Arrow pointing. Life possible.")
        .font(.system(size: 12, weight: .medium))
        .foregroundColor(.white)
        .opacity(opacity)

      Text("Every moment borrowed from initial order.")
        .font(.system(size: 11))
        .foregroundColor(.yellow)
        .opacity(opacity)
    }
    .onAppear {
      withAnimation(.easeOut(duration: 2)) {
        scale = 1.0
        opacity = 1.0
      }
    }
  }
}

// MARK: - Reversible Equations Animation

struct ReversibleEquationsAnimation: View {
  @State private var showReverse = false

  let equations = [
    ("Newton", "F = ma", "✓"),
    ("Maxwell", "∇·E = ρ/ε₀", "✓"),
    ("Einstein", "Gμν = 8πTμν", "✓"),
    ("Schrödinger", "iℏ∂Ψ/∂t = ĤΨ", "✓"),
  ]

  var body: some View {
    VStack(spacing: 12) {
      ForEach(equations, id: \.0) { eq in
        HStack {
          Text(eq.0)
            .font(.system(size: 10, weight: .medium))
            .foregroundColor(.gray)
            .frame(width: 60, alignment: .leading)

          Text(eq.1)
            .font(.system(size: 12, weight: .medium, design: .monospaced))
            .foregroundColor(.white)

          Spacer()

          Text("Reversible")
            .font(.system(size: 9, weight: .bold))
            .foregroundColor(.green)
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 6)
        .background(Color.white.opacity(0.05))
        .cornerRadius(6)
      }

      Text("All fundamental laws work both ways")
        .font(.system(size: 11, weight: .medium))
        .foregroundColor(.cyan)

      Text("Yet reality stubbornly moves forward...")
        .font(.system(size: 10))
        .foregroundColor(.orange)
    }
    .padding(.horizontal)
  }
}

// MARK: - Preview

#Preview {
  ArrowOfTimeCourseView()
}
