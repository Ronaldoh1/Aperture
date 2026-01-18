// SignInView.swift

import SwiftUI

struct SignInView: View {
    @Binding var email: String
    @Binding var password: String

    let isLoading: Bool
    let isFormValid: Bool

    let onSignIn: () -> Void
    let onForgotPassword: () -> Void
    let onGoToSignUp: () -> Void

    @State private var showPassword = false
    @FocusState private var focusedField: Field?

    private enum Field {
        case email
        case password
    }

    var body: some View {
        VStack(spacing: 16) {
            CosmicTextField(
                text: $email,
                placeholder: "Email",
                iconName: "envelope.fill",
                keyboardType: .emailAddress,
                textContentType: .emailAddress
            )
            .focused($focusedField, equals: .email)
            .submitLabel(.next)
            .onSubmit { focusedField = .password }

            CosmicSecureField(
                text: $password,
                placeholder: "Password",
                iconName: "lock.fill",
                showPassword: $showPassword,
                textContentType: .password
            )
            .focused($focusedField, equals: .password)
            .submitLabel(.go)
            .onSubmit { onSignIn() }

            HStack {
                Button("Forgot password?") {
                    focusedField = nil
                    onForgotPassword()
                }
                .font(.system(size: 14, weight: .semibold, design: .rounded))
                .foregroundColor(Palette.accent.cyan.opacity(0.95))
                .buttonStyle(.plain)

                Spacer()
            }
            .cosmicFormWidth()
            .padding(.top, 4)

            CosmicButton(
                title: "Sign In",
                style: .primary,
                systemImage: "arrow.right",
                isDisabled: !isFormValid || isLoading
            ) {
                focusedField = nil
                onSignIn()
            }

            CosmicButton(
                title: "Sign Up",
                style: .secondary,
                systemImage: nil,
                isDisabled: isLoading
            ) {
                focusedField = nil
                onGoToSignUp()
            }

            Button {
                focusedField = nil
                onGoToSignUp()
            } label: {
                HStack(spacing: 8) {
                    Text("Don't have an account?")
                        .foregroundColor(Palette.text.secondary)

                    Text("Sign Up")
                        .foregroundColor(Palette.accent.cyan.opacity(0.9))
                        .fontWeight(.bold)
                }
                .font(.system(size: 15, design: .rounded))
                .cosmicFormWidth()
            }
            .buttonStyle(.plain)
            .padding(.top, 6)
        }
    }
}
