// CosmicNotesSystem.swift
// COSMIC NOTES — Your universal thought capture system
// ☀️ SunFlow: Reignited
//
// Accessible from anywhere in the app. Take notes during Alexandria courses,
// capture insights during Flow State, log ideas while scanning food.
// Syncs prioritization list with Flow State if premium.

import SwiftUI

// MARK: - ═══════════════════════════════════════════════════

// DATA MODELS
// ═══════════════════════════════════════════════════════════

enum CosmicNoteType: String, CaseIterable, Codable {
  case note = "Note"
  case task = "Task"
  case checklist = "Checklist"
  case voiceMemo = "Voice Memo"
  case insight = "Insight"

  var icon: String {
    switch self {
    case .note: return "doc.text.fill"
    case .task: return "checkmark.circle.fill"
    case .checklist: return "list.bullet.clipboard.fill"
    case .voiceMemo: return "mic.fill"
    case .insight: return "lightbulb.fill"
    }
  }

  var color: Color {
    switch self {
    case .note: return Color(red: 0.4, green: 0.7, blue: 1.0)
    case .task: return .orange
    case .checklist: return .green
    case .voiceMemo: return .purple
    case .insight: return Color(red: 1.0, green: 0.85, blue: 0.3)
    }
  }
}

enum NoteLabel: String, CaseIterable, Codable {
  case personal = "Personal"
  case awakening = "Awakening"
  case health = "Health"
  case flowState = "Flow State"
  case research = "Research"
  case deprogram = "Deprogram"
  case ideas = "Ideas"
  case followUp = "Follow Up"
  case gratitude = "Gratitude"

  var icon: String {
    switch self {
    case .personal: return "person.fill"
    case .awakening: return "sun.max.fill"
    case .health: return "heart.fill"
    case .flowState: return "bolt.fill"
    case .research: return "magnifyingglass"
    case .deprogram: return "brain.fill"
    case .ideas: return "lightbulb.fill"
    case .followUp: return "arrow.uturn.forward"
    case .gratitude: return "sparkles"
    }
  }

  var color: Color {
    switch self {
    case .personal: return .blue
    case .awakening: return .orange
    case .health: return .green
    case .flowState: return .cyan
    case .research: return .purple
    case .deprogram: return .red
    case .ideas: return .yellow
    case .followUp: return .pink
    case .gratitude: return Color(red: 1.0, green: 0.85, blue: 0.3)
    }
  }
}

enum NoteColor: String, CaseIterable, Codable {
  case cosmic = "Cosmic"  // Deep purple
  case ocean = "Ocean"  // Blue
  case ember = "Ember"  // Orange-red
  case forest = "Forest"  // Green
  case sunset = "Sunset"  // Warm orange
  case midnight = "Midnight"  // Dark blue
  case rose = "Rose"  // Pink
  case neutral = "Neutral"  // Gray

  var bgColor: Color {
    switch self {
    case .cosmic: return Color(red: 0.2, green: 0.1, blue: 0.3)
    case .ocean: return Color(red: 0.08, green: 0.15, blue: 0.3)
    case .ember: return Color(red: 0.3, green: 0.1, blue: 0.08)
    case .forest: return Color(red: 0.08, green: 0.2, blue: 0.1)
    case .sunset: return Color(red: 0.3, green: 0.18, blue: 0.05)
    case .midnight: return Color(red: 0.05, green: 0.08, blue: 0.2)
    case .rose: return Color(red: 0.25, green: 0.1, blue: 0.15)
    case .neutral: return Color(red: 0.12, green: 0.12, blue: 0.14)
    }
  }

  var accentColor: Color {
    switch self {
    case .cosmic: return Color(red: 0.6, green: 0.4, blue: 0.9)
    case .ocean: return Color(red: 0.3, green: 0.6, blue: 1.0)
    case .ember: return Color(red: 1.0, green: 0.4, blue: 0.3)
    case .forest: return Color(red: 0.3, green: 0.8, blue: 0.4)
    case .sunset: return Color(red: 1.0, green: 0.7, blue: 0.2)
    case .midnight: return Color(red: 0.3, green: 0.5, blue: 0.9)
    case .rose: return Color(red: 1.0, green: 0.5, blue: 0.7)
    case .neutral: return Color.white.opacity(0.6)
    }
  }
}

struct CosmicNote: Identifiable, Codable {
  let id: String
  var title: String
  var body: String
  var type: CosmicNoteType
  var labels: [NoteLabel]
  var color: NoteColor
  var priority: Int?  // 1-5, nil = no priority
  var checklistItems: [ChecklistItem]
  var isPinned: Bool
  var createdAt: Date
  var updatedAt: Date
  var sourceModule: String?  // Which module created it (e.g., "Alexandria", "QuantumNourish")
  var voiceMemoPath: String?  // For future voice memo support

  init(
    id: String = UUID().uuidString, title: String = "", body: String = "",
    type: CosmicNoteType = .note,
    labels: [NoteLabel] = [], color: NoteColor = .neutral, priority: Int? = nil,
    checklistItems: [ChecklistItem] = [], isPinned: Bool = false, createdAt: Date = Date(),
    updatedAt: Date = Date(), sourceModule: String? = nil, voiceMemoPath: String? = nil
  ) {
    self.id = id
    self.title = title
    self.body = body
    self.type = type
    self.labels = labels
    self.color = color
    self.priority = priority
    self.checklistItems = checklistItems
    self.isPinned = isPinned
    self.createdAt = createdAt
    self.updatedAt = updatedAt
    self.sourceModule = sourceModule
    self.voiceMemoPath = voiceMemoPath
  }
}

struct ChecklistItem: Identifiable, Codable {
  let id: String
  var text: String
  var isCompleted: Bool
  var createdAt: Date

  init(
    id: String = UUID().uuidString, text: String, isCompleted: Bool = false,
    createdAt: Date = Date()
  ) {
    self.id = id
    self.text = text
    self.isCompleted = isCompleted
    self.createdAt = createdAt
  }
}

// MARK: - ═══════════════════════════════════════════════════

// NOTES MANAGER (Singleton — accessible app-wide)
// ═══════════════════════════════════════════════════════════

@MainActor
class CosmicNotesManager: ObservableObject {
  static let shared = CosmicNotesManager()

  @Published var notes: [CosmicNote] = []
  @Published var selectedLabel: NoteLabel? = nil
  @Published var selectedType: CosmicNoteType? = nil
  @Published var searchText: String = ""
  @Published var sortOrder: SortOrder = .updatedDesc

  private let storageKey = "cosmic.notes.all"

  enum SortOrder: String, CaseIterable {
    case updatedDesc = "Recently Updated"
    case createdDesc = "Newest First"
    case createdAsc = "Oldest First"
    case priorityAsc = "Priority (High → Low)"
    case alphabetical = "A → Z"
  }

  init() {
    load()
  }

  // MARK: - CRUD

  func create(_ note: CosmicNote) {
    notes.insert(note, at: 0)
    persist()
  }

  func update(_ note: CosmicNote) {
    if let idx = notes.firstIndex(where: { $0.id == note.id }) {
      var updated = note
      updated.updatedAt = Date()
      notes[idx] = updated
      persist()
    }
  }

  func delete(_ note: CosmicNote) {
    notes.removeAll { $0.id == note.id }
    persist()
  }

  func togglePin(_ note: CosmicNote) {
    if let idx = notes.firstIndex(where: { $0.id == note.id }) {
      notes[idx].isPinned.toggle()
      notes[idx].updatedAt = Date()
      persist()
    }
  }

  func toggleChecklistItem(noteId: String, itemId: String) {
    if let nIdx = notes.firstIndex(where: { $0.id == noteId }),
      let iIdx = notes[nIdx].checklistItems.firstIndex(where: { $0.id == itemId })
    {
      notes[nIdx].checklistItems[iIdx].isCompleted.toggle()
      notes[nIdx].updatedAt = Date()
      persist()
    }
  }

  func addChecklistItem(noteId: String, text: String) {
    if let idx = notes.firstIndex(where: { $0.id == noteId }) {
      notes[idx].checklistItems.append(ChecklistItem(text: text))
      notes[idx].updatedAt = Date()
      persist()
    }
  }

  // MARK: - Quick Capture (from anywhere)

  func quickCapture(
    title: String, body: String = "", type: CosmicNoteType = .note,
    labels: [NoteLabel] = [], sourceModule: String? = nil
  ) {
    let note = CosmicNote(
      title: title, body: body, type: type, labels: labels,
      sourceModule: sourceModule
    )
    create(note)
  }

  // MARK: - Filtering & Sorting

  var filteredNotes: [CosmicNote] {
    var result = notes

    if let label = selectedLabel {
      result = result.filter { $0.labels.contains(label) }
    }
    if let type = selectedType {
      result = result.filter { $0.type == type }
    }
    if !searchText.isEmpty {
      let query = searchText.lowercased()
      result = result.filter {
        $0.title.lowercased().contains(query) || $0.body.lowercased().contains(query)
          || $0.checklistItems.contains(where: { $0.text.lowercased().contains(query) })
      }
    }

    let pinned = result.filter { $0.isPinned }
    let unpinned = result.filter { !$0.isPinned }

    let sorted: [CosmicNote]
    switch sortOrder {
    case .updatedDesc: sorted = unpinned.sorted { $0.updatedAt > $1.updatedAt }
    case .createdDesc: sorted = unpinned.sorted { $0.createdAt > $1.createdAt }
    case .createdAsc: sorted = unpinned.sorted { $0.createdAt < $1.createdAt }
    case .priorityAsc: sorted = unpinned.sorted { ($0.priority ?? 99) < ($1.priority ?? 99) }
    case .alphabetical: sorted = unpinned.sorted { $0.title.lowercased() < $1.title.lowercased() }
    }

    return pinned.sorted { $0.updatedAt > $1.updatedAt } + sorted
  }

  /// Priority items for Flow State sync
  var prioritizedNotes: [CosmicNote] {
    notes.filter { $0.priority != nil && $0.type == .task }
      .sorted { ($0.priority ?? 99) < ($1.priority ?? 99) }
  }

  /// Convert prioritized notes to PriorityItems for Flow State
  func syncToFlowState() {
    let orchestrator = FlowOrchestrator.shared
    for note in prioritizedNotes where !note.title.isEmpty {
      let exists = orchestrator.priorityInbox.contains { $0.title == note.title }
      if !exists {
        let priority: Priority
        switch note.priority {
        case 1: priority = .p1
        case 2: priority = .p2
        case 3: priority = .p3
        case 4: priority = .p4
        default: priority = .p5
        }
        let item = PriorityItem(
          id: UUID(),
          title: note.title,
          description: note.body.isEmpty ? nil : note.body,
          priority: priority,
          source: .manual,
          createdAt: note.createdAt,
          dueDate: nil,
          isCompleted: false
        )
        orchestrator.priorityInbox.append(item)
      }
    }
  }

  // MARK: - Stats

  var totalNotes: Int {
    notes.count
  }

  var totalTasks: Int {
    notes.filter { $0.type == .task }.count
  }

  var completedTasks: Int {
    notes.filter {
      $0.type == .task && $0.checklistItems.allSatisfy { $0.isCompleted }
        && !$0.checklistItems.isEmpty
    }.count
  }

  // MARK: - Persistence

  private func load() {
    if let data = UserDefaults.standard.data(forKey: storageKey),
      let decoded = try? JSONDecoder().decode([CosmicNote].self, from: data)
    {
      notes = decoded
    }
  }

  private func persist() {
    if let data = try? JSONEncoder().encode(notes) {
      UserDefaults.standard.set(data, forKey: storageKey)
    }
  }
}

// MARK: - ═══════════════════════════════════════════════════

// MAIN HUB VIEW
// ═══════════════════════════════════════════════════════════

struct CosmicNotesView: View {
  @Environment(\.dismiss) var dismiss
  @StateObject private var manager = CosmicNotesManager.shared
  @State private var showNewNote = false
  @State private var editingNote: CosmicNote? = nil
  @State private var showQuickCapture = false
  @State private var showSortPicker = false

  var body: some View {
    NavigationStack {
      ZStack {
        notesBackground

        VStack(spacing: 0) {
          // Search Bar
          searchBar

          // Filter Chips
          filterChips

          // Notes List
          if manager.filteredNotes.isEmpty {
            emptyState
          } else {
            notesList
          }
        }
      }
      .navigationTitle("")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarLeading) {
          Button {
            dismiss()
          } label: {
            Image(systemName: "chevron.left")
              .font(.system(size: 16, weight: .semibold))
              .foregroundColor(.white)
          }
        }
        ToolbarItem(placement: .principal) {
          HStack(spacing: 6) {
            Image(systemName: "doc.text.fill")
              .foregroundColor(Color(red: 0.4, green: 0.7, blue: 1.0))
            Text("Cosmic Notes")
              .font(.system(size: 17, weight: .bold))
              .foregroundColor(.white)
          }
        }
        ToolbarItem(placement: .navigationBarTrailing) {
          HStack(spacing: 12) {
            Button {
              showSortPicker = true
            } label: {
              Image(systemName: "arrow.up.arrow.down")
                .font(.system(size: 14))
                .foregroundColor(.white.opacity(0.6))
            }
            Button {
              showNewNote = true
            } label: {
              Image(systemName: "plus.circle.fill")
                .font(.system(size: 22))
                .foregroundColor(Color(red: 0.4, green: 0.7, blue: 1.0))
            }
          }
        }
      }
      .sheet(isPresented: $showNewNote) {
        CosmicNoteEditorView(manager: manager, note: nil)
      }
      .sheet(item: $editingNote) { note in
        CosmicNoteEditorView(manager: manager, note: note)
      }
      .sheet(isPresented: $showQuickCapture) {
        QuickCaptureSheet(manager: manager)
      }
      .confirmationDialog("Sort By", isPresented: $showSortPicker) {
        ForEach(CosmicNotesManager.SortOrder.allCases, id: \.self) { order in
          Button(order.rawValue) { manager.sortOrder = order }
        }
      }
    }
  }

  // MARK: - Background

  private var notesBackground: some View {
    LinearGradient(
      colors: [
        Color(red: 0.04, green: 0.04, blue: 0.10),
        Color(red: 0.06, green: 0.06, blue: 0.14),
        Color(red: 0.04, green: 0.03, blue: 0.08),
      ],
      startPoint: .top, endPoint: .bottom
    )
    .ignoresSafeArea()
  }

  // MARK: - Search

  private var searchBar: some View {
    HStack(spacing: 10) {
      Image(systemName: "magnifyingglass")
        .foregroundColor(.white.opacity(0.3))
      TextField("Search notes, tasks, checklists...", text: $manager.searchText)
        .font(.system(size: 14))
        .foregroundColor(.white)
      if !manager.searchText.isEmpty {
        Button {
          manager.searchText = ""
        } label: {
          Image(systemName: "xmark.circle.fill")
            .foregroundColor(.white.opacity(0.3))
        }
      }
    }
    .padding(10)
    .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.06)))
    .padding(.horizontal, 16)
    .padding(.top, 8)
  }

  // MARK: - Filter Chips

  private var filterChips: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack(spacing: 8) {
        // Type filters
        ForEach(CosmicNoteType.allCases, id: \.self) { type in
          filterChip(
            label: type.rawValue,
            icon: type.icon,
            isSelected: manager.selectedType == type,
            color: type.color
          ) {
            manager.selectedType = manager.selectedType == type ? nil : type
          }
        }

        Divider().frame(height: 20).background(Color.white.opacity(0.1))

        // Label filters
        ForEach(NoteLabel.allCases, id: \.self) { label in
          filterChip(
            label: label.rawValue,
            icon: label.icon,
            isSelected: manager.selectedLabel == label,
            color: label.color
          ) {
            manager.selectedLabel = manager.selectedLabel == label ? nil : label
          }
        }
      }
      .padding(.horizontal, 16)
      .padding(.vertical, 10)
    }
  }

  private func filterChip(
    label: String, icon: String, isSelected: Bool, color: Color, action: @escaping () -> Void
  ) -> some View {
    Button(action: action) {
      HStack(spacing: 4) {
        Image(systemName: icon)
          .font(.system(size: 10))
        Text(label)
          .font(.system(size: 11, weight: .medium))
      }
      .foregroundColor(isSelected ? .white : .white.opacity(0.5))
      .padding(.horizontal, 10)
      .padding(.vertical, 6)
      .background(
        Capsule().fill(isSelected ? color.opacity(0.3) : Color.white.opacity(0.04))
          .overlay(Capsule().stroke(isSelected ? color.opacity(0.5) : Color.clear, lineWidth: 1))
      )
    }
  }

  // MARK: - Stats Bar

  private var statsBar: some View {
    HStack(spacing: 16) {
      statBadge("\(manager.totalNotes)", "Notes", .blue)
      statBadge("\(manager.totalTasks)", "Tasks", .orange)
      statBadge("\(manager.completedTasks)", "Done", .green)
      Spacer()
    }
    .padding(.horizontal, 16)
    .padding(.vertical, 6)
  }

  private func statBadge(_ value: String, _ label: String, _ color: Color) -> some View {
    HStack(spacing: 4) {
      Text(value).font(.system(size: 14, weight: .bold)).foregroundColor(color)
      Text(label).font(.system(size: 10, weight: .medium)).foregroundColor(.white.opacity(0.4))
    }
  }

  // MARK: - Notes List

  private var notesList: some View {
    ScrollView(showsIndicators: false) {
      LazyVStack(spacing: 10) {
        statsBar

        ForEach(manager.filteredNotes) { note in
          noteCard(note)
            .contextMenu {
              Button {
                manager.togglePin(note)
              } label: {
                Label(
                  note.isPinned ? "Unpin" : "Pin", systemImage: note.isPinned ? "pin.slash" : "pin")
              }
              Button {
                editingNote = note
              } label: {
                Label("Edit", systemImage: "pencil")
              }
              Button(role: .destructive) {
                manager.delete(note)
              } label: {
                Label("Delete", systemImage: "trash")
              }
            }
        }

        Spacer(minLength: 100)
      }
      .padding(.horizontal, 16)
    }
  }

  // MARK: - Note Card

  private func noteCard(_ note: CosmicNote) -> some View {
    Button {
      editingNote = note
    } label: {
      VStack(alignment: .leading, spacing: 8) {
        // Header
        HStack(spacing: 8) {
          Image(systemName: note.type.icon)
            .font(.system(size: 12))
            .foregroundColor(note.type.color)

          if note.isPinned {
            Image(systemName: "pin.fill")
              .font(.system(size: 9))
              .foregroundColor(.yellow)
          }

          Text(note.title.isEmpty ? "Untitled" : note.title)
            .font(.system(size: 14, weight: .semibold))
            .foregroundColor(.white)
            .lineLimit(1)

          Spacer()

          if let p = note.priority {
            Text("P\(p)")
              .font(.system(size: 9, weight: .bold))
              .foregroundColor(.white)
              .padding(.horizontal, 6)
              .padding(.vertical, 2)
              .background(Capsule().fill(priorityColor(p)))
          }

          Text(timeAgo(note.updatedAt))
            .font(.system(size: 10, weight: .medium))
            .foregroundColor(.white.opacity(0.3))
        }

        // Body preview
        if !note.body.isEmpty {
          Text(note.body)
            .font(.system(size: 12, weight: .regular))
            .foregroundColor(.white.opacity(0.5))
            .lineLimit(2)
            .lineSpacing(2)
        }

        // Checklist preview
        if !note.checklistItems.isEmpty {
          let completed = note.checklistItems.filter { $0.isCompleted }.count
          let total = note.checklistItems.count
          HStack(spacing: 6) {
            ProgressView(value: Double(completed), total: Double(total))
              .progressViewStyle(LinearProgressViewStyle(tint: .green))
              .frame(width: 60)
            Text("\(completed)/\(total)")
              .font(.system(size: 10, weight: .medium))
              .foregroundColor(.green.opacity(0.7))
          }
        }

        // Labels
        if !note.labels.isEmpty {
          HStack(spacing: 4) {
            ForEach(note.labels, id: \.self) { label in
              HStack(spacing: 2) {
                Image(systemName: label.icon)
                  .font(.system(size: 8))
                Text(label.rawValue)
                  .font(.system(size: 9, weight: .medium))
              }
              .foregroundColor(label.color.opacity(0.7))
              .padding(.horizontal, 6)
              .padding(.vertical, 2)
              .background(Capsule().fill(label.color.opacity(0.1)))
            }
          }
        }

        // Source module
        if let source = note.sourceModule {
          HStack(spacing: 4) {
            Image(systemName: "link")
              .font(.system(size: 8))
            Text("from \(source)")
              .font(.system(size: 9, weight: .medium))
          }
          .foregroundColor(.white.opacity(0.2))
        }
      }
      .padding(14)
      .background(
        RoundedRectangle(cornerRadius: 14)
          .fill(note.color.bgColor)
          .overlay(
            RoundedRectangle(cornerRadius: 14)
              .stroke(
                note.isPinned ? Color.yellow.opacity(0.2) : note.color.accentColor.opacity(0.1),
                lineWidth: 1)
          )
      )
    }
  }

  // MARK: - Empty State

  private var emptyState: some View {
    VStack(spacing: 16) {
      Spacer()
      Image(systemName: "doc.text.fill")
        .font(.system(size: 48))
        .foregroundColor(.white.opacity(0.1))
      Text("No notes yet")
        .font(.system(size: 18, weight: .bold))
        .foregroundColor(.white.opacity(0.3))
      Text("Capture thoughts, tasks, and insights\nfrom anywhere in the app.")
        .font(.system(size: 13))
        .foregroundColor(.white.opacity(0.2))
        .multilineTextAlignment(.center)
      Button {
        showNewNote = true
      } label: {
        HStack(spacing: 6) {
          Image(systemName: "plus")
          Text("Create First Note")
            .font(.system(size: 14, weight: .bold))
        }
        .foregroundColor(.black)
        .padding(.horizontal, 24)
        .padding(.vertical, 10)
        .background(Capsule().fill(Color(red: 0.4, green: 0.7, blue: 1.0)))
      }
      Spacer()
    }
  }

  // MARK: - Helpers

  private func priorityColor(_ p: Int) -> Color {
    switch p {
    case 1: return .red
    case 2: return .orange
    case 3: return .yellow
    case 4: return .green
    default: return .gray
    }
  }

  private func timeAgo(_ date: Date) -> String {
    let interval = Date().timeIntervalSince(date)
    if interval < 60 { return "now" }
    if interval < 3600 { return "\(Int(interval / 60))m" }
    if interval < 86400 { return "\(Int(interval / 3600))h" }
    if interval < 604_800 { return "\(Int(interval / 86400))d" }
    return date.formatted(.dateTime.month(.abbreviated).day())
  }
}

// MARK: - ═══════════════════════════════════════════════════

// NOTE EDITOR VIEW
// ═══════════════════════════════════════════════════════════

struct CosmicNoteEditorView: View {
  @Environment(\.dismiss) var dismiss
  @ObservedObject var manager: CosmicNotesManager
  let note: CosmicNote?

  @State private var title: String = ""
  @State private var body: String = ""
  @State private var noteType: CosmicNoteType = .note
  @State private var selectedLabels: Set<NoteLabel> = []
  @State private var noteColor: NoteColor = .neutral
  @State private var priority: Int? = nil
  @State private var checklistItems: [ChecklistItem] = []
  @State private var newChecklistText = ""
  @State private var showColorPicker = false
  @State private var showLabelPicker = false

  var isEditing: Bool {
    note != nil
  }

  var body: some View {
    NavigationStack {
      ZStack {
        noteColor.bgColor.ignoresSafeArea()

        ScrollView(showsIndicators: false) {
          VStack(spacing: 20) {
            // Type Selector
            typePicker

            // Title
            TextField("Title", text: $title)
              .font(.system(size: 20, weight: .bold))
              .foregroundColor(.white)
              .padding(.horizontal, 4)

            // Priority (for tasks)
            if noteType == .task {
              priorityPicker
            }

            // Body
            if noteType != .checklist {
              TextEditor(text: $body)
                .frame(minHeight: 150)
                .scrollContentBackground(.hidden)
                .font(.system(size: 14))
                .foregroundColor(.white.opacity(0.8))
                .padding(8)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.04)))
            }

            // Checklist
            if noteType == .checklist || !checklistItems.isEmpty {
              checklistEditor
            }

            // Color & Labels
            HStack(spacing: 12) {
              Button {
                showColorPicker.toggle()
              } label: {
                HStack(spacing: 6) {
                  Circle().fill(noteColor.accentColor).frame(width: 16, height: 16)
                  Text("Color").font(.system(size: 12, weight: .medium)).foregroundColor(
                    .white.opacity(0.5))
                }
                .padding(.horizontal, 12).padding(.vertical, 8)
                .background(Capsule().fill(Color.white.opacity(0.06)))
              }

              Button {
                showLabelPicker.toggle()
              } label: {
                HStack(spacing: 6) {
                  Image(systemName: "tag.fill").font(.system(size: 12))
                  Text("Labels (\(selectedLabels.count))").font(.system(size: 12, weight: .medium))
                }
                .foregroundColor(.white.opacity(0.5))
                .padding(.horizontal, 12).padding(.vertical, 8)
                .background(Capsule().fill(Color.white.opacity(0.06)))
              }
              Spacer()
            }

            // Color Picker
            if showColorPicker {
              colorPickerGrid
            }

            // Label Picker
            if showLabelPicker {
              labelPickerGrid
            }

            Spacer(minLength: 40)
          }
          .padding(.horizontal, 20)
          .padding(.top, 16)
        }
      }
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarLeading) {
          Button("Cancel") { dismiss() }
            .foregroundColor(.white.opacity(0.6))
        }
        ToolbarItem(placement: .principal) {
          Text(isEditing ? "Edit Note" : "New Note")
            .font(.system(size: 16, weight: .bold))
            .foregroundColor(.white)
        }
        ToolbarItem(placement: .navigationBarTrailing) {
          Button {
            saveNote()
          } label: {
            Text("Save")
              .font(.system(size: 15, weight: .bold))
              .foregroundColor(Color(red: 0.4, green: 0.7, blue: 1.0))
          }
        }
      }
      .onAppear {
        if let n = note {
          title = n.title
          body = n.body
          noteType = n.type
          selectedLabels = Set(n.labels)
          noteColor = n.color
          priority = n.priority
          checklistItems = n.checklistItems
        }
      }
    }
  }

  // MARK: - Type Picker

  private var typePicker: some View {
    HStack(spacing: 8) {
      ForEach(CosmicNoteType.allCases, id: \.self) { type in
        Button {
          noteType = type
        } label: {
          VStack(spacing: 4) {
            Image(systemName: type.icon)
              .font(.system(size: 16))
            Text(type.rawValue)
              .font(.system(size: 9, weight: .medium))
          }
          .foregroundColor(noteType == type ? .white : .white.opacity(0.3))
          .frame(maxWidth: .infinity)
          .padding(.vertical, 10)
          .background(
            RoundedRectangle(cornerRadius: 10)
              .fill(noteType == type ? type.color.opacity(0.2) : Color.white.opacity(0.03))
          )
        }
      }
    }
  }

  // MARK: - Priority Picker

  private var priorityPicker: some View {
    VStack(alignment: .leading, spacing: 8) {
      Text("Priority")
        .font(.system(size: 11, weight: .bold))
        .foregroundColor(.white.opacity(0.4))
      HStack(spacing: 8) {
        priorityButton(nil, "None", .gray)
        priorityButton(1, "P1", .red)
        priorityButton(2, "P2", .orange)
        priorityButton(3, "P3", .yellow)
        priorityButton(4, "P4", .green)
        priorityButton(5, "P5", .gray)
      }
    }
  }

  private func priorityButton(_ p: Int?, _ label: String, _ color: Color) -> some View {
    Button {
      priority = p
    } label: {
      Text(label)
        .font(.system(size: 11, weight: .bold))
        .foregroundColor(priority == p ? .white : .white.opacity(0.4))
        .padding(.horizontal, 12).padding(.vertical, 6)
        .background(
          Capsule().fill(priority == p ? color.opacity(0.3) : Color.white.opacity(0.04))
        )
    }
  }

  // MARK: - Checklist Editor

  private var checklistEditor: some View {
    VStack(alignment: .leading, spacing: 8) {
      Text("CHECKLIST")
        .font(.system(size: 9, weight: .bold))
        .tracking(1.5)
        .foregroundColor(.white.opacity(0.4))

      ForEach(Array(checklistItems.enumerated()), id: \.element.id) { index, item in
        HStack(spacing: 10) {
          Button {
            checklistItems[index].isCompleted.toggle()
          } label: {
            Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
              .foregroundColor(item.isCompleted ? .green : .white.opacity(0.3))
          }

          Text(item.text)
            .font(.system(size: 13))
            .foregroundColor(item.isCompleted ? .white.opacity(0.3) : .white.opacity(0.7))
            .strikethrough(item.isCompleted)

          Spacer()

          Button {
            checklistItems.remove(at: index)
          } label: {
            Image(systemName: "xmark").font(.system(size: 10)).foregroundColor(.white.opacity(0.2))
          }
        }
      }

      HStack(spacing: 10) {
        Image(systemName: "plus.circle")
          .foregroundColor(.white.opacity(0.3))
        TextField("Add item...", text: $newChecklistText)
          .font(.system(size: 13))
          .foregroundColor(.white)
          .onSubmit {
            let trimmed = newChecklistText.trimmingCharacters(in: .whitespaces)
            if !trimmed.isEmpty {
              checklistItems.append(ChecklistItem(text: trimmed))
              newChecklistText = ""
            }
          }
      }
    }
    .padding(12)
    .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.04)))
  }

  // MARK: - Color Picker Grid

  private var colorPickerGrid: some View {
    LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 4), spacing: 8) {
      ForEach(NoteColor.allCases, id: \.self) { color in
        Button {
          noteColor = color
        } label: {
          VStack(spacing: 4) {
            RoundedRectangle(cornerRadius: 8)
              .fill(color.bgColor)
              .frame(height: 36)
              .overlay(
                RoundedRectangle(cornerRadius: 8)
                  .stroke(noteColor == color ? color.accentColor : Color.clear, lineWidth: 2)
              )
            Text(color.rawValue)
              .font(.system(size: 9, weight: .medium))
              .foregroundColor(.white.opacity(0.4))
          }
        }
      }
    }
    .padding(12)
    .background(RoundedRectangle(cornerRadius: 12).fill(Color.white.opacity(0.04)))
  }

  // MARK: - Label Picker Grid

  private var labelPickerGrid: some View {
    LazyVGrid(
      columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 8
    ) {
      ForEach(NoteLabel.allCases, id: \.self) { label in
        Button {
          if selectedLabels.contains(label) {
            selectedLabels.remove(label)
          } else {
            selectedLabels.insert(label)
          }
        } label: {
          HStack(spacing: 4) {
            Image(systemName: label.icon).font(.system(size: 10))
            Text(label.rawValue).font(.system(size: 10, weight: .medium))
          }
          .foregroundColor(selectedLabels.contains(label) ? .white : .white.opacity(0.4))
          .frame(maxWidth: .infinity)
          .padding(.vertical, 8)
          .background(
            RoundedRectangle(cornerRadius: 8)
              .fill(
                selectedLabels.contains(label)
                  ? label.color.opacity(0.25) : Color.white.opacity(0.04))
          )
        }
      }
    }
    .padding(12)
    .background(RoundedRectangle(cornerRadius: 12).fill(Color.white.opacity(0.04)))
  }

  // MARK: - Save

  private func saveNote() {
    if isEditing, var existing = note {
      existing.title = title
      existing.body = body
      existing.type = noteType
      existing.labels = Array(selectedLabels)
      existing.color = noteColor
      existing.priority = priority
      existing.checklistItems = checklistItems
      manager.update(existing)
    } else {
      let newNote = CosmicNote(
        title: title, body: body, type: noteType,
        labels: Array(selectedLabels), color: noteColor,
        priority: priority, checklistItems: checklistItems
      )
      manager.create(newNote)
    }
    dismiss()
  }
}

// MARK: - ═══════════════════════════════════════════════════

// QUICK CAPTURE SHEET (Accessible from anywhere)
// ═══════════════════════════════════════════════════════════

struct QuickCaptureSheet: View {
  @Environment(\.dismiss) var dismiss
  @ObservedObject var manager: CosmicNotesManager
  @State private var input = ""
  @State private var selectedType: CosmicNoteType = .note
  @State private var selectedLabel: NoteLabel? = nil

  var body: some View {
    NavigationStack {
      ZStack {
        Color(red: 0.06, green: 0.04, blue: 0.12).ignoresSafeArea()

        VStack(spacing: 20) {
          // Type toggle
          HStack(spacing: 12) {
            quickTypeButton(.note, "Note")
            quickTypeButton(.task, "Task")
            quickTypeButton(.insight, "Insight")
          }

          // Input
          TextField("What's on your mind?", text: $input, axis: .vertical)
            .font(.system(size: 16))
            .foregroundColor(.white)
            .lineLimit(1...6)
            .padding(14)
            .background(RoundedRectangle(cornerRadius: 12).fill(Color.white.opacity(0.06)))

          // Quick labels
          ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
              ForEach(NoteLabel.allCases, id: \.self) { label in
                Button {
                  selectedLabel = selectedLabel == label ? nil : label
                } label: {
                  HStack(spacing: 3) {
                    Image(systemName: label.icon).font(.system(size: 9))
                    Text(label.rawValue).font(.system(size: 10, weight: .medium))
                  }
                  .foregroundColor(selectedLabel == label ? .white : .white.opacity(0.4))
                  .padding(.horizontal, 8).padding(.vertical, 5)
                  .background(
                    Capsule().fill(
                      selectedLabel == label ? label.color.opacity(0.3) : Color.white.opacity(0.04))
                  )
                }
              }
            }
          }

          // Save
          Button {
            let trimmed = input.trimmingCharacters(in: .whitespaces)
            guard !trimmed.isEmpty else { return }
            var labels: [NoteLabel] = []
            if let l = selectedLabel { labels.append(l) }
            manager.quickCapture(title: trimmed, type: selectedType, labels: labels)
            dismiss()
          } label: {
            Text("Capture")
              .font(.system(size: 15, weight: .bold))
              .foregroundColor(.black)
              .frame(maxWidth: .infinity)
              .padding(.vertical, 12)
              .background(Capsule().fill(Color(red: 0.4, green: 0.7, blue: 1.0)))
          }

          Spacer()
        }
        .padding(20)
      }
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .principal) {
          Text("Quick Capture").font(.system(size: 16, weight: .bold)).foregroundColor(.white)
        }
        ToolbarItem(placement: .navigationBarTrailing) {
          Button {
            dismiss()
          } label: {
            Image(systemName: "xmark.circle.fill").foregroundColor(.white.opacity(0.3))
          }
        }
      }
    }
    .presentationDetents([.medium])
  }

  private func quickTypeButton(_ type: CosmicNoteType, _ label: String) -> some View {
    Button {
      selectedType = type
    } label: {
      HStack(spacing: 4) {
        Image(systemName: type.icon).font(.system(size: 12))
        Text(label).font(.system(size: 12, weight: .medium))
      }
      .foregroundColor(selectedType == type ? .white : .white.opacity(0.4))
      .frame(maxWidth: .infinity)
      .padding(.vertical, 10)
      .background(
        RoundedRectangle(cornerRadius: 10)
          .fill(selectedType == type ? type.color.opacity(0.2) : Color.white.opacity(0.04))
      )
    }
  }
}

// MARK: - ═══════════════════════════════════════════════════

// FLOATING CAPTURE BUTTON (Overlay for any view)
// ═══════════════════════════════════════════════════════════

struct CosmicNotesFloatingButton: View {
  @State private var showQuickCapture = false
  @State private var showFullNotes = false

  var body: some View {
    VStack {
      Spacer()
      HStack {
        Spacer()
        Menu {
          Button {
            showQuickCapture = true
          } label: {
            Label("Quick Capture", systemImage: "bolt.fill")
          }
          Button {
            showFullNotes = true
          } label: {
            Label("Open Notes", systemImage: "doc.text.fill")
          }
        } label: {
          Image(systemName: "note.text.badge.plus")
            .font(.system(size: 18, weight: .semibold))
            .foregroundColor(.white)
            .frame(width: 48, height: 48)
            .background(Circle().fill(Color(red: 0.4, green: 0.7, blue: 1.0)))
            .shadow(color: Color(red: 0.4, green: 0.7, blue: 1.0).opacity(0.4), radius: 8, y: 4)
        }
        .padding(.trailing, 20)
        .padding(.bottom, 90)
      }
    }
    .sheet(isPresented: $showQuickCapture) {
      QuickCaptureSheet(manager: CosmicNotesManager.shared)
    }
    .fullScreenCover(isPresented: $showFullNotes) {
      CosmicNotesView()
    }
  }
}
