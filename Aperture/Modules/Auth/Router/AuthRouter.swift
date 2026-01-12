import SwiftUI

class AuthRouter: AuthRouterType, ObservableObject {
    
    
    @Published var shouldNavigateToMain = false
    @Published var shouldNavigateToTutorial = false
    @Published var shouldNavigateToForgotPassword = false
    
    
    // MARK: - AuthRouterType Methods
    func navigate(to route: AuthRoute) {
        
        switch route {
            
        case .main:
            shouldNavigateToMain = true
            
        case .tutorial:
            shouldNavigateToTutorial = true
            
        case .forgotPassword:
            shouldNavigateToForgotPassword = true
        }
    }
}
