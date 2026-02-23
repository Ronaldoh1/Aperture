// AuthenticationManager.swift
// Unified authentication system prioritizing biometrics for easy access
// Supports: Face ID, Touch ID, Sign in with Apple, Email/Password

import SwiftUI
import LocalAuthentication
import Combine

// MARK: - Authentication State

enum AuthenticationState: Equatable {
    case unknown          // Initial state, checking credentials
    case unauthenticated  // No session, needs to sign up/sign in
    case locked           // Has session, needs biometric unlock
    case authenticated    // Fully authenticated, ready to use app
    
    var isFullyAuthenticated: Bool {
        self == .authenticated
    }
}

// MARK: - Authentication Method

enum AuthMethod: String, CaseIterable {
    case biometric = "biometric"
    case apple = "apple"
    case google = "google"
    case email = "email"
    case guest = "guest"
    
    var displayName: String {
        switch self {
        case .biometric: return "Face ID / Touch ID"
        case .apple: return "Sign in with Apple"
        case .google: return "Sign in with Google"
        case .email: return "Email & Password"
        case .guest: return "Continue as Guest"
        }
    }
    
    var icon: String {
        switch self {
        case .biometric: return "faceid"
        case .apple: return "apple.logo"
        case .google: return "globe"
        case .email: return "envelope.fill"
        case .guest: return "person.fill.questionmark"
        }
    }
}

// MARK: - Authentication Manager

@MainActor
final class AuthenticationManager: ObservableObject {
    
    static let shared = AuthenticationManager()
    
    // MARK: - Published State
    
    @Published var state: AuthenticationState = .unknown
    @Published var currentUser: AuthenticatedUser?
    @Published var preferredAuthMethod: AuthMethod = .biometric
    @Published var biometricType: BiometricAuthManager.BiometricType = .none
    @Published var canUseBiometrics: Bool = false
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    // MARK: - Settings
    
    @AppStorage("auth_biometric_enabled") var biometricLoginEnabled: Bool = true
    @AppStorage("auth_remember_me") var rememberMe: Bool = true
    @AppStorage("auth_auto_lock_minutes") var autoLockMinutes: Int = 5
    @AppStorage("auth_method_used") private var lastAuthMethodUsed: String = ""
    
    // MARK: - Private
    
    private let biometricManager = BiometricAuthManager.shared
    private let keychain = KeychainManager.shared
    private var backgroundDate: Date?
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Init
    
    private init() {
        setupBiometrics()
        setupBackgroundObservers()
        checkExistingSession()
    }
    
    // MARK: - Setup
    
    private func setupBiometrics() {
        biometricManager.checkBiometricAvailability()
        biometricType = biometricManager.biometricType
        canUseBiometrics = biometricManager.canUseBiometrics
        
        if let lastMethod = AuthMethod(rawValue: lastAuthMethodUsed) {
            preferredAuthMethod = lastMethod
        } else if canUseBiometrics {
            preferredAuthMethod = .biometric
        }
    }
    
    private func setupBackgroundObservers() {
        NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)
            .sink { [weak self] _ in
                self?.backgroundDate = Date()
            }
            .store(in: &cancellables)
        
        NotificationCenter.default.publisher(for: UIApplication.didBecomeActiveNotification)
            .sink { [weak self] _ in
                self?.handleReturnFromBackground()
            }
            .store(in: &cancellables)
    }
    
    private func handleReturnFromBackground() {
        guard let backgroundDate = backgroundDate,
              state == .authenticated,
              autoLockMinutes > 0 else { return }
        
        let minutesInBackground = Date().timeIntervalSince(backgroundDate) / 60
        
        if minutesInBackground >= Double(autoLockMinutes) {
            // Lock the app
            state = .locked
            print("🔒 App locked after \(Int(minutesInBackground)) minutes in background")
        }
        
        self.backgroundDate = nil
    }
    
    // MARK: - Check Existing Session
    
    func checkExistingSession() {
        isLoading = true
        
        // Check Keychain for existing session
        if let session = keychain.getSession(), !session.isExpired {
            currentUser = AuthenticatedUser(
                id: session.userId,
                email: nil,
                displayName: nil,
                authMethod: AuthMethod(rawValue: lastAuthMethodUsed) ?? .email
            )
            
            // If biometrics enabled, require unlock
            if biometricLoginEnabled && canUseBiometrics {
                state = .locked
            } else {
                state = .authenticated
            }
        } else {
            state = .unauthenticated
        }
        
        isLoading = false
    }
    
    // MARK: - Biometric Authentication
    
    /// Quick unlock with biometrics (for returning users)
    func unlockWithBiometrics() async -> Bool {
        guard canUseBiometrics else {
            errorMessage = "Biometrics not available"
            return false
        }
        
        isLoading = true
        errorMessage = nil
        
        let result = await biometricManager.authenticate(
            reason: "Unlock Aperture to continue your journey"
        )
        
        isLoading = false
        
        switch result {
        case .success(true):
            HapticManager.shared.success()
            state = .authenticated
            lastAuthMethodUsed = AuthMethod.biometric.rawValue
            return true
            
        case .success(false):
            HapticManager.shared.error()
            errorMessage = "Authentication failed"
            return false
            
        case .failure(let error):
            HapticManager.shared.error()
            
            // If user cancelled or biometrics failed, don't show error
            if case .userCancelled = error {
                return false
            }
            
            errorMessage = error.localizedDescription
            return false
        }
    }
    
    /// Enable biometric login for future sessions
    func enableBiometricLogin() async -> Bool {
        guard canUseBiometrics else { return false }
        
        let result = await biometricManager.authenticate(
            reason: "Enable \(biometricType.displayName) for quick access"
        )
        
        switch result {
        case .success(true):
            biometricLoginEnabled = true
            HapticManager.shared.success()
            return true
        default:
            return false
        }
    }
    
    // MARK: - Sign In Methods
    
    /// Sign in with Google (requires GoogleSignIn SPM package)
    func signInWithGoogle() async {
        isLoading = true
        errorMessage = nil

        guard let vc = UIApplication.shared.topViewController else {
            errorMessage = "Unable to present sign-in screen."
            isLoading = false
            return
        }

        do {
            let googleUser = try await GoogleSignInManager.shared.signIn(presenting: vc)

            let user = AuthenticatedUser(
                id: googleUser.uid,
                email: googleUser.email,
                displayName: googleUser.displayName,
                authMethod: .google,
                profileImageURL: googleUser.photoURL
            )

            currentUser = user
            lastAuthMethodUsed = AuthMethod.google.rawValue
            _ = keychain.save(googleUser.uid, forKey: .userId)
            state = .authenticated

        } catch GoogleAuthError.cancelled {
            // User tapped Back — not an error, just exit silently
        } catch GoogleAuthError.sdkNotInstalled {
            errorMessage = "Google Sign-In requires the GoogleSignIn SPM package. See GoogleSignInManager.swift for setup instructions."
        } catch {
            errorMessage = error.localizedDescription
        }

        isLoading = false
    }
    
    /// Sign in with Apple
    func signInWithApple() async {
        isLoading = true
        errorMessage = nil
        
        // Trigger Apple sign in flow
        SignInWithAppleManager.shared.signIn()
        
        // The completion will be handled by observing SignInWithAppleManager
        // For now, we'll set up the observation
        
        // Wait for sign in result
        await withCheckedContinuation { continuation in
            var cancellable: AnyCancellable?
            
            cancellable = SignInWithAppleManager.shared.$isSignedIn
                .dropFirst()
                .first()
                .sink { [weak self] isSignedIn in
                    if isSignedIn {
                        self?.handleAppleSignInSuccess()
                    }
                    cancellable?.cancel()
                    continuation.resume()
                }
        }
        
        isLoading = false
    }
    
    private func handleAppleSignInSuccess() {
        guard let userId = SignInWithAppleManager.shared.userIdentifier else { return }
        
        let user = AuthenticatedUser(
            id: userId,
            email: SignInWithAppleManager.shared.email,
            displayName: SignInWithAppleManager.shared.fullName,
            authMethod: .apple
        )
        
        currentUser = user
        saveSession(userId: userId)
        lastAuthMethodUsed = AuthMethod.apple.rawValue
        state = .authenticated
        
        HapticManager.shared.success()
        
        // Prompt to enable biometrics for next time
        if canUseBiometrics && !biometricLoginEnabled {
            // Will be handled by UI
        }
    }
    
    /// Sign in with email/password
    func signInWithEmail(_ email: String, password: String) async -> Bool {
        isLoading = true
        errorMessage = nil
        
        // Validate
        guard !email.isEmpty, !password.isEmpty else {
            errorMessage = "Please enter email and password"
            isLoading = false
            return false
        }
        
        // TODO: Replace with actual Firebase Auth
        // For now, simulate auth
        try? await Task.sleep(nanoseconds: 1_000_000_000)
        
        // Simulate success
        let userId = "user_\(email.hashValue)"
        
        let user = AuthenticatedUser(
            id: userId,
            email: email,
            displayName: nil,
            authMethod: .email
        )
        
        currentUser = user
        saveSession(userId: userId)
        lastAuthMethodUsed = AuthMethod.email.rawValue
        state = .authenticated
        
        isLoading = false
        HapticManager.shared.success()
        
        return true
    }
    
    /// Continue as guest (limited features)
    func continueAsGuest() {
        let guestId = "guest_\(UUID().uuidString)"
        
        let user = AuthenticatedUser(
            id: guestId,
            email: nil,
            displayName: "Guest",
            authMethod: .guest,
            isGuest: true
        )
        
        currentUser = user
        lastAuthMethodUsed = AuthMethod.guest.rawValue
        state = .authenticated
        
        // Don't save guest session to Keychain
        HapticManager.shared.light()
    }
    
    // MARK: - Session Management
    
    private func saveSession(userId: String) {
        guard rememberMe else { return }
        
        let session = SecureSession(
            userId: userId,
            authToken: "token_\(UUID().uuidString)", // Replace with real token
            refreshToken: nil,
            expiresAt: Date().addingTimeInterval(30 * 24 * 60 * 60), // 30 days
            createdAt: Date()
        )
        
        _ = keychain.saveSession(session)
    }
    
    // MARK: - Sign Out
    
    func signOut() {
        keychain.clearSession()
        currentUser = nil
        state = .unauthenticated
        
        // Clear Apple sign in if used
        if lastAuthMethodUsed == AuthMethod.apple.rawValue {
            SignInWithAppleManager.shared.signOut()
        }
        
        HapticManager.shared.medium()
    }
    
    // MARK: - Lock/Unlock
    
    func lockApp() {
        guard state == .authenticated else { return }
        state = .locked
        HapticManager.shared.light()
    }
}

// MARK: - Authenticated User Model

struct AuthenticatedUser: Identifiable, Codable {
    let id: String
    var email: String?
    var displayName: String?
    var authMethod: AuthMethod
    var isGuest: Bool
    var profileImageURL: URL?
    var createdAt: Date
    
    init(
        id: String,
        email: String? = nil,
        displayName: String? = nil,
        authMethod: AuthMethod,
        isGuest: Bool = false,
        profileImageURL: URL? = nil
    ) {
        self.id = id
        self.email = email
        self.displayName = displayName
        self.authMethod = authMethod
        self.isGuest = isGuest
        self.profileImageURL = profileImageURL
        self.createdAt = Date()
    }
    
    var displayNameOrDefault: String {
        displayName ?? email?.components(separatedBy: "@").first ?? "Seeker"
    }
}

// Make AuthMethod Codable
extension AuthMethod: Codable {}

// MARK: - Auth View Modifier

struct RequireAuthenticationModifier: ViewModifier {
    @ObservedObject var authManager = AuthenticationManager.shared
    
    func body(content: Content) -> some View {
        Group {
            switch authManager.state {
            case .unknown:
                LoadingView()
            case .unauthenticated:
                AuthenticationView()
            case .locked:
                LockScreenView()
            case .authenticated:
                content
            }
        }
        .animation(.easeInOut(duration: 0.3), value: authManager.state)
    }
}

extension View {
    func requireAuthentication() -> some View {
        modifier(RequireAuthenticationModifier())
    }
}

// MARK: - Loading View

private struct LoadingView: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack(spacing: 20) {
                Image(systemName: "sun.max.fill")
                    .font(.system(size: 60))
                    .foregroundColor(.orange)
                    .symbolEffect(.pulse)
                
                ProgressView()
                    .tint(.white)
            }
        }
    }
}
