// LandingEntryView.swift

import SwiftUI
import Swinject

struct LandingEntryView: View {
    
    private let presenter: LandingPresenterType
    
    init(container: Container, onRoute: @escaping (LandingRoute) -> Void) {
        print("🟡 LandingEntryView: Starting initialization")
        
        // Register the router
        let router = LandingRouter(onRoute: onRoute)
        container.register(LandingRouterType.self) { _ in router }
        print("🟡 LandingEntryView: Router registered")
        
        // Resolve the presenter
        self.presenter = container.resolve(LandingPresenterType.self)!
        print("🟡 LandingEntryView: Presenter resolved")
        
        // Resolve interactor to trigger wiring
        _ = container.resolve(LandingInteractorType.self)!
        print("🟡 LandingEntryView: Interactor wired, interactor is \(presenter.interactor != nil ? "set ✓" : "NIL ❌")")
    }
    
    var body: some View {
        LandingView(presenter: presenter)
    }
}
