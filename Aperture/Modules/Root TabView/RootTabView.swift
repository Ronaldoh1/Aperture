import SwiftUI

struct RootTabView: View {
    
    @EnvironmentObject private var session: SessionStore
    @State private var selectedTab: Int = 0
    
    var body: some View {
        
        TabView(selection: $selectedTab) {
            
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
            
            TimelineEntryView(container: AppContainer.shared.container) { route in
                print("🟠 RootTabView: Timeline route - \(route)")
            }
            .tabItem {
                Label("Timeline", systemImage: "clock.arrow.circlepath")
            }
            .tag(1)
            
            CosmosEntryView(container: AppContainer.shared.container) { route in
                print("🟠 RootTabView: Cosmos route - \(route)")
            }
            .tabItem {
                Label("Cosmos", systemImage: "globe.americas.fill")
            }
            .tag(2)
            
            AlexandriaEntryView(container: AppContainer.shared.container) { route in
                print("🟠 RootTabView: Alexandria route - \(route)")
            }
            .tabItem {
                Label("Alexandria", systemImage: "books.vertical.fill")
            }
            .tag(3)
            
            // Custom More View (Awakening + Profile + Settings)
            MoreView(selectedTab: $selectedTab)
                .tabItem {
                    Label("More", systemImage: "ellipsis.circle.fill")
                }
                .tag(4)
            
        }
        .accentColor(Palette.primary.cyan)
        
    }
    
}

#Preview {
    RootTabView()
}

