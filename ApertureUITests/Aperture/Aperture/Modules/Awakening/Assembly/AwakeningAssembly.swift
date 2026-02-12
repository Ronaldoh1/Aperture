// AwakeningAssembly.swift

import Foundation
import Swinject

final class AwakeningAssembly: Assembly {
    
    func assemble(container: Container) {
        
        container.register(AwakeningStorageType.self) { _ in
            AwakeningStorage()
        }.inObjectScope(.container)
        
        container.register(AwakeningInteractorType.self) { resolver in
            let storage = resolver.resolve(AwakeningStorageType.self)!
            return AwakeningInteractor(storage: storage)
        }
        
        container.register(AwakeningRouterType.self) { _ in
            AwakeningRouter()
        }
        
        container.register(AwakeningPresenterType.self) { resolver in
            let presenter = AwakeningPresenter()
            let interactor = resolver.resolve(AwakeningInteractorType.self)!
            interactor.presenter = presenter
            presenter.interactor = interactor
            presenter.router = resolver.resolve(AwakeningRouterType.self)!
            return presenter
        }
    }
}
