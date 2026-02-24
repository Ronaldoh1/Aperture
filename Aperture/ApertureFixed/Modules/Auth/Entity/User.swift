import Foundation

struct User: Codable, Identifiable {
    
    
    let id: String
    let email: String
    let displayName: String?
    let profileImageURL: String?
    let createdAt: Date
    let lastLoginAt: Date
    
    
    // Progress tracking
    var totalMinutesConsumed: Int = 0
    var currentStreak: Int = 0
    var longestStreak: Int = 0
    var savedContentIds: [String] = []
    var completedModules: [String] = []
    
    
    // Preferences
    var preferredLanguage: String = "en"
    var notificationsEnabled: Bool = true
    var darkModeEnabled: Bool = true
}
