import Foundation
import Combine

final class AuthInteractor: AuthInteractorType {

    weak var output: AuthInteractorOutputType?

    private let authService: AuthServiceType
    private let currentUser: CurrentUserType
    private var cancellables = Set<AnyCancellable>()

    init(authService: AuthServiceType, currentUser: CurrentUserType) {
        self.authService = authService
        self.currentUser = currentUser
    }

    func signIn(email: String, password: String) {
        authService.signIn(email: email, password: password)
            .flatMap { [unowned self] user in
                self.currentUser.saveUser(user).map { user }
            }
            .sink(
                receiveCompletion: { [weak self] in
                    if case .failure(let error) = $0 {
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
        print("🟢 AuthInteractor: Starting Firebase sign up")
        authService.signUp(email: email, password: password)
            .flatMap { [unowned self] user in
                print("🟢 AuthInteractor: Firebase sign up succeeded, saving user")
                return self.currentUser.saveUser(user).map { user }
            }
            .sink(
                receiveCompletion: { [weak self] in
                    if case .failure(let error) = $0 {
                        print("🔴 AuthInteractor: Sign up failed - \(error.localizedDescription)")
                        self?.output?.didFail(error: error)
                    }
                },
                receiveValue: { [weak self] user in
                    print("🟢 AuthInteractor: User saved, calling output.didSignUp")
                    self?.output?.didSignUp(user: user)
                }
            )
            .store(in: &cancellables)
    }

    func resetPassword(email: String) {
        authService.resetPassword(email: email)
            .sink(
                receiveCompletion: { [weak self] in
                    if case .failure(let error) = $0 {
                        self?.output?.didFail(error: error)
                    }
                },
                receiveValue: { [weak self] in
                    self?.output?.didSendPasswordReset()
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
