// TimelineInteractor.swift

import Foundation
import Combine

final class TimelineInteractor: TimelineInteractorType {
    
    weak var output: TimelineInteractorOutputType?
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        // Add service dependencies here when needed
    }
    
    func loadTimeline() {
        print("🟢 TimelineInteractor: Loading timeline")
        // TODO: Load from backend/local storage
        output?.didLoadTimeline()
    }
}
