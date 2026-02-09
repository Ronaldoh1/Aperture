// PortalLinksRegistry.swift
// Central registry for cross-module portal links
// Enables seamless navigation between related content

import SwiftUI

// MARK: - Portal Link Type

enum PortalDestination {
    case cosmos(sectionId: String?)
    case cosmosEntity(entityId: String)
    case timeline(eventId: String?)
    case alexandria(textId: String?)
    case awakening(courseId: String?)
    case awakeningPath(pathId: String)
    case practice(practiceId: String?)
    case dragon
    case search(query: String)
    
    var tabIndex: Int {
        switch self {
        case .cosmos, .cosmosEntity: return 2
        case .timeline: return 1
        case .alexandria: return 4  // More menu
        case .awakening, .awakeningPath, .practice: return 3
        case .dragon: return 4  // More menu
        case .search: return 0  // Home, then show search
        }
    }
}

// MARK: - Portal Navigation Manager

@MainActor
class PortalNavigationManager: ObservableObject {
    
    static let shared = PortalNavigationManager()
    
    @Published var pendingNavigation: PortalDestination?
    @Published var selectedTab: Int = 0
    
    private init() {
        setupNotificationObservers()
    }
    
    private func setupNotificationObservers() {
        NotificationCenter.default.addObserver(
            forName: .portalNavigationRequested,
            object: nil,
            queue: .main
        ) { [weak self] notification in
            if let destination = notification.userInfo?["destination"] as? PortalDestination {
                Task { @MainActor in
                    self?.navigate(to: destination)
                }
            }
        }
    }
    
    func navigate(to destination: PortalDestination) {
        // Set the tab first
        selectedTab = destination.tabIndex
        
        // Store pending navigation for the destination view to handle
        pendingNavigation = destination
        
        // Post notification for destination-specific handling
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { [weak self] in
            NotificationCenter.default.post(
                name: .portalNavigationExecute,
                object: nil,
                userInfo: ["destination": destination]
            )
            
            // Clear after a delay
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self?.pendingNavigation = nil
            }
        }
        
        HapticManager.shared.light()
    }
}

// MARK: - Notification Names

extension Notification.Name {
    static let portalNavigationRequested = Notification.Name("portalNavigationRequested")
    static let portalNavigationExecute = Notification.Name("portalNavigationExecute")
}

// MARK: - Portal Link View Components

/// A button that navigates to another module with context
struct PortalLinkButton: View {
    let text: String
    let icon: String?
    let destination: PortalDestination
    let color: Color
    
    @ObservedObject private var navManager = PortalNavigationManager.shared
    
    init(
        _ text: String,
        icon: String? = "arrow.right.circle.fill",
        destination: PortalDestination,
        color: Color = Palette.primary.cyan
    ) {
        self.text = text
        self.icon = icon
        self.destination = destination
        self.color = color
    }
    
    var body: some View {
        Button(action: {
            navManager.navigate(to: destination)
        }) {
            HStack(spacing: 6) {
                Text(text)
                    .font(.system(size: 14, weight: .medium))
                
                if let icon = icon {
                    Image(systemName: icon)
                        .font(.system(size: 12))
                }
            }
            .foregroundColor(color)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

/// A card that links to another module
struct PortalCard: View {
    let title: String
    let subtitle: String
    let icon: String
    let destination: PortalDestination
    let color: Color
    
    @ObservedObject private var navManager = PortalNavigationManager.shared
    
    var body: some View {
        Button(action: {
            navManager.navigate(to: destination)
        }) {
            HStack(spacing: 12) {
                Image(systemName: icon)
                    .font(.system(size: 20))
                    .foregroundColor(color)
                    .frame(width: 44, height: 44)
                    .background(color.opacity(0.15))
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(title)
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundColor(.white)
                    
                    Text(subtitle)
                        .font(.system(size: 12))
                        .foregroundColor(.white.opacity(0.6))
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .font(.system(size: 14))
                    .foregroundColor(color.opacity(0.6))
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(color.opacity(0.08))
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(color.opacity(0.2), lineWidth: 1)
                    )
            )
        }
        .buttonStyle(PlainButtonStyle())
    }
}

/// Inline portal chip for embedding in content
struct PortalChip: View {
    let text: String
    let destination: PortalDestination
    let color: Color
    
    @ObservedObject private var navManager = PortalNavigationManager.shared
    
    init(_ text: String, to destination: PortalDestination, color: Color = Palette.primary.cyan) {
        self.text = text
        self.destination = destination
        self.color = color
    }
    
    var body: some View {
        Button(action: {
            navManager.navigate(to: destination)
        }) {
            HStack(spacing: 4) {
                Text(text)
                    .font(.system(size: 12, weight: .medium))
                Image(systemName: "arrow.up.right")
                    .font(.system(size: 9))
            }
            .foregroundColor(color)
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(
                Capsule()
                    .fill(color.opacity(0.15))
            )
        }
        .buttonStyle(PlainButtonStyle())
    }
}

// MARK: - Portal Links Registry

/// Pre-defined portal links for common cross-references
struct PortalLinks {
    
    // MARK: - Cosmos Links
    
    static func toSophia() -> some View {
        PortalChip("Sophia", to: .cosmosEntity(entityId: "sophia"), color: .purple)
    }
    
    static func toYaldabaoth() -> some View {
        PortalChip("Yaldabaoth", to: .cosmosEntity(entityId: "yaldabaoth"), color: .red)
    }
    
    static func toPleroma() -> some View {
        PortalChip("Pleroma", to: .cosmos(sectionId: "pleroma"), color: Palette.accent.gold)
    }
    
    static func toCosmosOverview() -> some View {
        PortalLinkButton("Explore the Cosmos", destination: .cosmos(sectionId: nil), color: .cyan)
    }
    
    // MARK: - Alexandria Links
    
    static func toGospelOfThomas() -> some View {
        PortalChip("Gospel of Thomas", to: .alexandria(textId: "gospel_thomas"), color: .green)
    }
    
    static func toApocryphonOfJohn() -> some View {
        PortalChip("Apocryphon of John", to: .alexandria(textId: "apocryphon_john"), color: .blue)
    }
    
    static func toAlexandriaLibrary() -> some View {
        PortalLinkButton("Visit the Library", destination: .alexandria(textId: nil), color: .green)
    }
    
    // MARK: - Awakening Links
    
    static func toKundalini() -> some View {
        PortalChip("Kundalini Path", to: .awakeningPath(pathId: "kundalini"), color: .orange)
    }
    
    static func toBuddhism() -> some View {
        PortalChip("Buddhist Path", to: .awakeningPath(pathId: "buddhism"), color: Palette.accent.gold)
    }
    
    static func toAwakeningPaths() -> some View {
        PortalLinkButton("All Awakening Paths", destination: .awakening(courseId: nil), color: .orange)
    }
    
    // MARK: - Timeline Links
    
    static func toNagHammadi() -> some View {
        PortalChip("Nag Hammadi Discovery", to: .timeline(eventId: "nag_hammadi"), color: .purple)
    }
    
    static func toTimeline() -> some View {
        PortalLinkButton("View Timeline", destination: .timeline(eventId: nil), color: .purple)
    }
    
    // MARK: - Dragon Links
    
    static func toDragon() -> some View {
        PortalLinkButton("Ask the Dragon", icon: "flame.fill", destination: .dragon, color: .orange)
    }
}

// MARK: - Related Content Section

/// A section showing related content from other modules
struct RelatedContentSection: View {
    let title: String
    let links: [(String, String, PortalDestination, Color)]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "link")
                    .foregroundColor(Palette.accent.gold)
                Text(title.uppercased())
                    .font(.system(size: 12, weight: .bold))
                    .foregroundColor(Palette.accent.gold)
                    .tracking(2)
            }
            
            VStack(spacing: 8) {
                ForEach(links.indices, id: \.self) { index in
                    let link = links[index]
                    PortalCard(
                        title: link.0,
                        subtitle: link.1,
                        icon: iconFor(destination: link.2),
                        destination: link.2,
                        color: link.3
                    )
                }
            }
        }
    }
    
    private func iconFor(destination: PortalDestination) -> String {
        switch destination {
        case .cosmos, .cosmosEntity: return "globe.americas.fill"
        case .timeline: return "clock.arrow.circlepath"
        case .alexandria: return "books.vertical.fill"
        case .awakening, .awakeningPath: return "sun.max.fill"
        case .practice: return "figure.mind.and.body"
        case .dragon: return "flame.fill"
        case .search: return "magnifyingglass"
        }
    }
}

// MARK: - Example Usage View

struct PortalLinksExampleView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Inline chips in text
                VStack(alignment: .leading, spacing: 8) {
                    Text("In Gnostic mythology, ")
                        .foregroundColor(.white)
                    + Text("Sophia")
                        .foregroundColor(.purple)
                    + Text(" fell from the ")
                        .foregroundColor(.white)
                    + Text("Pleroma")
                        .foregroundColor(Palette.accent.gold)
                    + Text(" and gave birth to ")
                        .foregroundColor(.white)
                    + Text("Yaldabaoth")
                        .foregroundColor(.red)
                    + Text(".")
                        .foregroundColor(.white)
                    
                    // Portal chips
                    HStack {
                        PortalLinks.toSophia()
                        PortalLinks.toPleroma()
                        PortalLinks.toYaldabaoth()
                    }
                }
                .padding()
                .background(Color.white.opacity(0.05))
                .cornerRadius(12)
                
                // Related content section
                RelatedContentSection(
                    title: "Related Content",
                    links: [
                        ("Apocryphon of John", "The secret teaching about the Demiurge", .alexandria(textId: "apocryphon_john"), .green),
                        ("Kundalini Awakening", "Energy rising through chakras", .awakeningPath(pathId: "kundalini"), .orange),
                        ("Nag Hammadi Discovery", "When the texts were found", .timeline(eventId: "nag_hammadi"), .purple)
                    ]
                )
                
                // Navigation buttons
                VStack(spacing: 8) {
                    PortalLinks.toCosmosOverview()
                    PortalLinks.toAlexandriaLibrary()
                    PortalLinks.toDragon()
                }
            }
            .padding()
        }
        .background(Color(hex: "#0a0a1a"))
    }
}

// MARK: - Preview

#Preview {
    PortalLinksExampleView()
}
