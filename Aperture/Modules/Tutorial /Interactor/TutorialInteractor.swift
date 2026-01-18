// TutorialInteractor.swift

import Foundation

final class TutorialInteractor: TutorialInteractorType {

    weak var output: TutorialInteractorOutputType?

    private let store: TutorialStateStore

    init(store: TutorialStateStore) {
        self.store = store
    }

    func loadState() {
        output?.didLoad(hasSeenTutorial: store.hasSeenTutorial)
    }

    func markSeen() {
        do {
            try store.markSeen()
            output?.didMarkSeen()
        } catch {
            output?.didFail(message: "Could not save tutorial completion. Please try again.")
        }
    }

}
