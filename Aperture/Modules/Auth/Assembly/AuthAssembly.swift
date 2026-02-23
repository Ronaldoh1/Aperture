// AuthAssembly.swift

import Swinject

final class AuthAssembly: Assembly {

    func assemble(container: Container) {

        container.register(AuthRouterType.self) { _ in
            fatalError("Router must be injected from AppRootView")
        }

        // Register GoogleSignInService
        container.register(GoogleSignInServiceType.self) { _ in
            GoogleSignInService()
        }.inObjectScope(.container)

        // Register presenter as singleton so interactor gets the same instance
        container.register(AuthPresenterType.self) { r in
            let router = r.resolve(AuthRouterType.self)!
            let presenter = AuthPresenter(router: router)
            print("🟡 AuthAssembly: Created presenter instance")
            return presenter
        }.inObjectScope(.container)

        container.register(AuthInteractorType.self) { r in
            let authService = r.resolve(AuthServiceType.self)!
            let googleSignInService = r.resolve(GoogleSignInServiceType.self)!
            let currentUser = r.resolve(CurrentUserType.self)!
            let presenter = r.resolve(AuthPresenterType.self)!

            print("🟡 AuthAssembly: Wiring interactor to presenter")
            let interactor = AuthInteractor(
                authService: authService,
                googleSignInService: googleSignInService,
                currentUser: currentUser
            )
            interactor.output = presenter as? AuthInteractorOutputType
            presenter.interactor = interactor
            print("🟡 AuthAssembly: Interactor wired, presenter.interactor is \(presenter.interactor != nil ? "set ✓" : "NIL ❌")")
            return interactor
        }
    }
    
}
