// BiometricAuth.swift
// Face ID / Touch ID authentication
// Secure access to sensitive features

import LocalAuthentication
import SwiftUI

// MARK: - Biometric Authentication Manager

final class BiometricAuthManager: ObservableObject {
  static let shared = BiometricAuthManager()

  @Published var isAuthenticated: Bool = false
  @Published var biometricType: BiometricType = .none
  @Published var canUseBiometrics: Bool = false

  enum BiometricType {
    case none
    case touchID
    case faceID

    var displayName: String {
      switch self {
      case .none: return "Passcode"
      case .touchID: return "Touch ID"
      case .faceID: return "Face ID"
      }
    }

    var icon: String {
      switch self {
      case .none: return "lock.fill"
      case .touchID: return "touchid"
      case .faceID: return "faceid"
      }
    }
  }

  enum AuthError: Error, LocalizedError {
    case biometricsUnavailable
    case biometricsNotEnrolled
    case authenticationFailed
    case userCancelled
    case systemCancel
    case passcodeNotSet
    case unknown(Error)

    var errorDescription: String? {
      switch self {
      case .biometricsUnavailable:
        return "Biometric authentication is not available on this device"
      case .biometricsNotEnrolled:
        return "No biometric data enrolled. Please set up Face ID or Touch ID in Settings."
      case .authenticationFailed:
        return "Authentication failed. Please try again."
      case .userCancelled:
        return "Authentication was cancelled"
      case .systemCancel:
        return "Authentication was cancelled by the system"
      case .passcodeNotSet:
        return "Please set up a passcode in Settings"
      case .unknown(let error):
        return error.localizedDescription
      }
    }
  }

  private init() {
    checkBiometricAvailability()
  }

  // MARK: - Check Availability

  func checkBiometricAvailability() {
    let context = LAContext()
    var error: NSError?

    canUseBiometrics = context.canEvaluatePolicy(
      .deviceOwnerAuthenticationWithBiometrics, error: &error)

    if canUseBiometrics {
      switch context.biometryType {
      case .none:
        biometricType = .none
      case .touchID:
        biometricType = .touchID
      case .faceID:
        biometricType = .faceID
      case .opticID:
        biometricType = .faceID  // Treat Vision Pro as Face ID equivalent
      @unknown default:
        biometricType = .none
      }
    } else {
      biometricType = .none
    }
  }

  // MARK: - Authenticate

  func authenticate(reason: String = "Authenticate to access Aperture") async -> Result<
    Bool, AuthError
  > {
    let context = LAContext()
    context.localizedCancelTitle = "Use Passcode"
    context.localizedFallbackTitle = "Enter Passcode"

    var error: NSError?

    // Check if biometrics are available
    guard context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) else {
      if let laError = error as? LAError {
        return .failure(mapLAError(laError))
      }
      return .failure(.biometricsUnavailable)
    }

    do {
      let success = try await context.evaluatePolicy(
        .deviceOwnerAuthenticationWithBiometrics,
        localizedReason: reason
      )

      await MainActor.run {
        self.isAuthenticated = success
      }

      return .success(success)

    } catch let error as LAError {
      return .failure(mapLAError(error))
    } catch {
      return .failure(.unknown(error))
    }
  }

  /// Authenticate with fallback to passcode
  func authenticateWithPasscodeFallback(reason: String = "Authenticate to access Aperture") async
    -> Result<Bool, AuthError>
  {
    let context = LAContext()

    var error: NSError?

    guard context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) else {
      return .failure(.passcodeNotSet)
    }

    do {
      let success = try await context.evaluatePolicy(
        .deviceOwnerAuthentication,
        localizedReason: reason
      )

      await MainActor.run {
        self.isAuthenticated = success
      }

      return .success(success)

    } catch let error as LAError {
      return .failure(mapLAError(error))
    } catch {
      return .failure(.unknown(error))
    }
  }

  // MARK: - Helpers

  private func mapLAError(_ error: LAError) -> AuthError {
    switch error.code {
    case .biometryNotAvailable:
      return .biometricsUnavailable
    case .biometryNotEnrolled:
      return .biometricsNotEnrolled
    case .authenticationFailed:
      return .authenticationFailed
    case .userCancel:
      return .userCancelled
    case .systemCancel:
      return .systemCancel
    case .passcodeNotSet:
      return .passcodeNotSet
    default:
      return .unknown(error)
    }
  }

  func logout() {
    isAuthenticated = false
  }
}

// MARK: - SwiftUI Integration

struct BiometricAuthButton: View {
  @StateObject private var authManager = BiometricAuthManager.shared
  let onSuccess: () -> Void
  let onFailure: (BiometricAuthManager.AuthError) -> Void

  var body: some View {
    Button(action: authenticate) {
      HStack(spacing: 12) {
        Image(systemName: authManager.biometricType.icon)
          .font(.system(size: 24))

        Text("Unlock with \(authManager.biometricType.displayName)")
          .font(.system(size: 16, weight: .semibold, design: .rounded))
      }
      .foregroundColor(.white)
      .padding(.horizontal, 24)
      .padding(.vertical, 14)
      .background(
        Capsule()
          .fill(
            LinearGradient(
              colors: [Color.blue, Color.purple],
              startPoint: .leading,
              endPoint: .trailing
            ))
      )
    }
    .accessibilityLabel("Unlock with \(authManager.biometricType.displayName)")
    .accessibilityHint("Double tap to authenticate using biometrics")
  }

  private func authenticate() {
    HapticManager.shared.medium()

    Task {
      let result = await authManager.authenticate()

      await MainActor.run {
        switch result {
        case .success(true):
          HapticManager.shared.success()
          onSuccess()
        case .success(false):
          HapticManager.shared.error()
          onFailure(.authenticationFailed)
        case .failure(let error):
          HapticManager.shared.error()
          onFailure(error)
        }
      }
    }
  }
}

// MARK: - Protected View Wrapper

struct BiometricProtectedView<Content: View>: View {
  @StateObject private var authManager = BiometricAuthManager.shared
  @State private var isShowingAuth = true
  @State private var authError: BiometricAuthManager.AuthError?

  let content: Content

  init(@ViewBuilder content: () -> Content) {
    self.content = content()
  }

  var body: some View {
    ZStack {
      if authManager.isAuthenticated {
        content
      } else {
        lockedView
      }
    }
    .onAppear {
      if !authManager.isAuthenticated {
        authenticateOnAppear()
      }
    }
  }

  private var lockedView: some View {
    VStack(spacing: 32) {
      Image(systemName: "lock.shield.fill")
        .font(.system(size: 64))
        .foregroundColor(.white.opacity(0.7))

      VStack(spacing: 8) {
        Text("Aperture Locked")
          .font(.system(size: 24, weight: .bold, design: .rounded))
          .foregroundColor(.white)

        Text("Authenticate to continue")
          .font(.system(size: 14, weight: .medium, design: .rounded))
          .foregroundColor(.white.opacity(0.7))
      }

      if let error = authError {
        Text(error.localizedDescription)
          .font(.system(size: 12, weight: .medium))
          .foregroundColor(.red)
          .multilineTextAlignment(.center)
          .padding(.horizontal, 32)
      }

      BiometricAuthButton(
        onSuccess: {
          withAnimation(.spring()) {
            isShowingAuth = false
          }
        },
        onFailure: { error in
          authError = error
        }
      )
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color.black)
  }

  private func authenticateOnAppear() {
    Task {
      try? await Task.sleep(nanoseconds: 500_000_000)  // 0.5s delay
      let result = await authManager.authenticate()

      await MainActor.run {
        switch result {
        case .success(true):
          withAnimation(.spring()) {
            isShowingAuth = false
          }
        case .success(false), .failure:
          break  // Show locked view
        }
      }
    }
  }
}

// MARK: - App Lock Settings

class AppLockSettings: ObservableObject {
  static let shared = AppLockSettings()

  @Published var isAppLockEnabled: Bool {
    didSet {
      UserDefaults.standard.set(isAppLockEnabled, forKey: "aperture_app_lock_enabled")
    }
  }

  @Published var lockOnBackground: Bool {
    didSet {
      UserDefaults.standard.set(lockOnBackground, forKey: "aperture_lock_on_background")
    }
  }

  @Published var requireAuthForPremium: Bool {
    didSet {
      UserDefaults.standard.set(requireAuthForPremium, forKey: "aperture_require_auth_premium")
    }
  }

  private init() {
    isAppLockEnabled = UserDefaults.standard.bool(forKey: "aperture_app_lock_enabled")
    lockOnBackground = UserDefaults.standard.bool(forKey: "aperture_lock_on_background")
    requireAuthForPremium = UserDefaults.standard.bool(forKey: "aperture_require_auth_premium")
  }
}
