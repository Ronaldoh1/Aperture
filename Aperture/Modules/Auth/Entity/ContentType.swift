import Foundation

enum ContentType: String, Codable, CaseIterable {
    
    
    case video = "Video"
    case article = "Article"
    case audio = "Audio"
    case interactive = "Interactive"
    case course = "Course"
    
    
    var icon: String {
        
        switch self {
            
        case .video:
            return "play.rectangle.fill"
            
        case .article:
            return "doc.text.fill"
            
        case .audio:
            return "waveform"
            
        case .interactive:
            return "hand.tap.fill"
            
        case .course:
            return "book.fill"
        }
    }
    
    
    var estimatedMinutesPerUnit: Int {
        
        switch self {
            
        case .video:
            return 15
            
        case .article:
            return 10
            
        case .audio:
            return 20
            
        case .interactive:
            return 30
            
        case .course:
            return 60
        }
    }
    
}
