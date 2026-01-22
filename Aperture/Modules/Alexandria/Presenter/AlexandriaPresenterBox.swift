// AlexandriaPresenterBox.swift

import Foundation
import Combine

final class AlexandriaPresenterBox: ObservableObject {
    
    let presenter: any AlexandriaPresenterType
    
    @Published var isLoading: Bool = false
    @Published var loadingMessage: String = ""
    @Published var error: PresenterError?
    
    private var cancellables = Set<AnyCancellable>()
    
    init(presenter: any AlexandriaPresenterType) {
        self.presenter = presenter
        
        guard let concrete = presenter as? AlexandriaPresenter else {
            return
        }
        
        concrete.$isLoading
            .receive(on: DispatchQueue.main)
            .assign(to: &$isLoading)
        
        concrete.$loadingMessage
            .receive(on: DispatchQueue.main)
            .assign(to: &$loadingMessage)
        
        concrete.$error
            .receive(on: DispatchQueue.main)
            .assign(to: &$error)
    }
}
