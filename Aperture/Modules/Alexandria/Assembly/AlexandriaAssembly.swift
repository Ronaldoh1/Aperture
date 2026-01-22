// AlexandriaAssembly.swift

import Swinject

final class AlexandriaAssembly: Assembly {
    
    func assemble(container: Container) {
        
        container.register(AlexandriaRouterType.self) { _ in
            fatalError("Router must be injected from AlexandriaEntryView")
        }
        
        container.register(AlexandriaPresenterType.self) { r in
            let router = r.resolve(AlexandriaRouterType.self)!
            let presenter = AlexandriaPresenter(router: router)
            print("🟡 AlexandriaAssembly: Created presenter instance")
            return presenter
        }.inObjectScope(.container)
        
        container.register(AlexandriaInteractorType.self) { r in
            let presenter = r.resolve(AlexandriaPresenterType.self)!
            
            print("🟡 AlexandriaAssembly: Wiring interactor to presenter")
            let interactor = AlexandriaInteractor()
            interactor.output = presenter as? AlexandriaInteractorOutputType
            presenter.interactor = interactor
            print("🟡 AlexandriaAssembly: Interactor wired")
            return interactor
        }
    }
}
