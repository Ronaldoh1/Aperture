// DragonCompanionRouter.swift

import SwiftUI

final class DragonCompanionRouter: DragonCompanionRouterType {

    weak var viewController: UIViewController?

    func navigate(to route: DragonCompanionRoute) {

        switch route {
        case .traitDetail(let trait):
            print("🐉 DragonCompanionRouter: Showing trait - \(trait.name)")
        case .evolutionCelebration(let stage):
            print("🐉 DragonCompanionRouter: Celebrating evolution to - \(stage.rawValue)")
            showEvolutionCelebration(stage: stage)
        case .chakraDetail(let chakra):
            print("🐉 DragonCompanionRouter: Showing chakra - \(chakra.rawValue)")
        }

    }

    private func showEvolutionCelebration(stage: DragonStage) {
        // Trigger haptic feedback
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }

}
