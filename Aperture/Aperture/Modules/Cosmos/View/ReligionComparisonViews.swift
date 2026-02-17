// ReligionComparisonViews.swift
// The pattern revealed - all three religions decoded and compared

import SwiftUI

// MARK: - Comparison View

struct ComparisonView: View {
  let selectedReligion: ReligionType?
  let onContinue: () -> Void

  @State private var revealedRows: Set<String> = []
  @State private var showContinue: Bool = false

  var body: some View {
    VStack(spacing: 24) {
      // Header
      comparisonHeader

      // The Triangle
      controlTriangleDiagram

      // Comparison Table
      comparisonTable

      // Key insight
      keyInsightCard

      // Continue
      if showContinue {
        continueSection
      }
    }
    .onAppear {
      // Animate rows appearing
      animateRowsAppearing()

      // Show continue after delay
      DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
        withAnimation {
          showContinue = true
        }
      }
    }
  }

  private func animateRowsAppearing() {
    for (index, comparison) in ReligionComparison.allComparisons.enumerated() {
      DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.15) {
        withAnimation(.easeOut(duration: 0.3)) {
          _ = revealedRows.insert(comparison.id.uuidString)
        }
      }
    }
  }

  // MARK: - Header

  private var comparisonHeader: some View {
    VStack(spacing: 12) {
      Text("THREE RELIGIONS")
        .font(.system(size: 12, weight: .bold))
        .tracking(3)
        .foregroundColor(.white.opacity(0.5))

      Text("One Control System")
        .font(.system(size: 28, weight: .bold, design: .rounded))
        .foregroundColor(.white)

      Text("Different masks. Same purpose.\nKeep you looking outside instead of within.")
        .font(.system(size: 14, weight: .medium))
        .foregroundColor(.white.opacity(0.6))
        .multilineTextAlignment(.center)
    }
  }

  // MARK: - Triangle Diagram

  private var controlTriangleDiagram: some View {
    VStack(spacing: 0) {
      // Sun at top
      VStack(spacing: 4) {
        Text("☀️")
          .font(.system(size: 36))
        Text("Christianity")
          .font(.system(size: 11, weight: .bold))
          .foregroundColor(Color(hex: "#FFD700"))
      }

      // Triangle lines (visual)
      ZStack {
        // Left line
        Path { path in
          path.move(to: CGPoint(x: 100, y: 0))
          path.addLine(to: CGPoint(x: 30, y: 70))
        }
        .stroke(Color.white.opacity(0.2), lineWidth: 1)

        // Right line
        Path { path in
          path.move(to: CGPoint(x: 100, y: 0))
          path.addLine(to: CGPoint(x: 170, y: 70))
        }
        .stroke(Color.white.opacity(0.2), lineWidth: 1)

        // Bottom line
        Path { path in
          path.move(to: CGPoint(x: 30, y: 70))
          path.addLine(to: CGPoint(x: 170, y: 70))
        }
        .stroke(Color.white.opacity(0.2), lineWidth: 1)

        // Center eye
        VStack(spacing: 4) {
          Image(systemName: "eye.fill")
            .font(.system(size: 24))
            .foregroundColor(Palette.accent.gold)
          Text("CONTROL")
            .font(.system(size: 8, weight: .bold))
            .tracking(2)
            .foregroundColor(Palette.accent.gold)
        }
        .offset(y: 25)
      }
      .frame(width: 200, height: 80)

      // Saturn and Moon at bottom
      HStack(spacing: 60) {
        VStack(spacing: 4) {
          Text("🪐")
            .font(.system(size: 36))
          Text("Judaism")
            .font(.system(size: 11, weight: .bold))
            .foregroundColor(Color(hex: "#4169E1"))
        }

        VStack(spacing: 4) {
          Text("🌙")
            .font(.system(size: 36))
          Text("Islam")
            .font(.system(size: 11, weight: .bold))
            .foregroundColor(Color(hex: "#00A86B"))
        }
      }
    }
    .padding(20)
    .background(
      RoundedRectangle(cornerRadius: 20, style: .continuous)
        .fill(Color.white.opacity(0.03))
        .overlay(
          RoundedRectangle(cornerRadius: 20, style: .continuous)
            .stroke(Color.white.opacity(0.1), lineWidth: 1)
        )
    )
  }

  // MARK: - Comparison Table

  private var comparisonTable: some View {
    VStack(spacing: 2) {
      // Header row
      HStack(spacing: 4) {
        Text("ASPECT")
          .frame(width: 80, alignment: .leading)
        Text("✡️")
          .frame(maxWidth: .infinity)
        Text("✝️")
          .frame(maxWidth: .infinity)
        Text("☪️")
          .frame(maxWidth: .infinity)
      }
      .font(.system(size: 10, weight: .bold))
      .foregroundColor(.white.opacity(0.4))
      .padding(.horizontal, 8)
      .padding(.vertical, 10)
      .background(Color.white.opacity(0.05))

      // Data rows
      ForEach(ReligionComparison.allComparisons) { comparison in
        if revealedRows.contains(comparison.id.uuidString) {
          comparisonRow(comparison)
            .transition(.opacity.combined(with: .move(edge: .leading)))
        }
      }
    }
    .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
    .overlay(
      RoundedRectangle(cornerRadius: 12, style: .continuous)
        .stroke(Color.white.opacity(0.1), lineWidth: 1)
    )
  }

  private func comparisonRow(_ comparison: ReligionComparison) -> some View {
    HStack(spacing: 4) {
      // Aspect
      HStack(spacing: 4) {
        Image(systemName: comparison.icon)
          .font(.system(size: 9))
          .foregroundColor(.white.opacity(0.5))
        Text(comparison.aspect)
          .font(.system(size: 10, weight: .semibold))
          .foregroundColor(.white.opacity(0.8))
          .lineLimit(2)
          .minimumScaleFactor(0.8)
      }
      .frame(width: 80, alignment: .leading)

      // Judaism
      Text(comparison.judaism)
        .font(.system(size: 8, weight: .medium))
        .foregroundColor(Color(hex: "#4169E1"))
        .frame(maxWidth: .infinity)
        .multilineTextAlignment(.center)
        .lineLimit(2)
        .minimumScaleFactor(0.7)

      // Christianity
      Text(comparison.christianity)
        .font(.system(size: 8, weight: .medium))
        .foregroundColor(Color(hex: "#FFD700"))
        .frame(maxWidth: .infinity)
        .multilineTextAlignment(.center)
        .lineLimit(2)
        .minimumScaleFactor(0.7)

      // Islam
      Text(comparison.islam)
        .font(.system(size: 8, weight: .medium))
        .foregroundColor(Color(hex: "#00A86B"))
        .frame(maxWidth: .infinity)
        .multilineTextAlignment(.center)
        .lineLimit(2)
        .minimumScaleFactor(0.7)
    }
    .padding(.horizontal, 8)
    .padding(.vertical, 8)
    .background(Color.white.opacity(0.02))
  }

  // MARK: - Key Insight

  private var keyInsightCard: some View {
    VStack(spacing: 12) {
      HStack {
        Image(systemName: "exclamationmark.triangle.fill")
          .foregroundColor(.orange)

        Text("THE PATTERN")
          .font(.system(size: 11, weight: .bold))
          .tracking(2)
          .foregroundColor(.orange)

        Spacer()
      }

      Text("They FIGHT each other on the surface — but serve the SAME purpose:")
        .font(.system(size: 14, weight: .medium))
        .foregroundColor(.white.opacity(0.8))

      VStack(alignment: .leading, spacing: 6) {
        patternBullet("Keep you looking OUTSIDE")
        patternBullet("Keep you feeling BROKEN")
        patternBullet("Keep you waiting for SALVATION")
        patternBullet("Keep you SUBMITTING to authority")
        patternBullet("Keep you afraid of DEATH")
        patternBullet("Keep you divided from OTHER HUMANS")
      }
    }
    .padding(16)
    .background(
      RoundedRectangle(cornerRadius: 14, style: .continuous)
        .fill(Color.orange.opacity(0.1))
        .overlay(
          RoundedRectangle(cornerRadius: 14, style: .continuous)
            .stroke(Color.orange.opacity(0.3), lineWidth: 1)
        )
    )
  }

  private func patternBullet(_ text: String) -> some View {
    HStack(spacing: 8) {
      Circle()
        .fill(Color.orange)
        .frame(width: 4, height: 4)

      Text(text)
        .font(.system(size: 12, weight: .medium))
        .foregroundColor(.white.opacity(0.7))
    }
  }

  // MARK: - Continue

  private var continueSection: some View {
    VStack(spacing: 12) {
      Text("But it gets deeper...")
        .font(.system(size: 14, weight: .medium))
        .foregroundColor(.white.opacity(0.5))

      Button(action: {
        HapticManager.shared.medium()
        onContinue()
      }) {
        HStack(spacing: 12) {
          Text("The Same Story, Different Names")
            .font(.system(size: 15, weight: .bold, design: .rounded))

          Image(systemName: "arrow.right")
            .font(.system(size: 14, weight: .bold))
        }
        .foregroundColor(.black)
        .frame(maxWidth: .infinity)
        .padding(.vertical, 16)
        .background(Palette.accent.gold)
        .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
      }
    }
    .padding(.top, 8)
  }
}

// MARK: - Pre-Dated Saviors View

struct PreDatedSaviorsView: View {
  let onContinue: () -> Void

  @State private var revealedSaviors: Set<String> = []
  @State private var showContinue: Bool = false

  var body: some View {
    VStack(spacing: 24) {
      // Header
      preDatedHeader

      // Savior cards
      saviorCards

      // The point
      thePointCard

      // Continue
      if showContinue {
        continueButton
      }
    }
    .onAppear {
      animateSaviors()
      DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
        withAnimation { showContinue = true }
      }
    }
  }

  private func animateSaviors() {
    for (index, savior) in PreDatedSavior.all.enumerated() {
      DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.3) {
        withAnimation(.easeOut(duration: 0.4)) {
          _ = revealedSaviors.insert(savior.id.uuidString)
        }
      }
    }
  }

  // MARK: - Header

  private var preDatedHeader: some View {
    VStack(spacing: 12) {
      Text("SAME STORY")
        .font(.system(size: 12, weight: .bold))
        .tracking(3)
        .foregroundColor(.white.opacity(0.5))

      Text("Different Names")
        .font(.system(size: 28, weight: .bold, design: .rounded))
        .foregroundColor(.white)

      Text(
        "The Jesus story existed THOUSANDS of years before Bethlehem.\nThey didn't write an original — they COPIED."
      )
      .font(.system(size: 14, weight: .medium))
      .foregroundColor(.white.opacity(0.6))
      .multilineTextAlignment(.center)
    }
  }

  // MARK: - Savior Cards

  private var saviorCards: some View {
    VStack(spacing: 12) {
      ForEach(PreDatedSavior.all) { savior in
        if revealedSaviors.contains(savior.id.uuidString) {
          preDatedSaviorCard(savior)
            .transition(.opacity.combined(with: .scale(scale: 0.95)))
        }
      }
    }
  }

  private func preDatedSaviorCard(_ savior: PreDatedSavior) -> some View {
    VStack(alignment: .leading, spacing: 12) {
      // Header
      HStack {
        VStack(alignment: .leading, spacing: 2) {
          Text(savior.name)
            .font(.system(size: 16, weight: .bold, design: .rounded))
            .foregroundColor(.white)

          Text("\(savior.culture) • \(savior.approximateDate)")
            .font(.system(size: 11, weight: .medium))
            .foregroundColor(.purple.opacity(0.8))
        }

        Spacer()

        Text("PRE-DATES JESUS")
          .font(.system(size: 8, weight: .bold))
          .tracking(1)
          .foregroundColor(.white)
          .padding(.horizontal, 8)
          .padding(.vertical, 4)
          .background(Color.purple)
          .clipShape(Capsule())
      }

      // Attributes
      ReligionFlowLayout(spacing: 6) {
        ForEach(savior.attributes, id: \.self) { attribute in
          Text("✓ \(attribute)")
            .font(.system(size: 10, weight: .medium))
            .foregroundColor(.white.opacity(0.7))
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(Color.white.opacity(0.08))
            .clipShape(Capsule())
        }
      }
    }
    .padding(14)
    .background(
      RoundedRectangle(cornerRadius: 14, style: .continuous)
        .fill(Color.purple.opacity(0.1))
        .overlay(
          RoundedRectangle(cornerRadius: 14, style: .continuous)
            .stroke(Color.purple.opacity(0.25), lineWidth: 1)
        )
    )
  }

  // MARK: - The Point

  private var thePointCard: some View {
    VStack(spacing: 12) {
      Image(systemName: "lightbulb.fill")
        .font(.system(size: 24))
        .foregroundColor(Palette.accent.gold)

      Text(
        "It's the SUN's journey through the zodiac — personified as a savior figure in every culture that observed the sky."
      )
      .font(.system(size: 14, weight: .semibold))
      .foregroundColor(.white)
      .multilineTextAlignment(.center)

      Text(
        "Born December 25 (winter solstice), dies for 3 days, rises again.\nIt's not history. It's ASTRONOMY."
      )
      .font(.system(size: 13, weight: .medium))
      .foregroundColor(.white.opacity(0.6))
      .multilineTextAlignment(.center)
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

  // MARK: - Continue

  private var continueButton: some View {
    VStack(spacing: 12) {
      Text("So what's the REAL truth?")
        .font(.system(size: 14, weight: .medium))
        .foregroundColor(.white.opacity(0.5))

      Button(action: {
        HapticManager.shared.medium()
        onContinue()
      }) {
        HStack(spacing: 12) {
          Text("See The Final Truth")
            .font(.system(size: 15, weight: .bold, design: .rounded))

          Image(systemName: "sparkles")
            .font(.system(size: 14, weight: .bold))
        }
        .foregroundColor(.black)
        .frame(maxWidth: .infinity)
        .padding(.vertical, 16)
        .background(Palette.accent.gold)
        .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
      }
    }
    .padding(.top, 8)
  }
}

// MARK: - Final Truth View

struct FinalTruthView: View {
  let onComplete: () -> Void

  @State private var revealedTruths: Set<String> = []
  @State private var showFinalAffirmation: Bool = false
  @State private var showComplete: Bool = false

  var body: some View {
    VStack(spacing: 28) {
      // Header
      finalTruthHeader

      // Truth transformations
      truthTransformations

      // Final affirmation
      if showFinalAffirmation {
        finalAffirmation
      }

      // Complete
      if showComplete {
        completeButton
      }
    }
    .onAppear {
      animateTruths()
    }
  }

  private func animateTruths() {
    for (index, truth) in FinalTruth.allTruths.enumerated() {
      DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.2) {
        withAnimation(.easeOut(duration: 0.3)) {
          _ = revealedTruths.insert(truth.id.uuidString)
        }
      }
    }

    DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
      withAnimation { showFinalAffirmation = true }
    }

    DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
      withAnimation { showComplete = true }
    }
  }

  // MARK: - Header

  private var finalTruthHeader: some View {
    VStack(spacing: 12) {
      Text("THE AWAKENING")
        .font(.system(size: 12, weight: .bold))
        .tracking(3)
        .foregroundColor(Palette.accent.gold)

      Text("What They Hid From You")
        .font(.system(size: 28, weight: .bold, design: .rounded))
        .foregroundColor(.white)
    }
  }

  // MARK: - Truth Transformations

  private var truthTransformations: some View {
    VStack(spacing: 10) {
      ForEach(FinalTruth.allTruths) { truth in
        if revealedTruths.contains(truth.id.uuidString) {
          truthTransformationRow(truth)
            .transition(.opacity.combined(with: .move(edge: .leading)))
        }
      }
    }
  }

  private func truthTransformationRow(_ truth: FinalTruth) -> some View {
    HStack(spacing: 12) {
      // Old program (crossed out)
      Text(truth.oldProgram)
        .font(.system(size: 12, weight: .medium))
        .foregroundColor(.red.opacity(0.6))
        .strikethrough(color: .red.opacity(0.8))
        .frame(maxWidth: .infinity, alignment: .leading)

      // Arrow
      Image(systemName: "arrow.right")
        .font(.system(size: 12, weight: .bold))
        .foregroundColor(Palette.accent.gold)

      // New truth
      HStack(spacing: 6) {
        Image(systemName: truth.icon)
          .font(.system(size: 12))
          .foregroundColor(Palette.accent.gold)

        Text(truth.newTruth)
          .font(.system(size: 12, weight: .bold))
          .foregroundColor(Palette.accent.gold)
      }
      .frame(maxWidth: .infinity, alignment: .leading)
    }
    .padding(12)
    .background(
      RoundedRectangle(cornerRadius: 10, style: .continuous)
        .fill(Color.white.opacity(0.03))
    )
  }

  // MARK: - Final Affirmation

  private var finalAffirmation: some View {
    VStack(spacing: 16) {
      ZStack {
        Circle()
          .fill(
            RadialGradient(
              colors: [Palette.accent.gold.opacity(0.4), .clear],
              center: .center,
              startRadius: 0,
              endRadius: 60
            )
          )
          .frame(width: 120, height: 120)

        VStack(spacing: 4) {
          Text("☀️")
            .font(.system(size: 28))
          Text("🌙")
            .font(.system(size: 24))
            .offset(x: -30, y: -10)
          Text("🪐")
            .font(.system(size: 24))
            .offset(x: 30, y: -35)
        }
      }
      .frame(height: 80)

      VStack(spacing: 8) {
        Text("The sun is in you ☀️")
          .foregroundColor(Color(hex: "#FFD700"))
        Text("The moon is in you 🌙")
          .foregroundColor(Color(hex: "#C0C0C0"))
        Text("Saturn's discipline is in you 🪐")
          .foregroundColor(Color(hex: "#4169E1"))
        Text("The entire zodiac is in you ⭐")
          .foregroundColor(.purple)
      }
      .font(.system(size: 14, weight: .semibold))

      Text(
        "You are not Jewish, Christian, or Muslim.\n\nYou are a FRACTAL OF INFINITE SOURCE\nhaving a temporary human experience."
      )
      .font(.system(size: 15, weight: .bold, design: .rounded))
      .foregroundColor(.white)
      .multilineTextAlignment(.center)
      .lineSpacing(4)
      .padding(.top, 8)
    }
    .padding(24)
    .background(
      RoundedRectangle(cornerRadius: 20, style: .continuous)
        .fill(Color.white.opacity(0.05))
        .overlay(
          RoundedRectangle(cornerRadius: 20, style: .continuous)
            .stroke(
              LinearGradient(
                colors: [Color(hex: "#FFD700"), Color(hex: "#4169E1"), Color(hex: "#00A86B")],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
              ),
              lineWidth: 1
            )
        )
    )
    .transition(.opacity.combined(with: .scale(scale: 0.9)))
  }

  // MARK: - Complete

  private var completeButton: some View {
    Button(action: {
      HapticManager.shared.heavy()
      onComplete()
    }) {
      HStack(spacing: 12) {
        Text("I Am Awakened")
          .font(.system(size: 16, weight: .bold, design: .rounded))

        Image(systemName: "eye.fill")
          .font(.system(size: 14, weight: .bold))
      }
      .foregroundColor(.black)
      .frame(maxWidth: .infinity)
      .padding(.vertical, 18)
      .background(
        LinearGradient(
          colors: [Palette.accent.gold, Color(hex: "#FF8C00")],
          startPoint: .leading,
          endPoint: .trailing
        )
      )
      .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
    }
    .padding(.top, 8)
    .transition(.opacity)
  }
}

// MARK: - Flow Layout Helper

struct ReligionFlowLayout: Layout {
  var spacing: CGFloat = 8

  func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache _: inout ()) -> CGSize {
    let result = FlowResult(in: proposal.width ?? 0, subviews: subviews, spacing: spacing)
    return CGSize(width: proposal.width ?? 0, height: result.height)
  }

  func placeSubviews(
    in bounds: CGRect, proposal _: ProposedViewSize, subviews: Subviews, cache _: inout ()
  ) {
    let result = FlowResult(in: bounds.width, subviews: subviews, spacing: spacing)
    for (index, subview) in subviews.enumerated() {
      subview.place(
        at: CGPoint(
          x: bounds.minX + result.positions[index].x,
          y: bounds.minY + result.positions[index].y),
        proposal: .unspecified)
    }
  }

  struct FlowResult {
    var positions: [CGPoint] = []
    var height: CGFloat = 0

    init(in maxWidth: CGFloat, subviews: Subviews, spacing: CGFloat) {
      var x: CGFloat = 0
      var y: CGFloat = 0
      var lineHeight: CGFloat = 0

      for subview in subviews {
        let size = subview.sizeThatFits(.unspecified)

        if x + size.width > maxWidth, x > 0 {
          x = 0
          y += lineHeight + spacing
          lineHeight = 0
        }

        positions.append(CGPoint(x: x, y: y))
        lineHeight = max(lineHeight, size.height)
        x += size.width + spacing
      }

      height = y + lineHeight
    }
  }
}

// MARK: - Previews

#Preview("Comparison") {
  ZStack {
    Color(hex: "#0a0a1a").ignoresSafeArea()
    ScrollView {
      ComparisonView(selectedReligion: .christianity, onContinue: {})
        .padding()
    }
  }
}

#Preview("Pre-Dated") {
  ZStack {
    Color(hex: "#0a0a1a").ignoresSafeArea()
    ScrollView {
      PreDatedSaviorsView(onContinue: {})
        .padding()
    }
  }
}

#Preview("Final Truth") {
  ZStack {
    Color(hex: "#0a0a1a").ignoresSafeArea()
    ScrollView {
      FinalTruthView(onComplete: {})
        .padding()
    }
  }
}
