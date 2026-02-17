// CosmosEntryView.swift

import SwiftUI
import Swinject

struct CosmosEntryView: View {
  private let presenter: CosmosPresenterType

  init(container: Container, onRoute: @escaping (CosmosRoute) -> Void) {
    print("🟡 CosmosEntryView: Starting initialization")

    // Register the router
    let router = CosmosRouter(onRoute: onRoute)
    container.register(CosmosRouterType.self) { _ in router }
    print("🟡 CosmosEntryView: Router registered")

    // Resolve the presenter
    presenter = container.resolve(CosmosPresenterType.self)!
    print("🟡 CosmosEntryView: Presenter resolved")

    // Resolve interactor to trigger wiring
    _ = container.resolve(CosmosInteractorType.self)!
    print(
      "🟡 CosmosEntryView: Interactor wired, interactor is \(presenter.interactor != nil ? "set ✓" : "NIL ❌")"
    )
  }

  var body: some View {
    CosmosView(presenter: presenter)
  }
}
