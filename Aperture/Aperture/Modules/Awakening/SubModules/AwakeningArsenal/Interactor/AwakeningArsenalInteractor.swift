// AwakeningArsenalInteractor.swift
// VIPER Interactor - Business logic for Awakening Arsenal
// Abstracted from storage layer

import Foundation
import Combine
import SwiftUI

// MARK: - Contract

protocol AwakeningArsenalInteractorProtocol {
    // Methods
    func getAllMethods() -> [AwakeningMethod]
    func getMethod(id: String) -> AwakeningMethod?
    func getMethodsByCategory(_ category: AwakeningCategory) -> [AwakeningMethod]
    func searchMethods(query: String) -> [AwakeningMethod]
    
    // Progress
    func getUserProgress() async throws -> UserAwakeningProgress
    func getMethodProgress(methodId: String) async throws -> MethodProgress
    func completeStep(methodId: String, stepId: String) async throws
    
    // Practice
    func startPractice(methodId: String, practiceId: String) -> PracticeSession
    func endPractice(session: PracticeSession, notes: String?, mood: PracticeLog.PracticeMood?) async throws
    func getPracticeStats() async throws -> PracticeStats
    
    // Bookmarks
    func toggleBookmark(methodId: String) async throws
    func isBookmarked(methodId: String) async throws -> Bool
    func getBookmarkedMethods() async throws -> [AwakeningMethod]
    
    // Oneness
    func getOnenessPatterns() -> [UniversalPattern]
}

// MARK: - Practice Session (Active Practice)

struct PracticeSession {
    let id: String
    let methodId: String
    let practiceId: String
    let startTime: Date
    var endTime: Date?
    
    var durationMinutes: Int {
        let end = endTime ?? Date()
        return Int(end.timeIntervalSince(startTime) / 60)
    }
}

// MARK: - Interactor Implementation

class AwakeningArsenalInteractor: AwakeningArsenalInteractorProtocol, ObservableObject {
    
    // MARK: - Dependencies
    
    private let service: AwakeningArsenalServiceProtocol
    private let userId: String
    
    // MARK: - Published State
    
    @Published var userProgress: UserAwakeningProgress?
    @Published var practiceStats: PracticeStats?
    @Published var bookmarkedIds: Set<String> = []
    @Published var activePractice: PracticeSession?
    
    // MARK: - Init
    
    init(service: AwakeningArsenalServiceProtocol = FirebaseAwakeningService(),
         userId: String = "current_user") {
        self.service = service
        self.userId = userId
        
        // Load initial state
        Task {
            await loadInitialState()
        }
    }
    
    private func loadInitialState() async {
        do {
            userProgress = try await service.getUserProgress(userId: userId)
            practiceStats = try await service.getPracticeStats(userId: userId)
            let bookmarks = try await service.getBookmarks(userId: userId)
            bookmarkedIds = Set(bookmarks)
        } catch {
            print("Error loading initial state: \(error)")
        }
    }
    
    // MARK: - Methods
    
    func getAllMethods() -> [AwakeningMethod] {
        return AwakeningArsenalData.allMethods
    }
    
    func getMethod(id: String) -> AwakeningMethod? {
        return AwakeningArsenalData.allMethods.first { $0.id == id }
    }
    
    func getMethodsByCategory(_ category: AwakeningCategory) -> [AwakeningMethod] {
        // Map categories to traditions
        let traditions: [String]
        switch category {
        case .eastern:
            traditions = ["Hinduism", "Taoism", "Buddhism", "Zen Buddhism", "Sikhism"]
        case .western:
            traditions = ["Christianity", "Kabbalah (Jewish Mysticism)", "Celtic Druidism"]
        case .indigenous:
            traditions = ["Shamanism", "Ancient Egyptian", "Australian Aboriginal", "Mesoamerican (Maya/Aztec)", "Yoruba / Ifa"]
        case .modern:
            traditions = ["Paganism / Wicca", "Sufism (Islamic Mysticism)"]
        }
        
        return AwakeningArsenalData.allMethods.filter { traditions.contains($0.tradition) }
    }
    
    func searchMethods(query: String) -> [AwakeningMethod] {
        let lowercased = query.lowercased()
        return AwakeningArsenalData.allMethods.filter { method in
            method.name.lowercased().contains(lowercased) ||
            method.tradition.lowercased().contains(lowercased) ||
            method.region.lowercased().contains(lowercased) ||
            method.tagline.lowercased().contains(lowercased) ||
            method.energyName.lowercased().contains(lowercased)
        }
    }
    
    // MARK: - Progress
    
    func getUserProgress() async throws -> UserAwakeningProgress {
        let progress = try await service.getUserProgress(userId: userId)
        await MainActor.run {
            self.userProgress = progress
        }
        return progress
    }
    
    func getMethodProgress(methodId: String) async throws -> MethodProgress {
        return try await service.getMethodProgress(userId: userId, methodId: methodId)
    }
    
    func completeStep(methodId: String, stepId: String) async throws {
        try await service.completeStep(userId: userId, methodId: methodId, stepId: stepId)
        
        // Refresh progress
        _ = try await getUserProgress()
    }
    
    // MARK: - Practice
    
    func startPractice(methodId: String, practiceId: String) -> PracticeSession {
        let session = PracticeSession(
            id: UUID().uuidString,
            methodId: methodId,
            practiceId: practiceId,
            startTime: Date(),
            endTime: nil
        )
        
        DispatchQueue.main.async {
            self.activePractice = session
        }
        
        return session
    }
    
    func endPractice(session: PracticeSession, notes: String?, mood: PracticeLog.PracticeMood?) async throws {
        var completedSession = session
        completedSession.endTime = Date()
        
        let log = PracticeLog(
            id: UUID().uuidString,
            userId: userId,
            methodId: session.methodId,
            practiceId: session.practiceId,
            duration: completedSession.durationMinutes,
            completedAt: Date(),
            notes: notes,
            mood: mood
        )
        
        try await service.logPractice(log)
        
        await MainActor.run {
            self.activePractice = nil
        }
        
        // Refresh stats
        practiceStats = try await service.getPracticeStats(userId: userId)
    }
    
    func getPracticeStats() async throws -> PracticeStats {
        let stats = try await service.getPracticeStats(userId: userId)
        await MainActor.run {
            self.practiceStats = stats
        }
        return stats
    }
    
    // MARK: - Bookmarks
    
    func toggleBookmark(methodId: String) async throws {
        if bookmarkedIds.contains(methodId) {
            try await service.removeBookmark(userId: userId, methodId: methodId)
            await MainActor.run {
                self.bookmarkedIds.remove(methodId)
            }
        } else {
            try await service.bookmarkMethod(userId: userId, methodId: methodId)
            await MainActor.run {
                self.bookmarkedIds.insert(methodId)
            }
        }
    }
    
    func isBookmarked(methodId: String) async throws -> Bool {
        return bookmarkedIds.contains(methodId)
    }
    
    func getBookmarkedMethods() async throws -> [AwakeningMethod] {
        let bookmarks = try await service.getBookmarks(userId: userId)
        return AwakeningArsenalData.allMethods.filter { bookmarks.contains($0.id) }
    }
    
    // MARK: - Oneness
    
    func getOnenessPatterns() -> [UniversalPattern] {
        return OnenessProof.universalPatterns
    }
}

// MARK: - Presenter Protocol

protocol AwakeningArsenalPresenterProtocol: ObservableObject {
    var methods: [AwakeningMethod] { get }
    var filteredMethods: [AwakeningMethod] { get }
    var selectedCategory: AwakeningCategory? { get set }
    var searchQuery: String { get set }
    var userProgress: UserAwakeningProgress? { get }
    var practiceStats: PracticeStats? { get }
    var isLoading: Bool { get }
    var error: Error? { get }
    
    func loadMethods()
    func selectMethod(_ method: AwakeningMethod)
    func toggleBookmark(_ method: AwakeningMethod)
    func startPractice(method: AwakeningMethod, practice: DailyPractice)
}

// MARK: - Presenter Implementation

class AwakeningArsenalPresenter: AwakeningArsenalPresenterProtocol {
    
    // MARK: - Dependencies
    
    private let interactor: AwakeningArsenalInteractor
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Published State
    
    @Published var methods: [AwakeningMethod] = []
    @Published var filteredMethods: [AwakeningMethod] = []
    @Published var selectedCategory: AwakeningCategory? = nil {
        didSet { filterMethods() }
    }
    @Published var searchQuery: String = "" {
        didSet { filterMethods() }
    }
    @Published var userProgress: UserAwakeningProgress?
    @Published var practiceStats: PracticeStats?
    @Published var isLoading: Bool = false
    @Published var error: Error?
    
    // MARK: - Init
    
    init(interactor: AwakeningArsenalInteractor = AwakeningArsenalInteractor()) {
        self.interactor = interactor
        setupBindings()
        loadMethods()
    }
    
    private func setupBindings() {
        interactor.$userProgress
            .receive(on: DispatchQueue.main)
            .assign(to: &$userProgress)
        
        interactor.$practiceStats
            .receive(on: DispatchQueue.main)
            .assign(to: &$practiceStats)
    }
    
    // MARK: - Methods
    
    func loadMethods() {
        methods = interactor.getAllMethods()
        filteredMethods = methods
    }
    
    private func filterMethods() {
        var result = methods
        
        // Apply category filter
        if let category = selectedCategory {
            result = interactor.getMethodsByCategory(category)
        }
        
        // Apply search filter
        if !searchQuery.isEmpty {
            result = interactor.searchMethods(query: searchQuery)
        }
        
        filteredMethods = result
    }
    
    func selectMethod(_ method: AwakeningMethod) {
        // Navigation handled by router
    }
    
    func toggleBookmark(_ method: AwakeningMethod) {
        Task {
            do {
                try await interactor.toggleBookmark(methodId: method.id)
            } catch {
                await MainActor.run {
                    self.error = error
                }
            }
        }
    }
    
    func startPractice(method: AwakeningMethod, practice: DailyPractice) {
        _ = interactor.startPractice(methodId: method.id, practiceId: practice.id)
    }
}

// MARK: - Assembly

enum AwakeningArsenalAssembly {
    
    /// Build the Awakening Arsenal view
    /// Note: UniversalAwakeningArsenalView uses its own ViewModel pattern
    @ViewBuilder
    static func build(serviceType: AwakeningServiceFactory.ServiceType = .firebase) -> some View {
        UniversalAwakeningArsenalView()
    }
}
