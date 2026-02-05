import Foundation

import Swinject

public final class AppContainer {

    public static let shared = AppContainer()

    public let container: Container

    private init() {
        container = Container()
        AppAssembly().assemble(container: container)
    }
}
