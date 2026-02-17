// SunFlowStateContract.swift

import Foundation

protocol SunFlowStateViewType: AnyObject {
  func displayPremiumStatus(_ isPremium: Bool)
  func displayFlowStates(_ states: [FlowState])
  func displayTriggers(_ triggers: [FlowTrigger])
  func displayCircadianPhases(_ phases: [CircadianPhase])
  func displayProtocols(_ protocols: [FlowProtocol])
  func displayBlockers(_ blockers: [FlowBlocker])
}

protocol SunFlowStateInteractorType {
  func loadFlowStates()
  func loadTriggers(for category: TriggerCategory?)
  func loadCircadianPhases()
  func loadChronotypes()
  func loadCircadianAnchors()
  func loadSleepStages()
  func loadProtocols()
  func loadBlockers()
  func checkPremiumStatus()
}

protocol SunFlowStateInteractorOutputType: AnyObject {
  func didLoadFlowStates(_ states: [FlowState])
  func didLoadTriggers(_ triggers: [FlowTrigger])
  func didLoadCircadianPhases(_ phases: [CircadianPhase])
  func didLoadChronotypes(_ types: [Chronotype])
  func didLoadCircadianAnchors(_ anchors: [CircadianAnchor])
  func didLoadSleepStages(_ stages: [SleepStage])
  func didLoadProtocols(_ protocols: [FlowProtocol])
  func didLoadBlockers(_ blockers: [FlowBlocker])
  func didCheckPremiumStatus(_ isPremium: Bool)
}

protocol SunFlowStatePresenterType: AnyObject {
  var view: SunFlowStateViewType? { get set }
  var interactor: SunFlowStateInteractorType? { get set }
  var router: SunFlowStateRouterType? { get set }

  func viewDidLoad()
  func didSelectSection(_ section: FlowSection)
  func didSelectFlowState(_ state: FlowState)
  func didSelectTriggerCategory(_ category: TriggerCategory)
  func didSelectProtocol(_ proto: FlowProtocol)
  func didTapUpgrade()
}

protocol SunFlowStateRouterType {
  func navigate(to route: SunFlowStateRoute)
}

enum SunFlowStateRoute {
  case flowStateDetail(FlowState)
  case triggerCategory(TriggerCategory)
  case circadianPhases
  case chronotypes
  case circadianAnchors
  case sleepArchitecture
  case protocolDetail(FlowProtocol)
  case upgrade
}
