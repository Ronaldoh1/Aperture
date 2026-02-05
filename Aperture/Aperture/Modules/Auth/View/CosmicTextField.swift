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
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(Palette.primary.cyan.opacity(0.85))
                .frame(width: 22)

            ZStack(alignment: .leading) {
                if text.isEmpty {
                    Text(placeholder)
                        .font(.system(size: 16, weight: .medium, design: .rounded))
                        .foregroundColor(Palette.text.secondary.opacity(0.35))
                }
                
                TextField("", text: $text)
                    .keyboardType(keyboardType)
                    .textContentType(textContentType)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .font(.system(size: 16, weight: .medium, design: .rounded))
                    .foregroundColor(Palette.text.primary)
                    .accentColor(Palette.primary.cyan)
            }

        }
        .padding(.horizontal, 16)
        .frame(height: 52)
        .background(background)
        .cosmicFormWidth()

    }

    private var background: some View {

        RoundedRectangle(cornerRadius: 16, style: .continuous)
            .fill(Palette.surface.fieldFill)
            .overlay(
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .stroke(Palette.surface.fieldStroke, lineWidth: 1)
            )

    }

}
