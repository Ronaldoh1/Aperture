// SunFlowStatePresenter.swift

import Foundation

final class SunFlowStatePresenter: SunFlowStatePresenterType {
  weak var view: SunFlowStateViewType?
  var interactor: SunFlowStateInteractorType?
  var router: SunFlowStateRouterType?

  func viewDidLoad() {
    interactor?.checkPremiumStatus()
    interactor?.loadFlowStates()
  }

  func didSelectSection(_ section: FlowSection) {
    switch section {
    case .overview:
      break
    case .flowStates:
      interactor?.loadFlowStates()
    case .triggers:
      interactor?.loadTriggers(for: nil)
    case .circadian:
      interactor?.loadCircadianPhases()
    case .protocols:
      interactor?.loadProtocols()
    case .blockers:
      interactor?.loadBlockers()
    }
  }

  func didSelectFlowState(_ state: FlowState) {
    router?.navigate(to: .flowStateDetail(state))
  }

  func didSelectTriggerCategory(_ category: TriggerCategory) {
    router?.navigate(to: .triggerCategory(category))
  }

  func didSelectProtocol(_ proto: FlowProtocol) {
    router?.navigate(to: .protocolDetail(proto))
  }

  func didTapUpgrade() {
    router?.navigate(to: .upgrade)
  }
}

extension SunFlowStatePresenter: SunFlowStateInteractorOutputType {
  func didLoadFlowStates(_ states: [FlowState]) {
    view?.displayFlowStates(states)
  }

  func didLoadTriggers(_ triggers: [FlowTrigger]) {
    view?.displayTriggers(triggers)
  }

  func didLoadCircadianPhases(_ phases: [CircadianPhase]) {
    view?.displayCircadianPhases(phases)
  }

  func didLoadChronotypes(_: [Chronotype]) {
    // Handle in view
  }

  func didLoadCircadianAnchors(_: [CircadianAnchor]) {
    // Handle in view
  }

  func didLoadSleepStages(_: [SleepStage]) {
    // Handle in view
  }

  func didLoadProtocols(_ protocols: [FlowProtocol]) {
    view?.displayProtocols(protocols)
  }

  func didLoadBlockers(_ blockers: [FlowBlocker]) {
    view?.displayBlockers(blockers)
  }

  func didCheckPremiumStatus(_ isPremium: Bool) {
    view?.displayPremiumStatus(isPremium)
  }
}
