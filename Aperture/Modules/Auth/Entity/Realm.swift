import Foundation
import SwiftUI

enum Realm: String, Codable, CaseIterable {
    
    case physical = "Physical"
    case mental = "Mental"
    case spiritual = "Spiritual"
    
    
    var color: Color {
        
        switch self {
            
        case .physical:
            return Color(red: 0.8, green: 0.4, blue: 0.2) // Earthy orange
            
        case .mental:
            return Color(red: 0.2, green: 0.6, blue: 1.0) // Sky blue
            
        case .spiritual:
            return Color(red: 0.6, green: 0.2, blue: 0.8) // Deep purple
        }
    }
    
    
    var icon: String {
        
        switch self {
            
        case .physical:
            return "figure.walk"
            
        case .mental:
            return "brain.head.profile"
            
        case .spiritual:
            return "sparkles"
        }
    }
    
    
    var description: String {
        
        switch self {
            
        case .physical:
            return "Master your body, energy, and physical presence"
            
        case .mental:
            return "Develop consciousness, awareness, and mental clarity"
            
        case .spiritual:
            return "Connect to higher dimensions and universal truth"
        }
    }
    
}
