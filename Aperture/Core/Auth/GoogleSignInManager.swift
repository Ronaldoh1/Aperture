// GoogleSignInManager.swift
// SunFlow: Reignited — Aperture
//
// Google Sign-In via Firebase + GoogleSignIn SDK
//
// ⚙️  SETUP (one-time):
// 1. In Xcode → File → Add Package Dependencies:
//    URL: https://github.com/google/GoogleSignIn-iOS
//    Add: GoogleSignIn and GoogleSignInSwift targets
//
// 2. In GoogleService-Info.plist (already present), add your
//    REVERSED_CLIENT_ID as a URL scheme in Info.plist:
//    Key: CFBundleURLTypes
//    Value: [{CFBundleURLSchemes: ["<your-REVERSED_CLIENT_ID>"]}]
//    Your current REVERSED_CLIENT_ID is in GoogleService-Info.plist
//
// 3. In AppDelegate / App entry: GIDSignIn.sharedInstance.handle(url)
//    already handled if you use the standard URL scheme approach.
//
// That's it. The manager below handles the rest.

import SwiftUI
import Combine
import FirebaseAuth

// MARK: - Google User Model
struct GoogleSignedInUser {
    let uid: String
    let email: String
    let displayName: String
    let photoURL: URL?
}

// MARK: - Google Sign-In Manager
@MainActor
final class GoogleSignInManager: ObservableObject {

    static let shared = GoogleSignInManager()

    @Published var isSignedIn: Bool = false
    @Published var signedInUser: GoogleSignedInUser?
    @Published var isLoading: Bool = false
    @Published var error: String?

    private init() {}

    // MARK: - Sign In

    /// Call this from any SwiftUI view with the presenting view controller
    /// Returns the Firebase User on success
    func signIn(presenting viewController: UIViewController) async throws -> GoogleSignedInUser {
        isLoading = true
        error = nil

        do {
            let user = try await performGoogleSignIn(presenting: viewController)
            isSignedIn = true
            signedInUser = user
            isLoading = false
            return user
        } catch {
            isLoading = false
            self.error = error.localizedDescription
            throw error
        }
    }

    // MARK: - Sign Out
    func signOut() {
        // GIDSignIn.sharedInstance.signOut()
        try? Auth.auth().signOut()
        isSignedIn = false
        signedInUser = nil
    }

    // MARK: - Core Implementation
    private func performGoogleSignIn(presenting viewController: UIViewController) async throws -> GoogleSignedInUser {

        // ── GoogleSignIn SDK implementation ─────────────────────────────
        // Uncomment below after adding the GoogleSignIn SPM package:
        //
        // guard let clientID = FirebaseApp.app()?.options.clientID else {
        //     throw GoogleAuthError.missingClientID
        // }
        // let config = GIDConfiguration(clientID: clientID)
        // GIDSignIn.sharedInstance.configuration = config
        //
        // let result = try await GIDSignIn.sharedInstance.signIn(withPresenting: viewController)
        //
        // guard let idToken = result.user.idToken?.tokenString else {
        //     throw GoogleAuthError.missingIDToken
        // }
        // let accessToken = result.user.accessToken.tokenString
        // let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: accessToken)
        // let authResult = try await Auth.auth().signIn(with: credential)
        // let firebaseUser = authResult.user
        //
        // return GoogleSignedInUser(
        //     uid: firebaseUser.uid,
        //     email: firebaseUser.email ?? "",
        //     displayName: firebaseUser.displayName ?? "",
        //     photoURL: firebaseUser.photoURL
        // )
        // ────────────────────────────────────────────────────────────────

        // TEMP stub — remove once SPM package is added
        throw GoogleAuthError.sdkNotInstalled
    }
}

// MARK: - Errors
enum GoogleAuthError: LocalizedError {
    case missingClientID
    case missingIDToken
    case sdkNotInstalled
    case cancelled
    case unknown(String)

    var errorDescription: String? {
        switch self {
        case .missingClientID:   return "Firebase client ID not found. Check GoogleService-Info.plist."
        case .missingIDToken:    return "Google sign-in token missing. Please try again."
        case .sdkNotInstalled:   return "Add the GoogleSignIn SPM package to enable Google Sign-In."
        case .cancelled:         return "Google sign-in was cancelled."
        case .unknown(let msg):  return msg
        }
    }
}

// MARK: - SwiftUI View Modifier for presenting
struct GoogleSignInButton: View {
    let onTap: () -> Void
    @State private var isPressed = false

    var body: some View {
        Button {
            onTap()
        } label: {
            HStack(spacing: 12) {
                // Google G logo
                ZStack {
                    Circle()
                        .fill(Color.white)
                        .frame(width: 24, height: 24)
                    Text("G")
                        .font(.system(size: 14, weight: .bold, design: .rounded))
                        .foregroundColor(Color(red: 0.25, green: 0.52, blue: 0.96))
                }

                Text("Continue with Google")
                    .font(.system(size: 16, weight: .semibold, design: .rounded))
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 54)
            .background(
                RoundedRectangle(cornerRadius: 14)
                    .fill(Color(red: 0.16, green: 0.18, blue: 0.24))
                    .overlay(
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(
                                LinearGradient(
                                    colors: [
                                        Color(red: 0.25, green: 0.52, blue: 0.96).opacity(0.6),
                                        Color(red: 0.91, green: 0.26, blue: 0.21).opacity(0.3),
                                        Color(red: 0.99, green: 0.73, blue: 0.02).opacity(0.4)
                                    ],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                ),
                                lineWidth: 1
                            )
                    )
            )
            .scaleEffect(isPressed ? 0.97 : 1.0)
            .animation(.spring(response: 0.2), value: isPressed)
        }
        .buttonStyle(.plain)
        .simultaneousGesture(
            DragGesture(minimumDistance: 0)
                .onChanged { _ in isPressed = true }
                .onEnded { _ in isPressed = false }
        )
    }
}

// MARK: - UIViewController Helper for SwiftUI
extension UIApplication {
    var topViewController: UIViewController? {
        let keyWindow = connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap { $0.windows }
            .first { $0.isKeyWindow }

        var top = keyWindow?.rootViewController
        while let presented = top?.presentedViewController {
            top = presented
        }
        return top
    }
}
