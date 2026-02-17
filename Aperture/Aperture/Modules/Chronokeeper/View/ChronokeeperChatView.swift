// ChronokeeperChatView.swift
// The Chronokeeper AI Guide — conversational interface
// "Ask anything. I'll read it to you." — hands-free awakening
// ☀️ SunFlow: Reignited

import SwiftUI

// MARK: - Main Chat View

struct ChronokeeperChatView: View {
  @StateObject private var engine = ChronokeeperEngine.shared
  @State private var inputText: String = ""
  @State private var showSettings: Bool = false
  @State private var autoReadAloud: Bool = false
  @FocusState private var isInputFocused: Bool
  @Namespace private var scrollAnchor

  var body: some View {
    NavigationStack {
      ZStack {
        // Background
        LinearGradient(
          colors: [Color(hex: "#07070d"), Color(hex: "#0a0a14"), Color(hex: "#07070d")],
          startPoint: .top,
          endPoint: .bottom
        )
        .ignoresSafeArea()

        VStack(spacing: 0) {
          // Messages
          messagesScrollView

          // Read-aloud bar (when speaking)
          if engine.isReadingAloud {
            readingAloudBar
          }

          // Input bar
          inputBar
        }
      }
      .navigationTitle("Chronokeeper")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .principal) {
          chronokeeperTitle
        }
        ToolbarItem(placement: .topBarTrailing) {
          Menu {
            Button(action: { autoReadAloud.toggle() }) {
              Label(
                autoReadAloud ? "Auto Read: ON" : "Auto Read: OFF",
                systemImage: autoReadAloud ? "speaker.wave.2.fill" : "speaker.slash"
              )
            }

            Button(action: { showSettings = true }) {
              Label("Settings", systemImage: "gear")
            }

            Divider()

            Button(role: .destructive, action: { engine.clearConversation() }) {
              Label("Clear Chat", systemImage: "trash")
            }
          } label: {
            Image(systemName: "ellipsis.circle")
              .foregroundColor(Palette.accent.gold)
          }
        }
      }
      .sheet(isPresented: $showSettings) {
        ChronokeeperSettingsView(engine: engine)
      }
    }
  }

  // MARK: - Nav Title

  private var chronokeeperTitle: some View {
    HStack(spacing: 6) {
      ZStack {
        Circle()
          .fill(Palette.accent.gold.opacity(0.2))
          .frame(width: 26, height: 26)
        Text("🐉")
          .font(.system(size: 14))
      }

      Text("Chronokeeper")
        .font(.system(size: 15, weight: .bold, design: .rounded))
        .foregroundColor(Palette.text.primary)

      if engine.chatState == .thinking {
        ProgressView()
          .scaleEffect(0.6)
          .tint(Palette.accent.gold)
      }
    }
  }

  // MARK: - Messages Scroll

  private var messagesScrollView: some View {
    ScrollViewReader { proxy in
      ScrollView(showsIndicators: false) {
        LazyVStack(spacing: 16) {
          ForEach(engine.messages) { message in
            MessageBubble(
              message: message,
              onActionTap: { action in
                handleAction(action)
              },
              onReadAloud: {
                engine.readLastResponse()
              }
            )
            .id(message.id)
          }

          // Thinking indicator
          if engine.chatState == .thinking {
            thinkingIndicator
          }

          // Scroll anchor
          Color.clear
            .frame(height: 1)
            .id("bottom")
        }
        .padding(.horizontal, 16)
        .padding(.top, 12)
        .padding(.bottom, 8)
      }
      .onChange(of: engine.messages.count) {
        withAnimation(.easeOut(duration: 0.3)) {
          proxy.scrollTo("bottom", anchor: .bottom)
        }
      }
    }
  }

  // MARK: - Thinking Indicator

  private var thinkingIndicator: some View {
    HStack(spacing: 4) {
      ForEach(0..<3, id: \.self) { i in
        Circle()
          .fill(Palette.accent.gold.opacity(0.6))
          .frame(width: 6, height: 6)
          .scaleEffect(engine.chatState == .thinking ? 1.0 : 0.5)
          .animation(
            .easeInOut(duration: 0.6).repeatForever().delay(Double(i) * 0.2),
            value: engine.chatState
          )
      }
    }
    .padding(.horizontal, 16)
    .padding(.vertical, 10)
    .background(
      RoundedRectangle(cornerRadius: 16)
        .fill(Color.white.opacity(0.05))
    )
    .frame(maxWidth: .infinity, alignment: .leading)
  }

  // MARK: - Input Bar

  private var inputBar: some View {
    VStack(spacing: 0) {
      Divider()
        .background(Palette.accent.gold.opacity(0.15))

      HStack(alignment: .bottom, spacing: 10) {
        // Auto read toggle
        Button(action: { autoReadAloud.toggle() }) {
          Image(systemName: autoReadAloud ? "speaker.wave.2.fill" : "speaker.slash")
            .font(.system(size: 16))
            .foregroundColor(autoReadAloud ? Palette.accent.gold : Palette.text.muted)
            .frame(width: 36, height: 36)
            .background(
              Circle()
                .fill(autoReadAloud ? Palette.accent.gold.opacity(0.15) : Color.white.opacity(0.05))
            )
        }

        // Text input
        TextField("Ask the Chronokeeper...", text: $inputText, axis: .vertical)
          .font(.system(size: 15, weight: .medium, design: .rounded))
          .foregroundColor(Palette.text.primary)
          .tint(Palette.accent.gold)
          .lineLimit(1...5)
          .focused($isInputFocused)
          .padding(.horizontal, 14)
          .padding(.vertical, 10)
          .background(
            RoundedRectangle(cornerRadius: 20)
              .fill(Color.white.opacity(0.06))
              .overlay(
                RoundedRectangle(cornerRadius: 20)
                  .stroke(
                    isInputFocused ? Palette.accent.gold.opacity(0.4) : Color.white.opacity(0.1),
                    lineWidth: 1
                  )
              )
          )
          .onSubmit { sendCurrentMessage() }

        // Send button
        Button(action: { sendCurrentMessage() }) {
          Image(systemName: "arrow.up.circle.fill")
            .font(.system(size: 32))
            .foregroundColor(
              inputText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
                ? Palette.text.muted
                : Palette.accent.gold
            )
        }
        .disabled(
          inputText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
            || engine.chatState == .thinking)
      }
      .padding(.horizontal, 14)
      .padding(.vertical, 10)
      .background(Color(hex: "#0a0a10"))
    }
  }

  // MARK: - Reading Aloud Bar

  private var readingAloudBar: some View {
    HStack(spacing: 12) {
      Image(systemName: "waveform")
        .font(.system(size: 16))
        .foregroundColor(Palette.accent.gold)
        .symbolEffect(.variableColor.iterative, options: .repeating)

      Text("Reading aloud...")
        .font(.system(size: 13, weight: .semibold, design: .rounded))
        .foregroundColor(Palette.text.primary)

      Spacer()

      Button(action: { engine.stopReading() }) {
        Image(systemName: "stop.circle.fill")
          .font(.system(size: 24))
          .foregroundColor(Color(hex: "#E74C3C"))
      }
    }
    .padding(.horizontal, 16)
    .padding(.vertical, 10)
    .background(Palette.accent.gold.opacity(0.08))
  }

  // MARK: - Actions

  private func sendCurrentMessage() {
    let text = inputText
    inputText = ""

    Task {
      await engine.send(text, readAloud: autoReadAloud)
    }
  }

  private func handleAction(_ action: ChronokeeperAction) {
    switch action.type {
    case .sendMessage(let text):
      Task { await engine.send(text, readAloud: autoReadAloud) }
    case .readAloud:
      engine.readLastResponse()
    case .continueJourney:
      Task { await engine.send("Where did I leave off?", readAloud: autoReadAloud) }
    case .openCourse(let id):
      // Post notification for navigation
      NotificationCenter.default.post(
        name: .chronokeeperNavigate, object: nil, userInfo: ["type": "course", "id": id])
    case .openModule(let id):
      NotificationCenter.default.post(
        name: .chronokeeperNavigate, object: nil, userInfo: ["type": "module", "id": id])
    }
  }
}

// MARK: - Notification for Navigation

extension NSNotification.Name {
  static let chronokeeperNavigate = NSNotification.Name("chronokeeperNavigate")
}

// MARK: - Message Bubble

struct MessageBubble: View {
  let message: ChronokeeperMessage
  let onActionTap: (ChronokeeperAction) -> Void
  let onReadAloud: () -> Void

  var body: some View {
    VStack(alignment: message.role == .user ? .trailing : .leading, spacing: 8) {
      // Message content
      HStack {
        if message.role == .user { Spacer(minLength: 60) }

        VStack(alignment: .leading, spacing: 8) {
          // Role label
          if message.role == .assistant {
            HStack(spacing: 4) {
              Text("🐉")
                .font(.system(size: 10))
              Text("CHRONOKEEPER")
                .font(.system(size: 9, weight: .bold))
                .tracking(1)
                .foregroundColor(Palette.accent.gold.opacity(0.7))
            }
          }

          Text(message.content)
            .font(.system(size: 15, weight: .medium, design: .rounded))
            .foregroundColor(message.role == .user ? .white : Palette.text.primary)
            .lineSpacing(4)
            .textSelection(.enabled)

          // Course card (if present)
          if let card = message.courseCard {
            embeddedCourseCard(card)
          }
        }
        .padding(.horizontal, 14)
        .padding(.vertical, 10)
        .background(bubbleBackground)

        if message.role == .assistant { Spacer(minLength: 40) }
      }

      // Action buttons (if present)
      if let actions = message.actionButtons, !actions.isEmpty {
        actionButtonRow(actions)
      }
    }
    .frame(maxWidth: .infinity, alignment: message.role == .user ? .trailing : .leading)
  }

  private var bubbleBackground: some View {
    Group {
      if message.role == .user {
        RoundedRectangle(cornerRadius: 18, style: .continuous)
          .fill(
            LinearGradient(
              colors: [Palette.accent.gold.opacity(0.4), Palette.accent.gold.opacity(0.25)],
              startPoint: .topLeading,
              endPoint: .bottomTrailing
            )
          )
      } else {
        RoundedRectangle(cornerRadius: 18, style: .continuous)
          .fill(Color.white.opacity(0.05))
          .overlay(
            RoundedRectangle(cornerRadius: 18, style: .continuous)
              .stroke(Palette.accent.gold.opacity(0.08), lineWidth: 1)
          )
      }
    }
  }

  // MARK: - Embedded Course Card

  private func embeddedCourseCard(_ card: ChronokeeperCourseCard) -> some View {
    HStack(spacing: 12) {
      // Icon
      ZStack {
        Circle()
          .fill(card.color.opacity(0.15))
          .frame(width: 40, height: 40)
        Image(systemName: card.icon)
          .font(.system(size: 16))
          .foregroundColor(card.color)
      }

      // Info
      VStack(alignment: .leading, spacing: 3) {
        Text(card.title)
          .font(.system(size: 13, weight: .bold, design: .rounded))
          .foregroundColor(Palette.text.primary)
          .lineLimit(1)

        Text("\(card.moduleCount) modules · \(card.lessonCount) lessons")
          .font(.system(size: 10, weight: .medium))
          .foregroundColor(Palette.text.muted)

        // Progress bar
        GeometryReader { geo in
          ZStack(alignment: .leading) {
            Capsule()
              .fill(Color.white.opacity(0.1))
              .frame(height: 4)
            Capsule()
              .fill(card.color)
              .frame(width: geo.size.width * card.progress, height: 4)
          }
        }
        .frame(height: 4)
      }

      Spacer()

      // Percentage
      Text("\(Int(card.progress * 100))%")
        .font(.system(size: 12, weight: .bold, design: .monospaced))
        .foregroundColor(card.color)
    }
    .padding(10)
    .background(
      RoundedRectangle(cornerRadius: 12)
        .fill(Color.white.opacity(0.03))
        .overlay(RoundedRectangle(cornerRadius: 12).stroke(card.color.opacity(0.2), lineWidth: 1))
    )
  }

  // MARK: - Action Button Row

  private func actionButtonRow(_ actions: [ChronokeeperAction]) -> some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack(spacing: 8) {
        ForEach(actions) { action in
          Button(action: { onActionTap(action) }) {
            HStack(spacing: 5) {
              Image(systemName: action.icon)
                .font(.system(size: 11))
              Text(action.label)
                .font(.system(size: 12, weight: .semibold, design: .rounded))
            }
            .foregroundColor(Palette.accent.gold)
            .padding(.horizontal, 12)
            .padding(.vertical, 7)
            .background(
              Capsule()
                .fill(Palette.accent.gold.opacity(0.1))
                .overlay(Capsule().stroke(Palette.accent.gold.opacity(0.25), lineWidth: 1))
            )
          }
          .buttonStyle(PlainButtonStyle())
        }
      }
      .padding(.leading, message.role == .assistant ? 0 : 60)
    }
  }
}

// MARK: - Settings View

struct ChronokeeperSettingsView: View {
  @ObservedObject var engine: ChronokeeperEngine
  @State private var apiKeyInput: String = ""
  @State private var showKeyField: Bool = false
  @Environment(\.dismiss) private var dismiss

  var body: some View {
    NavigationStack {
      ZStack {
        Color.black.ignoresSafeArea()

        ScrollView {
          VStack(spacing: 20) {
            // Status
            VStack(spacing: 12) {
              HStack(spacing: 8) {
                Circle()
                  .fill(engine.hasAPIKey ? Color.green : Color.orange)
                  .frame(width: 8, height: 8)
                Text(engine.hasAPIKey ? "Premium AI Active" : "Free Tier (Scripted Responses)")
                  .font(.system(size: 14, weight: .semibold, design: .rounded))
                  .foregroundColor(Palette.text.primary)
              }

              Text(
                engine.hasAPIKey
                  ? "The Chronokeeper has full AI intelligence. Ask anything."
                  : "Scripted responses for courses, Kill List, and navigation. Add an API key for full AI conversation."
              )
              .font(.system(size: 12, weight: .medium))
              .foregroundColor(Palette.text.muted)
              .multilineTextAlignment(.center)
            }
            .padding(16)
            .frame(maxWidth: .infinity)
            .background(
              RoundedRectangle(cornerRadius: 14)
                .fill(Color.white.opacity(0.04))
            )

            // API Key
            VStack(alignment: .leading, spacing: 10) {
              Text("CLAUDE API KEY")
                .font(.system(size: 10, weight: .bold)).tracking(1.5)
                .foregroundColor(Palette.text.muted)

              Text(
                "In production, this proxies through your backend. For development, enter your key directly."
              )
              .font(.system(size: 11, weight: .medium))
              .foregroundColor(Palette.text.muted)

              if showKeyField {
                HStack {
                  SecureField("sk-ant-...", text: $apiKeyInput)
                    .font(.system(size: 13, design: .monospaced))
                    .foregroundColor(Palette.text.primary)
                    .textContentType(.password)
                    .autocorrectionDisabled()
                    .padding(10)
                    .background(
                      RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white.opacity(0.05))
                        .overlay(
                          RoundedRectangle(cornerRadius: 10).stroke(
                            Palette.primary.cyan.opacity(0.2), lineWidth: 1))
                    )

                  Button(action: {
                    engine.setAPIKey(apiKeyInput)
                    apiKeyInput = ""
                    showKeyField = false
                    HapticManager.shared.medium()
                  }) {
                    Text("Save")
                      .font(.system(size: 13, weight: .bold))
                      .foregroundColor(.black)
                      .padding(.horizontal, 16)
                      .padding(.vertical, 10)
                      .background(Palette.accent.gold)
                      .cornerRadius(10)
                  }
                }
              } else {
                Button(action: { showKeyField = true }) {
                  HStack(spacing: 8) {
                    Image(systemName: engine.hasAPIKey ? "checkmark.circle.fill" : "key.fill")
                      .foregroundColor(engine.hasAPIKey ? .green : Palette.primary.cyan)
                    Text(engine.hasAPIKey ? "Key configured — tap to change" : "Add API Key")
                      .font(.system(size: 13, weight: .semibold))
                      .foregroundColor(Palette.text.primary)
                  }
                  .padding(12)
                  .frame(maxWidth: .infinity, alignment: .leading)
                  .background(
                    RoundedRectangle(cornerRadius: 10)
                      .fill(Color.white.opacity(0.04))
                      .overlay(
                        RoundedRectangle(cornerRadius: 10).stroke(
                          Palette.primary.cyan.opacity(0.15), lineWidth: 1))
                  )
                }
              }
            }

            // Voice settings
            VStack(alignment: .leading, spacing: 10) {
              Text("VOICE")
                .font(.system(size: 10, weight: .bold)).tracking(1.5)
                .foregroundColor(Palette.text.muted)

              let tts = TextToSpeechManager.shared
              Picker(
                "Voice Style",
                selection: Binding(
                  get: { tts.voiceStyle },
                  set: { tts.voiceStyle = $0 }
                )
              ) {
                ForEach(NarrationVoiceStyle.allCases) { style in
                  HStack {
                    Image(systemName: style.icon)
                    Text(style.rawValue)
                  }
                  .tag(style)
                }
              }
              .pickerStyle(.segmented)
              .tint(Palette.accent.gold)
            }

            // Privacy note
            HStack(spacing: 8) {
              Image(systemName: "lock.shield.fill")
                .font(.system(size: 14))
                .foregroundColor(Palette.primary.cyan.opacity(0.7))
              Text(
                "Conversations are stored locally on your device. When using the AI, your messages are sent to Claude's API for processing — never stored on their servers."
              )
              .font(.system(size: 11, weight: .medium))
              .foregroundColor(Palette.text.muted)
              .lineSpacing(2)
            }
            .padding(12)
            .background(
              RoundedRectangle(cornerRadius: 10)
                .fill(Palette.primary.cyan.opacity(0.04))
            )
          }
          .padding(20)
        }
      }
      .navigationTitle("Chronokeeper Settings")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .topBarTrailing) {
          Button("Done") { dismiss() }
            .foregroundColor(Palette.accent.gold)
        }
      }
    }
  }
}
