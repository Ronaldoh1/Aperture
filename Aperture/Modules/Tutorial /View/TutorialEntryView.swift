// TutorialEntryView.swift

import SwiftUI

struct TutorialEntryView: View {

    @StateObject private var store: TutorialStateStore
    private let onRoute: (TutorialRoute) -> Void

    @State private var errorMessage: String?

    init(
        store: TutorialStateStore,
        onRoute: @escaping (TutorialRoute) -> Void
    ) {

        _store = StateObject(wrappedValue: store)
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
                )
            ) {
                Button("OK") {
                    errorMessage = nil
                }
            } message: {
                Text(errorMessage ?? "")
            }

    }

    @ViewBuilder
    private var content: some View {

        if store.hasSeenTutorial {
            Color.clear
                .onAppear {
                    onRoute(.main)
                }
        } else {
            TutorialView(onFinish: handleFinish)
        }

    }

    private func handleFinish() {

        do {
            try store.markSeen()
            store.resetForDebug()
            onRoute(.authStartSignUp)
        } catch {
            errorMessage = error.localizedDescription
        }

    }

}
