// ProfileAssembly.swift

import Swinject

final class ProfileAssembly: Assembly {
  func assemble(container: Container) {
    container.register(ProfileRouterType.self) { _ in
      fatalError("Router must be injected from ProfileEntryView")
    }

    container.register(ProfilePresenterType.self) { r in
      let router = r.resolve(ProfileRouterType.self)!
      let presenter = ProfilePresenter(router: router)
      print("🟡 ProfileAssembly: Created presenter instance")
      return presenter
    }.inObjectScope(.container)

    container.register(ProfileInteractorType.self) { r in
      let authService = r.resolve(AuthServiceType.self)!
      let presenter = r.resolve(ProfilePresenterType.self)!

      print("🟡 ProfileAssembly: Wiring interactor to presenter")
      let interactor = ProfileInteractor(authService: authService)
      interactor.output = presenter as? ProfileInteractorOutputType
      presenter.interactor = interactor
      print("🟡 ProfileAssembly: Interactor wired")
      return interactor
    }
  }
}
