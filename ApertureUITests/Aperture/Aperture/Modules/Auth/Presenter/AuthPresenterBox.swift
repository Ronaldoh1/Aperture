// AuthPresenterBox.swift

import Foundation
import Combine

final class AuthPresenterBox: ObservableObject {
    
    let presenter: any AuthPresenterType
    
    @Published var isLoading: Bool = false
    @Published var loadingMessage: String = ""
    @Published var error: PresenterError?
    
    private var cancellables = Set<AnyCancellable>()
    
    init(presenter: any AuthPresenterType) {
        
        self.presenter = presenter
        
        guard let concrete = presenter as? AuthPresenter else {
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
