// AwakeningPresenter.swift

import Foundation

final class AwakeningPresenter: AwakeningPresenterType {
  weak var viewBox: AwakeningPresenterBox?
  var interactor: AwakeningInteractorType?
  var router: AwakeningRouterType?

  func viewDidLoad() {
    interactor?.loadProfile()
  }

  func didTapDailyCheckIn() {}
  func didTapDissonanceLog() {}
  func didTapRealityAudit() {}
  func didTapQuestionBank() {}

  func saveCheckIn(_ checkIn: DailyCheckIn) {
    interactor?.addCheckIn(checkIn)
  }

  func saveDissonanceEntry(_ entry: CognitiveDissonanceEntry) {
    interactor?.addDissonanceEntry(entry)
  }

  func saveAuditEntry(_ entry: RealityAuditEntry) {
    interactor?.updateAuditEntry(entry)
  }

  func saveQuestionEntry(_ entry: QuestionEntry) {
    interactor?.updateQuestionEntry(entry)
  }

  func refreshProfile() {
    interactor?.loadProfile()
  }
}

extension AwakeningPresenter: AwakeningInteractorOutputType {
  func profileLoaded(_ profile: AwakeningProfile) {
    viewBox?.displayProfile(profile)
  }

  func profileSaved() {
    interactor?.loadProfile()
  }

  func levelUpDetected(_ newLevel: AwakeningLevel) {
    viewBox?.showLevelUp(to: newLevel)
  }

  func operationFailed(_ error: Error) {
    viewBox?.displayError(error.localizedDescription)
  }
}
