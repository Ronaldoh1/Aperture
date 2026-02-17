// TutorialPresenter.swift

import Combine
import Foundation

final class TutorialPresenter: ObservableObject, TutorialPresenterType, TutorialInteractorOutputType
{
  weak var view: TutorialViewType?
  var interactor: TutorialInteractorType?
  var router: TutorialRouterType?

  @Published private(set) var viewModel: TutorialViewModel?
  @Published var errorMessage: String?

  private var pages: [TutorialPageModel] = [
    TutorialPageModel(
      title: "Welcome to Aperture",
      subtitle: "A cosmic interface for clarity, focus, and flow.",
      systemImage: "sparkles"
    ),
    TutorialPageModel(
      title: "Sacred Geometry",
      subtitle: "Patterns that calm the mind and train attention.",
      systemImage: "circle.grid.3x3.fill"
    ),
    TutorialPageModel(
      title: "Track Your Progress",
      subtitle: "Small wins become measurable momentum.",
      systemImage: "chart.line.uptrend.xyaxis"
    ),
    TutorialPageModel(
      title: "Build Your Ritual",
      subtitle: "Daily structure, without the friction.",
      systemImage: "clock.fill"
    ),
    TutorialPageModel(
      title: "Start Your Journey",
      subtitle: "Create your account and step through the portal.",
      systemImage: "arrow.right.circle.fill"
    ),
  ]

  private var index: Int = 0

  func viewDidLoad() {
    interactor?.loadState()
    publish()
  }

  func didSwipe(to index: Int) {
    self.index = max(0, min(index, pages.count - 1))
    publish()
  }

  func didTapNext() {
    index = min(index + 1, pages.count - 1)
    publish()
  }

  func didTapSkip() {
    router?.navigate(to: .authStartSignUp)
  }

  func didTapFinish() {
    interactor?.markSeen()
  }

  func didLoad(hasSeenTutorial: Bool) {
    if hasSeenTutorial {
      router?.navigate(to: .authStartSignIn)
      return
    }
    publish()
  }

  func didMarkSeen() {
    router?.navigate(to: .authStartSignUp)
  }

  func didFail(message: String) {
    errorMessage = message
    view?.displayError(message)
  }

  private func publish() {
    let isLast = index == pages.count - 1
    let vm = TutorialViewModel(
      pages: pages,
      index: index,
      isLast: isLast,
      primaryButtonTitle: isLast ? "Create Account" : "Next",
      secondaryButtonTitle: "Skip"
    )
    viewModel = vm
    view?.render(vm)
  }
}
