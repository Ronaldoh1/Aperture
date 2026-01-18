// AuthView.swift

import SwiftUI

struct AuthView: View {

    @StateObject private var presenterBox: AuthPresenterBox

    private var presenter: AuthPresenterType {
        presenterBox.presenter
    }

    private enum Screen {
        case signIn
        case signUp
        case forgotPassword
    }

    @State private var screen: Screen

    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""

    @State private var showPassword: Bool = false
    @State private var showConfirmPassword: Bool = false

    @State private var geometryRotation: Double = 0
    @State private var particleOpacity: Double = 0.25

    init(
        presenter: AuthPresenterType,
        startInSignUp: Bool = false
    ) {
        _presenterBox = StateObject(wrappedValue: AuthPresenterBox(presenter: presenter))
        _screen = State(initialValue: startInSignUp ? .signUp : .signIn)
    }

    var body: some View {

        ZStack {

            cosmicBackground

            ScrollView {

                VStack(spacing: 24) {

                    Spacer(minLength: 64)

                    headerSection

                    formSection

                    actionButtons

                    footerSection

                    Spacer(minLength: 60)
                }
                .padding(.horizontal, 28)
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

    private var headerSection: some View {

        VStack(spacing: 10) {

            Text(titleText)
                .font(.system(size: 40, weight: .bold, design: .rounded))
                .foregroundStyle(
                    LinearGradient(
                        colors: [
                            Palette.text.primary,
                            Palette.primary.cyan.opacity(0.75)
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .multilineTextAlignment(.center)
                .cosmicFormWidth()

            Text(subtitleText)
                .font(.system(size: 16, weight: .medium, design: .rounded))
                .foregroundColor(Palette.text.secondary)
                .multilineTextAlignment(.center)
                .cosmicFormWidth()
        }
    }

    private var formSection: some View {

        Group {
            switch screen {
            case .signIn:
                SignInView(
                    email: $email,
                    password: $password,
                    showPassword: $showPassword,
                    isLoading: presenterBox.isLoading,
                    isFormValid: isSignInValid,
                    onSignIn: handleSignIn,
                    onForgotPassword: {
                        withAnimation(.spring(response: 0.4, dampingFraction: 0.75)) {
                            screen = .forgotPassword
                        }
                    },
                    onGoToSignUp: {
                        withAnimation(.spring(response: 0.4, dampingFraction: 0.75)) {
                            screen = .signUp
                            presenter.didTapToggleMode()
                            clearFields()
                        }
                    }
                )

            case .signUp:
                SignUpView(
                    email: $email,
                    password: $password,
                    confirmPassword: $confirmPassword,
                    showPassword: $showPassword,
                    showConfirmPassword: $showConfirmPassword,
                    isLoading: presenterBox.isLoading,
                    isFormValid: isSignUpValid,
                    onSignUp: handleSignUp,
                    onBackToSignIn: {
                        withAnimation(.spring(response: 0.4, dampingFraction: 0.75)) {
                            screen = .signIn
                            presenter.didTapToggleMode()
                            clearFields()
                        }
                    }
                )

            case .forgotPassword:
                ForgotPasswordView(
                    email: $email,
                    isLoading: presenterBox.isLoading,
                    onResetPassword: {
                        focusedClear()
                        presenter.router?.navigate(to: .forgotPassword)
                    },
                    onBackToSignIn: {
                        withAnimation(.spring(response: 0.4, dampingFraction: 0.75)) {
                            screen = .signIn
                        }
                    }
                )
            }
        }
    }

    private var actionButtons: some View {

        Group {
            switch screen {
            case .signIn:
                CosmicButton(
                    title: "Sign In",
                    style: .primary,
                    systemImage: "arrow.right",
                    isDisabled: presenterBox.isLoading || isSignInValid == false
                ) {
                    handleSignIn()
                }

                CosmicButton(
                    title: "Sign Up",
                    style: .secondary,
                    systemImage: nil,
                    isDisabled: presenterBox.isLoading
                ) {
                    withAnimation(.spring(response: 0.4, dampingFraction: 0.75)) {
                        screen = .signUp
                        presenter.didTapToggleMode()
                        clearFields()
                    }
                }

            case .signUp:
                CosmicButton(
                    title: "Create Account",
                    style: .primary,
                    systemImage: "arrow.right",
                    isDisabled: presenterBox.isLoading || isSignUpValid == false
                ) {
                    handleSignUp()
                }

                CosmicButton(
                    title: "Back to Sign In",
                    style: .secondary,
                    systemImage: nil,
                    isDisabled: presenterBox.isLoading
                ) {
                    withAnimation(.spring(response: 0.4, dampingFraction: 0.75)) {
                        screen = .signIn
                        presenter.didTapToggleMode()
                        clearFields()
                    }
                }

            case .forgotPassword:
                EmptyView()
            }
        }
    }

    private var footerSection: some View {

        Group {
            if screen == .signIn {
                Button {
                    withAnimation(.spring(response: 0.4, dampingFraction: 0.75)) {
                        screen = .signUp
                        presenter.didTapToggleMode()
                        clearFields()
                    }
                } label: {
                    HStack(spacing: 8) {
                        Text("Don't have an account?")
                            .foregroundColor(Palette.text.secondary)

                        Text("Sign Up")
                            .foregroundColor(Palette.primary.cyan.opacity(0.9))
                            .fontWeight(.bold)
                    }
                    .font(.system(size: 15, design: .rounded))
                    .cosmicFormWidth()
                }
                .buttonStyle(.plain)
                .padding(.top, 6)
            }
        }
    }

    private var sessionBadge: some View {

        Group {
            if presenterBox.isLoading {
                VStack {
                    HStack(spacing: 10) {
                        ProgressView()
                            .tint(Palette.text.primary.opacity(0.9))

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
                                    .stroke(Palette.text.primary.opacity(0.12), lineWidth: 1)
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
                    .stroke(Palette.text.primary.opacity(0.08), lineWidth: 1)
                    .frame(width: 780, height: 780)
                    .rotationEffect(.degrees(geometryRotation * 0.12))
                    .blendMode(.screen)
                    .blur(radius: 0.8)

                StarTetrahedron()
                    .stroke(Palette.primary.cyan.opacity(0.10), lineWidth: 1)
                    .frame(width: 640, height: 640)
                    .rotationEffect(.degrees(-geometryRotation * 0.18))
                    .blendMode(.screen)
                    .blur(radius: 0.6)

                VesicaPiscis()
                    .stroke(Palette.primary.violet.opacity(0.10), lineWidth: 1)
                    .frame(width: 560, height: 560)
                    .rotationEffect(.degrees(geometryRotation * 0.08))
                    .blendMode(.screen)
                    .blur(radius: 0.6)
            }
            .opacity(0.9)

            ForEach(0..<90, id: \.self) { _ in
                Circle()
                    .fill(Palette.text.primary)
                    .frame(width: CGFloat.random(in: 1...2.4), height: CGFloat.random(in: 1...2.4))
                    .position(
                        x: CGFloat.random(in: 0...UIScreen.main.bounds.width),
                        y: CGFloat.random(in: 0...UIScreen.main.bounds.height)
                    )
                    .opacity(particleOpacity * Double.random(in: 0.2...1.0))
            }
        }
    }

    private var titleText: String {
        switch screen {
        case .signIn:
            return "Welcome Back"
        case .signUp:
            return "Begin Your Journey"
        case .forgotPassword:
            return "Reset Password"
        }
    }

    private var subtitleText: String {
        switch screen {
        case .signIn:
            return "Continue your path"
        case .signUp:
            return "Awaken your consciousness"
        case .forgotPassword:
            return "Recover your access"
        }
    }

    private var isSignInValid: Bool {

        let emailValid = email.contains("@") && email.contains(".")
        let passwordValid = password.count >= 8
        return emailValid && passwordValid
    }

    private var isSignUpValid: Bool {

        let emailValid = email.contains("@") && email.contains(".")
        let passwordValid = password.count >= 8
        return emailValid && passwordValid && password == confirmPassword
    }

    private func handleSignIn() {
        focusedClear()
        presenter.didTapSignIn(email: email, password: password)
    }

    private func handleSignUp() {
        focusedClear()
        presenter.didTapSignUp(email: email, password: password)
    }

    private func clearFields() {
        email = ""
        password = ""
        confirmPassword = ""
    }

    private func focusedClear() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
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
