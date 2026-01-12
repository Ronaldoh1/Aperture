import Foundation

class AuthPresenter: AuthPresenterType {
    
    
    weak var view: AuthViewType?
    var interactor: AuthInteractorType?
    var router: AuthRouterType?
    
    
    // MARK: - AuthPresenterType Methods
    func viewDidLoad() {
        
        interactor?.checkAuthStatus()
    }
    
    
    func didTapSignIn(email: String, password: String) {
        
        view?.displayLoading("Signing in...")
        interactor?.signIn(email: email, password: password)
    }
    
    
    func didTapSignUp(email: String, password: String) {
        
        view?.displayLoading("Creating account...")
        interactor?.signUp(email: email, password: password)
    }
    
    
    func didTapToggleMode() {
        
        // View handles the toggle
    }
}


// MARK: - AuthInteractorOutputType Conformance
extension AuthPresenter: AuthInteractorOutputType {
    
    
    func didSignIn(user: User) {
        
        view?.hideLoading()
        router?.navigate(to: .main)
    }
    
    
    func didSignUp(user: User) {
        
        view?.hideLoading()
        router?.navigate(to: .main)
    }
    
    
    func didCheckAuth(user: User?) {
        
        if let _ = user {
            
            router?.navigate(to: .main)
        }
    }
    
    
    func didFail(error: Error) {
        
        view?.hideLoading()
        
        if let appError = error as? AppError {
            
            view?.displayError(appError.localizedDescription)
        } else {
            
            view?.displayError(error.localizedDescription)
        }
    }
}
