import SwiftUI

struct RootTabView: View {
    
    @EnvironmentObject private var session: SessionStore
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
        
        TabView(selection: $selectedTab) {
            
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
            
            TimelineEntryView(container: AppContainer.shared.container) { route in
                print("🟠 RootTabView: Timeline route - \(route)")
            }
            .tabItem {
                Label("Timeline", systemImage: selectedTab == 1 ? "clock.arrow.circlepath" : "clock.arrow.circlepath")
            }
            .tag(1)
            
            CosmosEntryView(container: AppContainer.shared.container) { route in
                print("🟠 RootTabView: Cosmos route - \(route)")
            }
            .tabItem {
                Label("Cosmos", systemImage: selectedTab == 2 ? "globe.americas.fill" : "globe.americas")
            }
            .tag(2)
            
            AlexandriaEntryView(container: AppContainer.shared.container) { route in
                print("🟠 RootTabView: Alexandria route - \(route)")
            }
            .tabItem {
                Label("Alexandria", systemImage: selectedTab == 3 ? "books.vertical.fill" : "books.vertical")
            }
            .tag(3)
            
            // Custom More View (Awakening + Profile + Settings)
            MoreView(selectedTab: $selectedTab)
                .tabItem {
                    Label("More", systemImage: selectedTab == 4 ? "ellipsis.circle.fill" : "ellipsis.circle")
                }
                .tag(4)
            
        }
        .tint(Palette.accent.gold)
        .onChange(of: selectedTab) { _, _ in
            HapticManager.shared.tabChanged()
        }
        
    }
    
}

#Preview {
    RootTabView()
}

