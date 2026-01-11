import Foundation

public final class AppContainer {
    
  public static let shared = AppContainer()

  public let container: DIContainer

  private init() {
    self.container = DIContainer()
    AppAssembly().assemble(container)
  }
    
}

public protocol AssemblyType {
  func assemble(_ container: DIContainer)
}

public struct AppAssembly: AssemblyType {
    public init() {}

    public func assemble(_ container: DIContainer) {

        // MARK: - Logging (OSLog prod, SwiftyBeaver debug)
        container.register(AppLogging.self) { _ in
            AppLogger.shared
        }

        // MARK: - Firebase services (later)
        // container.register(AuthService.self) { _ in FirebaseAuthService() }
        // container.register(UserRepository.self) { _ in FirestoreUserRepository() }

        // MARK: - Modules
        // AuthAssembly().assemble(container)
        // LandingAssembly().assemble(container)
        // TimelineAssembly().assemble(container)
        // CosmosAssembly().assemble(container)
        // AlexandriaAssembly().assemble(container)
    }
}
