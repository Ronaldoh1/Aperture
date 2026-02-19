// ChronokeeperEngine.swift
// Intelligence layer — Claude API for premium, scripted for free
// Integrates with TTS for hands-free read-aloud
// ☀️ SunFlow: Reignited

import Foundation
import SwiftUI
import Combine

@MainActor
final class ChronokeeperEngine: ObservableObject {
    
    static let shared = ChronokeeperEngine()
    
    // MARK: - Published State
    
    @Published var messages: [ChronokeeperMessage] = []
    @Published var chatState: ChronokeeperChatState = .idle
    @Published var isReadingAloud: Bool = false
    
    // MARK: - Dependencies
    
    private let tts = TextToSpeechManager.shared
    private let progressManager = CourseProgressManager.shared
    private let scanHistory = ScanHistoryManager.shared
    
    // API configuration — stored in UserDefaults for now, Firebase later
    // In production, proxy through your own backend to protect the key
    private var apiKey: String {
        UserDefaults.standard.string(forKey: "chronokeeper_api_key") ?? ""
    }
    
    private var isPremium: Bool {
        // Hook into your paywall — for now, check if API key exists
        !apiKey.isEmpty
    }
    
    // Conversation history for context window
    private var conversationHistory: [APIMessage] = []
    private let maxHistoryMessages = 20
    
    // MARK: - Init
    
    private init() {
        loadConversation()
        
        // Welcome message on first launch
        if messages.isEmpty {
            let welcome = ChronokeeperPersona.welcomeMessages.randomElement() ?? ChronokeeperPersona.welcomeMessages[0]
            let msg = ChronokeeperMessage(
                role: .assistant,
                content: welcome,
                actionButtons: Array(ChronokeeperPersona.suggestedStarters.prefix(4))
            )
            messages.append(msg)
        }
    }
    
    // MARK: - Send Message
    
    func send(_ text: String, readAloud: Bool = false) async {
        let trimmed = text.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return }
        
        // Add user message
        let userMsg = ChronokeeperMessage(role: .user, content: trimmed)
        messages.append(userMsg)
        conversationHistory.append(APIMessage(role: "user", content: trimmed))
        
        chatState = .thinking
        
        // Try scripted response first (free tier always works)
        if let scripted = findScriptedResponse(for: trimmed) {
            await deliverResponse(scripted, readAloud: readAloud)
            return
        }
        
        // Try course-specific response
        if let courseResponse = handleCourseQuery(trimmed) {
            await deliverResponse(courseResponse.text, readAloud: readAloud, courseCard: courseResponse.card)
            return
        }
        
        // Try "continue journey" response
        if trimmed.lowercased().contains("left off") || trimmed.lowercased().contains("continue") || trimmed.lowercased().contains("what's next") {
            let continueResponse = buildContinueResponse()
            await deliverResponse(continueResponse, readAloud: readAloud)
            return
        }
        
        // Premium: Claude API
        if isPremium {
            await callClaudeAPI(userText: trimmed, readAloud: readAloud)
        } else {
            // Free tier fallback
            let fallback = buildFreeTierResponse(for: trimmed)
            await deliverResponse(fallback, readAloud: readAloud)
        }
    }
    
    // MARK: - Deliver Response
    
    private func deliverResponse(_ text: String, readAloud: Bool, courseCard: ChronokeeperCourseCard? = nil) async {
        let actions = suggestNextActions(for: text)
        
        let msg = ChronokeeperMessage(
            role: .assistant,
            content: text,
            courseCard: courseCard,
            actionButtons: actions.isEmpty ? nil : actions
        )
        messages.append(msg)
        conversationHistory.append(APIMessage(role: "assistant", content: text))
        trimHistory()
        saveConversation()
        
        chatState = readAloud ? .speaking : .idle
        
        if readAloud {
            isReadingAloud = true
            tts.speak(text)
            
            // Monitor TTS completion
            Task {
                while tts.isSpeaking {
                    try? await Task.sleep(nanoseconds: 500_000_000)
                }
                isReadingAloud = false
                chatState = .idle
            }
        }
    }
    
    // MARK: - Claude API Call
    
    private func callClaudeAPI(userText: String, readAloud: Bool) async {
        let userContext = buildUserContext()
        let systemPrompt = ChronokeeperPersona.buildSystemPrompt(userContext: userContext)
        
        // Build messages array
        var apiMessages: [APIMessage] = []
        
        // Include recent history for context
        let recentHistory = Array(conversationHistory.suffix(maxHistoryMessages))
        apiMessages.append(contentsOf: recentHistory)
        
        let requestBody: [String: Any] = [
            "model": "claude-sonnet-4-5-20250514",
            "max_tokens": 1024,
            "system": systemPrompt,
            "messages": apiMessages.map { ["role": $0.role, "content": $0.content] }
        ]
        
        guard let url = URL(string: "https://api.anthropic.com/v1/messages") else {
            await deliverResponse("The Library's connection seems disrupted. Try again in a moment, seeker.", readAloud: readAloud)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("2023-06-01", forHTTPHeaderField: "anthropic-version")
        request.setValue(apiKey, forHTTPHeaderField: "x-api-key")
        request.timeoutInterval = 30
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: requestBody)
            
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw NSError(domain: "Chronokeeper", code: 1, userInfo: [NSLocalizedDescriptionKey: "API returned non-200"])
            }
            
            let apiResponse = try JSONDecoder().decode(ClaudeAPIResponse.self, from: data)
            let responseText = apiResponse.text
            
            if responseText.isEmpty {
                throw NSError(domain: "Chronokeeper", code: 2, userInfo: [NSLocalizedDescriptionKey: "Empty response"])
            }
            
            await deliverResponse(responseText, readAloud: readAloud)
            
        } catch {
            print("Chronokeeper API error: \(error)")
            // Graceful fallback to scripted
            let fallback = buildFreeTierResponse(for: userText)
            await deliverResponse(fallback, readAloud: readAloud)
        }
    }
    
    // MARK: - User Context Builder
    
    private func buildUserContext() -> ChronokeeperPersona.UserContext {
        var ctx = ChronokeeperPersona.UserContext()
        
        let allProgress = progressManager.allProgress
        
        ctx.coursesStarted = allProgress.filter { !$0.value.completedLessonIds.isEmpty }.map { $0.key }
        ctx.coursesCompleted = allProgress.filter { $0.value.isComplete }.map { $0.key }
        ctx.totalLessonsCompleted = progressManager.totalLessonsCompleted
        ctx.currentStreak = progressManager.currentStreak
        ctx.isNewUser = allProgress.isEmpty
        
        // Find most recent course
        if let mostRecent = allProgress.values.max(by: { $0.lastAccessedAt < $1.lastAccessedAt }) {
            ctx.currentCourseId = mostRecent.id
            ctx.currentModuleIndex = mostRecent.currentModuleIndex
            ctx.currentLessonIndex = mostRecent.currentLessonIndex
        }
        
        // Recent scans
        let recentScans = scanHistory.scans.prefix(5)
        ctx.recentScans = recentScans.compactMap { $0.productName }
        
        return ctx
    }
    
    // MARK: - Scripted Response Matching
    
    private func findScriptedResponse(for input: String) -> String? {
        let lowered = input.lowercased()
        
        for (trigger, response) in ChronokeeperPersona.scriptedResponses {
            if lowered.contains(trigger) {
                return response
            }
        }
        
        // Identity questions
        if lowered.contains("who are you") || lowered.contains("what are you") {
            return ChronokeeperPersona.scriptedResponses["who are you"]
        }
        
        return nil
    }
    
    // MARK: - Course Query Handler
    
    private struct CourseQueryResult {
        let text: String
        let card: ChronokeeperCourseCard?
    }
    
    private func handleCourseQuery(_ input: String) -> CourseQueryResult? {
        let lowered = input.lowercased()
        
        let allCourses = AlexandriaCourseRegistry.allCourses
        
        // Find matching course
        for course in allCourses {
            let titleLower = course.title.lowercased()
            let idLower = course.id.lowercased()
            
            if lowered.contains(titleLower) || lowered.contains(idLower) {
                let progress = progressManager.progress(for: course.id)
                let percentage = progress.progressPercentage
                
                let card = ChronokeeperCourseCard(
                    id: course.id,
                    title: course.title,
                    subtitle: course.subtitle,
                    icon: course.icon,
                    colorHex: course.colorHex,
                    progress: percentage,
                    moduleCount: course.moduleCount,
                    lessonCount: course.lessonCount
                )
                
                var text: String
                if percentage > 0 && percentage < 1.0 {
                    text = "You're \(Int(percentage * 100))% through \(course.title). \(course.dragonComment) Want me to read you the next lesson, or give you a summary of where you are?"
                } else if percentage >= 1.0 {
                    text = "You've completed \(course.title) — well done, seeker. \(course.dragonComment) Want to revisit any lesson, or shall I suggest what to explore next?"
                } else {
                    text = "\(course.title) — \(course.subtitle). This one has \(course.moduleCount) modules and \(course.lessonCount) lessons. \(course.dragonComment) Want me to walk you through the first lesson?"
                }
                
                return CourseQueryResult(text: text, card: card)
            }
        }
        
        // Generic "courses" or "what can I learn"
        if lowered.contains("course") || lowered.contains("what can i learn") || lowered.contains("what should i") || lowered.contains("recommend") {
            let started = progressManager.allProgress.filter { !$0.value.completedLessonIds.isEmpty }
            
            if started.isEmpty {
                return CourseQueryResult(
                    text: "For someone just beginning, I'd recommend starting with Christ Consciousness — it reveals what Yeshua actually taught before they rewrote the story. Or if you want to understand how the world really works, Guilt and Power shows you how institutions weaponized shame for millennia. Both are eye-openers. Which speaks to you?",
                    card: nil
                )
            } else {
                let completedCount = progressManager.totalCoursesCompleted
                return CourseQueryResult(
                    text: "You've started \(started.count) courses and completed \(completedCount). Based on your journey so far, I'd suggest exploring what you haven't touched yet. Want me to list what's waiting for you in the Library?",
                    card: nil
                )
            }
        }
        
        return nil
    }
    
    // MARK: - Continue Journey
    
    private func buildContinueResponse() -> String {
        let allProgress = progressManager.allProgress
        
        if let mostRecent = allProgress.values.max(by: { $0.lastAccessedAt < $1.lastAccessedAt }) {
            let course = AlexandriaCourseRegistry.allCourses.first { $0.id == mostRecent.id }
            let courseName = course?.title ?? mostRecent.id
            let moduleNum = mostRecent.currentModuleIndex + 1
            let lessonNum = mostRecent.currentLessonIndex + 1
            
            return "You left off in \(courseName) — Module \(moduleNum), Lesson \(lessonNum). You've completed \(mostRecent.completedLessonIds.count) lessons so far. Want me to read you the next one, or give you a quick recap of where we were?"
        }
        
        return "Looks like you're at the beginning of the journey, seeker. That's the best place to be — everything is about to change. Want me to recommend a starting course based on what interests you?"
    }
    
    // MARK: - Free Tier Fallback
    
    private func buildFreeTierResponse(for input: String) -> String {
        let lowered = input.lowercased()
        
        if lowered.contains("timeline") {
            return "The Timeline shows you 5,000 years of hidden history — from the Sumerian sun temples to modern social media capture. Every era reveals how institutions erased ancient wisdom and replaced it with control. Scroll through it and tap any era card to see what they hid. Want me to tell you about a specific time period?"
        }
        
        if lowered.contains("cosmos") || lowered.contains("gnostic") || lowered.contains("archon") || lowered.contains("sophia") {
            return "The Cosmos module maps gnostic cosmology — the Pleroma (the fullness), the Aeons (divine emanations), and how Sophia's curiosity created the material world. The Archons are the rulers of this realm who feed on ignorance. But here's the key: you carry a divine spark that's beyond their reach. The Cosmos module walks you through all of it visually."
        }
        
        if lowered.contains("scan") || lowered.contains("food") || lowered.contains("ingredient") || lowered.contains("chemical") {
            return "Quantum Nourish is your food truth detector. Scan any label with the Vibe Scanner and I'll tell you what's really in it. The Kill List tracks 8 chemicals hiding under dozens of aliases — the ones making people sick while corporations profit. Want me to walk you through the worst offenders?"
        }
        
        if lowered.contains("hello") || lowered.contains("hi") || lowered.contains("hey") || lowered.contains("sup") {
            return ChronokeeperPersona.welcomeMessages.randomElement() ?? "Greetings, seeker. What truth are you seeking today?"
        }
        
        if lowered.contains("read") || lowered.contains("listen") || lowered.contains("speak") || lowered.contains("talk") {
            return "I can read any lesson to you — just tell me which course or topic you're interested in. If you're not sure where to start, I'll pick something powerful. Just say the word."
        }
        
        // Default
        return "That's a deep question, seeker. For the full Chronokeeper experience — where I can dive deep into any topic and walk you through lessons conversationally — unlock Premium. But I can still guide you through the courses, tell you about the Timeline, or explain what's on the Kill List. What interests you?"
    }
    
    // MARK: - Suggest Next Actions
    
    private func suggestNextActions(for responseText: String) -> [ChronokeeperAction] {
        var actions: [ChronokeeperAction] = []
        
        // Always offer read-aloud
        actions.append(ChronokeeperAction(
            label: "Read this to me",
            icon: "speaker.wave.2.fill",
            type: .readAloud
        ))
        
        let lowered = responseText.lowercased()
        
        if lowered.contains("course") || lowered.contains("lesson") {
            actions.append(ChronokeeperAction(
                label: "Start the first lesson",
                icon: "play.fill",
                type: .sendMessage("Read me the first lesson.")
            ))
        }
        
        if lowered.contains("kill list") || lowered.contains("chemical") {
            actions.append(ChronokeeperAction(
                label: "Show me the Kill List",
                icon: "exclamationmark.triangle.fill",
                type: .openModule("killList")
            ))
        }
        
        if lowered.contains("timeline") {
            actions.append(ChronokeeperAction(
                label: "Open Timeline",
                icon: "clock.arrow.circlepath",
                type: .openModule("timeline")
            ))
        }
        
        return Array(actions.prefix(3))
    }
    
    // MARK: - Read Aloud Controls
    
    func readLastResponse() {
        guard let lastAssistant = messages.last(where: { $0.role == .assistant }) else { return }
        chatState = .speaking
        isReadingAloud = true
        tts.speak(lastAssistant.content)
        
        Task {
            while tts.isSpeaking {
                try? await Task.sleep(nanoseconds: 500_000_000)
            }
            isReadingAloud = false
            chatState = .idle
        }
    }
    
    func stopReading() {
        tts.stop()
        isReadingAloud = false
        chatState = .idle
    }
    
    // MARK: - Conversation Persistence
    
    private let conversationKey = "chronokeeper_conversation"
    
    private func saveConversation() {
        let savedMessages = messages.map { msg in
            SavedConversation.SavedMessage(
                role: msg.role.rawValue,
                content: msg.content,
                timestamp: msg.timestamp
            )
        }
        
        let convo = SavedConversation(
            id: "main",
            messages: savedMessages,
            lastUpdated: Date(),
            title: "Main Conversation"
        )
        
        if let data = try? JSONEncoder().encode(convo) {
            UserDefaults.standard.set(data, forKey: conversationKey)
        }
    }
    
    private func loadConversation() {
        guard let data = UserDefaults.standard.data(forKey: conversationKey),
              let convo = try? JSONDecoder().decode(SavedConversation.self, from: data) else { return }
        
        messages = convo.messages.map { saved in
            ChronokeeperMessage(
                role: MessageRole(rawValue: saved.role) ?? .assistant,
                content: saved.content
            )
        }
        
        conversationHistory = convo.messages.map { saved in
            APIMessage(role: saved.role, content: saved.content)
        }
    }
    
    func clearConversation() {
        messages = []
        conversationHistory = []
        UserDefaults.standard.removeObject(forKey: conversationKey)
        
        // Re-add welcome
        let welcome = ChronokeeperPersona.welcomeMessages.randomElement() ?? ChronokeeperPersona.welcomeMessages[0]
        messages.append(ChronokeeperMessage(
            role: .assistant,
            content: welcome,
            actionButtons: Array(ChronokeeperPersona.suggestedStarters.prefix(4))
        ))
    }
    
    // MARK: - API Key Management
    
    func setAPIKey(_ key: String) {
        UserDefaults.standard.set(key, forKey: "chronokeeper_api_key")
    }
    
    var hasAPIKey: Bool { !apiKey.isEmpty }
    
    // MARK: - History Trimming
    
    private func trimHistory() {
        if conversationHistory.count > maxHistoryMessages {
            conversationHistory = Array(conversationHistory.suffix(maxHistoryMessages))
        }
    }
}
