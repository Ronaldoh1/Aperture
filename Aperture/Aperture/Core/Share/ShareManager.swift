// ShareManager.swift
// Sharing functionality for Aperture
// Share progress, courses, and achievements

import SwiftUI
import UIKit

// MARK: - Share Manager

final class ShareManager {
    
    static let shared = ShareManager()
    
    private init() {}
    
    // MARK: - Share Content Types
    
    /// Share course with others
    func shareCourse(_ course: ShareableCourse, from view: UIView? = nil) {
        let text = """
        🌟 I'm learning "\(course.title)" on Aperture!
        
        \(course.description)
        
        Join me on the awakening journey 🐉
        """
        
        let url = URL(string: "https://aperture.app/course/\(course.id)")
        
        share(
            items: [text, url as Any].compactMap { $0 },
            from: view
        )
    }
    
    /// Share learning streak
    func shareStreak(_ days: Int, from view: UIView? = nil) {
        let text = """
        🔥 \(days) Day Learning Streak on Aperture!
        
        I've been expanding my consciousness for \(days) days straight. 
        What are you learning?
        
        #Aperture #Awakening #Learning
        """
        
        share(items: [text], from: view)
    }
    
    /// Share achievement
    func shareAchievement(_ achievement: ShareableAchievement, from view: UIView? = nil) {
        let text = """
        🏆 Achievement Unlocked: \(achievement.title)
        
        \(achievement.description)
        
        Earned on Aperture - The Awakening App 🐉
        """
        
        // Create achievement image if available
        if let image = createAchievementImage(achievement) {
            share(items: [text, image], from: view)
        } else {
            share(items: [text], from: view)
        }
    }
    
    /// Share dragon companion progress
    func shareDragonProgress(_ dragon: ShareableDragon, from view: UIView? = nil) {
        let text = """
        🐉 My Dragon Companion: \(dragon.name)
        
        Stage: \(dragon.stageName)
        XP: \(dragon.xp)
        
        Growing together on Aperture!
        """
        
        share(items: [text], from: view)
    }
    
    /// Share course completion
    func shareCourseCompletion(_ course: ShareableCourse, from view: UIView? = nil) {
        let text = """
        ✅ Course Completed: \(course.title)
        
        Just finished learning about \(course.description)!
        
        Another step on the awakening journey 🌟
        
        #Aperture #Learning #Growth
        """
        
        share(items: [text], from: view)
    }
    
    /// Share app invitation
    func shareAppInvite(from view: UIView? = nil) {
        let text = """
        👁️ Discover Aperture - Awaken Your Consciousness
        
        An app for those ready to see beyond the matrix.
        Learn what they didn't teach you in school.
        
        🐉 Dragon Companion
        📚 Courses on consciousness, money, truth
        🌌 Cosmic timeline of awakening
        
        Download: https://aperture.app
        """
        
        let url = URL(string: "https://apps.apple.com/app/aperture")
        
        share(items: [text, url as Any].compactMap { $0 }, from: view)
    }
    
    // MARK: - Core Share Function
    
    private func share(items: [Any], from sourceView: UIView? = nil) {
        let activityVC = UIActivityViewController(
            activityItems: items,
            applicationActivities: nil
        )
        
        // Exclude some activity types if desired
        activityVC.excludedActivityTypes = [
            .addToReadingList,
            .assignToContact,
            .openInIBooks
        ]
        
        // For iPad - need source view/rect
        if let popover = activityVC.popoverPresentationController {
            if let sourceView = sourceView {
                popover.sourceView = sourceView
                popover.sourceRect = sourceView.bounds
            } else {
                // Fallback for iPad
                popover.sourceView = UIApplication.shared.windows.first?.rootViewController?.view
                popover.sourceRect = CGRect(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.midY, width: 0, height: 0)
                popover.permittedArrowDirections = []
            }
        }
        
        // Present
        DispatchQueue.main.async {
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let rootVC = windowScene.windows.first?.rootViewController {
                var topVC = rootVC
                while let presented = topVC.presentedViewController {
                    topVC = presented
                }
                topVC.present(activityVC, animated: true)
            }
        }
    }
    
    // MARK: - Image Generation
    
    private func createAchievementImage(_ achievement: ShareableAchievement) -> UIImage? {
        // Create a shareable image for the achievement
        let size = CGSize(width: 600, height: 400)
        
        let renderer = UIGraphicsImageRenderer(size: size)
        return renderer.image { context in
            // Background
            let gradient = CGGradient(
                colorsSpace: CGColorSpaceCreateDeviceRGB(),
                colors: [
                    UIColor(red: 0.05, green: 0.02, blue: 0.15, alpha: 1).cgColor,
                    UIColor(red: 0.1, green: 0.05, blue: 0.25, alpha: 1).cgColor
                ] as CFArray,
                locations: [0, 1]
            )!
            
            context.cgContext.drawLinearGradient(
                gradient,
                start: .zero,
                end: CGPoint(x: 0, y: size.height),
                options: []
            )
            
            // Achievement icon
            let iconFont = UIFont.systemFont(ofSize: 80)
            let iconText = NSAttributedString(
                string: achievement.icon,
                attributes: [.font: iconFont]
            )
            iconText.draw(at: CGPoint(x: (size.width - iconText.size().width) / 2, y: 80))
            
            // Title
            let titleFont = UIFont.systemFont(ofSize: 32, weight: .bold)
            let titleText = NSAttributedString(
                string: achievement.title,
                attributes: [
                    .font: titleFont,
                    .foregroundColor: UIColor.white
                ]
            )
            titleText.draw(at: CGPoint(x: (size.width - titleText.size().width) / 2, y: 200))
            
            // Aperture branding
            let brandFont = UIFont.systemFont(ofSize: 16, weight: .medium)
            let brandText = NSAttributedString(
                string: "APERTURE",
                attributes: [
                    .font: brandFont,
                    .foregroundColor: UIColor.white.withAlphaComponent(0.6)
                ]
            )
            brandText.draw(at: CGPoint(x: (size.width - brandText.size().width) / 2, y: 350))
        }
    }
}

// MARK: - Shareable Models

struct ShareableCourse {
    let id: String
    let title: String
    let description: String
}

struct ShareableAchievement {
    let title: String
    let description: String
    let icon: String
}

struct ShareableDragon {
    let name: String
    let stage: Int
    let xp: Int
    
    var stageName: String {
        switch stage {
        case 1: return "Naga (Cucumber)"
        case 2: return "Serpent"
        case 3: return "Dragon"
        case 4: return "Awakened"
        case 5: return "Enlightened"
        default: return "Unknown"
        }
    }
}

// MARK: - SwiftUI Share Button

struct ShareButton: View {
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: "square.and.arrow.up")
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(.white)
                .frame(width: 44, height: 44)
                .background(Color.white.opacity(0.1))
                .clipShape(Circle())
        }
        .accessibilityLabel("Share")
        .accessibilityHint("Double tap to share this content")
    }
}

// MARK: - Share Sheet View (SwiftUI Native)

struct ShareSheet: UIViewControllerRepresentable {
    let items: [Any]
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        UIActivityViewController(activityItems: items, applicationActivities: nil)
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {}
}

// MARK: - Usage Examples
/*
 
 // 1. Share a course
 ShareManager.shared.shareCourse(
     ShareableCourse(
         id: "dragon-ball",
         title: "Dragon Ball Awakening",
         description: "Discover the consciousness teachings hidden in Dragon Ball"
     )
 )
 
 // 2. Share streak
 ShareManager.shared.shareStreak(7)
 
 // 3. Share dragon
 ShareManager.shared.shareDragonProgress(
     ShareableDragon(name: "Spark", stage: 3, xp: 1500)
 )
 
 // 4. In SwiftUI view
 struct CourseView: View {
     var body: some View {
         HStack {
             // ... course content
             ShareButton {
                 ShareManager.shared.shareCourse(course)
             }
         }
     }
 }
 
 // 5. Using ShareLink (iOS 16+)
 ShareLink(
     item: "Check out Aperture!",
     preview: SharePreview("Aperture - Awakening App", image: Image("AppIcon"))
 )
 
 */
