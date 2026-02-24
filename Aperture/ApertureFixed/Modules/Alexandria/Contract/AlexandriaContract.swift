// AlexandriaContract.swift

import Foundation

protocol AlexandriaViewType: AnyObject {
    func displayLoading(_ message: String)
    func hideLoading()
    func displayError(_ message: String)
}

protocol AlexandriaInteractorType {
    func loadContent()
}

protocol AlexandriaInteractorOutputType: AnyObject {
    func didLoadContent()
    func didFail(error: Error)
}

protocol AlexandriaPresenterType: AnyObject {
    var view: AlexandriaViewType? { get set }
    var interactor: AlexandriaInteractorType? { get set }
    var router: AlexandriaRouterType? { get set }
    
    func viewDidLoad()
}

protocol AlexandriaRouterType {
    func navigate(to route: AlexandriaRoute)
}
