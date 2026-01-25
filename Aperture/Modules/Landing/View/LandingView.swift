// LandingView.swift

import SwiftUI

struct LandingView: View {

    @StateObject private var presenterBox: LandingPresenterBox
    @Binding var selectedTab: Int

    private var presenter: LandingPresenterType {
        presenterBox.presenter
    }

    init(presenter: LandingPresenterType, selectedTab: Binding<Int>) {
        _presenterBox = StateObject(wrappedValue: LandingPresenterBox(presenter: presenter))
        _selectedTab = selectedTab
    }

    var body: some View {

        ZStack {

            CosmicBackground()

            ScrollView(showsIndicators: false) {

                VStack(spacing: 32) {

                    LandingHeaderSection()

                    LandingNavigationSection(selectedTab: $selectedTab)

                    LandingQuickActionsSection(selectedTab: $selectedTab)

                    LandingDragonSection()

                    Spacer(minLength: 100)

                }
                .padding(.horizontal, 20)
                .padding(.top, 20)

            }

        }
        .onAppear {
            presenter.viewDidLoad()
        }

    }

}
