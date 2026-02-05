// GodModeManager.swift
// Secret access manager for GodMode - The Monad's Reality OS
// Hidden by default. Activated by triple-tap on the Aperture Eye.

import SwiftUI
import Combine

// MARK: - GodMode Access State

@MainActor
class GodModeManager: ObservableObject {
    
    static let shared = GodModeManager()
    
    // MARK: - Published State
    
    @Published private(set) var isUnlocked: Bool = false
    @Published private(set) var isRevealing: Bool = false
    @Published var showGodModePortal: Bool = false
    
    // MARK: - Secret Tap Detection
    
    @Published var tapCount: Int = 0
    private var tapResetTimer: AnyCancellable?
    private let requiredTaps: Int = 3
    private let tapWindow: TimeInterval = 1.5
    
    // MARK: - Progress Tracking
    
    @Published var monadLevel: Int = 1
    @Published var sparkIntensity: Double = 0.5
    @Published var realityShiftsCompleted: Int = 0
    @Published var dailyStreakDays: Int = 0
    
    // MARK: - Keys
    
    private let keys = (
        unlocked: "godmode.unlocked.v1",
        monadLevel: "godmode.monad.level.v1",
        sparkIntensity: "godmode.spark.intensity.v1",
        shiftsCompleted: "godmode.shifts.completed.v1",
        streakDays: "godmode.streak.days.v1",
        lastActive: "godmode.last.active.v1"
    )
    
    // MARK: - Initialization
    
    private init() {
        loadState()
    }
    
    // MARK: - Secret Tap Handler
    
    func handleSecretTap() {
        tapCount += 1
        
        // Reset timer
        tapResetTimer?.cancel()
        tapResetTimer = Timer.publish(every: tapWindow, on: .main, in: .common)
            .autoconnect()
            .first()
            .sink { [weak self] _ in
                self?.tapCount = 0
            }
        
        // Check if unlocked
        if tapCount >= requiredTaps {
            triggerUnlock()
        }
        
        // Haptic feedback for each tap
        if tapCount == requiredTaps {
            HapticManager.shared.heavy()
        } else {
            HapticManager.shared.light()
        }
    }
    
    // MARK: - Unlock Sequence
    
    private func triggerUnlock() {
        guard !isRevealing else { return }
        
        tapCount = 0
        tapResetTimer?.cancel()
        
        if !isUnlocked {
            // First time unlock - dramatic reveal
            isRevealing = true
            
            // Play unlock haptics sequence
            playUnlockHapticSequence()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) { [weak self] in
                self?.isUnlocked = true
                self?.isRevealing = false
                self?.saveState()
                
                // Show portal after reveal
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    self?.showGodModePortal = true
                }
            }
        } else {
            // Already unlocked - just show portal
            showGodModePortal = true
        }
    }
    
    private func playUnlockHapticSequence() {
        // 3-6-9 pattern haptics using HapticManager methods
        let lightDelays: [TimeInterval] = [0.0, 0.1, 0.2]
        let mediumDelays: [TimeInterval] = [0.5, 0.6, 0.7, 0.8, 0.9, 1.0]
        let heavyDelays: [TimeInterval] = [1.3, 1.4, 1.5, 1.6, 1.7, 1.8, 1.9, 2.0, 2.1]
        let rigidDelay: TimeInterval = 2.3
        
        for delay in lightDelays {
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                HapticManager.shared.light()
            }
        }
        
        for delay in mediumDelays {
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                HapticManager.shared.medium()
            }
        }
        
        for delay in heavyDelays {
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                HapticManager.shared.heavy()
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + rigidDelay) {
            HapticManager.shared.rigid()
        }
    }
    
    // MARK: - Progress Updates
    
    func completeRealityShift() {
        realityShiftsCompleted += 1
        updateSparkIntensity()
        checkLevelUp()
        saveState()
    }
    
    func recordDailyPractice() {
        let calendar = Calendar.current
        let lastActive = UserDefaults.standard.object(forKey: keys.lastActive) as? Date
        
        if let last = lastActive {
            if calendar.isDateInYesterday(last) {
                dailyStreakDays += 1
            } else if !calendar.isDateInToday(last) {
                dailyStreakDays = 1
            }
        } else {
            dailyStreakDays = 1
        }
        
        UserDefaults.standard.set(Date(), forKey: keys.lastActive)
        updateSparkIntensity()
        saveState()
    }
    
    private func updateSparkIntensity() {
        // Spark grows with practice
        let streakBonus = Double(min(dailyStreakDays, 30)) / 30.0 * 0.3
        let shiftsBonus = Double(min(realityShiftsCompleted, 100)) / 100.0 * 0.3
        let levelBonus = Double(monadLevel - 1) / 8.0 * 0.4
        
        sparkIntensity = min(1.0, 0.3 + streakBonus + shiftsBonus + levelBonus)
    }
    
    private func checkLevelUp() {
        // Level thresholds based on 3-6-9
        let thresholds = [3, 9, 18, 36, 63, 99, 144, 216, 369]
        
        for (index, threshold) in thresholds.enumerated() {
            if realityShiftsCompleted >= threshold && monadLevel <= index + 1 {
                monadLevel = index + 2
                HapticManager.shared.success()
            }
        }
    }
    
    // MARK: - Persistence
    
    private func loadState() {
        isUnlocked = UserDefaults.standard.bool(forKey: keys.unlocked)
        monadLevel = max(1, UserDefaults.standard.integer(forKey: keys.monadLevel))
        sparkIntensity = UserDefaults.standard.double(forKey: keys.sparkIntensity)
        if sparkIntensity == 0 { sparkIntensity = 0.5 }
        realityShiftsCompleted = UserDefaults.standard.integer(forKey: keys.shiftsCompleted)
        dailyStreakDays = UserDefaults.standard.integer(forKey: keys.streakDays)
    }
    
    private func saveState() {
        UserDefaults.standard.set(isUnlocked, forKey: keys.unlocked)
        UserDefaults.standard.set(monadLevel, forKey: keys.monadLevel)
        UserDefaults.standard.set(sparkIntensity, forKey: keys.sparkIntensity)
        UserDefaults.standard.set(realityShiftsCompleted, forKey: keys.shiftsCompleted)
        UserDefaults.standard.set(dailyStreakDays, forKey: keys.streakDays)
    }
    
    // MARK: - Reset (for testing)
    
    func resetGodMode() {
        isUnlocked = false
        monadLevel = 1
        sparkIntensity = 0.5
        realityShiftsCompleted = 0
        dailyStreakDays = 0
        saveState()
    }
}

// MARK: - Monad Level Names

extension GodModeManager {
    
    var monadLevelName: String {
        switch monadLevel {
        case 1: return "Spark Awakened"
        case 2: return "Light Bearer"
        case 3: return "Pattern Seer"
        case 4: return "Reality Weaver"
        case 5: return "Time Bender"
        case 6: return "Void Walker"
        case 7: return "Archon Breaker"
        case 8: return "Sovereign Mind"
        case 9: return "The Monad"
        default: return "Beyond Form"
        }
    }
    
    var nextLevelThreshold: Int {
        let thresholds = [3, 9, 18, 36, 63, 99, 144, 216, 369]
        let index = min(monadLevel - 1, thresholds.count - 1)
        return thresholds[index]
    }
}
