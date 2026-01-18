// TutorialStateStore.swift

import Foundation
import Combine

final class TutorialStateStore: ObservableObject {

    @Published private(set) var isBootstrapping: Bool = true
    @Published private(set) var hasSeenTutorial: Bool = false

    private let defaults: UserDefaults
    private let hasSeenKey = "hasSeenTutorial"

    init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
        bootstrap()
    }

    func markSeen() throws {
        defaults.set(true, forKey: hasSeenKey)
        hasSeenTutorial = true
    }

    func resetForDebug() {
        defaults.removeObject(forKey: hasSeenKey)
        hasSeenTutorial = false
    }

    private func bootstrap() {
        hasSeenTutorial = defaults.bool(forKey: hasSeenKey)
        isBootstrapping = false
    }

}
