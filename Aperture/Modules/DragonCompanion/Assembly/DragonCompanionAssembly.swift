// DragonCompanionAssembly.swift

import Swinject
import Foundation

final class DragonCompanionAssembly: Assembly {

    func assemble(container: Container) {

        container.register(DragonCompanionInteractorType.self) { _ in
            DragonCompanionInteractor()
        }

        container.register(DragonCompanionRouterType.self) { _ in
            DragonCompanionRouter()
        }

        container.register(DragonCompanionPresenterType.self) { resolver in
            let presenter = DragonCompanionPresenter()
            let interactor = resolver.resolve(DragonCompanionInteractorType.self) as? DragonCompanionInteractor
            interactor?.output = presenter
            presenter.interactor = interactor
            presenter.router = resolver.resolve(DragonCompanionRouterType.self)
            return presenter
        }

    }

}
