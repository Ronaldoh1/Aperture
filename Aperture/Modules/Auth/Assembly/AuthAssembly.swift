// AuthAssembly.swift

import Swinject
import SwiftUI

final class AuthAssembly: Assembly {

    func assemble(container: Container) {

        container.register(AuthRouterType.self) { _ in

            AuthRouter()

        }
        .inObjectScope(.container)

        container.register(AuthPresenterType.self) { resolver in

            guard let router = resolver.resolve(AuthRouterType.self) else {

                fatalError("AuthRouterType dependency not resolved")

            }

            return AuthPresenter(router: router)

        }
        .inObjectScope(.transient)

        container.register(AuthInteractor.self) { resolver in

            guard
                let authService = resolver.resolve(AuthServiceType.self),
                let currentUser = resolver.resolve(CurrentUserType.self),
                let presenter = resolver.resolve(AuthPresenterType.self)
            else {

                fatalError("AuthInteractor dependencies not resolved")

            }

            let interactor = AuthInteractor(authService: authService, currentUser: currentUser)
            interactor.output = presenter as? AuthInteractorOutputType
            presenter.interactor = interactor

            return interactor

        }
        .inObjectScope(.transient)

        container.register(AuthView.self) { resolver in

            guard let presenter = resolver.resolve(AuthPresenterType.self) else {

                fatalError("AuthPresenterType dependency not resolved")

            }

            return AuthView(presenter: presenter)

        }
        .inObjectScope(.transient)

    }

}
