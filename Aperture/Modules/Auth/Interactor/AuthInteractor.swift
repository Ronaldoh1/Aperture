import Foundation
import Combine

class AuthInteractor: AuthInteractorType {
    
    
    weak var output: AuthInteractorOutputType?
    
    
    private let authService: AuthService
    private let currentUser: CurrentUser
    private var cancellables = Set<AnyCancellable>()
    
    
    // MARK: - Initialization
    init(authService: AuthService, currentUser: CurrentUser) {
        
        self.authService = authService
        self.currentUser = currentUser
    }
    
    
    // MARK: - AuthInteractorType Methods
    func signIn(email: String, password: String) {
        
        authService.signIn(email: email, password: password)
            .flatMap { [weak self] user -> AnyPublisher<User, Error> in
                
                guard let self = self else {
                    
                    return Fail(error: AppError.unknown).eraseToAnyPublisher()
                }
                
                return self.currentUser.saveUser(user)
                    .map { user }
                    .eraseToAnyPublisher()
            }
            .sink(
                receiveCompletion: { [weak self] completion in
                    
                    if case .failure(let error) = completion {
                        
                        self?.output?.didFail(error: error)
                    }
                },
                receiveValue: { [weak self] user in
                    
                    self?.output?.didSignIn(user: user)
                }
            )
            .store(in: &cancellables)
    }
    
    
    func signUp(email: String, password: String) {
        
        authService.signUp(email: email, password: password)
            .flatMap { [weak self] user -> AnyPublisher<User, Error> in
                
                guard let self = self else {
                    
                    return Fail(error: AppError.unknown).eraseToAnyPublisher()
                }
                
                return self.currentUser.saveUser(user)
                    .map { user }
                    .eraseToAnyPublisher()
            }
            .sink(
                receiveCompletion: { [weak self] completion in
                    
                    if case .failure(let error) = completion {
                        
                        self?.output?.didFail(error: error)
                    }
                },
                receiveValue: { [weak self] user in
                    
                    self?.output?.didSignUp(user: user)
                }
            )
            .store(in: &cancellables)
    }
    
    
    func checkAuthStatus() {
        
        currentUser.getCurrentUser()
            .sink { [weak self] user in
                
                self?.output?.didCheckAuth(user: user)
            }
            .store(in: &cancellables)
    }
}
