//
//  ApertureApp.swift
//  Aperture
//
//  Created by Ronald Hernandez on 1/9/26.
//

import SwiftUI

@main
struct ApertureApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
