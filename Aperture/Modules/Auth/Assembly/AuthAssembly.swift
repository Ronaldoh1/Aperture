import Swinject

class AuthAssembly: Assembly {
    
    
    func assemble(container: Container) {
        
        // MARK: - Router
        container.register(AuthRouter.self) { _ in
            
            AuthRouter()
        }
        .inObjectScope(.container)
        
        
        // MARK: - Presenter
        container.register(AuthPresenter.self) { _ in
            
            AuthPresenter()
        }
        .inObjectScope(.transient)
        
        
        // MARK: - Interactor
        container.register(AuthInteractor.self) { (resolver, presenter: AuthPresenter) in
            
            guard let authService = resolver.resolve(AuthService.self),
                let currentUser = resolver.resolve(CurrentUser.self) else {
                
                fatalError("AuthInteractor dependencies not resolved")
            }
            
            let interactor = AuthInteractor(authService: authService, currentUser: currentUser)
            
            interactor.output = presenter
            
            return interactor
        }
        .inObjectScope(.transient)
        
        
        // MARK: - View
        container.register(AuthView.self) { resolver in
            
            guard let presenter = resolver.resolve(AuthPresenter.self),
                  let router = resolver.resolve(AuthRouter.self) else {
                
                fatalError("AuthView dependencies not resolved")
            }
            
            // Wire presenter
            presenter.router = router
            
            // Create interactor with presenter
            guard let interactor = resolver.resolve(AuthInteractor.self, argument: presenter) else {
                
                fatalError("AuthInteractor not resolved")
            }
            
            presenter.interactor = interactor
            
            return AuthView(presenter: presenter)
        }
        .inObjectScope(.transient)
    }
}
