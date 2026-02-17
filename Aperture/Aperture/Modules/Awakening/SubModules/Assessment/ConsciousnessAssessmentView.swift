// ConsciousnessAssessmentView.swift
// Aperture
//
// Beautiful onboarding assessment that identifies consciousness state
// and recommends the optimal learning path

import SwiftUI

// MARK: - Main Assessment View

struct ConsciousnessAssessmentView: View {
  @StateObject private var assessment = ConsciousnessAssessment()
  @Environment(\.dismiss) private var dismiss
  @State private var showingResult = false
  @State private var animateQuestion = false

  var body: some View {
    ZStack {
      // Background
      LinearGradient(
        colors: [
          Color(hex: "#0a0a1a"),
          Color(hex: "#1a1a2e"),
          Color(hex: "#0f0f23"),
        ],
        startPoint: .top,
        endPoint: .bottom
      )
      .ignoresSafeArea()

      // Animated particles
      AssessmentParticleView()
        .opacity(0.4)

      if assessment.isComplete {
        AssessmentResultView(assessment: assessment)
          .transition(.opacity.combined(with: .scale))
      } else {
        VStack(spacing: 0) {
          // Header
          assessmentHeader

          // Progress
          progressBar

          Spacer()

          // Question
          if let question = assessment.currentQuestion {
            questionView(question)
              .id(question.id)
              .transition(
                .asymmetric(
                  insertion: .move(edge: .trailing).combined(with: .opacity),
                  removal: .move(edge: .leading).combined(with: .opacity)
                ))
          }

          Spacer()

          // Navigation
          navigationButtons
        }
      }
    }
    .animation(.easeInOut(duration: 0.3), value: assessment.currentQuestionIndex)
    .animation(.easeInOut(duration: 0.5), value: assessment.isComplete)
  }

  // MARK: - Header

  private var assessmentHeader: some View {
    HStack {
      Button {
        if assessment.currentQuestionIndex > 0 {
          assessment.goBack()
        } else {
          dismiss()
        }
      } label: {
        Image(systemName: assessment.currentQuestionIndex > 0 ? "chevron.left" : "xmark")
          .font(.title3)
          .foregroundColor(.white.opacity(0.7))
          .frame(width: 44, height: 44)
      }

      Spacer()

      VStack(spacing: 2) {
        Text("CONSCIOUSNESS ASSESSMENT")
          .font(.caption.bold())
          .foregroundColor(.white.opacity(0.5))
          .tracking(2)

        Text("Question \(assessment.currentQuestionIndex + 1) of \(assessment.questions.count)")
          .font(.caption)
          .foregroundColor(.white.opacity(0.4))
      }

      Spacer()

      // Placeholder for symmetry
      Color.clear
        .frame(width: 44, height: 44)
    }
    .padding()
  }

  // MARK: - Progress Bar

  private var progressBar: some View {
    GeometryReader { geometry in
      ZStack(alignment: .leading) {
        Rectangle()
          .fill(Color.white.opacity(0.1))
          .frame(height: 4)

        Rectangle()
          .fill(
            LinearGradient(
              colors: [Color(hex: "#7C4DFF"), Color(hex: "#E040FB")],
              startPoint: .leading,
              endPoint: .trailing
            )
          )
          .frame(width: geometry.size.width * assessment.progress, height: 4)
          .animation(.easeInOut(duration: 0.3), value: assessment.progress)
      }
    }
    .frame(height: 4)
    .padding(.horizontal)
  }

  // MARK: - Question View

  private func questionView(_ question: AssessmentQuestion) -> some View {
    VStack(spacing: 32) {
      // Question Text
      Text(question.question)
        .font(.title2.bold())
        .foregroundColor(.white)
        .multilineTextAlignment(.center)
        .padding(.horizontal, 24)

      // Options
      VStack(spacing: 12) {
        ForEach(question.options) { option in
          OptionButton(
            text: option.text,
            isSelected: assessment.answers[assessment.currentQuestionIndex]?.id == option.id
          ) {
            withAnimation(.easeInOut(duration: 0.2)) {
              assessment.selectAnswer(option)
            }
          }
        }
      }
      .padding(.horizontal, 20)
    }
  }

  // MARK: - Navigation

  private var navigationButtons: some View {
    HStack {
      if assessment.currentQuestionIndex > 0 {
        Button {
          assessment.goBack()
        } label: {
          HStack {
            Image(systemName: "chevron.left")
            Text("Back")
          }
          .font(.subheadline)
          .foregroundColor(.white.opacity(0.6))
        }
      }

      Spacer()
    }
    .padding()
    .padding(.bottom, 20)
  }
}

// MARK: - Option Button

struct OptionButton: View {
  let text: String
  let isSelected: Bool
  let action: () -> Void

  var body: some View {
    Button(action: action) {
      HStack {
        Text(text)
          .font(.body)
          .foregroundColor(.white)
          .multilineTextAlignment(.leading)

        Spacer()

        if isSelected {
          Image(systemName: "checkmark.circle.fill")
            .foregroundColor(Color(hex: "#7C4DFF"))
        }
      }
      .padding()
      .background(
        RoundedRectangle(cornerRadius: 12)
          .fill(isSelected ? Color(hex: "#7C4DFF").opacity(0.2) : Color.white.opacity(0.05))
          .overlay(
            RoundedRectangle(cornerRadius: 12)
              .stroke(
                isSelected ? Color(hex: "#7C4DFF") : Color.white.opacity(0.1),
                lineWidth: isSelected ? 2 : 1
              )
          )
      )
    }
    .buttonStyle(AssessmentScaleButtonStyle())
  }
}

struct AssessmentScaleButtonStyle: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .scaleEffect(configuration.isPressed ? 0.98 : 1.0)
      .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
  }
}

// MARK: - Assessment Result View

struct AssessmentResultView: View {
  @ObservedObject var assessment: ConsciousnessAssessment
  @Environment(\.dismiss) private var dismiss
  @State private var animateIn = false
  @State private var showRecommendations = false

  var body: some View {
    ScrollView {
      VStack(spacing: 32) {
        // Result Header
        if let archetype = assessment.result {
          resultHeader(archetype)
        }

        // Dragon Message
        if let archetype = assessment.result {
          dragonMessageCard(archetype)
        }

        // Secondary Archetype
        if let secondary = assessment.secondaryArchetype, secondary != assessment.result {
          secondaryCard(secondary)
        }

        // Course Recommendations
        if let archetype = assessment.result {
          recommendationsSection(archetype)
        }

        // Start Button
        startButton

        // Retake Option
        retakeButton

        Spacer(minLength: 100)
      }
      .padding()
    }
    .onAppear {
      withAnimation(.easeOut(duration: 0.8)) {
        animateIn = true
      }
      DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
        withAnimation(.easeOut(duration: 0.5)) {
          showRecommendations = true
        }
      }
    }
  }

  // MARK: - Result Header

  private func resultHeader(_ archetype: ConsciousnessArchetype) -> some View {
    VStack(spacing: 16) {
      // Icon with glow
      ZStack {
        Circle()
          .fill(
            RadialGradient(
              colors: [archetype.color.opacity(0.4), Color.clear],
              center: .center,
              startRadius: 20,
              endRadius: 80
            )
          )
          .frame(width: 160, height: 160)
          .blur(radius: 20)

        Image(systemName: archetype.icon)
          .font(.system(size: 60))
          .foregroundColor(archetype.color)
          .shadow(color: archetype.color.opacity(0.5), radius: 20)
      }
      .scaleEffect(animateIn ? 1.0 : 0.5)
      .opacity(animateIn ? 1.0 : 0)

      // Title
      VStack(spacing: 8) {
        Text("You are")
          .font(.subheadline)
          .foregroundColor(.white.opacity(0.6))

        Text(archetype.title)
          .font(.system(size: 36, weight: .bold, design: .serif))
          .foregroundStyle(
            LinearGradient(
              colors: [.white, archetype.color],
              startPoint: .leading,
              endPoint: .trailing
            )
          )

        Text(archetype.subtitle)
          .font(.title3)
          .foregroundColor(.white.opacity(0.7))
      }
      .opacity(animateIn ? 1.0 : 0)

      // Description
      Text(archetype.description)
        .font(.body)
        .foregroundColor(.white.opacity(0.8))
        .multilineTextAlignment(.center)
        .lineSpacing(6)
        .padding(.top, 8)
        .opacity(animateIn ? 1.0 : 0)
    }
    .padding(.top, 20)
  }

  // MARK: - Dragon Message

  private func dragonMessageCard(_ archetype: ConsciousnessArchetype) -> some View {
    VStack(alignment: .leading, spacing: 16) {
      HStack {
        Image(systemName: "flame.fill")
          .foregroundColor(.orange)
        Text("Dragon Says")
          .font(.headline)
          .foregroundColor(.white)
        Spacer()
      }

      Text(archetype.dragonMessage)
        .font(.body)
        .foregroundColor(.white.opacity(0.9))
        .lineSpacing(6)
    }
    .padding()
    .background(
      RoundedRectangle(cornerRadius: 16)
        .fill(Color.orange.opacity(0.1))
        .overlay(
          RoundedRectangle(cornerRadius: 16)
            .stroke(Color.orange.opacity(0.3), lineWidth: 1)
        )
    )
    .opacity(animateIn ? 1.0 : 0)
  }

  // MARK: - Secondary Archetype

  private func secondaryCard(_ archetype: ConsciousnessArchetype) -> some View {
    HStack(spacing: 16) {
      Image(systemName: archetype.icon)
        .font(.title2)
        .foregroundColor(archetype.color)

      VStack(alignment: .leading, spacing: 4) {
        Text("You also resonate with")
          .font(.caption)
          .foregroundColor(.white.opacity(0.5))

        Text(archetype.title)
          .font(.headline)
          .foregroundColor(.white)
      }

      Spacer()
    }
    .padding()
    .background(
      RoundedRectangle(cornerRadius: 12)
        .fill(Color.white.opacity(0.05))
    )
    .opacity(showRecommendations ? 1.0 : 0)
  }

  // MARK: - Recommendations

  private func recommendationsSection(_ archetype: ConsciousnessArchetype) -> some View {
    VStack(alignment: .leading, spacing: 16) {
      Text("YOUR RECOMMENDED PATH")
        .font(.caption.bold())
        .foregroundColor(.white.opacity(0.5))
        .tracking(2)

      ForEach(Array(archetype.courseRecommendations.enumerated()), id: \.element.id) {
        index, recommendation in
        AssessmentRecommendationCard(
          recommendation: recommendation,
          index: index
        )
        .opacity(showRecommendations ? 1.0 : 0)
        .offset(y: showRecommendations ? 0 : 20)
        .animation(
          .easeOut(duration: 0.4).delay(Double(index) * 0.1),
          value: showRecommendations
        )
      }
    }
  }

  // MARK: - Start Button

  private var startButton: some View {
    Button {
      // Navigate to first recommended course
      dismiss()
    } label: {
      HStack {
        Text("Begin Your Journey")
          .fontWeight(.semibold)
        Image(systemName: "arrow.right")
      }
      .foregroundColor(.black)
      .padding()
      .frame(maxWidth: .infinity)
      .background(
        LinearGradient(
          colors: [Color(hex: "#7C4DFF"), Color(hex: "#E040FB")],
          startPoint: .leading,
          endPoint: .trailing
        )
      )
      .cornerRadius(16)
    }
    .opacity(showRecommendations ? 1.0 : 0)
  }

  // MARK: - Retake Button

  private var retakeButton: some View {
    Button {
      withAnimation {
        assessment.reset()
      }
    } label: {
      Text("Retake Assessment")
        .font(.subheadline)
        .foregroundColor(.white.opacity(0.5))
    }
  }
}

// MARK: - Recommendation Card

struct AssessmentRecommendationCard: View {
  let recommendation: AssessmentCourseRecommendation
  let index: Int

  var priorityLabel: String {
    switch recommendation.priority {
    case 1: return "START HERE"
    case 2: return "NEXT"
    case 3: return "THEN"
    default: return ""
    }
  }

  var body: some View {
    HStack(spacing: 16) {
      // Priority Badge
      VStack {
        Text(priorityLabel)
          .font(.system(size: 8, weight: .bold))
          .foregroundColor(recommendation.color)

        ZStack {
          Circle()
            .fill(recommendation.color.opacity(0.2))
            .frame(width: 50, height: 50)

          Image(systemName: recommendation.icon)
            .font(.title3)
            .foregroundColor(recommendation.color)
        }
      }

      // Content
      VStack(alignment: .leading, spacing: 6) {
        Text(recommendation.title)
          .font(.headline)
          .foregroundColor(.white)

        Text(recommendation.subtitle)
          .font(.caption)
          .foregroundColor(recommendation.color)

        Text(recommendation.reason)
          .font(.caption)
          .foregroundColor(.white.opacity(0.6))
          .lineLimit(2)
      }

      Spacer()

      Image(systemName: "chevron.right")
        .foregroundColor(.white.opacity(0.3))
    }
    .padding()
    .background(
      RoundedRectangle(cornerRadius: 16)
        .fill(Color.white.opacity(0.05))
        .overlay(
          RoundedRectangle(cornerRadius: 16)
            .stroke(
              recommendation.priority == 1
                ? recommendation.color.opacity(0.3)
                : Color.clear,
              lineWidth: 1
            )
        )
    )
  }
}

// MARK: - Assessment Particle View

struct AssessmentParticleView: View {
  @State private var particles: [AssessmentParticle] = []

  var body: some View {
    GeometryReader { geometry in
      ZStack {
        ForEach(particles) { particle in
          Circle()
            .fill(particle.color)
            .frame(width: particle.size, height: particle.size)
            .position(particle.position)
            .blur(radius: particle.size / 3)
        }
      }
      .onAppear {
        generateParticles(in: geometry.size)
      }
    }
  }

  private func generateParticles(in size: CGSize) {
    particles = (0..<20).map { _ in
      AssessmentParticle(
        position: CGPoint(
          x: CGFloat.random(in: 0...size.width),
          y: CGFloat.random(in: 0...size.height)
        ),
        size: CGFloat.random(in: 2...6),
        color: [
          Color(hex: "#7C4DFF").opacity(0.3),
          Color(hex: "#E040FB").opacity(0.3),
          Color.white.opacity(0.2),
        ].randomElement()!
      )
    }
  }
}

struct AssessmentParticle: Identifiable {
  let id = UUID()
  let position: CGPoint
  let size: CGFloat
  let color: Color
}

// MARK: - Quick Assessment Card (For Homepage)

struct QuickAssessmentCard: View {
  @State private var showingAssessment = false

  var body: some View {
    Button {
      showingAssessment = true
    } label: {
      VStack(alignment: .leading, spacing: 12) {
        HStack {
          ZStack {
            Circle()
              .fill(
                LinearGradient(
                  colors: [Color(hex: "#7C4DFF"), Color(hex: "#E040FB")],
                  startPoint: .topLeading,
                  endPoint: .bottomTrailing
                )
              )
              .frame(width: 50, height: 50)

            Image(systemName: "person.crop.circle.badge.questionmark")
              .font(.title2)
              .foregroundColor(.white)
          }

          Spacer()

          Text("2 min")
            .font(.caption)
            .foregroundColor(.white.opacity(0.5))
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .background(Color.white.opacity(0.1))
            .cornerRadius(20)
        }

        Text("Find Your Path")
          .font(.title3.bold())
          .foregroundColor(.white)

        Text(
          "Take a quick assessment to discover which courses are right for where you are right now."
        )
        .font(.caption)
        .foregroundColor(.white.opacity(0.7))
        .lineLimit(2)

        HStack {
          Text("Start Assessment")
            .font(.subheadline.bold())
            .foregroundColor(Color(hex: "#7C4DFF"))

          Image(systemName: "arrow.right")
            .font(.caption)
            .foregroundColor(Color(hex: "#7C4DFF"))
        }
      }
      .padding()
      .background(
        RoundedRectangle(cornerRadius: 20)
          .fill(Color.white.opacity(0.05))
          .overlay(
            RoundedRectangle(cornerRadius: 20)
              .stroke(
                LinearGradient(
                  colors: [Color(hex: "#7C4DFF").opacity(0.3), Color(hex: "#E040FB").opacity(0.3)],
                  startPoint: .topLeading,
                  endPoint: .bottomTrailing
                ),
                lineWidth: 1
              )
          )
      )
    }
    .fullScreenCover(isPresented: $showingAssessment) {
      ConsciousnessAssessmentView()
    }
  }
}

// MARK: - Onboarding Prompt (Shows after signup or idle)

struct AssessmentPromptView: View {
  @State private var showingAssessment = false
  @Binding var isPresented: Bool

  var body: some View {
    ZStack {
      // Dim background
      Color.black.opacity(0.8)
        .ignoresSafeArea()
        .onTapGesture {
          isPresented = false
        }

      VStack(spacing: 24) {
        // Icon
        ZStack {
          Circle()
            .fill(
              RadialGradient(
                colors: [Color(hex: "#7C4DFF").opacity(0.4), Color.clear],
                center: .center,
                startRadius: 20,
                endRadius: 80
              )
            )
            .frame(width: 120, height: 120)

          Image(systemName: "sparkles")
            .font(.system(size: 50))
            .foregroundColor(Color(hex: "#7C4DFF"))
        }

        // Text
        VStack(spacing: 12) {
          Text("Not sure where to start?")
            .font(.title2.bold())
            .foregroundColor(.white)

          Text(
            "Take a 2-minute assessment and we'll recommend the perfect courses for where you are right now."
          )
          .font(.body)
          .foregroundColor(.white.opacity(0.7))
          .multilineTextAlignment(.center)
        }

        // CTA
        Button {
          isPresented = false
          showingAssessment = true
        } label: {
          HStack {
            Text("Find My Path")
              .fontWeight(.semibold)
            Image(systemName: "arrow.right")
          }
          .foregroundColor(.black)
          .padding()
          .frame(maxWidth: .infinity)
          .background(
            LinearGradient(
              colors: [Color(hex: "#7C4DFF"), Color(hex: "#E040FB")],
              startPoint: .leading,
              endPoint: .trailing
            )
          )
          .cornerRadius(16)
        }

        // Skip
        Button {
          isPresented = false
        } label: {
          Text("I'll explore on my own")
            .font(.subheadline)
            .foregroundColor(.white.opacity(0.5))
        }
      }
      .padding(32)
      .background(
        RoundedRectangle(cornerRadius: 24)
          .fill(Color(hex: "#1a1a2e"))
      )
      .padding(24)
    }
    .fullScreenCover(isPresented: $showingAssessment) {
      ConsciousnessAssessmentView()
    }
  }
}

// MARK: - Preview

#Preview {
  ConsciousnessAssessmentView()
}
