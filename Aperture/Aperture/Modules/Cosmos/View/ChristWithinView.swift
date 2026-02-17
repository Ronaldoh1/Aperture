// ChristWithinView.swift
// The Christ Within — Pineal Gland, Electromagnetic Being, Quantum Consciousness

import SwiftUI

// MARK: - Christ Within View

struct ChristWithinView: View {
  let onContinue: () -> Void

  @State private var selectedTab: ChristWithinTab = .rituals
  @State private var showContent: Bool = false
  @State private var eyePulsing: Bool = false
  @State private var showContinue: Bool = false

  enum ChristWithinTab: String, CaseIterable {
    case rituals = "Rituals Decoded"
    case calcification = "They Block It"
    case truth = "The Truth"
    case hidden = "Hidden In Plain Sight"
    case sovereignty = "Reclaim Power"
  }

  var body: some View {
    VStack(spacing: 20) {
      // Header
      headerSection

      // Tab selector
      tabSelector

      // Content based on selected tab
      if showContent {
        ScrollView(.vertical, showsIndicators: false) {
          VStack(spacing: 20) {
            switch selectedTab {
            case .rituals:
              ritualsContent
            case .calcification:
              calcificationContent
            case .truth:
              truthContent
            case .hidden:
              hiddenContent
            case .sovereignty:
              sovereigntyContent
            }
          }
          .padding(.bottom, 20)
        }
        .transition(.opacity)
      }

      // Continue button
      if showContinue {
        continueButton
          .transition(.opacity.combined(with: .move(edge: .bottom)))
      }
    }
    .onAppear {
      startReveal()
    }
  }

  // MARK: - Header Section

  private var headerSection: some View {
    VStack(spacing: 16) {
      // Animated third eye
      ZStack {
        // Outer glow
        Circle()
          .fill(
            RadialGradient(
              colors: [
                Palette.primary.violet.opacity(eyePulsing ? 0.5 : 0.3),
                Palette.primary.cyan.opacity(0.2),
                .clear,
              ],
              center: .center,
              startRadius: 20,
              endRadius: eyePulsing ? 80 : 60
            )
          )
          .frame(width: 160, height: 160)

        // Pine cone shape (triangle pointing up)
        Image(systemName: "triangle.fill")
          .font(.system(size: 50))
          .foregroundColor(Palette.primary.violet.opacity(0.3))
          .offset(y: 5)

        // Eye in center
        ZStack {
          Circle()
            .fill(
              RadialGradient(
                colors: [.white, Palette.primary.cyan, Palette.primary.violet],
                center: .center,
                startRadius: 0,
                endRadius: 25
              )
            )
            .frame(width: 50, height: 50)

          Circle()
            .fill(Color.black)
            .frame(width: 20, height: 20)

          Circle()
            .fill(Color.white)
            .frame(width: 6, height: 6)
            .offset(x: -3, y: -3)
        }
        .shadow(color: Palette.primary.violet, radius: 15)
      }
      .onAppear {
        withAnimation(.easeInOut(duration: 2.0).repeatForever(autoreverses: true)) {
          eyePulsing = true
        }
      }

      VStack(spacing: 6) {
        Text("THE CHRIST WITHIN")
          .font(.system(size: 20, weight: .black, design: .rounded))
          .tracking(3)
          .foregroundStyle(
            LinearGradient(
              colors: [Palette.primary.violet, Palette.primary.cyan],
              startPoint: .leading,
              endPoint: .trailing
            )
          )

        Text("Your Pineal Gland • Third Eye • Gateway to Source")
          .font(.system(size: 12, weight: .medium, design: .rounded))
          .foregroundColor(.white.opacity(0.7))
      }
    }
  }

  // MARK: - Tab Selector

  private var tabSelector: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack(spacing: 8) {
        ForEach(ChristWithinTab.allCases, id: \.self) { tab in
          Button(action: {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
              selectedTab = tab
            }
          }) {
            Text(tab.rawValue)
              .font(.system(size: 12, weight: .bold, design: .rounded))
              .foregroundColor(selectedTab == tab ? .black : .white.opacity(0.8))
              .padding(.horizontal, 14)
              .padding(.vertical, 10)
              .background(
                Capsule()
                  .fill(selectedTab == tab ? Palette.primary.violet : Color.white.opacity(0.1))
              )
          }
        }
      }
      .padding(.horizontal, 4)
    }
  }

  // MARK: - Rituals Content

  private var ritualsContent: some View {
    VStack(alignment: .leading, spacing: 20) {
      // Cross = Cube revelation
      crossCubeRevelation

      // Header
      sectionHeader(
        icon: "figure.wave",
        title: "RITUALS DECODED",
        color: .orange
      )

      Text(
        "Every ritual has a hidden meaning. They make you perform these acts without knowing what you're actually invoking."
      )
      .font(.system(size: 13, weight: .medium, design: .rounded))
      .foregroundColor(.white.opacity(0.8))
      .padding(.bottom, 8)

      // Rituals
      ForEach(RitualDecoded.all) { ritual in
        ritualRow(ritual)
      }
    }
    .padding(16)
    .background(cardBackground(color: .orange))
  }

  private var crossCubeRevelation: some View {
    VStack(spacing: 16) {
      // Visual: Cross unfolding to cube
      HStack(spacing: 20) {
        // 2D Cross
        VStack(spacing: 4) {
          Text("✝️")
            .font(.system(size: 40))
          Text("2D Cross")
            .font(.system(size: 10, weight: .medium))
            .foregroundColor(.white.opacity(0.6))
        }

        // Arrow
        Image(systemName: "arrow.right")
          .font(.system(size: 20, weight: .bold))
          .foregroundColor(.orange)

        // Folding animation representation
        VStack(spacing: 4) {
          Text("📐")
            .font(.system(size: 40))
          Text("Fold into 3D")
            .font(.system(size: 10, weight: .medium))
            .foregroundColor(.white.opacity(0.6))
        }

        // Arrow
        Image(systemName: "arrow.right")
          .font(.system(size: 20, weight: .bold))
          .foregroundColor(.orange)

        // 3D Cube
        VStack(spacing: 4) {
          Text("⬛")
            .font(.system(size: 40))
          Text("CUBE")
            .font(.system(size: 10, weight: .bold))
            .foregroundColor(.red)
        }
      }

      Text("THE CROSS IS A CUBE")
        .font(.system(size: 16, weight: .black, design: .rounded))
        .tracking(2)
        .foregroundColor(.orange)

      Text(
        "The cross is the UNFOLDED NET of Saturn's cube. When you make the sign of the cross, you're tracing the cube on your body."
      )
      .font(.system(size: 13, weight: .medium, design: .rounded))
      .foregroundColor(.white.opacity(0.9))
      .multilineTextAlignment(.center)
      .lineSpacing(4)

      // All three = cube worship
      VStack(spacing: 12) {
        Text("ALL THREE = CUBE WORSHIP")
          .font(.system(size: 12, weight: .black, design: .rounded))
          .tracking(2)
          .foregroundColor(.red)

        HStack(spacing: 16) {
          cubeWorshipItem(symbol: "✡️", religion: "Jews", action: "WEAR", description: "the cube")
          cubeWorshipItem(
            symbol: "✝️", religion: "Christians", action: "TRACE", description: "the cube")
          cubeWorshipItem(
            symbol: "☪️", religion: "Muslims", action: "CIRCLE", description: "the cube")
        }

        Text("Same Saturn. Different packaging.")
          .font(.system(size: 12, weight: .bold, design: .rounded))
          .foregroundColor(.white.opacity(0.7))
          .italic()
      }
      .padding(16)
      .background(
        RoundedRectangle(cornerRadius: 12, style: .continuous)
          .fill(Color.red.opacity(0.15))
          .overlay(
            RoundedRectangle(cornerRadius: 12, style: .continuous)
              .stroke(Color.red.opacity(0.3), lineWidth: 1)
          )
      )
    }
    .padding(16)
    .background(
      RoundedRectangle(cornerRadius: 16, style: .continuous)
        .fill(Color.orange.opacity(0.1))
        .overlay(
          RoundedRectangle(cornerRadius: 16, style: .continuous)
            .stroke(Color.orange.opacity(0.4), lineWidth: 2)
        )
    )
  }

  private func cubeWorshipItem(
    symbol: String, religion: String, action: String, description: String
  ) -> some View {
    VStack(spacing: 4) {
      Text(symbol)
        .font(.system(size: 24))
      Text(religion)
        .font(.system(size: 10, weight: .bold))
        .foregroundColor(.white)
      Text(action)
        .font(.system(size: 11, weight: .black))
        .foregroundColor(.red)
      Text(description)
        .font(.system(size: 9, weight: .medium))
        .foregroundColor(.white.opacity(0.7))
    }
  }

  private func ritualRow(_ ritual: RitualDecoded) -> some View {
    VStack(alignment: .leading, spacing: 10) {
      HStack(spacing: 10) {
        Image(systemName: ritual.icon)
          .font(.system(size: 18))
          .foregroundColor(.orange)
          .frame(width: 28)

        VStack(alignment: .leading, spacing: 2) {
          Text(ritual.ritual)
            .font(.system(size: 14, weight: .bold, design: .rounded))
            .foregroundColor(.white)

          Text(ritual.religion)
            .font(.system(size: 10, weight: .medium, design: .rounded))
            .foregroundColor(.orange.opacity(0.8))
        }

        Spacer()
      }

      // What you think vs What it is
      VStack(alignment: .leading, spacing: 6) {
        HStack(alignment: .top, spacing: 8) {
          Text("📖")
            .font(.system(size: 12))
          Text("They say: \"\(ritual.whatYouThink)\"")
            .font(.system(size: 11, weight: .medium, design: .rounded))
            .foregroundColor(.white.opacity(0.6))
            .strikethrough(color: .red.opacity(0.5))
        }

        HStack(alignment: .top, spacing: 8) {
          Text("👁️")
            .font(.system(size: 12))
          Text("Actually: \(ritual.whatItActuallyIs)")
            .font(.system(size: 11, weight: .bold, design: .rounded))
            .foregroundColor(.orange)
        }
      }
      .padding(.leading, 38)
    }
    .padding(12)
    .background(
      RoundedRectangle(cornerRadius: 10, style: .continuous)
        .fill(Color.orange.opacity(0.08))
    )
  }

  // MARK: - Calcification Content

  private var calcificationContent: some View {
    VStack(alignment: .leading, spacing: 16) {
      // Header
      sectionHeader(
        icon: "xmark.seal.fill",
        title: "HOW THEY CALCIFY YOUR PINEAL",
        color: .red
      )

      Text(
        "They put substances in your food, water, and products that literally turn your third eye to STONE."
      )
      .font(.system(size: 13, weight: .medium, design: .rounded))
      .foregroundColor(.white.opacity(0.8))
      .padding(.bottom, 8)

      // Calcifiers
      ForEach(PinealCalcifier.all) { item in
        calcifierRow(item)
      }
    }
    .padding(16)
    .background(cardBackground(color: .red))
  }

  private func calcifierRow(_ item: PinealCalcifier) -> some View {
    VStack(alignment: .leading, spacing: 8) {
      HStack(spacing: 10) {
        Image(systemName: item.icon)
          .font(.system(size: 16))
          .foregroundColor(.red)
          .frame(width: 28)

        Text(item.substance)
          .font(.system(size: 14, weight: .bold, design: .rounded))
          .foregroundColor(.white)

        Spacer()
      }

      Text("Sources: \(item.sources)")
        .font(.system(size: 11, weight: .medium, design: .rounded))
        .foregroundColor(.white.opacity(0.6))

      Text(item.effect)
        .font(.system(size: 12, weight: .medium, design: .rounded))
        .foregroundColor(.red.opacity(0.9))
        .lineLimit(3)
    }
    .padding(12)
    .background(
      RoundedRectangle(cornerRadius: 10, style: .continuous)
        .fill(Color.red.opacity(0.08))
    )
  }

  // MARK: - Truth Content

  private var truthContent: some View {
    VStack(alignment: .leading, spacing: 16) {
      // Header
      sectionHeader(
        icon: "eye.trianglebadge.exclamationmark.fill",
        title: "THE TRUTH THEY HID",
        color: Palette.primary.violet
      )

      // Truths
      ForEach(ChristWithinTruth.all) { truth in
        truthRow(truth)
      }

      // Electromagnetic being callout
      electromagneticSection
    }
    .padding(16)
    .background(cardBackground(color: Palette.primary.violet))
  }

  private func truthRow(_ truth: ChristWithinTruth) -> some View {
    HStack(alignment: .top, spacing: 12) {
      Image(systemName: truth.icon)
        .font(.system(size: 18))
        .foregroundColor(Palette.primary.violet)
        .frame(width: 28)

      VStack(alignment: .leading, spacing: 4) {
        Text(truth.revelation)
          .font(.system(size: 14, weight: .bold, design: .rounded))
          .foregroundColor(Palette.primary.violet)

        Text(truth.explanation)
          .font(.system(size: 12, weight: .medium, design: .rounded))
          .foregroundColor(.white.opacity(0.85))
          .lineLimit(4)
          .fixedSize(horizontal: false, vertical: true)
      }

      Spacer()
    }
    .padding(12)
    .background(
      RoundedRectangle(cornerRadius: 10, style: .continuous)
        .fill(Palette.primary.violet.opacity(0.08))
    )
  }

  private var electromagneticSection: some View {
    VStack(spacing: 12) {
      HStack {
        Image(systemName: "bolt.heart.fill")
          .foregroundColor(Palette.primary.cyan)
        Image(systemName: "antenna.radiowaves.left.and.right")
          .foregroundColor(Palette.primary.cyan)
        Image(systemName: "waveform.path.ecg")
          .foregroundColor(Palette.primary.cyan)
      }
      .font(.system(size: 24))

      Text("YOU ARE ELECTROMAGNETIC")
        .font(.system(size: 14, weight: .black, design: .rounded))
        .tracking(2)
        .foregroundColor(Palette.primary.cyan)

      Text(
        "Your heart's EM field is measurable 3+ feet away. Your brain produces electricity. You are a FIELD of consciousness connected to the quantum field — not just a meat suit."
      )
      .font(.system(size: 13, weight: .medium, design: .rounded))
      .foregroundColor(.white.opacity(0.9))
      .multilineTextAlignment(.center)
      .lineSpacing(4)

      Text(
        "You don't need a dark church to connect to Source.\nJust awareness. Breath. Sun. Silence."
      )
      .font(.system(size: 13, weight: .bold, design: .rounded))
      .foregroundColor(Palette.primary.cyan)
      .multilineTextAlignment(.center)
      .lineSpacing(4)
      .padding(.top, 4)
    }
    .padding(16)
    .background(
      RoundedRectangle(cornerRadius: 14, style: .continuous)
        .fill(Palette.primary.cyan.opacity(0.1))
        .overlay(
          RoundedRectangle(cornerRadius: 14, style: .continuous)
            .stroke(Palette.primary.cyan.opacity(0.3), lineWidth: 1)
        )
    )
  }

  // MARK: - Hidden Content

  private var hiddenContent: some View {
    VStack(alignment: .leading, spacing: 16) {
      // Header
      sectionHeader(
        icon: "eye.slash.fill",
        title: "HIDDEN IN PLAIN SIGHT",
        color: Palette.accent.gold
      )

      Text(
        "The pineal gland / pine cone / third eye is EVERYWHERE in ancient art and architecture. They know. They just don't tell YOU."
      )
      .font(.system(size: 13, weight: .medium, design: .rounded))
      .foregroundColor(.white.opacity(0.8))
      .padding(.bottom, 8)

      // Locations
      ForEach(PinealInHistory.all) { item in
        historyRow(item)
      }
    }
    .padding(16)
    .background(cardBackground(color: Palette.accent.gold))
  }

  private func historyRow(_ item: PinealInHistory) -> some View {
    HStack(alignment: .top, spacing: 12) {
      Image(systemName: item.icon)
        .font(.system(size: 18))
        .foregroundColor(Palette.accent.gold)
        .frame(width: 28)

      VStack(alignment: .leading, spacing: 4) {
        HStack {
          Text(item.location)
            .font(.system(size: 14, weight: .bold, design: .rounded))
            .foregroundColor(.white)

          Text("•")
            .foregroundColor(.white.opacity(0.4))

          Text(item.culture)
            .font(.system(size: 12, weight: .medium, design: .rounded))
            .foregroundColor(Palette.accent.gold)
        }

        Text(item.description)
          .font(.system(size: 12, weight: .medium, design: .rounded))
          .foregroundColor(.white.opacity(0.8))
          .lineLimit(3)
          .fixedSize(horizontal: false, vertical: true)
      }

      Spacer()
    }
    .padding(12)
    .background(
      RoundedRectangle(cornerRadius: 10, style: .continuous)
        .fill(Palette.accent.gold.opacity(0.08))
    )
  }

  // MARK: - Sovereignty Content

  private var sovereigntyContent: some View {
    VStack(alignment: .leading, spacing: 16) {
      // Header
      sectionHeader(
        icon: "crown.fill",
        title: "RECLAIM YOUR SOVEREIGNTY",
        color: Palette.accent.gold
      )

      Text(
        "You don't need a priest, a church, or permission. You ARE the temple. Here's how to reconnect:"
      )
      .font(.system(size: 13, weight: .medium, design: .rounded))
      .foregroundColor(.white.opacity(0.8))
      .padding(.bottom, 8)

      // Practices
      ForEach(SovereigntyPractice.all) { practice in
        practiceRow(practice)
      }

      // Final affirmation
      finalAffirmation
    }
    .padding(16)
    .background(cardBackground(color: Palette.accent.gold))
  }

  private func practiceRow(_ practice: SovereigntyPractice) -> some View {
    HStack(alignment: .top, spacing: 12) {
      Image(systemName: practice.icon)
        .font(.system(size: 18))
        .foregroundColor(Palette.accent.gold)
        .frame(width: 28)

      VStack(alignment: .leading, spacing: 4) {
        Text(practice.practice)
          .font(.system(size: 14, weight: .bold, design: .rounded))
          .foregroundColor(Palette.accent.gold)

        Text(practice.benefit)
          .font(.system(size: 12, weight: .medium, design: .rounded))
          .foregroundColor(.white.opacity(0.85))
          .lineLimit(3)
          .fixedSize(horizontal: false, vertical: true)
      }

      Spacer()
    }
    .padding(12)
    .background(
      RoundedRectangle(cornerRadius: 10, style: .continuous)
        .fill(Palette.accent.gold.opacity(0.08))
    )
  }

  private var finalAffirmation: some View {
    VStack(spacing: 12) {
      Text("👁️")
        .font(.system(size: 40))

      Text("\"The Kingdom of Heaven is WITHIN you.\"")
        .font(.system(size: 16, weight: .bold, design: .serif))
        .foregroundColor(Palette.accent.gold)
        .italic()
        .multilineTextAlignment(.center)

      Text("— Luke 17:21")
        .font(.system(size: 12, weight: .medium, design: .rounded))
        .foregroundColor(.white.opacity(0.6))

      Text("Not in a church. Not in the sky.\nWITHIN. Your pineal gland is the gateway.")
        .font(.system(size: 13, weight: .medium, design: .rounded))
        .foregroundColor(.white.opacity(0.9))
        .multilineTextAlignment(.center)
        .lineSpacing(4)
    }
    .padding(16)
    .background(
      RoundedRectangle(cornerRadius: 14, style: .continuous)
        .fill(
          LinearGradient(
            colors: [Palette.accent.gold.opacity(0.15), Palette.accent.gold.opacity(0.05)],
            startPoint: .top,
            endPoint: .bottom
          )
        )
        .overlay(
          RoundedRectangle(cornerRadius: 14, style: .continuous)
            .stroke(Palette.accent.gold.opacity(0.4), lineWidth: 1)
        )
    )
  }

  // MARK: - Helpers

  private func sectionHeader(icon: String, title: String, color: Color) -> some View {
    HStack(spacing: 10) {
      Image(systemName: icon)
        .foregroundColor(color)

      Text(title)
        .font(.system(size: 13, weight: .black, design: .rounded))
        .tracking(2)
        .foregroundColor(color)
    }
  }

  private func cardBackground(color: Color) -> some View {
    RoundedRectangle(cornerRadius: 16, style: .continuous)
      .fill(color.opacity(0.06))
      .overlay(
        RoundedRectangle(cornerRadius: 16, style: .continuous)
          .stroke(color.opacity(0.2), lineWidth: 1)
      )
  }

  // MARK: - Continue Button

  private var continueButton: some View {
    Button(action: {
      HapticManager.shared.medium()
      onContinue()
    }) {
      HStack(spacing: 12) {
        Text("See The Final Truth")
          .font(.system(size: 16, weight: .bold, design: .rounded))

        Image(systemName: "arrow.right")
          .font(.system(size: 14, weight: .bold))
      }
      .foregroundColor(.black)
      .frame(maxWidth: .infinity)
      .padding(.vertical, 16)
      .background(
        RoundedRectangle(cornerRadius: 14, style: .continuous)
          .fill(
            LinearGradient(
              colors: [Palette.primary.violet, Palette.primary.cyan],
              startPoint: .leading,
              endPoint: .trailing
            )
          )
          .shadow(color: Palette.primary.violet.opacity(0.4), radius: 10, y: 4)
      )
    }
  }

  // MARK: - Reveal

  private func startReveal() {
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
      withAnimation(.easeOut(duration: 0.4)) {
        showContent = true
      }
    }

    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
      withAnimation(.spring(response: 0.5, dampingFraction: 0.8)) {
        showContinue = true
      }
    }
  }
}

// MARK: - Preview

#Preview {
  ZStack {
    LinearGradient(
      colors: [Color(hex: "#0a0a1a"), Color(hex: "#1a0a2a")],
      startPoint: .top,
      endPoint: .bottom
    )
    .ignoresSafeArea()

    ScrollView {
      ChristWithinView(onContinue: {})
        .padding()
    }
  }
}
