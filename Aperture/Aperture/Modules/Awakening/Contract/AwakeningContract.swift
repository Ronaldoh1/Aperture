// AwakeningContract.swift

import Foundation

protocol AwakeningViewType: AnyObject {
    func displayProfile(_ profile: AwakeningProfile)
    func displayError(_ message: String)
    func showLevelUp(to level: AwakeningLevel)
}

protocol AwakeningPresenterType: AnyObject {
    func viewDidLoad()
    func didTapDailyCheckIn()
    func didTapDissonanceLog()
    func didTapRealityAudit()
    func didTapQuestionBank()
    func saveCheckIn(_ checkIn: DailyCheckIn)
    func saveDissonanceEntry(_ entry: CognitiveDissonanceEntry)
    func saveAuditEntry(_ entry: RealityAuditEntry)
    func saveQuestionEntry(_ entry: QuestionEntry)
    func refreshProfile()
}

protocol AwakeningInteractorType: AnyObject {
    var presenter: AwakeningInteractorOutputType? { get set }
    func loadProfile()
    func saveProfile(_ profile: AwakeningProfile)
    func addCheckIn(_ checkIn: DailyCheckIn)
    func addDissonanceEntry(_ entry: CognitiveDissonanceEntry)
    func updateAuditEntry(_ entry: RealityAuditEntry)
    func updateQuestionEntry(_ entry: QuestionEntry)
}

protocol AwakeningInteractorOutputType: AnyObject {
    func profileLoaded(_ profile: AwakeningProfile)
    func profileSaved()
    func levelUpDetected(_ newLevel: AwakeningLevel)
    func operationFailed(_ error: Error)
}

protocol AwakeningRouterType: AnyObject {
    func presentDailyCheckIn(onSave: @escaping (DailyCheckIn) -> Void)
    func presentDissonanceLog(entries: [CognitiveDissonanceEntry], onSave: @escaping (CognitiveDissonanceEntry) -> Void)
    func presentRealityAudit(entries: [RealityAuditEntry], onSave: @escaping (RealityAuditEntry) -> Void)
    func presentQuestionBank(entries: [QuestionEntry], onSave: @escaping (QuestionEntry) -> Void)
}
