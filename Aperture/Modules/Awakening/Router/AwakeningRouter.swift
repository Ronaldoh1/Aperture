// AwakeningRouter.swift

import Foundation

final class AwakeningRouter: AwakeningRouterType {
    func presentDailyCheckIn(onSave: @escaping (DailyCheckIn) -> Void) {}
    func presentDissonanceLog(entries: [CognitiveDissonanceEntry], onSave: @escaping (CognitiveDissonanceEntry) -> Void) {}
    func presentRealityAudit(entries: [RealityAuditEntry], onSave: @escaping (RealityAuditEntry) -> Void) {}
    func presentQuestionBank(entries: [QuestionEntry], onSave: @escaping (QuestionEntry) -> Void) {}
}
