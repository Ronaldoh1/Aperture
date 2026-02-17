// Aperture/App/AppRootView.swift

import SwiftUI

struct AppRootView: View {
  @EnvironmentObject private var session: SessionStore
  @EnvironmentObject private var tutorialState: TutorialStateStore
  @StateObject private var journeyStore = UserJourneyStore.shared
  @StateObject private var guestManager = GuestModeManager.shared
  @StateObject private var introManager = IntroductionManager.shared
  @StateObject private var legalGateManager = LegalGateManager.shared

  @State private var authStartInSignUp = false
  @State private var showGuestPreview = false
  @State private var showLaunchAnimation = true

  var body: some View {
    ZStack {
      // Launch animation (shows first, then fades out)
      if showLaunchAnimation {
        LaunchAnimationView {
          withAnimation(.easeOut(duration: 0.4)) {
            showLaunchAnimation = false
          }
        }
        .transition(.opacity)
        .zIndex(2000)
      }

      // Legal gate must be cleared first
      if legalGateManager.showLegalGate && !showLaunchAnimation {
        LegalGateView()
          .transition(.opacity)
          .zIndex(1000)
      } else if !showLaunchAnimation {
        // Main content
        mainContent

        // Introduction overlay (shows on first launch)
        if introManager.shouldShowIntroduction {
          ApertureIntroductionView {
            // When introduction completes, also mark onboarding as done
            // so we skip the old quiz flow
            introManager.markIntroductionAsSeen()
            journeyStore.completeOnboardingWithDefaults()
            guestManager.markWelcomeSeen()
          }
          .transition(.opacity)
          .zIndex(999)
        }
      }
    }
    .animation(.easeInOut(duration: 0.3), value: introManager.shouldShowIntroduction)
    .animation(.easeInOut(duration: 0.3), value: legalGateManager.showLegalGate)
    .animation(.easeInOut(duration: 0.4), value: showLaunchAnimation)
    .withShakeFeedback()
  }

  @ViewBuilder
  private var mainContent: some View {
    if session.isBootstrapping || tutorialState.isBootstrapping {
      let _ = print("🟠 AppRootView: Showing LoadingOverlay (bootstrapping)")
      LoadingOverlay(message: "Opening the aperture…")

    } else if !introManager.hasSeenIntroduction {
      // If user hasn't seen introduction, show loading while intro displays
      // This prevents the old onboarding from flashing behind
      LoadingOverlay(message: "Opening the aperture…")

    } else if showGuestPreview || (guestManager.isGuestMode && !session.isAuthenticated) {
      // Guest mode - show sample content preview
      let _ = print("🟠 AppRootView: Showing GuestPreviewView")
      GuestPreviewView(
        onSignUp: {
          showGuestPreview = false
          guestManager.exitGuestMode()
          authStartInSignUp = true
        },
        onContinueAsGuest: {
          guestManager.enterGuestMode()
          showGuestPreview = false
        }
      )

    } else if session.isAuthenticated {
      let _ = print("🟠 AppRootView: Showing RootTabView (authenticated)")
      RootTabView()
        .environmentObject(journeyStore)
        .environmentObject(guestManager)

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
      print("🟠 AppRootView: Tutorial route - resetting onboarding")
      journeyStore.resetForDebug()
      tutorialState.resetForDebug()
      guestManager.reset()
      introManager.reset()
    }
  }
}
