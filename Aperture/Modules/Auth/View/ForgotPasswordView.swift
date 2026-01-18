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

        ZStack {

            PaletteGradients.cosmicBackground
                .ignoresSafeArea()

            VesicaPiscis()
                .stroke(Palette.accent.violet.opacity(0.12), lineWidth: 2)
                .blur(radius: 3)
                .frame(width: 520, height: 520)
                .blendMode(.screen)

            VStack(spacing: 24) {

                Spacer()

                VStack(spacing: 10) {

                    Text("Reset Password")
                        .font(.system(size: 34, weight: .bold, design: .rounded))
                        .foregroundStyle(
                            LinearGradient(
                                colors: [
                                    Palette.text.primary,
                                    Palette.accent.violet.opacity(0.75)
                                ],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .multilineTextAlignment(.center)
                        .cosmicFormWidth(maxWidth: 520)

                    Text(emailSent ? "Check your email" : "Enter your email to reset")
                        .font(.system(size: 16, weight: .medium, design: .rounded))
                        .foregroundColor(Palette.text.secondary)
                        .multilineTextAlignment(.center)
                        .cosmicFormWidth(maxWidth: 520)

                }

                if emailSent == false {

                    VStack(spacing: 16) {

                        CosmicTextField(
                            text: $email,
                            placeholder: "Email",
                            iconName: "envelope.fill",
                            keyboardType: .emailAddress,
                            textContentType: .emailAddress
                        )
                        .focused($emailFocused)
                        .textInputAutocapitalization(.never)

                        CosmicButton(
                            title: "Send Reset Link",
                            style: .primary,
                            systemImage: "arrow.right",
                            isDisabled: isLoading || email.isEmpty
                        ) {
                            onResetPassword()
                            emailSent = true
                        }

                    }

                } else {

                    VStack(spacing: 12) {

                        Image(systemName: "checkmark.circle.fill")
                            .font(.system(size: 56))
                            .foregroundColor(Palette.accent.cyan)

                        Text("Password reset email sent!")
                            .font(.system(size: 18, weight: .semibold, design: .rounded))
                            .foregroundColor(Palette.text.primary)

                        Text("Check your inbox for reset instructions.")
                            .font(.system(size: 14, weight: .medium, design: .rounded))
                            .foregroundColor(Palette.text.secondary)
                            .multilineTextAlignment(.center)
                            .cosmicFormWidth(maxWidth: 520)

                    }
                    .padding(.top, 12)

                }

                Spacer()

                Button(action: onBackToSignIn) {

                    HStack(spacing: 8) {

                        Image(systemName: "arrow.left")
                            .font(.system(size: 14, weight: .semibold))

                        Text("Back to Sign In")
                            .font(.system(size: 16, weight: .medium, design: .rounded))

                    }
                    .foregroundColor(Palette.accent.violet.opacity(0.95))
                    .cosmicFormWidth(maxWidth: 520)

                }
                .buttonStyle(.plain)
                .padding(.bottom, 48)

            }
            .dismissKeyboard()

        }

    }

}
