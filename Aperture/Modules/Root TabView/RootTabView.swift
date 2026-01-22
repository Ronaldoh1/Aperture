import SwiftUI

struct RootTabView: View {
    
    @EnvironmentObject private var session: SessionStore
    
    var body: some View {
        
        TabView {
            
            LandingEntryView(container: AppContainer.shared.container) { route in
                print("🟠 RootTabView: Landing route - \(route)")
            }
            .tabItem {
                Label("Home", systemImage: "sparkles")
            }
            
            CosmosEntryView(container: AppContainer.shared.container) { route in
                print("🟠 RootTabView: Cosmos route - \(route)")
            }
            .tabItem {
                Label("Cosmos", systemImage: "globe.americas.fill")
            }
            
            AlexandriaEntryView(container: AppContainer.shared.container) { route in
                print("🟠 RootTabView: Alexandria route - \(route)")
            }
            .tabItem {
                Label("Alexandria", systemImage: "books.vertical.fill")
            }
            
            ProfileEntryView(container: AppContainer.shared.container) { route in
                handleProfileRoute(route)
            }
            .tabItem {
                Label("Profile", systemImage: "person.fill")
            }
            
        }
        .accentColor(Palette.primary.cyan)
        
    }
    
    private func handleProfileRoute(_ route: ProfileRoute) {
        print("🟠 RootTabView: Profile route - \(route)")
        switch route {
        case .auth:
            print("🟠 RootTabView: User signed out, session will update")
            // SessionStore will automatically detect sign out and show auth screen
        case .settings:
            print("🟠 RootTabView: Navigate to settings")
        }
    }
    
}

#Preview {
    RootTabView()
}

