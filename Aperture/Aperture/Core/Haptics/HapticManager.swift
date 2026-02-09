// HapticManager.swift
// Centralized haptic feedback for making the app feel ALIVE
// Subtle vibrations that respond to user actions

import UIKit
import SwiftUI

// MARK: - Haptic Manager

final class HapticManager {
    
    static let shared = HapticManager()
    
    // Feedback generators (reuse for performance)
    private let lightImpact = UIImpactFeedbackGenerator(style: .light)
    private let mediumImpact = UIImpactFeedbackGenerator(style: .medium)
    private let heavyImpact = UIImpactFeedbackGenerator(style: .heavy)
    private let softImpact = UIImpactFeedbackGenerator(style: .soft)
    private let rigidImpact = UIImpactFeedbackGenerator(style: .rigid)
    private let selection = UISelectionFeedbackGenerator()
    private let notification = UINotificationFeedbackGenerator()
    
    private init() {
        // Prepare generators for immediate response
        prepareAll()
    }
    
    private func prepareAll() {
        lightImpact.prepare()
        mediumImpact.prepare()
        heavyImpact.prepare()
        softImpact.prepare()
        rigidImpact.prepare()
        selection.prepare()
        notification.prepare()
    }
    
    // MARK: - Core Haptics
    
    /// Light tap - for selections, toggles
    func light() {
        lightImpact.impactOccurred()
        lightImpact.prepare()
    }
    
    /// Medium tap - for button presses, confirmations
    func medium() {
        mediumImpact.impactOccurred()
        mediumImpact.prepare()
    }
    
    /// Heavy tap - for important actions
    func heavy() {
        heavyImpact.impactOccurred()
        heavyImpact.prepare()
    }
    
    /// Soft tap - for subtle feedback
    func soft() {
        softImpact.impactOccurred()
        softImpact.prepare()
    }
    
    /// Rigid tap - for firm feedback
    func rigid() {
        rigidImpact.impactOccurred()
        rigidImpact.prepare()
    }
    
    /// Selection changed - picker/slider moved
    func selectionChanged() {
        selection.selectionChanged()
        selection.prepare()
    }
    
    /// Success notification
    func success() {
        notification.notificationOccurred(.success)
        notification.prepare()
    }
    
    /// Warning notification
    func warning() {
        notification.notificationOccurred(.warning)
        notification.prepare()
    }
    
    /// Error notification
    func error() {
        notification.notificationOccurred(.error)
        notification.prepare()
    }
    
    // MARK: - App-Specific Haptics
    
    /// Course completed! 🎉 - Satisfying success pattern
    func courseCompleted() {
        // Double tap pattern for achievement
        medium()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { [weak self] in
            self?.success()
        }
    }
    
    /// Lesson completed - lighter achievement
    func lessonCompleted() {
        soft()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.08) { [weak self] in
            self?.light()
        }
    }
    
    /// Dragon evolution! 🐉 - Epic moment
    func dragonEvolved() {
        // Rising intensity pattern
        soft()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { [weak self] in
            self?.medium()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) { [weak self] in
            self?.heavy()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) { [weak self] in
            self?.success()
        }
    }
    
    /// XP gained - quick reward feel
    func xpGained() {
        soft()
    }
    
    /// Chakra activated - energy pulse
    func chakraActivated() {
        medium()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) { [weak self] in
            self?.soft()
        }
    }
    
    /// Card flip/reveal - anticipation
    func cardFlip() {
        light()
    }
    
    /// Tab changed
    func tabChanged() {
        selectionChanged()
    }
    
    /// Button pressed (general)
    func buttonPressed() {
        light()
    }
    
    /// Dragon interaction - pet/tap the dragon
    func dragonTapped() {
        medium()
    }
    
    /// Timeline event selected
    func timelineEventSelected() {
        soft()
    }
    
    /// Sacred text opened
    func textOpened() {
        light()
    }
    
    /// Awakening moment - big realization
    func awakeningMoment() {
        // Expanding pattern like consciousness expanding
        soft()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) { [weak self] in
            self?.medium()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { [weak self] in
            self?.rigid()
        }
    }
    
    /// Error/invalid action
    func invalidAction() {
        warning()
    }
    
    /// Pull to refresh
    func pullToRefresh() {
        medium()
    }
    
    /// Scroll snap - when scrolling snaps to position
    func scrollSnap() {
        selectionChanged()
    }
    
    /// Streak bonus achieved
    func streakBonus() {
        success()
    }
    
    /// Profile saved
    func profileSaved() {
        success()
    }
    
    /// Navigation back
    func navigateBack() {
        soft()
    }
    
    /// Menu opened
    func menuOpened() {
        light()
    }
    
}

// MARK: - SwiftUI View Modifier

struct HapticOnTap: ViewModifier {
    
    let type: HapticType
    
    enum HapticType {
        case light, medium, heavy, soft, selection, success
        case courseCompleted, lessonCompleted, dragonTapped
        case buttonPressed, cardFlip
    }
    
    func body(content: Content) -> some View {
        content
            .simultaneousGesture(
                TapGesture().onEnded { _ in
                    triggerHaptic()
                }
            )
    }
    
    private func triggerHaptic() {
        switch type {
        case .light: HapticManager.shared.light()
        case .medium: HapticManager.shared.medium()
        case .heavy: HapticManager.shared.heavy()
        case .soft: HapticManager.shared.soft()
        case .selection: HapticManager.shared.selectionChanged()
        case .success: HapticManager.shared.success()
        case .courseCompleted: HapticManager.shared.courseCompleted()
        case .lessonCompleted: HapticManager.shared.lessonCompleted()
        case .dragonTapped: HapticManager.shared.dragonTapped()
        case .buttonPressed: HapticManager.shared.buttonPressed()
        case .cardFlip: HapticManager.shared.cardFlip()
        }
    }
    
}

// MARK: - View Extension

extension View {
    
    /// Add haptic feedback on tap
    func hapticOnTap(_ type: HapticOnTap.HapticType = .light) -> some View {
        modifier(HapticOnTap(type: type))
    }
    
}

// MARK: - Usage Examples
/*
 
 // Basic usage:
 Button("Complete Course") {
     HapticManager.shared.courseCompleted()
     // ... complete course logic
 }
 
 // With modifier:
 Button("Tap Me") { }
     .hapticOnTap(.medium)
 
 // Dragon interaction:
 AnimatedDragonView()
     .onTapGesture {
         HapticManager.shared.dragonTapped()
     }
 
 // Course completion:
 func completeCourse() {
     // ... save progress
     HapticManager.shared.courseCompleted()
 }
 
 // Dragon evolution:
 func evolveDragon() {
     // ... evolution logic
     HapticManager.shared.dragonEvolved()
 }
 
 // Tab bar:
 TabView(selection: $tab) { ... }
     .onChange(of: tab) {
         HapticManager.shared.tabChanged()
     }
 
 */
