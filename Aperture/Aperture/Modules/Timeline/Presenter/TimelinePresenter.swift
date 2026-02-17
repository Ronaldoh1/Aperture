// TimelinePresenter.swift

import Combine
import Foundation

final class TimelinePresenter: TimelinePresenterType, TimelineInteractorOutputType {
  weak var view: TimelineViewType?
  var interactor: TimelineInteractorType?
  var router: TimelineRouterType?

  @Published var isLoading: Bool = false
  @Published var loadingMessage: String = ""
  @Published var error: PresenterError?
  @Published var eras: [TimelineEra] = []
  @Published var selectedInterval: TimelineJumpInterval = .century

  init(router: TimelineRouterType) {
    self.router = router
  }

  func viewDidLoad() {
    print("🟢 TimelinePresenter: View loaded")
    interactor?.loadTimeline()
  }

  func didSelectEra(_ era: TimelineEra) {
    print("🟢 TimelinePresenter: Selected era - \(era.title)")
    router?.navigate(to: .eraDetail(era))
  }

  func didLoadTimeline() {
    print("🟢 TimelinePresenter: Timeline loaded with \(TimelineEra.fullTimeline.count) eras")
    eras = TimelineEra.fullTimeline
  }

  func didFail(error: Error) {
    print("🔴 TimelinePresenter: Error - \(error.localizedDescription)")
  }
}
