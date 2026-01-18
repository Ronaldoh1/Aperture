// AuthEntryView.swift

import SwiftUI
import Swinject

struct AuthEntryView: View {

    let container: Container
    let startInSignUp: Bool

    init(container: Container, startInSignUp: Bool = false) {
        self.container = container
        self.startInSignUp = startInSignUp
    }

    var body: some View {

        let presenter = container.resolve(AuthPresenterType.self) ?? AuthPresenter(router: AuthRouter())
        AuthView(presenter: presenter, startInSignUp: startInSignUp)
    }

}
