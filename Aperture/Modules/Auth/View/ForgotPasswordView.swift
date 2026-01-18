// ForgotPasswordView.swift

import SwiftUI

struct ForgotPasswordView: View {

    @Binding var email: String

    let isLoading: Bool
    let onResetPassword: () -> Void
    let onBackToSignIn: () -> Void

    @FocusState private var emailFocused: Bool
    @State private var emailSent: Bool = false

    var body: some View {

        VStack(spacing: 18) {

            if emailSent == false {

                CosmicTextField(
                    text: $email,
                    placeholder: "Email",
                    iconName: "envelope.fill",
                    keyboardType: .emailAddress,
                    textContentType: .emailAddress
                )
                .focused($emailFocused)
                .submitLabel(.go)
                .onSubmit {
                    triggerReset()
                }

                CosmicButton(
                    title: "Send Reset Link",
                    style: .primary,
                    systemImage: "paperplane.fill",
                    isDisabled: isLoading || email.isEmpty
                ) {
                    triggerReset()
                }

            } else {

                VStack(spacing: 10) {
                    Image(systemName: "checkmark.circle.fill")
                        .font(.system(size: 44, weight: .bold))
                        .foregroundColor(Palette.primary.cyan.opacity(0.95))

                    Text("Reset email sent")
                        .font(.system(size: 16, weight: .semibold, design: .rounded))
                        .foregroundColor(Palette.text.primary)

                    Text("Check your inbox for next steps.")
                        .font(.system(size: 13, weight: .medium, design: .rounded))
                        .foregroundColor(Palette.text.secondary)
                }
                .cosmicFormWidth()
            }

            Button {
                onBackToSignIn()
            } label: {
                HStack(spacing: 8) {
                    Image(systemName: "arrow.left")
                        .font(.system(size: 14, weight: .semibold))
                    Text("Back to Sign In")
                        .font(.system(size: 15, weight: .semibold, design: .rounded))
                }
                .foregroundColor(Palette.primary.cyan.opacity(0.9))
                .cosmicFormWidth()
            }
            .buttonStyle(.plain)
            .padding(.top, 6)
        }
    }

    private func triggerReset() {

        onResetPassword()
        emailSent = true

        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            onBackToSignIn()
        }
    }

}
