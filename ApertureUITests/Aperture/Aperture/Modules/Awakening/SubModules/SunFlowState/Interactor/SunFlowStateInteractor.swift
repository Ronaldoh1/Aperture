// SunFlowStateInteractor.swift

import Foundation

final class SunFlowStateInteractor: SunFlowStateInteractorType {
  weak var output: SunFlowStateInteractorOutputType?

  func loadFlowStates() {
    output?.didLoadFlowStates(FlowState.states)
  }

  func loadTriggers(for category: TriggerCategory?) {
    if let category = category {
      output?.didLoadTriggers(FlowTrigger.byCategory(category))
    } else {
      output?.didLoadTriggers(FlowTrigger.all)
    }
  }

  func loadCircadianPhases() {
    output?.didLoadCircadianPhases(CircadianPhase.phases)
  }

  func loadChronotypes() {
    output?.didLoadChronotypes(Chronotype.types)
  }

  func loadCircadianAnchors() {
    output?.didLoadCircadianAnchors(CircadianAnchor.anchors)
  }

  func loadSleepStages() {
    output?.didLoadSleepStages(SleepStage.stages)
  }

  func loadProtocols() {
    output?.didLoadProtocols(FlowProtocol.protocols)
  }

  func loadBlockers() {
    output?.didLoadBlockers(FlowBlocker.all)
  }

  func checkPremiumStatus() {
    let isPremium = PremiumStatus.shared.isPremium
    output?.didCheckPremiumStatus(isPremium)
  }
}
