import Foundation

protocol AuthViewType: AnyObject {
    
    func displayLoading(_ message: String)
    func hideLoading()
    func displayError(_ message: String)
    
}

protocol AuthInteractorType {
    
    func signIn(email: String, password: String)
    func signUp(email: String, password: String)
    func resetPassword(email: String)
    func checkAuthStatus()
    
}

protocol AuthInteractorOutputType: AnyObject {
    
    func didSignIn(user: User)
    func didSignUp(user: User)
    func didSendPasswordReset()
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
    func didTapResetPassword(email: String)
    
}

protocol AuthRouterType {
    
    func navigate(to route: AuthRoute)
    
}
