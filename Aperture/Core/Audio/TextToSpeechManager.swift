// TextToSpeechManager.swift
// Global text-to-speech narration for Aperture
// Makes consciousness content accessible and immersive

import SwiftUI
import AVFoundation
import Combine

// MARK: - Named Voice Option

struct NarrationVoice: Identifiable, Equatable {
    let id: String           // AVSpeechSynthesisVoice identifier
    let displayName: String  // Friendly name
    let gender: String       // "♂ Male" / "♀ Female"
    let quality: String      // "Premium" / "Enhanced" / "Standard"
    let icon: String

    static var allOptions: [NarrationVoice] {
        [
            NarrationVoice(
                id: "com.apple.voice.premium.en-US.Evan",
                displayName: "Evan",
                gender: "♂ Male",
                quality: "Premium",
                icon: "person.fill"
            ),
            NarrationVoice(
                id: "com.apple.voice.premium.en-US.Ava",
                displayName: "Ava",
                gender: "♀ Female",
                quality: "Premium",
                icon: "person.fill"
            ),
            NarrationVoice(
                id: "com.apple.voice.premium.en-US.Zoe",
                displayName: "Zoe",
                gender: "♀ Female",
                quality: "Premium",
                icon: "person.fill"
            ),
            NarrationVoice(
                id: "com.apple.voice.premium.en-US.Nathan",
                displayName: "Nathan",
                gender: "♂ Male",
                quality: "Premium",
                icon: "person.fill"
            ),
            NarrationVoice(
                id: "com.apple.voice.enhanced.en-US.Evan",
                displayName: "Evan",
                gender: "♂ Male",
                quality: "Enhanced",
                icon: "person.fill"
            ),
            NarrationVoice(
                id: "com.apple.voice.enhanced.en-US.Ava",
                displayName: "Ava",
                gender: "♀ Female",
                quality: "Enhanced",
                icon: "person.fill"
            ),
            NarrationVoice(
                id: "com.apple.voice.enhanced.en-US.Samantha",
                displayName: "Samantha",
                gender: "♀ Female",
                quality: "Enhanced",
                icon: "person.fill"
            ),
            NarrationVoice(
                id: "com.apple.voice.enhanced.en-US.Tom",
                displayName: "Tom",
                gender: "♂ Male",
                quality: "Enhanced",
                icon: "person.fill"
            ),
            NarrationVoice(
                id: "com.apple.ttsbundle.Samantha-compact",
                displayName: "Samantha",
                gender: "♀ Female",
                quality: "Standard",
                icon: "person.fill"
            )
        ]
    }

    /// Returns only voices that are actually installed on the device
    static func availableVoices() -> [NarrationVoice] {
        let installed = Set(AVSpeechSynthesisVoice.speechVoices().map { $0.identifier })
        // Return installed options first, then at minimum one fallback
        let available = allOptions.filter { installed.contains($0.id) }
        return available.isEmpty ? [allOptions[0]] : available
    }
}

// MARK: - Voice Style (controls rate + pitch, independent of voice identity)

enum NarrationVoiceStyle: String, CaseIterable, Identifiable {
    case calm = "Calm Guide"
    case energetic = "Energetic Teacher"
    case mystical = "Mystical Sage"
    case neutral = "Clear Reader"

    var id: String { rawValue }

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

    /// The selected named voice. Persisted by identifier.
    @Published var selectedVoice: NarrationVoice? {
        didSet {
            UserDefaults.standard.set(selectedVoice?.id, forKey: "narration.selectedVoiceId")
        }
    }

    /// All voices actually available on this device
    @Published private(set) var availableVoices: [NarrationVoice] = []

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

    private override init() {
        super.init()
        synthesizer.delegate = self
        loadPreferences()
        setupAudioSession()
    }

    private func loadPreferences() {
        if let styleRaw = UserDefaults.standard.string(forKey: "narration.voiceStyle"),
           let style = NarrationVoiceStyle(rawValue: styleRaw) {
            voiceStyle = style
        }
        autoHighlight = UserDefaults.standard.bool(forKey: "narration.autoHighlight")

        // Load available voices and restore saved selection
        availableVoices = NarrationVoice.availableVoices()
        if let savedId = UserDefaults.standard.string(forKey: "narration.selectedVoiceId"),
           let match = availableVoices.first(where: { $0.id == savedId }) {
            selectedVoice = match
        } else {
            // Default: first premium male voice, otherwise first available
            selectedVoice = availableVoices.first(where: { $0.quality == "Premium" && $0.gender.contains("♂") })
                ?? availableVoices.first(where: { $0.quality == "Premium" })
                ?? availableVoices.first(where: { $0.quality == "Enhanced" })
                ?? availableVoices.first
        }
    }

    private func setupAudioSession() {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .spokenAudio, options: [.duckOthers, .allowBluetooth])
        } catch {
            print("Audio session setup failed: \(error)")
        }
    }

    // MARK: - Public Methods

    func speak(_ text: String) {
        stop()
        currentText = text
        paragraphs = [text]
        totalCharacters = text.count
        spokenCharacters = 0
        currentParagraphIndex = 0
        speakCurrentParagraph()
    }

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

    func pause() {
        if isSpeaking && !isPaused {
            synthesizer.pauseSpeaking(at: .immediate)
            isPaused = true
        }
    }

    func resume() {
        if isPaused {
            synthesizer.continueSpeaking()
            isPaused = false
        }
    }

    func togglePlayPause() {
        if isPaused { resume() } else if isSpeaking { pause() }
    }

    func stop() {
        synthesizer.stopSpeaking(at: .immediate)
        isSpeaking = false
        isPaused = false
        progress = 0.0
        currentText = ""
        currentParagraphIndex = 0
        spokenCharacters = 0
    }

    func skipForward() {
        guard currentParagraphIndex < paragraphs.count - 1 else { return }
        synthesizer.stopSpeaking(at: .immediate)
        spokenCharacters += paragraphs[currentParagraphIndex].count
        currentParagraphIndex += 1
        speakCurrentParagraph()
    }

    func skipBackward() {
        guard currentParagraphIndex > 0 else {
            synthesizer.stopSpeaking(at: .immediate)
            speakCurrentParagraph()
            return
        }
        synthesizer.stopSpeaking(at: .immediate)
        currentParagraphIndex -= 1
        spokenCharacters = paragraphs[0..<currentParagraphIndex].reduce(0) { $0 + $1.count }
        speakCurrentParagraph()
    }

    // MARK: - Private

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

        utterance.voice = resolveVoice()

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

    /// Resolves the AVSpeechSynthesisVoice from the user's selected NarrationVoice,
    /// falling back gracefully through quality tiers.
    private func resolveVoice() -> AVSpeechSynthesisVoice? {
        let installed = AVSpeechSynthesisVoice.speechVoices()

        // Try user's preferred voice first
        if let preferred = selectedVoice,
           let voice = installed.first(where: { $0.identifier == preferred.id }) {
            return voice
        }

        // Fallback chain: premium → enhanced → any English
        let qualities: [AVSpeechSynthesisVoiceQuality] = [.premium, .enhanced, .default]
        for quality in qualities {
            if let voice = installed.first(where: {
                $0.language.hasPrefix("en") && $0.quality == quality
            }) {
                return voice
            }
        }

        return AVSpeechSynthesisVoice(language: "en-US")
    }

    private func updateProgress(charactersSpoken: Int) {
        let total = spokenCharacters + charactersSpoken
        progress = totalCharacters > 0 ? Double(total) / Double(totalCharacters) : 0
    }
}

// MARK: - AVSpeechSynthesizerDelegate

extension TextToSpeechManager: AVSpeechSynthesizerDelegate {

    nonisolated func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didStart utterance: AVSpeechUtterance) {
        Task { @MainActor in self.isSpeaking = true; self.isPaused = false }
    }

    nonisolated func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, willSpeakRangeOfSpeechString characterRange: NSRange, utterance: AVSpeechUtterance) {
        Task { @MainActor in self.updateProgress(charactersSpoken: characterRange.location + characterRange.length) }
    }

    nonisolated func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        Task { @MainActor in
            self.spokenCharacters += self.paragraphs[safe: self.currentParagraphIndex]?.count ?? 0
            self.currentParagraphIndex += 1
            if self.currentParagraphIndex < self.paragraphs.count {
                self.speakCurrentParagraph()
            } else {
                self.isSpeaking = false
                self.progress = 1.0
                HapticManager.shared.success()
            }
        }
    }

    nonisolated func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didPause utterance: AVSpeechUtterance) {
        Task { @MainActor in self.isPaused = true }
    }

    nonisolated func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didContinue utterance: AVSpeechUtterance) {
        Task { @MainActor in self.isPaused = false }
    }

    nonisolated func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didCancel utterance: AVSpeechUtterance) {
        Task { @MainActor in self.isSpeaking = false; self.isPaused = false }
    }
}

// MARK: - Narration Controls View

struct NarrationControlsView: View {

    @ObservedObject var tts = TextToSpeechManager.shared
    var onDismiss: (() -> Void)? = nil

    var body: some View {
        VStack(spacing: 16) {
            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    Capsule().fill(Color.white.opacity(0.1))
                    Capsule()
                        .fill(Palette.accent.gold)
                        .frame(width: geo.size.width * tts.progress)
                }
            }
            .frame(height: 4)

            HStack(spacing: 32) {
                Button { HapticManager.shared.light(); tts.skipBackward() } label: {
                    Image(systemName: "backward.fill").font(.system(size: 20)).foregroundColor(.white)
                }

                Button {
                    HapticManager.shared.medium()
                    if tts.isSpeaking { tts.togglePlayPause() }
                } label: {
                    ZStack {
                        Circle().fill(Palette.accent.gold).frame(width: 56, height: 56)
                        Image(systemName: tts.isPaused ? "play.fill" : "pause.fill")
                            .font(.system(size: 22)).foregroundColor(.black)
                    }
                }

                Button { HapticManager.shared.light(); tts.skipForward() } label: {
                    Image(systemName: "forward.fill").font(.system(size: 20)).foregroundColor(.white)
                }
            }

            Button {
                HapticManager.shared.light()
                tts.stop()
                onDismiss?()
            } label: {
                Text("Stop Narration").font(.system(size: 13)).foregroundColor(.gray)
            }
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 20).fill(Color(hex: "#1a1a2e")))
    }
}

// MARK: - Voice Picker View

struct VoicePickerView: View {

    @ObservedObject private var tts = TextToSpeechManager.shared
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            ZStack {
                Color(hex: "#0a0a1a").ignoresSafeArea()

                ScrollView {
                    VStack(spacing: 0) {

                        // Voice Style section
                        sectionHeader("NARRATION STYLE")

                        VStack(spacing: 8) {
                            ForEach(NarrationVoiceStyle.allCases) { style in
                                styleRow(style)
                            }
                        }
                        .padding(.horizontal)
                        .padding(.bottom, 24)

                        // Voice Identity section
                        sectionHeader("VOICE")

                        if tts.availableVoices.isEmpty {
                            noVoicesMessage
                        } else {
                            VStack(spacing: 8) {
                                ForEach(tts.availableVoices) { voice in
                                    voiceRow(voice)
                                }
                            }
                            .padding(.horizontal)
                        }

                        // System settings hint
                        VStack(spacing: 6) {
                            Text("Want more voice options?")
                                .font(.system(size: 13, weight: .medium))
                                .foregroundColor(Palette.text.secondary)
                            Text("iOS Settings → Accessibility → Spoken Content → Voices")
                                .font(.system(size: 11))
                                .foregroundColor(Palette.text.muted)
                                .multilineTextAlignment(.center)
                        }
                        .padding(.top, 28)
                        .padding(.horizontal)
                    }
                    .padding(.top, 8)
                    .padding(.bottom, 40)
                }
            }
            .navigationTitle("Voice Settings")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") { dismiss() }
                        .foregroundColor(Palette.primary.cyan)
                }
            }
        }
    }

    private func sectionHeader(_ title: String) -> some View {
        HStack {
            Text(title)
                .font(.system(size: 11, weight: .bold, design: .rounded))
                .tracking(2)
                .foregroundColor(Palette.text.muted)
            Spacer()
        }
        .padding(.horizontal)
        .padding(.bottom, 10)
    }

    private func styleRow(_ style: NarrationVoiceStyle) -> some View {
        let isSelected = tts.voiceStyle == style
        return Button {
            HapticManager.shared.selectionChanged()
            tts.voiceStyle = style
        } label: {
            HStack(spacing: 14) {
                Image(systemName: style.icon)
                    .font(.system(size: 16))
                    .foregroundColor(isSelected ? Palette.accent.gold : Palette.text.muted)
                    .frame(width: 24)

                VStack(alignment: .leading, spacing: 2) {
                    Text(style.rawValue)
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundColor(isSelected ? Palette.text.primary : Palette.text.secondary)
                    Text("Rate: \(String(format: "%.2f", style.rate))x  ·  Pitch: \(String(format: "%.2f", style.pitch))")
                        .font(.system(size: 11))
                        .foregroundColor(Palette.text.muted)
                }

                Spacer()

                if isSelected {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(Palette.accent.gold)
                }
            }
            .padding(14)
            .background(
                RoundedRectangle(cornerRadius: 14)
                    .fill(isSelected ? Palette.accent.gold.opacity(0.08) : Color.white.opacity(0.04))
                    .overlay(
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(isSelected ? Palette.accent.gold.opacity(0.3) : Color.clear, lineWidth: 1)
                    )
            )
        }
        .buttonStyle(.plain)
    }

    private func voiceRow(_ voice: NarrationVoice) -> some View {
        let isSelected = tts.selectedVoice?.id == voice.id
        return Button {
            HapticManager.shared.selectionChanged()
            tts.selectedVoice = voice
            // Preview the voice
            let preview = AVSpeechUtterance(string: "Hello, I am \(voice.displayName).")
            preview.rate = tts.voiceStyle.rate
            preview.pitchMultiplier = tts.voiceStyle.pitch
            if let av = AVSpeechSynthesisVoice.speechVoices().first(where: { $0.identifier == voice.id }) {
                preview.voice = av
            }
            let synth = AVSpeechSynthesizer()
            synth.speak(preview)
        } label: {
            HStack(spacing: 14) {
                ZStack {
                    Circle()
                        .fill(isSelected ? Palette.primary.cyan.opacity(0.2) : Color.white.opacity(0.07))
                        .frame(width: 44, height: 44)
                    Text(String(voice.displayName.prefix(1)))
                        .font(.system(size: 18, weight: .bold, design: .rounded))
                        .foregroundColor(isSelected ? Palette.primary.cyan : Palette.text.secondary)
                }

                VStack(alignment: .leading, spacing: 3) {
                    Text(voice.displayName)
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundColor(isSelected ? Palette.text.primary : Palette.text.secondary)
                    HStack(spacing: 6) {
                        Text(voice.gender)
                        Text("·")
                        Text(voice.quality)
                    }
                    .font(.system(size: 11))
                    .foregroundColor(isSelected ? Palette.primary.cyan.opacity(0.8) : Palette.text.muted)
                }

                Spacer()

                if isSelected {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(Palette.primary.cyan)
                }
            }
            .padding(14)
            .background(
                RoundedRectangle(cornerRadius: 14)
                    .fill(isSelected ? Palette.primary.cyan.opacity(0.07) : Color.white.opacity(0.04))
                    .overlay(
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(isSelected ? Palette.primary.cyan.opacity(0.3) : Color.clear, lineWidth: 1)
                    )
            )
        }
        .buttonStyle(.plain)
    }

    private var noVoicesMessage: some View {
        VStack(spacing: 12) {
            Image(systemName: "speaker.slash")
                .font(.system(size: 36))
                .foregroundColor(Palette.text.muted)
            Text("No premium voices found")
                .font(.system(size: 15, weight: .semibold))
                .foregroundColor(Palette.text.secondary)
            Text("Download voices in iOS Settings → Accessibility → Spoken Content → Voices → English")
                .font(.system(size: 13))
                .foregroundColor(Palette.text.muted)
                .multilineTextAlignment(.center)
        }
        .padding(30)
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
            .background(Capsule().fill(Palette.accent.gold.opacity(0.15)))
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
    @State private var showVoicePicker = false

    var body: some View {
        VStack(spacing: 20) {
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

                // Voice picker button
                Button {
                    showVoicePicker = true
                } label: {
                    HStack(spacing: 4) {
                        Image(systemName: "person.wave.2.fill")
                        Text(tts.selectedVoice?.displayName ?? "Voice")
                            .font(.system(size: 12))
                        Image(systemName: "chevron.down").font(.system(size: 10))
                    }
                    .foregroundColor(.gray)
                    .padding(8)
                    .background(Color.white.opacity(0.05))
                    .cornerRadius(8)
                }
            }

            NarrationControlsView { dismiss() }
        }
        .padding()
        .background(Color(hex: "#0a0a1a").ignoresSafeArea())
        .sheet(isPresented: $showVoicePicker) {
            VoicePickerView()
                .presentationDetents([.large])
        }
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
                    ZStack {
                        Circle().stroke(Color.white.opacity(0.2), lineWidth: 3)
                        Circle()
                            .trim(from: 0, to: tts.progress)
                            .stroke(Palette.accent.gold, lineWidth: 3)
                            .rotationEffect(.degrees(-90))
                        Image(systemName: "waveform")
                            .font(.system(size: 14))
                            .foregroundColor(Palette.accent.gold)
                    }
                    .frame(width: 40, height: 40)

                    VStack(alignment: .leading, spacing: 2) {
                        Text(tts.selectedVoice?.displayName.appending(" is reading...") ?? "Narrating...")
                            .font(.system(size: 12)).foregroundColor(.gray)
                        Text("\(Int(tts.progress * 100))% complete")
                            .font(.system(size: 14, weight: .medium)).foregroundColor(.white)
                    }

                    Spacer()

                    Button { HapticManager.shared.light(); tts.togglePlayPause() } label: {
                        Image(systemName: tts.isPaused ? "play.fill" : "pause.fill")
                            .font(.system(size: 18)).foregroundColor(.white).frame(width: 44, height: 44)
                    }

                    Button { HapticManager.shared.light(); tts.stop() } label: {
                        Image(systemName: "xmark")
                            .font(.system(size: 14)).foregroundColor(.gray).frame(width: 32, height: 32)
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
                .padding(.bottom, 100)
                .onTapGesture { showingFullControls = true }
            }
            .transition(.move(edge: .bottom).combined(with: .opacity))
            .animation(.spring(response: 0.4), value: tts.isSpeaking)
            .sheet(isPresented: $showingFullControls) {
                NarrationControlSheet().presentationDetents([.height(200)])
            }
        }
    }
}

// MARK: - Preview

#Preview("Narration Controls") {
    ZStack {
        Color.black.ignoresSafeArea()
        VStack(spacing: 20) {
            NarrationButton(text: "This is a test of the narration system.")
            NarrationControlsView().padding()
        }
    }
}

