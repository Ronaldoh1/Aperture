// LandingContract.swift

import Foundation

protocol LandingViewType: AnyObject {
    func displayLoading(_ message: String)
    func hideLoading()
    func displayError(_ message: String)
}

protocol LandingInteractorType {
    func loadContent()
}

protocol LandingInteractorOutputType: AnyObject {
    func didLoadContent()
    func didFail(error: Error)
}

protocol LandingPresenterType: AnyObject {
    var view: LandingViewType? { get set }
    var interactor: LandingInteractorType? { get set }
    var router: LandingRouterType? { get set }
    
    func viewDidLoad()
}

protocol LandingRouterType {
    func navigate(to route: LandingRoute)
}
