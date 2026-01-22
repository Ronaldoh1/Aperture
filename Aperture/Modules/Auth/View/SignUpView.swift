// Aperture/Modules/Auth/View/SignUpView.swift

import SwiftUI

struct SignUpView: View {

    @Binding var email: String
    @Binding var password: String
    @Binding var showPassword: Bool

    let isLoading: Bool
    let onSignUp: () -> Void

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
                textContentType: .newPassword
            )
            .focused($focusedField, equals: .password)
            .submitLabel(.go)
            .onSubmit {
                onSignUp()
            }

        }
        .disabled(isLoading)
    }

}
