// AuthEntryView.swift

import SwiftUI
import Swinject

struct AuthEntryView: View {
  let startInSignUp: Bool
  private let presenter: AuthPresenterType

  init(container: Container, startInSignUp: Bool, onRoute: @escaping (AuthRoute) -> Void) {
    self.startInSignUp = startInSignUp

    print("🟡 AuthEntryView: Starting initialization")

    // Register the router with the actual onRoute closure
    let router = AuthRouter(onRoute: onRoute)
    container.register(AuthRouterType.self) { _ in router }
    print("🟡 AuthEntryView: Router registered")

    // Resolve the presenter
    presenter = container.resolve(AuthPresenterType.self)!
    print("🟡 AuthEntryView: Presenter resolved, interactor before: \(presenter.interactor != nil)")

    // CRITICAL: Resolve the interactor to trigger the assembly wiring
    _ = container.resolve(AuthInteractorType.self)!
    print("🟡 AuthEntryView: Interactor resolved, interactor after: \(presenter.interactor != nil)")
  }

  var body: some View {
    AuthView(presenter: presenter, startInSignUp: startInSignUp)
  }
}
