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
                .foregroundColor(Palette.accent.cyan.opacity(0.90))
                .frame(width: 22)

            TextField(placeholder, text: $text)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled(true)
                .keyboardType(keyboardType)
                .textContentType(textContentType)
                .foregroundColor(Palette.text.primary)
                .tint(Palette.accent.cyan)

        }
        .padding(.horizontal, 16)
        .frame(height: 58)
        .background(fieldBackground)
        .overlay(fieldBorder)
        .cosmicFormWidth(maxWidth: 410, horizontalPadding: 28)

    }

    private var fieldBackground: some View {

        RoundedRectangle(cornerRadius: 16, style: .continuous)
            .fill(Palette.surface.fieldFill)
            .background(
                FlowerOfLife()
                    .stroke(Palette.surface.fieldStroke.opacity(0.55), lineWidth: 1)
                    .padding(10)
                    .blur(radius: 0.6)
                    .opacity(0.65)
            )
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))

    }

    private var fieldBorder: some View {

        RoundedRectangle(cornerRadius: 16, style: .continuous)
            .stroke(
                LinearGradient(
                    colors: [
                        Palette.surface.fieldStroke.opacity(0.95),
                        Palette.accent.cyan.opacity(0.18),
                        Palette.accent.violet.opacity(0.14)
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ),
                lineWidth: 1
            )

    }

}
