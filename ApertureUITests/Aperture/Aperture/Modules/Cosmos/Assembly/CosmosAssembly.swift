// CosmosAssembly.swift

import Swinject

final class CosmosAssembly: Assembly {
  func assemble(container: Container) {
    container.register(CosmosRouterType.self) { _ in
      fatalError("Router must be injected from CosmosEntryView")
    }

    container.register(CosmosPresenterType.self) { r in
      let router = r.resolve(CosmosRouterType.self)!
      let presenter = CosmosPresenter(router: router)
      print("🟡 CosmosAssembly: Created presenter instance")
      return presenter
    }.inObjectScope(.container)

    container.register(CosmosInteractorType.self) { r in
      let presenter = r.resolve(CosmosPresenterType.self)!

      print("🟡 CosmosAssembly: Wiring interactor to presenter")
      let interactor = CosmosInteractor()
      interactor.output = presenter as? CosmosInteractorOutputType
      presenter.interactor = interactor
      print("🟡 CosmosAssembly: Interactor wired")
      return interactor
    }
  }
}
