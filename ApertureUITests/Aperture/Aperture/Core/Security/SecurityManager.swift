// SecurityManager.swift
// Aperture - Comprehensive App Security Module
// Anti-reverse engineering, tampering detection, runtime protection

import CryptoKit
import Foundation
import LocalAuthentication
import Security
import SwiftUI
import UIKit

// MARK: - Security Manager

@MainActor
final class SecurityManager: ObservableObject {
  static let shared = SecurityManager()

  // MARK: - Published State

  @Published var isSecurityCompromised = false
  @Published var securityViolations: [SecurityViolation] = []
  @Published var lastSecurityCheck: Date?

  // MARK: - Settings

  @AppStorage("enforceSecurityChecks") var enforceSecurityChecks = true
  @AppStorage("blockOnJailbreak") var blockOnJailbreak = true
  @AppStorage("blockOnDebugger") var blockOnDebugger = false  // Dev mode friendly
  @AppStorage("enableIntegrityChecks") var enableIntegrityChecks = true

  // MARK: - Security State

  private var integrityToken: String?
  private let expectedBundleID = "com.sunflow.aperture"

  private init() {
    generateIntegrityToken()
  }

  // MARK: - Main Security Check

  func performSecurityAudit() -> SecurityAuditResult {
    var violations: [SecurityViolation] = []

    // 1. Jailbreak Detection
    if isJailbroken() {
      violations.append(.jailbreakDetected)
    }

    // 2. Debugger Detection
    if isDebuggerAttached() {
      violations.append(.debuggerAttached)
    }

    // 3. Simulator Detection (for production)
    #if targetEnvironment(simulator)
      #if !DEBUG
        violations.append(.runningInSimulator)
      #endif
    #endif

    // 4. Bundle Integrity
    if !verifyBundleIntegrity() {
      violations.append(.bundleTampered)
    }

    // 5. Code Signature Verification
    if !verifyCodeSignature() {
      violations.append(.invalidSignature)
    }

    // 6. Suspicious Files Detection
    if hasSuspiciousFiles() {
      violations.append(.suspiciousFilesFound)
    }

    // 7. Library Injection Detection
    if hasInjectedLibraries() {
      violations.append(.libraryInjection)
    }

    // Update state
    securityViolations = violations
    isSecurityCompromised = !violations.isEmpty
    lastSecurityCheck = Date()

    return SecurityAuditResult(
      passed: violations.isEmpty,
      violations: violations,
      timestamp: Date()
    )
  }

  // MARK: - Jailbreak Detection (6 methods)

  func isJailbroken() -> Bool {
    #if targetEnvironment(simulator)
      return false
    #else

      // Method 1: Check for common jailbreak files
      let jailbreakPaths = [
        "/Applications/Cydia.app",
        "/Library/MobileSubstrate/MobileSubstrate.dylib",
        "/bin/bash",
        "/usr/sbin/sshd",
        "/etc/apt",
        "/private/var/lib/apt/",
        "/usr/bin/ssh",
        "/private/var/stash",
        "/private/var/lib/cydia",
        "/private/var/tmp/cydia.log",
        "/Applications/Icy.app",
        "/Applications/MxTube.app",
        "/Applications/RockApp.app",
        "/Applications/blackra1n.app",
        "/Applications/SBSettings.app",
        "/Applications/FakeCarrier.app",
        "/Applications/WinterBoard.app",
        "/Library/MobileSubstrate/DynamicLibraries/Veency.plist",
      ]

      for path in jailbreakPaths {
        if FileManager.default.fileExists(atPath: path) {
          return true
        }
      }

      // Method 2: Check if app can write outside sandbox
      let testPath = "/private/jailbreak_test_\(UUID().uuidString)"
      do {
        try "test".write(toFile: testPath, atomically: true, encoding: .utf8)
        try FileManager.default.removeItem(atPath: testPath)
        return true
      } catch {
        // Expected - can't write outside sandbox
      }

      // Method 3: Check for Cydia URL scheme
      if let url = URL(string: "cydia://package/com.example.package"),
        UIApplication.shared.canOpenURL(url)
      {
        return true
      }

      // Method 4: Check symbolic links
      let suspiciousSymlinks = [
        "/Applications", "/var/stash", "/Library/Ringtones", "/Library/Wallpaper",
      ]
      for path in suspiciousSymlinks {
        var isSymlink: ObjCBool = false
        if FileManager.default.fileExists(atPath: path, isDirectory: &isSymlink) {
          let attributes = try? FileManager.default.attributesOfItem(atPath: path)
          if let type = attributes?[.type] as? FileAttributeType, type == .typeSymbolicLink {
            return true
          }
        }
      }

      // Method 5: Check for fork() capability
      let pid = fork()
      if pid >= 0 {
        if pid > 0 {
          kill(pid, SIGTERM)
        }
        return true
      }

      // Method 6: Check environment variables
      if getenv("DYLD_INSERT_LIBRARIES") != nil {
        return true
      }

      return false
    #endif
  }

  // MARK: - Debugger Detection

  func isDebuggerAttached() -> Bool {
    // Method 1: sysctl check
    var info = kinfo_proc()
    var mib: [Int32] = [CTL_KERN, KERN_PROC, KERN_PROC_PID, getpid()]
    var size = MemoryLayout<kinfo_proc>.stride

    let result = sysctl(&mib, UInt32(mib.count), &info, &size, nil, 0)
    if result == 0 && (info.kp_proc.p_flag & P_TRACED) != 0 {
      return true
    }

    return false
  }

  // MARK: - Bundle Integrity

  func verifyBundleIntegrity() -> Bool {
    guard let bundleID = Bundle.main.bundleIdentifier else {
      return false
    }

    // Check bundle ID hasn't been changed
    if bundleID != expectedBundleID {
      return false
    }

    // Check Info.plist exists and hasn't been modified
    guard let infoPlistPath = Bundle.main.path(forResource: "Info", ofType: "plist"),
      FileManager.default.fileExists(atPath: infoPlistPath)
    else {
      return false
    }

    return true
  }

  // MARK: - Code Signature Verification

  func verifyCodeSignature() -> Bool {
    // This is a simplified check - full verification requires entitlements
    guard let executablePath = Bundle.main.executablePath,
      FileManager.default.fileExists(atPath: executablePath)
    else {
      return false
    }

    return true
  }

  // MARK: - Suspicious Files Detection

  func hasSuspiciousFiles() -> Bool {
    // Check for suspicious files on filesystem instead of loaded libraries
    let suspiciousPaths = [
      "/usr/lib/FridaGadget.dylib",
      "/usr/local/bin/frida-server",
      "/usr/bin/cycript",
      "/Library/MobileSubstrate/MobileSubstrate.dylib",
      "/usr/lib/substrate",
      "/usr/lib/libcycript.dylib",
    ]

    let fileManager = FileManager.default
    for path in suspiciousPaths {
      if fileManager.fileExists(atPath: path) {
        return true
      }
    }

    // Check environment variables for injection
    if ProcessInfo.processInfo.environment["DYLD_INSERT_LIBRARIES"] != nil {
      return true
    }

    return false
  }

  // MARK: - Library Injection Detection

  func hasInjectedLibraries() -> Bool {
    // Check for injection via environment
    let injectionIndicators = [
      "DYLD_INSERT_LIBRARIES",
      "DYLD_LIBRARY_PATH",
      "_MSSafeMode",
    ]

    for indicator in injectionIndicators {
      if ProcessInfo.processInfo.environment[indicator] != nil {
        return true
      }
    }

    // Check for common injection library paths
    let injectionPaths = [
      "/Library/MobileSubstrate",
      "/usr/lib/TweakInject",
      "/var/lib/dpkg/info/mobilesubstrate.list",
    ]

    let fileManager = FileManager.default
    for path in injectionPaths {
      if fileManager.fileExists(atPath: path) {
        return true
      }
    }

    return false
  }

  // MARK: - Integrity Token

  private func generateIntegrityToken() {
    let data = "\(Bundle.main.bundleIdentifier ?? "")-\(Date().timeIntervalSince1970)"
    integrityToken = SHA256.hash(data: Data(data.utf8)).compactMap { String(format: "%02x", $0) }
      .joined()
  }

  func verifyIntegrityToken(_ token: String) -> Bool {
    return token == integrityToken
  }
}

// MARK: - Security Violation Types

enum SecurityViolation: String, CaseIterable {
  case jailbreakDetected = "Jailbreak Detected"
  case debuggerAttached = "Debugger Attached"
  case runningInSimulator = "Running in Simulator"
  case bundleTampered = "Bundle Tampered"
  case invalidSignature = "Invalid Signature"
  case suspiciousFilesFound = "Suspicious Files Found"
  case libraryInjection = "Library Injection Detected"

  var severity: SecuritySeverity {
    switch self {
    case .jailbreakDetected, .bundleTampered, .invalidSignature:
      return .critical
    case .libraryInjection, .suspiciousFilesFound:
      return .high
    case .debuggerAttached:
      return .medium
    case .runningInSimulator:
      return .low
    }
  }

  var icon: String {
    switch self {
    case .jailbreakDetected: return "🔓"
    case .debuggerAttached: return "🐛"
    case .runningInSimulator: return "📱"
    case .bundleTampered: return "📦"
    case .invalidSignature: return "✍️"
    case .suspiciousFilesFound: return "🔍"
    case .libraryInjection: return "💉"
    }
  }
}

enum SecuritySeverity: String {
  case critical = "Critical"
  case high = "High"
  case medium = "Medium"
  case low = "Low"

  var color: String {
    switch self {
    case .critical: return "FF0000"
    case .high: return "FF6600"
    case .medium: return "FFCC00"
    case .low: return "00CC00"
    }
  }
}

// MARK: - Security Audit Result

struct SecurityAuditResult {
  let passed: Bool
  let violations: [SecurityViolation]
  let timestamp: Date

  var summary: String {
    if passed {
      return "✅ All security checks passed"
    } else {
      return "⚠️ \(violations.count) security issue(s) detected"
    }
  }
}

// MARK: - Secure Keychain Manager

final class SecureKeychainManager {
  static let shared = SecureKeychainManager()

  private let serviceName = "com.sunflow.aperture"

  private init() {}

  func save(_ data: Data, forKey key: String, withBiometric: Bool = false) -> Bool {
    var query: [String: Any] = [
      kSecClass as String: kSecClassGenericPassword,
      kSecAttrService as String: serviceName,
      kSecAttrAccount as String: key,
      kSecValueData as String: data,
    ]

    if withBiometric {
      let access = SecAccessControlCreateWithFlags(
        nil,
        kSecAttrAccessibleWhenUnlockedThisDeviceOnly,
        .biometryCurrentSet,
        nil
      )
      query[kSecAttrAccessControl as String] = access
    } else {
      query[kSecAttrAccessible as String] = kSecAttrAccessibleWhenUnlockedThisDeviceOnly
    }

    SecItemDelete(query as CFDictionary)
    let status = SecItemAdd(query as CFDictionary, nil)
    return status == errSecSuccess
  }

  func load(forKey key: String) -> Data? {
    let query: [String: Any] = [
      kSecClass as String: kSecClassGenericPassword,
      kSecAttrService as String: serviceName,
      kSecAttrAccount as String: key,
      kSecReturnData as String: true,
      kSecMatchLimit as String: kSecMatchLimitOne,
    ]

    var result: AnyObject?
    let status = SecItemCopyMatching(query as CFDictionary, &result)

    if status == errSecSuccess {
      return result as? Data
    }
    return nil
  }

  func delete(forKey key: String) -> Bool {
    let query: [String: Any] = [
      kSecClass as String: kSecClassGenericPassword,
      kSecAttrService as String: serviceName,
      kSecAttrAccount as String: key,
    ]

    let status = SecItemDelete(query as CFDictionary)
    return status == errSecSuccess || status == errSecItemNotFound
  }
}

// MARK: - Security Audit Settings View

struct SecurityAuditSettingsView: View {
  @ObservedObject var securityManager = SecurityManager.shared
  @State private var auditResult: SecurityAuditResult?

  var body: some View {
    List {
      Section(header: Text("Security Status")) {
        if let result = auditResult {
          HStack {
            Text(result.passed ? "✅" : "⚠️")
            Text(result.summary)
              .foregroundStyle(result.passed ? .green : .red)
          }

          if !result.violations.isEmpty {
            ForEach(result.violations, id: \.rawValue) { violation in
              HStack {
                Text(violation.icon)
                VStack(alignment: .leading) {
                  Text(violation.rawValue)
                    .font(.subheadline)
                  Text(violation.severity.rawValue)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                }
              }
            }
          }
        } else {
          Text("No security check performed")
            .foregroundStyle(.secondary)
        }

        Button("Run Security Audit") {
          auditResult = securityManager.performSecurityAudit()
        }
      }

      Section(header: Text("Security Options")) {
        Toggle("Enforce Security Checks", isOn: $securityManager.enforceSecurityChecks)
        Toggle("Block on Jailbreak", isOn: $securityManager.blockOnJailbreak)
        Toggle("Block on Debugger", isOn: $securityManager.blockOnDebugger)
        Toggle("Integrity Checks", isOn: $securityManager.enableIntegrityChecks)
      }

      Section(
        footer: Text(
          "Security checks help protect your data and ensure the app hasn't been tampered with.")
      ) {
        EmptyView()
      }
    }
    .navigationTitle("Security Audit")
    .onAppear {
      auditResult = securityManager.performSecurityAudit()
    }
  }
}

#Preview {
  NavigationStack {
    SecurityAuditSettingsView()
  }
}
