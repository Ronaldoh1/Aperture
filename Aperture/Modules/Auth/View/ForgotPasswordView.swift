// ForgotPasswordView.swift

import SwiftUI

struct ForgotPasswordView: View {
    @Binding var email: String

    let onResetPassword: () -> Void
    let onBackToSignIn: () -> Void
    let isLoading: Bool

    @FocusState private var emailFocused: Bool
    @State private var emailSent = false

    var body: some View {
        VStack(spacing: 16) {
            if !emailSent {
                CosmicTextField(
                    text: $email,
                    placeholder: "Email",
                    iconName: "envelope.fill",
                    keyboardType: .emailAddress,
                    textContentType: .emailAddress
                )
                .focused($emailFocused)
                .textInputAutocapitalization(.never)
                .submitLabel(.go)
                .onSubmit { sendReset() }

                CosmicButton(
                    title: "Send Reset Link",
                    style: .primary,
                    systemImage: "paperplane.fill",
                    isDisabled: isLoading || email.isEmpty
                ) {
                    sendReset()
                }

                CosmicButton(
                    title: "Back to Sign In",
                    style: .secondary,
                    systemImage: nil,
                    isDisabled: isLoading
                ) {
                    onBackToSignIn()
                }
            } else {
                VStack(spacing: 14) {
                    Image(systemName: "checkmark.circle.fill")
                        .font(.system(size: 56))
                        .foregroundColor(Palette.accent.cyan.opacity(0.95))
                        .shadow(color: Palette.accent.cyan.opacity(0.35), radius: 18)

                    Text("Check your email")
                        .font(.system(size: 18, weight: .semibold, design: .rounded))
                        .foregroundColor(Palette.text.primary)

                    Text("If an account exists for that email, you will get reset instructions.")
                        .font(.system(size: 14, design: .rounded))
                        .foregroundColor(Palette.text.secondary)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 32)

                    CosmicButton(
                        title: "Back to Sign In",
                        style: .secondary,
                        systemImage: nil,
                        isDisabled: false
                    ) {
                        onBackToSignIn()
                    }
                }
                .padding(.top, 10)
            }
        }
    }

    private func sendReset() {
        onResetPassword()
        emailSent = true

        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            onBackToSignIn()
        }
    }
}
