// ProfileEntryView.swift

import SwiftUI
import Swinject

struct ProfileEntryView: View {
    
    private let presenter: ProfilePresenterType
    
    init(container: Container, onRoute: @escaping (ProfileRoute) -> Void) {
        print("🟡 ProfileEntryView: Starting initialization")
        
        let router = ProfileRouter(onRoute: onRoute)
        container.register(ProfileRouterType.self) { _ in router }
        print("🟡 ProfileEntryView: Router registered")
        
        self.presenter = container.resolve(ProfilePresenterType.self)!
        print("🟡 ProfileEntryView: Presenter resolved")
        
        _ = container.resolve(ProfileInteractorType.self)!
        print("🟡 ProfileEntryView: Interactor wired, interactor is \(presenter.interactor != nil ? "set ✓" : "NIL ❌")")
    }
    
    var body: some View {
        ProfileView(presenter: presenter)
    }
}
