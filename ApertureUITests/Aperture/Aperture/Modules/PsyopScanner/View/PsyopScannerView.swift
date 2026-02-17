// PsyopScannerView.swift
// Psyop Scanner: Detect manipulation, protect your peace

import SwiftUI

struct PsyopScannerView: View {
  @State private var inputText: String = ""
  @State private var scanResult: PsyopScanResult?
  @State private var isScanning: Bool = false
  @State private var showBreathing: Bool = false
  @State private var showGrounding: Bool = false
  @Environment(\.dismiss) private var dismiss

  private let engine = PsyopScannerEngine.shared

  var body: some View {
    NavigationStack {
      ZStack {
        LinearGradient(
          colors: [Color(hex: "#08080c"), Color(hex: "#0c0c14"), Color(hex: "#08080c")],
          startPoint: .top,
          endPoint: .bottom
        )
        .ignoresSafeArea()

        ScrollView(showsIndicators: false) {
          VStack(spacing: 24) {
            headerSection
            inputSection

            if let result = scanResult {
              resultsSection(result)
            }

            Spacer(minLength: 100)
          }
          .padding(.horizontal, 20)
          .padding(.top, 16)
        }
      }
      .navigationTitle("Psyop Scanner")
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
      .sheet(isPresented: $showBreathing) {
        PsyopBreathingView()
      }
      .sheet(isPresented: $showGrounding) {
        PsyopGroundingView()
      }
    }
  }

  // MARK: - Header

  private var headerSection: some View {
    VStack(spacing: 12) {
      ZStack {
        Circle()
          .fill(
            RadialGradient(
              colors: [Palette.accent.cyan.opacity(0.3), Color.clear], center: .center,
              startRadius: 30, endRadius: 50)
          )
          .frame(width: 100, height: 100)

        Circle()
          .fill(
            LinearGradient(
              colors: [Palette.accent.cyan, Palette.accent.violet], startPoint: .topLeading,
              endPoint: .bottomTrailing)
          )
          .frame(width: 70, height: 70)

        Image(systemName: "shield.checkered")
          .font(.system(size: 32, weight: .medium))
          .foregroundColor(.white)
      }

      Text("Psyop Scanner")
        .font(.system(size: 24, weight: .bold, design: .rounded))
        .foregroundColor(Palette.text.primary)

      Text("Detect manipulation before it hijacks your emotions")
        .font(.system(size: 14, weight: .medium))
        .foregroundColor(Palette.text.secondary)
        .multilineTextAlignment(.center)
    }
  }

  // MARK: - Input

  private var inputSection: some View {
    VStack(spacing: 16) {
      ZStack(alignment: .topLeading) {
        if inputText.isEmpty {
          Text("Paste any headline, article, or social media post...")
            .font(.system(size: 15))
            .foregroundColor(Palette.text.muted)
            .padding(.horizontal, 16)
            .padding(.vertical, 14)
        }

        TextEditor(text: $inputText)
          .font(.system(size: 15))
          .foregroundColor(Palette.text.primary)
          .scrollContentBackground(.hidden)
          .padding(.horizontal, 12)
          .padding(.vertical, 10)
      }
      .frame(minHeight: 120)
      .background(
        RoundedRectangle(cornerRadius: 16)
          .fill(Palette.surface.fieldFill)
          .overlay(
            RoundedRectangle(cornerRadius: 16).stroke(Palette.surface.fieldStroke, lineWidth: 1))
      )

      HStack(spacing: 12) {
        Button {
          if let clipboardText = UIPasteboard.general.string {
            inputText = clipboardText
            HapticManager.shared.light()
          }
        } label: {
          HStack(spacing: 6) {
            Image(systemName: "doc.on.clipboard")
            Text("Paste")
          }
          .font(.system(size: 13, weight: .semibold))
          .foregroundColor(Palette.text.secondary)
          .padding(.horizontal, 14)
          .padding(.vertical, 10)
          .background(Capsule().fill(Palette.surface.fieldFill))
        }

        if !inputText.isEmpty {
          Button {
            withAnimation {
              inputText = ""
              scanResult = nil
            }
          } label: {
            HStack(spacing: 4) {
              Image(systemName: "xmark")
              Text("Clear")
            }
            .font(.system(size: 13, weight: .semibold))
            .foregroundColor(Palette.text.muted)
            .padding(.horizontal, 14)
            .padding(.vertical, 10)
            .background(Capsule().fill(Palette.surface.fieldFill))
          }
        }

        Spacer()

        Button {
          performScan()
        } label: {
          HStack(spacing: 8) {
            if isScanning {
              ProgressView().progressViewStyle(CircularProgressViewStyle(tint: .white)).scaleEffect(
                0.8)
            } else {
              Image(systemName: "magnifyingglass")
            }
            Text("Scan")
          }
          .font(.system(size: 15, weight: .bold))
          .foregroundColor(.white)
          .padding(.horizontal, 24)
          .padding(.vertical, 12)
          .background(
            Capsule().fill(
              LinearGradient(
                colors: [Palette.accent.cyan, Palette.accent.violet], startPoint: .leading,
                endPoint: .trailing)))
        }
        .disabled(inputText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || isScanning)
        .opacity(inputText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ? 0.5 : 1)
      }
    }
  }

  // MARK: - Results

  private func resultsSection(_ result: PsyopScanResult) -> some View {
    VStack(spacing: 20) {
      threatCard(result)

      if result.overallThreatLevel == .high {
        urgentCalmCard()
      }

      scoresCard(result)

      if !result.detectedPatterns.isEmpty {
        patternsCard(result)
      }

      calmOptionsCard(result)
    }
  }

  private func threatCard(_ result: PsyopScanResult) -> some View {
    VStack(spacing: 12) {
      HStack(spacing: 12) {
        ZStack {
          Circle().fill(result.overallThreatLevel.color.opacity(0.2)).frame(width: 50, height: 50)
          Image(systemName: result.overallThreatLevel.icon).font(.system(size: 24)).foregroundColor(
            result.overallThreatLevel.color)
        }

        VStack(alignment: .leading, spacing: 4) {
          Text("MANIPULATION LEVEL").font(.system(size: 10, weight: .bold)).foregroundColor(
            Palette.text.muted
          ).tracking(1)
          Text(result.overallThreatLevel.rawValue.uppercased()).font(
            .system(size: 22, weight: .black, design: .rounded)
          ).foregroundColor(result.overallThreatLevel.color)
        }
        Spacer()
      }

      Text(result.overallThreatLevel.message)
        .font(.system(size: 14, weight: .medium))
        .foregroundColor(Palette.text.primary)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    .padding(16)
    .background(
      RoundedRectangle(cornerRadius: 16).fill(result.overallThreatLevel.color.opacity(0.1)).overlay(
        RoundedRectangle(cornerRadius: 16).stroke(
          result.overallThreatLevel.color.opacity(0.3), lineWidth: 1)))
  }

  private func urgentCalmCard() -> some View {
    VStack(spacing: 16) {
      HStack {
        Image(systemName: "exclamationmark.triangle.fill").foregroundColor(.orange)
        Text("RECOMMENDED: CALM FIRST").font(.system(size: 11, weight: .bold)).foregroundColor(
          .orange
        ).tracking(1)
        Spacer()
      }

      Text("This content is designed to trigger strong reactions. Reset your nervous system first.")
        .font(.system(size: 14, weight: .medium))
        .foregroundColor(Palette.text.primary)

      HStack(spacing: 12) {
        Button {
          showBreathing = true
          HapticManager.shared.medium()
        } label: {
          HStack(spacing: 8) {
            Image(systemName: "wind")
            Text("Breathe")
          }
          .font(.system(size: 14, weight: .bold))
          .foregroundColor(.white)
          .frame(maxWidth: .infinity)
          .padding(.vertical, 14)
          .background(RoundedRectangle(cornerRadius: 12).fill(Palette.accent.cyan))
        }

        Button {
          showGrounding = true
          HapticManager.shared.medium()
        } label: {
          HStack(spacing: 8) {
            Image(systemName: "figure.stand")
            Text("Ground")
          }
          .font(.system(size: 14, weight: .bold))
          .foregroundColor(.white)
          .frame(maxWidth: .infinity)
          .padding(.vertical, 14)
          .background(RoundedRectangle(cornerRadius: 12).fill(.orange))
        }
      }
    }
    .padding(16)
    .background(
      RoundedRectangle(cornerRadius: 16).fill(Color.orange.opacity(0.1)).overlay(
        RoundedRectangle(cornerRadius: 16).stroke(Color.orange.opacity(0.3), lineWidth: 1)))
  }

  private func scoresCard(_ result: PsyopScanResult) -> some View {
    VStack(spacing: 16) {
      HStack {
        Image(systemName: "chart.bar.fill").foregroundColor(Palette.accent.cyan)
        Text("ANALYSIS").font(.system(size: 11, weight: .bold)).foregroundColor(Palette.accent.cyan)
          .tracking(1)
        Spacer()
      }

      HStack(spacing: 16) {
        scoreGauge(
          "Fear", result.fearScore, 1.0, String(format: "%.0f%%", result.fearScore * 100),
          result.fearScore > 0.5 ? .red : .green)
        scoreGauge(
          "Psyop", Double(result.psyopScore), 10, "\(result.psyopScore)/10",
          result.psyopScore > 6 ? .red : .green)

        VStack(spacing: 6) {
          ZStack {
            Circle().fill(
              result.deceptionDetected ? Color.red.opacity(0.2) : Color.green.opacity(0.2)
            ).frame(width: 50, height: 50)
            Image(
              systemName: result.deceptionDetected
                ? "exclamationmark.triangle.fill" : "checkmark.circle.fill"
            ).font(.system(size: 22)).foregroundColor(result.deceptionDetected ? .red : .green)
          }
          Text("Deception").font(.system(size: 11, weight: .medium)).foregroundColor(
            Palette.text.secondary)
        }
        .frame(maxWidth: .infinity)
      }
    }
    .padding(16)
    .background(RoundedRectangle(cornerRadius: 16).fill(Palette.surface.fieldFill))
  }

  private func scoreGauge(
    _ title: String, _ value: Double, _ maxValue: Double, _ displayValue: String, _ color: Color
  ) -> some View {
    VStack(spacing: 6) {
      ZStack {
        Circle().stroke(Color.white.opacity(0.1), lineWidth: 5).frame(width: 50, height: 50)
        Circle().trim(from: 0, to: CGFloat(min(value / maxValue, 1.0))).stroke(
          color, style: StrokeStyle(lineWidth: 5, lineCap: .round)
        ).frame(width: 50, height: 50).rotationEffect(.degrees(-90))
        Text(displayValue).font(.system(size: 10, weight: .bold, design: .monospaced))
          .foregroundColor(color)
      }
      Text(title).font(.system(size: 11, weight: .medium)).foregroundColor(Palette.text.secondary)
    }
    .frame(maxWidth: .infinity)
  }

  private func patternsCard(_ result: PsyopScanResult) -> some View {
    VStack(alignment: .leading, spacing: 12) {
      HStack {
        Image(systemName: "eye.trianglebadge.exclamationmark.fill").foregroundColor(.orange)
        Text("PATTERNS DETECTED").font(.system(size: 11, weight: .bold)).foregroundColor(.orange)
          .tracking(1)
        Spacer()
        Text("\(result.detectedPatterns.count)").font(.system(size: 12, weight: .bold))
          .foregroundColor(.orange).padding(.horizontal, 8).padding(.vertical, 4).background(
            Capsule().fill(Color.orange.opacity(0.2)))
      }

      ForEach(result.detectedPatterns) { pattern in
        HStack(alignment: .top, spacing: 12) {
          Image(systemName: pattern.type.icon).font(.system(size: 16)).foregroundColor(
            pattern.type.color
          ).frame(width: 24)
          VStack(alignment: .leading, spacing: 4) {
            Text(pattern.type.rawValue).font(.system(size: 14, weight: .bold)).foregroundColor(
              Palette.text.primary)
            Text(pattern.explanation).font(.system(size: 12)).foregroundColor(
              Palette.text.secondary)
          }
        }
        .padding(12)
        .background(RoundedRectangle(cornerRadius: 10).fill(pattern.type.color.opacity(0.1)))
      }
    }
    .padding(16)
    .background(RoundedRectangle(cornerRadius: 16).fill(Palette.surface.fieldFill))
  }

  private func calmOptionsCard(_ result: PsyopScanResult) -> some View {
    VStack(alignment: .leading, spacing: 16) {
      HStack {
        Image(systemName: "leaf.fill").foregroundColor(.green)
        Text("RECLAIM YOUR CALM").font(.system(size: 11, weight: .bold)).foregroundColor(.green)
          .tracking(1)
        Spacer()
      }

      ForEach(result.calmOptions) { option in
        HStack(spacing: 12) {
          Image(systemName: option.type.icon).font(.system(size: 18)).foregroundColor(
            option.type.color
          ).frame(width: 28)
          VStack(alignment: .leading, spacing: 2) {
            Text(option.title).font(.system(size: 13, weight: .semibold)).foregroundColor(
              Palette.text.primary)
            Text(option.description).font(.system(size: 11)).foregroundColor(Palette.text.secondary)
          }
          Spacer()
        }
        .padding(10)
        .background(RoundedRectangle(cornerRadius: 8).fill(Color.white.opacity(0.03)))
      }
    }
    .padding(16)
    .background(RoundedRectangle(cornerRadius: 16).fill(Color.green.opacity(0.1)))
  }

  // MARK: - Actions

  private func performScan() {
    guard !inputText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { return }
    isScanning = true
    HapticManager.shared.light()

    DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
      withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
        scanResult = engine.analyze(text: inputText)
        isScanning = false
      }

      if let result = scanResult {
        switch result.overallThreatLevel {
        case .high: HapticManager.shared.heavy()
        case .medium: HapticManager.shared.medium()
        case .low: HapticManager.shared.light()
        }
      }
    }
  }
}

// MARK: - Breathing View

struct PsyopBreathingView: View {
  @Environment(\.dismiss) private var dismiss
  @State private var breathScale: CGFloat = 0.5
  @State private var breathPhase = "Inhale"
  @State private var isActive = false

  var body: some View {
    NavigationStack {
      ZStack {
        Color.black.ignoresSafeArea()

        VStack(spacing: 40) {
          Text("Box Breathing").font(.system(size: 26, weight: .bold)).foregroundColor(.white)
          Text("4 in • 4 hold • 4 out • 4 hold").font(.system(size: 14)).foregroundColor(.gray)

          Spacer()

          ZStack {
            Circle().stroke(Color.white.opacity(0.1), lineWidth: 4).frame(width: 200, height: 200)
            Circle().fill(
              RadialGradient(
                colors: [Palette.accent.cyan.opacity(0.6), Palette.accent.cyan.opacity(0.1)],
                center: .center, startRadius: 0, endRadius: 100)
            ).frame(width: 200, height: 200).scaleEffect(breathScale)
            Text(breathPhase).font(.system(size: 22, weight: .bold)).foregroundColor(.white)
          }

          Spacer()

          Button {
            if isActive { stopBreathing() } else { startBreathing() }
          } label: {
            HStack(spacing: 8) {
              Image(systemName: isActive ? "stop.fill" : "play.fill")
              Text(isActive ? "Stop" : "Start")
            }
            .font(.system(size: 16, weight: .bold))
            .foregroundColor(.white)
            .frame(width: 160)
            .padding(.vertical, 14)
            .background(Capsule().fill(isActive ? Color.red : Palette.accent.cyan))
          }

          Spacer()
        }
        .padding()
      }
      .toolbar {
        ToolbarItem(placement: .topBarTrailing) {
          Button("Done") { dismiss() }.foregroundColor(Palette.accent.gold)
        }
      }
    }
  }

  private func startBreathing() {
    isActive = true
    runCycle()
  }

  private func stopBreathing() {
    isActive = false
  }

  private func runCycle() {
    guard isActive else { return }
    breathPhase = "Inhale"
    withAnimation(.easeInOut(duration: 4)) { breathScale = 1.0 }

    DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
      guard self.isActive else { return }
      self.breathPhase = "Hold"

      DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
        guard self.isActive else { return }
        self.breathPhase = "Exhale"
        withAnimation(.easeInOut(duration: 4)) { self.breathScale = 0.5 }

        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
          guard self.isActive else { return }
          self.breathPhase = "Hold"

          DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            self.runCycle()
          }
        }
      }
    }
  }
}

// MARK: - Grounding View

struct PsyopGroundingView: View {
  @Environment(\.dismiss) private var dismiss
  @State private var currentStep = 0

  private let steps = [
    ("5️⃣", "See 5 things around you"),
    ("4️⃣", "Touch 4 different textures"),
    ("3️⃣", "Hear 3 distinct sounds"),
    ("2️⃣", "Smell 2 things"),
    ("1️⃣", "Taste 1 thing"),
  ]

  var body: some View {
    NavigationStack {
      ZStack {
        Color.black.ignoresSafeArea()

        VStack(spacing: 32) {
          Text("5-4-3-2-1 Grounding").font(.system(size: 26, weight: .bold)).foregroundColor(.white)

          Spacer()

          VStack(spacing: 16) {
            Text(steps[currentStep].0).font(.system(size: 60))
            Text(steps[currentStep].1).font(.system(size: 20, weight: .bold)).foregroundColor(
              .white)
          }

          Spacer()

          HStack(spacing: 8) {
            ForEach(0..<5, id: \.self) { i in
              Circle().fill(i <= currentStep ? Color.orange : Color.white.opacity(0.2)).frame(
                width: 10, height: 10)
            }
          }

          Button {
            if currentStep < 4 { withAnimation { currentStep += 1 } } else { dismiss() }
          } label: {
            Text(currentStep < 4 ? "Done, Next" : "Finish")
              .font(.system(size: 15, weight: .bold))
              .foregroundColor(.white)
              .padding(.horizontal, 28)
              .padding(.vertical, 14)
              .background(Capsule().fill(Color.orange))
          }

          Spacer()
        }
        .padding()
      }
      .toolbar {
        ToolbarItem(placement: .topBarTrailing) {
          Button("Done") { dismiss() }.foregroundColor(Palette.accent.gold)
        }
      }
    }
  }
}

// MARK: - Card for Landing Page

struct PsyopScannerCard: View {
  @State private var showScanner = false
  @State private var shieldPulse = false

  var body: some View {
    Button {
      HapticManager.shared.medium()
      showScanner = true
    } label: {
      HStack(spacing: 16) {
        ZStack {
          Circle().stroke(Palette.accent.cyan.opacity(shieldPulse ? 0.4 : 0.1), lineWidth: 2).frame(
            width: 60, height: 60
          ).scaleEffect(shieldPulse ? 1.2 : 1.0)
          Circle().fill(
            LinearGradient(
              colors: [Palette.accent.cyan, Palette.accent.violet], startPoint: .topLeading,
              endPoint: .bottomTrailing)
          ).frame(width: 50, height: 50)
          Image(systemName: "shield.checkered").font(.system(size: 24, weight: .medium))
            .foregroundColor(.white)
        }
        .accessibilityHidden(true)

        VStack(alignment: .leading, spacing: 4) {
          HStack(spacing: 6) {
            Text("PSYOP SCANNER").font(.system(size: 13, weight: .black, design: .rounded))
              .tracking(1).foregroundStyle(
                LinearGradient(
                  colors: [Palette.accent.cyan, Palette.accent.violet], startPoint: .leading,
                  endPoint: .trailing))
            Text("NEW").font(.system(size: 8, weight: .black)).foregroundColor(.white).padding(
              .horizontal, 5
            ).padding(.vertical, 2).background(Capsule().fill(Palette.primary.red))
          }
          Text("Detect manipulation • Protect your peace").font(.system(size: 12, weight: .medium))
            .foregroundColor(Palette.text.secondary)
        }

        Spacer()
        Image(systemName: "chevron.right").font(.system(size: 14, weight: .semibold))
          .foregroundColor(Palette.accent.cyan.opacity(0.7)).accessibilityHidden(true)
      }
      .padding(16)
      .background(
        RoundedRectangle(cornerRadius: 16).fill(Palette.surface.fieldFill).overlay(
          RoundedRectangle(cornerRadius: 16).stroke(
            LinearGradient(
              colors: [Palette.accent.cyan.opacity(0.4), Palette.accent.violet.opacity(0.2)],
              startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 1)))
    }
    .buttonStyle(ScaleButtonStyle())
    .accessibilityLabel("Psyop Scanner, new feature")
    .accessibilityHint(
      "Detect manipulation tactics in text and protect your mental peace. Double tap to open"
    )
    .onAppear {
      withAnimation(.easeInOut(duration: 2).repeatForever(autoreverses: true)) {
        shieldPulse = true
      }
    }
    .fullScreenCover(isPresented: $showScanner) { PsyopScannerView() }
  }
}

#Preview { PsyopScannerView() }
