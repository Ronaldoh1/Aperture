// PodcastInteractor.swift
// VIPER Interactor for Awakening Podcasts
// Track listening progress, favorites, and recommendations

import Foundation

// MARK: - Storage Protocol (Abstracted for Firebase/API swap)

protocol PodcastStorageProtocol {
    func saveFavorite(podcastId: UUID) async throws
    func removeFavorite(podcastId: UUID) async throws
    func getFavorites() async throws -> [UUID]
    
    func logListen(podcastId: UUID, episodeTitle: String, minutesListened: Int) async throws
    func getListeningHistory() async throws -> [PodcastListenLog]
    func getTotalMinutesListened() async throws -> Int
    
    func saveNote(podcastId: UUID, episodeTitle: String, note: String) async throws
    func getNotes(for podcastId: UUID) async throws -> [PodcastNote]
    func getAllNotes() async throws -> [PodcastNote]
    
    func getRecommendations(basedOn favorites: [UUID]) async throws -> [UUID]
}

// MARK: - Models

struct PodcastListenLog: Identifiable, Codable {
    let id: UUID
    let podcastId: UUID
    let podcastName: String
    let episodeTitle: String
    let minutesListened: Int
    let listenedAt: Date
    
    init(podcastId: UUID, podcastName: String, episodeTitle: String, minutesListened: Int) {
        self.id = UUID()
        self.podcastId = podcastId
        self.podcastName = podcastName
        self.episodeTitle = episodeTitle
        self.minutesListened = minutesListened
        self.listenedAt = Date()
    }
}

struct PodcastNote: Identifiable, Codable {
    let id: UUID
    let podcastId: UUID
    let podcastName: String
    let episodeTitle: String
    let note: String
    let createdAt: Date
    
    init(podcastId: UUID, podcastName: String, episodeTitle: String, note: String) {
        self.id = UUID()
        self.podcastId = podcastId
        self.podcastName = podcastName
        self.episodeTitle = episodeTitle
        self.note = note
        self.createdAt = Date()
    }
}

struct PodcastStats: Codable {
    var totalMinutesListened: Int
    var podcastsExplored: Int
    var notesTaken: Int
    var currentStreak: Int
    var longestStreak: Int
    var lastListenDate: Date?
    
    static var empty: PodcastStats {
        PodcastStats(
            totalMinutesListened: 0,
            podcastsExplored: 0,
            notesTaken: 0,
            currentStreak: 0,
            longestStreak: 0,
            lastListenDate: nil
        )
    }
}

// MARK: - Firebase Implementation

class FirebasePodcastStorage: PodcastStorageProtocol {
    
    // UserDefaults keys (Firebase-ready but using local storage)
    private let favoritesKey = "podcast_favorites"
    private let historyKey = "podcast_history"
    private let notesKey = "podcast_notes"
    private let statsKey = "podcast_stats"
    
    func saveFavorite(podcastId: UUID) async throws {
        var favorites = try await getFavorites()
        if !favorites.contains(podcastId) {
            favorites.append(podcastId)
            let strings = favorites.map { $0.uuidString }
            UserDefaults.standard.set(strings, forKey: favoritesKey)
        }
    }
    
    func removeFavorite(podcastId: UUID) async throws {
        var favorites = try await getFavorites()
        favorites.removeAll { $0 == podcastId }
        let strings = favorites.map { $0.uuidString }
        UserDefaults.standard.set(strings, forKey: favoritesKey)
    }
    
    func getFavorites() async throws -> [UUID] {
        guard let strings = UserDefaults.standard.array(forKey: favoritesKey) as? [String] else {
            return []
        }
        return strings.compactMap { UUID(uuidString: $0) }
    }
    
    func logListen(podcastId: UUID, episodeTitle: String, minutesListened: Int) async throws {
        // Get podcast name from library
        let podcastName = PodcastLibrary.allPodcasts.first { $0.id == podcastId }?.name ?? "Unknown"
        
        let log = PodcastListenLog(
            podcastId: podcastId,
            podcastName: podcastName,
            episodeTitle: episodeTitle,
            minutesListened: minutesListened
        )
        
        var history = try await getListeningHistory()
        history.append(log)
        
        if let data = try? JSONEncoder().encode(history) {
            UserDefaults.standard.set(data, forKey: historyKey)
        }
        
        // Update stats
        await updateStats(minutesAdded: minutesListened, podcastId: podcastId)
    }
    
    func getListeningHistory() async throws -> [PodcastListenLog] {
        guard let data = UserDefaults.standard.data(forKey: historyKey),
              let history = try? JSONDecoder().decode([PodcastListenLog].self, from: data) else {
            return []
        }
        return history.sorted { $0.listenedAt > $1.listenedAt }
    }
    
    func getTotalMinutesListened() async throws -> Int {
        let history = try await getListeningHistory()
        return history.reduce(0) { $0 + $1.minutesListened }
    }
    
    func saveNote(podcastId: UUID, episodeTitle: String, note: String) async throws {
        let podcastName = PodcastLibrary.allPodcasts.first { $0.id == podcastId }?.name ?? "Unknown"
        
        let podcastNote = PodcastNote(
            podcastId: podcastId,
            podcastName: podcastName,
            episodeTitle: episodeTitle,
            note: note
        )
        
        var notes = try await getAllNotes()
        notes.append(podcastNote)
        
        if let data = try? JSONEncoder().encode(notes) {
            UserDefaults.standard.set(data, forKey: notesKey)
        }
    }
    
    func getNotes(for podcastId: UUID) async throws -> [PodcastNote] {
        let allNotes = try await getAllNotes()
        return allNotes.filter { $0.podcastId == podcastId }
    }
    
    func getAllNotes() async throws -> [PodcastNote] {
        guard let data = UserDefaults.standard.data(forKey: notesKey),
              let notes = try? JSONDecoder().decode([PodcastNote].self, from: data) else {
            return []
        }
        return notes.sorted { $0.createdAt > $1.createdAt }
    }
    
    func getRecommendations(basedOn favorites: [UUID]) async throws -> [UUID] {
        // Simple recommendation: same categories as favorites
        let favoriteCategories = Set(favorites.compactMap { favId in
            PodcastLibrary.allPodcasts.first { $0.id == favId }?.category
        })
        
        let recommendations = PodcastLibrary.allPodcasts
            .filter { favoriteCategories.contains($0.category) && !favorites.contains($0.id) }
            .prefix(5)
            .map { $0.id }
        
        return Array(recommendations)
    }
    
    // MARK: - Stats Helpers
    
    private func updateStats(minutesAdded: Int, podcastId: UUID) async {
        var stats = getStats()
        stats.totalMinutesListened += minutesAdded
        
        // Track unique podcasts
        let history = (try? await getListeningHistory()) ?? []
        stats.podcastsExplored = Set(history.map { $0.podcastId }).count
        
        // Track notes
        let notes = (try? await getAllNotes()) ?? []
        stats.notesTaken = notes.count
        
        // Calculate streak
        let today = Calendar.current.startOfDay(for: Date())
        if let lastDate = stats.lastListenDate {
            let lastDay = Calendar.current.startOfDay(for: lastDate)
            let daysDiff = Calendar.current.dateComponents([.day], from: lastDay, to: today).day ?? 0
            
            if daysDiff == 1 {
                stats.currentStreak += 1
            } else if daysDiff > 1 {
                stats.currentStreak = 1
            }
            // Same day = no change to streak
        } else {
            stats.currentStreak = 1
        }
        
        if stats.currentStreak > stats.longestStreak {
            stats.longestStreak = stats.currentStreak
        }
        
        stats.lastListenDate = Date()
        
        if let data = try? JSONEncoder().encode(stats) {
            UserDefaults.standard.set(data, forKey: statsKey)
        }
    }
    
    func getStats() -> PodcastStats {
        guard let data = UserDefaults.standard.data(forKey: statsKey),
              let stats = try? JSONDecoder().decode(PodcastStats.self, from: data) else {
            return .empty
        }
        return stats
    }
}

// MARK: - API Implementation (Alternative Backend)

class APIPodcastStorage: PodcastStorageProtocol {
    private let baseURL: String
    private let apiKey: String
    
    init(baseURL: String, apiKey: String) {
        self.baseURL = baseURL
        self.apiKey = apiKey
    }
    
    func saveFavorite(podcastId: UUID) async throws {
        // POST /api/podcasts/favorites
    }
    
    func removeFavorite(podcastId: UUID) async throws {
        // DELETE /api/podcasts/favorites/{id}
    }
    
    func getFavorites() async throws -> [UUID] {
        // GET /api/podcasts/favorites
        return []
    }
    
    func logListen(podcastId: UUID, episodeTitle: String, minutesListened: Int) async throws {
        // POST /api/podcasts/history
    }
    
    func getListeningHistory() async throws -> [PodcastListenLog] {
        // GET /api/podcasts/history
        return []
    }
    
    func getTotalMinutesListened() async throws -> Int {
        // GET /api/podcasts/stats/minutes
        return 0
    }
    
    func saveNote(podcastId: UUID, episodeTitle: String, note: String) async throws {
        // POST /api/podcasts/notes
    }
    
    func getNotes(for podcastId: UUID) async throws -> [PodcastNote] {
        // GET /api/podcasts/notes?podcastId={id}
        return []
    }
    
    func getAllNotes() async throws -> [PodcastNote] {
        // GET /api/podcasts/notes
        return []
    }
    
    func getRecommendations(basedOn favorites: [UUID]) async throws -> [UUID] {
        // POST /api/podcasts/recommendations
        return []
    }
}

// MARK: - Interactor

class PodcastInteractor: ObservableObject {
    
    private var storage: PodcastStorageProtocol
    
    @Published var favorites: [UUID] = []
    @Published var recentHistory: [PodcastListenLog] = []
    @Published var stats: PodcastStats = .empty
    @Published var notes: [PodcastNote] = []
    @Published var recommendations: [AwakeningPodcast] = []
    
    init(storage: PodcastStorageProtocol = FirebasePodcastStorage()) {
        self.storage = storage
    }
    
    // MARK: - Backend Switching
    
    func switchToFirebase() {
        self.storage = FirebasePodcastStorage()
    }
    
    func switchToAPI(baseURL: String, apiKey: String) {
        self.storage = APIPodcastStorage(baseURL: baseURL, apiKey: apiKey)
    }
    
    // MARK: - Load Data
    
    func loadData() async {
        do {
            favorites = try await storage.getFavorites()
            recentHistory = Array((try await storage.getListeningHistory()).prefix(10))
            notes = try await storage.getAllNotes()
            
            if let firebaseStorage = storage as? FirebasePodcastStorage {
                stats = firebaseStorage.getStats()
            }
            
            await loadRecommendations()
        } catch {
            print("Error loading podcast data: \(error)")
        }
    }
    
    // MARK: - Favorites
    
    func isFavorite(_ podcast: AwakeningPodcast) -> Bool {
        favorites.contains(podcast.id)
    }
    
    func toggleFavorite(_ podcast: AwakeningPodcast) async {
        do {
            if favorites.contains(podcast.id) {
                try await storage.removeFavorite(podcastId: podcast.id)
                favorites.removeAll { $0 == podcast.id }
            } else {
                try await storage.saveFavorite(podcastId: podcast.id)
                favorites.append(podcast.id)
            }
            await loadRecommendations()
        } catch {
            print("Error toggling favorite: \(error)")
        }
    }
    
    var favoritePodcasts: [AwakeningPodcast] {
        PodcastLibrary.allPodcasts.filter { favorites.contains($0.id) }
    }
    
    // MARK: - Listening
    
    func logListening(podcast: AwakeningPodcast, episode: String, minutes: Int) async {
        do {
            try await storage.logListen(podcastId: podcast.id, episodeTitle: episode, minutesListened: minutes)
            await loadData()
        } catch {
            print("Error logging listen: \(error)")
        }
    }
    
    // MARK: - Notes
    
    func saveNote(podcast: AwakeningPodcast, episode: String, note: String) async {
        do {
            try await storage.saveNote(podcastId: podcast.id, episodeTitle: episode, note: note)
            notes = try await storage.getAllNotes()
        } catch {
            print("Error saving note: \(error)")
        }
    }
    
    func notesFor(_ podcast: AwakeningPodcast) async -> [PodcastNote] {
        do {
            return try await storage.getNotes(for: podcast.id)
        } catch {
            return []
        }
    }
    
    // MARK: - Recommendations
    
    private func loadRecommendations() async {
        do {
            let recommendedIds = try await storage.getRecommendations(basedOn: favorites)
            recommendations = PodcastLibrary.allPodcasts.filter { recommendedIds.contains($0.id) }
        } catch {
            recommendations = []
        }
    }
}

// MARK: - Assembly

struct PodcastAssembly {
    
    @MainActor static func build() -> AwakeningPodcastsView {
        return AwakeningPodcastsView()
    }
    
    @MainActor static func buildWithCustomBackend(baseURL: String, apiKey: String) -> AwakeningPodcastsView {
        // Note: Custom backend configuration would need to be handled differently
        // For now, returns standard view - backend switching can be done via interactor methods
        return AwakeningPodcastsView()
    }
}
