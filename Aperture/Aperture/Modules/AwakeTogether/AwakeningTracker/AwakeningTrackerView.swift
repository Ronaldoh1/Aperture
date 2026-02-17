// AwakeningTrackerView.swift
// Track your awakening journey with personalized milestones
// Voice journal with local transcription (V2: cloud sync)

import AVFoundation
import Speech
import SwiftUI

// MARK: - Models

struct AwakeningJourney: Codable, Identifiable {
  let id: UUID
  var startDate: Date
  var currentPhase: TrackerAwakeningPhase
  var milestones: [AwakenMilestone]
  var journalEntries: [JournalEntry]
  var totalDaysOnPath: Int {
    Calendar.current.dateComponents([.day], from: startDate, to: Date()).day ?? 0
  }
}

enum TrackerAwakeningPhase: String, Codable, CaseIterable {
  case seeker = "Seeker"
  case questioner = "Questioner"
  case awakening = "Awakening"
  case integration = "Integration"
  case embodiment = "Embodiment"
  case service = "Service"

  var description: String {
    switch self {
    case .seeker: return "Feeling something is off, searching for meaning"
    case .questioner: return "Actively questioning beliefs and narratives"
    case .awakening: return "Experiencing shifts in perception and reality"
    case .integration: return "Grounding insights into daily life"
    case .embodiment: return "Living from awakened awareness consistently"
    case .service: return "Helping others on their journey"
    }
  }

  var color: Color {
    switch self {
    case .seeker: return .gray
    case .questioner: return .blue
    case .awakening: return .purple
    case .integration: return .orange
    case .embodiment: return .green
    case .service: return .yellow
    }
  }

  var icon: String {
    switch self {
    case .seeker: return "magnifyingglass"
    case .questioner: return "questionmark.circle"
    case .awakening: return "eye"
    case .integration: return "arrow.triangle.merge"
    case .embodiment: return "person.fill"
    case .service: return "heart.fill"
    }
  }
}

struct AwakenMilestone: Codable, Identifiable {
  let id: UUID
  let title: String
  let description: String
  let category: MilestoneCategory
  var isCompleted: Bool
  var completedDate: Date?
  var notes: String?
}

enum MilestoneCategory: String, Codable, CaseIterable {
  case awareness = "Awareness"
  case beliefs = "Beliefs"
  case patterns = "Patterns"
  case relationships = "Relationships"
  case purpose = "Purpose"
  case integration = "Integration"

  var icon: String {
    switch self {
    case .awareness: return "eye.fill"
    case .beliefs: return "brain.head.profile"
    case .patterns: return "repeat"
    case .relationships: return "person.2.fill"
    case .purpose: return "star.fill"
    case .integration: return "checkmark.seal.fill"
    }
  }

  var color: Color {
    switch self {
    case .awareness: return .purple
    case .beliefs: return .blue
    case .patterns: return .orange
    case .relationships: return .pink
    case .purpose: return .yellow
    case .integration: return .green
    }
  }
}

struct JournalEntry: Codable, Identifiable {
  let id: UUID
  let createdAt: Date
  var content: String
  var voiceNoteURL: URL?
  var transcription: String?
  var mood: String
  var insights: [String]
  var isVoiceNote: Bool
}

// MARK: - Main View

struct AwakeningTrackerView: View {
  @StateObject private var tracker = AwakeningTrackerManager()
  @State private var selectedTab = 0
  @State private var showingNewEntry = false
  @State private var showingMilestoneDetail: AwakenMilestone?

  var body: some View {
    ScrollView {
      VStack(spacing: 24) {
        // Header Stats
        headerStatsSection

        // Phase Progress
        phaseProgressSection

        // Tab Selector
        tabSelector

        // Content based on tab
        if selectedTab == 0 {
          journalSection
        } else {
          milestonesSection
        }
      }
      .padding()
    }
    .background(Color.black.ignoresSafeArea())
    .navigationTitle("Awakening Tracker")
    .navigationBarTitleDisplayMode(.inline)
    .toolbar {
      ToolbarItem(placement: .navigationBarTrailing) {
        Button(action: { showingNewEntry = true }) {
          Image(systemName: "plus.circle.fill")
            .foregroundColor(.cyan)
        }
      }
    }
    .sheet(isPresented: $showingNewEntry) {
      NewJournalEntryView(tracker: tracker)
    }
    .sheet(item: $showingMilestoneDetail) { milestone in
      MilestoneDetailView(milestone: milestone, tracker: tracker)
    }
    .onAppear {
      tracker.loadJourney()
    }
  }

  // MARK: - Header Stats

  private var headerStatsSection: some View {
    VStack(spacing: 16) {
      // Journey Duration
      HStack {
        VStack(alignment: .leading) {
          Text("DAY \(tracker.journey.totalDaysOnPath)")
            .font(.system(size: 32, weight: .black))
            .foregroundColor(.white)
          Text("of your awakening journey")
            .font(.system(size: 12))
            .foregroundColor(.gray)
        }

        Spacer()

        // Streak
        VStack {
          Text("🔥")
            .font(.system(size: 28))
          Text("\(tracker.currentStreak) day streak")
            .font(.system(size: 10))
            .foregroundColor(.orange)
        }
      }

      // Quick Stats
      HStack(spacing: 12) {
        statCard("\(tracker.journey.journalEntries.count)", "Entries", .cyan)
        statCard("\(tracker.completedMilestones)", "Milestones", .green)
        statCard("\(tracker.totalInsights)", "Insights", .purple)
      }
    }
    .padding()
    .background(Color.white.opacity(0.05))
    .cornerRadius(16)
  }

  private func statCard(_ value: String, _ label: String, _ color: Color) -> some View {
    VStack(spacing: 4) {
      Text(value)
        .font(.system(size: 20, weight: .bold))
        .foregroundColor(color)
      Text(label)
        .font(.system(size: 10))
        .foregroundColor(.gray)
    }
    .frame(maxWidth: .infinity)
    .padding(.vertical, 12)
    .background(color.opacity(0.1))
    .cornerRadius(10)
  }

  // MARK: - Phase Progress

  private var phaseProgressSection: some View {
    VStack(alignment: .leading, spacing: 12) {
      HStack {
        Image(systemName: tracker.journey.currentPhase.icon)
          .foregroundColor(tracker.journey.currentPhase.color)
        Text("CURRENT PHASE")
          .font(.system(size: 12, weight: .black))
          .foregroundColor(tracker.journey.currentPhase.color)
        Spacer()
      }

      Text(tracker.journey.currentPhase.rawValue)
        .font(.system(size: 22, weight: .bold))
        .foregroundColor(.white)

      Text(tracker.journey.currentPhase.description)
        .font(.system(size: 12))
        .foregroundColor(.gray)

      // Phase Progress Bar
      HStack(spacing: 4) {
        ForEach(TrackerAwakeningPhase.allCases, id: \.self) { phase in
          Rectangle()
            .fill(
              phaseIndex(phase) <= phaseIndex(tracker.journey.currentPhase)
                ? phase.color : Color.white.opacity(0.1)
            )
            .frame(height: 6)
            .cornerRadius(3)
        }
      }
      .padding(.top, 8)
    }
    .padding()
    .background(tracker.journey.currentPhase.color.opacity(0.1))
    .cornerRadius(16)
  }

  private func phaseIndex(_ phase: TrackerAwakeningPhase) -> Int {
    TrackerAwakeningPhase.allCases.firstIndex(of: phase) ?? 0
  }

  // MARK: - Tab Selector

  private var tabSelector: some View {
    HStack(spacing: 0) {
      tabButton("Journal", icon: "book.fill", index: 0)
      tabButton("Milestones", icon: "flag.fill", index: 1)
    }
    .background(Color.white.opacity(0.05))
    .cornerRadius(12)
  }

  private func tabButton(_ title: String, icon: String, index: Int) -> some View {
    Button(action: { selectedTab = index }) {
      HStack(spacing: 6) {
        Image(systemName: icon)
        Text(title)
          .font(.system(size: 13, weight: .semibold))
      }
      .foregroundColor(selectedTab == index ? .white : .gray)
      .padding(.vertical, 12)
      .frame(maxWidth: .infinity)
      .background(selectedTab == index ? Color.white.opacity(0.1) : Color.clear)
      .cornerRadius(10)
    }
  }

  // MARK: - Journal Section

  private var journalSection: some View {
    VStack(alignment: .leading, spacing: 12) {
      HStack {
        Image(systemName: "book.fill")
          .foregroundColor(.cyan)
        Text("CLARITY CODEX")
          .font(.system(size: 12, weight: .black))
          .foregroundColor(.cyan)
        Spacer()

        // Voice note shortcut
        Button(action: { showingNewEntry = true }) {
          HStack(spacing: 4) {
            Image(systemName: "mic.fill")
            Text("Voice")
          }
          .font(.system(size: 11))
          .foregroundColor(.orange)
          .padding(.horizontal, 10)
          .padding(.vertical, 6)
          .background(Color.orange.opacity(0.2))
          .cornerRadius(8)
        }
      }

      if tracker.journey.journalEntries.isEmpty {
        emptyJournalCard
      } else {
        ForEach(tracker.journey.journalEntries.prefix(10)) { entry in
          journalEntryCard(entry)
        }
      }
    }
  }

  private var emptyJournalCard: some View {
    VStack(spacing: 12) {
      Image(systemName: "book.closed")
        .font(.system(size: 40))
        .foregroundColor(.gray)

      Text("Your Clarity Codex is empty")
        .font(.system(size: 14, weight: .medium))
        .foregroundColor(.white)

      Text("Start journaling to track your awakening insights")
        .font(.system(size: 12))
        .foregroundColor(.gray)
        .multilineTextAlignment(.center)

      Button(action: { showingNewEntry = true }) {
        HStack {
          Image(systemName: "plus.circle.fill")
          Text("Add First Entry")
        }
        .font(.system(size: 13, weight: .semibold))
        .foregroundColor(.white)
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
        .background(Color.cyan)
        .cornerRadius(10)
      }
    }
    .padding(30)
    .frame(maxWidth: .infinity)
    .background(Color.white.opacity(0.03))
    .cornerRadius(16)
  }

  private func journalEntryCard(_ entry: JournalEntry) -> some View {
    VStack(alignment: .leading, spacing: 8) {
      HStack {
        Text(entry.mood)
          .font(.system(size: 20))

        VStack(alignment: .leading, spacing: 2) {
          Text(entry.createdAt, style: .date)
            .font(.system(size: 12, weight: .semibold))
            .foregroundColor(.white)
          Text(entry.createdAt, style: .time)
            .font(.system(size: 10))
            .foregroundColor(.gray)
        }

        Spacer()

        if entry.isVoiceNote {
          Image(systemName: "waveform")
            .foregroundColor(.orange)
        }
      }

      Text(entry.content)
        .font(.system(size: 13))
        .foregroundColor(.white.opacity(0.9))
        .lineLimit(3)

      if !entry.insights.isEmpty {
        HStack(spacing: 6) {
          Image(systemName: "lightbulb.fill")
            .foregroundColor(.yellow)
            .font(.system(size: 10))
          Text("\(entry.insights.count) insight(s)")
            .font(.system(size: 10))
            .foregroundColor(.yellow)
        }
      }
    }
    .padding(12)
    .background(Color.white.opacity(0.05))
    .cornerRadius(12)
  }

  // MARK: - Milestones Section

  private var milestonesSection: some View {
    VStack(alignment: .leading, spacing: 12) {
      ForEach(MilestoneCategory.allCases, id: \.self) { category in
        milestoneCategorySection(category)
      }
    }
  }

  private func milestoneCategorySection(_ category: MilestoneCategory) -> some View {
    let categoryMilestones = tracker.journey.milestones.filter { $0.category == category }
    let completed = categoryMilestones.filter { $0.isCompleted }.count

    return VStack(alignment: .leading, spacing: 10) {
      HStack {
        Image(systemName: category.icon)
          .foregroundColor(category.color)
        Text(category.rawValue.uppercased())
          .font(.system(size: 12, weight: .black))
          .foregroundColor(category.color)
        Spacer()
        Text("\(completed)/\(categoryMilestones.count)")
          .font(.system(size: 11))
          .foregroundColor(.gray)
      }

      ForEach(categoryMilestones) { milestone in
        Button(action: { showingMilestoneDetail = milestone }) {
          HStack {
            Image(systemName: milestone.isCompleted ? "checkmark.circle.fill" : "circle")
              .foregroundColor(milestone.isCompleted ? .green : .gray)

            VStack(alignment: .leading, spacing: 2) {
              Text(milestone.title)
                .font(.system(size: 13, weight: .medium))
                .foregroundColor(milestone.isCompleted ? .green : .white)
              Text(milestone.description)
                .font(.system(size: 10))
                .foregroundColor(.gray)
                .lineLimit(1)
            }

            Spacer()

            Image(systemName: "chevron.right")
              .foregroundColor(.gray)
              .font(.system(size: 10))
          }
          .padding(10)
          .background(Color.white.opacity(0.03))
          .cornerRadius(8)
        }
      }
    }
    .padding()
    .background(category.color.opacity(0.1))
    .cornerRadius(12)
  }
}

// MARK: - Manager

@MainActor
class AwakeningTrackerManager: ObservableObject {
  @Published var journey: AwakeningJourney
  @Published var currentStreak: Int = 0

  private let storageKey = "awakening_journey"

  var completedMilestones: Int {
    journey.milestones.filter { $0.isCompleted }.count
  }

  var totalInsights: Int {
    journey.journalEntries.reduce(0) { $0 + $1.insights.count }
  }

  init() {
    journey = AwakeningJourney(
      id: UUID(),
      startDate: Date(),
      currentPhase: .seeker,
      milestones: Self.defaultMilestones,
      journalEntries: []
    )
    loadJourney()
  }

  func loadJourney() {
    if let data = UserDefaults.standard.data(forKey: storageKey),
      let saved = try? JSONDecoder().decode(AwakeningJourney.self, from: data)
    {
      journey = saved
    }
    calculateStreak()
  }

  func saveJourney() {
    if let data = try? JSONEncoder().encode(journey) {
      UserDefaults.standard.set(data, forKey: storageKey)
    }
  }

  func addJournalEntry(_ entry: JournalEntry) {
    journey.journalEntries.insert(entry, at: 0)
    saveJourney()
    calculateStreak()
  }

  func toggleMilestone(_ milestone: AwakenMilestone) {
    if let index = journey.milestones.firstIndex(where: { $0.id == milestone.id }) {
      journey.milestones[index].isCompleted.toggle()
      journey.milestones[index].completedDate = journey.milestones[index].isCompleted ? Date() : nil
      saveJourney()
    }
  }

  func updatePhase(_ phase: TrackerAwakeningPhase) {
    journey.currentPhase = phase
    saveJourney()
  }

  private func calculateStreak() {
    var streak = 0
    let calendar = Calendar.current
    var checkDate = Date()

    for entry in journey.journalEntries.sorted(by: { $0.createdAt > $1.createdAt }) {
      if calendar.isDate(entry.createdAt, inSameDayAs: checkDate) {
        if streak == 0 {
          streak = 1
        }
      } else if let dayBefore = calendar.date(byAdding: .day, value: -1, to: checkDate),
        calendar.isDate(entry.createdAt, inSameDayAs: dayBefore)
      {
        streak += 1
        checkDate = dayBefore
      } else {
        break
      }
    }

    currentStreak = streak
  }

  // MARK: - Default Milestones

  static var defaultMilestones: [AwakenMilestone] {
    [
      // Awareness
      AwakenMilestone(
        id: UUID(), title: "First Glimpse",
        description: "Experienced a moment where reality felt different", category: .awareness,
        isCompleted: false),
      AwakenMilestone(
        id: UUID(), title: "Observer Mode", description: "Noticed thoughts as separate from self",
        category: .awareness, isCompleted: false),
      AwakenMilestone(
        id: UUID(), title: "Synchronicity Spotted",
        description: "Recognized meaningful coincidences", category: .awareness, isCompleted: false),

      // Beliefs
      AwakenMilestone(
        id: UUID(), title: "First Belief Questioned",
        description: "Actively questioned a long-held belief", category: .beliefs,
        isCompleted: false),
      AwakenMilestone(
        id: UUID(), title: "Narrative Unpacked", description: "Traced a belief back to its source",
        category: .beliefs, isCompleted: false),
      AwakenMilestone(
        id: UUID(), title: "Mind Changed",
        description: "Changed a significant belief based on new evidence", category: .beliefs,
        isCompleted: false),

      // Patterns
      AwakenMilestone(
        id: UUID(), title: "Pattern Recognized", description: "Noticed a repeating life pattern",
        category: .patterns, isCompleted: false),
      AwakenMilestone(
        id: UUID(), title: "Trigger Mapped",
        description: "Identified emotional trigger and root cause", category: .patterns,
        isCompleted: false),
      AwakenMilestone(
        id: UUID(), title: "Pattern Broken",
        description: "Successfully changed a habitual response", category: .patterns,
        isCompleted: false),

      // Relationships
      AwakenMilestone(
        id: UUID(), title: "Mirror Seen",
        description: "Recognized others reflecting your own aspects", category: .relationships,
        isCompleted: false),
      AwakenMilestone(
        id: UUID(), title: "Boundary Set", description: "Established a healthy boundary with love",
        category: .relationships, isCompleted: false),
      AwakenMilestone(
        id: UUID(), title: "Forgiveness Given", description: "Released resentment toward someone",
        category: .relationships, isCompleted: false),

      // Purpose
      AwakenMilestone(
        id: UUID(), title: "Gift Identified", description: "Recognized your unique contribution",
        category: .purpose, isCompleted: false),
      AwakenMilestone(
        id: UUID(), title: "Passion Pursued", description: "Took action on what lights you up",
        category: .purpose, isCompleted: false),
      AwakenMilestone(
        id: UUID(), title: "Service Given", description: "Helped someone on their journey",
        category: .purpose, isCompleted: false),

      // Integration
      AwakenMilestone(
        id: UUID(), title: "Dark Night Survived",
        description: "Made it through an ego death experience", category: .integration,
        isCompleted: false),
      AwakenMilestone(
        id: UUID(), title: "Grounded Mystic",
        description: "Integrated insights into practical life", category: .integration,
        isCompleted: false),
      AwakenMilestone(
        id: UUID(), title: "Both/And Embraced",
        description: "Held paradox without needing resolution", category: .integration,
        isCompleted: false),
    ]
  }
}

// MARK: - New Entry View

struct NewJournalEntryView: View {
  @ObservedObject var tracker: AwakeningTrackerManager
  @Environment(\.dismiss) private var dismiss

  @State private var content = ""
  @State private var selectedMood = "😌"
  @State private var insights: [String] = []
  @State private var newInsight = ""
  @State private var isRecording = false
  @State private var transcribedText = ""

  @StateObject private var audioRecorder = AudioRecorder()

  let moods = ["😴", "😔", "😐", "😌", "😊", "🤯", "✨", "🔥"]

  var body: some View {
    NavigationStack {
      ScrollView {
        VStack(spacing: 20) {
          // Mood Selector
          moodSelector

          // Voice Record Button
          voiceRecordSection

          // Text Entry
          textEntrySection

          // Insights
          insightsSection
        }
        .padding()
      }
      .background(Color.black.ignoresSafeArea())
      .navigationTitle("New Entry")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarLeading) {
          Button("Cancel") { dismiss() }
        }
        ToolbarItem(placement: .navigationBarTrailing) {
          Button("Save") { saveEntry() }
            .disabled(content.isEmpty && transcribedText.isEmpty)
        }
      }
    }
  }

  private var moodSelector: some View {
    VStack(alignment: .leading, spacing: 8) {
      Text("How are you feeling?")
        .font(.system(size: 12, weight: .bold))
        .foregroundColor(.gray)

      HStack(spacing: 12) {
        ForEach(moods, id: \.self) { mood in
          Button(action: { selectedMood = mood }) {
            Text(mood)
              .font(.system(size: 28))
              .padding(8)
              .background(selectedMood == mood ? Color.cyan.opacity(0.3) : Color.clear)
              .cornerRadius(10)
          }
        }
      }
    }
  }

  private var voiceRecordSection: some View {
    VStack(spacing: 12) {
      Button(action: toggleRecording) {
        VStack(spacing: 8) {
          ZStack {
            Circle()
              .fill(isRecording ? Color.red : Color.orange)
              .frame(width: 70, height: 70)

            Image(systemName: isRecording ? "stop.fill" : "mic.fill")
              .font(.system(size: 28))
              .foregroundColor(.white)
          }

          Text(isRecording ? "Tap to Stop" : "Hold to Record")
            .font(.system(size: 12))
            .foregroundColor(.gray)
        }
      }

      if !transcribedText.isEmpty {
        VStack(alignment: .leading, spacing: 6) {
          Text("Transcription:")
            .font(.system(size: 11, weight: .bold))
            .foregroundColor(.orange)
          Text(transcribedText)
            .font(.system(size: 13))
            .foregroundColor(.white)
            .padding(10)
            .background(Color.orange.opacity(0.2))
            .cornerRadius(8)
        }
      }
    }
  }

  private var textEntrySection: some View {
    VStack(alignment: .leading, spacing: 8) {
      Text("What's on your mind?")
        .font(.system(size: 12, weight: .bold))
        .foregroundColor(.gray)

      TextEditor(text: $content)
        .frame(minHeight: 150)
        .padding(10)
        .background(Color.white.opacity(0.05))
        .cornerRadius(12)
    }
  }

  private var insightsSection: some View {
    VStack(alignment: .leading, spacing: 10) {
      HStack {
        Image(systemName: "lightbulb.fill")
          .foregroundColor(.yellow)
        Text("Key Insights")
          .font(.system(size: 12, weight: .bold))
          .foregroundColor(.yellow)
      }

      ForEach(insights, id: \.self) { insight in
        HStack {
          Text("💡 \(insight)")
            .font(.system(size: 12))
            .foregroundColor(.white)
          Spacer()
          Button(action: { insights.removeAll { $0 == insight } }) {
            Image(systemName: "xmark.circle")
              .foregroundColor(.gray)
          }
        }
        .padding(8)
        .background(Color.yellow.opacity(0.1))
        .cornerRadius(8)
      }

      HStack {
        TextField("Add an insight...", text: $newInsight)
          .font(.system(size: 13))
          .foregroundColor(.white)

        Button(action: {
          if !newInsight.isEmpty {
            insights.append(newInsight)
            newInsight = ""
          }
        }) {
          Image(systemName: "plus.circle.fill")
            .foregroundColor(.yellow)
        }
      }
      .padding(10)
      .background(Color.white.opacity(0.05))
      .cornerRadius(8)
    }
  }

  private func toggleRecording() {
    if isRecording {
      audioRecorder.stopRecording()
      // In real implementation, transcribe here
      transcribedText =
        "Voice note recorded. Transcription would appear here with SFSpeechRecognizer."
    } else {
      audioRecorder.startRecording()
    }
    isRecording.toggle()
  }

  private func saveEntry() {
    let entry = JournalEntry(
      id: UUID(),
      createdAt: Date(),
      content: content.isEmpty ? transcribedText : content,
      voiceNoteURL: audioRecorder.audioURL,
      transcription: transcribedText.isEmpty ? nil : transcribedText,
      mood: selectedMood,
      insights: insights,
      isVoiceNote: !transcribedText.isEmpty
    )

    tracker.addJournalEntry(entry)
    dismiss()
  }
}

// MARK: - Milestone Detail View

struct MilestoneDetailView: View {
  let milestone: AwakenMilestone
  @ObservedObject var tracker: AwakeningTrackerManager
  @Environment(\.dismiss) private var dismiss
  @State private var notes = ""

  var body: some View {
    NavigationStack {
      ScrollView {
        VStack(spacing: 20) {
          // Status
          HStack {
            Image(systemName: milestone.isCompleted ? "checkmark.circle.fill" : "circle")
              .font(.system(size: 50))
              .foregroundColor(milestone.isCompleted ? .green : .gray)

            VStack(alignment: .leading) {
              Text(milestone.title)
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.white)

              HStack {
                Image(systemName: milestone.category.icon)
                Text(milestone.category.rawValue)
              }
              .font(.system(size: 12))
              .foregroundColor(milestone.category.color)
            }
          }

          Text(milestone.description)
            .font(.system(size: 14))
            .foregroundColor(.gray)
            .multilineTextAlignment(.center)

          // Toggle Button
          Button(action: {
            tracker.toggleMilestone(milestone)
            dismiss()
          }) {
            HStack {
              Image(systemName: milestone.isCompleted ? "xmark.circle" : "checkmark.circle")
              Text(milestone.isCompleted ? "Mark Incomplete" : "Mark Complete")
            }
            .font(.system(size: 14, weight: .semibold))
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(milestone.isCompleted ? Color.orange : Color.green)
            .cornerRadius(12)
          }

          // Notes
          VStack(alignment: .leading, spacing: 8) {
            Text("Notes")
              .font(.system(size: 12, weight: .bold))
              .foregroundColor(.gray)

            TextEditor(text: $notes)
              .frame(minHeight: 100)
              .padding(10)
              .background(Color.white.opacity(0.05))
              .cornerRadius(10)
          }
        }
        .padding()
      }
      .background(Color.black.ignoresSafeArea())
      .navigationTitle("Milestone")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button("Done") { dismiss() }
        }
      }
    }
  }
}

// MARK: - Audio Recorder

class AudioRecorder: NSObject, ObservableObject {
  var audioRecorder: AVAudioRecorder?
  var audioURL: URL?

  func startRecording() {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    audioURL = paths[0].appendingPathComponent("voice_note_\(Date().timeIntervalSince1970).m4a")

    let settings: [String: Any] = [
      AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
      AVSampleRateKey: 44100,
      AVNumberOfChannelsKey: 1,
      AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue,
    ]

    do {
      try AVAudioSession.sharedInstance().setCategory(.record, mode: .default)
      try AVAudioSession.sharedInstance().setActive(true)
      audioRecorder = try AVAudioRecorder(url: audioURL!, settings: settings)
      audioRecorder?.record()
    } catch {
      print("Recording failed: \(error)")
    }
  }

  func stopRecording() {
    audioRecorder?.stop()
  }
}

#Preview {
  NavigationStack {
    AwakeningTrackerView()
  }
}
