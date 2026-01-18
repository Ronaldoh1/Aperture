//
//  CosmicFormWidth.swift
//  Aperture
//
//  Created by Ronald Hernandez on 1/17/26.
//

import SwiftUI

struct CosmicFormWidthModifier: ViewModifier {
    
    let maxWidth: CGFloat
    
    func body(content: Content) -> some View {
        
        content
            .frame(maxWidth: maxWidth)
            .frame(maxWidth: .infinity, alignment: .center)
        
    }
    
}

extension View {
    
    func cosmicFormWidth(maxWidth: CGFloat = 520) -> some View {
        
        modifier(CosmicFormWidthModifier(maxWidth: maxWidth))
        
    }
    
}
