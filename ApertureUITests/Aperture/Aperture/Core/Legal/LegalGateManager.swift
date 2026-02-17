// LegalGateManager.swift
// Manages age verification and terms acceptance
// Must be completed before accessing app content

import Combine
import SwiftUI

// MARK: - Legal Consent Record

struct LegalConsent: Codable {
  var ageVerified: Bool
  var dateOfBirth: Date?
  var termsAccepted: Bool
  var termsVersion: String
  var privacyAccepted: Bool
  var privacyVersion: String
  var consentTimestamp: Date?
  var deviceId: String?

  static let empty = LegalConsent(
    ageVerified: false,
    dateOfBirth: nil,
    termsAccepted: false,
    termsVersion: "",
    privacyAccepted: false,
    privacyVersion: "",
    consentTimestamp: nil,
    deviceId: nil
  )

  var isComplete: Bool {
    ageVerified && termsAccepted && privacyAccepted
  }

  var calculatedAge: Int? {
    guard let dob = dateOfBirth else { return nil }
    let calendar = Calendar.current
    let now = Date()
    let ageComponents = calendar.dateComponents([.year], from: dob, to: now)
    return ageComponents.year
  }
}

// MARK: - Legal Gate Manager

@MainActor
class LegalGateManager: ObservableObject {
  static let shared = LegalGateManager()

  // Current versions - update these when legal docs change
  static let currentTermsVersion = "1.0.0"
  static let currentPrivacyVersion = "1.0.0"
  static let minimumAge = 18

  @Published private(set) var consent: LegalConsent = .empty
  @Published var showLegalGate: Bool = true

  private let storageKey = "aperture_legal_consent"

  init() {
    loadConsent()
    checkConsentValidity()
  }

  // MARK: - Public Methods

  func verifyAge(dateOfBirth: Date) -> Bool {
    let calendar = Calendar.current
    let now = Date()
    let ageComponents = calendar.dateComponents([.year], from: dateOfBirth, to: now)

    guard let age = ageComponents.year, age >= Self.minimumAge else {
      return false
    }

    consent.dateOfBirth = dateOfBirth
    consent.ageVerified = true
    saveConsent()
    return true
  }

  func acceptTerms() {
    consent.termsAccepted = true
    consent.termsVersion = Self.currentTermsVersion
    saveConsent()
  }

  func acceptPrivacy() {
    consent.privacyAccepted = true
    consent.privacyVersion = Self.currentPrivacyVersion
    saveConsent()
  }

  func completeConsent() {
    consent.consentTimestamp = Date()
    consent.deviceId = UIDevice.current.identifierForVendor?.uuidString
    saveConsent()

    if consent.isComplete {
      withAnimation(.easeInOut(duration: 0.3)) {
        showLegalGate = false
      }
    }
  }

  func resetConsent() {
    consent = .empty
    UserDefaults.standard.removeObject(forKey: storageKey)
    showLegalGate = true
  }

  // MARK: - Private Methods

  private func loadConsent() {
    guard let data = UserDefaults.standard.data(forKey: storageKey),
      let decoded = try? JSONDecoder().decode(LegalConsent.self, from: data)
    else {
      consent = .empty
      return
    }
    consent = decoded
  }

  private func saveConsent() {
    if let encoded = try? JSONEncoder().encode(consent) {
      UserDefaults.standard.set(encoded, forKey: storageKey)
    }
  }

  private func checkConsentValidity() {
    // Check if terms or privacy versions have been updated
    if consent.termsVersion != Self.currentTermsVersion {
      consent.termsAccepted = false
    }
    if consent.privacyVersion != Self.currentPrivacyVersion {
      consent.privacyAccepted = false
    }

    // Determine if gate should show
    showLegalGate = !consent.isComplete
    saveConsent()
  }
}

// MARK: - Legal Documents

enum LegalDocuments {
  static let termsOfService = """
    APERTURE AWAKENING - TERMS OF SERVICE
    Last Updated: February 2025
    Version 1.0.0

    PLEASE READ THESE TERMS CAREFULLY BEFORE USING THE APERTURE AWAKENING APPLICATION.

    1. ACCEPTANCE OF TERMS

    By downloading, installing, or using Aperture Awakening ("the App"), you agree to be bound by these Terms of Service ("Terms"). If you do not agree to these Terms, do not use the App.

    2. AGE REQUIREMENT

    You must be at least 18 years of age to use this App. By using the App, you represent and warrant that you are at least 18 years old. The App contains mature philosophical, spiritual, and psychological content that is intended for adult audiences only.

    3. NATURE OF CONTENT

    The App provides educational and informational content related to:
    • Philosophical and spiritual traditions
    • Meditation and contemplative practices
    • Historical analysis and alternative perspectives
    • Psychological concepts including consciousness exploration
    • Pattern recognition and critical thinking exercises

    This content is provided for educational and entertainment purposes only.

    4. NOT PROFESSIONAL ADVICE

    THE APP DOES NOT PROVIDE:
    • Medical advice or treatment
    • Mental health diagnosis or therapy
    • Financial or legal advice
    • Religious instruction or spiritual authority

    The content should not be used as a substitute for professional consultation with qualified healthcare providers, mental health professionals, financial advisors, or other licensed professionals.

    5. MENTAL HEALTH DISCLAIMER

    Some content in this App discusses topics such as:
    • Ego dissolution and identity exploration
    • Death contemplation (Bardo practices)
    • Addiction and recovery concepts
    • Altered states of consciousness
    • Challenging mainstream narratives

    If you are experiencing mental health difficulties, including but not limited to depression, anxiety, psychosis, or thoughts of self-harm, please seek professional help immediately. This App is not a crisis intervention tool.

    National Suicide Prevention Lifeline: 988
    Crisis Text Line: Text HOME to 741741

    6. CRITICAL THINKING NOTICE

    The App presents various perspectives, including alternative historical narratives and critical analyses of institutions. Users are encouraged to:
    • Think critically about all information
    • Conduct their own research
    • Form their own conclusions
    • Not accept any claims uncritically

    The presentation of information does not constitute endorsement of any particular viewpoint.

    7. USER RESPONSIBILITIES

    You agree to:
    • Use the App responsibly and in accordance with all applicable laws
    • Not use the App if you are under 18 years of age
    • Seek professional help for any mental health concerns
    • Take breaks if any content causes distress
    • Not rely solely on App content for important life decisions

    8. INTELLECTUAL PROPERTY

    All content, features, and functionality of the App are owned by Aperture Awakening and are protected by international copyright, trademark, and other intellectual property laws.

    9. LIMITATION OF LIABILITY

    TO THE MAXIMUM EXTENT PERMITTED BY LAW, APERTURE AWAKENING SHALL NOT BE LIABLE FOR ANY INDIRECT, INCIDENTAL, SPECIAL, CONSEQUENTIAL, OR PUNITIVE DAMAGES, OR ANY LOSS OF PROFITS OR REVENUES, WHETHER INCURRED DIRECTLY OR INDIRECTLY, OR ANY LOSS OF DATA, USE, GOODWILL, OR OTHER INTANGIBLE LOSSES RESULTING FROM:

    • Your use or inability to use the App
    • Any content obtained from the App
    • Any decisions made based on App content
    • Unauthorized access to your data

    10. INDEMNIFICATION

    You agree to indemnify and hold harmless Aperture Awakening from any claims, damages, or expenses arising from your use of the App or violation of these Terms.

    11. MODIFICATIONS

    We reserve the right to modify these Terms at any time. Continued use of the App after changes constitutes acceptance of the new Terms. Material changes will require re-acceptance.

    12. GOVERNING LAW

    These Terms shall be governed by and construed in accordance with the laws of the State of Delaware, United States, without regard to its conflict of law provisions.

    13. CONTACT

    For questions about these Terms, please contact:
    legal@apertureawakening.app

    BY USING THIS APP, YOU ACKNOWLEDGE THAT YOU HAVE READ, UNDERSTOOD, AND AGREE TO BE BOUND BY THESE TERMS OF SERVICE.
    """

  static let privacyPolicy = """
    APERTURE AWAKENING - PRIVACY POLICY
    Last Updated: February 2025
    Version 1.0.0

    Your privacy is sacred to us. This Privacy Policy explains how Aperture Awakening ("we," "us," or "our") handles information when you use our application.

    1. OUR PRIVACY COMMITMENT

    We believe in digital sovereignty. Your personal journey of awakening is YOUR business, not ours.

    2. INFORMATION WE DO NOT COLLECT

    We DO NOT collect, store, or transmit:
    • Your personal identification information
    • Your location data
    • Your contacts or phone data
    • Your photos or media
    • Your browsing history
    • Your journal entries or personal notes
    • Your course progress details
    • Any health or biometric data

    3. LOCAL STORAGE ONLY

    All your data remains on YOUR device:
    • Course progress
    • Streak tracking
    • Personal notes and reflections
    • Practice logs
    • Persona quiz results
    • App preferences

    This data is stored locally using Apple's standard data storage and is NOT transmitted to any external servers.

    4. WHAT WE MAY COLLECT (WITH YOUR CONSENT)

    If you explicitly opt in, we may collect:
    • Anonymous crash reports (to improve app stability)
    • Anonymous usage analytics (feature popularity only, no personal data)

    You can disable these in your device Settings.

    5. THIRD-PARTY SERVICES

    The App may use:
    • Apple's App Store (subject to Apple's Privacy Policy)
    • Apple's crash reporting (if enabled in your device settings)

    We do not use third-party analytics, advertising networks, or data brokers.

    6. APPLE'S DATA COLLECTION

    Please note that Apple may collect certain data that is outside our control:
    • App Store analytics (if you haven't opted out)
    • Device diagnostics (if enabled)
    • iCloud backup data (if you use iCloud backup)

    To maximize privacy with Apple:
    1. Settings > Privacy & Security > Analytics & Improvements
    2. Disable "Share iPhone Analytics"
    3. Disable "Share iCloud Analytics"

    7. DATA DELETION

    Since your data is stored only on your device:
    • Deleting the App removes all associated data
    • You can reset app data in Settings at any time
    • No data remains on our servers (we don't have your data)

    8. CHILDREN'S PRIVACY

    This App is not intended for users under 18 years of age. We do not knowingly collect any information from children. If you believe a child has provided us with information, please contact us immediately.

    9. SECURITY

    Your data is protected by:
    • Apple's iOS security architecture
    • Device encryption (if enabled)
    • App sandboxing

    We recommend enabling device passcode/Face ID for additional security.

    10. YOUR RIGHTS

    You have the right to:
    • Access your data (it's on your device)
    • Delete your data (delete the app or reset in settings)
    • Opt out of any optional analytics
    • Use the App without providing personal information

    11. CHANGES TO THIS POLICY

    We may update this Privacy Policy periodically. Changes will be reflected by the "Last Updated" date. Material changes may require re-acceptance.

    12. CONTACT US

    For privacy concerns or questions:
    privacy@apertureawakening.app

    13. SUMMARY

    🔒 Your data stays on YOUR device
    🚫 We don't track you
    🚫 We don't sell data (we don't have any)
    ✅ You control everything

    Your consciousness expansion journey is between you and the universe. We're just here to provide tools.
    """

  static let contentDisclaimer = """
    CONTENT DISCLAIMER

    Aperture Awakening contains mature philosophical and spiritual content intended for adults seeking personal growth and expanded awareness.

    THE CONTENT INCLUDES:

    ⚠️ SPIRITUAL & ESOTERIC MATERIAL
    • Meditation and contemplative practices
    • Concepts from various wisdom traditions
    • Ego dissolution and consciousness exploration
    • Death contemplation (Bardo practices)

    ⚠️ CRITICAL ANALYSIS
    • Alternative historical perspectives
    • Institutional critique
    • Pattern recognition exercises
    • Conspiracy analysis frameworks

    ⚠️ PSYCHOLOGICAL CONCEPTS
    • Shadow work and integration
    • Addiction as spiritual seeking (Jungian perspective)
    • Identity and self-concept exploration

    IMPORTANT NOTICES:

    🧠 MENTAL HEALTH
    This App is NOT a substitute for professional mental health care. If you're experiencing distress, please seek qualified help.

    📚 EDUCATIONAL PURPOSE
    Content is for educational exploration, not as authoritative truth claims. Think critically about everything.

    🙏 RESPECT YOUR JOURNEY
    Take what resonates. Leave what doesn't. Go at your own pace. Take breaks if needed.

    By continuing, you acknowledge understanding these notices.
    """
}
