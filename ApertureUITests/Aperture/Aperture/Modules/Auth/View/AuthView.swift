// Aperture/Modules/Auth/View/AuthView.swift

import SwiftUI

struct AuthView: View {

    @StateObject private var presenterBox: AuthPresenterBox

    private var presenter: AuthPresenterType {
        presenterBox.presenter
    }

    @State private var email: String
    @State private var password: String
    @State private var isSignUp: Bool

    @State private var showPassword: Bool = false

    @State private var geometryRotation: Double = 0
    @State private var particleOpacity: Double = 0.25

    @State private var showingForgotPassword: Bool = false

    init(
        presenter: AuthPresenterType,
        startInSignUp: Bool = false
    ) {
        _presenterBox = StateObject(wrappedValue: AuthPresenterBox(presenter: presenter))
        _email = State(initialValue: "")
        _password = State(initialValue: "")
        _isSignUp = State(initialValue: startInSignUp)
    }

    var body: some View {

        ZStack {

            cosmicBackground

            ScrollView {

                VStack(spacing: 28) {

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
            
            // Info button in top-right corner
            infoButtonOverlay

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
    
    private var infoButtonOverlay: some View {
        VStack {
            HStack {
                Spacer()
                ApertureInfoButton()
                    .padding(.trailing, 16)
                    .padding(.top, 12)
            }
            Spacer()
        }
    }

    @ViewBuilder
    private var formSection: some View {

        if showingForgotPassword {

            ForgotPasswordView(
                email: $email,
                isLoading: presenterBox.isLoading,
                onResetPassword: {
                    presenter.didTapResetPassword(email: email)
                },
                onBackToSignIn: {
                    withAnimation(.spring(response: 0.4, dampingFraction: 0.75)) {
                        showingForgotPassword = false
                    }
                }
            )

        } else if isSignUp {

            SignUpView(
                email: $email,
                password: $password,
                showPassword: $showPassword,
                isLoading: presenterBox.isLoading,
                onSignUp: {
                    presenter.didTapSignUp(email: email, password: password)
                }
            )
        } else {

            SignInView(
                email: $email,
                password: $password,
                showPassword: $showPassword,
                onForgotPassword: {
                    withAnimation(.spring(response: 0.4, dampingFraction: 0.75)) {
                        showingForgotPassword = true
                    }
                }
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
                .lineLimit(2)
                .minimumScaleFactor(0.85)
                .cosmicFormWidth()

            Text(subtitleText)
                .font(.system(size: 16, weight: .medium, design: .rounded))
                .foregroundColor(Palette.text.secondary)
                .multilineTextAlignment(.center)
                .lineLimit(2)
                .minimumScaleFactor(0.90)
                .cosmicFormWidth()

        }

    }

    private var titleText: String {
        if showingForgotPassword { return "Reset Password" }
        return isSignUp ? "Begin Your Journey" : "Welcome Back"
    }

    private var subtitleText: String {
        if showingForgotPassword { return "We will send you a reset link." }
        return isSignUp ? "Awaken your consciousness" : "Continue your path"
    }

    private var actionButtons: some View {

        VStack(spacing: 12) {

            if showingForgotPassword {

                CosmicButton(
                    title: "Send Reset Link",
                    style: .primary,
                    systemImage: "paperplane.fill",
                    isDisabled: presenterBox.isLoading || email.contains("@") == false
                ) {
                    presenter.didTapResetPassword(email: email)
                }

            } else {

                CosmicButton(
                    title: isSignUp ? "Create Account" : "Sign In",
                    style: .primary,
                    systemImage: "arrow.right",
                    isDisabled: presenterBox.isLoading || isFormValid == false
                ) {
                    if isSignUp {
                        handleSignUp()
                    } else {
                        handleSignIn()
                    }
                }

            }

        }

    }

    private var toggleModeButton: some View {

        Button {
            withAnimation(.spring(response: 0.4, dampingFraction: 0.75)) {
                isSignUp.toggle()
                showingForgotPassword = false
                clearFields()
            }
        } label: {

            HStack(spacing: 8) {

                Text(isSignUp ? "Already have an account?" : "Don't have an account?")
                    .foregroundColor(Palette.text.secondary)
                    .lineLimit(1)
                    .minimumScaleFactor(0.85)

                Text(isSignUp ? "Sign In" : "Sign Up")
                    .foregroundColor(Palette.primary.cyan.opacity(0.9))
                    .fontWeight(.bold)
                    .lineLimit(1)
                    .minimumScaleFactor(0.85)

            }
            .font(.system(size: 15, design: .rounded))
            .cosmicFormWidth()

        }
        .buttonStyle(.plain)
        .padding(.top, 6)

    }

    private var isFormValid: Bool {

        let emailValid = email.contains("@") && email.contains(".")
        let passwordValid = password.count >= 8

        return emailValid && passwordValid

    }

    private func handleSignIn() {
        presenter.didTapSignIn(email: email, password: password)
    }

    private func handleSignUp() {
        presenter.didTapSignUp(email: email, password: password)
    }

    private func clearFields() {
        email = ""
        password = ""
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
                            .lineLimit(1)
                            .minimumScaleFactor(0.85)

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

    private func startAnimations() {

        withAnimation(.linear(duration: 70).repeatForever(autoreverses: false)) {
            geometryRotation = 360
        }

        withAnimation(.easeInOut(duration: 4).repeatForever(autoreverses: true)) {
            particleOpacity = 0.65
        }

    }

}
