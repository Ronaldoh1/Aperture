// VoiceLabelScanner.swift
// VOICE SCANNER — "Hey, read this label"
// ☀️ SunFlow: Reignited
//
// Hands-free label scanning for:
// - Farmers/ranch hands on tractors
// - Parents with baby in one arm, bottle in the other
// - Anyone cooking with messy hands
//
// Uses Speech framework for voice activation
// and VisionKit for live text recognition.

import AVFoundation
import Speech
import SwiftUI
import VisionKit

// MARK: - ═══════════════════════════════════════════════════

// VOICE SCANNER MANAGER
// ═══════════════════════════════════════════════════════════

@MainActor
class VoiceScannerManager: ObservableObject {
  @Published var isListening = false
  @Published var recognizedText = ""
  @Published var lastCommand = ""
  @Published var scanResult: VoiceScanResult? = nil
  @Published var hasPermission = false
  @Published var statusMessage = "Tap mic or say 'Scan this'"

  private var audioEngine = AVAudioEngine()
  private var speechRecognizer: SFSpeechRecognizer?
  private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
  private var recognitionTask: SFSpeechRecognitionTask?

  init() {
    speechRecognizer = SFSpeechRecognizer(locale: Locale(identifier: "en-US"))
  }

  func requestPermissions() {
    SFSpeechRecognizer.requestAuthorization { [weak self] status in
      DispatchQueue.main.async {
        self?.hasPermission = status == .authorized
      }
    }
    AVAudioApplication.requestRecordPermission { [weak self] granted in
      DispatchQueue.main.async {
        if !granted { self?.hasPermission = false }
      }
    }
  }

  func startListening() {
    guard hasPermission, let recognizer = speechRecognizer, recognizer.isAvailable else {
      statusMessage = "Speech recognition not available"
      return
    }

    // Cancel existing
    recognitionTask?.cancel()
    recognitionTask = nil

    let audioSession = AVAudioSession.sharedInstance()
    do {
      try audioSession.setCategory(.record, mode: .measurement, options: .duckOthers)
      try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
    } catch {
      statusMessage = "Audio session error"
      return
    }

    recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
    guard let request = recognitionRequest else { return }
    request.shouldReportPartialResults = true

    let inputNode = audioEngine.inputNode

    recognitionTask = recognizer.recognitionTask(with: request) { [weak self] result, error in
      guard let self = self else { return }

      if let result = result {
        let text = result.bestTranscription.formattedString.lowercased()
        DispatchQueue.main.async {
          self.recognizedText = text
          self.processCommand(text)
        }
      }

      if error != nil || (result?.isFinal ?? false) {
        DispatchQueue.main.async {
          self.stopListening()
        }
      }
    }

    let recordingFormat = inputNode.outputFormat(forBus: 0)
    inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { buffer, _ in
      request.append(buffer)
    }

    audioEngine.prepare()
    do {
      try audioEngine.start()
      isListening = true
      statusMessage = "Listening... say a command"
    } catch {
      statusMessage = "Could not start audio engine"
    }
  }

  func stopListening() {
    audioEngine.stop()
    audioEngine.inputNode.removeTap(onBus: 0)
    recognitionRequest?.endAudio()
    recognitionTask?.cancel()
    recognitionRequest = nil
    recognitionTask = nil
    isListening = false
    statusMessage = "Tap mic or say 'Scan this'"
  }

  private func processCommand(_ text: String) {
    if text.contains("scan this") || text.contains("read this") || text.contains("check this") {
      lastCommand = "scan"
      statusMessage = "📸 Point camera at label..."
    } else if text.contains("what is") || text.contains("is this safe") {
      lastCommand = "query"
      let query = text.replacingOccurrences(of: "what is ", with: "").replacingOccurrences(
        of: "is this safe", with: ""
      ).trimmingCharacters(in: .whitespaces)
      analyzeIngredient(query)
    } else if text.contains("kill list") || text.contains("bad ingredients") {
      lastCommand = "killlist"
      statusMessage = "🔴 Opening Kill List..."
    }
  }

  func analyzeIngredient(_ name: String) {
    let trimmed = name.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
    guard !trimmed.isEmpty else { return }

    let killListItems: [String: String] = [
      "high fructose corn syrup":
        "🔴 AVOID — Liver damage, obesity, insulin resistance. In 80%+ of processed foods.",
      "aspartame":
        "🔴 AVOID — Neurotoxin. Headaches, mood disorders. Marketed as 'diet' but linked to weight gain.",
      "sodium nitrite":
        "🔴 AVOID — Converts to carcinogenic nitrosamines. Common in deli meats, hot dogs.",
      "red 40": "🔴 AVOID — Petroleum-based dye. Hyperactivity in children. Banned in EU for kids.",
      "yellow 5":
        "🔴 AVOID — Petroleum-based dye. Allergic reactions, hyperactivity. Banned in several countries.",
      "yellow 6": "🔴 AVOID — Petroleum-based dye. Contains known carcinogens as contaminants.",
      "msg": "🟡 CAUTION — Excitotoxin. Hidden under 40+ names. Headaches, overeating trigger.",
      "monosodium glutamate":
        "🟡 CAUTION — Excitotoxin. Hidden under 40+ names including 'natural flavors.'",
      "carrageenan": "🟡 CAUTION — Inflammatory. GI issues. Common in milk alternatives.",
      "sodium benzoate":
        "🔴 AVOID — Forms benzene (carcinogen) when combined with Vitamin C. In many sodas.",
      "potassium bromate":
        "🔴 AVOID — Carcinogen in bread. Banned in EU, Canada, Brazil. Still legal in US.",
      "titanium dioxide":
        "🔴 AVOID — Nanoparticle damaging gut lining. Banned in EU since 2022. Still in US candy.",
      "bht": "🟡 CAUTION — Endocrine disruptor. Preservative banned in many countries.",
      "bha": "🟡 CAUTION — Reasonably anticipated carcinogen. Common preservative.",
      "tbhq": "🟡 CAUTION — Preservative in fast food. Immune system effects at higher doses.",
      "sucralose":
        "🟡 CAUTION — Artificial sweetener. May disrupt gut microbiome and insulin response.",
      "canola oil": "🟡 CAUTION — Highly processed seed oil. Inflammatory. Often from GMO rapeseed.",
      "soybean oil":
        "🟡 CAUTION — Most consumed oil in US. Highly processed, inflammatory, usually GMO.",
    ]

    // Check against kill list
    for (ingredient, result) in killListItems {
      if trimmed.contains(ingredient) || ingredient.contains(trimmed) {
        scanResult = VoiceScanResult(
          ingredient: ingredient.capitalized, verdict: result, isKillList: result.contains("AVOID"))
        statusMessage = scanResult!.isKillList ? "🔴 Kill List item detected!" : "🟡 Use with caution"
        speakResult(result)
        return
      }
    }

    scanResult = VoiceScanResult(
      ingredient: trimmed.capitalized,
      verdict: "✅ Not on the Kill List. Check the full label for other ingredients.",
      isKillList: false)
    statusMessage = "✅ Not found on Kill List"
  }

  func analyzeIngredientsText(_ text: String) {
    let ingredients = text.components(separatedBy: CharacterSet(charactersIn: ",;"))
      .map { $0.trimmingCharacters(in: .whitespacesAndNewlines).lowercased() }
      .filter { !$0.isEmpty }

    var found: [VoiceScanResult] = []
    for ingredient in ingredients {
      analyzeIngredient(ingredient)
      if let result = scanResult, result.isKillList {
        found.append(result)
      }
    }

    if found.isEmpty {
      statusMessage = "✅ No Kill List items detected in \(ingredients.count) ingredients"
      scanResult = VoiceScanResult(
        ingredient: "Full Label",
        verdict:
          "✅ Scanned \(ingredients.count) ingredients — none on the Kill List. Still check for excess sugar, sodium, and seed oils.",
        isKillList: false)
    } else {
      statusMessage = "🔴 Found \(found.count) Kill List item(s)!"
      scanResult = VoiceScanResult(
        ingredient: "Full Label",
        verdict:
          "🔴 Found \(found.count) Kill List item(s): \(found.map(\.ingredient).joined(separator: ", "))",
        isKillList: true)
    }
  }

  private func speakResult(_ text: String) {
    let utterance = AVSpeechUtterance(
      string: text.replacingOccurrences(of: "🔴", with: "Warning.").replacingOccurrences(
        of: "🟡", with: "Caution."
      ).replacingOccurrences(of: "✅", with: "Clear."))
    utterance.rate = 0.45
    utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
    let synth = AVSpeechSynthesizer()
    synth.speak(utterance)
  }
}

struct VoiceScanResult: Identifiable {
  let id = UUID()
  let ingredient: String
  let verdict: String
  let isKillList: Bool
}

// MARK: - ═══════════════════════════════════════════════════

// VOICE SCANNER VIEW
// ═══════════════════════════════════════════════════════════

struct VoiceLabelScannerView: View {
  @Environment(\.dismiss) var dismiss
  @StateObject private var manager = VoiceScannerManager()
  @State private var manualInput = ""
  @State private var pulsePhase: CGFloat = 0

  var body: some View {
    NavigationStack {
      ZStack {
        Color(red: 0.03, green: 0.03, blue: 0.08).ignoresSafeArea()

        ScrollView(showsIndicators: false) {
          VStack(spacing: 20) {
            // Mic button
            Button {
              if manager.isListening { manager.stopListening() } else { manager.startListening() }
            } label: {
              ZStack {
                Circle().fill(
                  manager.isListening ? Color.red.opacity(0.15) : Color.cyan.opacity(0.08)
                )
                .frame(width: 100, height: 100)
                .scaleEffect(manager.isListening ? 1.0 + sin(pulsePhase) * 0.1 : 1.0)
                Image(systemName: manager.isListening ? "mic.fill" : "mic")
                  .font(.system(size: 36))
                  .foregroundColor(manager.isListening ? .red : .cyan)
              }
            }

            Text(manager.statusMessage)
              .font(.system(size: 13, weight: .bold)).foregroundColor(.white.opacity(0.6))
              .multilineTextAlignment(.center)

            // Voice commands
            VStack(alignment: .leading, spacing: 6) {
              Text("VOICE COMMANDS").font(.system(size: 9, weight: .bold)).tracking(1)
                .foregroundColor(.white.opacity(0.3))
              commandRow("\"Scan this\"", "Point camera at ingredient label")
              commandRow("\"What is [ingredient]?\"", "Look up any ingredient instantly")
              commandRow("\"Is this safe?\"", "Quick check on what you're holding")
            }
            .padding(12).background(
              RoundedRectangle(cornerRadius: 12).fill(Color.white.opacity(0.03)))

            // Manual input
            VStack(alignment: .leading, spacing: 8) {
              Text("OR TYPE / PASTE INGREDIENTS").font(.system(size: 9, weight: .bold)).tracking(1)
                .foregroundColor(.white.opacity(0.3))
              TextEditor(text: $manualInput)
                .frame(minHeight: 60).scrollContentBackground(.hidden)
                .font(.system(size: 13)).foregroundColor(.white)
                .padding(10).background(
                  RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.04)))

              Button {
                manager.analyzeIngredientsText(manualInput)
              } label: {
                HStack(spacing: 6) {
                  Image(systemName: "magnifyingglass")
                  Text("CHECK INGREDIENTS").font(.system(size: 13, weight: .bold))
                }
                .foregroundColor(.black).frame(maxWidth: .infinity).padding(.vertical, 10)
                .background(Capsule().fill(Color.cyan))
              }
            }

            // Result
            if let result = manager.scanResult {
              VStack(alignment: .leading, spacing: 8) {
                HStack(spacing: 8) {
                  Image(
                    systemName: result.isKillList
                      ? "exclamationmark.triangle.fill" : "checkmark.circle.fill"
                  )
                  .foregroundColor(result.isKillList ? .red : .green)
                  Text(result.ingredient).font(.system(size: 15, weight: .bold)).foregroundColor(
                    .white)
                }
                Text(result.verdict)
                  .font(.system(size: 13, weight: .medium))
                  .foregroundColor(result.isKillList ? .red.opacity(0.8) : .green.opacity(0.8))
                  .lineSpacing(3)
              }
              .padding(14)
              .background(
                RoundedRectangle(cornerRadius: 14).fill(
                  result.isKillList ? Color.red.opacity(0.05) : Color.green.opacity(0.05)
                )
                .overlay(
                  RoundedRectangle(cornerRadius: 14).stroke(
                    result.isKillList ? Color.red.opacity(0.15) : Color.green.opacity(0.15),
                    lineWidth: 1
                  )))
            }

            Spacer(minLength: 40)
          }
          .padding(20)
        }
      }
      .navigationTitle("Voice Scanner")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarLeading) {
          Button {
            dismiss()
          } label: {
            Image(systemName: "chevron.left").font(.system(size: 16, weight: .semibold))
              .foregroundColor(.white)
          }
        }
        ToolbarItem(placement: .principal) {
          HStack(spacing: 6) {
            Image(systemName: "mic.fill").foregroundColor(.cyan)
            Text("Voice Scanner").font(.system(size: 17, weight: .bold)).foregroundColor(.white)
          }
        }
      }
      .onAppear {
        manager.requestPermissions()
        withAnimation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true)) {
          pulsePhase = .pi * 2
        }
      }
      .onDisappear { manager.stopListening() }
    }
  }

  private func commandRow(_ command: String, _ desc: String) -> some View {
    HStack(alignment: .top, spacing: 8) {
      Text(command).font(.system(size: 11, weight: .bold, design: .monospaced)).foregroundColor(
        .cyan
      ).frame(width: 130, alignment: .leading)
      Text(desc).font(.system(size: 10, weight: .medium)).foregroundColor(.white.opacity(0.4))
    }
  }
}
