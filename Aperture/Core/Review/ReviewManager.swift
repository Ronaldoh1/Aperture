// ReviewManager.swift
// Smart in-app review prompts for App Store ratings
// Shows review prompt at optimal moments

import StoreKit
import SwiftUI

// MARK: - Review Manager

final class ReviewManager {
    
    static let shared = ReviewManager()
    
    // MARK: - Configuration
    
    /// Minimum sessions before showing review
    private let minSessionsForReview = 5
    
    /// Minimum completed lessons before showing review
    private let minLessonsForReview = 3
    
    /// Days between review prompts
    private let daysBetweenPrompts = 90
    
    /// Maximum reviews to request per year (Apple limits to 3)
    private let maxReviewsPerYear = 3
    
    // MARK: - Keys
    
    private let sessionCountKey = "review_session_count"
    private let lessonsCompletedKey = "review_lessons_completed"
    private let lastReviewDateKey = "review_last_prompt_date"
    private let reviewCountThisYearKey = "review_count_this_year"
    private let yearKey = "review_year"
    
    private init() {
        incrementSessionCount()
        checkYearReset()
    }
    
    // MARK: - Tracking
    
    /// Call when app launches
    private func incrementSessionCount() {
        let current = UserDefaults.standard.integer(forKey: sessionCountKey)
        UserDefaults.standard.set(current + 1, forKey: sessionCountKey)
    }
    
    /// Call when a lesson is completed
    func lessonCompleted() {
        let current = UserDefaults.standard.integer(forKey: lessonsCompletedKey)
        UserDefaults.standard.set(current + 1, forKey: lessonsCompletedKey)
        
        // Check if this is a good moment for review
        checkAndRequestReview(trigger: .lessonCompleted)
    }
    
    /// Call when course is completed
    func courseCompleted() {
        checkAndRequestReview(trigger: .courseCompleted)
    }
    
    /// Call when dragon evolves
    func dragonEvolved() {
        checkAndRequestReview(trigger: .dragonEvolved)
    }
    
    /// Call when streak milestone reached
    func streakMilestone(_ days: Int) {
        if days == 7 || days == 30 || days == 100 {
            checkAndRequestReview(trigger: .streakMilestone)
        }
    }
    
    // MARK: - Review Logic
    
    private func checkAndRequestReview(trigger: ReviewTrigger) {
        guard shouldRequestReview(trigger: trigger) else {
            print("📝 Review not shown: criteria not met for \(trigger)")
            return
        }
        
        requestReview()
    }
    
    private func shouldRequestReview(trigger: ReviewTrigger) -> Bool {
        // Check session count
        let sessionCount = UserDefaults.standard.integer(forKey: sessionCountKey)
        guard sessionCount >= minSessionsForReview else {
            return false
        }
        
        // Check lessons completed
        let lessonsCompleted = UserDefaults.standard.integer(forKey: lessonsCompletedKey)
        guard lessonsCompleted >= minLessonsForReview else {
            return false
        }
        
        // Check time since last prompt
        if let lastReviewDate = UserDefaults.standard.object(forKey: lastReviewDateKey) as? Date {
            let daysSinceLastReview = Calendar.current.dateComponents([.day], from: lastReviewDate, to: Date()).day ?? 0
            guard daysSinceLastReview >= daysBetweenPrompts else {
                return false
            }
        }
        
        // Check yearly limit
        let reviewsThisYear = UserDefaults.standard.integer(forKey: reviewCountThisYearKey)
        guard reviewsThisYear < maxReviewsPerYear else {
            return false
        }
        
        // Higher priority triggers bypass some checks
        if trigger.priority >= 3 {
            return true
        }
        
        // Random factor to not show every time (60% chance)
        return Double.random(in: 0...1) < 0.6
    }
    
    private func requestReview() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            // iOS 16+ API
            if let scene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
                SKStoreReviewController.requestReview(in: scene)
            }
            
            // Record that we asked
            UserDefaults.standard.set(Date(), forKey: self.lastReviewDateKey)
            
            let currentCount = UserDefaults.standard.integer(forKey: self.reviewCountThisYearKey)
            UserDefaults.standard.set(currentCount + 1, forKey: self.reviewCountThisYearKey)
            
            print("📝 Review prompt shown")
        }
    }
    
    private func checkYearReset() {
        let currentYear = Calendar.current.component(.year, from: Date())
        let storedYear = UserDefaults.standard.integer(forKey: yearKey)
        
        if storedYear != currentYear {
            UserDefaults.standard.set(currentYear, forKey: yearKey)
            UserDefaults.standard.set(0, forKey: reviewCountThisYearKey)
        }
    }
    
    // MARK: - Manual Request (Settings)
    
    /// Call from settings "Rate App" button
    func openAppStoreForReview() {
        let appId = "YOUR_APP_ID" // Replace with actual App Store ID
        if let url = URL(string: "https://apps.apple.com/app/id\(appId)?action=write-review") {
            UIApplication.shared.open(url)
        }
    }
    
    // MARK: - Debug
    
    #if DEBUG
    func resetForTesting() {
        UserDefaults.standard.removeObject(forKey: sessionCountKey)
        UserDefaults.standard.removeObject(forKey: lessonsCompletedKey)
        UserDefaults.standard.removeObject(forKey: lastReviewDateKey)
        UserDefaults.standard.removeObject(forKey: reviewCountThisYearKey)
        print("📝 Review tracking reset")
    }
    
    func forceShowReview() {
        requestReview()
    }
    #endif
}

// MARK: - Review Trigger

enum ReviewTrigger {
    case lessonCompleted
    case courseCompleted
    case dragonEvolved
    case streakMilestone
    case achievementUnlocked
    case generic
    
    var priority: Int {
        switch self {
        case .courseCompleted: return 5
        case .dragonEvolved: return 4
        case .streakMilestone: return 3
        case .achievementUnlocked: return 3
        case .lessonCompleted: return 2
        case .generic: return 1
        }
    }
}

// MARK: - Feedback Collection (Alternative to Review)

struct FeedbackManager {
    
    static func sendFeedback(
        type: FeedbackType,
        message: String,
        email: String? = nil
    ) {
        // In production, send to your backend or Firebase
        print("📨 Feedback received:")
        print("   Type: \(type)")
        print("   Message: \(message)")
        print("   Email: \(email ?? "not provided")")
        
        // Could send to:
        // - Firebase Analytics custom event
        // - Backend API
        // - Email
    }
    
    enum FeedbackType: String {
        case bug = "Bug Report"
        case feature = "Feature Request"
        case content = "Content Suggestion"
        case general = "General Feedback"
    }
}

// MARK: - SwiftUI Feedback Sheet

struct FeedbackSheet: View {
    @Environment(\.dismiss) var dismiss
    @State private var feedbackType: FeedbackManager.FeedbackType = .general
    @State private var message: String = ""
    @State private var email: String = ""
    @State private var showThankYou = false
    
    var body: some View {
        NavigationView {
            Form {
                Section("What type of feedback?") {
                    Picker("Type", selection: $feedbackType) {
                        Text("Bug Report").tag(FeedbackManager.FeedbackType.bug)
                        Text("Feature Request").tag(FeedbackManager.FeedbackType.feature)
                        Text("Content Suggestion").tag(FeedbackManager.FeedbackType.content)
                        Text("General").tag(FeedbackManager.FeedbackType.general)
                    }
                    .pickerStyle(.menu)
                }
                
                Section("Your feedback") {
                    TextEditor(text: $message)
                        .frame(minHeight: 100)
                }
                
                Section("Email (optional)") {
                    TextField("your@email.com", text: $email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                }
                
                Section {
                    Button("Submit Feedback") {
                        FeedbackManager.sendFeedback(
                            type: feedbackType,
                            message: message,
                            email: email.isEmpty ? nil : email
                        )
                        showThankYou = true
                    }
                    .disabled(message.isEmpty)
                }
            }
            .navigationTitle("Send Feedback")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
            }
            .alert("Thank You! 🙏", isPresented: $showThankYou) {
                Button("OK") { dismiss() }
            } message: {
                Text("Your feedback helps us improve Aperture for everyone.")
            }
        }
    }
}

// MARK: - Rate App Button (for Settings)

struct RateAppButton: View {
    var body: some View {
        Button(action: {
            ReviewManager.shared.openAppStoreForReview()
        }) {
            HStack {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                Text("Rate Aperture")
                Spacer()
                Image(systemName: "arrow.up.right")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
    }
}

// MARK: - Usage Examples
/*
 
 // 1. Track lesson completion:
 func completeLesson() {
     // ... lesson logic ...
     ReviewManager.shared.lessonCompleted()
 }
 
 // 2. Track course completion:
 func completeCourse() {
     // ... course logic ...
     ReviewManager.shared.courseCompleted()
 }
 
 // 3. Track dragon evolution:
 func evolveDragon() {
     // ... evolution logic ...
     ReviewManager.shared.dragonEvolved()
 }
 
 // 4. Track streak milestones:
 func updateStreak(to days: Int) {
     ReviewManager.shared.streakMilestone(days)
 }
 
 // 5. In Settings view:
 RateAppButton()
 
 Button("Send Feedback") {
     showFeedbackSheet = true
 }
 .sheet(isPresented: $showFeedbackSheet) {
     FeedbackSheet()
 }
 
 // 6. Debug (only in DEBUG builds):
 #if DEBUG
 Button("Test Review Prompt") {
     ReviewManager.shared.forceShowReview()
 }
 
 Button("Reset Review Tracking") {
     ReviewManager.shared.resetForTesting()
 }
 #endif
 
 */
