// TimelineAssembly.swift

import Swinject

final class TimelineAssembly: Assembly {
  func assemble(container: Container) {
    container.register(TimelineRouterType.self) { _ in
      fatalError("Router must be injected from TimelineEntryView")
    }

    container.register(TimelinePresenterType.self) { r in
      let router = r.resolve(TimelineRouterType.self)!
      let presenter = TimelinePresenter(router: router)
      print("🟡 TimelineAssembly: Created presenter instance")
      return presenter
    }.inObjectScope(.container)

    container.register(TimelineInteractorType.self) { r in
      let presenter = r.resolve(TimelinePresenterType.self)!

      print("🟡 TimelineAssembly: Wiring interactor to presenter")
      let interactor = TimelineInteractor()
      interactor.output = presenter as? TimelineInteractorOutputType
      presenter.interactor = interactor
      print("🟡 TimelineAssembly: Interactor wired")
      return interactor
    }
  }
}
