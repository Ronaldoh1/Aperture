// DiveDeeperModels.swift
// Iceberg-style deep topic exploration. Not vibes. Open-minded curiosity.
// Interrogate beyond the surface level — more than meets the eye 👀
// ☀️ SunFlow: Reignited

import SwiftUI

// MARK: - ═══════════════════════════════════════════════════
// ICEBERG — A deep topic with layers to explore
// ═══════════════════════════════════════════════════════════

struct Iceberg: Identifiable {
    let id: String
    let title: String
    let subtitle: String
    let emoji: String
    let headerGradient: [Color]
    let layers: [IcebergLayer]
    let sourceNotes: String         // Credits, texts referenced
    let contentWarning: String?     // Optional: some topics go DEEP
    
    var totalReadingMinutes: Int {
        layers.reduce(0) { $0 + $1.readingMinutes }
    }
    
    func layerProgress(unlockedCount: Int) -> Double {
        guard !layers.isEmpty else { return 0 }
        return Double(unlockedCount) / Double(layers.count)
    }
}

// MARK: - ═══════════════════════════════════════════════════
// ICEBERG LAYER — One depth level
// ═══════════════════════════════════════════════════════════

struct IcebergLayer: Identifiable {
    let id: String
    let depth: Int                  // 0 = surface, higher = deeper
    let title: String
    let tagline: String             // One-liner hook
    let sections: [IcebergSection]
    let readingMinutes: Int
    let depthLabel: String          // "Surface", "Below the waterline", "The Abyss"
    
    var depthColor: Color {
        switch depth {
        case 0: return Color(red: 0.6, green: 0.85, blue: 1.0)       // Light blue sky
        case 1: return Color(red: 0.3, green: 0.7, blue: 0.9)        // Water surface
        case 2: return Color(red: 0.15, green: 0.5, blue: 0.8)       // Shallow
        case 3: return Color(red: 0.1, green: 0.35, blue: 0.65)      // Mid-depth
        case 4: return Color(red: 0.05, green: 0.25, blue: 0.5)      // Deep
        case 5: return Color(red: 0.03, green: 0.15, blue: 0.4)      // Deeper
        case 6: return Color(red: 0.02, green: 0.1, blue: 0.3)       // Abyss
        case 7: return Color(red: 0.01, green: 0.06, blue: 0.2)      // The bottom
        default: return Color(red: 0.0, green: 0.03, blue: 0.12)     // Void
        }
    }
}

struct IcebergSection: Identifiable {
    let id: String
    let heading: String?
    let body: String
    
    init(heading: String? = nil, body: String) {
        self.id = UUID().uuidString
        self.heading = heading
        self.body = body
    }
}

// MARK: - ═══════════════════════════════════════════════════
// DIVE DEEPER PROGRESS — Track what they've explored
// ═══════════════════════════════════════════════════════════

@MainActor
final class DiveDeeperManager: ObservableObject {
    
    static let shared = DiveDeeperManager()
    
    @Published var unlockedLayers: [String: Set<Int>] = [:]  // icebergId -> set of unlocked depths
    @Published var completedLayers: [String: Set<Int>] = [:] // icebergId -> set of read depths
    @Published var bookmarks: [String] = []                   // section IDs bookmarked
    
    private let defaults = UserDefaults.standard
    
    private init() { loadState() }
    
    func unlockLayer(icebergId: String, depth: Int) {
        if unlockedLayers[icebergId] == nil { unlockedLayers[icebergId] = [] }
        unlockedLayers[icebergId]?.insert(depth)
        saveState()
    }
    
    func completeLayer(icebergId: String, depth: Int) {
        if completedLayers[icebergId] == nil { completedLayers[icebergId] = [] }
        completedLayers[icebergId]?.insert(depth)
        // Auto-unlock next layer
        unlockLayer(icebergId: icebergId, depth: depth + 1)
        saveState()
    }
    
    func isLayerUnlocked(icebergId: String, depth: Int) -> Bool {
        if depth == 0 { return true } // Surface always unlocked
        return unlockedLayers[icebergId]?.contains(depth) ?? false
    }
    
    func isLayerComplete(icebergId: String, depth: Int) -> Bool {
        return completedLayers[icebergId]?.contains(depth) ?? false
    }
    
    func completedCount(for icebergId: String) -> Int {
        return completedLayers[icebergId]?.count ?? 0
    }
    
    func toggleBookmark(_ sectionId: String) {
        if bookmarks.contains(sectionId) {
            bookmarks.removeAll { $0 == sectionId }
        } else {
            bookmarks.append(sectionId)
        }
        saveState()
    }
    
    private func saveState() {
        // Convert sets to arrays for JSON
        let unlocked = unlockedLayers.mapValues { Array($0) }
        let completed = completedLayers.mapValues { Array($0) }
        if let data = try? JSONEncoder().encode(unlocked) { defaults.set(data, forKey: "dd_unlocked") }
        if let data = try? JSONEncoder().encode(completed) { defaults.set(data, forKey: "dd_completed") }
        if let data = try? JSONEncoder().encode(bookmarks) { defaults.set(data, forKey: "dd_bookmarks") }
    }
    
    private func loadState() {
        if let data = defaults.data(forKey: "dd_unlocked"),
           let decoded = try? JSONDecoder().decode([String: [Int]].self, from: data) {
            unlockedLayers = decoded.mapValues { Set($0) }
        }
        if let data = defaults.data(forKey: "dd_completed"),
           let decoded = try? JSONDecoder().decode([String: [Int]].self, from: data) {
            completedLayers = decoded.mapValues { Set($0) }
        }
        if let data = defaults.data(forKey: "dd_bookmarks"),
           let decoded = try? JSONDecoder().decode([String].self, from: data) {
            bookmarks = decoded
        }
    }
}

// MARK: - ═══════════════════════════════════════════════════
// ICEBERG CATALOG — All available deep dives
// ═══════════════════════════════════════════════════════════

struct IcebergCatalog {
    
    static let allIcebergs: [Iceberg] = [
        GnosticismIceberg.iceberg,
        // Future icebergs:
        // ConsciousnessIceberg.iceberg,
        // MoneySystemIceberg.iceberg,
        // MediaManipulationIceberg.iceberg,
        // SimulationTheoryIceberg.iceberg,
    ]
    
    static let comingSoon: [(String, String, String)] = [
        ("🧠", "Consciousness", "What is awareness? Who's watching?"),
        ("💰", "The Money System", "Who prints it? Who controls it? Who profits?"),
        ("📺", "Media Manipulation", "Manufacturing consent in the attention economy"),
        ("🌐", "Simulation Theory", "From Plato's Cave to quantum physics"),
        ("⚗️", "Alchemy & Hermeticism", "As above, so below — the original science"),
        ("🏛️", "Mystery Schools", "What the ancients knew that was hidden"),
    ]
}
