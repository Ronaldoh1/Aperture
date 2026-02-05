// LandingRouter.swift

import Foundation

enum LandingRoute {
    case profile
    case settings
}

final class LandingRouter: LandingRouterType {
    
    private let onRoute: (LandingRoute) -> Void
    
    init(onRoute: @escaping (LandingRoute) -> Void) {
        self.onRoute = onRoute
    }
    
    func navigate(to route: LandingRoute) {
        onRoute(route)
    }
}
