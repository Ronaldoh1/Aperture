// SunFlowStateRouter.swift

import SwiftUI

final class SunFlowStateRouter: SunFlowStateRouterType {
  weak var viewController: UIViewController?

  func navigate(to route: SunFlowStateRoute) {
    switch route {
    case .flowStateDetail(let state):
      print("🟠 SunFlowStateRouter: Navigate to flow state - \(state.name)")
    case .triggerCategory(let category):
      print("🟠 SunFlowStateRouter: Navigate to trigger category - \(category.rawValue)")
    case .circadianPhases:
      print("🟠 SunFlowStateRouter: Navigate to circadian phases")
    case .chronotypes:
      print("🟠 SunFlowStateRouter: Navigate to chronotypes")
    case .circadianAnchors:
      print("🟠 SunFlowStateRouter: Navigate to circadian anchors")
    case .sleepArchitecture:
      print("🟠 SunFlowStateRouter: Navigate to sleep architecture")
    case .protocolDetail(let proto):
      print("🟠 SunFlowStateRouter: Navigate to protocol - \(proto.name)")
    case .upgrade:
      print("🟠 SunFlowStateRouter: Navigate to upgrade")
    }
  }
}
