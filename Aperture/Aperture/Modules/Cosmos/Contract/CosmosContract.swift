// CosmosContract.swift

import Foundation

protocol CosmosViewType: AnyObject {
    func displayLoading(_ message: String)
    func hideLoading()
    func displayError(_ message: String)
}

protocol CosmosInteractorType {
    func loadContent()
}

protocol CosmosInteractorOutputType: AnyObject {
    func didLoadContent()
    func didFail(error: Error)
}

protocol CosmosPresenterType: AnyObject {
    var view: CosmosViewType? { get set }
    var interactor: CosmosInteractorType? { get set }
    var router: CosmosRouterType? { get set }
    
    func viewDidLoad()
}

protocol CosmosRouterType {
    func navigate(to route: CosmosRoute)
}
