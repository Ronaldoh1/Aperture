//
//  Contract.swift
//  Aperture
//
//  Created by Ronald Hernandez on 1/18/26.
//


import SwiftUI

enum TutorialAssembly {

    static func makeEntryView(
        store: TutorialStateStore,
        onRoute: @escaping (TutorialRoute) -> Void
    ) -> some View {

        TutorialEntryView(
            store: store,
            onRoute: onRoute
        )

    }

}
