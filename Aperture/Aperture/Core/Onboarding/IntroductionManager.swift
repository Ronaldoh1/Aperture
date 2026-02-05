//
//  IntroductionManager.swift
//  Aperture
//
//  Manages when to show the app introduction
//

import SwiftUI

@MainActor
final class IntroductionManager: ObservableObject {
    
    static let shared = IntroductionManager()
    
    private let hasSeenIntroductionKey = "hasSeenApertureIntroduction"
    private let introductionVersionKey = "apertureIntroductionVersion"
    
    // Increment this when you want to force show the introduction again to all users
    private let currentIntroductionVersion = 1
    
    @Published var shouldShowIntroduction: Bool = false
    
    /// Whether user has completed the introduction
    var hasSeenIntroduction: Bool {
        UserDefaults.standard.bool(forKey: hasSeenIntroductionKey)
    }
    
    private init() {
        checkIfShouldShowIntroduction()
    }
    
    // MARK: - Public Methods
    
    /// Check on app launch if we should show the introduction
    func checkIfShouldShowIntroduction() {
        let hasSeenIntroduction = UserDefaults.standard.bool(forKey: hasSeenIntroductionKey)
        let seenVersion = UserDefaults.standard.integer(forKey: introductionVersionKey)
        
        // Show if user has never seen it, or if we have a new version
        if !hasSeenIntroduction || seenVersion < currentIntroductionVersion {
            shouldShowIntroduction = true
        }
    }
    
    /// Mark the introduction as seen
    func markIntroductionAsSeen() {
        UserDefaults.standard.set(true, forKey: hasSeenIntroductionKey)
        UserDefaults.standard.set(currentIntroductionVersion, forKey: introductionVersionKey)
        shouldShowIntroduction = false
    }
    
    /// Force show the introduction (for "About" buttons)
    func showIntroduction() {
        shouldShowIntroduction = true
    }
    
    /// Reset for testing/debug
    func reset() {
        UserDefaults.standard.removeObject(forKey: hasSeenIntroductionKey)
        UserDefaults.standard.removeObject(forKey: introductionVersionKey)
        shouldShowIntroduction = true
    }
    
    /// Alias for reset
    func resetForTesting() {
        reset()
    }
}

// MARK: - View Modifier for Automatic Introduction

struct ShowIntroductionOnFirstLaunchModifier: ViewModifier {
    @StateObject private var manager = IntroductionManager.shared
    
    func body(content: Content) -> some View {
        content
            .fullScreenCover(isPresented: $manager.shouldShowIntroduction) {
                ApertureIntroductionView {
                    manager.markIntroductionAsSeen()
                }
            }
    }
}

extension View {
    /// Automatically shows the introduction on first launch
    func withFirstLaunchIntroduction() -> some View {
        modifier(ShowIntroductionOnFirstLaunchModifier())
    }
}

// MARK: - Preview Helper

#Preview("Test Introduction Flow") {
    Text("Main App Content")
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hex: "#0a0a1a"))
        .withFirstLaunchIntroduction()
        .onAppear {
            // Reset for preview testing
            IntroductionManager.shared.resetForTesting()
        }
}
