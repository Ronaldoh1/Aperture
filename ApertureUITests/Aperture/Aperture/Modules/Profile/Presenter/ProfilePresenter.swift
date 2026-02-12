// ProfilePresenter.swift

import Foundation
import Combine

final class ProfilePresenter: ProfilePresenterType, ProfileInteractorOutputType {
    
    weak var view: ProfileViewType?
    var interactor: ProfileInteractorType?
    var router: ProfileRouterType?
    
    @Published var isLoading: Bool = false
    @Published var loadingMessage: String = ""
    @Published var error: PresenterError?
    
    init(router: ProfileRouterType) {
        self.router = router
    }
    
    func viewDidLoad() {
        print("🟢 ProfilePresenter: View loaded")
        interactor?.loadProfile()
    }
    
    func didTapSignOut() {
        print("🟢 ProfilePresenter: Sign out tapped")
        interactor?.signOut()
    }
    
    func didLoadProfile() {
        print("🟢 ProfilePresenter: Profile loaded")
    }
    
    func didSignOut() {
        print("🟢 ProfilePresenter: Sign out successful, navigating to auth")
        router?.navigate(to: .auth)
    }
    
    func didFail(error: Error) {
        print("🔴 ProfilePresenter: Error - \(error.localizedDescription)")
    }
}
