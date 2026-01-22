// AuthPresenter.swift

import Foundation

final class AuthPresenter: AuthPresenterType, AuthInteractorOutputType {
    
    weak var view: AuthViewType?
    
    var interactor: AuthInteractorType?
    var router: AuthRouterType?
    
    @Published var isLoading: Bool = false
    @Published var loadingMessage: String = ""
    @Published var error: PresenterError?
    
    private var didResolveSessionCheck = false
    
    init(router: AuthRouterType?) {
        
        self.router = router
        
    }
    
    func viewDidLoad() {
        
        didResolveSessionCheck = false
        setLoading(true, message: "Checking session")
        
        // If getCurrentUser() never emits, we refuse to brick the UI forever.
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { [weak self] in
            
            guard let self else { return }
            guard self.didResolveSessionCheck == false else { return }
            
            self.setLoading(false)
            
        }
        
        interactor?.checkAuthStatus()
        
    }
    
    func didTapSignIn(email: String, password: String) {
        
        setLoading(true, message: "Signing in")
        interactor?.signIn(email: email, password: password)
        
    }
    
    func didTapSignUp(email: String, password: String) {
        
        setLoading(true, message: "Creating account")
        interactor?.signUp(email: email, password: password)
        
    }
    
    func didTapToggleMode() {
        
    }
    
    func didSignIn(user: User) {
        
        setLoading(false)
        router?.navigate(to: .landing)
        
    }
    
    func didSignUp(user: User) {
        
        setLoading(false)
        router?.navigate(to: .landing)
        
    }
    
    func didCheckAuth(user: User?) {
        
        didResolveSessionCheck = true
        setLoading(false)
        
        if user != nil {
            router?.navigate(to: .landing)
        }
        
    }
    
    func didFail(error: Error) {
        
        didResolveSessionCheck = true
        setLoading(false)
        
        let wrapped = PresenterError(error)
        self.error = wrapped
        view?.displayError(error.localizedDescription)
        
    }
    
    private func setLoading(_ loading: Bool, message: String = "") {
        
        isLoading = loading
        loadingMessage = loading ? message : ""
        
        if loading {
            view?.displayLoading(message)
        } else {
            view?.hideLoading()
        }
        
    }
    
}

