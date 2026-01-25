// DragonCompanionInteractor.swift

import Foundation

final class DragonCompanionInteractor: DragonCompanionInteractorType {

    weak var output: DragonCompanionInteractorOutputType?

    private let progressionManager = DragonProgressionManager.shared

    init() {
        setupNotificationObservers()
    }

    func loadCompanion() {
        output?.didLoadCompanion(progressionManager.companion)
    }

    func createEgg(name: String) {
        let companion = progressionManager.createEgg(name: name)
        output?.didCreateEgg(companion)
    }

    func awardXP(amount: Int, source: XPSource) {
        progressionManager.awardXP(amount: amount, source: source)
    }

    func completeCourse(_ courseId: String, category: CourseCategory) {
        progressionManager.completeCourse(courseId, category: category)
    }

    // MARK: - Notification Observers

    private func setupNotificationObservers() {

        NotificationCenter.default.addObserver(
            forName: .dragonEvolved,
            object: nil,
            queue: .main
        ) { [weak self] notification in
            if let stage = notification.userInfo?["stage"] as? DragonStage {
                self?.output?.didEvolve(to: stage)
            }
        }

        NotificationCenter.default.addObserver(
            forName: .dragonTraitUnlocked,
            object: nil,
            queue: .main
        ) { [weak self] notification in
            if let trait = notification.userInfo?["trait"] as? DragonTrait {
                self?.output?.didUnlockTrait(trait)
            }
        }

        NotificationCenter.default.addObserver(
            forName: .dragonChakraActivated,
            object: nil,
            queue: .main
        ) { [weak self] notification in
            if let chakra = notification.userInfo?["chakra"] as? ChakraType {
                self?.output?.didActivateChakra(chakra)
            }
        }

    }

}
