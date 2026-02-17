// Aperture/Modules/Auth/View/ForgotPasswordView.swift

import SwiftUI

struct ForgotPasswordView: View {
  @Binding var email: String
  let isLoading: Bool
  let onResetPassword: () -> Void
  let onBackToSignIn: () -> Void

  @FocusState private var focusedEmail: Bool

  var body: some View {
    VStack(spacing: 16) {
      CosmicTextField(
        text: $email,
        placeholder: "Email",
        iconName: "envelope.fill",
        keyboardType: .emailAddress,
        textContentType: .emailAddress
      )
      .focused($focusedEmail)
      .submitLabel(.go)

      HStack {
        Button {
          onBackToSignIn()
        } label: {
          Text("Back")
            .font(.system(size: 14, weight: .semibold, design: .rounded))
            .foregroundColor(Palette.text.secondary)
        }
        .buttonStyle(.plain)

        Spacer()

        Button {
          onResetPassword()
        } label: {
          Text(isLoading ? "Sending…" : "Send")
            .font(.system(size: 14, weight: .semibold, design: .rounded))
            .foregroundColor(Palette.primary.cyan.opacity(0.95))
        }
        .buttonStyle(.plain)
        .disabled(isLoading || email.contains("@") == false)
      }
      .cosmicFormWidth()
    }
  }
}
