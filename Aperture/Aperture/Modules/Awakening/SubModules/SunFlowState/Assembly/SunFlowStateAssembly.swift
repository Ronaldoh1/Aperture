// SunFlowStateAssembly.swift

import Foundation
import Swinject

final class SunFlowStateAssembly: Assembly {
  func assemble(container: Container) {
    container.register(SunFlowStateInteractorType.self) { _ in
      SunFlowStateInteractor()
    }

    container.register(SunFlowStateRouterType.self) { _ in
      SunFlowStateRouter()
    }

    container.register(SunFlowStatePresenterType.self) { resolver in
      let presenter = SunFlowStatePresenter()
      let interactor = resolver.resolve(SunFlowStateInteractorType.self) as? SunFlowStateInteractor
      interactor?.output = presenter
      presenter.interactor = interactor
      presenter.router = resolver.resolve(SunFlowStateRouterType.self)
      return presenter
    }

    container.register(SunFlowStatePresenterBox.self) { resolver in
      let presenter = resolver.resolve(SunFlowStatePresenterType.self) as! SunFlowStatePresenter
      return SunFlowStatePresenterBox(presenter: presenter)
    }
  }
}
