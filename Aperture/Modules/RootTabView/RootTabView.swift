import SwiftUI

struct RootTabView: View {
    
    @EnvironmentObject private var session: SessionStore
    @StateObject private var bubbleManager = SacredGeometryBubbleManager.shared
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
                
                // Tab 4: Chronokeeper AI Guide
                ChronokeeperChatView()
                    .tabItem {
                        Label("Guide", systemImage: selectedTab == 4 ? "bubble.left.and.text.bubble.right.fill" : "bubble.left.and.text.bubble.right")
                    }
                    .tag(4)
                
                // Tab 5: More (now contains Alexandria, Profile, Settings, FAQ)
                MoreView(selectedTab: $selectedTab)
                    .tabItem {
                        Label("More", systemImage: selectedTab == 5 ? "ellipsis.circle.fill" : "ellipsis.circle")
                    }
                    .tag(5)
                
            }
            .tint(Palette.accent.gold)
            .onChange(of: selectedTab) { _, _ in
                HapticManager.shared.tabChanged()
            }
        }
        .withSacredGeometryBubble()
        
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

