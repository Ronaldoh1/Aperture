// SignUpView.swift

import SwiftUI

struct SignUpView: View {

    @Binding var email: String
    @Binding var password: String
    @Binding var confirmPassword: String
    @Binding var displayName: String

    let onSignUp: () -> Void
    let onSignIn: () -> Void
    let onGoogleSignIn: () -> Void
    let isLoading: Bool

    @State private var showPassword = false
    @State private var showConfirmPassword = false
    @FocusState private var focusedField: Field?

    enum Field {

        case name
        case email
        case password
        case confirmPassword

    }

    var body: some View {

        ZStack {

            PaletteGradients.cosmicBackground
                .ignoresSafeArea()

            SeedOfLife()
                .stroke(Palette.accent.cyan.opacity(0.10), lineWidth: 2)
                .blur(radius: 2)
                .frame(width: 520, height: 520)
                .blendMode(.screen)

            ScrollView {

                VStack(spacing: 26) {

                    Spacer(minLength: 40)

                    VStack(spacing: 10) {

                        Text("Create Account")
                            .font(.system(size: 34, weight: .bold, design: .rounded))
                            .foregroundStyle(
                                LinearGradient(
                                    colors: [
                                        Palette.text.primary,
                                        Palette.accent.cyan.opacity(0.75)
                                    ],
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            )
                            .multilineTextAlignment(.center)
                            .cosmicFormWidth(maxWidth: 520)

                        Text("Begin your journey")
                            .font(.system(size: 16, weight: .medium, design: .rounded))
                            .foregroundColor(Palette.text.secondary)
                            .multilineTextAlignment(.center)
                            .cosmicFormWidth(maxWidth: 520)

                    }

                    VStack(spacing: 16) {

                        CosmicTextField(
                            text: $displayName,
                            placeholder: "Full Name",
                            iconName: "person.fill"
                        )
                        .focused($focusedField, equals: .name)
                        .textInputAutocapitalization(.words)

                        CosmicTextField(
                            text: $email,
                            placeholder: "Email",
                            iconName: "envelope.fill",
                            keyboardType: .emailAddress,
                            textContentType: .emailAddress
                        )
                        .focused($focusedField, equals: .email)
                        .textInputAutocapitalization(.never)

                        CosmicSecureField(
                            text: $password,
                            placeholder: "Password",
                            iconName: "lock.fill",
                            showPassword: $showPassword,
                            textContentType: .newPassword
                        )
                        .focused($focusedField, equals: .password)

                        CosmicSecureField(
                            text: $confirmPassword,
                            placeholder: "Confirm Password",
                            iconName: "lock.fill",
                            showPassword: $showConfirmPassword,
                            textContentType: .newPassword
                        )
                        .focused($focusedField, equals: .confirmPassword)

                        CosmicButton(
                            title: "Create Account",
                            style: .primary,
                            systemImage: "arrow.right",
                            isDisabled: isLoading || password != confirmPassword || password.count < 8
                        ) {
                            onSignUp()
                        }

                        CosmicButton(
                            title: "Sign In",
                            style: .secondary,
                            systemImage: nil,
                            isDisabled: isLoading
                        ) {
                            onSignIn()
                        }

                    }

                    Button(action: onGoogleSignIn) {

                        HStack(spacing: 12) {

                            Image(systemName: "globe")
                                .font(.system(size: 18, weight: .semibold))

                            Text("Continue with Google")
                                .font(.system(size: 16, weight: .medium, design: .rounded))

                        }
                        .foregroundColor(Palette.text.primary)
                        .frame(height: 52)
                        .background(Palette.surface.buttonSecondaryFill)
                        .clipShape(Capsule(style: .continuous))
                        .overlay(
                            Capsule(style: .continuous)
                                .stroke(Palette.surface.buttonSecondaryStroke, lineWidth: 1)
                        )
                        .cosmicFormWidth(maxWidth: 420)

                    }
                    .buttonStyle(.plain)
                    .disabled(isLoading)

                    Spacer(minLength: 60)

                }

            }
            .dismissKeyboard()

        }

    }

}
