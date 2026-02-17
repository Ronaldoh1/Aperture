// SignInWithApple.swift
// Apple Sign In implementation
// Required when app has other authentication methods

import AuthenticationServices
import CryptoKit
import SwiftUI

// MARK: - Sign In With Apple Manager

final class SignInWithAppleManager: NSObject, ObservableObject {
  static let shared = SignInWithAppleManager()

  @Published var isSignedIn: Bool = false
  @Published var userIdentifier: String?
  @Published var fullName: String?
  @Published var email: String?
  @Published var errorMessage: String?
  @Published var hasError: Bool = false

  /// Nonce for security
  private var currentNonce: String?

  override private init() {
    super.init()
    checkExistingCredentials()
  }

  // MARK: - Check Existing Credentials

  func checkExistingCredentials() {
    // Check if we have stored Apple ID
    if let userId = KeychainManager.shared.getString(forKey: .userId) {
      let provider = ASAuthorizationAppleIDProvider()
      provider.getCredentialState(forUserID: userId) { [weak self] state, _ in
        DispatchQueue.main.async {
          switch state {
          case .authorized:
            self?.isSignedIn = true
            self?.userIdentifier = userId
            print("✅ Apple ID authorized")
          case .revoked, .notFound:
            self?.isSignedIn = false
            self?.signOut()
            print("⚠️ Apple ID revoked or not found")
          default:
            break
          }
        }
      }
    }
  }

  // MARK: - Sign In

  func signIn() {
    let nonce = randomNonceString()
    currentNonce = nonce

    let appleIDProvider = ASAuthorizationAppleIDProvider()
    let request = appleIDProvider.createRequest()
    request.requestedScopes = [.fullName, .email]
    request.nonce = sha256(nonce)

    let authorizationController = ASAuthorizationController(authorizationRequests: [request])
    authorizationController.delegate = self
    authorizationController.presentationContextProvider = self
    authorizationController.performRequests()
  }

  // MARK: - Sign Out

  func signOut() {
    isSignedIn = false
    userIdentifier = nil
    fullName = nil
    email = nil
    KeychainManager.shared.delete(key: .userId)
    print("🚪 Signed out of Apple ID")
  }

  // MARK: - Nonce Generation

  private func randomNonceString(length: Int = 32) -> String {
    precondition(length > 0)
    var randomBytes = [UInt8](repeating: 0, count: length)
    let errorCode = SecRandomCopyBytes(kSecRandomDefault, randomBytes.count, &randomBytes)
    if errorCode != errSecSuccess {
      fatalError("Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)")
    }

    let charset: [Character] = Array(
      "0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
    let nonce = randomBytes.map { byte in
      charset[Int(byte) % charset.count]
    }

    return String(nonce)
  }

  private func sha256(_ input: String) -> String {
    let inputData = Data(input.utf8)
    let hashedData = SHA256.hash(data: inputData)
    return hashedData.compactMap {
      String(format: "%02x", $0)
    }.joined()
  }
}

// MARK: - ASAuthorizationController Delegate

extension SignInWithAppleManager: ASAuthorizationControllerDelegate {
  func authorizationController(
    controller _: ASAuthorizationController,
    didCompleteWithAuthorization authorization: ASAuthorization
  ) {
    guard let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential
    else {
      print("⚠️ Invalid credential type")
      return
    }

    // Get user info
    let userIdentifier = appleIDCredential.user
    let fullName = [appleIDCredential.fullName?.givenName, appleIDCredential.fullName?.familyName]
      .compactMap { $0 }
      .joined(separator: " ")
    let email = appleIDCredential.email

    // Get identity token for backend verification
    guard let identityTokenData = appleIDCredential.identityToken,
      let identityToken = String(data: identityTokenData, encoding: .utf8)
    else {
      print("⚠️ Unable to fetch identity token")
      return
    }

    // Authorization code for backend
    guard let authorizationCodeData = appleIDCredential.authorizationCode,
      let authorizationCode = String(data: authorizationCodeData, encoding: .utf8)
    else {
      print("⚠️ Unable to fetch authorization code")
      return
    }

    print("✅ Apple Sign In successful")
    print("   User ID: \(userIdentifier)")
    print("   Name: \(fullName.isEmpty ? "(not shared)" : fullName)")
    print("   Email: \(email ?? "(not shared)")")

    // Store credentials
    DispatchQueue.main.async {
      self.userIdentifier = userIdentifier
      self.fullName = fullName.isEmpty ? nil : fullName
      self.email = email
      self.isSignedIn = true

      // Save to Keychain
      _ = KeychainManager.shared.save(userIdentifier, forKey: .userId)

      // Send to backend for verification if needed
      self.authenticateWithBackend(
        identityToken: identityToken,
        authorizationCode: authorizationCode,
        userIdentifier: userIdentifier,
        fullName: fullName,
        email: email
      )
    }
  }

  func authorizationController(
    controller _: ASAuthorizationController, didCompleteWithError error: Error
  ) {
    print("❌ Apple Sign In error: \(error.localizedDescription)")

    DispatchQueue.main.async {
      self.errorMessage = error.localizedDescription
      self.hasError = true
    }

    // Handle specific errors
    if let authError = error as? ASAuthorizationError {
      // Log the error code for debugging
      print("   ASAuthorizationError code: \(authError.code.rawValue)")

      switch authError.code {
      case .canceled:
        print("   User canceled sign in")
      case .failed:
        print("   Authorization failed")
      case .invalidResponse:
        print("   Invalid response")
      case .notHandled:
        print("   Request not handled")
      case .unknown:
        print("   Unknown error")
      default:
        print("   Other error: \(authError.localizedDescription)")
      }
    }
  }

  // MARK: - Backend Authentication

  private func authenticateWithBackend(
    identityToken _: String,
    authorizationCode _: String,
    userIdentifier _: String,
    fullName _: String?,
    email _: String?
  ) {
    // Send to your backend to:
    // 1. Verify the identity token with Apple
    // 2. Create/update user in your database
    // 3. Return your own auth token

    // For Firebase, you would use:
    // let credential = OAuthProvider.credential(withProviderID: "apple.com", idToken: identityToken, rawNonce: currentNonce)
    // Auth.auth().signIn(with: credential)

    print("🔄 Would authenticate with backend here")
  }
}

// MARK: - Presentation Context Provider

extension SignInWithAppleManager: ASAuthorizationControllerPresentationContextProviding {
  func presentationAnchor(for _: ASAuthorizationController) -> ASPresentationAnchor {
    guard let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
      let window = scene.windows.first
    else {
      fatalError("No window found")
    }
    return window
  }
}

// MARK: - SwiftUI Sign In Button

struct SignInWithAppleButton: View {
  @ObservedObject var manager = SignInWithAppleManager.shared
  var onCompletion: ((Result<String, Error>) -> Void)?

  var body: some View {
    SignInWithAppleButtonView()
      .frame(height: 50)
      .onTapGesture {
        manager.signIn()
      }
      .onChange(of: manager.isSignedIn) { _, isSignedIn in
        if isSignedIn, let userId = manager.userIdentifier {
          onCompletion?(.success(userId))
        }
      }
      .onChange(of: manager.hasError) { _, hasError in
        if hasError, let message = manager.errorMessage {
          onCompletion?(
            .failure(
              NSError(
                domain: "AppleSignIn", code: -1, userInfo: [NSLocalizedDescriptionKey: message])))
          manager.hasError = false  // Reset
        }
      }
  }
}

// MARK: - UIKit Bridge for Sign In Button

struct SignInWithAppleButtonView: UIViewRepresentable {
  func makeUIView(context _: Context) -> ASAuthorizationAppleIDButton {
    let button = ASAuthorizationAppleIDButton(
      authorizationButtonType: .signIn,
      authorizationButtonStyle: .white
    )
    button.cornerRadius = 12
    return button
  }

  func updateUIView(_: ASAuthorizationAppleIDButton, context _: Context) {}
}

// MARK: - Custom Styled Button

struct CustomSignInWithAppleButton: View {
  let action: () -> Void

  var body: some View {
    Button(action: action) {
      HStack(spacing: 12) {
        Image(systemName: "apple.logo")
          .font(.system(size: 20, weight: .medium))

        Text("Sign in with Apple")
          .font(.system(size: 17, weight: .semibold))
      }
      .foregroundColor(.black)
      .frame(maxWidth: .infinity)
      .frame(height: 50)
      .background(Color.white)
      .clipShape(RoundedRectangle(cornerRadius: 12))
    }
  }
}

// MARK: - Credential State Observer

class AppleSignInObserver {
  static func startObserving() {
    NotificationCenter.default.addObserver(
      forName: ASAuthorizationAppleIDProvider.credentialRevokedNotification,
      object: nil,
      queue: .main
    ) { _ in
      print("⚠️ Apple ID credential was revoked")
      SignInWithAppleManager.shared.signOut()
    }
  }
}

// MARK: - Usage Examples

/*

 // 1. In your login view:
 struct LoginView: View {
     var body: some View {
         VStack {
             // Other login options...

             SignInWithAppleButton { result in
                 switch result {
                 case .success(let userId):
                     print("Signed in with user: \(userId)")
                 case .failure(let error):
                     print("Error: \(error)")
                 }
             }
             .padding()
         }
     }
 }

 // 2. Check sign in status:
 if SignInWithAppleManager.shared.isSignedIn {
     // User is signed in
 }

 // 3. Sign out:
 SignInWithAppleManager.shared.signOut()

 // 4. Start observing credential changes (in AppDelegate/App):
 AppleSignInObserver.startObserving()

 // 5. Get user info:
 let name = SignInWithAppleManager.shared.fullName
 let email = SignInWithAppleManager.shared.email

 */
