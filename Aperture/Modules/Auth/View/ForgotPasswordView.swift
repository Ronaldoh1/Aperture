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

            Color.black.ignoresSafeArea()

            // Background portal
            VesicaPiscis()
                .stroke(Color(hex: "9370DB").opacity(0.15), lineWidth: 2)
                .blur(radius: 3)
                .frame(width: 460, height: 460)

            VStack(spacing: 32) {

                Spacer()

                VStack(spacing: 16) {

                    VesicaPiscis()
                        .stroke(Color(hex: "9370DB").opacity(0.15), lineWidth: 2)
                        .blur(radius: 3)
                        .frame(width: 460, height: 460)

                    Text("Reset Password")
                        .font(.system(size: 32, weight: .bold, design: .rounded))
                        .foregroundColor(Color(hex: "9370DB"))

                    Text(emailSent ? "Check your email" : "Enter your email to reset")
                        .font(.system(size: 16, weight: .medium, design: .rounded))
                        .foregroundColor(.white.opacity(0.7))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 32)
                }

                if !emailSent {

                    VStack(spacing: 20) {

                        CosmicTextField(
                            text: $email,
                            placeholder: "Email",
                            iconName: "envelope.fill",
                            keyboardType: .emailAddress
                        )
                        .focused($emailFocused)
                        .textInputAutocapitalization(.never)

                        Button(action: {

                            onResetPassword()
                            emailSent = true

                            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                onBackToSignIn()
                            }

                        }) {

                            HStack(spacing: 12) {

                                if isLoading {
                                    ProgressView().tint(.black)
                                } else {
                                    Text("Send Reset Link")
                                        .font(.system(size: 18, weight: .semibold))
                                }
                            }
                            .frame(maxWidth: .infinity)
                            .frame(height: 56)
                            .background(
                                LinearGradient(
                                    colors: [Color(hex: "9370DB"), Color(hex: "8A2BE2")],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .foregroundColor(.white)
                            .cornerRadius(16)
                            .shadow(color: Color(hex: "9370DB").opacity(0.5), radius: 10)
                        }
                        .disabled(isLoading || email.isEmpty)
                    }
                    .padding(.horizontal, 32)

                } else {

                    VStack(spacing: 16) {

                        Image(systemName: "checkmark.circle.fill")
                            .font(.system(size: 60))
                            .foregroundColor(Color(hex: "00FF88"))
                            .shadow(color: Color(hex: "00FF88").opacity(0.6), radius: 20)

                        Text("Password reset email sent!")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(.white)

                        Text("Check your inbox for reset instructions")
                            .font(.system(size: 14))
                            .foregroundColor(.white.opacity(0.7))
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 32)
                    }
                    .padding(.top, 40)
                }

                Spacer()

                Button(action: onBackToSignIn) {
                    HStack(spacing: 8) {
                        Image(systemName: "arrow.left").font(.system(size: 14))
                        Text("Back to Sign In").font(.system(size: 16, weight: .medium))
                    }
                    .foregroundColor(Color(hex: "9370DB"))
                }
                .padding(.bottom, 48)
            }
            .dismissKeyboard()
        }
    }
}

#Preview {
    ForgotPasswordView(
        email: .constant(""),
        onResetPassword: {},
        onBackToSignIn: {},
        isLoading: false
    )
}
