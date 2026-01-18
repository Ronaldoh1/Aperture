// CosmicSecureField.swift

import SwiftUI

struct CosmicSecureField: View {

    @Binding var text: String

    let placeholder: String
    let iconName: String
    @Binding var showPassword: Bool
    let textContentType: UITextContentType?

    init(
        text: Binding<String>,
        placeholder: String,
        iconName: String,
        showPassword: Binding<Bool>,
        textContentType: UITextContentType? = nil
    ) {
        self._text = text
        self.placeholder = placeholder
        self.iconName = iconName
        self._showPassword = showPassword
        self.textContentType = textContentType
    }

    var body: some View {

        HStack(spacing: 12) {

            Image(systemName: iconName)
                .foregroundColor(Palette.accent.cyan.opacity(0.90))
                .frame(width: 22)

            Group {

                if showPassword {
                    TextField(placeholder, text: $text)
                } else {
                    SecureField(placeholder, text: $text)
                }

            }
            .textInputAutocapitalization(.never)
            .autocorrectionDisabled(true)
            .textContentType(textContentType)
            .foregroundColor(Palette.text.primary)
            .tint(Palette.accent.cyan)

            Button {
                showPassword.toggle()
            } label: {
                Image(systemName: showPassword ? "eye.slash.fill" : "eye.fill")
                    .foregroundColor(Palette.text.muted.opacity(0.85))
            }
            .buttonStyle(.plain)

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
                VesicaPiscis()
                    .stroke(Palette.surface.fieldStroke.opacity(0.55), lineWidth: 1)
                    .padding(12)
                    .blur(radius: 0.6)
                    .opacity(0.60)
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
