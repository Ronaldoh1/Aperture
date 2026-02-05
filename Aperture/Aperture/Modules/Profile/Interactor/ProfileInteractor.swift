// ProfileInteractor.swift

import Foundation
import Combine
import FirebaseAuth

final class ProfileInteractor: ProfileInteractorType {
    
    weak var output: ProfileInteractorOutputType?
    
    private let authService: AuthServiceType
    private var cancellables = Set<AnyCancellable>()
    
    init(authService: AuthServiceType) {
        self.authService = authService
    }
    
    func loadProfile() {
        print("🟢 ProfileInteractor: Loading profile")
        // TODO: Load user profile data
        output?.didLoadProfile()
    }
    
    func signOut() {
        print("🟢 ProfileInteractor: Signing out")
        authService.signOut()
            .sink(
                receiveCompletion: { [weak self] in
                    if case .failure(let error) = $0 {
                        print("🔴 ProfileInteractor: Sign out failed - \(error.localizedDescription)")
                        self?.output?.didFail(error: error)
                    }
                },
                receiveValue: { [weak self] in
                    print("🟢 ProfileInteractor: Sign out successful")
                    self?.output?.didSignOut()
                }
            )
            .store(in: &cancellables)
    }
}
