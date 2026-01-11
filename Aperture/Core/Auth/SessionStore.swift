import Foundation
import FirebaseAuth

@MainActor
final class SessionStore: ObservableObject {
    @Published var isAuthenticated: Bool = false
    @Published var isBootstrapping: Bool = true

    private var handle: AuthStateDidChangeListenerHandle?

    init() {
        handle = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            guard let self else { return }
            self.isAuthenticated = (user != nil)
            self.isBootstrapping = false
        }
    }

    deinit {
        if let handle {
            Auth.auth().removeStateDidChangeListener(handle)
        }
    }
}
