// ApertureApp.swift

import SwiftUI
import FirebaseCore

@main
struct ApertureApp: App {

    @StateObject private var session = SessionStore()
    @StateObject private var tutorialState = TutorialStateStore()

    init() {
        _ = AppContainer.shared
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            AppRootView()
                .environmentObject(session)
                .environmentObject(tutorialState)
        }
    }

}
