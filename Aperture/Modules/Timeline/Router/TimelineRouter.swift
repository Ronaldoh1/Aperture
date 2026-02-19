// TimelineRouter.swift

import Foundation

enum TimelineRoute {
    case eraDetail(TimelineEra)
    case sources
}

final class TimelineRouter: TimelineRouterType {
    
    private let onRoute: (TimelineRoute) -> Void
    
    init(onRoute: @escaping (TimelineRoute) -> Void) {
        self.onRoute = onRoute
    }
    
    func navigate(to route: TimelineRoute) {
        onRoute(route)
    }
}
