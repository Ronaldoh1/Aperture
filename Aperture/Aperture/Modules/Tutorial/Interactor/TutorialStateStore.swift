// TutorialStateStore.swift

import Foundation

@MainActor
final class TutorialStateStore: ObservableObject {

    @Published private(set) var isBootstrapping: Bool = true
    @Published private(set) var hasSeenTutorial: Bool = false

    private let key = "aperture.hasSeenTutorial.v1"

    init() {
        load()
    }

    func load() {
        hasSeenTutorial = UserDefaults.standard.bool(forKey: key)
        isBootstrapping = false
    }

    func markSeen() {
        hasSeenTutorial = true
        UserDefaults.standard.set(true, forKey: key)
    }

    func resetForDebug() {
        hasSeenTutorial = false
        UserDefaults.standard.set(false, forKey: key)
    }

}
