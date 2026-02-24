// BrainDumpView.swift
// BRAIN DUMP — "Get It Out of Your Head"
// ☀️ SunFlow: Reignited × Second Brain
//
// "ADHD working memory: 3 slots.
//  Life's demands: 3,000.
//  This is your overflow buffer.
//  Dump everything. Sort later. Breathe now."
//
// One-tap capture. Auto-categorize with on-device NLP.
// SwiftData persistence. Zero backend.

import SwiftUI
import NaturalLanguage

// MARK: - ═══════════════════════════════════════════════════
// BRAIN DUMP VIEW
// ═══════════════════════════════════════════════════════════

struct BrainDumpView: View {
    
    @Environment(\.dismiss) var dismiss
    @StateObject private var store = BrainDumpStore()
    @State private var newThought = ""
    @State private var selectedFilter: DumpFilter = .all
    @FocusState private var isInputFocused: Bool
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 0.02, green: 0.03, blue: 0.06).ignoresSafeArea()
                
                VStack(spacing: 0) {
                    // Scrollable dump list
                    ScrollView(showsIndicators: false) {
                        VStack(spacing: 12) {
                            headerView
                            statsBar
                            filterBar
                            dumpList
                            Spacer(minLength: 100)
                        }
                        .padding(.horizontal, 20)
                    }
                    
                    // Always-visible input bar at bottom
                    inputBar
                }
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button { dismiss() } label: {
                        Image(systemName: "chevron.left").font(.system(size: 16, weight: .semibold)).foregroundColor(.white)
                    }
                }
                ToolbarItem(placement: .principal) {
                    HStack(spacing: 6) {
                        Image(systemName: "brain.head.profile").font(.system(size: 14)).foregroundColor(.purple)
                        Text("Brain Dump").font(.system(size: 17, weight: .bold)).foregroundColor(.white)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu {
                        Button("Clear Completed") { store.clearCompleted() }
                        Button("Export All to Text") { _ = store.exportAll() }
                        Button(role: .destructive) { store.clearAll() } label: { Text("Clear ALL") }
                    } label: {
                        Image(systemName: "ellipsis.circle").font(.system(size: 18)).foregroundColor(.white.opacity(0.3))
                    }
                }
            }
        }
    }
    
    // MARK: - Header
    
    private var headerView: some View {
        VStack(spacing: 6) {
            Text("🧠").font(.system(size: 40))
            Text("BRAIN DUMP").font(.system(size: 18, weight: .black)).tracking(1).foregroundColor(.white)
            Text("Get it out of your head. ALL of it.\nDon't organize. Don't prioritize. Just dump.")
                .font(.system(size: 11, weight: .medium)).foregroundColor(.white.opacity(0.3)).multilineTextAlignment(.center)
        }.padding(.top, 8)
    }
    
    // MARK: - Stats Bar
    
    private var statsBar: some View {
        HStack(spacing: 12) {
            statBadge("\(store.items.count)", "Total", .purple)
            statBadge("\(store.items.filter { !$0.isCompleted }.count)", "Active", .cyan)
            statBadge("\(store.items.filter { $0.isCompleted }.count)", "Done", .green)
            statBadge("\(store.items.filter { $0.priority == .urgent }.count)", "Urgent", .red)
        }
    }
    
    private func statBadge(_ value: String, _ label: String, _ color: Color) -> some View {
        VStack(spacing: 2) {
            Text(value).font(.system(size: 16, weight: .black)).foregroundColor(color)
            Text(label).font(.system(size: 8, weight: .bold)).tracking(0.5).foregroundColor(.white.opacity(0.2))
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 8)
        .background(RoundedRectangle(cornerRadius: 8).fill(color.opacity(0.03)))
    }
    
    // MARK: - Filter Bar
    
    private var filterBar: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 6) {
                ForEach(DumpFilter.allCases, id: \.self) { filter in
                    Button {
                        withAnimation(.easeInOut(duration: 0.15)) { selectedFilter = filter }
                    } label: {
                        Text(filter.label).font(.system(size: 9, weight: .bold))
                            .foregroundColor(selectedFilter == filter ? .black : .white.opacity(0.35))
                            .padding(.horizontal, 10).padding(.vertical, 5)
                            .background(Capsule().fill(selectedFilter == filter ? Color.purple.opacity(0.7) : Color.white.opacity(0.03)))
                    }
                }
            }
        }
    }
    
    // MARK: - Dump List
    
    private var dumpList: some View {
        let filtered = filteredItems
        return VStack(spacing: 6) {
            if filtered.isEmpty {
                VStack(spacing: 8) {
                    Text(selectedFilter == .all ? "Your brain is clear! 🧘" : "Nothing in this category")
                        .font(.system(size: 13, weight: .medium)).foregroundColor(.white.opacity(0.2))
                    Text("Type below to dump a thought").font(.system(size: 10)).foregroundColor(.white.opacity(0.12))
                }.padding(40)
            } else {
                ForEach(filtered) { item in
                    dumpItemCard(item)
                }
            }
        }
    }
    
    private var filteredItems: [BrainDumpItem] {
        switch selectedFilter {
        case .all: return store.items.filter { !$0.isCompleted }
        case .completed: return store.items.filter { $0.isCompleted }
        case .tasks: return store.items.filter { $0.category == .task && !$0.isCompleted }
        case .ideas: return store.items.filter { $0.category == .idea && !$0.isCompleted }
        case .worries: return store.items.filter { $0.category == .worry && !$0.isCompleted }
        case .urgent: return store.items.filter { $0.priority == .urgent && !$0.isCompleted }
        case .random: return store.items.filter { $0.category == .random && !$0.isCompleted }
        }
    }
    
    // MARK: - Dump Item Card
    
    private func dumpItemCard(_ item: BrainDumpItem) -> some View {
        HStack(spacing: 10) {
            // Complete button
            Button {
                withAnimation(.easeInOut(duration: 0.2)) { store.toggleComplete(id: item.id) }
            } label: {
                Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
                    .font(.system(size: 18)).foregroundColor(item.isCompleted ? .green : .white.opacity(0.15))
            }
            
            VStack(alignment: .leading, spacing: 3) {
                Text(item.text)
                    .font(.system(size: 13, weight: .medium))
                    .foregroundColor(item.isCompleted ? .white.opacity(0.2) : .white)
                    .strikethrough(item.isCompleted)
                
                HStack(spacing: 6) {
                    // Category tag
                    Text(item.category.emoji + " " + item.category.label)
                        .font(.system(size: 8, weight: .bold))
                        .foregroundColor(item.category.color.opacity(0.6))
                        .padding(.horizontal, 6).padding(.vertical, 2)
                        .background(Capsule().fill(item.category.color.opacity(0.06)))
                    
                    // Priority
                    if item.priority == .urgent {
                        Text("🔴 URGENT").font(.system(size: 8, weight: .black))
                            .foregroundColor(.red.opacity(0.6))
                    }
                    
                    // Time
                    Text(item.timeAgo).font(.system(size: 8, weight: .medium)).foregroundColor(.white.opacity(0.1))
                }
            }
            
            Spacer()
            
            // Priority toggle
            Button {
                store.togglePriority(id: item.id)
            } label: {
                Image(systemName: item.priority == .urgent ? "flag.fill" : "flag")
                    .font(.system(size: 12))
                    .foregroundColor(item.priority == .urgent ? .red : .white.opacity(0.1))
            }
        }
        .padding(10)
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(item.isCompleted ? 0.005 : 0.02))
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(item.category.color.opacity(0.04), lineWidth: 1)))
    }
    
    // MARK: - Input Bar
    
    private var inputBar: some View {
        HStack(spacing: 10) {
            TextField("Dump a thought...", text: $newThought)
                .font(.system(size: 14, weight: .medium)).foregroundColor(.white)
                .focused($isInputFocused)
                .onSubmit { addThought() }
            
            if !newThought.isEmpty {
                Button { addThought() } label: {
                    Image(systemName: "arrow.up.circle.fill")
                        .font(.system(size: 28)).foregroundColor(.purple)
                }
            }
        }
        .padding(.horizontal, 16).padding(.vertical, 12)
        .background(
            Rectangle().fill(Color(red: 0.04, green: 0.04, blue: 0.08))
                .overlay(Rectangle().frame(height: 1).foregroundColor(.white.opacity(0.03)), alignment: .top)
        )
    }
    
    private func addThought() {
        guard !newThought.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { return }
        store.add(text: newThought)
        newThought = ""
    }
}

// MARK: - ═══════════════════════════════════════════════════
// BRAIN DUMP STORE — UserDefaults Persistence
// ═══════════════════════════════════════════════════════════

class BrainDumpStore: ObservableObject {
    
    @Published var items: [BrainDumpItem] = []
    
    private let storageKey = "aperture_brain_dump"
    
    init() { load() }
    
    func add(text: String) {
        let category = DumpCategorizer.categorize(text)
        let priority = DumpCategorizer.detectUrgency(text) ? DumpPriority.urgent : .normal
        
        let item = BrainDumpItem(
            id: UUID().uuidString,
            text: text.trimmingCharacters(in: .whitespacesAndNewlines),
            category: category,
            priority: priority,
            timestamp: Date(),
            isCompleted: false
        )
        items.insert(item, at: 0)
        save()
    }
    
    func toggleComplete(id: String) {
        guard let i = items.firstIndex(where: { $0.id == id }) else { return }
        items[i].isCompleted.toggle()
        save()
    }
    
    func togglePriority(id: String) {
        guard let i = items.firstIndex(where: { $0.id == id }) else { return }
        items[i].priority = items[i].priority == .urgent ? .normal : .urgent
        save()
    }
    
    func clearCompleted() { items.removeAll { $0.isCompleted }; save() }
    func clearAll() { items.removeAll(); save() }
    
    func exportAll() -> String {
        items.map { "[\($0.category.label)] \($0.text)\($0.priority == .urgent ? " ⚠️" : "")" }.joined(separator: "\n")
    }
    
    private func save() {
        if let data = try? JSONEncoder().encode(items) { UserDefaults.standard.set(data, forKey: storageKey) }
    }
    
    private func load() {
        if let data = UserDefaults.standard.data(forKey: storageKey),
           let saved = try? JSONDecoder().decode([BrainDumpItem].self, from: data) { items = saved }
    }
}

// MARK: - ═══════════════════════════════════════════════════
// ON-DEVICE AUTO-CATEGORIZER (NLP)
// ═══════════════════════════════════════════════════════════

struct DumpCategorizer {
    
    static func categorize(_ text: String) -> DumpCategory {
        let lowered = text.lowercased()
        
        // Task indicators
        if matchesAny(lowered, ["need to", "have to", "should", "must", "don't forget", "remember to",
                                 "buy", "call", "email", "send", "pick up", "schedule", "book", "pay",
                                 "submit", "finish", "complete", "do the", "clean", "fix", "return"]) {
            return .task
        }
        
        // Worry / anxiety indicators
        if matchesAny(lowered, ["worried", "anxious", "scared", "what if", "afraid", "nervous",
                                 "can't stop thinking", "obsessing", "dread", "stressed", "overwhelmed",
                                 "panic", "fear", "might happen", "going wrong"]) {
            return .worry
        }
        
        // Idea indicators
        if matchesAny(lowered, ["idea", "what about", "maybe i could", "imagine", "wouldn't it be",
                                 "concept", "thought about", "inspiration", "create", "build", "design",
                                 "i wonder", "project", "invent", "brainstorm"]) {
            return .idea
        }
        
        // Feeling / emotional
        if matchesAny(lowered, ["feel", "feeling", "sad", "happy", "angry", "frustrated", "grateful",
                                 "lonely", "tired", "exhausted", "excited", "hopeful", "numb", "hurt"]) {
            return .feeling
        }
        
        // Memory / note
        if matchesAny(lowered, ["remember when", "note to self", "don't want to forget", "important",
                                 "password", "number", "address", "name"]) {
            return .note
        }
        
        return .random
    }
    
    static func detectUrgency(_ text: String) -> Bool {
        let lowered = text.lowercased()
        return matchesAny(lowered, ["urgent", "asap", "right now", "today", "deadline", "overdue",
                                     "emergency", "immediately", "can't wait", "due tomorrow", "critical"])
    }
    
    private static func matchesAny(_ text: String, _ keywords: [String]) -> Bool {
        keywords.contains { text.contains($0) }
    }
}

// MARK: - ═══════════════════════════════════════════════════
// DATA MODELS
// ═══════════════════════════════════════════════════════════

struct BrainDumpItem: Identifiable, Codable {
    let id: String
    let text: String
    var category: DumpCategory
    var priority: DumpPriority
    let timestamp: Date
    var isCompleted: Bool
    
    var timeAgo: String {
        let interval = Date().timeIntervalSince(timestamp)
        if interval < 60 { return "just now" }
        if interval < 3600 { return "\(Int(interval/60))m ago" }
        if interval < 86400 { return "\(Int(interval/3600))h ago" }
        return "\(Int(interval/86400))d ago"
    }
}

enum DumpCategory: String, Codable {
    case task, worry, idea, feeling, note, random
    
    var label: String {
        switch self { case .task: return "Task"; case .worry: return "Worry"; case .idea: return "Idea"
        case .feeling: return "Feeling"; case .note: return "Note"; case .random: return "Thought" }
    }
    var emoji: String {
        switch self { case .task: return "📋"; case .worry: return "😰"; case .idea: return "💡"
        case .feeling: return "💚"; case .note: return "📝"; case .random: return "💭" }
    }
    var color: Color {
        switch self { case .task: return .cyan; case .worry: return .red; case .idea: return .yellow
        case .feeling: return .green; case .note: return .orange; case .random: return .purple }
    }
}

enum DumpPriority: String, Codable { case normal, urgent }

enum DumpFilter: String, CaseIterable {
    case all, tasks, worries, ideas, urgent, random, completed
    var label: String {
        switch self { case .all: return "All"; case .tasks: return "📋 Tasks"; case .worries: return "😰 Worries"
        case .ideas: return "💡 Ideas"; case .urgent: return "🔴 Urgent"; case .random: return "💭 Thoughts"
        case .completed: return "✅ Done" }
    }
}
