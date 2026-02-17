// AwakeningRouter.swift

import Foundation

final class AwakeningRouter: AwakeningRouterType {
  func presentDailyCheckIn(onSave _: @escaping (DailyCheckIn) -> Void) {}
  func presentDissonanceLog(
    entries _: [CognitiveDissonanceEntry], onSave _: @escaping (CognitiveDissonanceEntry) -> Void
  ) {}
  func presentRealityAudit(
    entries _: [RealityAuditEntry], onSave _: @escaping (RealityAuditEntry) -> Void
  ) {}
  func presentQuestionBank(entries _: [QuestionEntry], onSave _: @escaping (QuestionEntry) -> Void)
  {}
}
