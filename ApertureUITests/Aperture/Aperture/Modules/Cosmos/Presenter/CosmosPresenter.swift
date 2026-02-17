// CosmosPresenter.swift

import Combine
import Foundation

final class CosmosPresenter: CosmosPresenterType, CosmosInteractorOutputType {
  weak var view: CosmosViewType?
  var interactor: CosmosInteractorType?
  var router: CosmosRouterType?

  @Published var isLoading: Bool = false
  @Published var loadingMessage: String = ""
  @Published var error: PresenterError?

  init(router: CosmosRouterType) {
    self.router = router
  }

  func viewDidLoad() {
    print("🟢 CosmosPresenter: View loaded")
    interactor?.loadContent()
  }

  func didLoadContent() {
    print("🟢 CosmosPresenter: Content loaded")
  }

  func didFail(error: Error) {
    print("🔴 CosmosPresenter: Error - \(error.localizedDescription)")
  }
}
