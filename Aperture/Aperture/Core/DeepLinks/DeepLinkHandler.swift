// DeepLinkHandler.swift
// Handle deep links and universal links for Aperture
// Navigate to courses, lessons, and features from external sources

import SwiftUI
import Foundation

// MARK: - Deep Link Types

enum DeepLink: Equatable {
    case course(id: String)
    case lesson(courseId: String, lessonId: String)
    case dragon
    case cosmos
    case timeline
    case alexandria
    case profile
    case streak
    case achievement(id: String)
    case invite(referralCode: String?)
    
    // Custom scheme: aperture://
    // Universal link: https://aperture.app/
}

// MARK: - Deep Link Handler

final class DeepLinkHandler: ObservableObject {
    
    static let shared = DeepLinkHandler()
    
    @Published var pendingDeepLink: DeepLink?
    @Published var showDeepLinkDestination: Bool = false
    
    private init() {}
    
    // MARK: - Handle URL
    
    /// Handle incoming URL (called from App or SceneDelegate)
    func handle(url: URL) -> Bool {
        print("🔗 Handling deep link: \(url)")
        
        // Try custom scheme first (aperture://)
        if let deepLink = parseCustomScheme(url) {
            navigate(to: deepLink)
            return true
        }
        
        // Try universal link (https://aperture.app/)
        if let deepLink = parseUniversalLink(url) {
            navigate(to: deepLink)
            return true
        }
        
        print("🔗 Could not parse deep link: \(url)")
        return false
    }
    
    // MARK: - Parse Custom Scheme
    // aperture://course/dragon-ball
    // aperture://lesson/dragon-ball/lesson-1
    // aperture://dragon
    
    private func parseCustomScheme(_ url: URL) -> DeepLink? {
        guard url.scheme == "aperture" else { return nil }
        
        let host = url.host ?? ""
        let pathComponents = url.pathComponents.filter { $0 != "/" }
        
        switch host {
        case "course":
            if let courseId = pathComponents.first {
                return .course(id: courseId)
            }
        case "lesson":
            if pathComponents.count >= 2 {
                return .lesson(courseId: pathComponents[0], lessonId: pathComponents[1])
            }
        case "dragon":
            return .dragon
        case "cosmos":
            return .cosmos
        case "timeline":
            return .timeline
        case "alexandria":
            return .alexandria
        case "profile":
            return .profile
        case "streak":
            return .streak
        case "achievement":
            if let achievementId = pathComponents.first {
                return .achievement(id: achievementId)
            }
        case "invite":
            let referralCode = pathComponents.first
            return .invite(referralCode: referralCode)
        default:
            break
        }
        
        return nil
    }
    
    // MARK: - Parse Universal Link
    // https://aperture.app/course/dragon-ball
    // https://aperture.app/share/dragon
    
    private func parseUniversalLink(_ url: URL) -> DeepLink? {
        guard let host = url.host,
              host.contains("aperture.app") || host.contains("aperture") else {
            return nil
        }
        
        let pathComponents = url.pathComponents.filter { $0 != "/" }
        guard !pathComponents.isEmpty else { return nil }
        
        let action = pathComponents[0]
        let remaining = Array(pathComponents.dropFirst())
        
        switch action {
        case "course":
            if let courseId = remaining.first {
                return .course(id: courseId)
            }
        case "lesson":
            if remaining.count >= 2 {
                return .lesson(courseId: remaining[0], lessonId: remaining[1])
            }
        case "dragon", "companion":
            return .dragon
        case "cosmos":
            return .cosmos
        case "timeline":
            return .timeline
        case "alexandria", "library":
            return .alexandria
        case "profile", "me":
            return .profile
        case "streak":
            return .streak
        case "achievement":
            if let achievementId = remaining.first {
                return .achievement(id: achievementId)
            }
        case "invite", "join":
            let referralCode = remaining.first ?? url.queryParameter("ref")
            return .invite(referralCode: referralCode)
        case "share":
            // /share/dragon, /share/streak, etc.
            if let shareType = remaining.first {
                switch shareType {
                case "dragon": return .dragon
                case "streak": return .streak
                case "course": 
                    if remaining.count >= 2 {
                        return .course(id: remaining[1])
                    }
                default: break
                }
            }
        default:
            break
        }
        
        return nil
    }
    
    // MARK: - Navigate
    
    func navigate(to deepLink: DeepLink) {
        DispatchQueue.main.async {
            self.pendingDeepLink = deepLink
            self.showDeepLinkDestination = true
            
            // Post notification for views to handle
            NotificationCenter.default.post(
                name: .deepLinkReceived,
                object: deepLink
            )
        }
    }
    
    /// Clear pending deep link after handling
    func clearPendingDeepLink() {
        pendingDeepLink = nil
        showDeepLinkDestination = false
    }
    
    // MARK: - Generate Links
    
    /// Generate shareable deep link
    static func generateLink(for deepLink: DeepLink) -> URL? {
        let baseURL = "https://aperture.app"
        
        let path: String
        switch deepLink {
        case .course(let id):
            path = "/course/\(id)"
        case .lesson(let courseId, let lessonId):
            path = "/lesson/\(courseId)/\(lessonId)"
        case .dragon:
            path = "/dragon"
        case .cosmos:
            path = "/cosmos"
        case .timeline:
            path = "/timeline"
        case .alexandria:
            path = "/alexandria"
        case .profile:
            path = "/profile"
        case .streak:
            path = "/streak"
        case .achievement(let id):
            path = "/achievement/\(id)"
        case .invite(let code):
            if let code = code {
                path = "/invite?ref=\(code)"
            } else {
                path = "/invite"
            }
        }
        
        return URL(string: baseURL + path)
    }
}

// MARK: - URL Extension

extension URL {
    func queryParameter(_ name: String) -> String? {
        guard let components = URLComponents(url: self, resolvingAgainstBaseURL: true) else {
            return nil
        }
        return components.queryItems?.first(where: { $0.name == name })?.value
    }
}

// MARK: - Notification Names

extension Notification.Name {
    static let deepLinkReceived = Notification.Name("deepLinkReceived")
}

// MARK: - SwiftUI View Modifier

struct DeepLinkModifier: ViewModifier {
    @ObservedObject var handler = DeepLinkHandler.shared
    let onDeepLink: (DeepLink) -> Void
    
    func body(content: Content) -> some View {
        content
            .onReceive(NotificationCenter.default.publisher(for: .deepLinkReceived)) { notification in
                if let deepLink = notification.object as? DeepLink {
                    onDeepLink(deepLink)
                }
            }
            .onOpenURL { url in
                _ = handler.handle(url: url)
            }
    }
}

extension View {
    func handleDeepLinks(_ handler: @escaping (DeepLink) -> Void) -> some View {
        modifier(DeepLinkModifier(onDeepLink: handler))
    }
}

// MARK: - Deep Link Coordinator (for Navigation)

class DeepLinkCoordinator: ObservableObject {
    
    @Published var selectedTab: AppTab = .awakening
    @Published var courseToOpen: String?
    @Published var lessonToOpen: (courseId: String, lessonId: String)?
    @Published var showDragon: Bool = false
    
    func handle(_ deepLink: DeepLink) {
        switch deepLink {
        case .course(let id):
            selectedTab = .awakening
            courseToOpen = id
            
        case .lesson(let courseId, let lessonId):
            selectedTab = .awakening
            lessonToOpen = (courseId, lessonId)
            
        case .dragon:
            selectedTab = .awakening
            showDragon = true
            
        case .cosmos:
            selectedTab = .cosmos
            
        case .timeline:
            selectedTab = .timeline
            
        case .alexandria:
            selectedTab = .alexandria
            
        case .profile:
            selectedTab = .more
            
        case .streak, .achievement:
            selectedTab = .more
            
        case .invite:
            // Handle referral
            break
        }
    }
}

enum AppTab: String {
    case awakening
    case cosmos
    case timeline
    case alexandria
    case more
}

// MARK: - Usage Examples
/*
 
 // 1. In your App.swift:
 @main
 struct ApertureApp: App {
     var body: some Scene {
         WindowGroup {
             ContentView()
                 .onOpenURL { url in
                     DeepLinkHandler.shared.handle(url: url)
                 }
         }
     }
 }
 
 // 2. In a view that handles navigation:
 struct RootView: View {
     @StateObject private var coordinator = DeepLinkCoordinator()
     
     var body: some View {
         TabView(selection: $coordinator.selectedTab) {
             // tabs...
         }
         .handleDeepLinks { deepLink in
             coordinator.handle(deepLink)
         }
     }
 }
 
 // 3. Generate a shareable link:
 let shareURL = DeepLinkHandler.generateLink(for: .course(id: "dragon-ball"))
 // https://aperture.app/course/dragon-ball
 
 // 4. Test with URLs:
 // aperture://course/dragon-ball
 // aperture://dragon
 // https://aperture.app/course/consciousness-phd
 // https://aperture.app/invite?ref=ABC123
 
 */
