//
//  AuthEntryView.swift
//  Aperture
//
//  Created by Ronald Hernandez on 1/11/26.
//

import SwiftUI
import Swinject

import SwiftUI
import Swinject

struct AuthEntryView: View {

    let container: Container

    var body: some View {
        guard let view = container.resolve(AuthView.self) else {
            fatalError("AuthView not resolved. Check AuthAssembly registration and assembly order.")
        }
        return view
    }
    
}
