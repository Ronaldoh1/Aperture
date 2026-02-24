// CosmosPresenterBox.swift

import Foundation
import Combine

final class CosmosPresenterBox: ObservableObject {
    
    let presenter: any CosmosPresenterType
    
    @Published var isLoading: Bool = false
    @Published var loadingMessage: String = ""
    @Published var error: PresenterError?
    
    private var cancellables = Set<AnyCancellable>()
    
    init(presenter: any CosmosPresenterType) {
        self.presenter = presenter
        
        guard let concrete = presenter as? CosmosPresenter else {
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
