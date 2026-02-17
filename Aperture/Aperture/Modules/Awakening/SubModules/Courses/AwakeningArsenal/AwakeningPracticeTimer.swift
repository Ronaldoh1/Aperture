// AwakeningPracticeTimer.swift
// Guided practice timer with voice guidance
// For meditation, breathwork, and other timed practices

import AVFoundation
import AudioToolbox
import SwiftUI

struct AwakeningPracticeTimer: View {
  let method: AwakeningMethod
  let step: AwakeningStep

  @Environment(\.dismiss) private var dismiss
  @StateObject private var timerManager = PracticeTimerManager()
  @State private var selectedDuration: Int = 10  // minutes
  @State private var isActive = false
  @State private var showCompletion = false
  @State private var notes = ""

  var body: some View {
    ZStack {
      // Background
      Color.black.ignoresSafeArea()

      if showCompletion {
        completionView
      } else if isActive {
        activeTimerView
      } else {
        setupView
      }
    }
    .onReceive(timerManager.$isComplete) { complete in
      if complete {
        withAnimation {
          showCompletion = true
          isActive = false
        }
      }
    }
  }

  // MARK: - Setup View

  private var setupView: some View {
    VStack(spacing: 30) {
      // Header
      VStack(spacing: 8) {
        Text(method.icon)
          .font(.system(size: 50))

        Text(step.title)
          .font(.system(size: 24, weight: .bold))
          .foregroundColor(.white)

        Text(method.name)
          .font(.system(size: 14))
          .foregroundColor(method.uiColor)
      }

      // Duration Picker
      VStack(spacing: 12) {
        Text("Select Duration")
          .font(.system(size: 14, weight: .medium))
          .foregroundColor(.gray)

        HStack(spacing: 12) {
          durationButton(5)
          durationButton(10)
          durationButton(15)
          durationButton(20)
          durationButton(30)
        }
      }

      // Voice Guide Toggle
      VStack(spacing: 8) {
        Toggle(isOn: $timerManager.voiceGuidanceEnabled) {
          HStack {
            Image(systemName: "waveform.circle")
              .foregroundColor(.cyan)
            Text("Voice Guidance")
              .foregroundColor(.white)
          }
        }
        .tint(.cyan)

        if timerManager.voiceGuidanceEnabled {
          Text("You'll receive gentle reminders during practice")
            .font(.system(size: 11))
            .foregroundColor(.gray)
        }
      }
      .padding()
      .background(Color.white.opacity(0.05))
      .cornerRadius(12)

      // Instructions
      VStack(alignment: .leading, spacing: 8) {
        Text("Practice Tips:")
          .font(.system(size: 12, weight: .bold))
          .foregroundColor(method.uiColor)

        ForEach(step.commonMistakes.prefix(3), id: \.self) { mistake in
          HStack(alignment: .top, spacing: 8) {
            Image(systemName: "exclamationmark.triangle.fill")
              .foregroundColor(.yellow)
              .font(.system(size: 10))
            Text("Avoid: \(mistake)")
              .font(.system(size: 12))
              .foregroundColor(.white.opacity(0.8))
          }
        }
      }
      .padding()
      .background(Color.white.opacity(0.05))
      .cornerRadius(12)

      Spacer()

      // Start Button
      Button(action: {
        withAnimation {
          timerManager.startTimer(duration: selectedDuration * 60)
          isActive = true
        }
      }) {
        HStack {
          Image(systemName: "play.fill")
          Text("Begin Practice")
            .font(.system(size: 16, weight: .semibold))
        }
        .foregroundColor(.black)
        .padding()
        .frame(maxWidth: .infinity)
        .background(method.uiColor)
        .cornerRadius(12)
      }

      Button("Cancel") {
        dismiss()
      }
      .foregroundColor(.gray)
    }
    .padding()
  }

  private func durationButton(_ minutes: Int) -> some View {
    Button(action: {
      selectedDuration = minutes
    }) {
      Text("\(minutes)")
        .font(.system(size: 16, weight: selectedDuration == minutes ? .bold : .medium))
        .foregroundColor(selectedDuration == minutes ? .black : .white)
        .frame(width: 50, height: 50)
        .background(selectedDuration == minutes ? method.uiColor : Color.white.opacity(0.1))
        .cornerRadius(25)
    }
  }

  // MARK: - Active Timer View

  private var activeTimerView: some View {
    VStack(spacing: 40) {
      Spacer()

      // Timer Circle
      ZStack {
        // Background circle
        Circle()
          .stroke(Color.white.opacity(0.1), lineWidth: 8)
          .frame(width: 250, height: 250)

        // Progress circle
        Circle()
          .trim(from: 0, to: timerManager.progress)
          .stroke(
            LinearGradient(
              colors: [method.uiColor, method.uiColor.opacity(0.5)],
              startPoint: .topLeading,
              endPoint: .bottomTrailing
            ),
            style: StrokeStyle(lineWidth: 8, lineCap: .round)
          )
          .frame(width: 250, height: 250)
          .rotationEffect(.degrees(-90))
          .animation(.linear(duration: 1), value: timerManager.progress)

        // Timer display
        VStack(spacing: 8) {
          Text(timerManager.timeString)
            .font(.system(size: 48, weight: .thin, design: .monospaced))
            .foregroundColor(.white)

          Text(timerManager.currentPhase)
            .font(.system(size: 14))
            .foregroundColor(method.uiColor)
        }
      }

      // Method icon
      Text(method.icon)
        .font(.system(size: 60))
        .opacity(0.8)

      // Status message
      if timerManager.voiceGuidanceEnabled {
        Text(timerManager.statusMessage)
          .font(.system(size: 14))
          .foregroundColor(.gray)
          .multilineTextAlignment(.center)
          .padding(.horizontal)
      }

      Spacer()

      // Control buttons
      HStack(spacing: 40) {
        // Pause/Resume
        Button(action: {
          if timerManager.isPaused {
            timerManager.resume()
          } else {
            timerManager.pause()
          }
        }) {
          Image(systemName: timerManager.isPaused ? "play.fill" : "pause.fill")
            .font(.system(size: 24))
            .foregroundColor(.white)
            .frame(width: 60, height: 60)
            .background(Color.white.opacity(0.2))
            .clipShape(Circle())
        }

        // Stop
        Button(action: {
          timerManager.stop()
          withAnimation {
            showCompletion = true
            isActive = false
          }
        }) {
          Image(systemName: "stop.fill")
            .font(.system(size: 24))
            .foregroundColor(.red)
            .frame(width: 60, height: 60)
            .background(Color.red.opacity(0.2))
            .clipShape(Circle())
        }
      }
    }
    .padding()
  }

  // MARK: - Completion View

  private var completionView: some View {
    VStack(spacing: 24) {
      // Celebration
      ZStack {
        Circle()
          .fill(method.uiColor.opacity(0.2))
          .frame(width: 120, height: 120)

        Image(systemName: "checkmark.circle.fill")
          .font(.system(size: 60))
          .foregroundColor(method.uiColor)
      }

      Text("Practice Complete!")
        .font(.system(size: 24, weight: .bold))
        .foregroundColor(.white)

      Text("You practiced for \(timerManager.elapsedMinutes) minutes")
        .font(.system(size: 14))
        .foregroundColor(.gray)

      // Notes
      VStack(alignment: .leading, spacing: 8) {
        Text("How was your practice?")
          .font(.system(size: 14, weight: .medium))
          .foregroundColor(.white)

        TextEditor(text: $notes)
          .frame(height: 100)
          .padding(8)
          .background(Color.white.opacity(0.1))
          .cornerRadius(8)
          .foregroundColor(.white)
      }

      // Mood selector
      VStack(spacing: 8) {
        Text("Energy Level")
          .font(.system(size: 12))
          .foregroundColor(.gray)

        HStack(spacing: 16) {
          moodButton("😴", "Low")
          moodButton("😌", "Calm")
          moodButton("😊", "Good")
          moodButton("✨", "High")
          moodButton("🔥", "Peak")
        }
      }

      Spacer()

      // Done button
      Button(action: {
        // Save practice session
        dismiss()
      }) {
        HStack {
          Image(systemName: "checkmark")
          Text("Save & Done")
            .font(.system(size: 16, weight: .semibold))
        }
        .foregroundColor(.black)
        .padding()
        .frame(maxWidth: .infinity)
        .background(method.uiColor)
        .cornerRadius(12)
      }
    }
    .padding()
  }

  @State private var selectedMood: String = ""

  private func moodButton(_ emoji: String, _ label: String) -> some View {
    Button(action: {
      selectedMood = label
    }) {
      VStack(spacing: 4) {
        Text(emoji)
          .font(.system(size: 28))
        Text(label)
          .font(.system(size: 10))
          .foregroundColor(selectedMood == label ? method.uiColor : .gray)
      }
      .padding(8)
      .background(selectedMood == label ? method.uiColor.opacity(0.2) : Color.clear)
      .cornerRadius(8)
    }
  }
}

// MARK: - Timer Manager

class PracticeTimerManager: ObservableObject {
  @Published var timeRemaining: Int = 0
  @Published var totalTime: Int = 0
  @Published var isPaused = false
  @Published var isComplete = false
  @Published var progress: Double = 1.0
  @Published var currentPhase = "Preparing..."
  @Published var statusMessage = "Find a comfortable position"
  @Published var voiceGuidanceEnabled = true

  private var timer: Timer?
  private let synthesizer = AVSpeechSynthesizer()

  var timeString: String {
    let minutes = timeRemaining / 60
    let seconds = timeRemaining % 60
    return String(format: "%02d:%02d", minutes, seconds)
  }

  var elapsedMinutes: Int {
    (totalTime - timeRemaining) / 60
  }

  func startTimer(duration: Int) {
    totalTime = duration
    timeRemaining = duration
    isComplete = false
    isPaused = false

    // Opening guidance
    if voiceGuidanceEnabled {
      speak("Beginning your practice. Take a deep breath and settle in.")
      currentPhase = "Opening"
    }

    timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
      self?.tick()
    }
  }

  private func tick() {
    guard !isPaused else { return }

    if timeRemaining > 0 {
      timeRemaining -= 1
      progress = Double(timeRemaining) / Double(totalTime)

      // Phase updates with voice
      updatePhase()
    } else {
      complete()
    }
  }

  private func updatePhase() {
    let elapsed = totalTime - timeRemaining
    let percentComplete = Double(elapsed) / Double(totalTime)

    // Update phases
    if percentComplete < 0.1 {
      currentPhase = "Settling In"
    } else if percentComplete < 0.3 {
      currentPhase = "Deepening"
    } else if percentComplete < 0.7 {
      currentPhase = "Main Practice"
    } else if percentComplete < 0.9 {
      currentPhase = "Integrating"
    } else {
      currentPhase = "Closing"
    }

    // Voice cues at specific points
    if voiceGuidanceEnabled {
      switch elapsed {
      case 60:
        speak("One minute in. Let go of any tension.")
        statusMessage = "Release tension"
      case totalTime / 4:
        speak("Quarter way through. Deepen your awareness.")
        statusMessage = "Deepen awareness"
      case totalTime / 2:
        speak("Halfway point. Stay present.")
        statusMessage = "Stay present"
      case totalTime * 3 / 4:
        speak("Three quarters complete. Begin to notice your surroundings.")
        statusMessage = "Notice surroundings"
      case totalTime - 60:
        speak("One minute remaining. Gently prepare to conclude.")
        statusMessage = "Preparing to close"
      case totalTime - 10:
        speak("Ten seconds.")
        statusMessage = "Almost there"
      default:
        break
      }
    }
  }

  func pause() {
    isPaused = true
    timer?.invalidate()
    if voiceGuidanceEnabled {
      speak("Paused. Take your time.")
    }
  }

  func resume() {
    isPaused = false
    timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
      self?.tick()
    }
    if voiceGuidanceEnabled {
      speak("Resuming.")
    }
  }

  func stop() {
    timer?.invalidate()
    timer = nil
  }

  private func complete() {
    timer?.invalidate()
    timer = nil
    isComplete = true

    if voiceGuidanceEnabled {
      speak("Practice complete. Well done. Take a moment before returning to your day.")
    }

    // Play completion sound
    AudioServicesPlaySystemSound(1007)  // Gentle chime
  }

  private func speak(_ text: String) {
    let utterance = AVSpeechUtterance(string: text)
    utterance.rate = 0.45  // Slower, calmer pace
    utterance.pitchMultiplier = 0.9
    utterance.volume = 0.8

    // Use a calm voice if available
    if let voice = AVSpeechSynthesisVoice(language: "en-US") {
      utterance.voice = voice
    }

    synthesizer.speak(utterance)
  }
}

// MARK: - Preview

#Preview {
  AwakeningPracticeTimer(
    method: AwakeningMethod(
      id: "preview-kundalini",
      name: "Kundalini Awakening",
      tradition: "Hinduism",
      region: "South Asia",
      icon: "flame.fill",
      color: "#FF6B6B",
      tagline: "Awaken the serpent within",
      energyName: "Kundalini Shakti",
      overview: "Dormant serpent energy rises through chakras",
      steps: [],
      practices: [],
      warnings: [],
      resources: [],
      voiceGuidanceAvailable: true
    ),
    step: AwakeningStep(
      id: "step-1",
      stepNumber: 1,
      title: "Breathwork",
      description: "Begin with pranayama breathing",
      duration: "10 minutes",
      frequency: "Daily",
      detailedInstructions: "Sit comfortably and breathe deeply",
      commonMistakes: ["Forcing the breath"],
      progressIndicators: ["Feeling of warmth"]
    )
  )
}
