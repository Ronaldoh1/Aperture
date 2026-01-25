// SecuritySettingsView.swift
// User-facing settings for authentication and security preferences
// Manage biometrics, auto-lock, and account security

import SwiftUI

struct SecuritySettingsView: View {
    
    @StateObject private var authManager = AuthenticationManager.shared
    @StateObject private var biometricManager = BiometricAuthManager.shared
    @StateObject private var appLockSettings = AppLockSettings.shared
    
    @State private var showBiometricConfirmation = false
    @State private var showSignOutConfirmation = false
    @State private var showDeleteAccountAlert = false
    
    var body: some View {
        List {
            // Account Section
            accountSection
            
            // Biometric Section
            if authManager.canUseBiometrics {
                biometricSection
            }
            
            // Auto-Lock Section
            autoLockSection
            
            // Privacy Section
            privacySection
            
            // Danger Zone
            dangerZoneSection
        }
        .navigationTitle("Security")
        .navigationBarTitleDisplayMode(.large)
        .listStyle(.insetGrouped)
        .alert("Enable \(authManager.biometricType.displayName)", isPresented: $showBiometricConfirmation) {
            Button("Enable") {
                Task {
                    _ = await authManager.enableBiometricLogin()
                }
            }
            Button("Cancel", role: .cancel) {}
        } message: {
            Text("Use \(authManager.biometricType.displayName) for quick access to Aperture.")
        }
        .alert("Sign Out", isPresented: $showSignOutConfirmation) {
            Button("Sign Out", role: .destructive) {
                authManager.signOut()
            }
            Button("Cancel", role: .cancel) {}
        } message: {
            Text("Are you sure you want to sign out?")
        }
    }
    
    // MARK: - Account Section
    
    private var accountSection: some View {
        Section {
            // Current user info
            if let user = authManager.currentUser {
                HStack(spacing: 14) {
                    // Avatar
                    ZStack {
                        Circle()
                            .fill(
                                LinearGradient(
                                    colors: [.blue, .purple],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .frame(width: 50, height: 50)
                        
                        Text(user.displayNameOrDefault.prefix(1).uppercased())
                            .font(.system(size: 20, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                    }
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(user.displayNameOrDefault)
                            .font(.system(size: 16, weight: .semibold, design: .rounded))
                        
                        if let email = user.email {
                            Text(email)
                                .font(.system(size: 13, weight: .regular, design: .rounded))
                                .foregroundColor(.secondary)
                        }
                        
                        // Auth method badge
                        HStack(spacing: 4) {
                            Image(systemName: user.authMethod.icon)
                                .font(.system(size: 10))
                            Text(user.authMethod.displayName)
                                .font(.system(size: 11, weight: .medium))
                        }
                        .foregroundColor(.white.opacity(0.7))
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Color.blue.opacity(0.2))
                        .clipShape(Capsule())
                    }
                }
                .padding(.vertical, 8)
            }
            
            // Sign out button
            Button(action: {
                HapticManager.shared.light()
                showSignOutConfirmation = true
            }) {
                HStack {
                    Image(systemName: "rectangle.portrait.and.arrow.right")
                        .foregroundColor(.red)
                    Text("Sign Out")
                        .foregroundColor(.red)
                }
            }
        } header: {
            Text("Account")
        }
    }
    
    // MARK: - Biometric Section
    
    private var biometricSection: some View {
        Section {
            // Biometric toggle
            Toggle(isOn: $authManager.biometricLoginEnabled) {
                HStack(spacing: 12) {
                    Image(systemName: authManager.biometricType.icon)
                        .font(.system(size: 20))
                        .foregroundColor(.blue)
                        .frame(width: 28)
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text(authManager.biometricType.displayName)
                            .font(.system(size: 16, weight: .medium, design: .rounded))
                        
                        Text("Quick unlock when returning to app")
                            .font(.system(size: 12, weight: .regular, design: .rounded))
                            .foregroundColor(.secondary)
                    }
                }
            }
            .onChange(of: authManager.biometricLoginEnabled) { enabled in
                HapticManager.shared.light()
                if enabled {
                    Task {
                        let success = await authManager.enableBiometricLogin()
                        if !success {
                            authManager.biometricLoginEnabled = false
                        }
                    }
                }
            }
            
            // Lock on background toggle
            Toggle(isOn: $appLockSettings.lockOnBackground) {
                HStack(spacing: 12) {
                    Image(systemName: "lock.shield")
                        .font(.system(size: 20))
                        .foregroundColor(.orange)
                        .frame(width: 28)
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text("Lock When Leaving App")
                            .font(.system(size: 16, weight: .medium, design: .rounded))
                        
                        Text("Require unlock when returning")
                            .font(.system(size: 12, weight: .regular, design: .rounded))
                            .foregroundColor(.secondary)
                    }
                }
            }
            .onChange(of: appLockSettings.lockOnBackground) { _ in
                HapticManager.shared.light()
            }
            
        } header: {
            Text("Biometric Security")
        } footer: {
            Text("\(authManager.biometricType.displayName) provides fast, secure access without typing passwords.")
        }
    }
    
    // MARK: - Auto-Lock Section
    
    private var autoLockSection: some View {
        Section {
            Picker(selection: $authManager.autoLockMinutes) {
                Text("Immediately").tag(0)
                Text("After 1 minute").tag(1)
                Text("After 5 minutes").tag(5)
                Text("After 15 minutes").tag(15)
                Text("After 30 minutes").tag(30)
                Text("Never").tag(-1)
            } label: {
                HStack(spacing: 12) {
                    Image(systemName: "timer")
                        .font(.system(size: 20))
                        .foregroundColor(.purple)
                        .frame(width: 28)
                    
                    Text("Auto-Lock")
                        .font(.system(size: 16, weight: .medium, design: .rounded))
                }
            }
            .onChange(of: authManager.autoLockMinutes) { _ in
                HapticManager.shared.light()
            }
        } header: {
            Text("Auto-Lock")
        } footer: {
            Text("Automatically lock the app after being in the background.")
        }
    }
    
    // MARK: - Privacy Section
    
    private var privacySection: some View {
        Section {
            // Remember me toggle
            Toggle(isOn: $authManager.rememberMe) {
                HStack(spacing: 12) {
                    Image(systemName: "person.badge.key")
                        .font(.system(size: 20))
                        .foregroundColor(.green)
                        .frame(width: 28)
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text("Remember Me")
                            .font(.system(size: 16, weight: .medium, design: .rounded))
                        
                        Text("Stay signed in between sessions")
                            .font(.system(size: 12, weight: .regular, design: .rounded))
                            .foregroundColor(.secondary)
                    }
                }
            }
            .onChange(of: authManager.rememberMe) { _ in
                HapticManager.shared.light()
            }
            
            // Require auth for premium
            Toggle(isOn: $appLockSettings.requireAuthForPremium) {
                HStack(spacing: 12) {
                    Image(systemName: "crown.fill")
                        .font(.system(size: 20))
                        .foregroundColor(.yellow)
                        .frame(width: 28)
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text("Protect Premium Content")
                            .font(.system(size: 16, weight: .medium, design: .rounded))
                        
                        Text("Require authentication for premium features")
                            .font(.system(size: 12, weight: .regular, design: .rounded))
                            .foregroundColor(.secondary)
                    }
                }
            }
            .onChange(of: appLockSettings.requireAuthForPremium) { _ in
                HapticManager.shared.light()
            }
        } header: {
            Text("Privacy")
        }
    }
    
    // MARK: - Danger Zone
    
    private var dangerZoneSection: some View {
        Section {
            // Lock app now
            Button(action: {
                HapticManager.shared.medium()
                authManager.lockApp()
            }) {
                HStack(spacing: 12) {
                    Image(systemName: "lock.fill")
                        .font(.system(size: 20))
                        .foregroundColor(.blue)
                        .frame(width: 28)
                    
                    Text("Lock App Now")
                        .font(.system(size: 16, weight: .medium, design: .rounded))
                        .foregroundColor(.primary)
                }
            }
            
            // Delete account (placeholder)
            Button(action: {
                HapticManager.shared.warning()
                showDeleteAccountAlert = true
            }) {
                HStack(spacing: 12) {
                    Image(systemName: "trash.fill")
                        .font(.system(size: 20))
                        .foregroundColor(.red)
                        .frame(width: 28)
                    
                    Text("Delete Account")
                        .font(.system(size: 16, weight: .medium, design: .rounded))
                        .foregroundColor(.red)
                }
            }
        } header: {
            Text("Actions")
        }
        .alert("Delete Account", isPresented: $showDeleteAccountAlert) {
            Button("Delete", role: .destructive) {
                // TODO: Implement account deletion
            }
            Button("Cancel", role: .cancel) {}
        } message: {
            Text("This will permanently delete your account and all associated data. This action cannot be undone.")
        }
    }
}

// MARK: - Settings Row Component

struct SecuritySettingsRow: View {
    let icon: String
    let iconColor: Color
    let title: String
    let subtitle: String?
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .font(.system(size: 20))
                .foregroundColor(iconColor)
                .frame(width: 28)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.system(size: 16, weight: .medium, design: .rounded))
                
                if let subtitle = subtitle {
                    Text(subtitle)
                        .font(.system(size: 12, weight: .regular, design: .rounded))
                        .foregroundColor(.secondary)
                }
            }
        }
    }
}

// MARK: - Preview

#Preview {
    NavigationView {
        SecuritySettingsView()
    }
    .preferredColorScheme(.dark)
}
