// AuthRouter.swift

import Foundation

enum AuthRoute {
  case landing
  case tutorial
}

final class AuthRouter: AuthRouterType {
  private let onRoute: (AuthRoute) -> Void

  init(onRoute: @escaping (AuthRoute) -> Void) {
    self.onRoute = onRoute
  }

  func navigate(to route: AuthRoute) {
    onRoute(route)
  }
}
