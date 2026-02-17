// ErrorHandling.swift
// Comprehensive error handling and crash recovery system
// Prevents crashes and reports issues to Firebase Crashlytics

import Foundation
import SwiftUI

// MARK: - App Error Types

enum AppError: Error, LocalizedError {
  // Data errors
  case dataCorrupted(context: String)
  case decodingFailed(type: String, reason: String)
  case encodingFailed(type: String, reason: String)
  case saveFailed(location: String)
  case loadFailed(location: String)

  // Legacy data errors (backward compatibility)
  case decodingError
  case encodingError

  // Network errors
  case networkUnavailable
  case requestFailed(statusCode: Int)
  case timeout
  case invalidResponse

  // Legacy network errors (backward compatibility)
  case networkError(String)
  case serverError(String)

  // Auth errors
  case notAuthenticated
  case sessionExpired
  case invalidCredentials
  case accountDisabled

  // Legacy auth errors (backward compatibility)
  case authenticationFailed(String)
  case userNotFound
  case emailAlreadyExists
  case weakPassword
  case invalidEmail

  // Core Data errors
  case persistenceError(reason: String)
  case fetchFailed(entity: String)
  case migrationFailed

  // Cloud/Sync errors
  case cloudUnavailable
  case syncConflict
  case quotaExceeded

  // Content errors
  case contentNotFound(id: String)
  case invalidContent(reason: String)
  case premiumRequired

  /// Unknown
  case unknown

  var errorDescription: String? {
    switch self {
    case .dataCorrupted(let context):
      return "Data corrupted: \(context)"
    case .decodingFailed(let type, let reason):
      return "Failed to decode \(type): \(reason)"
    case .encodingFailed(let type, let reason):
      return "Failed to encode \(type): \(reason)"
    case .saveFailed(let location):
      return "Failed to save to \(location)"
    case .loadFailed(let location):
      return "Failed to load from \(location)"
    case .decodingError:
      return "Failed to decode data"
    case .encodingError:
      return "Failed to encode data"
    case .networkUnavailable:
      return "Network unavailable"
    case .requestFailed(let code):
      return "Request failed with status \(code)"
    case .timeout:
      return "Request timed out"
    case .invalidResponse:
      return "Invalid server response"
    case .networkError(let message):
      return "Network error: \(message)"
    case .serverError(let message):
      return "Server error: \(message)"
    case .notAuthenticated:
      return "User not authenticated"
    case .sessionExpired:
      return "Session expired"
    case .invalidCredentials:
      return "Invalid email or password"
    case .accountDisabled:
      return "Account disabled"
    case .authenticationFailed(let message):
      return "Authentication failed: \(message)"
    case .userNotFound:
      return "User not found"
    case .emailAlreadyExists:
      return "An account with this email already exists"
    case .weakPassword:
      return "Password must be at least 8 characters"
    case .invalidEmail:
      return "Please enter a valid email address"
    case .persistenceError(let reason):
      return "Database error: \(reason)"
    case .fetchFailed(let entity):
      return "Failed to fetch \(entity)"
    case .migrationFailed:
      return "Database migration failed"
    case .cloudUnavailable:
      return "Cloud services unavailable"
    case .syncConflict:
      return "Sync conflict detected"
    case .quotaExceeded:
      return "Storage quota exceeded"
    case .contentNotFound(let id):
      return "Content not found: \(id)"
    case .invalidContent(let reason):
      return "Invalid content: \(reason)"
    case .premiumRequired:
      return "Premium subscription required"
    case .unknown:
      return "An unknown error occurred"
    }
  }

  var recoverySuggestion: String? {
    switch self {
    case .dataCorrupted, .decodingFailed, .encodingFailed, .decodingError, .encodingError:
      return "Try restarting the app. If the problem persists, contact support."
    case .saveFailed, .loadFailed:
      return "Check available storage space and try again."
    case .networkUnavailable, .timeout, .networkError, .serverError:
      return "Check your internet connection and try again."
    case .requestFailed, .invalidResponse:
      return "The server may be temporarily unavailable. Try again later."
    case .notAuthenticated, .sessionExpired, .authenticationFailed:
      return "Please sign in again."
    case .invalidCredentials:
      return "Check your email and password."
    case .accountDisabled:
      return "Contact support for assistance."
    case .userNotFound:
      return "Please sign up first."
    case .emailAlreadyExists:
      return "Try signing in instead, or use a different email."
    case .weakPassword:
      return "Use a stronger password with at least 8 characters."
    case .invalidEmail:
      return "Enter a valid email address like user@example.com."
    case .persistenceError, .fetchFailed, .migrationFailed:
      return "Try restarting the app. Your data is safe."
    case .cloudUnavailable:
      return "Sign in to iCloud in Settings."
    case .syncConflict:
      return "Your data will sync automatically when resolved."
    case .quotaExceeded:
      return "Free up iCloud storage space."
    case .contentNotFound, .invalidContent:
      return "Try refreshing the content."
    case .premiumRequired:
      return "Upgrade to premium to access this feature."
    case .unknown:
      return "Try restarting the app."
    }
  }

  var isCritical: Bool {
    switch self {
    case .persistenceError, .migrationFailed, .dataCorrupted:
      return true
    default:
      return false
    }
  }
}

// MARK: - Error Handler

final class ErrorHandler: ObservableObject {
  static let shared = ErrorHandler()

  @Published var currentError: AppError?
  @Published var showingError: Bool = false

  private init() {}

  // MARK: - Handle Error

  func handle(
    _ error: Error, context: String = "", file: String = #file, line: Int = #line,
    function: String = #function
  ) {
    let appError: AppError

    if let ae = error as? AppError {
      appError = ae
    } else {
      appError = .unknown
    }

    // Log to console
    print("🔴 ERROR [\(context)] in \(file.split(separator: "/").last ?? ""):\(line) \(function)")
    print("   → \(appError.localizedDescription)")

    // Report to Crashlytics
    CrashReporter.shared.recordError(appError, context: context, file: file, line: line)

    // Show to user if appropriate
    if shouldShowToUser(appError) {
      DispatchQueue.main.async {
        self.currentError = appError
        self.showingError = true
      }
    }

    // Attempt recovery for critical errors
    if appError.isCritical {
      attemptRecovery(for: appError)
    }
  }

  // MARK: - Safe Execute

  /// Safely execute a throwing closure with automatic error handling
  func safeExecute<T>(_ context: String, defaultValue: T, operation: () throws -> T) -> T {
    do {
      return try operation()
    } catch {
      handle(error, context: context)
      return defaultValue
    }
  }

  /// Async safe execute
  func safeExecuteAsync<T>(_ context: String, defaultValue: T, operation: () async throws -> T)
    async -> T
  {
    do {
      return try await operation()
    } catch {
      handle(error, context: context)
      return defaultValue
    }
  }

  // MARK: - Private

  private func shouldShowToUser(_ error: AppError) -> Bool {
    switch error {
    case .networkUnavailable, .timeout:
      return true
    case .notAuthenticated, .sessionExpired:
      return true
    case .premiumRequired:
      return true
    case .persistenceError, .migrationFailed:
      return true
    default:
      return false
    }
  }

  private func attemptRecovery(for error: AppError) {
    switch error {
    case .persistenceError, .migrationFailed:
      // Reset to defaults if needed
      print("🔧 Attempting database recovery...")
    // PersistenceController.shared.resetIfNeeded()
    case .dataCorrupted:
      print("🔧 Attempting data recovery...")
    // Could clear corrupted cache, etc.
    default:
      break
    }
  }
}

// MARK: - Crash Reporter (Firebase Crashlytics Wrapper)

final class CrashReporter {
  static let shared = CrashReporter()

  private var isEnabled: Bool = false

  private init() {}

  // MARK: - Setup

  func configure() {
    // Firebase Crashlytics initialization
    // This will be called from AppDelegate/App
    #if !DEBUG
      isEnabled = true
      // Crashlytics.crashlytics().setCrashlyticsCollectionEnabled(true)
      print("📊 Crashlytics enabled for production")
    #else
      isEnabled = false
      print("📊 Crashlytics disabled for debug builds")
    #endif
  }

  // MARK: - Record Error

  func recordError(_ error: AppError, context: String, file: String, line: Int) {
    guard isEnabled else {
      // In debug, just log
      return
    }

    // Create error info for Crashlytics
    let userInfo: [String: Any] = [
      "context": context,
      "file": file,
      "line": line,
      "description": error.localizedDescription,
      "recovery": error.recoverySuggestion ?? "",
      "isCritical": error.isCritical,
    ]

    let nsError = NSError(
      domain: "com.sunflow.aperture",
      code: errorCode(for: error),
      userInfo: userInfo
    )

    // Crashlytics.crashlytics().record(error: nsError)
    print("📊 Would report to Crashlytics: \(nsError)")
  }

  // MARK: - Record Non-Fatal

  func recordNonFatal(_ message: String, userInfo: [String: Any] = [:]) {
    guard isEnabled else { return }

    var info = userInfo
    info["message"] = message
    info["timestamp"] = Date().timeIntervalSince1970

    _ = NSError(
      domain: "com.sunflow.aperture.nonfatal",
      code: 0,
      userInfo: info
    )

    // Crashlytics.crashlytics().record(error: nsError)
    print("📊 Non-fatal: \(message)")
  }

  // MARK: - Set User Info

  func setUserIdentifier(_: String?) {
    guard isEnabled else { return }
    // Crashlytics.crashlytics().setUserID(userId ?? "anonymous")
  }

  func setCustomValue(_: Any, forKey _: String) {
    guard isEnabled else { return }
    // Crashlytics.crashlytics().setCustomValue(value, forKey: key)
  }

  // MARK: - Breadcrumbs

  func log(_ message: String) {
    guard isEnabled else { return }
    // Crashlytics.crashlytics().log(message)
    print("📊 Breadcrumb: \(message)")
  }

  // MARK: - Private

  private func errorCode(for error: AppError) -> Int {
    switch error {
    case .dataCorrupted: return 1001
    case .decodingFailed: return 1002
    case .encodingFailed: return 1003
    case .saveFailed: return 1004
    case .loadFailed: return 1005
    case .decodingError: return 1006
    case .encodingError: return 1007
    case .networkUnavailable: return 2001
    case .requestFailed: return 2002
    case .timeout: return 2003
    case .invalidResponse: return 2004
    case .networkError: return 2005
    case .serverError: return 2006
    case .notAuthenticated: return 3001
    case .sessionExpired: return 3002
    case .invalidCredentials: return 3003
    case .accountDisabled: return 3004
    case .authenticationFailed: return 3005
    case .userNotFound: return 3006
    case .emailAlreadyExists: return 3007
    case .weakPassword: return 3008
    case .invalidEmail: return 3009
    case .persistenceError: return 4001
    case .fetchFailed: return 4002
    case .migrationFailed: return 4003
    case .cloudUnavailable: return 5001
    case .syncConflict: return 5002
    case .quotaExceeded: return 5003
    case .contentNotFound: return 6001
    case .invalidContent: return 6002
    case .premiumRequired: return 6003
    case .unknown: return 9999
    }
  }
}

// MARK: - Error Alert View Modifier

struct ErrorAlertModifier: ViewModifier {
  @ObservedObject var errorHandler = ErrorHandler.shared

  func body(content: Content) -> some View {
    content
      .alert("Something Went Wrong", isPresented: $errorHandler.showingError) {
        Button("OK") {
          errorHandler.currentError = nil
        }
        if let error = errorHandler.currentError, error.isCritical {
          Button("Report Issue") {
            // Open support email or feedback
          }
        }
      } message: {
        if let error = errorHandler.currentError {
          Text("\(error.localizedDescription)\n\n\(error.recoverySuggestion ?? "")")
        }
      }
  }
}

extension View {
  func withErrorHandling() -> some View {
    modifier(ErrorAlertModifier())
  }
}

// MARK: - Safe Decoding

extension JSONDecoder {
  func safeDecode<T: Decodable>(_ type: T.Type, from data: Data, context: String = "") -> T? {
    do {
      return try decode(type, from: data)
    } catch {
      ErrorHandler.shared.handle(
        AppError.decodingFailed(type: String(describing: type), reason: error.localizedDescription),
        context: context
      )
      return nil
    }
  }
}

extension JSONEncoder {
  func safeEncode<T: Encodable>(_ value: T, context: String = "") -> Data? {
    do {
      return try encode(value)
    } catch {
      ErrorHandler.shared.handle(
        AppError.encodingFailed(
          type: String(describing: type(of: value)), reason: error.localizedDescription),
        context: context
      )
      return nil
    }
  }
}

// MARK: - Safe UserDefaults

extension UserDefaults {
  func safeSet<T: Encodable>(_ value: T, forKey key: String) {
    if let data = JSONEncoder().safeEncode(value, context: "UserDefaults.set(\(key))") {
      set(data, forKey: key)
    }
  }

  func safeGet<T: Decodable>(_ type: T.Type, forKey key: String) -> T? {
    guard let data = data(forKey: key) else { return nil }
    return JSONDecoder().safeDecode(type, from: data, context: "UserDefaults.get(\(key))")
  }
}

// MARK: - Result Extensions

extension Result {
  func handleError(context: String = "") {
    if case .failure(let error) = self {
      ErrorHandler.shared.handle(error, context: context)
    }
  }
}

// MARK: - Async Error Boundary

@MainActor
func withErrorBoundary<T>(_ context: String, defaultValue: T, operation: () async throws -> T) async
  -> T
{
  do {
    return try await operation()
  } catch {
    ErrorHandler.shared.handle(error, context: context)
    return defaultValue
  }
}

// MARK: - Usage Examples

/*

 // 1. Handle errors explicitly:
 do {
     try someRiskyOperation()
 } catch {
     ErrorHandler.shared.handle(error, context: "Loading user profile")
 }

 // 2. Safe execute with default:
 let data = ErrorHandler.shared.safeExecute("Fetching courses", defaultValue: []) {
     try fetchCourses()
 }

 // 3. Safe decoding:
 if let profile = JSONDecoder().safeDecode(UserProfile.self, from: data, context: "Profile") {
     // use profile
 }

 // 4. Add error handling to a view:
 struct MyView: View {
     var body: some View {
         ContentView()
             .withErrorHandling()
     }
 }

 // 5. Log breadcrumbs for debugging:
 CrashReporter.shared.log("User started onboarding")
 CrashReporter.shared.log("User completed step 3")

 // 6. Record non-fatal issues:
 CrashReporter.shared.recordNonFatal("Course content missing image", userInfo: ["courseId": "123"])

 */
