// AlexandriaEntryView.swift

import SwiftUI
import Swinject

struct AlexandriaEntryView: View {
    
    private let presenter: AlexandriaPresenterType
    
    init(container: Container, onRoute: @escaping (AlexandriaRoute) -> Void) {
        print("🟡 AlexandriaEntryView: Starting initialization")
        
        let router = AlexandriaRouter(onRoute: onRoute)
        container.register(AlexandriaRouterType.self) { _ in router }
        print("🟡 AlexandriaEntryView: Router registered")
        
        self.presenter = container.resolve(AlexandriaPresenterType.self)!
        print("🟡 AlexandriaEntryView: Presenter resolved")
        
        _ = container.resolve(AlexandriaInteractorType.self)!
        print("🟡 AlexandriaEntryView: Interactor wired, interactor is \(presenter.interactor != nil ? "set ✓" : "NIL ❌")")
    }
    
    var body: some View {
        AlexandriaView(presenter: presenter)
    }
}
