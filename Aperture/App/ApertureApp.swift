//
//  ApertureApp.swift
//  Aperture
//
//  Created by Ronald Hernandez on 1/7/26.
//
import SwiftUI
import FirebaseCore

@main
struct ApertureApp: App {

    @StateObject private var session = SessionStore()

    init() {
        _ = AppContainer.shared
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            AppRootView()
                .environmentObject(session)
        }
    }
}
