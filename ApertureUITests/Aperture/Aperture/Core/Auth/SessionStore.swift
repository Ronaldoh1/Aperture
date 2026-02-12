import Foundation
import FirebaseAuth

@MainActor
final class SessionStore: ObservableObject {
    @Published var isAuthenticated: Bool = false
    @Published var isBootstrapping: Bool = true

    private var handle: AuthStateDidChangeListenerHandle?

    init() {
        print("🟣 SessionStore: Initializing")
        handle = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            Task { @MainActor in
                guard let self else { return }
                print("🟣 SessionStore: Auth state changed - user exists: \(user != nil)")
                self.isAuthenticated = (user != nil)
                self.isBootstrapping = false
                print("🟣 SessionStore: isAuthenticated = \(self.isAuthenticated)")
            }
        }
    }

    deinit {
        if let handle {
            Auth.auth().removeStateDidChangeListener(handle)
        }
    }
}
