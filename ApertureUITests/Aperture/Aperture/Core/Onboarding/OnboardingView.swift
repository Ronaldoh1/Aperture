// OnboardingView.swift
// 5-screen onboarding flow with personalization quiz
// 1. Logo Awe → 2. Motivation Quiz → 3. Path Reveal → 4. Sacred Geometry Intro → 5. First Micro Win

import SwiftUI

struct OnboardingView: View {
  @ObservedObject var journeyStore: UserJourneyStore
  @ObservedObject var tutorialStore: TutorialStateStore

  let onComplete: () -> Void

  @State private var currentPage: Int = 0
  @State private var selectedJourney: UserJourneyType?
  @State private var showSkipConfirmation = false
  @State private var showPersonaQuiz = false

  var body: some View {
    ZStack {
      // Background
      TutorialBackgroundView()

      VStack(spacing: 0) {
        // Skip button (always visible)
        skipButton

        // Page content
        TabView(selection: $currentPage) {
          logoAwePage.tag(0)
          motivationQuizPage.tag(1)
          pathRevealPage.tag(2)
          meetDragonPage.tag(3)
          firstMicroWinPage.tag(4)
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .animation(.easeInOut(duration: 0.3), value: currentPage)

        // Page indicators
        pageIndicators
      }
    }
    .alert("Skip Onboarding?", isPresented: $showSkipConfirmation) {
      Button("Skip", role: .destructive) {
        skipOnboarding()
      }
      Button("Continue", role: .cancel) {}
    } message: {
      Text("You can always personalize your experience later in Settings.")
    }
  }

  // MARK: - Skip Button

  private var skipButton: some View {
    HStack {
      Spacer()
      Button(action: { showSkipConfirmation = true }) {
        Text("Skip to explore")
          .font(.system(size: 14, weight: .medium))
          .foregroundColor(.white.opacity(0.6))
      }
      .padding(.horizontal, 24)
      .padding(.top, 16)
    }
  }

  // MARK: - Page Indicators

  private var pageIndicators: some View {
    HStack(spacing: 8) {
      ForEach(0..<5, id: \.self) { index in
        Circle()
          .fill(currentPage == index ? Palette.accent.gold : Color.white.opacity(0.3))
          .frame(width: 8, height: 8)
          .scaleEffect(currentPage == index ? 1.2 : 1.0)
          .animation(.spring(response: 0.3), value: currentPage)
      }
    }
    .padding(.bottom, 30)
  }

  // MARK: - Page 1: Logo Awe

  private var logoAwePage: some View {
    VStack(spacing: 30) {
      Spacer()

      // Animated Aperture eye
      ZStack {
        // Glow
        Circle()
          .fill(
            RadialGradient(
              colors: [Palette.accent.gold.opacity(0.4), Color.clear],
              center: .center,
              startRadius: 50,
              endRadius: 120
            )
          )
          .frame(width: 200, height: 200)

        // Eye icon
        Image(systemName: "eye.fill")
          .font(.system(size: 80))
          .foregroundStyle(
            LinearGradient(
              colors: [Palette.accent.gold, Palette.primary.cyan],
              startPoint: .topLeading,
              endPoint: .bottomTrailing
            )
          )
      }

      Text("APERTURE")
        .font(.system(size: 36, weight: .black, design: .rounded))
        .foregroundStyle(
          LinearGradient(
            colors: [.white, Palette.accent.gold],
            startPoint: .leading,
            endPoint: .trailing
          )
        )
        .tracking(6)

      Text("Open Your Eyes")
        .font(.system(size: 20, weight: .medium))
        .foregroundColor(.white.opacity(0.8))

      Text(
        "A unified path through awakening traditions,\nhidden history, and practical transformation."
      )
      .font(.system(size: 15))
      .foregroundColor(.white.opacity(0.6))
      .multilineTextAlignment(.center)
      .padding(.horizontal, 40)

      Spacer()

      continueButton {
        withAnimation { currentPage = 1 }
      }
    }
    .padding(.horizontal, 24)
  }

  // MARK: - Page 2: Motivation Quiz

  private var motivationQuizPage: some View {
    VStack(spacing: 24) {
      Spacer()

      // Dragon asks
      HStack(spacing: 12) {
        Text("🐉")
          .font(.system(size: 40))

        Text("What brings you to Aperture?")
          .font(.system(size: 24, weight: .bold))
          .foregroundColor(.white)
      }

      Text("Choose what resonates most. This helps personalize your journey.")
        .font(.system(size: 14))
        .foregroundColor(.white.opacity(0.6))
        .multilineTextAlignment(.center)
        .padding(.horizontal, 20)

      // Journey options
      VStack(spacing: 12) {
        ForEach(UserJourneyType.allCases, id: \.self) { journey in
          journeyOptionCard(journey)
        }
      }
      .padding(.horizontal, 20)

      Spacer()

      continueButton(disabled: selectedJourney == nil) {
        withAnimation { currentPage = 2 }
      }
    }
    .padding(.horizontal, 24)
  }

  private func journeyOptionCard(_ journey: UserJourneyType) -> some View {
    Button(action: {
      withAnimation(.spring(response: 0.3)) {
        selectedJourney = journey
      }
      HapticManager.shared.selectionChanged()
    }) {
      HStack(spacing: 16) {
        Text(journey.icon)
          .font(.system(size: 28))

        VStack(alignment: .leading, spacing: 2) {
          Text(journey.title)
            .font(.system(size: 17, weight: .semibold))
            .foregroundColor(.white)

          Text(journey.subtitle)
            .font(.system(size: 13))
            .foregroundColor(.white.opacity(0.6))
        }

        Spacer()

        if selectedJourney == journey {
          Image(systemName: "checkmark.circle.fill")
            .font(.system(size: 24))
            .foregroundColor(journey.color)
        }
      }
      .padding()
      .background(
        RoundedRectangle(cornerRadius: 16)
          .fill(selectedJourney == journey ? journey.color.opacity(0.2) : Color.white.opacity(0.05))
          .overlay(
            RoundedRectangle(cornerRadius: 16)
              .stroke(
                selectedJourney == journey ? journey.color : Color.white.opacity(0.1),
                lineWidth: selectedJourney == journey ? 2 : 1
              )
          )
      )
    }
    .buttonStyle(PlainButtonStyle())
  }

  // MARK: - Page 3: Path Reveal

  private var pathRevealPage: some View {
    VStack(spacing: 24) {
      Spacer()

      // Dragon speaks
      HStack(spacing: 12) {
        Text("🐉")
          .font(.system(size: 40))

        Text("Based on your intent...")
          .font(.system(size: 20, weight: .medium))
          .foregroundColor(.white.opacity(0.8))
      }

      if let journey = selectedJourney {
        // Primary module card
        VStack(spacing: 16) {
          Text("I recommend starting with")
            .font(.system(size: 14))
            .foregroundColor(.white.opacity(0.6))

          // Large module card
          VStack(spacing: 12) {
            Text(journey.icon)
              .font(.system(size: 50))

            Text(journey.primaryModule.uppercased())
              .font(.system(size: 28, weight: .black))
              .foregroundColor(.white)
              .tracking(4)

            Text(journey.recommendedContent)
              .font(.system(size: 15))
              .foregroundColor(.white.opacity(0.7))
              .multilineTextAlignment(.center)
              .padding(.horizontal)
          }
          .padding(.vertical, 30)
          .padding(.horizontal, 20)
          .frame(maxWidth: .infinity)
          .background(
            RoundedRectangle(cornerRadius: 20)
              .fill(journey.color.opacity(0.15))
              .overlay(
                RoundedRectangle(cornerRadius: 20)
                  .stroke(journey.color.opacity(0.5), lineWidth: 2)
              )
          )
        }
        .padding(.horizontal, 20)

        Text("This is your starting point, not your limit.\nYou can explore everything.")
          .font(.system(size: 14))
          .foregroundColor(.white.opacity(0.5))
          .multilineTextAlignment(.center)
      }

      Spacer()

      continueButton {
        withAnimation { currentPage = 3 }
      }
    }
    .padding(.horizontal, 24)
  }

  // MARK: - Page 4: Meet Sacred Geometry

  private var meetDragonPage: some View {
    VStack(spacing: 24) {
      Spacer()

      // Sacred Geometry animation
      ZStack {
        // Glow
        Circle()
          .fill(
            RadialGradient(
              colors: [Color(hex: "#FFD700").opacity(0.4), Color.clear],
              center: .center,
              startRadius: 40,
              endRadius: 100
            )
          )
          .frame(width: 180, height: 180)

        FlowerOfLifeBubbleShape()
          .stroke(
            LinearGradient(
              colors: [Color(hex: "#FFD700"), Color(hex: "#FFA500")],
              startPoint: .top,
              endPoint: .bottom
            ),
            lineWidth: 2
          )
          .frame(width: 100, height: 100)
      }

      Text("Earn Sacred Geometry Badges")
        .font(.system(size: 22, weight: .bold))
        .foregroundColor(.white)

      VStack(spacing: 12) {
        Text("Complete courses to unlock sacred shapes.")
          .foregroundColor(.white.opacity(0.7))

        Text("Each badge carries ancient wisdom.")
          .foregroundColor(Palette.accent.gold)
          .fontWeight(.medium)

        Text("Customize and share your collection.")
          .foregroundColor(.white.opacity(0.7))
      }
      .font(.system(size: 15))
      .multilineTextAlignment(.center)

      // Badge preview
      VStack(spacing: 8) {
        Text("Your first badge awaits...")
          .font(.system(size: 14))
          .foregroundColor(.white.opacity(0.6))

        HStack(spacing: 16) {
          ForEach([SacredGeometryShape.vesicaPiscis, .seedOfLife, .flowerOfLife], id: \.self) {
            shape in
            SacredGeometryView(shape: shape, lineColor: Color(hex: "#FFD700").opacity(0.4))
              .frame(width: 40, height: 40)
          }
        }
      }

      Spacer()

      continueButton {
        withAnimation { currentPage = 4 }
      }
    }
    .padding(.horizontal, 24)
  }

  // MARK: - Page 5: First Micro Win

  private var firstMicroWinPage: some View {
    VStack(spacing: 24) {
      Spacer()

      // Welcome insight
      HStack(spacing: 12) {
        Image(systemName: "sparkles")
          .font(.system(size: 30))
          .foregroundColor(Palette.accent.gold)

        Text("Here's your first insight...")
          .font(.system(size: 18, weight: .medium))
          .foregroundColor(.white.opacity(0.8))
      }

      if let journey = selectedJourney {
        // Insight card
        VStack(spacing: 16) {
          Text(journey.welcomeMessage)
            .font(.system(size: 17, weight: .medium))
            .foregroundColor(.white)
            .multilineTextAlignment(.center)

          Divider()
            .background(Color.white.opacity(0.2))

          // First insight based on journey
          Text(firstInsight(for: journey))
            .font(.system(size: 15))
            .foregroundColor(.white.opacity(0.8))
            .multilineTextAlignment(.center)
        }
        .padding(24)
        .background(
          RoundedRectangle(cornerRadius: 20)
            .fill(Color.white.opacity(0.05))
            .overlay(
              RoundedRectangle(cornerRadius: 20)
                .stroke(journey.color.opacity(0.3), lineWidth: 1)
            )
        )
        .padding(.horizontal, 20)
      }

      // Completion checkmark
      HStack(spacing: 8) {
        Image(systemName: "checkmark.circle.fill")
          .foregroundColor(.green)
        Text("You just took your first step.")
          .foregroundColor(.green)
      }
      .font(.system(size: 15, weight: .medium))

      // Optional: Deeper discovery with Persona Quiz
      Button(action: { showPersonaQuiz = true }) {
        HStack(spacing: 8) {
          Image(systemName: "person.fill.questionmark")
          Text("Discover your awakening archetype")
        }
        .font(.system(size: 14, weight: .medium))
        .foregroundColor(.purple)
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
        .background(
          Capsule()
            .stroke(Color.purple.opacity(0.5), lineWidth: 1)
        )
      }

      Spacer()

      // Enter Aperture button
      Button(action: completeOnboarding) {
        HStack {
          Text("Enter Aperture")
            .font(.system(size: 18, weight: .bold))
          Image(systemName: "arrow.right")
        }
        .foregroundColor(.black)
        .padding(.horizontal, 40)
        .padding(.vertical, 16)
        .background(
          Capsule()
            .fill(Palette.accent.gold)
        )
      }
      .padding(.bottom, 20)
    }
    .padding(.horizontal, 24)
    .sheet(isPresented: $showPersonaQuiz) {
      PersonaQuizView { _ in
        // Persona identified during onboarding
        showPersonaQuiz = false
      }
    }
  }

  private func firstInsight(for journey: UserJourneyType) -> String {
    switch journey {
    case .groundMe:
      return
        "Awakening can feel destabilizing—that's normal. The practices here are designed to help you find your center. Start with breathing. Start with presence. Everything else builds from there."
    case .showPatterns:
      return
        "History isn't what they taught you. The patterns repeat across centuries—the same control mechanisms, the same distractions, the same suppressed truths. Once you see them, you can't unsee them."
    case .teachPractice:
      return
        "Every culture discovered the same inner technology. Kundalini, Qi, Holy Spirit, Bodhi—different names for the same awakening mechanism. You're about to learn what they all point to."
    case .giveSources:
      return
        "The Nag Hammadi library, the Dead Sea Scrolls, the Corpus Hermeticum—these texts were hidden or suppressed for centuries. Now they're in your pocket. Question everything, including us."
    }
  }

  // MARK: - Continue Button

  private func continueButton(disabled: Bool = false, action: @escaping () -> Void) -> some View {
    Button(action: {
      action()
      HapticManager.shared.light()
    }) {
      Text("Continue")
        .font(.system(size: 17, weight: .semibold))
        .foregroundColor(disabled ? .gray : .white)
        .padding(.horizontal, 60)
        .padding(.vertical, 16)
        .background(
          Capsule()
            .fill(disabled ? Color.gray.opacity(0.3) : Palette.primary.cyan.opacity(0.8))
        )
    }
    .disabled(disabled)
    .padding(.bottom, 20)
  }

  // MARK: - Actions

  private func completeOnboarding() {
    guard let journey = selectedJourney else { return }

    // Save journey
    journeyStore.completeOnboarding(journeyType: journey)

    // Mark tutorial as seen
    tutorialStore.markSeen()

    HapticManager.shared.success()
    onComplete()
  }

  private func skipOnboarding() {
    // Use default journey
    journeyStore.completeOnboarding(journeyType: .showPatterns)

    tutorialStore.markSeen()
    onComplete()
  }
}

// MARK: - Preview

#Preview {
  OnboardingView(
    journeyStore: UserJourneyStore.shared,
    tutorialStore: TutorialStateStore()
  ) {
    print("Onboarding complete!")
  }
}
