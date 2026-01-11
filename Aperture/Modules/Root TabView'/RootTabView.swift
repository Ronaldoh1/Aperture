import SwiftUI

struct RootTabView: View {
    
    var body: some View {
        
        TabView {
            
//            LandingTab()
//                .tabItem {
//                    Label("Landing", systemImage: "sparkles")
//                }
//            
//            CosmosTab()
//                .tabItem {
//                    Label("Cosmos", systemImage: "globe.americas.fill")
//                }
            
        }
        
    }
    
}

//private struct LandingTab: View {
//    
//    var body: some View {
//        
//        let container = AppContainer.shared.container
//        let presenter = container.resolve(LandingPresenterType.self)
//        
//        let adapter = LandingViewAdapter()
//        adapter.presenter = presenter
//        presenter!.view = adapter
//        
//        return LandingView(adapter: adapter)
//        
//    }
//    
//    
//    private func makeLandingView() -> LandingView {
//
//        let adapter = LandingViewAdapter()
//
//        guard let presenter = AppContainer.shared.container.resolve(LandingPresenterType.self) else {
//            fatalError("DI: Could not resolve LandingPresenterType")
//        }
//
//        presenter.view = adapter
//        adapter.presenter = presenter
//
//        return LandingView(adapter: adapter)
//
//    }
//    
//}

//private struct CosmosTab: View {
//    
//    var body: some View {
//        
//        let container = AppContainer.shared.container
//        let presenter = container.resolve(CosmosPresenterType.self)
//        
//        let adapter = CosmosViewAdapter()
//        adapter.presenter = presenter
//        presenter?.view = adapter
//        
//        return CosmosView(adapter: adapter)
//        
//    }
//    
//    private func makeCosmosView() -> CosmosView {
//
//        let adapter = CosmosViewAdapter()
//
//        guard let presenter = AppContainer.shared.container.resolve(CosmosPresenterType.self) else {
//            fatalError("DI: Could not resolve CosmosPresenterType")
//        }
//
//        presenter.view = adapter
//        adapter.presenter = presenter
//
//        return CosmosView(adapter: adapter)
//
//    }
//    
//}

#Preview {
    
    RootTabView()
    
}

