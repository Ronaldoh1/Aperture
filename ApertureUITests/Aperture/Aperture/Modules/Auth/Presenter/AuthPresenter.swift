import Combine
import Foundation

final class AuthPresenter: AuthPresenterType, AuthInteractorOutputType {
  weak var view: AuthViewType?
  var interactor: AuthInteractorType?
  var router: AuthRouterType?

  @Published var isLoading: Bool = false
  @Published var loadingMessage: String = ""
  @Published var error: PresenterError?

  init(router: AuthRouterType) {
    self.router = router
  }

  func viewDidLoad() {
    interactor?.checkAuthStatus()
  }

  func didTapSignIn(email: String, password: String) {
    isLoading = true
    loadingMessage = "Signing in"
    error = nil
    interactor?.signIn(email: email, password: password)
  }

  func didTapSignUp(email: String, password: String) {
    print("🔵 AuthPresenter: Starting sign up for \(email)")
    print("🔵 AuthPresenter: Interactor is \(interactor == nil ? "NIL ❌" : "set ✓")")
    isLoading = true
    loadingMessage = "Creating account"
    error = nil
    interactor?.signUp(email: email, password: password)
  }

  func didTapResetPassword(email: String) {
    isLoading = true
    loadingMessage = "Sending reset email"
    error = nil
    interactor?.resetPassword(email: email)
  }

  func didSignIn(user _: User) {
    isLoading = false
    loadingMessage = ""
    router?.navigate(to: .landing)
  }

  func didSignUp(user: User) {
    print("🟢 AuthPresenter: Sign up succeeded for user \(user.id)")
    isLoading = false
    loadingMessage = ""
    router?.navigate(to: .landing)
    print("🟢 AuthPresenter: Navigated to landing")
  }

  func didSendPasswordReset() {
    isLoading = false
    loadingMessage = ""
  }

  func didCheckAuth(user: User?) {
    if user != nil {
      router?.navigate(to: .landing)
    }
  }

  func didFail(error: Error) {
    print("🔴 AuthPresenter: Error - \(error.localizedDescription)")
    isLoading = false
    loadingMessage = ""
    self.error = PresenterError(error)
  }
}
