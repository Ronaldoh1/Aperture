// AuthEntryView.swift

import SwiftUI
import Swinject

struct AuthEntryView: View {

    let container: Container
    let startInSignUp: Bool
    let onRoute: (AuthRoute) -> Void

    init(
        container: Container,
        startInSignUp: Bool = false,
        onRoute: @escaping (AuthRoute) -> Void
    ) {
        self.container = container
        self.startInSignUp = startInSignUp
        self.onRoute = onRoute
    }

    var body: some View {

        let router = AuthRouter(onRoute: onRoute)

        let presenter: AuthPresenterType = {
            if let resolved = container.resolve(AuthPresenterType.self) {
                resolved.router = router
                return resolved
            } else {
                return AuthPresenter(router: router)
            }
        }()

        // Force interactor resolution so presenter.interactor is assigned.
        _ = container.resolve(AuthInteractor.self)

        return AuthView(presenter: presenter, startInSignUp: startInSignUp)

    }

}
