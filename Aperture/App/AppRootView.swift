//
//  ContentView.swift
//  Aperture
//
//  Created by Ronald Hernandez on 1/9/26.
//

import SwiftUI

struct AppRootView: View {
    @EnvironmentObject private var session: SessionStore

    var body: some View {
        if session.isBootstrapping {
          LoadingOverlay(message: "Opening the aperture…")
        } else if session.isAuthenticated {
            RootTabView()
        } else {
            AuthEntryView(container: AppContainer.shared.container)
        }
    }
    
}
