//
//  SignUpView.swift
//  Aperture
//
//  Sign Up Screen - Seed of Life (New Beginning)
//  ☀️ SunFlow: Reignited
//

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
        case name, email, password, confirmPassword
    }
    
    var body: some View {
        ZStack {
            
            // Background
            Color.black.ignoresSafeArea()
            
            // Sacred Geometry Background - Seed of Life (New Beginning)
            SeedOfLife()
                .stroke(Color(hex: "00FF88").opacity(0.12), lineWidth: 2)
                .blur(radius: 2)
                .frame(width: 460, height: 460)
            
            // Content
            ScrollView {
                VStack(spacing: 32) {
                    
                    Spacer()
                        .frame(height: 40)
                    
                    // Logo / Title
                    VStack(spacing: 16) {
                        
                        SeedOfLife()
                            .stroke(Color(hex: "00FF88").opacity(0.12), lineWidth: 2)
                            .blur(radius: 2)
                            .frame(width: 460, height: 460)
                        
                        Text("Create Account")
                            .font(.system(size: 32, weight: .bold, design: .rounded))
                            .foregroundColor(Color(hex: "00FF88"))
                        
                        Text("Begin Your Journey")
                            .font(.system(size: 16, weight: .medium, design: .rounded))
                            .foregroundColor(.white.opacity(0.7))
                        
                    }
                    
                    // Form
                    VStack(spacing: 20) {
                        
                        // Name
                        CosmicTextField(
                            text: $displayName,
                            placeholder: "Full Name",
                            iconName: "person.fill"
                        )
                        .focused($focusedField, equals: .name)
                        .textInputAutocapitalization(.words)
                        
                        // Email
                        CosmicTextField(
                            text: $email,
                            placeholder: "Email",
                            iconName: "envelope.fill",
                            keyboardType: .emailAddress
                        )
                        .focused($focusedField, equals: .email)
                        .textInputAutocapitalization(.never)
                        
                        // Password
                        CosmicSecureField(
                            text: $password,
                            placeholder: "Password",
                            iconName: "lock.fill",
                            showPassword: $showPassword
                        )
                        .focused($focusedField, equals: .password)
                        
                        // Confirm Password
                        CosmicSecureField(
                            text: $confirmPassword,
                            placeholder: "Confirm Password",
                            iconName: "lock.fill",
                            showPassword: $showPassword
                        )
                        .focused($focusedField, equals: .confirmPassword)
                        
                        // Password requirements
                        HStack {
                            Image(systemName: "info.circle.fill")
                                .font(.system(size: 12))
                                .foregroundColor(Color(hex: "00BFFF").opacity(0.6))
                            
                            Text("Password must be at least 6 characters")
                                .font(.system(size: 12))
                                .foregroundColor(.white.opacity(0.5))
                            
                            Spacer()
                        }
                        .padding(.horizontal, 4)
                        
                        // Sign Up Button
                        Button(action: {
                            guard password == confirmPassword else {
                                // Show error
                                return
                            }
                            onSignUp()
                        }) {
                            HStack(spacing: 12) {
                                if isLoading {
                                    ProgressView()
                                        .tint(.black)
                                } else {
                                    Text("Create Account")
                                        .font(.system(size: 18, weight: .semibold))
                                }
                            }
                            .frame(maxWidth: .infinity)
                            .frame(height: 56)
                            .background(
                                LinearGradient(
                                    colors: [Color(hex: "00FF88"), Color(hex: "00BFFF")],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .foregroundColor(.black)
                            .cornerRadius(16)
                            .shadow(color: Color(hex: "00FF88").opacity(0.5), radius: 10)
                        }
                        .disabled(isLoading || password != confirmPassword || password.count < 6)
                        .opacity((password != confirmPassword || password.count < 6) ? 0.6 : 1.0)
                        
                        // Divider
                        HStack {
                            Rectangle()
                                .fill(Color.white.opacity(0.3))
                                .frame(height: 1)
                            
                            Text("or")
                                .font(.system(size: 14))
                                .foregroundColor(.white.opacity(0.6))
                                .padding(.horizontal, 12)
                            
                            Rectangle()
                                .fill(Color.white.opacity(0.3))
                                .frame(height: 1)
                        }
                        .padding(.vertical, 8)
                        
                        // Google Sign In
                        Button(action: onGoogleSignIn) {
                            HStack(spacing: 12) {
                                Image(systemName: "globe")
                                    .font(.system(size: 20))
                                
                                Text("Sign Up with Google")
                                    .font(.system(size: 16, weight: .medium))
                            }
                            .frame(maxWidth: .infinity)
                            .frame(height: 56)
                            .background(Color.white.opacity(0.1))
                            .foregroundColor(.white)
                            .cornerRadius(16)
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.white.opacity(0.3), lineWidth: 1)
                            )
                        }
                        .disabled(isLoading)
                        
                    }
                    .padding(.horizontal, 32)
                    
                    // Sign In Link
                    HStack(spacing: 4) {
                        Text("Already have an account?")
                            .font(.system(size: 14))
                            .foregroundColor(.white.opacity(0.7))
                        
                        Button(action: onSignIn) {
                            Text("Sign In")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(Color(hex: "00FF88"))
                        }
                    }
                    
                    Spacer()
                    
                }
            }
            .dismissKeyboard()
            
        }
    }
    
}

#Preview {
    SignUpView(
        email: .constant(""),
        password: .constant(""),
        confirmPassword: .constant(""),
        displayName: .constant(""),
        onSignUp: {},
        onSignIn: {},
        onGoogleSignIn: {},
        isLoading: false
    )
}
