// RealityCheckFlow.swift
// "My Reality Doesn't Make Sense" - The compassionate awakening entry point
// Pulsing button → Quick questionnaire → Feature reveal → Sign up

import SwiftUI

// MARK: - Reality Check Question

struct RealityCheckQuestion: Identifiable {
  let id = UUID()
  let question: String
  let icon: String
  let description: String
}

// MARK: - Reality Check Data

enum RealityCheckData {
  static let questions: [RealityCheckQuestion] = [
    RealityCheckQuestion(
      question: "Do you feel like something is OFF but can't explain it?",
      icon: "questionmark.circle",
      description: "A persistent feeling that the world isn't quite what it seems"
    ),
    RealityCheckQuestion(
      question: "Do the same patterns keep repeating in politics, media, and society?",
      icon: "arrow.triangle.2.circlepath",
      description: "Left vs Right, crisis after crisis, but nothing actually changes"
    ),
    RealityCheckQuestion(
      question: "Do you feel like you're being manipulated but don't know how?",
      icon: "eyes",
      description: "The news, social media, even conversations feel... scripted"
    ),
  ]

  static let features: [AwakeningFeature] = [
    AwakeningFeature(
      title: "Pattern Recognition",
      description: "See the connections they don't want you to see",
      icon: "eye.trianglebadge.exclamationmark",
      color: .purple
    ),
    AwakeningFeature(
      title: "Deprogramming Tools",
      description: "Break free from left/right division and institutional lies",
      icon: "brain.head.profile",
      color: .cyan
    ),
    AwakeningFeature(
      title: "Truth Archives",
      description: "Documented history they removed from textbooks",
      icon: "books.vertical",
      color: .orange
    ),
    AwakeningFeature(
      title: "Consciousness Expansion",
      description: "Tools for awakening your inner knowing",
      icon: "sparkles",
      color: Color(hex: "FFD700")
    ),
  ]
}

struct AwakeningFeature: Identifiable {
  let id = UUID()
  let title: String
  let description: String
  let icon: String
  let color: Color
}

// MARK: - Pulsing CTA Button

struct RealityCheckButton: View {
  @State private var isPulsing = false
  @State private var showFlow = false

  var body: some View {
    Button {
      HapticManager.shared.medium()
      showFlow = true
    } label: {
      HStack(spacing: 8) {
        Image(systemName: "questionmark.circle.fill")
          .font(.system(size: 16, weight: .medium))

        Text("My reality doesn't make sense")
          .font(.system(size: 14, weight: .semibold, design: .rounded))
      }
      .foregroundColor(.white)
      .padding(.horizontal, 20)
      .padding(.vertical, 14)
      .background(
        Capsule()
          .fill(
            LinearGradient(
              colors: [Color.purple, Color.purple.opacity(0.8)],
              startPoint: .leading,
              endPoint: .trailing
            )
          )
          .shadow(color: Color.purple.opacity(0.6), radius: isPulsing ? 15 : 8, x: 0, y: 0)
      )
      .scaleEffect(isPulsing ? 1.03 : 1.0)
    }
    .onAppear {
      withAnimation(
        .easeInOut(duration: 1.2)
          .repeatForever(autoreverses: true)
      ) {
        isPulsing = true
      }
    }
    .fullScreenCover(isPresented: $showFlow) {
      RealityCheckFlowView()
    }
  }
}

// MARK: - Reality Check Flow View

struct RealityCheckFlowView: View {
  @Environment(\.dismiss) private var dismiss

  @State private var currentStep = 0
  @State private var answers: [Bool] = []
  @State private var showFeatures = false
  @State private var revealedFeatures: Set<String> = []
  @State private var showSignUp = false

  private let totalSteps = 3  // questions

  var body: some View {
    ZStack {
      // Background
      LinearGradient(
        colors: [Color.black, Color.purple.opacity(0.2), Color.black],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
      )
      .ignoresSafeArea()

      VStack(spacing: 0) {
        // Close button
        HStack {
          Spacer()
          Button {
            dismiss()
          } label: {
            Image(systemName: "xmark")
              .font(.system(size: 16, weight: .medium))
              .foregroundColor(.white.opacity(0.6))
              .padding(12)
              .background(Circle().fill(Color.white.opacity(0.1)))
          }
        }
        .padding()

        if currentStep < totalSteps {
          // Questions phase
          questionContent
        } else if !showFeatures {
          // Transition
          transitionContent
        } else {
          // Features reveal
          featuresContent
        }
      }
    }
  }

  // MARK: - Question Content

  private var questionContent: some View {
    VStack(spacing: 40) {
      // Progress
      HStack(spacing: 8) {
        ForEach(0..<totalSteps, id: \.self) { index in
          Circle()
            .fill(index <= currentStep ? Color.purple : Color.white.opacity(0.2))
            .frame(width: 8, height: 8)
        }
      }

      Spacer()

      let question = RealityCheckData.questions[currentStep]

      // Icon
      Image(systemName: question.icon)
        .font(.system(size: 60))
        .foregroundColor(.purple)
        .symbolEffect(.pulse)

      // Question
      VStack(spacing: 16) {
        Text(question.question)
          .font(.system(size: 22, weight: .bold, design: .rounded))
          .foregroundColor(.white)
          .multilineTextAlignment(.center)

        Text(question.description)
          .font(.system(size: 14, weight: .medium))
          .foregroundColor(.white.opacity(0.6))
          .multilineTextAlignment(.center)
      }
      .padding(.horizontal, 24)

      Spacer()

      // Answer buttons
      VStack(spacing: 12) {
        answerButton(text: "Yes, this resonates", isYes: true)
        answerButton(text: "Not really", isYes: false)
      }
      .padding(.horizontal, 24)
      .padding(.bottom, 40)
    }
  }

  private func answerButton(text: String, isYes: Bool) -> some View {
    Button {
      HapticManager.shared.light()
      answers.append(isYes)

      withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
        if currentStep < totalSteps - 1 {
          currentStep += 1
        } else {
          currentStep += 1  // Move to transition
        }
      }
    } label: {
      Text(text)
        .font(.system(size: 16, weight: .semibold))
        .foregroundColor(isYes ? .black : .white)
        .frame(maxWidth: .infinity)
        .padding(.vertical, 16)
        .background(
          RoundedRectangle(cornerRadius: 12)
            .fill(isYes ? Color.purple : Color.white.opacity(0.1))
        )
    }
  }

  // MARK: - Transition Content

  private var transitionContent: some View {
    VStack(spacing: 32) {
      Spacer()

      // Animated checkmark or acknowledgment
      Image(systemName: "sparkles")
        .font(.system(size: 80))
        .foregroundColor(Palette.accent.gold)
        .symbolEffect(.variableColor.iterative.reversing)

      VStack(spacing: 16) {
        Text("You're not alone.")
          .font(.system(size: 28, weight: .bold, design: .rounded))
          .foregroundColor(.white)

        Text("Millions are waking up to the same realization.")
          .font(.system(size: 16, weight: .medium))
          .foregroundColor(.white.opacity(0.8))
          .multilineTextAlignment(.center)

        Text("And we built something to help.")
          .font(.system(size: 16, weight: .bold))
          .foregroundColor(.purple)
      }
      .padding(.horizontal, 24)

      Spacer()

      Button {
        HapticManager.shared.medium()
        withAnimation(.spring(response: 0.5, dampingFraction: 0.8)) {
          showFeatures = true
        }
        animateFeatures()
      } label: {
        Text("Show Me")
          .font(.system(size: 18, weight: .bold))
          .foregroundColor(.black)
          .frame(maxWidth: .infinity)
          .padding(.vertical, 18)
          .background(
            RoundedRectangle(cornerRadius: 14)
              .fill(Palette.accent.gold)
          )
      }
      .padding(.horizontal, 24)
      .padding(.bottom, 40)
    }
    .onAppear {
      // Auto-advance after 2 seconds if they don't tap
      DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
        if !showFeatures {
          HapticManager.shared.medium()
          withAnimation(.spring(response: 0.5, dampingFraction: 0.8)) {
            showFeatures = true
          }
          animateFeatures()
        }
      }
    }
  }

  // MARK: - Features Content

  private var featuresContent: some View {
    VStack(spacing: 24) {
      Text("WE CAN HELP")
        .font(.system(size: 14, weight: .bold, design: .rounded))
        .foregroundColor(.white.opacity(0.5))
        .tracking(3)

      Text("Make Sense of Your Reality")
        .font(.system(size: 26, weight: .bold, design: .rounded))
        .foregroundColor(.white)

      ScrollView {
        VStack(spacing: 16) {
          ForEach(RealityCheckData.features) { feature in
            featureCard(feature)
              .opacity(revealedFeatures.contains(feature.id.uuidString) ? 1 : 0)
              .offset(y: revealedFeatures.contains(feature.id.uuidString) ? 0 : 30)
          }
        }
        .padding(.horizontal, 24)
      }

      if showSignUp {
        VStack(spacing: 16) {
          Button {
            HapticManager.shared.success()
            // Navigate to sign up
            // For now, dismiss and let them sign up
            dismiss()
          } label: {
            Text("Start My Awakening")
              .font(.system(size: 18, weight: .bold))
              .foregroundColor(.black)
              .frame(maxWidth: .infinity)
              .padding(.vertical, 18)
              .background(
                RoundedRectangle(cornerRadius: 14)
                  .fill(Palette.accent.gold)
              )
          }

          Button {
            dismiss()
          } label: {
            Text("Maybe later")
              .font(.system(size: 14, weight: .medium))
              .foregroundColor(.white.opacity(0.5))
          }
        }
        .padding(.horizontal, 24)
        .padding(.bottom, 40)
        .transition(.move(edge: .bottom).combined(with: .opacity))
      }
    }
  }

  private func featureCard(_ feature: AwakeningFeature) -> some View {
    HStack(spacing: 16) {
      Image(systemName: feature.icon)
        .font(.system(size: 28))
        .foregroundColor(feature.color)
        .frame(width: 50)

      VStack(alignment: .leading, spacing: 4) {
        Text(feature.title)
          .font(.system(size: 16, weight: .bold))
          .foregroundColor(.white)

        Text(feature.description)
          .font(.system(size: 12, weight: .medium))
          .foregroundColor(.white.opacity(0.7))
      }

      Spacer()
    }
    .padding(16)
    .background(
      RoundedRectangle(cornerRadius: 14)
        .fill(feature.color.opacity(0.1))
        .overlay(
          RoundedRectangle(cornerRadius: 14)
            .stroke(feature.color.opacity(0.3), lineWidth: 1)
        )
    )
  }

  // MARK: - Helpers

  private func animateFeatures() {
    for (index, feature) in RealityCheckData.features.enumerated() {
      DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.3) {
        withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
          _ = revealedFeatures.insert(feature.id.uuidString)
        }
      }
    }

    DispatchQueue.main.asyncAfter(
      deadline: .now() + Double(RealityCheckData.features.count) * 0.3 + 0.5
    ) {
      withAnimation(.spring(response: 0.5, dampingFraction: 0.8)) {
        showSignUp = true
      }
    }
  }
}

// MARK: - Preview

#Preview("Pulsing Button") {
  ZStack {
    Color.black.ignoresSafeArea()

    VStack {
      Spacer()

      HStack {
        Spacer()
        RealityCheckButton()
          .padding(.trailing, 20)
          .padding(.bottom, 100)
      }
    }
  }
}

#Preview("Full Flow") {
  RealityCheckFlowView()
}
