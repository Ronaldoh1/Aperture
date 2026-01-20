// Aperture/Modules/Auth/View/SignUpView.swift

import SwiftUI

struct SignUpView: View {

    @Binding var email: String
    @Binding var password: String
    @Binding var confirmPassword: String

    @Binding var showPassword: Bool
    @Binding var showConfirmPassword: Bool

    @FocusState private var focusedField: Field?

    private enum Field {
        case email
        case password
        case confirmPassword
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
            .submitLabel(.next)
            .onSubmit {
                focusedField = .confirmPassword
            }

            CosmicSecureField(
                text: $confirmPassword,
                placeholder: "Confirm Password",
                iconName: "lock.fill",
                showPassword: $showConfirmPassword,
                textContentType: .newPassword
            )
            .focused($focusedField, equals: .confirmPassword)
            .submitLabel(.go)

        }

    }

}
