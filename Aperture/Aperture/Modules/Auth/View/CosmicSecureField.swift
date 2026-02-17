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
    textContentType: UITextContentType? = .password
  ) {
    _text = text
    self.placeholder = placeholder
    self.iconName = iconName
    _showPassword = showPassword
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

        Group {
          if showPassword {
            TextField("", text: $text)
          } else {
            SecureField("", text: $text)
          }
        }
        .textContentType(textContentType)
        .textInputAutocapitalization(.never)
        .disableAutocorrection(true)
        .font(.system(size: 16, weight: .medium, design: .rounded))
        .foregroundColor(Palette.text.primary)
        .accentColor(Palette.primary.cyan)
      }

      Button {
        showPassword.toggle()
      } label: {
        Image(systemName: showPassword ? "eye.slash.fill" : "eye.fill")
          .font(.system(size: 15, weight: .semibold))
          .foregroundColor(Palette.text.secondary.opacity(0.85))
          .frame(width: 28, height: 28)
          .contentShape(Rectangle())
      }
      .buttonStyle(.plain)
    }
    .padding(.horizontal, 16)
    .frame(height: 52)
    .background(background)
    .cosmicFormWidth()
  }

  private var background: some View {
    RoundedRectangle(cornerRadius: 16, style: .continuous)
      .fill(
        LinearGradient(
          colors: [
            Palette.surface.fieldFill,
            Palette.surface.fieldFill.opacity(0.92),
          ],
          startPoint: .top,
          endPoint: .bottom
        )
      )
      .overlay(
        RoundedRectangle(cornerRadius: 16, style: .continuous)
          .stroke(
            LinearGradient(
              colors: [
                Palette.surface.fieldStroke,
                Palette.accent.cyan.opacity(0.25),
                Palette.accent.violet.opacity(0.20),
              ],
              startPoint: .topLeading,
              endPoint: .bottomTrailing
            ),
            lineWidth: 1
          )
      )
      .shadow(
        color: Color.black.opacity(0.35),
        radius: 10,
        x: 0,
        y: 6
      )
  }
}
