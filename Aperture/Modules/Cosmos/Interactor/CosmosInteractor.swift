// CosmosInteractor.swift

import Foundation
import Combine

final class CosmosInteractor: CosmosInteractorType {
    
    weak var output: CosmosInteractorOutputType?
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        // Add service dependencies here when needed
    }
    
    func loadContent() {
        print("🟢 CosmosInteractor: Loading content")
        // TODO: Implement content loading logic
        output?.didLoadContent()
    }
}
