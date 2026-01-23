import Foundation

struct ContentItem: Identifiable, Codable, Equatable {
    
    
    let id: String
    let title: String
    let description: String
    let realm: Realm
    let type: ContentType
    let duration: Int // minutes
    let tags: [String]
    let thumbnailURL: String?
    let videoURL: String?
    let articleURL: String?
    let audioURL: String?
    let createdAt: Date
    let updatedAt: Date
    
    
    // Engagement metrics
    var views: Int = 0
    var saves: Int = 0
    var completions: Int = 0
    var likes: Int = 0
    
    
    // Computed properties
    var timeAgo: String {
        
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .abbreviated
        return formatter.localizedString(for: createdAt, relativeTo: Date())
    }
    
    
    var durationText: String {
        
        if duration < 60 {
            
            return "\(duration) min"
        } else {
            
            let hours = duration / 60
            let minutes = duration % 60
            
            if minutes == 0 {
                
                return "\(hours)h"
            } else {
                
                return "\(hours)h \(minutes)m"
            }
        }
    }
    
    
    var viewsText: String {
        
        if views >= 1000 {
            
            return String(format: "%.1fK", Double(views) / 1000.0)
        } else {
            
            return "\(views)"
        }
    }
    
}
