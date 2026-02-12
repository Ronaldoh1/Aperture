// AwakeningArsenalService.swift
// Abstracted storage layer - Firebase ready but swappable
// Protocol-based design for dependency injection

import Foundation
import Combine

// MARK: - Protocol Definition (Abstraction Layer)

protocol AwakeningArsenalServiceProtocol {
    // User Progress
    func getUserProgress(userId: String) async throws -> UserAwakeningProgress
    func saveUserProgress(_ progress: UserAwakeningProgress) async throws
    
    // Method Progress
    func getMethodProgress(userId: String, methodId: String) async throws -> MethodProgress
    func updateMethodProgress(userId: String, methodId: String, progress: MethodProgress) async throws
    func completeStep(userId: String, methodId: String, stepId: String) async throws
    
    // Practice Logging
    func logPractice(_ practice: PracticeLog) async throws
    func getPracticeLogs(userId: String, methodId: String?, dateRange: DateInterval?) async throws -> [PracticeLog]
    func getPracticeStats(userId: String) async throws -> PracticeStats
    
    // Bookmarks/Favorites
    func bookmarkMethod(userId: String, methodId: String) async throws
    func removeBookmark(userId: String, methodId: String) async throws
    func getBookmarks(userId: String) async throws -> [String]
    
    // Offline Sync
    func syncToCloud() async throws
    func downloadForOffline(methodId: String) async throws
}

// MARK: - Models

struct UserAwakeningProgress: Codable {
    let userId: String
    var startedMethods: [String]
    var completedMethods: [String]
    var currentMethod: String?
    var totalPracticeMinutes: Int
    var longestStreak: Int
    var currentStreak: Int
    var lastPracticeDate: Date?
    var createdAt: Date
    var updatedAt: Date
    
    static func new(userId: String) -> UserAwakeningProgress {
        UserAwakeningProgress(
            userId: userId,
            startedMethods: [],
            completedMethods: [],
            currentMethod: nil,
            totalPracticeMinutes: 0,
            longestStreak: 0,
            currentStreak: 0,
            lastPracticeDate: nil,
            createdAt: Date(),
            updatedAt: Date()
        )
    }
}

struct MethodProgress: Codable {
    var methodId: String
    var startedAt: Date?
    var completedAt: Date?
    var completedSteps: [String]
    var notes: String?
    var practiceCount: Int
    var totalMinutes: Int
}

struct PracticeLog: Codable, Identifiable {
    var id: String
    let userId: String
    let methodId: String
    let practiceId: String
    let duration: Int // minutes
    let completedAt: Date
    let notes: String?
    let mood: PracticeMood?
    
    enum PracticeMood: String, Codable {
        case struggling, distracted, neutral, focused, peaceful, blissful
    }
}

struct PracticeStats: Codable {
    let totalSessions: Int
    let totalMinutes: Int
    let averageSessionLength: Int
    let currentStreak: Int
    let longestStreak: Int
    let mostPracticedMethod: String?
    let weeklyAverage: Double
}

// MARK: - Firebase Implementation

class FirebaseAwakeningService: AwakeningArsenalServiceProtocol {
    
    // Firebase references would go here
    // private let db = Firestore.firestore()
    // private let userCollection = "awakening_users"
    // private let progressCollection = "method_progress"
    // private let logsCollection = "practice_logs"
    
    // For now, using UserDefaults as local storage
    // This can be swapped to Firebase with the same interface
    
    private let defaults = UserDefaults.standard
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    // MARK: - User Progress
    
    func getUserProgress(userId: String) async throws -> UserAwakeningProgress {
        let key = "awakening_progress_\(userId)"
        
        if let data = defaults.data(forKey: key),
           let progress = try? decoder.decode(UserAwakeningProgress.self, from: data) {
            return progress
        }
        
        // Return new progress if none exists
        return UserAwakeningProgress.new(userId: userId)
    }
    
    func saveUserProgress(_ progress: UserAwakeningProgress) async throws {
        let key = "awakening_progress_\(progress.userId)"
        var updatedProgress = progress
        updatedProgress.updatedAt = Date()
        
        let data = try encoder.encode(updatedProgress)
        defaults.set(data, forKey: key)
        
        // Firebase would be:
        // try await db.collection(userCollection).document(progress.userId).setData(from: updatedProgress)
    }
    
    // MARK: - Method Progress
    
    func getMethodProgress(userId: String, methodId: String) async throws -> MethodProgress {
        let key = "method_progress_\(userId)_\(methodId)"
        
        if let data = defaults.data(forKey: key),
           let progress = try? decoder.decode(MethodProgress.self, from: data) {
            return progress
        }
        
        return MethodProgress(
            methodId: methodId,
            startedAt: nil,
            completedAt: nil,
            completedSteps: [],
            notes: nil,
            practiceCount: 0,
            totalMinutes: 0
        )
    }
    
    func updateMethodProgress(userId: String, methodId: String, progress: MethodProgress) async throws {
        let key = "method_progress_\(userId)_\(methodId)"
        let data = try encoder.encode(progress)
        defaults.set(data, forKey: key)
        
        // Also update user's started methods
        var userProgress = try await getUserProgress(userId: userId)
        if !userProgress.startedMethods.contains(methodId) {
            userProgress.startedMethods.append(methodId)
            try await saveUserProgress(userProgress)
        }
    }
    
    func completeStep(userId: String, methodId: String, stepId: String) async throws {
        var progress = try await getMethodProgress(userId: userId, methodId: methodId)
        
        if !progress.completedSteps.contains(stepId) {
            progress.completedSteps.append(stepId)
            
            if progress.startedAt == nil {
                progress.startedAt = Date()
            }
            
            try await updateMethodProgress(userId: userId, methodId: methodId, progress: progress)
        }
    }
    
    // MARK: - Practice Logging
    
    func logPractice(_ practice: PracticeLog) async throws {
        // Get existing logs
        var logs = try await getPracticeLogs(userId: practice.userId, methodId: nil, dateRange: nil)
        logs.append(practice)
        
        // Save
        let key = "practice_logs_\(practice.userId)"
        let data = try encoder.encode(logs)
        defaults.set(data, forKey: key)
        
        // Update method progress
        var methodProgress = try await getMethodProgress(userId: practice.userId, methodId: practice.methodId)
        methodProgress.practiceCount += 1
        methodProgress.totalMinutes += practice.duration
        try await updateMethodProgress(userId: practice.userId, methodId: practice.methodId, progress: methodProgress)
        
        // Update user progress
        var userProgress = try await getUserProgress(userId: practice.userId)
        userProgress.totalPracticeMinutes += practice.duration
        userProgress.lastPracticeDate = practice.completedAt
        
        // Update streak
        if let lastDate = userProgress.lastPracticeDate {
            let calendar = Calendar.current
            if calendar.isDateInYesterday(lastDate) || calendar.isDateInToday(lastDate) {
                userProgress.currentStreak += 1
                if userProgress.currentStreak > userProgress.longestStreak {
                    userProgress.longestStreak = userProgress.currentStreak
                }
            } else {
                userProgress.currentStreak = 1
            }
        } else {
            userProgress.currentStreak = 1
        }
        
        try await saveUserProgress(userProgress)
    }
    
    func getPracticeLogs(userId: String, methodId: String?, dateRange: DateInterval?) async throws -> [PracticeLog] {
        let key = "practice_logs_\(userId)"
        
        guard let data = defaults.data(forKey: key),
              var logs = try? decoder.decode([PracticeLog].self, from: data) else {
            return []
        }
        
        // Filter by method if specified
        if let methodId = methodId {
            logs = logs.filter { $0.methodId == methodId }
        }
        
        // Filter by date range if specified
        if let range = dateRange {
            logs = logs.filter { range.contains($0.completedAt) }
        }
        
        return logs.sorted { $0.completedAt > $1.completedAt }
    }
    
    func getPracticeStats(userId: String) async throws -> PracticeStats {
        let logs = try await getPracticeLogs(userId: userId, methodId: nil, dateRange: nil)
        let userProgress = try await getUserProgress(userId: userId)
        
        let totalMinutes = logs.reduce(0) { $0 + $1.duration }
        let avgLength = logs.isEmpty ? 0 : totalMinutes / logs.count
        
        // Calculate most practiced method
        var methodCounts: [String: Int] = [:]
        for log in logs {
            methodCounts[log.methodId, default: 0] += 1
        }
        let mostPracticed = methodCounts.max(by: { $0.value < $1.value })?.key
        
        // Weekly average (last 4 weeks)
        let fourWeeksAgo = Calendar.current.date(byAdding: .weekOfYear, value: -4, to: Date()) ?? Date()
        let recentLogs = logs.filter { $0.completedAt >= fourWeeksAgo }
        let weeklyAvg = Double(recentLogs.count) / 4.0
        
        return PracticeStats(
            totalSessions: logs.count,
            totalMinutes: totalMinutes,
            averageSessionLength: avgLength,
            currentStreak: userProgress.currentStreak,
            longestStreak: userProgress.longestStreak,
            mostPracticedMethod: mostPracticed,
            weeklyAverage: weeklyAvg
        )
    }
    
    // MARK: - Bookmarks
    
    func bookmarkMethod(userId: String, methodId: String) async throws {
        var bookmarks = try await getBookmarks(userId: userId)
        if !bookmarks.contains(methodId) {
            bookmarks.append(methodId)
            let key = "bookmarks_\(userId)"
            defaults.set(bookmarks, forKey: key)
        }
    }
    
    func removeBookmark(userId: String, methodId: String) async throws {
        var bookmarks = try await getBookmarks(userId: userId)
        bookmarks.removeAll { $0 == methodId }
        let key = "bookmarks_\(userId)"
        defaults.set(bookmarks, forKey: key)
    }
    
    func getBookmarks(userId: String) async throws -> [String] {
        let key = "bookmarks_\(userId)"
        return defaults.stringArray(forKey: key) ?? []
    }
    
    // MARK: - Sync
    
    func syncToCloud() async throws {
        // Firebase sync would go here
        // This would push all local changes to Firestore
        print("Syncing to cloud...")
    }
    
    func downloadForOffline(methodId: String) async throws {
        // Download method content for offline use
        // Would cache audio files, etc.
        print("Downloading \(methodId) for offline...")
    }
}

// MARK: - API Implementation (Alternative Backend)

class APIAwakeningService: AwakeningArsenalServiceProtocol {
    
    private let baseURL: URL
    private let session: URLSession
    
    init(baseURL: URL, session: URLSession = .shared) {
        self.baseURL = baseURL
        self.session = session
    }
    
    // All methods would make HTTP requests to your custom API
    // This shows the flexibility of the protocol-based approach
    
    func getUserProgress(userId: String) async throws -> UserAwakeningProgress {
        let url = baseURL.appendingPathComponent("users/\(userId)/progress")
        let (data, _) = try await session.data(from: url)
        return try JSONDecoder().decode(UserAwakeningProgress.self, from: data)
    }
    
    func saveUserProgress(_ progress: UserAwakeningProgress) async throws {
        let url = baseURL.appendingPathComponent("users/\(progress.userId)/progress")
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.httpBody = try JSONEncoder().encode(progress)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        _ = try await session.data(for: request)
    }
    
    // ... implement other methods similarly
    
    func getMethodProgress(userId: String, methodId: String) async throws -> MethodProgress {
        // API implementation
        fatalError("Implement for your API")
    }
    
    func updateMethodProgress(userId: String, methodId: String, progress: MethodProgress) async throws {
        fatalError("Implement for your API")
    }
    
    func completeStep(userId: String, methodId: String, stepId: String) async throws {
        fatalError("Implement for your API")
    }
    
    func logPractice(_ practice: PracticeLog) async throws {
        fatalError("Implement for your API")
    }
    
    func getPracticeLogs(userId: String, methodId: String?, dateRange: DateInterval?) async throws -> [PracticeLog] {
        fatalError("Implement for your API")
    }
    
    func getPracticeStats(userId: String) async throws -> PracticeStats {
        fatalError("Implement for your API")
    }
    
    func bookmarkMethod(userId: String, methodId: String) async throws {
        fatalError("Implement for your API")
    }
    
    func removeBookmark(userId: String, methodId: String) async throws {
        fatalError("Implement for your API")
    }
    
    func getBookmarks(userId: String) async throws -> [String] {
        fatalError("Implement for your API")
    }
    
    func syncToCloud() async throws {
        // No-op for API - always synced
    }
    
    func downloadForOffline(methodId: String) async throws {
        fatalError("Implement for your API")
    }
}

// MARK: - Service Factory

enum AwakeningServiceFactory {
    
    enum ServiceType {
        case firebase
        case api(baseURL: URL)
        case mock
    }
    
    static func create(type: ServiceType) -> AwakeningArsenalServiceProtocol {
        switch type {
        case .firebase:
            return FirebaseAwakeningService()
        case .api(let baseURL):
            return APIAwakeningService(baseURL: baseURL)
        case .mock:
            return MockAwakeningService()
        }
    }
}

// MARK: - Mock Service for Testing

class MockAwakeningService: AwakeningArsenalServiceProtocol {
    
    var mockProgress = UserAwakeningProgress.new(userId: "mock")
    var mockMethodProgress: [String: MethodProgress] = [:]
    var mockLogs: [PracticeLog] = []
    var mockBookmarks: [String] = []
    
    func getUserProgress(userId: String) async throws -> UserAwakeningProgress {
        return mockProgress
    }
    
    func saveUserProgress(_ progress: UserAwakeningProgress) async throws {
        mockProgress = progress
    }
    
    func getMethodProgress(userId: String, methodId: String) async throws -> MethodProgress {
        return mockMethodProgress[methodId] ?? MethodProgress(
            methodId: methodId,
            startedAt: nil,
            completedAt: nil,
            completedSteps: [],
            notes: nil,
            practiceCount: 0,
            totalMinutes: 0
        )
    }
    
    func updateMethodProgress(userId: String, methodId: String, progress: MethodProgress) async throws {
        mockMethodProgress[methodId] = progress
    }
    
    func completeStep(userId: String, methodId: String, stepId: String) async throws {
        var progress = mockMethodProgress[methodId] ?? MethodProgress(
            methodId: methodId,
            startedAt: Date(),
            completedAt: nil,
            completedSteps: [],
            notes: nil,
            practiceCount: 0,
            totalMinutes: 0
        )
        progress.completedSteps.append(stepId)
        mockMethodProgress[methodId] = progress
    }
    
    func logPractice(_ practice: PracticeLog) async throws {
        mockLogs.append(practice)
    }
    
    func getPracticeLogs(userId: String, methodId: String?, dateRange: DateInterval?) async throws -> [PracticeLog] {
        return mockLogs
    }
    
    func getPracticeStats(userId: String) async throws -> PracticeStats {
        return PracticeStats(
            totalSessions: mockLogs.count,
            totalMinutes: mockLogs.reduce(0) { $0 + $1.duration },
            averageSessionLength: 15,
            currentStreak: 5,
            longestStreak: 10,
            mostPracticedMethod: "kundalini",
            weeklyAverage: 3.5
        )
    }
    
    func bookmarkMethod(userId: String, methodId: String) async throws {
        mockBookmarks.append(methodId)
    }
    
    func removeBookmark(userId: String, methodId: String) async throws {
        mockBookmarks.removeAll { $0 == methodId }
    }
    
    func getBookmarks(userId: String) async throws -> [String] {
        return mockBookmarks
    }
    
    func syncToCloud() async throws {}
    func downloadForOffline(methodId: String) async throws {}
}
