// ProfileContract.swift

import Foundation

protocol ProfileViewType: AnyObject {
    func displayLoading(_ message: String)
    func hideLoading()
    func displayError(_ message: String)
}

protocol ProfileInteractorType {
    func loadProfile()
    func signOut()
}

protocol ProfileInteractorOutputType: AnyObject {
    func didLoadProfile()
    func didSignOut()
    func didFail(error: Error)
}

protocol ProfilePresenterType: AnyObject {
    var view: ProfileViewType? { get set }
    var interactor: ProfileInteractorType? { get set }
    var router: ProfileRouterType? { get set }
    
    func viewDidLoad()
    func didTapSignOut()
}

protocol ProfileRouterType {
    func navigate(to route: ProfileRoute)
}
