// AlexandriaInteractor.swift

import Foundation
import Combine

final class AlexandriaInteractor: AlexandriaInteractorType {
    
    weak var output: AlexandriaInteractorOutputType?
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        // Add service dependencies here when needed
    }
    
    func loadContent() {
        print("🟢 AlexandriaInteractor: Loading content")
        // TODO: Implement content loading logic
        output?.didLoadContent()
    }
}
