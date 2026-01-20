// Aperture/Modules/Tutorial/View/TutorialEntryView.swift

import SwiftUI

struct TutorialEntryView: View {

    @ObservedObject private var store: TutorialStateStore
    private let onRoute: (TutorialRoute) -> Void

    @State private var errorMessage: String?

    init(
        store: TutorialStateStore,
        onRoute: @escaping (TutorialRoute) -> Void
    ) {
        self.store = store
        self.onRoute = onRoute
    }

    var body: some View {

        content
            .alert(
                "Error",
                isPresented: Binding(
                    get: { errorMessage != nil },
                    set: { newValue in
                        if newValue == false {
                            errorMessage = nil
                        }
                    }
                ),
                actions: {
                    Button("OK") {
                        errorMessage = nil
                    }
                },
                message: {
                    Text(errorMessage ?? "")
                }
            )

    }

    @ViewBuilder
    private var content: some View {

        if store.hasSeenTutorial {

            Color.clear
                .onAppear {
                    onRoute(.main)
                }

        } else {

            TutorialView(
                onFinish: handleFinish,
                onSkip: handleSkip
            )

        }

    }

    private func handleFinish() {
        store.markSeen()
        onRoute(.authStartSignUp)
    }

    private func handleSkip() {
        store.markSeen()
        onRoute(.authStartSignUp)
    }

}
