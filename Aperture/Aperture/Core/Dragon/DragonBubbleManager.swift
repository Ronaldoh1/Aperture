// DragonBubbleManager.swift
// Manages the persistent Dragon bubble state across the app
// Handles visibility, position, and gesture recognition

import SwiftUI
import Combine

// MARK: - Dragon Bubble Manager

@MainActor
class DragonBubbleManager: ObservableObject {
    
    static let shared = DragonBubbleManager()
    
    // MARK: - Published State
    
    @Published var isVisible: Bool = true
    @Published var isDismissed: Bool = false
    @Published var bubblePosition: CGPoint = CGPoint(x: UIScreen.main.bounds.width - 70, y: UIScreen.main.bounds.height - 180)
    @Published var isExpanded: Bool = false
    @Published var currentContext: DragonContext = .general
    @Published var showingFullDragon: Bool = false
    @Published var pulseAnimation: Bool = false
    
    // MARK: - Settings
    
    @AppStorage("dragon_bubble_enabled") var bubbleEnabled: Bool = true
    @AppStorage("dragon_bubble_x") private var savedX: Double = -1
    @AppStorage("dragon_bubble_y") private var savedY: Double = -1
    
    // MARK: - Tap Detection
    
    private var tapCount: Int = 0
    private var tapTimer: Timer?
    private var longPressTimer: Timer?
    
    // MARK: - Initialization
    
    private init() {
        loadSavedPosition()
        setupNotifications()
    }
    
    // MARK: - Position Management
    
    private func loadSavedPosition() {
        if savedX > 0 && savedY > 0 {
            bubblePosition = CGPoint(x: savedX, y: savedY)
        }
    }
    
    func savePosition() {
        savedX = bubblePosition.x
        savedY = bubblePosition.y
    }
    
    func resetPosition() {
        bubblePosition = CGPoint(x: UIScreen.main.bounds.width - 70, y: UIScreen.main.bounds.height - 180)
        savePosition()
    }
    
    // MARK: - Visibility Control
    
    func show() {
        withAnimation(.spring(response: 0.4, dampingFraction: 0.7)) {
            isDismissed = false
            isVisible = true
        }
        HapticManager.shared.light()
    }
    
    func dismiss() {
        withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
            isVisible = false
            isDismissed = true
        }
    }
    
    func toggle() {
        if isDismissed {
            show()
        } else {
            dismiss()
        }
    }
    
    // MARK: - Triple Tap Detection
    
    func registerTap() {
        tapCount += 1
        
        // Reset tap count after delay
        tapTimer?.invalidate()
        tapTimer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { [weak self] _ in
            Task { @MainActor in
                self?.tapCount = 0
            }
        }
        
        // Check for triple tap
        if tapCount >= 3 {
            tapCount = 0
            tapTimer?.invalidate()
            if isDismissed {
                show()
            }
        }
    }
    
    // MARK: - Long Press Detection
    
    func startLongPress() {
        longPressTimer?.invalidate()
        longPressTimer = Timer.scheduledTimer(withTimeInterval: 1.5, repeats: false) { [weak self] _ in
            Task { @MainActor in
                if self?.isDismissed == true {
                    self?.show()
                    HapticManager.shared.medium()
                }
            }
        }
    }
    
    func cancelLongPress() {
        longPressTimer?.invalidate()
    }
    
    // MARK: - Context Awareness
    
    func setContext(_ context: DragonContext) {
        currentContext = context
    }
    
    func openDragonView() {
        showingFullDragon = true
        HapticManager.shared.medium()
    }
    
    // MARK: - Pulse Animation (for attention)
    
    func triggerPulse() {
        pulseAnimation = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { [weak self] in
            self?.pulseAnimation = false
        }
    }
    
    // MARK: - Notifications
    
    private func setupNotifications() {
        // Listen for events that should trigger Dragon attention
        NotificationCenter.default.addObserver(
            forName: .dragonWantsToSpeak,
            object: nil,
            queue: .main
        ) { [weak self] _ in
            self?.triggerPulse()
        }
    }
}

// MARK: - Dragon Context

enum DragonContext: Equatable {
    case general
    case timeline(eventId: String?)
    case cosmos(sectionId: String?)
    case awakening(courseId: String?)
    case alexandria(textId: String?)
    case practice(practiceId: String?)
    case crisis
    
    var greeting: String {
        switch self {
        case .general:
            return "How can I guide you?"
        case .timeline:
            return "Questions about this moment in history?"
        case .cosmos:
            return "Want to explore this realm deeper?"
        case .awakening:
            return "Need guidance on your practice?"
        case .alexandria:
            return "Shall I illuminate this text?"
        case .practice:
            return "How is your practice going?"
        case .crisis:
            return "I'm here. Let's ground together."
        }
    }
}

// MARK: - Notification Names

extension Notification.Name {
    static let dragonWantsToSpeak = Notification.Name("dragonWantsToSpeak")
    static let summonDragon = Notification.Name("summonDragon")
}
