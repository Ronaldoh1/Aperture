// Aperture/App/AppRootView.swift

import SwiftUI


struct AppRootView: View {

    @EnvironmentObject private var session: SessionStore
    @EnvironmentObject private var tutorialState: TutorialStateStore

    @State private var authStartInSignUp = false

    var body: some View {

        if session.isBootstrapping || tutorialState.isBootstrapping {
            
            let _ = print("🟠 AppRootView: Showing LoadingOverlay (bootstrapping)")
            LoadingOverlay(message: "Opening the aperture…")

        } else if tutorialState.hasSeenTutorial == false {
            
            let _ = print("🟠 AppRootView: Showing TutorialEntryView")
            TutorialEntryView(store: tutorialState) { route in
                switch route {
                case .authStartSignUp:
                    authStartInSignUp = true
                case .authStartSignIn:
                    authStartInSignUp = false
                case .landing:
                    break
                }
            }

        } else if session.isAuthenticated {
            
            let _ = print("🟠 AppRootView: Showing RootTabView (authenticated)")
            RootTabView()

        } else {
            
            let _ = print("🟠 AppRootView: Showing AuthEntryView (not authenticated)")
            AuthEntryView(
                container: AppContainer.shared.container,
                startInSignUp: authStartInSignUp,
                onRoute: handleAuthRoute
            )
        }
    }

    private func handleAuthRoute(_ route: AuthRoute) {
        print("🟠 AppRootView: Handling auth route: \(route)")
        switch route {
        case .landing:
            print("🟠 AppRootView: Landing route - waiting for SessionStore to update")
            authStartInSignUp = false
        case .tutorial:
            print("🟠 AppRootView: Tutorial route - resetting tutorial state")
            tutorialState.resetForDebug()
        }
    }
}
