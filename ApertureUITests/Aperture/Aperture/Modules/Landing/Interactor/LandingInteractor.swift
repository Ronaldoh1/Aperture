// LandingInteractor.swift

import Foundation
import Combine

final class LandingInteractor: LandingInteractorType {
    
    weak var output: LandingInteractorOutputType?
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        // Add service dependencies here when needed
    }
    
    func loadContent() {
        print("🟢 LandingInteractor: Loading content")
        // TODO: Implement content loading logic
        output?.didLoadContent()
    }
}
