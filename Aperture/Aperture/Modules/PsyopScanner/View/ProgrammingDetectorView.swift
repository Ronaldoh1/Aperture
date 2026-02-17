// ProgrammingDetectorView.swift
// AR Programming Detector — Scan any label, headline, or text
// Overlays "PROGRAMMING DETECTED" with analysis using PsyopScannerEngine
// Uses VisionKit DataScannerViewController for real-time OCR
// ☀️ SunFlow: Reignited

import SwiftUI
import VisionKit

// MARK: - Programming Detector View

@available(iOS 16.0, *)
struct ProgrammingDetectorView: View {
  @Environment(\.dismiss) private var dismiss
  @State private var scannedText: String = ""
  @State private var scanResult: ProgrammingScanResult?
  @State private var isScanning: Bool = true
  @State private var showOverlay: Bool = false
  @State private var pulsePhase: CGFloat = 0
  @State private var overlayOpacity: Double = 0
  @State private var scanLineOffset: CGFloat = -200

  private let engine = PsyopScannerEngine.shared

  var body: some View {
    NavigationStack {
      ZStack {
        Color.black.ignoresSafeArea()

        if isScanning {
          scanningInterface
        } else if let result = scanResult {
          resultsInterface(result)
        }

        // Scan line animation overlay
        if isScanning {
          scanLineAnimation
        }

        // "PROGRAMMING DETECTED" flash overlay
        if showOverlay {
          programmingDetectedOverlay
        }
      }
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .topBarLeading) {
          Button {
            dismiss()
          } label: {
            HStack(spacing: 4) {
              Image(systemName: "xmark")
              Text("Close")
            }
            .foregroundColor(Color(hex: "#E74C3C"))
          }
        }
        ToolbarItem(placement: .principal) {
          HStack(spacing: 6) {
            Image(systemName: "eye.trianglebadge.exclamationmark")
              .foregroundColor(Color(hex: "#E74C3C"))
            Text("PROGRAMMING DETECTOR")
              .font(.system(size: 11, weight: .bold, design: .rounded))
              .tracking(2)
              .foregroundColor(Color(hex: "#E74C3C"))
          }
        }
      }
      .onAppear {
        withAnimation(.easeInOut(duration: 2).repeatForever(autoreverses: true)) {
          pulsePhase = 1
        }
        withAnimation(.linear(duration: 2.5).repeatForever(autoreverses: false)) {
          scanLineOffset = 200
        }
      }
    }
  }

  // MARK: - Scanning Interface

  private var scanningInterface: some View {
    VStack(spacing: 0) {
      // Camera viewfinder area
      ZStack {
        if DataScannerViewController.isSupported && DataScannerViewController.isAvailable {
          ProgrammingDataScannerRepresentable(
            scannedText: $scannedText,
            onTextFound: { text in
              processScannedText(text)
            }
          )
          .ignoresSafeArea()
        } else {
          // Fallback for simulator / unsupported devices
          manualInputFallback
        }

        // Viewfinder corners
        viewfinderOverlay
      }
      .frame(maxHeight: .infinity)

      // Bottom instruction bar
      bottomInstructionBar
    }
  }

  // MARK: - Viewfinder Overlay

  private var viewfinderOverlay: some View {
    ZStack {
      // Corner brackets
      VStack {
        HStack {
          cornerBracket(rotation: 0)
          Spacer()
          cornerBracket(rotation: 90)
        }
        Spacer()
        HStack {
          cornerBracket(rotation: 270)
          Spacer()
          cornerBracket(rotation: 180)
        }
      }
      .padding(40)

      // Center crosshair
      VStack(spacing: 8) {
        Image(systemName: "eye.trianglebadge.exclamationmark")
          .font(.system(size: 40))
          .foregroundColor(Color(hex: "#E74C3C").opacity(0.3 + pulsePhase * 0.4))

        Text("POINT AT TEXT")
          .font(.system(size: 12, weight: .bold, design: .monospaced))
          .tracking(3)
          .foregroundColor(Color(hex: "#E74C3C").opacity(0.6))
      }
    }
  }

  private func cornerBracket(rotation: Double) -> some View {
    Path { path in
      path.move(to: CGPoint(x: 0, y: 20))
      path.addLine(to: CGPoint(x: 0, y: 0))
      path.addLine(to: CGPoint(x: 20, y: 0))
    }
    .stroke(Color(hex: "#E74C3C").opacity(0.8), lineWidth: 2)
    .frame(width: 20, height: 20)
    .rotationEffect(.degrees(rotation))
  }

  // MARK: - Scan Line Animation

  private var scanLineAnimation: some View {
    Rectangle()
      .fill(
        LinearGradient(
          colors: [
            Color.clear,
            Color(hex: "#E74C3C").opacity(0.3),
            Color(hex: "#E74C3C").opacity(0.6),
            Color(hex: "#E74C3C").opacity(0.3),
            Color.clear,
          ],
          startPoint: .leading,
          endPoint: .trailing
        )
      )
      .frame(height: 2)
      .offset(y: scanLineOffset)
      .allowsHitTesting(false)
  }

  // MARK: - "PROGRAMMING DETECTED" Flash Overlay

  private var programmingDetectedOverlay: some View {
    ZStack {
      Color.black.opacity(0.7).ignoresSafeArea()

      VStack(spacing: 20) {
        // Warning triangle
        Image(systemName: "exclamationmark.triangle.fill")
          .font(.system(size: 60))
          .foregroundColor(Color(hex: "#E74C3C"))
          .shadow(color: Color(hex: "#E74C3C").opacity(0.8), radius: 20)

        Text("⚠️ PROGRAMMING DETECTED ⚠️")
          .font(.system(size: 22, weight: .black, design: .monospaced))
          .foregroundColor(Color(hex: "#E74C3C"))
          .multilineTextAlignment(.center)
          .shadow(color: Color(hex: "#E74C3C").opacity(0.5), radius: 10)

        if let result = scanResult {
          Text("Threat Level: \(result.threatLevel.rawValue.uppercased())")
            .font(.system(size: 16, weight: .bold, design: .rounded))
            .foregroundColor(result.threatLevel.displayColor)
        }

        Text("Tap to see analysis")
          .font(.system(size: 13, weight: .medium))
          .foregroundColor(Palette.text.muted)
      }
    }
    .opacity(overlayOpacity)
    .onTapGesture {
      withAnimation(.easeOut(duration: 0.3)) {
        showOverlay = false
        isScanning = false
      }
    }
  }

  // MARK: - Bottom Bar

  private var bottomInstructionBar: some View {
    VStack(spacing: 8) {
      HStack(spacing: 12) {
        Image(systemName: "viewfinder")
          .font(.system(size: 16))
          .foregroundColor(Color(hex: "#E74C3C"))

        VStack(alignment: .leading, spacing: 2) {
          Text("Scan Any Label or Headline")
            .font(.system(size: 14, weight: .bold, design: .rounded))
            .foregroundColor(Palette.text.primary)
          Text("Point camera at text to detect programming patterns")
            .font(.system(size: 11, weight: .medium))
            .foregroundColor(Palette.text.muted)
        }
        Spacer()
      }
      .padding(14)
      .background(
        RoundedRectangle(cornerRadius: 14)
          .fill(Color.black.opacity(0.8))
          .overlay(
            RoundedRectangle(cornerRadius: 14).stroke(
              Color(hex: "#E74C3C").opacity(0.3), lineWidth: 1))
      )
    }
    .padding(.horizontal, 16)
    .padding(.bottom, 16)
  }

  // MARK: - Manual Input Fallback (Simulator)

  private var manualInputFallback: some View {
    VStack(spacing: 16) {
      Image(systemName: "camera.fill")
        .font(.system(size: 40))
        .foregroundColor(Palette.text.muted)

      Text("Camera not available")
        .font(.system(size: 16, weight: .bold))
        .foregroundColor(Palette.text.primary)

      Text("Paste or type text to scan:")
        .font(.system(size: 13, weight: .medium))
        .foregroundColor(Palette.text.secondary)

      TextEditor(text: $scannedText)
        .font(.system(size: 14))
        .foregroundColor(Palette.text.primary)
        .scrollContentBackground(.hidden)
        .frame(height: 120)
        .padding(12)
        .background(
          RoundedRectangle(cornerRadius: 12)
            .fill(Color.white.opacity(0.05))
            .overlay(
              RoundedRectangle(cornerRadius: 12).stroke(
                Color(hex: "#E74C3C").opacity(0.3), lineWidth: 1))
        )

      Button(action: {
        if !scannedText.isEmpty {
          processScannedText(scannedText)
        }
      }) {
        HStack(spacing: 8) {
          Image(systemName: "eye.trianglebadge.exclamationmark")
          Text("SCAN FOR PROGRAMMING")
            .font(.system(size: 14, weight: .bold, design: .rounded))
        }
        .foregroundColor(.black)
        .frame(maxWidth: .infinity)
        .padding(14)
        .background(RoundedRectangle(cornerRadius: 12).fill(Color(hex: "#E74C3C")))
      }
    }
    .padding(24)
  }

  // MARK: - Results Interface

  private func resultsInterface(_ result: ProgrammingScanResult) -> some View {
    ScrollView(showsIndicators: false) {
      VStack(spacing: 20) {
        // Threat header
        threatHeader(result)

        // Scanned text
        scannedTextCard(result)

        // Detected patterns
        if !result.detectedPatterns.isEmpty {
          patternsSection(result)
        }

        // Decoded messaging
        decodedSection(result)

        // What they want you to feel
        psychEffectsSection(result)

        // Scan again button
        Button(action: {
          scanResult = nil
          scannedText = ""
          isScanning = true
        }) {
          HStack(spacing: 8) {
            Image(systemName: "arrow.counterclockwise")
            Text("SCAN AGAIN")
              .font(.system(size: 14, weight: .bold, design: .rounded))
          }
          .foregroundColor(.black)
          .frame(maxWidth: .infinity)
          .padding(16)
          .background(RoundedRectangle(cornerRadius: 14).fill(Color(hex: "#E74C3C")))
        }

        DisclaimerStack(types: [.frequency])

        Spacer(minLength: 80)
      }
      .padding(.horizontal, 20)
      .padding(.top, 16)
    }
  }

  // MARK: - Threat Header

  private func threatHeader(_ result: ProgrammingScanResult) -> some View {
    VStack(spacing: 12) {
      ZStack {
        Circle()
          .fill(result.threatLevel.displayColor.opacity(0.15))
          .frame(width: 100, height: 100)

        Circle()
          .fill(result.threatLevel.displayColor.opacity(0.3))
          .frame(width: 70, height: 70)

        Image(systemName: result.threatLevel.icon)
          .font(.system(size: 32, weight: .bold))
          .foregroundColor(result.threatLevel.displayColor)
      }

      Text("PROGRAMMING LEVEL: \(result.threatLevel.rawValue.uppercased())")
        .font(.system(size: 14, weight: .black, design: .monospaced))
        .foregroundColor(result.threatLevel.displayColor)

      Text("Score: \(result.programmingScore)/10")
        .font(.system(size: 12, weight: .bold, design: .rounded))
        .foregroundColor(Palette.text.secondary)
    }
    .padding(20)
    .frame(maxWidth: .infinity)
    .background(
      RoundedRectangle(cornerRadius: 16)
        .fill(result.threatLevel.displayColor.opacity(0.06))
        .overlay(
          RoundedRectangle(cornerRadius: 16).stroke(
            result.threatLevel.displayColor.opacity(0.3), lineWidth: 1))
    )
  }

  // MARK: - Scanned Text Card

  private func scannedTextCard(_ result: ProgrammingScanResult) -> some View {
    VStack(alignment: .leading, spacing: 8) {
      HStack(spacing: 6) {
        Image(systemName: "doc.text.magnifyingglass")
          .foregroundColor(Palette.primary.cyan)
        Text("SCANNED TEXT")
          .font(.system(size: 10, weight: .bold)).tracking(1.5)
          .foregroundColor(Palette.primary.cyan)
      }

      Text(result.originalText)
        .font(.system(size: 13, weight: .medium, design: .rounded))
        .foregroundColor(Palette.text.secondary)
        .lineSpacing(3)
        .lineLimit(8)
    }
    .padding(14)
    .frame(maxWidth: .infinity, alignment: .leading)
    .background(
      RoundedRectangle(cornerRadius: 12)
        .fill(Color.white.opacity(0.04))
        .overlay(
          RoundedRectangle(cornerRadius: 12).stroke(
            Palette.primary.cyan.opacity(0.15), lineWidth: 1))
    )
  }

  // MARK: - Patterns

  private func patternsSection(_ result: ProgrammingScanResult) -> some View {
    VStack(alignment: .leading, spacing: 10) {
      HStack(spacing: 6) {
        Image(systemName: "exclamationmark.triangle.fill")
          .foregroundColor(Color(hex: "#E74C3C"))
        Text("PROGRAMMING PATTERNS FOUND")
          .font(.system(size: 10, weight: .bold)).tracking(1.5)
          .foregroundColor(Color(hex: "#E74C3C"))
      }

      ForEach(result.detectedPatterns, id: \.name) { pattern in
        HStack(alignment: .top, spacing: 10) {
          Image(systemName: pattern.icon)
            .font(.system(size: 14))
            .foregroundColor(Color(hex: "#E74C3C"))
            .frame(width: 24)

          VStack(alignment: .leading, spacing: 3) {
            Text(pattern.name)
              .font(.system(size: 13, weight: .bold, design: .rounded))
              .foregroundColor(Palette.text.primary)
            Text(pattern.explanation)
              .font(.system(size: 11, weight: .medium))
              .foregroundColor(Palette.text.muted)
              .lineSpacing(2)
          }
        }
        .padding(10)
        .background(
          RoundedRectangle(cornerRadius: 10)
            .fill(Color(hex: "#E74C3C").opacity(0.04))
        )
      }
    }
  }

  // MARK: - Decoded

  private func decodedSection(_ result: ProgrammingScanResult) -> some View {
    VStack(alignment: .leading, spacing: 10) {
      HStack(spacing: 6) {
        Image(systemName: "eye.slash.fill")
          .foregroundColor(Palette.accent.gold)
        Text("WHAT THEY'RE REALLY SAYING")
          .font(.system(size: 10, weight: .bold)).tracking(1.5)
          .foregroundColor(Palette.accent.gold)
      }

      Text(result.decodedMessage)
        .font(.system(size: 14, weight: .semibold, design: .rounded))
        .foregroundColor(Palette.accent.gold)
        .lineSpacing(4)
        .padding(14)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
          RoundedRectangle(cornerRadius: 12)
            .fill(Palette.accent.gold.opacity(0.06))
            .overlay(
              RoundedRectangle(cornerRadius: 12).stroke(
                Palette.accent.gold.opacity(0.2), lineWidth: 1))
        )
    }
  }

  // MARK: - Psych Effects

  private func psychEffectsSection(_ result: ProgrammingScanResult) -> some View {
    VStack(alignment: .leading, spacing: 10) {
      HStack(spacing: 6) {
        Image(systemName: "brain.head.profile")
          .foregroundColor(Palette.primary.violet)
        Text("WHAT THEY WANT YOU TO FEEL")
          .font(.system(size: 10, weight: .bold)).tracking(1.5)
          .foregroundColor(Palette.primary.violet)
      }

      ForEach(result.intendedEffects, id: \.self) { effect in
        HStack(spacing: 8) {
          Circle()
            .fill(Palette.primary.violet)
            .frame(width: 6, height: 6)
          Text(effect)
            .font(.system(size: 12, weight: .medium, design: .rounded))
            .foregroundColor(Palette.text.secondary)
        }
      }
    }
    .padding(14)
    .frame(maxWidth: .infinity, alignment: .leading)
    .background(
      RoundedRectangle(cornerRadius: 12)
        .fill(Palette.primary.violet.opacity(0.04))
        .overlay(
          RoundedRectangle(cornerRadius: 12).stroke(
            Palette.primary.violet.opacity(0.15), lineWidth: 1))
    )
  }

  // MARK: - Processing

  private func processScannedText(_ text: String) {
    guard text.split(separator: " ").count >= 3 else { return }

    let psyopResult = engine.analyze(text: text)

    let patterns: [ProgrammingPattern] = buildPatterns(from: psyopResult)
    let decoded: String = buildDecodedMessage(from: psyopResult)
    let effects: [String] = buildIntendedEffects(from: psyopResult)

    let result = ProgrammingScanResult(
      originalText: text,
      programmingScore: psyopResult.psyopScore,
      threatLevel: mapThreatLevel(psyopResult.overallThreatLevel),
      detectedPatterns: patterns,
      decodedMessage: decoded,
      intendedEffects: effects
    )

    scanResult = result

    // Show dramatic overlay
    withAnimation(.easeIn(duration: 0.2)) {
      showOverlay = true
      overlayOpacity = 1
    }

    HapticManager.shared.medium()
  }

  private func buildPatterns(from result: PsyopScanResult) -> [ProgrammingPattern] {
    var patterns: [ProgrammingPattern] = []

    if result.fearScore > 0.3 {
      patterns.append(
        ProgrammingPattern(
          name: "Fear Programming",
          icon: "bolt.heart.fill",
          explanation:
            "Uses fear-based language to bypass rational thinking and trigger survival instincts."
        ))
    }

    if result.deceptionDetected {
      patterns.append(
        ProgrammingPattern(
          name: "Source Obfuscation",
          icon: "questionmark.diamond.fill",
          explanation:
            "Vague attribution ('experts say', 'sources confirm') prevents you from verifying claims."
        ))
    }

    if result.urgencyLevel == .high {
      patterns.append(
        ProgrammingPattern(
          name: "Manufactured Urgency",
          icon: "clock.badge.exclamationmark.fill",
          explanation: "Artificial time pressure designed to prevent you from thinking critically."
        ))
    }

    for pattern in result.detectedPatterns {
      if pattern.type.rawValue.lowercased().contains("division") {
        patterns.append(
          ProgrammingPattern(
            name: "Us vs. Them Division",
            icon: "person.2.slash.fill",
            explanation: "Creates artificial tribal boundaries to prevent unified awareness."
          ))
      }
      if pattern.type.rawValue.lowercased().contains("outrage") {
        patterns.append(
          ProgrammingPattern(
            name: "Outrage Bait",
            icon: "flame.fill",
            explanation: "Engineered to hijack your emotional state and farm engagement."
          ))
      }
      if pattern.type.rawValue.lowercased().contains("scarcity") {
        patterns.append(
          ProgrammingPattern(
            name: "Scarcity Programming",
            icon: "hourglass.bottomhalf.filled",
            explanation: "Creates artificial shortage to trigger panic buying or compliance."
          ))
      }
    }

    if patterns.isEmpty {
      patterns.append(
        ProgrammingPattern(
          name: "Subtle Framing",
          icon: "rectangle.portrait.and.arrow.forward.fill",
          explanation:
            "Even low-level text can contain framing that shapes your perception without obvious triggers."
        ))
    }

    return patterns
  }

  private func buildDecodedMessage(from result: PsyopScanResult) -> String {
    if result.psyopScore >= 7 {
      return
        "This text is heavily engineered to manipulate your emotional state. It wants you to react, not think. The programming is designed to bypass your rational mind and create an automatic response."
    } else if result.psyopScore >= 4 {
      return
        "Moderate manipulation detected. This text uses common programming techniques — emotional language, vague sourcing, or artificial urgency — to shape how you feel about the topic before you've had time to think."
    } else {
      return
        "Low-level programming. While not aggressively manipulative, the framing still guides your perception. Notice how the word choices subtly push you toward a specific emotional response."
    }
  }

  private func buildIntendedEffects(from result: PsyopScanResult) -> [String] {
    var effects: [String] = []

    if result.fearScore > 0.3 { effects.append("Fear and anxiety") }
    if result.fearScore > 0.5 { effects.append("Helplessness / need for authority") }
    if result.deceptionDetected { effects.append("Trust without verification") }

    for pattern in result.detectedPatterns {
      if pattern.type.rawValue.lowercased().contains("division") {
        effects.append("Tribal identity activation")
      }
      if pattern.type.rawValue.lowercased().contains("outrage") {
        effects.append("Rage / need to share immediately")
      }
    }

    if effects.isEmpty {
      effects.append("Subtle emotional priming")
      effects.append("Unconscious framing acceptance")
    }

    return effects
  }

  private func mapThreatLevel(_ level: ThreatLevel) -> ProgrammingThreatLevel {
    switch level {
    case .high: return .high
    case .medium: return .medium
    case .low: return .low
    }
  }
}

// MARK: - Programming Scan Models

struct ProgrammingScanResult {
  let originalText: String
  let programmingScore: Int
  let threatLevel: ProgrammingThreatLevel
  let detectedPatterns: [ProgrammingPattern]
  let decodedMessage: String
  let intendedEffects: [String]
}

struct ProgrammingPattern {
  let name: String
  let icon: String
  let explanation: String
}

enum ProgrammingThreatLevel: String {
  case low = "Low"
  case medium = "Medium"
  case high = "High"

  var displayColor: Color {
    switch self {
    case .low: return .green
    case .medium: return .orange
    case .high: return Color(hex: "#E74C3C")
    }
  }

  var icon: String {
    switch self {
    case .low: return "checkmark.shield.fill"
    case .medium: return "exclamationmark.shield.fill"
    case .high: return "xmark.shield.fill"
    }
  }
}

// MARK: - VisionKit Data Scanner Representable

@available(iOS 16.0, *)
struct ProgrammingDataScannerRepresentable: UIViewControllerRepresentable {
  @Binding var scannedText: String
  let onTextFound: (String) -> Void

  func makeUIViewController(context: Context) -> DataScannerViewController {
    let scanner = DataScannerViewController(
      recognizedDataTypes: [.text()],
      qualityLevel: .balanced,
      recognizesMultipleItems: true,
      isHighFrameRateTrackingEnabled: false,
      isHighlightingEnabled: true
    )
    scanner.delegate = context.coordinator
    try? scanner.startScanning()
    return scanner
  }

  func updateUIViewController(_: DataScannerViewController, context _: Context) {}

  func makeCoordinator() -> Coordinator {
    Coordinator(parent: self)
  }

  class Coordinator: NSObject, DataScannerViewControllerDelegate {
    let parent: ProgrammingDataScannerRepresentable
    private var lastProcessedText: String = ""
    private var debounceTimer: Timer?

    init(parent: ProgrammingDataScannerRepresentable) {
      self.parent = parent
    }

    func dataScanner(
      _: DataScannerViewController, didAdd _: [RecognizedItem], allItems: [RecognizedItem]
    ) {
      processItems(allItems)
    }

    func dataScanner(
      _: DataScannerViewController, didUpdate _: [RecognizedItem], allItems: [RecognizedItem]
    ) {
      processItems(allItems)
    }

    private func processItems(_ items: [RecognizedItem]) {
      var allText: [String] = []
      for item in items {
        switch item {
        case .text(let text):
          allText.append(text.transcript)
        default:
          break
        }
      }

      let combined = allText.joined(separator: " ").trimmingCharacters(in: .whitespacesAndNewlines)

      guard combined != lastProcessedText,
        combined.split(separator: " ").count >= 5
      else { return }

      lastProcessedText = combined

      // Debounce — wait 1.5s of stable text before processing
      debounceTimer?.invalidate()
      debounceTimer = Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false) { [weak self] _ in
        Task { @MainActor in
          self?.parent.scannedText = combined
          self?.parent.onTextFound(combined)
        }
      }
    }
  }
}
