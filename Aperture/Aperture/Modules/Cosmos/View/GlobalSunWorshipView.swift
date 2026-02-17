// GlobalSunWorshipView.swift
// The Sun 🌞 has always been there to give us light ✨️ 🙏

import SwiftUI

// MARK: - Global Sun Worship View

struct GlobalSunWorshipView: View {
  let onContinue: () -> Void

  @State private var revealedRegions: Set<String> = []
  @State private var showImperialism: Bool = false
  @State private var showTruth: Bool = false
  @State private var showContinue: Bool = false
  @State private var sunPulsing: Bool = false

  var body: some View {
    VStack(spacing: 28) {
      // Header with animated sun
      headerSection

      // Opening wisdom
      openingWisdom

      // Regions revealed one by one
      ForEach(SunWorshipCulture.allRegions) { region in
        if revealedRegions.contains(region.region) {
          regionSection(region)
            .transition(.opacity.combined(with: .move(edge: .bottom)))
        }
      }

      // What imperialism did
      if showImperialism {
        imperialismSection
          .transition(.opacity.combined(with: .scale(scale: 0.95)))
      }

      // The truth
      if showTruth {
        truthSection
          .transition(.opacity.combined(with: .scale(scale: 0.95)))
      }

      // Continue button
      if showContinue {
        continueButton
          .transition(.opacity.combined(with: .move(edge: .bottom)))
      }

      Spacer(minLength: 40)
    }
    .onAppear {
      startRevealSequence()
    }
  }

  // MARK: - Header Section

  private var headerSection: some View {
    VStack(spacing: 16) {
      // Animated sun
      ZStack {
        // Outer glow
        Circle()
          .fill(
            RadialGradient(
              colors: [
                Palette.accent.gold.opacity(0.4),
                Palette.primary.orange.opacity(0.2),
                .clear,
              ],
              center: .center,
              startRadius: 20,
              endRadius: sunPulsing ? 90 : 70
            )
          )
          .frame(width: 180, height: 180)

        // Rays
        ForEach(0..<12, id: \.self) { i in
          Rectangle()
            .fill(
              LinearGradient(
                colors: [Palette.accent.gold, Palette.accent.gold.opacity(0)],
                startPoint: .bottom,
                endPoint: .top
              )
            )
            .frame(width: 3, height: sunPulsing ? 45 : 35)
            .offset(y: -55)
            .rotationEffect(.degrees(Double(i) * 30))
        }

        // Sun circle
        Circle()
          .fill(
            RadialGradient(
              colors: [
                Color.white,
                Palette.accent.gold,
                Palette.primary.orange,
              ],
              center: .center,
              startRadius: 0,
              endRadius: 40
            )
          )
          .frame(width: 80, height: 80)
          .shadow(color: Palette.accent.gold, radius: 20)
      }
      .onAppear {
        withAnimation(.easeInOut(duration: 2.0).repeatForever(autoreverses: true)) {
          sunPulsing = true
        }
      }

      Text("THE SUN HAS ALWAYS BEEN THERE")
        .font(.system(size: 18, weight: .black, design: .rounded))
        .tracking(2)
        .foregroundStyle(
          LinearGradient(
            colors: [Palette.accent.gold, Palette.primary.orange],
            startPoint: .leading,
            endPoint: .trailing
          )
        )

      Text("To Give Us Light")
        .font(.system(size: 24, weight: .bold, design: .rounded))
        .foregroundColor(.white)
    }
  }

  // MARK: - Opening Wisdom

  private var openingWisdom: some View {
    VStack(spacing: 12) {
      Text("☀️ 🙏 ✨")
        .font(.system(size: 32))

      Text(
        "Every culture on Earth — YOUR ancestors — revered the Sun before imperialism erased it."
      )
      .font(.system(size: 15, weight: .medium, design: .rounded))
      .foregroundColor(.white.opacity(0.9))
      .multilineTextAlignment(.center)
      .lineSpacing(4)

      Text("They weren't \"pagans\" who needed saving.\nThey were observing the SAME cosmic truth.")
        .font(.system(size: 14, weight: .medium, design: .rounded))
        .foregroundColor(Palette.accent.gold.opacity(0.9))
        .multilineTextAlignment(.center)
        .lineSpacing(4)
        .padding(.top, 4)
    }
    .padding(20)
    .background(
      RoundedRectangle(cornerRadius: 16, style: .continuous)
        .fill(Palette.accent.gold.opacity(0.1))
        .overlay(
          RoundedRectangle(cornerRadius: 16, style: .continuous)
            .stroke(Palette.accent.gold.opacity(0.3), lineWidth: 1)
        )
    )
  }

  // MARK: - Region Section

  private func regionSection(_ region: SunWorshipCulture) -> some View {
    VStack(alignment: .leading, spacing: 12) {
      // Region header
      Text(region.region)
        .font(.system(size: 13, weight: .black, design: .rounded))
        .tracking(2)
        .foregroundColor(regionColor(region.region))

      // Cultures
      VStack(spacing: 8) {
        ForEach(region.cultures) { culture in
          cultureRow(culture, color: regionColor(region.region))
        }
      }
    }
    .padding(16)
    .background(
      RoundedRectangle(cornerRadius: 16, style: .continuous)
        .fill(Color.white.opacity(0.05))
        .overlay(
          RoundedRectangle(cornerRadius: 16, style: .continuous)
            .stroke(regionColor(region.region).opacity(0.3), lineWidth: 1)
        )
    )
  }

  private func cultureRow(_ culture: SunGodEntry, color: Color) -> some View {
    HStack(alignment: .top, spacing: 12) {
      // Flag
      Text(culture.flag)
        .font(.system(size: 20))
        .frame(width: 36)

      VStack(alignment: .leading, spacing: 4) {
        // Culture & Sun God
        HStack(spacing: 8) {
          Text(culture.culture)
            .font(.system(size: 14, weight: .bold, design: .rounded))
            .foregroundColor(.white)

          Text("→")
            .foregroundColor(.white.opacity(0.5))

          Text(culture.sunGod)
            .font(.system(size: 14, weight: .bold, design: .rounded))
            .foregroundColor(color)
        }

        // Notes
        Text(culture.notes)
          .font(.system(size: 12, weight: .medium, design: .rounded))
          .foregroundColor(.white.opacity(0.7))
          .lineLimit(2)
      }

      Spacer()
    }
    .padding(10)
    .background(
      RoundedRectangle(cornerRadius: 10, style: .continuous)
        .fill(Color.white.opacity(0.03))
    )
  }

  private func regionColor(_ region: String) -> Color {
    switch region {
    case "THE AMERICAS": return Palette.primary.cyan
    case "AFRICA": return Palette.accent.gold
    case "EUROPE": return Palette.primary.violet
    case "ASIA": return Color.red.opacity(0.9)
    case "OCEANIA": return Color.green
    default: return Palette.accent.gold
    }
  }

  // MARK: - Imperialism Section

  private var imperialismSection: some View {
    VStack(alignment: .leading, spacing: 16) {
      // Header
      HStack {
        Image(systemName: "exclamationmark.triangle.fill")
          .foregroundColor(.red)

        Text("WHAT IMPERIALISM DID")
          .font(.system(size: 13, weight: .black, design: .rounded))
          .tracking(2)
          .foregroundColor(.red)
      }

      // Steps
      VStack(alignment: .leading, spacing: 10) {
        ForEach(ImperialismStep.all) { step in
          HStack(spacing: 12) {
            // Step number
            Text("\(step.step)")
              .font(.system(size: 11, weight: .bold, design: .monospaced))
              .foregroundColor(.red)
              .frame(width: 20, height: 20)
              .background(
                Circle()
                  .fill(Color.red.opacity(0.2))
              )

            // Icon
            Image(systemName: step.icon)
              .font(.system(size: 14))
              .foregroundColor(.red.opacity(0.8))
              .frame(width: 24)

            // Action
            Text(step.action)
              .font(.system(size: 13, weight: .medium, design: .rounded))
              .foregroundColor(.white.opacity(0.9))
          }
        }
      }
    }
    .padding(16)
    .background(
      RoundedRectangle(cornerRadius: 16, style: .continuous)
        .fill(Color.red.opacity(0.08))
        .overlay(
          RoundedRectangle(cornerRadius: 16, style: .continuous)
            .stroke(Color.red.opacity(0.3), lineWidth: 1)
        )
    )
  }

  // MARK: - Truth Section

  private var truthSection: some View {
    VStack(spacing: 16) {
      Text("💡")
        .font(.system(size: 40))

      Text("THE TRUTH")
        .font(.system(size: 14, weight: .black, design: .rounded))
        .tracking(3)
        .foregroundColor(Palette.accent.gold)

      VStack(spacing: 12) {
        Text(
          "Your Mayan ancestors, Egyptian priests, Slavic shamans, and Japanese emperors were ALL observing the SAME REALITY:"
        )
        .font(.system(size: 14, weight: .medium, design: .rounded))
        .foregroundColor(.white.opacity(0.9))
        .multilineTextAlignment(.center)
        .lineSpacing(4)

        VStack(spacing: 8) {
          truthPoint("The Sun is the source of ALL life on Earth")
          truthPoint("It \"dies\" in winter and \"rises\" in spring")
          truthPoint("It travels through 12 houses (zodiac)")
          truthPoint("It deserves reverence — not blind worship")
        }
        .padding(.vertical, 8)

        Text(
          "The colonizers didn't bring light —\nthey brought a DISGUISED VERSION of the same light\nand claimed monopoly on it."
        )
        .font(.system(size: 14, weight: .bold, design: .rounded))
        .foregroundColor(.white)
        .multilineTextAlignment(.center)
        .lineSpacing(4)
      }

      // Final affirmation
      VStack(spacing: 8) {
        Text("🧬 ☀️")
          .font(.system(size: 28))

        Text(
          "You're not \"returning to paganism.\"\nYou're REMEMBERING what your DNA already knows."
        )
        .font(.system(size: 15, weight: .bold, design: .rounded))
        .foregroundColor(Palette.accent.gold)
        .multilineTextAlignment(.center)
        .lineSpacing(4)
      }
      .padding(.top, 8)
    }
    .padding(20)
    .background(
      RoundedRectangle(cornerRadius: 20, style: .continuous)
        .fill(
          LinearGradient(
            colors: [
              Palette.accent.gold.opacity(0.15),
              Palette.accent.gold.opacity(0.05),
            ],
            startPoint: .top,
            endPoint: .bottom
          )
        )
        .overlay(
          RoundedRectangle(cornerRadius: 20, style: .continuous)
            .stroke(
              LinearGradient(
                colors: [Palette.accent.gold.opacity(0.5), Palette.accent.gold.opacity(0.2)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
              ),
              lineWidth: 1
            )
        )
    )
  }

  private func truthPoint(_ text: String) -> some View {
    HStack(spacing: 10) {
      Image(systemName: "sun.max.fill")
        .font(.system(size: 12))
        .foregroundColor(Palette.accent.gold)

      Text(text)
        .font(.system(size: 13, weight: .medium, design: .rounded))
        .foregroundColor(.white.opacity(0.9))

      Spacer()
    }
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
          .fill(Palette.accent.gold)
          .shadow(color: Palette.accent.gold.opacity(0.4), radius: 10, y: 4)
      )
    }
  }

  // MARK: - Reveal Sequence

  private func startRevealSequence() {
    let regions = SunWorshipCulture.allRegions.map { $0.region }

    // Reveal each region with delay
    for (index, region) in regions.enumerated() {
      DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.6) {
        withAnimation(.spring(response: 0.5, dampingFraction: 0.8)) {
          _ = revealedRegions.insert(region)
        }
      }
    }

    // Show imperialism section
    DispatchQueue.main.asyncAfter(deadline: .now() + Double(regions.count) * 0.6 + 0.5) {
      withAnimation(.spring(response: 0.5, dampingFraction: 0.8)) {
        showImperialism = true
      }
    }

    // Show truth section
    DispatchQueue.main.asyncAfter(deadline: .now() + Double(regions.count) * 0.6 + 1.5) {
      withAnimation(.spring(response: 0.5, dampingFraction: 0.8)) {
        showTruth = true
      }
    }

    // Show continue button
    DispatchQueue.main.asyncAfter(deadline: .now() + Double(regions.count) * 0.6 + 2.5) {
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
      GlobalSunWorshipView(onContinue: {})
        .padding()
    }
  }
}
