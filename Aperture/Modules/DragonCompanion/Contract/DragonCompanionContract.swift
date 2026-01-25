// DragonCompanionContract.swift

import Foundation

protocol DragonCompanionViewType: AnyObject {

    func displayCompanion(_ companion: DragonCompanion?)
    func displayEvolution(to stage: DragonStage)
    func displayNewTrait(_ trait: DragonTrait)
    func displayChakraActivation(_ chakra: ChakraType)

}

protocol DragonCompanionInteractorType {

    func loadCompanion()
    func createEgg(name: String)
    func awardXP(amount: Int, source: XPSource)
    func completeCourse(_ courseId: String, category: CourseCategory)

}

protocol DragonCompanionInteractorOutputType: AnyObject {

    func didLoadCompanion(_ companion: DragonCompanion?)
    func didCreateEgg(_ companion: DragonCompanion)
    func didEvolve(to stage: DragonStage)
    func didUnlockTrait(_ trait: DragonTrait)
    func didActivateChakra(_ chakra: ChakraType)

}

protocol DragonCompanionPresenterType: AnyObject {

    var view: DragonCompanionViewType? { get set }
    var interactor: DragonCompanionInteractorType? { get set }
    var router: DragonCompanionRouterType? { get set }

    func viewDidLoad()
    func didTapCreateEgg(name: String)
    func didCompleteCourse(_ courseId: String, category: CourseCategory)
    func didTapTrait(_ trait: DragonTrait)

}

protocol DragonCompanionRouterType {

    func navigate(to route: DragonCompanionRoute)

}

enum DragonCompanionRoute {

    case traitDetail(DragonTrait)
    case evolutionCelebration(DragonStage)
    case chakraDetail(ChakraType)

}
