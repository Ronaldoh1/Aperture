// CosmosRouter.swift

import Foundation

enum CosmosRoute {
  case detail
  case share
}

final class CosmosRouter: CosmosRouterType {
  private let onRoute: (CosmosRoute) -> Void

  init(onRoute: @escaping (CosmosRoute) -> Void) {
    self.onRoute = onRoute
  }

  func navigate(to route: CosmosRoute) {
    onRoute(route)
  }
}
