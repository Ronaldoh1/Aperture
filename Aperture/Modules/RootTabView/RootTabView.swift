import SwiftUI

struct RootTabView: View {
    
    @EnvironmentObject private var session: SessionStore
    @StateObject private var dragonBubbleManager = DragonBubbleManager.shared
    @State private var selectedTab: Int = 0
    
    init() {
        // Cosmic Tab Bar Appearance
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        
        // Deep space background
        appearance.backgroundColor = UIColor(Color(hex: "#0a0a0f"))
        
        // Unselected items - muted cosmic
        appearance.stackedLayoutAppearance.normal.iconColor = UIColor(Color.white.opacity(0.4))
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [
            .foregroundColor: UIColor(Color.white.opacity(0.4)),
            .font: UIFont.systemFont(ofSize: 10, weight: .medium)
        ]
        
        // Selected items - glowing gold/cyan
        appearance.stackedLayoutAppearance.selected.iconColor = UIColor(Palette.accent.gold)
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [
            .foregroundColor: UIColor(Palette.accent.gold),
            .font: UIFont.systemFont(ofSize: 10, weight: .semibold)
        ]
        
        // Add subtle top border glow
        appearance.shadowColor = UIColor(Palette.accent.gold.opacity(0.3))
        
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        
        ZStack {
            // Main Tab View
            TabView(selection: $selectedTab) {
                
                // Tab 0: Home
                LandingEntryView(
                    container: AppContainer.shared.container,
                    selectedTab: $selectedTab
                ) { route in
                    print("🟠 RootTabView: Landing route - \(route)")
                }
                .tabItem {
                    Label("Home", systemImage: selectedTab == 0 ? "sparkles" : "sparkles")
                }
                .tag(0)
                
                // Tab 1: Timeline
                TimelineEntryView(container: AppContainer.shared.container) { route in
                    print("🟠 RootTabView: Timeline route - \(route)")
                }
                .tabItem {
                    Label("Timeline", systemImage: selectedTab == 1 ? "clock.arrow.circlepath" : "clock.arrow.circlepath")
                }
                .tag(1)
                
                // Tab 2: Cosmos
                CosmosEntryView(container: AppContainer.shared.container) { route in
                    print("🟠 RootTabView: Cosmos route - \(route)")
                    // Update Dragon context when entering Cosmos
                    dragonBubbleManager.setContext(.cosmos(sectionId: nil))
                }
                .tabItem {
                    Label("Cosmos", systemImage: selectedTab == 2 ? "globe.americas.fill" : "globe.americas")
                }
                .tag(2)
                
                // Tab 3: Awakening (promoted from More)
                AwakeningTabView()
                    .tabItem {
                        Label("Awakening", systemImage: selectedTab == 3 ? "sun.max.fill" : "sun.max")
                    }
                    .tag(3)
                
                // Tab 4: More (now contains Alexandria, Profile, Settings, FAQ)
                MoreView(selectedTab: $selectedTab)
                    .tabItem {
                        Label("More", systemImage: selectedTab == 4 ? "ellipsis.circle.fill" : "ellipsis.circle")
                    }
                    .tag(4)
                
            }
            .tint(Palette.accent.gold)
            .onChange(of: selectedTab) { _, newTab in
                HapticManager.shared.tabChanged()
                updateDragonContext(for: newTab)
            }
            
            // Dragon Bubble Overlay (appears on all tabs)
            if dragonBubbleManager.bubbleEnabled {
                DragonBubbleView(manager: dragonBubbleManager)
                    .ignoresSafeArea()
            }
        }
        // Long press anywhere to summon Dragon (when dismissed)
        .onLongPressGesture(minimumDuration: 1.5) {
            if dragonBubbleManager.isDismissed {
                dragonBubbleManager.show()
                HapticManager.shared.success()
            }
        }
        
    }
    
    // MARK: - Update Dragon Context Based on Tab
    
    private func updateDragonContext(for tab: Int) {
        switch tab {
        case 0:
            dragonBubbleManager.setContext(.general)
        case 1:
            dragonBubbleManager.setContext(.timeline(eventId: nil))
        case 2:
            dragonBubbleManager.setContext(.cosmos(sectionId: nil))
        case 3:
            dragonBubbleManager.setContext(.awakening(courseId: nil))
        default:
            dragonBubbleManager.setContext(.general)
        }
    }
    
}

// MARK: - Awakening Tab View (wraps existing module with NavigationStack)

struct AwakeningTabView: View {
    
    private let presenter: AwakeningPresenterType
    
    init() {
        // Resolve the presenter from the shared container
        self.presenter = AppContainer.shared.container.resolve(AwakeningPresenterType.self)!
    }
    
    var body: some View {
        NavigationStack {
            AwakeningView(presenter: presenter)
        }
    }
}

#Preview {
    RootTabView()
}

