// MoreContract.swift

import Foundation

protocol MoreViewType: AnyObject {

    func displayLoading(_ message: String)
    func hideLoading()

}

protocol MoreInteractorType {

    func loadUserData()

}

protocol MoreInteractorOutputType: AnyObject {

    func didLoadUserData()
    func didFail(error: Error)

}

protocol MorePresenterType: AnyObject {

    var view: MoreViewType? { get set }
    var interactor: MoreInteractorType? { get set }
    var router: MoreRouterType? { get set }

    func viewDidLoad()
    func didTapAwakening()
    func didTapProfile()
    func didTapSettings()

}

protocol MoreRouterType {

    func navigate(to route: MoreRoute)

}

enum MoreRoute {

    case awakening
    case profile
    case settings
    case about

}
