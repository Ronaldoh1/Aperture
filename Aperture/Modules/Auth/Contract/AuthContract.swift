// AuthContract.swift

import Foundation

protocol AuthViewType: AnyObject {

    func display(_ viewModel: AuthViewModel)
    func displayError(_ error: String)
    func displayLoading(_ message: String)
    func hideLoading()

}

protocol AuthInteractorType {

    func signIn(email: String, password: String)
    func signUp(email: String, password: String)
    func checkAuthStatus()

}

protocol AuthInteractorOutputType: AnyObject {

    func didSignIn(user: User)
    func didSignUp(user: User)
    func didCheckAuth(user: User?)
    func didFail(error: Error)

}

protocol AuthPresenterType: AnyObject {

    var view: AuthViewType? { get set }
    var interactor: AuthInteractorType? { get set }
    var router: AuthRouterType? { get set }

    func viewDidLoad()
    func didTapSignIn(email: String, password: String)
    func didTapSignUp(email: String, password: String)
    func didTapToggleMode()

}

protocol AuthRouterType {

    func navigate(to route: AuthRoute)

}


struct AuthViewModel: Equatable {

    let isSignUpMode: Bool
    let emailText: String
    let passwordText: String
    let confirmPasswordText: String
    let isFormValid: Bool
    let errorMessage: String?

}
