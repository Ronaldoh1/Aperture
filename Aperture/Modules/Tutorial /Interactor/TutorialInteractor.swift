//
//  TutorialInteractor.swift
//  Aperture
//

import Foundation

@MainActor
final class TutorialInteractor: @preconcurrency TutorialInteractorType {

    weak var output: TutorialInteractorOutputType?

    private let store: TutorialStateStore

    init(store: TutorialStateStore) {
        self.store = store
    }

    func loadState() {
        output?.didLoad(hasSeenTutorial: store.hasSeenTutorial)
    }

    func markSeen() {
        store.markSeen()
        output?.didMarkSeen()
    }

}
