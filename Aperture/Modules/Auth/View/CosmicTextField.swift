// CosmicTextField.swift

import SwiftUI

struct CosmicTextField: View {
    
    @Binding var text: String
    
    let placeholder: String
    let iconName: String
    let keyboardType: UIKeyboardType
    let textContentType: UITextContentType?
    
    init(
        text: Binding<String>,
        placeholder: String,
        iconName: String,
        keyboardType: UIKeyboardType = .default,
        textContentType: UITextContentType? = nil
    ) {
        
        self._text = text
        self.placeholder = placeholder
        self.iconName = iconName
        self.keyboardType = keyboardType
        self.textContentType = textContentType
        
    }
    
    var body: some View {
        
        HStack(spacing: 12) {
            
            Image(systemName: iconName)
                .foregroundColor(Color.cyan.opacity(0.85))
                .frame(width: 22)
            
            TextField(placeholder, text: $text)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled(true)
                .keyboardType(keyboardType)
                .textContentType(textContentType)
                .foregroundColor(.white)
                .tint(Color.cyan)
            
        }
        .padding(.horizontal, 18)
        .frame(height: 54)
        .background(fieldBackground)
        .overlay(fieldBorder)
        .cosmicFormWidth()
        
    }
    
    private var fieldBackground: some View {
        
        RoundedRectangle(cornerRadius: 16, style: .continuous)
            .fill(
                LinearGradient(
                    colors: [
                        Color.white.opacity(0.10),
                        Color.white.opacity(0.05)
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .background(
                FlowerOfLife()
                    .stroke(Color.white.opacity(0.08), lineWidth: 1)
                    .padding(8)
                    .blur(radius: 0.5)
                    .opacity(0.7)
            )
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        
    }
    
    private var fieldBorder: some View {
        
        RoundedRectangle(cornerRadius: 16, style: .continuous)
            .stroke(
                LinearGradient(
                    colors: [
                        Color.white.opacity(0.16),
                        Color.cyan.opacity(0.18),
                        Color.purple.opacity(0.14)
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ),
                lineWidth: 1
            )
        
    }
    
}
