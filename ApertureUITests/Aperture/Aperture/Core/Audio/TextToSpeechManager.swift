// TextToSpeechManager.swift
// Global text-to-speech narration for Aperture
// Makes consciousness content accessible and immersive

import AVFoundation
import Combine
import SwiftUI

// MARK: - Voice Style

enum NarrationVoiceStyle: String, CaseIterable, Identifiable {
  case calm = "Calm Guide"
  case energetic = "Energetic Teacher"
  case mystical = "Mystical Sage"
  case neutral = "Clear Reader"

  var id: String {
    rawValue
  }

  var rate: Float {
    switch self {
    case .calm: return 0.45
    case .energetic: return 0.52
    case .mystical: return 0.40
    case .neutral: return 0.50
    }
  }

  var pitch: Float {
    switch self {
    case .calm: return 1.0
    case .energetic: return 1.1
    case .mystical: return 0.95
    case .neutral: return 1.0
    }
  }

  var icon: String {
    switch self {
    case .calm: return "leaf.fill"
    case .energetic: return "bolt.fill"
    case .mystical: return "sparkles"
    case .neutral: return "text.bubble"
    }
  }
}

// MARK: - Text To Speech Manager

@MainActor
class TextToSpeechManager: NSObject, ObservableObject {
  static let shared = TextToSpeechManager()

  // MARK: - Published State

  @Published private(set) var isSpeaking: Bool = false
  @Published private(set) var isPaused: Bool = false
  @Published private(set) var progress: Double = 0.0
  @Published private(set) var currentText: String = ""
  @Published private(set) var currentParagraphIndex: Int = 0

  @Published var voiceStyle: NarrationVoiceStyle = .calm {
    didSet {
      UserDefaults.standard.set(voiceStyle.rawValue, forKey: "narration.voiceStyle")
    }
  }

  @Published var autoHighlight: Bool = true {
    didSet {
      UserDefaults.standard.set(autoHighlight, forKey: "narration.autoHighlight")
    }
  }

  // MARK: - Private Properties

  private let synthesizer = AVSpeechSynthesizer()
  private var paragraphs: [String] = []
  private var totalCharacters: Int = 0
  private var spokenCharacters: Int = 0
  private var currentUtterance: AVSpeechUtterance?

  // MARK: - Init

  override private init() {
    super.init()
    synthesizer.delegate = self
    loadPreferences()
    setupAudioSession()
  }

  private func loadPreferences() {
    if let styleRaw = UserDefaults.standard.string(forKey: "narration.voiceStyle"),
      let style = NarrationVoiceStyle(rawValue: styleRaw)
    {
      voiceStyle = style
    }
    autoHighlight = UserDefaults.standard.bool(forKey: "narration.autoHighlight")
  }

  private func setupAudioSession() {
    do {
      try AVAudioSession.sharedInstance().setCategory(
        .playback, mode: .spokenAudio, options: [.duckOthers, .allowBluetooth])
    } catch {
      print("Audio session setup failed: \(error)")
    }
  }

  // MARK: - Public Methods

  /// Speak a single piece of text
  func speak(_ text: String) {
    stop()

    currentText = text
    paragraphs = [text]
    totalCharacters = text.count
    spokenCharacters = 0
    currentParagraphIndex = 0

    speakCurrentParagraph()
  }

  /// Speak multiple paragraphs with progress tracking
  func speakParagraphs(_ texts: [String]) {
    stop()

    paragraphs = texts.filter { !$0.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty }
    totalCharacters = paragraphs.reduce(0) { $0 + $1.count }
    spokenCharacters = 0
    currentParagraphIndex = 0

    if !paragraphs.isEmpty {
      speakCurrentParagraph()
    }
  }

  /// Pause narration
  func pause() {
    if isSpeaking, !isPaused {
      synthesizer.pauseSpeaking(at: .immediate)
      isPaused = true
    }
  }

  /// Resume narration
  func resume() {
    if isPaused {
      synthesizer.continueSpeaking()
      isPaused = false
    }
  }

  /// Toggle play/pause
  func togglePlayPause() {
    if isPaused {
      resume()
    } else if isSpeaking {
      pause()
    }
  }

  /// Stop narration completely
  func stop() {
    synthesizer.stopSpeaking(at: .immediate)
    isSpeaking = false
    isPaused = false
    progress = 0.0
    currentText = ""
    currentParagraphIndex = 0
    spokenCharacters = 0
  }

  /// Skip to next paragraph
  func skipForward() {
    guard currentParagraphIndex < paragraphs.count - 1 else { return }

    synthesizer.stopSpeaking(at: .immediate)
    spokenCharacters += paragraphs[currentParagraphIndex].count
    currentParagraphIndex += 1
    speakCurrentParagraph()
  }

  /// Go back to previous paragraph
  func skipBackward() {
    guard currentParagraphIndex > 0 else {
      // Restart current paragraph
      synthesizer.stopSpeaking(at: .immediate)
      speakCurrentParagraph()
      return
    }

    synthesizer.stopSpeaking(at: .immediate)
    currentParagraphIndex -= 1
    spokenCharacters = paragraphs[0..<currentParagraphIndex].reduce(0) { $0 + $1.count }
    speakCurrentParagraph()
  }

  // MARK: - Private Methods

  private func speakCurrentParagraph() {
    guard currentParagraphIndex < paragraphs.count else {
      isSpeaking = false
      progress = 1.0
      return
    }

    let text = paragraphs[currentParagraphIndex]
    currentText = text

    let utterance = AVSpeechUtterance(string: text)
    utterance.rate = voiceStyle.rate
    utterance.pitchMultiplier = voiceStyle.pitch
    utterance.preUtteranceDelay = 0.1
    utterance.postUtteranceDelay = 0.3

    // Try to get a good voice
    if let voice = selectVoice() {
      utterance.voice = voice
    }

    currentUtterance = utterance
    isSpeaking = true
    isPaused = false

    do {
      try AVAudioSession.sharedInstance().setActive(true)
    } catch {
      print("Audio session activation failed: \(error)")
    }

    synthesizer.speak(utterance)
  }

  private func selectVoice() -> AVSpeechSynthesisVoice? {
    // Prefer enhanced/premium voices
    let voices = AVSpeechSynthesisVoice.speechVoices()

    // Try to find Samantha (enhanced) or similar high-quality voice
    let preferredIdentifiers = [
      "com.apple.voice.enhanced.en-US.Samantha",
      "com.apple.voice.enhanced.en-US.Evan",
      "com.apple.voice.premium.en-US.Zoe",
      "com.apple.ttsbundle.Samantha-compact",
      "com.apple.ttsbundle.siri_female_en-US_compact",
    ]

    for identifier in preferredIdentifiers {
      if let voice = voices.first(where: { $0.identifier == identifier }) {
        return voice
      }
    }

    // Fall back to any enhanced English voice
    if let enhanced = voices.first(where: {
      $0.language.starts(with: "en") && $0.quality == .enhanced
    }) {
      return enhanced
    }

    // Fall back to default English
    return AVSpeechSynthesisVoice(language: "en-US")
  }

  private func updateProgress(charactersSpoken: Int) {
    let total = spokenCharacters + charactersSpoken
    progress = totalCharacters > 0 ? Double(total) / Double(totalCharacters) : 0
  }
}

// MARK: - AVSpeechSynthesizerDelegate

extension TextToSpeechManager: AVSpeechSynthesizerDelegate {
  nonisolated func speechSynthesizer(_: AVSpeechSynthesizer, didStart _: AVSpeechUtterance) {
    Task { @MainActor in
      self.isSpeaking = true
      self.isPaused = false
    }
  }

  nonisolated func speechSynthesizer(
    _: AVSpeechSynthesizer, willSpeakRangeOfSpeechString characterRange: NSRange,
    utterance _: AVSpeechUtterance
  ) {
    Task { @MainActor in
      self.updateProgress(charactersSpoken: characterRange.location + characterRange.length)
    }
  }

  nonisolated func speechSynthesizer(_: AVSpeechSynthesizer, didFinish _: AVSpeechUtterance) {
    Task { @MainActor in
      // Add characters from completed paragraph
      self.spokenCharacters += self.paragraphs[safe: self.currentParagraphIndex]?.count ?? 0
      self.currentParagraphIndex += 1

      // Speak next paragraph or finish
      if self.currentParagraphIndex < self.paragraphs.count {
        self.speakCurrentParagraph()
      } else {
        self.isSpeaking = false
        self.progress = 1.0
        HapticManager.shared.success()
      }
    }
  }

  nonisolated func speechSynthesizer(_: AVSpeechSynthesizer, didPause _: AVSpeechUtterance) {
    Task { @MainActor in
      self.isPaused = true
    }
  }

  nonisolated func speechSynthesizer(_: AVSpeechSynthesizer, didContinue _: AVSpeechUtterance) {
    Task { @MainActor in
      self.isPaused = false
    }
  }

  nonisolated func speechSynthesizer(_: AVSpeechSynthesizer, didCancel _: AVSpeechUtterance) {
    Task { @MainActor in
      self.isSpeaking = false
      self.isPaused = false
    }
  }
}

// MARK: - Narration Controls View

struct NarrationControlsView: View {
  @ObservedObject var tts = TextToSpeechManager.shared
  var onDismiss: (() -> Void)? = nil

  var body: some View {
    VStack(spacing: 16) {
      // Progress bar
      GeometryReader { geo in
        ZStack(alignment: .leading) {
          Capsule()
            .fill(Color.white.opacity(0.1))

          Capsule()
            .fill(Palette.accent.gold)
            .frame(width: geo.size.width * tts.progress)
        }
      }
      .frame(height: 4)

      // Controls
      HStack(spacing: 32) {
        // Skip back
        Button {
          HapticManager.shared.light()
          tts.skipBackward()
        } label: {
          Image(systemName: "backward.fill")
            .font(.system(size: 20))
            .foregroundColor(.white)
        }

        // Play/Pause
        Button {
          HapticManager.shared.medium()
          if tts.isSpeaking {
            tts.togglePlayPause()
          }
        } label: {
          ZStack {
            Circle()
              .fill(Palette.accent.gold)
              .frame(width: 56, height: 56)

            Image(systemName: tts.isPaused ? "play.fill" : "pause.fill")
              .font(.system(size: 22))
              .foregroundColor(.black)
          }
        }

        // Skip forward
        Button {
          HapticManager.shared.light()
          tts.skipForward()
        } label: {
          Image(systemName: "forward.fill")
            .font(.system(size: 20))
            .foregroundColor(.white)
        }
      }

      // Stop button
      Button {
        HapticManager.shared.light()
        tts.stop()
        onDismiss?()
      } label: {
        Text("Stop Narration")
          .font(.system(size: 13))
          .foregroundColor(.gray)
      }
    }
    .padding()
    .background(
      RoundedRectangle(cornerRadius: 20)
        .fill(Color(hex: "#1a1a2e"))
    )
  }
}

// MARK: - Narration Button

struct NarrationButton: View {
  let text: String
  var paragraphs: [String]? = nil

  @ObservedObject private var tts = TextToSpeechManager.shared
  @State private var showingControls = false

  var body: some View {
    Button {
      HapticManager.shared.medium()

      if tts.isSpeaking && tts.currentText == text {
        tts.togglePlayPause()
      } else {
        if let paragraphs = paragraphs {
          tts.speakParagraphs(paragraphs)
        } else {
          tts.speak(text)
        }
        showingControls = true
      }
    } label: {
      HStack(spacing: 6) {
        Image(systemName: isCurrentlyPlaying ? "pause.fill" : "play.fill")
          .font(.system(size: 12))

        Text(isCurrentlyPlaying ? "Pause" : "Listen")
          .font(.system(size: 13, weight: .medium))
      }
      .foregroundColor(Palette.accent.gold)
      .padding(.horizontal, 14)
      .padding(.vertical, 8)
      .background(
        Capsule()
          .fill(Palette.accent.gold.opacity(0.15))
      )
    }
    .sheet(isPresented: $showingControls) {
      NarrationControlSheet()
        .presentationDetents([.height(200)])
        .presentationDragIndicator(.visible)
    }
  }

  private var isCurrentlyPlaying: Bool {
    tts.isSpeaking && !tts.isPaused && tts.currentText == text
  }
}

// MARK: - Narration Control Sheet

struct NarrationControlSheet: View {
  @ObservedObject private var tts = TextToSpeechManager.shared
  @Environment(\.dismiss) private var dismiss

  var body: some View {
    VStack(spacing: 20) {
      // Header
      HStack {
        VStack(alignment: .leading, spacing: 4) {
          Text("Now Playing")
            .font(.system(size: 12))
            .foregroundColor(.gray)

          Text(tts.isSpeaking ? "Narration Active" : "Stopped")
            .font(.system(size: 16, weight: .semibold))
            .foregroundColor(.white)
        }

        Spacer()

        // Voice style picker
        Menu {
          ForEach(NarrationVoiceStyle.allCases) { style in
            Button {
              tts.voiceStyle = style
            } label: {
              Label(style.rawValue, systemImage: style.icon)
            }
          }
        } label: {
          HStack(spacing: 4) {
            Image(systemName: tts.voiceStyle.icon)
            Image(systemName: "chevron.down")
              .font(.system(size: 10))
          }
          .foregroundColor(.gray)
          .padding(8)
          .background(Color.white.opacity(0.05))
          .cornerRadius(8)
        }
      }

      // Controls
      NarrationControlsView {
        dismiss()
      }
    }
    .padding()
    .background(Color(hex: "#0a0a1a").ignoresSafeArea())
  }
}

// MARK: - Floating Narration Mini Player

struct FloatingNarrationPlayer: View {
  @ObservedObject private var tts = TextToSpeechManager.shared
  @State private var showingFullControls = false

  var body: some View {
    if tts.isSpeaking || tts.isPaused {
      VStack {
        Spacer()

        HStack(spacing: 12) {
          // Progress indicator
          ZStack {
            Circle()
              .stroke(Color.white.opacity(0.2), lineWidth: 3)

            Circle()
              .trim(from: 0, to: tts.progress)
              .stroke(Palette.accent.gold, lineWidth: 3)
              .rotationEffect(.degrees(-90))

            Image(systemName: "waveform")
              .font(.system(size: 14))
              .foregroundColor(Palette.accent.gold)
          }
          .frame(width: 40, height: 40)

          // Info
          VStack(alignment: .leading, spacing: 2) {
            Text("Narrating...")
              .font(.system(size: 12))
              .foregroundColor(.gray)

            Text("\(Int(tts.progress * 100))% complete")
              .font(.system(size: 14, weight: .medium))
              .foregroundColor(.white)
          }

          Spacer()

          // Play/Pause
          Button {
            HapticManager.shared.light()
            tts.togglePlayPause()
          } label: {
            Image(systemName: tts.isPaused ? "play.fill" : "pause.fill")
              .font(.system(size: 18))
              .foregroundColor(.white)
              .frame(width: 44, height: 44)
          }

          // Stop
          Button {
            HapticManager.shared.light()
            tts.stop()
          } label: {
            Image(systemName: "xmark")
              .font(.system(size: 14))
              .foregroundColor(.gray)
              .frame(width: 32, height: 32)
          }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .background(
          RoundedRectangle(cornerRadius: 16)
            .fill(Color(hex: "#1a1a2e"))
            .shadow(color: .black.opacity(0.3), radius: 10, y: 5)
        )
        .padding(.horizontal)
        .padding(.bottom, 100)  // Above tab bar
        .onTapGesture {
          showingFullControls = true
        }
      }
      .transition(.move(edge: .bottom).combined(with: .opacity))
      .animation(.spring(response: 0.4), value: tts.isSpeaking)
      .sheet(isPresented: $showingFullControls) {
        NarrationControlSheet()
          .presentationDetents([.height(200)])
      }
    }
  }
}

// MARK: - Preview

#Preview("Narration Controls") {
  ZStack {
    Color.black.ignoresSafeArea()

    VStack(spacing: 20) {
      NarrationButton(
        text:
          "This is a test of the narration system. It reads text aloud with beautiful voice synthesis."
      )

      NarrationControlsView()
        .padding()
    }
  }
}
