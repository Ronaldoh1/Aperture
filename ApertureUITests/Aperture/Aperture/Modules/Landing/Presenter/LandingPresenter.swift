// LandingPresenter.swift

import Combine
import Foundation

final class LandingPresenter: LandingPresenterType, LandingInteractorOutputType {
  weak var view: LandingViewType?
  var interactor: LandingInteractorType?
  var router: LandingRouterType?

  @Published var isLoading: Bool = false
  @Published var loadingMessage: String = ""
  @Published var error: PresenterError?

  init(router: LandingRouterType) {
    self.router = router
  }

  func viewDidLoad() {
    print("🟢 LandingPresenter: View loaded")
    interactor?.loadContent()
  }

  func didLoadContent() {
    print("🟢 LandingPresenter: Content loaded")
  }

  func didFail(error: Error) {
    print("🔴 LandingPresenter: Error - \(error.localizedDescription)")
  }
}
