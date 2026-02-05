// DragonCompanionPresenter.swift

import Foundation

final class DragonCompanionPresenter: DragonCompanionPresenterType {

    weak var view: DragonCompanionViewType?
    var interactor: DragonCompanionInteractorType?
    var router: DragonCompanionRouterType?

    func viewDidLoad() {
        interactor?.loadCompanion()
    }

    func didTapCreateEgg(name: String) {
        interactor?.createEgg(name: name)
    }

    func didCompleteCourse(_ courseId: String, category: CourseCategory) {
        interactor?.completeCourse(courseId, category: category)
    }

    func didTapTrait(_ trait: DragonTrait) {
        router?.navigate(to: .traitDetail(trait))
    }

}

// MARK: - Interactor Output

extension DragonCompanionPresenter: DragonCompanionInteractorOutputType {

    func didLoadCompanion(_ companion: DragonCompanion?) {
        view?.displayCompanion(companion)
    }

    func didCreateEgg(_ companion: DragonCompanion) {
        view?.displayCompanion(companion)
    }

    func didEvolve(to stage: DragonStage) {
        view?.displayEvolution(to: stage)
        router?.navigate(to: .evolutionCelebration(stage))
    }

    func didUnlockTrait(_ trait: DragonTrait) {
        view?.displayNewTrait(trait)
    }

    func didActivateChakra(_ chakra: ChakraType) {
        view?.displayChakraActivation(chakra)
        router?.navigate(to: .chakraDetail(chakra))
    }

}
