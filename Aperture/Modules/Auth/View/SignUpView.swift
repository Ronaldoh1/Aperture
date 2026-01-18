// SignUpView.swift

import SwiftUI

struct SignUpView: View {
    @Binding var email: String
    @Binding var password: String
    @Binding var confirmPassword: String
    @Binding var displayName: String

    let isLoading: Bool
    let onSignUp: () -> Void
    let onBackToSignIn: () -> Void

    @State private var showPassword = false
    @State private var showConfirmPassword = false
    @FocusState private var focusedField: Field?

    private enum Field {
        case name
        case email
        case password
        case confirmPassword
    }

    private var isValid: Bool {
        let emailValid = email.contains("@") && email.contains(".")
        let passwordValid = password.count >= 8
        return emailValid && passwordValid && (password == confirmPassword) && !displayName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }

    var body: some View {
        VStack(spacing: 16) {
            CosmicTextField(
                text: $displayName,
                placeholder: "Full Name",
                iconName: "person.fill",
                keyboardType: .default,
                textContentType: .name
            )
            .focused($focusedField, equals: .name)
            .textInputAutocapitalization(.words)
            .submitLabel(.next)
            .onSubmit { focusedField = .email }

            CosmicTextField(
                text: $email,
                placeholder: "Email",
                iconName: "envelope.fill",
                keyboardType: .emailAddress,
                textContentType: .emailAddress
            )
            .focused($focusedField, equals: .email)
            .textInputAutocapitalization(.never)
            .submitLabel(.next)
            .onSubmit { focusedField = .password }

            CosmicSecureField(
                text: $password,
                placeholder: "Password",
                iconName: "lock.fill",
                showPassword: $showPassword,
                textContentType: .newPassword
            )
            .focused($focusedField, equals: .password)
            .submitLabel(.next)
            .onSubmit { focusedField = .confirmPassword }

            CosmicSecureField(
                text: $confirmPassword,
                placeholder: "Confirm Password",
                iconName: "lock.fill",
                showPassword: $showConfirmPassword,
                textContentType: .newPassword
            )
            .focused($focusedField, equals: .confirmPassword)
            .submitLabel(.go)
            .onSubmit { onSignUp() }

            HStack(spacing: 8) {
                Image(systemName: "info.circle.fill")
                    .font(.system(size: 12))
                    .foregroundColor(Palette.accent.cyan.opacity(0.65))

                Text("Password must be at least 8 characters")
                    .font(.system(size: 12, design: .rounded))
                    .foregroundColor(Palette.text.muted)

                Spacer()
            }
            .cosmicFormWidth()
            .padding(.horizontal, 4)
            .padding(.top, 4)

            CosmicButton(
                title: "Create Account",
                style: .primary,
                systemImage: "arrow.right",
                isDisabled: !isValid || isLoading
            ) {
                focusedField = nil
                onSignUp()
            }

            CosmicButton(
                title: "Back to Sign In",
                style: .secondary,
                systemImage: nil,
                isDisabled: isLoading
            ) {
                focusedField = nil
                onBackToSignIn()
            }
        }
    }
}
