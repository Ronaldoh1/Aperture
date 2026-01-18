// SignInView.swift

import SwiftUI

struct SignInView: View {

    @Binding var email: String
    @Binding var password: String
    @Binding var showPassword: Bool

    let isLoading: Bool
    let isFormValid: Bool

    let onSignIn: () -> Void
    let onForgotPassword: () -> Void
    let onGoToSignUp: () -> Void

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
            .onSubmit {
                focusedField = .password
            }

            CosmicSecureField(
                text: $password,
                placeholder: "Password",
                iconName: "lock.fill",
                showPassword: $showPassword,
                textContentType: .password
            )
            .focused($focusedField, equals: .password)
            .submitLabel(.go)
            .onSubmit {
                onSignIn()
            }

            HStack {
                Spacer()
                Button {
                    onForgotPassword()
                } label: {
                    Text("Forgot password?")
                        .font(.system(size: 13, weight: .semibold, design: .rounded))
                        .foregroundColor(Palette.primary.cyan.opacity(0.9))
                }
                .buttonStyle(.plain)
            }
            .cosmicFormWidth()
            .padding(.top, 2)

            Button {
                onGoToSignUp()
            } label: {
                EmptyView()
            }
            .hidden()
        }
    }

}
