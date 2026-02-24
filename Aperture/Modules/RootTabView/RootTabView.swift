import SwiftUI

struct RootTabView: View {
    
    @EnvironmentObject private var session: SessionStore
    @StateObject private var bubbleManager = SacredGeometryBubbleManager.shared
    @State private var selectedTab: Int = 0
    
    init() {
        // ── Tab Bar ──────────────────────────────────────────────
        let tabAppearance = UITabBarAppearance()
        tabAppearance.configureWithOpaqueBackground()
        tabAppearance.backgroundColor = UIColor(Color(hex: "#0a0a0f"))
        
        tabAppearance.stackedLayoutAppearance.normal.iconColor = UIColor(Color.white.opacity(0.4))
        tabAppearance.stackedLayoutAppearance.normal.titleTextAttributes = [
            .foregroundColor: UIColor(Color.white.opacity(0.4)),
            .font: UIFont.systemFont(ofSize: 10, weight: .medium)
        ]
        tabAppearance.stackedLayoutAppearance.selected.iconColor = UIColor(Color(hex: "#FFD700"))
        tabAppearance.stackedLayoutAppearance.selected.titleTextAttributes = [
            .foregroundColor: UIColor(Color(hex: "#FFD700")),
            .font: UIFont.systemFont(ofSize: 10, weight: .semibold)
        ]
        tabAppearance.shadowColor = UIColor(Color(hex: "#FFD700").opacity(0.3))
        
        UITabBar.appearance().standardAppearance = tabAppearance
        UITabBar.appearance().scrollEdgeAppearance = tabAppearance
        
        // ── Navigation Bar ───────────────────────────────────────
        let navAppearance = UINavigationBarAppearance()
        navAppearance.configureWithOpaqueBackground()
        navAppearance.backgroundColor = UIColor(Color(hex: "#07070d"))
        navAppearance.shadowColor = UIColor(Color(hex: "#FFD700").opacity(0.15))
        
        // Title text — white
        navAppearance.titleTextAttributes = [
            .foregroundColor: UIColor.white,
            .font: UIFont.systemFont(ofSize: 17, weight: .semibold)
        ]
        navAppearance.largeTitleTextAttributes = [
            .foregroundColor: UIColor.white,
            .font: UIFont.systemFont(ofSize: 34, weight: .bold)
        ]
        
        UINavigationBar.appearance().standardAppearance = navAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navAppearance
        UINavigationBar.appearance().compactAppearance = navAppearance
        
        // Back button — gold
        UINavigationBar.appearance().tintColor = UIColor(Color(hex: "#FFD700"))
    }
    
    var body: some View {
        
        ZStack {
            TabView(selection: $selectedTab) {
                
                // Tab 0: Home
                LandingEntryView(
                    container: AppContainer.shared.container,
                    selectedTab: $selectedTab
                ) { route in
                    print("🟠 RootTabView: Landing route - \(route)")
                }
                .tabItem {
                    Label("Home", systemImage: "sparkles")
                }
                .tag(0)
                
                // Tab 1: Timeline
                TimelineEntryView(container: AppContainer.shared.container) { route in
                    print("🟠 RootTabView: Timeline route - \(route)")
                }
                .tabItem {
                    Label("Timeline", systemImage: "clock.arrow.circlepath")
                }
                .tag(1)
                
                // Tab 2: Cosmos
                CosmosEntryView(container: AppContainer.shared.container) { route in
                    print("🟠 RootTabView: Cosmos route - \(route)")
                }
                .tabItem {
                    Label("Cosmos", systemImage: "globe.americas.fill")
                }
                .tag(2)
                
                // Tab 3: Awakening
                AwakeningTabView()
                    .tabItem {
                        Label("Awakening", systemImage: "sun.max.fill")
                    }
                    .tag(3)
                
                // Tab 4: More (houses Alexandria, Guide, Profile, Settings, etc.)
                MoreView(selectedTab: $selectedTab)
                    .tabItem {
                        Label("Explore", systemImage: "sparkles")
                    }
                    .tag(4)
                
            }
            .tint(Color(hex: "#FFD700"))
            .onChange(of: selectedTab) { _, _ in
                HapticManager.shared.tabChanged()
            }
        }
        .withSunCompanion()
        
    }
    
}

// MARK: - Awakening Tab View

struct AwakeningTabView: View {
    
    private let presenter: AwakeningPresenterType
    
    init() {
        self.presenter = AppContainer.shared.container.resolve(AwakeningPresenterType.self)!
    }
    
    var body: some View {
        NavigationStack {
            AwakeningView(presenter: presenter)
        }
    }
}

// MARK: - Alexandria Tab View (still available via MoreView)

struct AlexandriaTabView: View {

    var body: some View {
        NavigationStack {
            AlexandriaEntryView(container: AppContainer.shared.container) { route in
                print("🟡 AlexandriaTabView: route - \(route)")
            }
        }
    }
}

#Preview {
    RootTabView()
}
