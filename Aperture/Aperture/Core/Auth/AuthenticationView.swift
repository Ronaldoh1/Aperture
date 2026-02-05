// AuthenticationView.swift
// Beautiful sign-in screen prioritizing biometrics for easy access
// Cosmic theme matching Aperture aesthetic

import SwiftUI
import AuthenticationServices

struct AuthenticationView: View {
    
    @StateObject private var authManager = AuthenticationManager.shared
    @State private var showEmailLogin = false
    @State private var email = ""
    @State private var password = ""
    @State private var isSignUp = false
    @State private var showBiometricPrompt = false
    
    var body: some View {
        ZStack {
            // Cosmic background
            cosmicBackground
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 32) {
                    Spacer().frame(height: 60)
                    
                    // Logo and title
                    headerSection
                    
                    Spacer().frame(height: 20)
                    
                    // Main auth options
                    authOptionsSection
                    
                    // Or divider
                    divider
                    
                    // Secondary options
                    secondaryOptionsSection
                    
                    Spacer().frame(height: 40)
                    
                    // Terms
                    termsSection
                    
                    Spacer().frame(height: 20)
                }
                .padding(.horizontal, 24)
            }
            
            // Email login sheet
            if showEmailLogin {
                emailLoginSheet
            }
            
            // Loading overlay
            if authManager.isLoading {
                loadingOverlay
            }
        }
    }
    
    // MARK: - Background
    
    private var cosmicBackground: some View {
        ZStack {
            // Base gradient
            LinearGradient(
                colors: [
                    Color(red: 0.02, green: 0.01, blue: 0.08),
                    Color(red: 0.05, green: 0.02, blue: 0.12),
                    Color(red: 0.08, green: 0.03, blue: 0.15)
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            // Stars
            GeometryReader { geo in
                ForEach(0..<50, id: \.self) { i in
                    Circle()
                        .fill(Color.white.opacity(Double.random(in: 0.3...0.8)))
                        .frame(width: CGFloat.random(in: 1...3))
                        .position(
                            x: CGFloat.random(in: 0...geo.size.width),
                            y: CGFloat.random(in: 0...geo.size.height)
                        )
                }
            }
            .ignoresSafeArea()
            
            // Subtle glow
            RadialGradient(
                colors: [
                    Color.orange.opacity(0.15),
                    Color.clear
                ],
                center: .center,
                startRadius: 50,
                endRadius: 300
            )
            .offset(y: -100)
            .ignoresSafeArea()
        }
    }
    
    // MARK: - Header
    
    private var headerSection: some View {
        VStack(spacing: 16) {
            // Sun icon with glow
            ZStack {
                Circle()
                    .fill(Color.orange.opacity(0.2))
                    .frame(width: 120, height: 120)
                    .blur(radius: 20)
                
                Image(systemName: "sun.max.fill")
                    .font(.system(size: 60))
                    .foregroundStyle(
                        LinearGradient(
                            colors: [.yellow, .orange],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .shadow(color: .orange.opacity(0.5), radius: 20)
            }
            
            Text("APERTURE")
                .font(.system(size: 32, weight: .bold, design: .rounded))
                .tracking(8)
                .foregroundColor(.white)
            
            Text("Awaken Your Consciousness")
                .font(.system(size: 16, weight: .medium, design: .rounded))
                .foregroundColor(.white.opacity(0.7))
        }
    }
    
    // MARK: - Main Auth Options
    
    private var authOptionsSection: some View {
        VStack(spacing: 16) {
            // Biometric button (if available) - PRIORITY
            if authManager.canUseBiometrics {
                biometricButton
            }
            
            // Sign in with Apple
            // NOTE: Requires Apple Developer Program ($99/year)
            // To disable: set showAppleSignIn = false below
            if showAppleSignIn {
                appleSignInButton
            }
        }
    }
    
    // Set to false if you don't have Apple Developer Program
    private var showAppleSignIn: Bool { false }
    
    private var biometricButton: some View {
        Button(action: {
            HapticManager.shared.medium()
            Task {
                await authManager.unlockWithBiometrics()
            }
        }) {
            HStack(spacing: 14) {
                Image(systemName: authManager.biometricType.icon)
                    .font(.system(size: 24, weight: .medium))
                
                VStack(alignment: .leading, spacing: 2) {
                    Text("Continue with \(authManager.biometricType.displayName)")
                        .font(.system(size: 17, weight: .semibold, design: .rounded))
                    
                    Text("Quick & secure access")
                        .font(.system(size: 12, weight: .medium, design: .rounded))
                        .opacity(0.7)
                }
                
                Spacer()
                
                Image(systemName: "arrow.right.circle.fill")
                    .font(.system(size: 24))
                    .opacity(0.7)
            }
            .foregroundColor(.white)
            .padding(.horizontal, 20)
            .padding(.vertical, 18)
            .background(
                LinearGradient(
                    colors: [
                        Color.blue.opacity(0.8),
                        Color.purple.opacity(0.8)
                    ],
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .shadow(color: .blue.opacity(0.3), radius: 10, y: 5)
        }
        .accessibilityLabel("Continue with \(authManager.biometricType.displayName)")
        .accessibilityHint("Quick and secure biometric authentication")
    }
    
    private var appleSignInButton: some View {
        Button(action: {
            HapticManager.shared.medium()
            Task {
                await authManager.signInWithApple()
            }
        }) {
            HStack(spacing: 14) {
                Image(systemName: "apple.logo")
                    .font(.system(size: 22, weight: .medium))
                
                Text("Sign in with Apple")
                    .font(.system(size: 17, weight: .semibold, design: .rounded))
                
                Spacer()
            }
            .foregroundColor(.black)
            .padding(.horizontal, 20)
            .padding(.vertical, 18)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 16))
        }
        .accessibilityLabel("Sign in with Apple")
    }
    
    // MARK: - Divider
    
    private var divider: some View {
        HStack(spacing: 16) {
            Rectangle()
                .fill(Color.white.opacity(0.2))
                .frame(height: 1)
            
            Text("or")
                .font(.system(size: 14, weight: .medium, design: .rounded))
                .foregroundColor(.white.opacity(0.5))
            
            Rectangle()
                .fill(Color.white.opacity(0.2))
                .frame(height: 1)
        }
    }
    
    // MARK: - Secondary Options
    
    private var secondaryOptionsSection: some View {
        VStack(spacing: 12) {
            // Email login
            Button(action: {
                HapticManager.shared.light()
                withAnimation(.spring()) {
                    showEmailLogin = true
                }
            }) {
                HStack(spacing: 12) {
                    Image(systemName: "envelope.fill")
                        .font(.system(size: 18))
                    
                    Text("Continue with Email")
                        .font(.system(size: 16, weight: .semibold, design: .rounded))
                }
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
                .background(Color.white.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.white.opacity(0.2), lineWidth: 1)
                )
            }
            
            // Guest mode
            Button(action: {
                HapticManager.shared.light()
                authManager.continueAsGuest()
            }) {
                HStack(spacing: 12) {
                    Image(systemName: "person.fill.questionmark")
                        .font(.system(size: 18))
                    
                    Text("Continue as Guest")
                        .font(.system(size: 16, weight: .medium, design: .rounded))
                }
                .foregroundColor(.white.opacity(0.7))
                .frame(maxWidth: .infinity)
                .padding(.vertical, 14)
            }
        }
    }
    
    // MARK: - Terms
    
    private var termsSection: some View {
        VStack(spacing: 8) {
            Text("By continuing, you agree to our")
                .font(.system(size: 12, weight: .regular, design: .rounded))
                .foregroundColor(.white.opacity(0.5))
            
            HStack(spacing: 4) {
                Button("Terms of Service") {}
                    .font(.system(size: 12, weight: .medium, design: .rounded))
                    .foregroundColor(.white.opacity(0.7))
                
                Text("and")
                    .font(.system(size: 12, weight: .regular, design: .rounded))
                    .foregroundColor(.white.opacity(0.5))
                
                Button("Privacy Policy") {}
                    .font(.system(size: 12, weight: .medium, design: .rounded))
                    .foregroundColor(.white.opacity(0.7))
            }
        }
    }
    
    // MARK: - Email Login Sheet
    
    private var emailLoginSheet: some View {
        ZStack {
            Color.black.opacity(0.5)
                .ignoresSafeArea()
                .onTapGesture {
                    withAnimation(.spring()) {
                        showEmailLogin = false
                    }
                }
            
            VStack(spacing: 24) {
                // Header
                HStack {
                    Text(isSignUp ? "Create Account" : "Welcome Back")
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Button(action: {
                        withAnimation(.spring()) {
                            showEmailLogin = false
                        }
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 28))
                            .foregroundColor(.white.opacity(0.5))
                    }
                }
                
                // Error message
                if let error = authManager.errorMessage {
                    Text(error)
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.red)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 10)
                        .background(Color.red.opacity(0.1))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                
                // Email field
                VStack(alignment: .leading, spacing: 8) {
                    Text("Email")
                        .font(.system(size: 14, weight: .medium, design: .rounded))
                        .foregroundColor(.white.opacity(0.7))
                    
                    TextField("your@email.com", text: $email)
                        .textContentType(.emailAddress)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color.white.opacity(0.1))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .foregroundColor(.white)
                }
                
                // Password field
                VStack(alignment: .leading, spacing: 8) {
                    Text("Password")
                        .font(.system(size: 14, weight: .medium, design: .rounded))
                        .foregroundColor(.white.opacity(0.7))
                    
                    SecureField("••••••••", text: $password)
                        .textContentType(isSignUp ? .newPassword : .password)
                        .padding()
                        .background(Color.white.opacity(0.1))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .foregroundColor(.white)
                }
                
                // Submit button
                Button(action: {
                    HapticManager.shared.medium()
                    Task {
                        let success = await authManager.signInWithEmail(email, password: password)
                        if success {
                            withAnimation(.spring()) {
                                showEmailLogin = false
                            }
                        }
                    }
                }) {
                    Text(isSignUp ? "Create Account" : "Sign In")
                        .font(.system(size: 17, weight: .semibold, design: .rounded))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .background(
                            LinearGradient(
                                colors: [.orange, .red],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
                
                // Toggle sign up / sign in
                Button(action: {
                    withAnimation(.spring()) {
                        isSignUp.toggle()
                    }
                }) {
                    Text(isSignUp ? "Already have an account? Sign In" : "Don't have an account? Sign Up")
                        .font(.system(size: 14, weight: .medium, design: .rounded))
                        .foregroundColor(.white.opacity(0.7))
                }
            }
            .padding(24)
            .background(
                RoundedRectangle(cornerRadius: 24)
                    .fill(Color(red: 0.1, green: 0.05, blue: 0.2))
            )
            .padding(.horizontal, 20)
        }
        .transition(.opacity.combined(with: .scale(scale: 0.95)))
    }
    
    // MARK: - Loading Overlay
    
    private var loadingOverlay: some View {
        ZStack {
            Color.black.opacity(0.7)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                ProgressView()
                    .scaleEffect(1.5)
                    .tint(.white)
                
                Text("Authenticating...")
                    .font(.system(size: 16, weight: .medium, design: .rounded))
                    .foregroundColor(.white.opacity(0.8))
            }
            .padding(40)
            .background(Color.white.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 20))
        }
    }
}

// MARK: - Lock Screen View

struct LockScreenView: View {
    
    @StateObject private var authManager = AuthenticationManager.shared
    @State private var isAnimating = false
    @State private var showError = false
    
    var body: some View {
        ZStack {
            // Background
            Color.black.ignoresSafeArea()
            
            VStack(spacing: 40) {
                Spacer()
                
                // Lock icon with animation
                ZStack {
                    Circle()
                        .fill(Color.white.opacity(0.05))
                        .frame(width: 150, height: 150)
                    
                    Circle()
                        .stroke(Color.white.opacity(0.1), lineWidth: 2)
                        .frame(width: 150, height: 150)
                        .scaleEffect(isAnimating ? 1.1 : 1.0)
                        .opacity(isAnimating ? 0 : 1)
                        .animation(.easeOut(duration: 1.5).repeatForever(autoreverses: false), value: isAnimating)
                    
                    Image(systemName: authManager.biometricType.icon)
                        .font(.system(size: 60, weight: .light))
                        .foregroundColor(.white)
                }
                
                VStack(spacing: 12) {
                    Text("Welcome Back")
                        .font(.system(size: 28, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                    
                    if let user = authManager.currentUser {
                        Text(user.displayNameOrDefault)
                            .font(.system(size: 18, weight: .medium, design: .rounded))
                            .foregroundColor(.white.opacity(0.7))
                    }
                }
                
                // Error message
                if showError, let error = authManager.errorMessage {
                    Text(error)
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.red)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        .background(Color.red.opacity(0.1))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .transition(.opacity.combined(with: .move(edge: .top)))
                }
                
                Spacer()
                
                // Unlock button
                Button(action: unlock) {
                    HStack(spacing: 12) {
                        Image(systemName: authManager.biometricType.icon)
                            .font(.system(size: 22))
                        
                        Text("Unlock with \(authManager.biometricType.displayName)")
                            .font(.system(size: 17, weight: .semibold, design: .rounded))
                    }
                    .foregroundColor(.white)
                    .padding(.horizontal, 32)
                    .padding(.vertical, 18)
                    .background(
                        LinearGradient(
                            colors: [.blue, .purple],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .clipShape(Capsule())
                    .shadow(color: .blue.opacity(0.4), radius: 15, y: 5)
                }
                
                // Sign out option
                Button(action: {
                    HapticManager.shared.light()
                    authManager.signOut()
                }) {
                    Text("Sign Out")
                        .font(.system(size: 15, weight: .medium, design: .rounded))
                        .foregroundColor(.white.opacity(0.5))
                }
                .padding(.top, 8)
                
                Spacer().frame(height: 40)
            }
            .padding(.horizontal, 24)
        }
        .onAppear {
            isAnimating = true
            
            // Auto-trigger biometrics
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                unlock()
            }
        }
    }
    
    private func unlock() {
        HapticManager.shared.medium()
        showError = false
        
        Task {
            let success = await authManager.unlockWithBiometrics()
            
            if !success {
                withAnimation(.spring()) {
                    showError = true
                }
            }
        }
    }
}

// MARK: - Biometric Enable Prompt

struct BiometricEnablePrompt: View {
    
    @StateObject private var authManager = AuthenticationManager.shared
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack(spacing: 24) {
            // Icon
            ZStack {
                Circle()
                    .fill(Color.blue.opacity(0.1))
                    .frame(width: 100, height: 100)
                
                Image(systemName: authManager.biometricType.icon)
                    .font(.system(size: 44))
                    .foregroundColor(.blue)
            }
            
            // Title
            Text("Enable \(authManager.biometricType.displayName)?")
                .font(.system(size: 22, weight: .bold, design: .rounded))
                .foregroundColor(.white)
            
            // Description
            Text("Use \(authManager.biometricType.displayName) for quick and secure access to Aperture next time.")
                .font(.system(size: 15, weight: .regular, design: .rounded))
                .foregroundColor(.white.opacity(0.7))
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            // Buttons
            VStack(spacing: 12) {
                Button(action: {
                    HapticManager.shared.medium()
                    Task {
                        _ = await authManager.enableBiometricLogin()
                        isPresented = false
                    }
                }) {
                    Text("Enable \(authManager.biometricType.displayName)")
                        .font(.system(size: 17, weight: .semibold, design: .rounded))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 14))
                }
                
                Button(action: {
                    HapticManager.shared.light()
                    isPresented = false
                }) {
                    Text("Maybe Later")
                        .font(.system(size: 16, weight: .medium, design: .rounded))
                        .foregroundColor(.white.opacity(0.6))
                }
            }
        }
        .padding(24)
        .background(
            RoundedRectangle(cornerRadius: 24)
                .fill(Color(red: 0.1, green: 0.05, blue: 0.2))
        )
        .padding(.horizontal, 32)
    }
}

// MARK: - Preview

#Preview {
    AuthenticationView()
}
