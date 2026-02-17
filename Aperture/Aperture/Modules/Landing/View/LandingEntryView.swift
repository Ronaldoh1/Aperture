// LandingEntryView.swift

import SwiftUI
import Swinject

struct LandingEntryView: View {
  private let presenter: LandingPresenterType
  @Binding var selectedTab: Int
  @ObservedObject private var journeyStore = UserJourneyStore.shared

  init(container: Container, selectedTab: Binding<Int>, onRoute: @escaping (LandingRoute) -> Void) {
    print("🟡 LandingEntryView: Starting initialization")

    _selectedTab = selectedTab

    // Register the router
    let router = LandingRouter(onRoute: onRoute)
    container.register(LandingRouterType.self) { _ in router }
    print("🟡 LandingEntryView: Router registered")

    // Resolve the presenter
    presenter = container.resolve(LandingPresenterType.self)!
    print("🟡 LandingEntryView: Presenter resolved")

    // Resolve interactor to trigger wiring
    _ = container.resolve(LandingInteractorType.self)!
    print(
      "🟡 LandingEntryView: Interactor wired, interactor is \(presenter.interactor != nil ? "set ✓" : "NIL ❌")"
    )
  }

  var body: some View {
    // Use personalized landing if user completed onboarding with a journey type
    if journeyStore.hasCompletedOnboarding && journeyStore.journeyType != nil {
      PersonalizedLandingView(
        journeyStore: journeyStore,
        selectedTab: $selectedTab
      )
    } else {
      // Fallback to original landing (shouldn't happen after onboarding)
      LandingView(presenter: presenter, selectedTab: $selectedTab)
    }
  }
}
