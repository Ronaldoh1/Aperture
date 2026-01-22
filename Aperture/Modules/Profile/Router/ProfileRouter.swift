// ProfileRouter.swift

import Foundation

enum ProfileRoute {
    case auth
    case settings
}

final class ProfileRouter: ProfileRouterType {
    
    private let onRoute: (ProfileRoute) -> Void
    
    init(onRoute: @escaping (ProfileRoute) -> Void) {
        self.onRoute = onRoute
    }
    
    func navigate(to route: ProfileRoute) {
        onRoute(route)
    }
}
