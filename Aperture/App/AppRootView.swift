// AppRootView.swift

import SwiftUI

struct AppRootView: View {

    @EnvironmentObject private var session: SessionStore
    @EnvironmentObject private var tutorialState: TutorialStateStore

    @State private var authStartInSignUp: Bool = false

    var body: some View {

        if session.isBootstrapping || tutorialState.isBootstrapping {

            LoadingOverlay(message: "Opening the aperture…")

        } else if tutorialState.hasSeenTutorial == false {

            TutorialEntryView(store: tutorialState) { route in

                switch route {

                case .authStartSignUp:
                    authStartInSignUp = true

                case .authStartSignIn:
                    authStartInSignUp = false

                case .main:
                    break
                }
            }

        } else if session.isAuthenticated {

            RootTabView()

        } else {

            AuthEntryView(
                container: AppContainer.shared.container,
                startInSignUp: authStartInSignUp
            )
        }
    }

}
