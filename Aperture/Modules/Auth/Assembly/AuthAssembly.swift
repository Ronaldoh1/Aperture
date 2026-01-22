// AuthAssembly.swift

import Swinject
import SwiftUI

// AuthAssembly.swift

import Swinject

final class AuthAssembly: Assembly {

    func assemble(container: Container) {

        container.register(AuthPresenterType.self) { resolver in

            // Router is injected at the SwiftUI boundary (AuthEntryView).
            return AuthPresenter(router: nil)

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

    }

}
