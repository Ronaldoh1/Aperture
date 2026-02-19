//
//  View+Keyboard.swift
//  Aperture
//
//  Created by Ronald Hernandez on 1/12/26.
//

import SwiftUI

extension View {
    
    func dismissKeyboard() -> some View {
        onTapGesture {
            UIApplication.shared.sendAction(
                #selector(UIResponder.resignFirstResponder),
                to: nil,
                from: nil,
                for: nil
            )
        }
    }
    
}
