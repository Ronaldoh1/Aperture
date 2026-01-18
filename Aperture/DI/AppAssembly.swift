import Swinject

final class AppAssembly: Assembly {

    func assemble(container: Container) {

        container.register(StorageServiceType.self) { _ in
            StorageService()
        }
        .inObjectScope(.container)

        container.register(CurrentUserType.self) { resolver in
            guard let storage = resolver.resolve(StorageServiceType.self) else {
                fatalError("StorageServiceType not resolved")
            }
            return CurrentUser(storageService: storage)
        }
        .inObjectScope(.container)

        container.register(AuthServiceType.self) { _ in
            AuthService()
        }
        .inObjectScope(.container)

        AuthAssembly().assemble(container: container)
    }
}
