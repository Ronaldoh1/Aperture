// AlexandriaRouter.swift

import Foundation

enum AlexandriaRoute {
  case resource(String)
  case category(String)
}

final class AlexandriaRouter: AlexandriaRouterType {
  private let onRoute: (AlexandriaRoute) -> Void

  init(onRoute: @escaping (AlexandriaRoute) -> Void) {
    self.onRoute = onRoute
  }

  func navigate(to route: AlexandriaRoute) {
    onRoute(route)
  }
}
