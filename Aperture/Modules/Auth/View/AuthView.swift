// AuthView.swift

import SwiftUI

struct AuthView: View {
    @StateObject private var presenterBox: AuthPresenterBox

    private var presenter: AuthPresenterType { presenterBox.presenter }

    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var isSignUp = false
    @State private var showPassword = false
    @State private var showConfirmPassword = false
    @FocusState private var focusedField: Field?
    @State private var geometryRotation: Double = 0
    @State private var particleOpacity: Double = 0.25

    enum Field {
        case email
        case password
        case confirmPassword
    }

    init(presenter: AuthPresenterType) {
        _presenterBox = StateObject(wrappedValue: AuthPresenterBox(presenter: presenter))
    }

    var body: some View {
        ZStack {
            cosmicBackground

            ScrollView {
                VStack(spacing: 26) {
                    Spacer(minLength: 64)

                    headerSection

                    formSection

                    actionButtons

                    toggleModeButton

                    Spacer(minLength: 60)
                }
                .padding(.horizontal, 24)
            }

            sessionBadge
        }
        .onAppear {
            startAnimations()
            presenter.viewDidLoad()
        }
        .alert(item: $presenterBox.error) { error in
            Alert(
                title: Text("Error"),
                message: Text(error.localizedDescription),
                dismissButton: .default(Text("OK"))
            )
        }
    }

    private var sessionBadge: some View {
        Group {
            if presenterBox.isLoading {
                VStack {
                    HStack(spacing: 10) {
                        ProgressView()
                            .tint(Palette.text.primary.opacity(0.90))

                        Text(presenterBox.loadingMessage.isEmpty ? "Loading" : presenterBox.loadingMessage)
                            .font(.system(size: 14, weight: .semibold, design: .rounded))
                            .foregroundColor(Palette.text.primary)
                    }
                    .padding(.horizontal, 14)
                    .padding(.vertical, 10)
                    .background(
                        RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .fill(Color.black.opacity(0.35))
                            .overlay(
                                RoundedRectangle(cornerRadius: 16, style: .continuous)
                                    .stroke(Color.white.opacity(0.12), lineWidth: 1)
                            )
                    )
                    .cosmicFormWidth(maxWidth: 520)
                    .padding(.top, 18)

                    Spacer()
                }
                .allowsHitTesting(false)
            }
        }
    }

    private var cosmicBackground: some View {
        ZStack {
            PaletteGradients.cosmicBackground
                .ignoresSafeArea()

            ZStack {
                FlowerOfLife()
                    .stroke(Color.white.opacity(0.08), lineWidth: 1)
                    .frame(width: 780, height: 780)
                    .rotationEffect(.degrees(geometryRotation * 0.12))
                    .blendMode(.screen)
                    .blur(radius: 0.8)

                StarTetrahedron()
                    .stroke(Palette.accent.cyan.opacity(0.10), lineWidth: 1)
                    .frame(width: 640, height: 640)
                    .rotationEffect(.degrees(-geometryRotation * 0.18))
                    .blendMode(.screen)
                    .blur(radius: 0.6)

                VesicaPiscis()
                    .stroke(Palette.accent.violet.opacity(0.10), lineWidth: 1)
                    .frame(width: 560, height: 560)
                    .rotationEffect(.degrees(geometryRotation * 0.08))
                    .blendMode(.screen)
                    .blur(radius: 0.6)
            }
            .opacity(0.9)

            ForEach(0..<90, id: \.self) { _ in
                Circle()
                    .fill(Color.white)
                    .frame(width: CGFloat.random(in: 1...2.4), height: CGFloat.random(in: 1...2.4))
                    .position(
                        x: CGFloat.random(in: 0...UIScreen.main.bounds.width),
                        y: CGFloat.random(in: 0...UIScreen.main.bounds.height)
                    )
                    .opacity(particleOpacity * Double.random(in: 0.2...1.0))
            }
        }
    }

    private var headerSection: some View {
        VStack(spacing: 10) {
            Text(isSignUp ? "Begin Your Journey" : "Welcome Back")
                .font(.system(size: 40, weight: .bold, design: .rounded))
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

            Text(isSignUp ? "Awaken your consciousness" : "Continue your path")
                .font(.system(size: 16, weight: .medium, design: .rounded))
                .foregroundColor(Palette.text.secondary)
                .multilineTextAlignment(.center)
                .cosmicFormWidth(maxWidth: 520)
        }
    }

    private var formSection: some View {
        Group {
            if isSignUp {
                VStack(spacing: 16) {
                    CosmicTextField(
                        text: $email,
                        placeholder: "Email",
                        iconName: "envelope.fill",
                        keyboardType: .emailAddress,
                        textContentType: .emailAddress
                    )
                    .cosmicFormWidth(maxWidth: 470)
                    .focused($focusedField, equals: .email)
                    .submitLabel(.next)
                    .onSubmit { focusedField = .password }

                    CosmicSecureField(
                        text: $password,
                        placeholder: "Password",
                        iconName: "lock.fill",
                        showPassword: $showPassword,
                        textContentType: .newPassword
                    )
                    .cosmicFormWidth(maxWidth: 470)
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
                    .cosmicFormWidth(maxWidth: 470)
                    .focused($focusedField, equals: .confirmPassword)
                    .submitLabel(.go)
                    .onSubmit { handleSignUp() }
                }
            } else {
                SignInView(
                    email: $email,
                    password: $password,
                    showPassword: $showPassword,
                    focusedField: $focusedField,
                    isLoading: presenterBox.isLoading,
                    isFormValid: isFormValid,
                    onSignIn: { handleSignIn() },
                    onGoToSignUp: {
                        withAnimation(.spring(response: 0.4, dampingFraction: 0.75)) {
                            isSignUp = true
                            presenter.didTapToggleMode()
                            clearFields()
                        }
                    }
                )
            }
        }
    }

    private var actionButtons: some View {
        VStack(spacing: 12) {
            if isSignUp {
                CosmicButton(
                    title: "Create Account",
                    style: .primary,
                    systemImage: "arrow.right",
                    isDisabled: !isFormValid || presenterBox.isLoading
                ) { handleSignUp() }
                .cosmicFormWidth(maxWidth: 380)

                CosmicButton(
                    title: "Back to Sign In",
                    style: .secondary,
                    systemImage: nil,
                    isDisabled: presenterBox.isLoading
                ) {
                    withAnimation(.spring(response: 0.4, dampingFraction: 0.75)) {
                        isSignUp = false
                        presenter.didTapToggleMode()
                        clearFields()
                    }
                }
                .cosmicFormWidth(maxWidth: 380)
            }
        }
    }

    private var toggleModeButton: some View {
        Group {
            if isSignUp {
                EmptyView()
            } else {
                Button {
                    withAnimation(.spring(response: 0.4, dampingFraction: 0.75)) {
                        isSignUp.toggle()
                        presenter.didTapToggleMode()
                        clearFields()
                    }
                } label: {
                    HStack(spacing: 8) {
                        Text("Don't have an account?")
                            .foregroundColor(Palette.text.secondary)

                        Text("Sign Up")
                            .foregroundColor(Palette.accent.cyan.opacity(0.90))
                            .fontWeight(.bold)
                    }
                    .font(.system(size: 15, design: .rounded))
                    .cosmicFormWidth(maxWidth: 520)
                }
                .buttonStyle(.plain)
                .padding(.top, 6)
            }
        }
    }

    private var isFormValid: Bool {
        let emailValid = email.contains("@") && email.contains(".")
        let passwordValid = password.count >= 8

        if isSignUp { return emailValid && passwordValid && password == confirmPassword }
        return emailValid && passwordValid
    }

    private func handleSignIn() {
        focusedField = nil
        presenter.didTapSignIn(email: email, password: password)
    }

    private func handleSignUp() {
        focusedField = nil
        presenter.didTapSignUp(email: email, password: password)
    }

    private func clearFields() {
        email = ""
        password = ""
        confirmPassword = ""
        focusedField = nil
    }

    private func startAnimations() {
        withAnimation(.linear(duration: 70).repeatForever(autoreverses: false)) {
            geometryRotation = 360
        }
        withAnimation(.easeInOut(duration: 4).repeatForever(autoreverses: true)) {
            particleOpacity = 0.65
        }
    }
    
}
