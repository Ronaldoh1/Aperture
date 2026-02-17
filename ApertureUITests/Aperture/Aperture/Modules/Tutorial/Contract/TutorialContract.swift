// TutorialContract.swift

import Foundation

protocol TutorialViewType: AnyObject {
  func render(_ viewModel: TutorialViewModel)
  func displayError(_ message: String)
}

protocol TutorialPresenterType: AnyObject {
  var view: TutorialViewType? { get set }
  var interactor: TutorialInteractorType? { get set }
  var router: TutorialRouterType? { get set }

  func viewDidLoad()
  func didSwipe(to index: Int)
  func didTapNext()
  func didTapSkip()
  func didTapFinish()
}

protocol TutorialInteractorType {
  func loadState()
  func markSeen()
}

protocol TutorialInteractorOutputType: AnyObject {
  func didLoad(hasSeenTutorial: Bool)
  func didMarkSeen()
  func didFail(message: String)
}

protocol TutorialRouterType {
  func navigate(to route: TutorialRoute)
}
