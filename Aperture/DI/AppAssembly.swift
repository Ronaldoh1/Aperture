//
//  AppAssembly.swift
//  Aperture
//
//  Created by Ronald Hernandez on 1/12/26.
//

import Swinject

final class AppAssembly: Assembly {

    func assemble(container: Container) {

        // MARK: - Core Services

        container.register(StorageService.self) { _ in
            StorageService()
        }
        .inObjectScope(.container)

        container.register(CurrentUserType.self) { resolver in
            guard let storageService = resolver.resolve(StorageService.self) else {
                fatalError("CurrentUserType dependencies not resolved")
            }

            return CurrentUser(storageService: storageService)
        }
        .inObjectScope(.container)

        container.register(AuthService.self) { _ in
            AuthService()
        }
        .inObjectScope(.container)

        // MARK: - Modules

        AuthAssembly().assemble(container: container)

        // Add others when ready
        // LandingAssembly().assemble(container: container)
        // AlexandriaAssembly().assemble(container: container)
        // CosmosAssembly().assemble(container: container)
        // TimelineAssembly().assemble(container: container)
    }
}
