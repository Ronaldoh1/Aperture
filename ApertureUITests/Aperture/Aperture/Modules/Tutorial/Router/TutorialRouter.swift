// TutorialRouter.swift

import Foundation

final class TutorialRouter: TutorialRouterType {

    private let onRoute: (TutorialRoute) -> Void

    init(onRoute: @escaping (TutorialRoute) -> Void) {
        self.onRoute = onRoute
    }

    func navigate(to route: TutorialRoute) {
        onRoute(route)
    }

}
