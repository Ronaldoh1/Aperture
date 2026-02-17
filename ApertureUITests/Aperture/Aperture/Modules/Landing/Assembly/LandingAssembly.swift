// LandingAssembly.swift

import Swinject

final class LandingAssembly: Assembly {
  func assemble(container: Container) {
    container.register(LandingRouterType.self) { _ in
      fatalError("Router must be injected from LandingEntryView")
    }

    container.register(LandingPresenterType.self) { r in
      let router = r.resolve(LandingRouterType.self)!
      let presenter = LandingPresenter(router: router)
      print("🟡 LandingAssembly: Created presenter instance")
      return presenter
    }.inObjectScope(.container)

    container.register(LandingInteractorType.self) { r in
      let presenter = r.resolve(LandingPresenterType.self)!

      print("🟡 LandingAssembly: Wiring interactor to presenter")
      let interactor = LandingInteractor()
      interactor.output = presenter as? LandingInteractorOutputType
      presenter.interactor = interactor
      print("🟡 LandingAssembly: Interactor wired")
      return interactor
    }
  }
}
