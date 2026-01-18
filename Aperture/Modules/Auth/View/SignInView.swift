import SwiftUI

struct SignInView: View {

    @Binding var email: String
    @Binding var password: String
    @Binding var showPassword: Bool

    let focusedField: FocusState<AuthView.Field?>.Binding
    let isLoading: Bool
    let isFormValid: Bool
    let onSignIn: () -> Void
    let onGoToSignUp: () -> Void

    var body: some View {

        VStack(spacing: 16) {

            CosmicTextField(
                text: $email,
                placeholder: "Email",
                iconName: "envelope.fill",
                keyboardType: .emailAddress,
                textContentType: .emailAddress
            )
            .cosmicFormWidth(maxWidth: 450)
            .focused(focusedField, equals: .email)
            .submitLabel(.next)
            .onSubmit {
                focusedField.wrappedValue = .password
            }

            CosmicSecureField(
                text: $password,
                placeholder: "Password",
                iconName: "lock.fill",
                showPassword: $showPassword,
                textContentType: .password
            )
            .cosmicFormWidth(maxWidth: 450)
            .focused(focusedField, equals: .password)
            .submitLabel(.go)
            .onSubmit {
                onSignIn()
            }

            VStack(spacing: 12) {

                CosmicButton(
                    title: "Sign In",
                    style: .primary,
                    systemImage: "arrow.right",
                    isDisabled: !isFormValid || isLoading
                ) {
                    onSignIn()
                }
                .cosmicFormWidth(maxWidth: 390)

                CosmicButton(
                    title: "Sign Up",
                    style: .secondary,
                    systemImage: nil,
                    isDisabled: isLoading
                ) {
                    onGoToSignUp()
                }
                .cosmicFormWidth(maxWidth: 380)
            }
            .padding(.top, 4)
        }
    }
}
