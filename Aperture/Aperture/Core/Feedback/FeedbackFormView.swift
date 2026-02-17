// FeedbackFormView.swift
// SHAKE TO SPEAK — Your voice shapes Aperture
// ☀️ SunFlow: Reignited
//
// Shake your phone anywhere in the app → feedback form appears.
// Also accessible from Settings.
//
// Categories: Bug Report, Feature Request, Content Feedback,
// General Feedback, Love Note
//
// Captures: category, description, optional screenshot,
// device info, app version. Sends via email or copies to clipboard.

import MessageUI
import SwiftUI
import UIKit

// MARK: - ═══════════════════════════════════════════════════

// FEEDBACK MODEL
// ═══════════════════════════════════════════════════════════

enum FeedbackCategory: String, CaseIterable, Identifiable {
  case bug = "Bug Report"
  case feature = "Feature Request"
  case content = "Content Feedback"
  case general = "General Feedback"
  case love = "Love Note"

  var id: String {
    rawValue
  }

  var icon: String {
    switch self {
    case .bug: return "ladybug.fill"
    case .feature: return "lightbulb.fill"
    case .content: return "book.fill"
    case .general: return "bubble.left.fill"
    case .love: return "heart.fill"
    }
  }

  var color: Color {
    switch self {
    case .bug: return .red
    case .feature: return .cyan
    case .content: return .purple
    case .general: return .blue
    case .love: return .pink
    }
  }

  var placeholder: String {
    switch self {
    case .bug: return "What happened? What did you expect? Steps to reproduce..."
    case .feature: return "What feature would make Aperture better for you?"
    case .content: return "Which course/module? What would you change or add?"
    case .general: return "Tell us what's on your mind..."
    case .love: return "We love hearing what resonates with you ☀️"
    }
  }

  var emailSubject: String {
    switch self {
    case .bug: return "[Bug] Aperture Feedback"
    case .feature: return "[Feature Request] Aperture Feedback"
    case .content: return "[Content] Aperture Feedback"
    case .general: return "[Feedback] Aperture"
    case .love: return "[Love Note] Aperture ☀️"
    }
  }
}

// MARK: - ═══════════════════════════════════════════════════

// FEEDBACK MANAGER
// ═══════════════════════════════════════════════════════════

@MainActor
class FeedbackManager: ObservableObject {
  static let shared = FeedbackManager()

  @Published var showFeedbackForm = false
  @Published var capturedScreenshot: UIImage? = nil

  let feedbackEmail = "2ronald.hernandez@gmail.com"

  func triggerFeedback() {
    captureScreenshot()
    showFeedbackForm = true
  }

  func captureScreenshot() {
    guard
      let window = UIApplication.shared.connectedScenes
        .compactMap({ $0 as? UIWindowScene })
        .flatMap({ $0.windows })
        .first(where: { $0.isKeyWindow })
    else { return }

    let renderer = UIGraphicsImageRenderer(size: window.bounds.size)
    capturedScreenshot = renderer.image { _ in
      window.drawHierarchy(in: window.bounds, afterScreenUpdates: true)
    }
  }

  var deviceInfo: String {
    let device = UIDevice.current
    let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "?"
    let build = Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "?"
    return """
      Device: \(device.model) (\(device.systemName) \(device.systemVersion))
      App: Aperture v\(version) (\(build))
      Locale: \(Locale.current.identifier)
      """
  }
}

// MARK: - ═══════════════════════════════════════════════════

// FEEDBACK FORM VIEW
// ═══════════════════════════════════════════════════════════

struct FeedbackFormView: View {
  @Environment(\.dismiss) var dismiss
  @StateObject private var manager = FeedbackManager.shared

  @State private var selectedCategory: FeedbackCategory = .general
  @State private var feedbackText = ""
  @State private var includeScreenshot = true
  @State private var rating: Int = 0
  @State private var showMailCompose = false
  @State private var showCopiedAlert = false
  @State private var showThankYou = false

  var body: some View {
    NavigationStack {
      ZStack {
        Color(red: 0.03, green: 0.03, blue: 0.08).ignoresSafeArea()

        if showThankYou {
          thankYouView
        } else {
          formView
        }
      }
      .navigationTitle("")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarLeading) {
          Button {
            dismiss()
          } label: {
            Image(systemName: "xmark.circle.fill").foregroundColor(.white.opacity(0.3)).font(
              .system(size: 22))
          }
        }
        ToolbarItem(placement: .principal) {
          HStack(spacing: 6) {
            Image(systemName: "bubble.left.and.bubble.right.fill").foregroundColor(.cyan).font(
              .system(size: 14))
            Text("Send Feedback").font(.system(size: 17, weight: .bold)).foregroundColor(.white)
          }
        }
      }
      .sheet(isPresented: $showMailCompose) {
        MailComposeView(
          subject: selectedCategory.emailSubject,
          body: composedBody,
          recipient: manager.feedbackEmail,
          screenshot: includeScreenshot ? manager.capturedScreenshot : nil
        )
      }
      .alert("Copied to Clipboard!", isPresented: $showCopiedAlert) {
        Button("OK") { showThankYou = true }
      } message: {
        Text("Your feedback has been copied. Paste it in an email to \(manager.feedbackEmail)")
      }
    }
  }

  // MARK: - Form

  private var formView: some View {
    ScrollView(showsIndicators: false) {
      VStack(spacing: 18) {
        // Shake hint
        HStack(spacing: 8) {
          Image(systemName: "iphone.radiowaves.left.and.right").font(.system(size: 14))
            .foregroundColor(.cyan.opacity(0.5))
          Text("Shake your phone anytime to open this form").font(
            .system(size: 11, weight: .medium)
          ).foregroundColor(.white.opacity(0.3))
        }
        .padding(10).background(Capsule().fill(Color.cyan.opacity(0.04)))

        // Category
        VStack(alignment: .leading, spacing: 8) {
          Text("WHAT'S THIS ABOUT?").font(.system(size: 10, weight: .bold)).tracking(2)
            .foregroundColor(.white.opacity(0.3))

          ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
              ForEach(FeedbackCategory.allCases) { cat in
                Button {
                  withAnimation(.spring(response: 0.3)) { selectedCategory = cat }
                } label: {
                  HStack(spacing: 5) {
                    Image(systemName: cat.icon).font(.system(size: 11))
                    Text(cat.rawValue).font(.system(size: 11, weight: .bold))
                  }
                  .foregroundColor(selectedCategory == cat ? .black : cat.color)
                  .padding(.horizontal, 12).padding(.vertical, 8)
                  .background(
                    Capsule().fill(selectedCategory == cat ? cat.color : cat.color.opacity(0.08))
                  )
                  .overlay(
                    Capsule().stroke(
                      cat.color.opacity(0.2), lineWidth: selectedCategory == cat ? 0 : 1))
                }
              }
            }
          }
        }

        // Rating (for love notes and general)
        if selectedCategory == .love || selectedCategory == .general {
          VStack(alignment: .leading, spacing: 8) {
            Text("HOW'S YOUR EXPERIENCE?").font(.system(size: 10, weight: .bold)).tracking(2)
              .foregroundColor(.white.opacity(0.3))
            HStack(spacing: 12) {
              ForEach(1...5, id: \.self) { star in
                Button {
                  withAnimation(.spring(response: 0.2)) { rating = star }
                } label: {
                  Image(systemName: star <= rating ? "star.fill" : "star")
                    .font(.system(size: 28))
                    .foregroundColor(star <= rating ? .yellow : .white.opacity(0.15))
                    .scaleEffect(star <= rating ? 1.1 : 1.0)
                }
              }
            }
            .frame(maxWidth: .infinity)
          }
        }

        // Text input
        VStack(alignment: .leading, spacing: 6) {
          Text("TELL US MORE").font(.system(size: 10, weight: .bold)).tracking(2).foregroundColor(
            .white.opacity(0.3))

          ZStack(alignment: .topLeading) {
            TextEditor(text: $feedbackText)
              .scrollContentBackground(.hidden)
              .font(.system(size: 14, weight: .medium))
              .foregroundColor(.white)
              .frame(minHeight: 140)

            if feedbackText.isEmpty {
              Text(selectedCategory.placeholder)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(.white.opacity(0.2))
                .padding(.top, 8).padding(.leading, 5)
                .allowsHitTesting(false)
            }
          }
          .padding(12)
          .background(
            RoundedRectangle(cornerRadius: 14).fill(Color.white.opacity(0.04))
              .overlay(
                RoundedRectangle(cornerRadius: 14).stroke(
                  selectedCategory.color.opacity(0.1), lineWidth: 1)))
        }

        // Screenshot toggle
        if manager.capturedScreenshot != nil {
          HStack(spacing: 12) {
            if let img = manager.capturedScreenshot {
              Image(uiImage: img)
                .resizable().scaledToFill()
                .frame(width: 50, height: 90).cornerRadius(8).clipped()
                .overlay(
                  RoundedRectangle(cornerRadius: 8).stroke(Color.white.opacity(0.1), lineWidth: 1))
            }

            VStack(alignment: .leading, spacing: 4) {
              Text("Include Screenshot").font(.system(size: 13, weight: .bold)).foregroundColor(
                .white)
              Text("Helps us see exactly what you're seeing")
                .font(.system(size: 10, weight: .medium)).foregroundColor(.white.opacity(0.4))
            }

            Spacer()

            Toggle("", isOn: $includeScreenshot)
              .labelsHidden().tint(.cyan)
          }
          .padding(12)
          .background(RoundedRectangle(cornerRadius: 14).fill(Color.white.opacity(0.03)))
        }

        // Device info
        VStack(alignment: .leading, spacing: 4) {
          Text("DEVICE INFO (auto-attached)").font(.system(size: 9, weight: .bold)).tracking(1)
            .foregroundColor(.white.opacity(0.2))
          Text(manager.deviceInfo).font(.system(size: 10, weight: .medium, design: .monospaced))
            .foregroundColor(.white.opacity(0.25)).lineSpacing(3)
        }
        .padding(10).background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.02)))

        // Send buttons
        VStack(spacing: 10) {
          // Email button (primary)
          Button {
            if MFMailComposeViewController.canSendMail() {
              showMailCompose = true
            } else {
              // Fallback: copy to clipboard
              UIPasteboard.general.string = composedBody
              showCopiedAlert = true
            }
          } label: {
            HStack(spacing: 8) {
              Image(systemName: "paperplane.fill")
              Text("SEND FEEDBACK").font(.system(size: 14, weight: .bold))
            }
            .foregroundColor(.black)
            .frame(maxWidth: .infinity).padding(.vertical, 14)
            .background(Capsule().fill(selectedCategory.color))
          }
          .disabled(feedbackText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
          .opacity(feedbackText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ? 0.4 : 1)

          // Copy button (secondary)
          Button {
            UIPasteboard.general.string = composedBody
            showCopiedAlert = true
          } label: {
            HStack(spacing: 6) {
              Image(systemName: "doc.on.doc")
              Text("Copy to Clipboard Instead").font(.system(size: 12, weight: .medium))
            }
            .foregroundColor(.white.opacity(0.4))
          }
        }

        Spacer(minLength: 40)
      }
      .padding(20)
    }
  }

  // MARK: - Thank You

  private var thankYouView: some View {
    VStack(spacing: 20) {
      Spacer()

      ZStack {
        Circle().fill(Color.cyan.opacity(0.08)).frame(width: 100, height: 100)
        Image(systemName: "heart.circle.fill").font(.system(size: 50)).foregroundColor(.cyan)
      }

      Text("Thank You").font(.system(size: 24, weight: .black)).foregroundColor(.white)
      Text("Your feedback shapes Aperture.\nEvery voice matters. Especially yours.")
        .font(.system(size: 14, weight: .medium)).foregroundColor(.white.opacity(0.5))
        .multilineTextAlignment(.center).lineSpacing(4)

      Button {
        dismiss()
      } label: {
        Text("Close").font(.system(size: 14, weight: .bold)).foregroundColor(.black)
          .frame(width: 160).padding(.vertical, 12)
          .background(Capsule().fill(Color.cyan))
      }
      .padding(.top, 10)

      Spacer()
    }
  }

  // MARK: - Composed Body

  private var composedBody: String {
    return """
      Category: \(selectedCategory.rawValue)
      \(rating > 0 ? "Rating: \(String(repeating: "⭐️", count: rating))\n" : "")
      Feedback:
      \(feedbackText)

      ---
      \(manager.deviceInfo)
      Timestamp: \(Date().formatted())
      """
  }
}

// MARK: - ═══════════════════════════════════════════════════

// MAIL COMPOSE VIEW
// ═══════════════════════════════════════════════════════════

struct MailComposeView: UIViewControllerRepresentable {
  let subject: String
  let body: String
  let recipient: String
  let screenshot: UIImage?

  @Environment(\.dismiss) var dismiss

  func makeUIViewController(context: Context) -> MFMailComposeViewController {
    let vc = MFMailComposeViewController()
    vc.mailComposeDelegate = context.coordinator
    vc.setToRecipients([recipient])
    vc.setSubject(subject)
    vc.setMessageBody(body, isHTML: false)

    if let img = screenshot, let data = img.jpegData(compressionQuality: 0.5) {
      vc.addAttachmentData(data, mimeType: "image/jpeg", fileName: "screenshot.jpg")
    }

    return vc
  }

  func updateUIViewController(_: MFMailComposeViewController, context _: Context) {}

  func makeCoordinator() -> Coordinator {
    Coordinator(self)
  }

  class Coordinator: NSObject, MFMailComposeViewControllerDelegate {
    let parent: MailComposeView
    init(_ parent: MailComposeView) {
      self.parent = parent
    }

    func mailComposeController(
      _: MFMailComposeViewController, didFinishWith _: MFMailComposeResult, error _: Error?
    ) {
      parent.dismiss()
    }
  }
}

// MARK: - ═══════════════════════════════════════════════════

// GLOBAL SHAKE FEEDBACK MODIFIER
// ═══════════════════════════════════════════════════════════

struct ShakeFeedbackModifier: ViewModifier {
  @StateObject private var feedbackManager = FeedbackManager.shared

  func body(content: Content) -> some View {
    content
      .onShake {
        let impact = UIImpactFeedbackGenerator(style: .medium)
        impact.impactOccurred()
        feedbackManager.triggerFeedback()
      }
      .sheet(isPresented: $feedbackManager.showFeedbackForm) {
        FeedbackFormView()
      }
  }
}

extension View {
  func withShakeFeedback() -> some View {
    modifier(ShakeFeedbackModifier())
  }
}
