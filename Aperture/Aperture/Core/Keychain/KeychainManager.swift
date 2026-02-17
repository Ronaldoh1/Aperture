// KeychainManager.swift
// Secure storage for sensitive data
// Tokens, credentials, and user secrets

import Foundation
import Security

// MARK: - Keychain Manager

final class KeychainManager {
  static let shared = KeychainManager()

  private let service = "com.sunflow.aperture"

  private init() {}

  // MARK: - Public Interface

  /// Save string to Keychain
  func save(_ value: String, forKey key: KeychainKey) -> Bool {
    guard let data = value.data(using: .utf8) else {
      return false
    }
    return save(data, forKey: key)
  }

  /// Save data to Keychain
  func save(_ data: Data, forKey key: KeychainKey) -> Bool {
    // Delete any existing item
    delete(key: key)

    let query: [String: Any] = [
      kSecClass as String: kSecClassGenericPassword,
      kSecAttrService as String: service,
      kSecAttrAccount as String: key.rawValue,
      kSecValueData as String: data,
      kSecAttrAccessible as String: key.accessibility.secAccessibility,
    ]

    let status = SecItemAdd(query as CFDictionary, nil)

    if status != errSecSuccess {
      print("🔐 Keychain save failed for \(key.rawValue): \(status)")
    }

    return status == errSecSuccess
  }

  /// Retrieve string from Keychain
  func getString(forKey key: KeychainKey) -> String? {
    guard let data = getData(forKey: key) else {
      return nil
    }
    return String(data: data, encoding: .utf8)
  }

  /// Retrieve data from Keychain
  func getData(forKey key: KeychainKey) -> Data? {
    let query: [String: Any] = [
      kSecClass as String: kSecClassGenericPassword,
      kSecAttrService as String: service,
      kSecAttrAccount as String: key.rawValue,
      kSecReturnData as String: true,
      kSecMatchLimit as String: kSecMatchLimitOne,
    ]

    var result: AnyObject?
    let status = SecItemCopyMatching(query as CFDictionary, &result)

    guard status == errSecSuccess else {
      return nil
    }

    return result as? Data
  }

  /// Delete item from Keychain
  @discardableResult
  func delete(key: KeychainKey) -> Bool {
    let query: [String: Any] = [
      kSecClass as String: kSecClassGenericPassword,
      kSecAttrService as String: service,
      kSecAttrAccount as String: key.rawValue,
    ]

    let status = SecItemDelete(query as CFDictionary)
    return status == errSecSuccess || status == errSecItemNotFound
  }

  /// Delete all items for this app
  func deleteAll() {
    KeychainKey.allCases.forEach { delete(key: $0) }
  }

  /// Check if key exists
  func exists(key: KeychainKey) -> Bool {
    return getData(forKey: key) != nil
  }

  // MARK: - Codable Support

  /// Save Codable object to Keychain
  func saveCodable<T: Codable>(_ object: T, forKey key: KeychainKey) -> Bool {
    guard let data = try? JSONEncoder().encode(object) else {
      return false
    }
    return save(data, forKey: key)
  }

  /// Retrieve Codable object from Keychain
  func getCodable<T: Codable>(_ type: T.Type, forKey key: KeychainKey) -> T? {
    guard let data = getData(forKey: key) else {
      return nil
    }
    return try? JSONDecoder().decode(type, from: data)
  }
}

// MARK: - Keychain Keys

enum KeychainKey: String, CaseIterable {
  // Authentication
  case authToken = "auth_token"
  case refreshToken = "refresh_token"
  case userId = "user_id"

  // User Secrets
  case biometricEnabled = "biometric_enabled"
  case pinCode = "pin_code"

  /// API Keys (if needed)
  case apiKey = "api_key"

  /// Session
  case sessionData = "session_data"

  /// Accessibility level for this key
  var accessibility: KeychainAccessibility {
    switch self {
    case .authToken, .refreshToken, .sessionData:
      // Available after first unlock, persists across reboots
      return .afterFirstUnlock
    case .biometricEnabled, .pinCode:
      // Only when device is unlocked
      return .whenUnlocked
    case .userId, .apiKey:
      // Available after first unlock
      return .afterFirstUnlock
    }
  }
}

// MARK: - Keychain Accessibility

enum KeychainAccessibility {
  case whenUnlocked
  case afterFirstUnlock
  case whenPasscodeSetThisDeviceOnly
  case whenUnlockedThisDeviceOnly
  case afterFirstUnlockThisDeviceOnly

  var secAccessibility: CFString {
    switch self {
    case .whenUnlocked:
      return kSecAttrAccessibleWhenUnlocked
    case .afterFirstUnlock:
      return kSecAttrAccessibleAfterFirstUnlock
    case .whenPasscodeSetThisDeviceOnly:
      return kSecAttrAccessibleWhenPasscodeSetThisDeviceOnly
    case .whenUnlockedThisDeviceOnly:
      return kSecAttrAccessibleWhenUnlockedThisDeviceOnly
    case .afterFirstUnlockThisDeviceOnly:
      return kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly
    }
  }
}

// MARK: - Secure Session Manager

struct SecureSession: Codable {
  let userId: String
  let authToken: String
  let refreshToken: String?
  let expiresAt: Date?
  let createdAt: Date

  var isExpired: Bool {
    guard let expiresAt = expiresAt else { return false }
    return Date() > expiresAt
  }
}

extension KeychainManager {
  /// Save user session securely
  func saveSession(_ session: SecureSession) -> Bool {
    return saveCodable(session, forKey: .sessionData)
  }

  /// Get current session
  func getSession() -> SecureSession? {
    return getCodable(SecureSession.self, forKey: .sessionData)
  }

  /// Clear session (logout)
  func clearSession() {
    delete(key: .sessionData)
    delete(key: .authToken)
    delete(key: .refreshToken)
    delete(key: .userId)
  }

  /// Quick auth token access
  var authToken: String? {
    get { getString(forKey: .authToken) }
    set {
      if let token = newValue {
        _ = save(token, forKey: .authToken)
      } else {
        delete(key: .authToken)
      }
    }
  }
}

// MARK: - iCloud Keychain (Optional)

extension KeychainManager {
  /// Save to iCloud Keychain (syncs across devices)
  func saveToiCloud(_ value: String, forKey key: String) -> Bool {
    guard let data = value.data(using: .utf8) else { return false }

    let query: [String: Any] = [
      kSecClass as String: kSecClassGenericPassword,
      kSecAttrService as String: service,
      kSecAttrAccount as String: key,
      kSecValueData as String: data,
      kSecAttrSynchronizable as String: true,  // Enable iCloud sync
    ]

    SecItemDelete(query as CFDictionary)
    let status = SecItemAdd(query as CFDictionary, nil)
    return status == errSecSuccess
  }

  /// Retrieve from iCloud Keychain
  func getFromiCloud(forKey key: String) -> String? {
    let query: [String: Any] = [
      kSecClass as String: kSecClassGenericPassword,
      kSecAttrService as String: service,
      kSecAttrAccount as String: key,
      kSecReturnData as String: true,
      kSecMatchLimit as String: kSecMatchLimitOne,
      kSecAttrSynchronizable as String: true,
    ]

    var result: AnyObject?
    let status = SecItemCopyMatching(query as CFDictionary, &result)

    guard status == errSecSuccess, let data = result as? Data else {
      return nil
    }

    return String(data: data, encoding: .utf8)
  }
}

// MARK: - Usage Examples

/*

 // 1. Save auth token
 KeychainManager.shared.save("your_token_here", forKey: .authToken)

 // 2. Get auth token
 if let token = KeychainManager.shared.getString(forKey: .authToken) {
     // Use token
 }

 // 3. Save session
 let session = SecureSession(
     userId: "123",
     authToken: "token",
     refreshToken: "refresh",
     expiresAt: Date().addingTimeInterval(3600),
     createdAt: Date()
 )
 KeychainManager.shared.saveSession(session)

 // 4. Check if logged in
 if let session = KeychainManager.shared.getSession(), !session.isExpired {
     // User is logged in
 }

 // 5. Logout
 KeychainManager.shared.clearSession()

 // 6. Quick token access
 KeychainManager.shared.authToken = "new_token"
 let token = KeychainManager.shared.authToken

 */
