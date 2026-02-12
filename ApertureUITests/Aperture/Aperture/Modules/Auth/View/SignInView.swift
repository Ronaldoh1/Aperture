// Aperture/Modules/Auth/View/SignInView.swift

import SwiftUI

struct SignInView: View {

    @Binding var email: String
    @Binding var password: String
    @Binding var showPassword: Bool

    let onForgotPassword: () -> Void

    @FocusState private var focusedField: Field?

    private enum Field {
        case email
        case password
    }

    var body: some View {

        VStack(spacing: 14) {

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

            HStack {

                Spacer()

                Button {
                    onForgotPassword()
                } label: {
                    Text("Forgot password?")
                        .font(.system(size: 14, weight: .semibold, design: .rounded))
                        .foregroundColor(Palette.primary.cyan.opacity(0.95))
                        .lineLimit(1)
                        .minimumScaleFactor(0.85)
                }
                .buttonStyle(.plain)

            }
            .cosmicFormWidth()

        }

    }

}
