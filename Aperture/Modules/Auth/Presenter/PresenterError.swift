// PresenterError.swift

import Foundation

struct PresenterError: LocalizedError, Identifiable {
    
    let id = UUID()
    let underlying: Error
    
    init(_ underlying: Error) {
        
        self.underlying = underlying
        
    }
    
    var errorDescription: String? {
        
        underlying.localizedDescription
        
    }
    
}
