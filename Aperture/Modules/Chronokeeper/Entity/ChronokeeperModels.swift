// ChronokeeperModels.swift
// Data models for the Chronokeeper AI Chat
// ☀️ SunFlow: Reignited

import SwiftUI

// MARK: - Chat Message

struct ChronokeeperMessage: Identifiable, Equatable {
    let id: UUID
    let role: MessageRole
    let content: String
    let timestamp: Date
    var isStreaming: Bool
    
    // Optional rich content
    var courseCard: ChronokeeperCourseCard?
    var actionButtons: [ChronokeeperAction]?
    
    init(role: MessageRole, content: String, isStreaming: Bool = false,
         courseCard: ChronokeeperCourseCard? = nil, actionButtons: [ChronokeeperAction]? = nil) {
        self.id = UUID()
        self.role = role
        self.content = content
        self.timestamp = Date()
        self.isStreaming = isStreaming
        self.courseCard = courseCard
        self.actionButtons = actionButtons
    }
    
    static func == (lhs: ChronokeeperMessage, rhs: ChronokeeperMessage) -> Bool {
        lhs.id == rhs.id && lhs.content == rhs.content && lhs.isStreaming == rhs.isStreaming
    }
}

enum MessageRole: String, Codable {
    case user
    case assistant
    case system
}

// MARK: - Course Card (embedded in chat)

struct ChronokeeperCourseCard: Identifiable, Equatable {
    let id: String
    let title: String
    let subtitle: String
    let icon: String
    let colorHex: String
    let progress: Double
    let moduleCount: Int
    let lessonCount: Int
    
    var color: Color { Color(hex: colorHex) }
    
    static func == (lhs: ChronokeeperCourseCard, rhs: ChronokeeperCourseCard) -> Bool {
        lhs.id == rhs.id
    }
}

// MARK: - Action Buttons (suggested actions in chat)

struct ChronokeeperAction: Identifiable, Equatable {
    let id: UUID
    let label: String
    let icon: String
    let type: ActionType
    
    init(label: String, icon: String, type: ActionType) {
        self.id = UUID()
        self.label = label
        self.icon = icon
        self.type = type
    }
    
    static func == (lhs: ChronokeeperAction, rhs: ChronokeeperAction) -> Bool {
        lhs.id == rhs.id
    }
    
    enum ActionType: Equatable {
        case sendMessage(String)
        case openCourse(String)
        case openModule(String)
        case readAloud
        case continueJourney
    }
}

// MARK: - Chat State

enum ChronokeeperChatState: Equatable {
    case idle
    case listening
    case thinking
    case speaking
    case error(String)
}

// MARK: - API Message (for Claude API)

struct APIMessage: Codable {
    let role: String
    let content: String
}

// MARK: - Claude API Response

struct ClaudeAPIResponse: Codable {
    let content: [ClaudeContent]
    
    struct ClaudeContent: Codable {
        let type: String
        let text: String?
    }
    
    var text: String {
        content.compactMap { $0.text }.joined()
    }
}

// MARK: - Conversation Persistence

struct SavedConversation: Codable, Identifiable {
    let id: String
    let messages: [SavedMessage]
    let lastUpdated: Date
    let title: String
    
    struct SavedMessage: Codable {
        let role: String
        let content: String
        let timestamp: Date
    }
}
