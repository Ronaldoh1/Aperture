// PresenterError.swift

import Foundation

struct PresenterError: LocalizedError, Identifiable {
    
    let id = UUID()
    let message: String
    
    init(message: String) {
        self.message = message
    }
    
    init(_ underlying: Error) {
        self.message = underlying.localizedDescription
    }
    
    var errorDescription: String? {
        message
    }
    
}
