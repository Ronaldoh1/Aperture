// AlexandriaPresenter.swift

import Combine
import Foundation

final class AlexandriaPresenter: AlexandriaPresenterType, AlexandriaInteractorOutputType {
  weak var view: AlexandriaViewType?
  var interactor: AlexandriaInteractorType?
  var router: AlexandriaRouterType?

  @Published var isLoading: Bool = false
  @Published var loadingMessage: String = ""
  @Published var error: PresenterError?

  init(router: AlexandriaRouterType) {
    self.router = router
  }

  func viewDidLoad() {
    print("🟢 AlexandriaPresenter: View loaded")
    interactor?.loadContent()
  }

  func didLoadContent() {
    print("🟢 AlexandriaPresenter: Content loaded")
  }

  func didFail(error: Error) {
    print("🔴 AlexandriaPresenter: Error - \(error.localizedDescription)")
  }
}
