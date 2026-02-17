// FAQView.swift
// Frequently Asked Questions about Aperture and awakening concepts

import SwiftUI

struct FAQView: View {
  @State private var expandedQuestion: String?

  var body: some View {
    ZStack {
      CosmicBackground(starCount: 40)

      ScrollView(showsIndicators: false) {
        VStack(spacing: 20) {
          // Header
          VStack(spacing: 12) {
            Image(systemName: "questionmark.circle.fill")
              .font(.system(size: 50))
              .foregroundColor(Palette.accent.gold)

            Text("Frequently Asked Questions")
              .font(.system(size: 24, weight: .bold))
              .foregroundColor(.white)

            Text("Common questions about Aperture and your journey")
              .font(.system(size: 14))
              .foregroundColor(.gray)
              .multilineTextAlignment(.center)
          }
          .padding(.top, 20)
          .padding(.bottom, 10)

          // FAQ Categories
          faqSection(title: "About Aperture", questions: apertureQuestions)
          faqSection(title: "Awakening & Practice", questions: awakeningQuestions)
          faqSection(title: "Dragon Companion", questions: dragonQuestions)
          faqSection(title: "Technical", questions: technicalQuestions)

          // Trust Statement
          trustStatement

          Spacer(minLength: 100)
        }
        .padding(.horizontal, 20)
      }
    }
    .navigationTitle("FAQ")
    .navigationBarTitleDisplayMode(.inline)
  }

  // MARK: - FAQ Section

  private func faqSection(title: String, questions: [FAQItem]) -> some View {
    VStack(alignment: .leading, spacing: 12) {
      Text(title.uppercased())
        .font(.system(size: 12, weight: .bold))
        .foregroundColor(Palette.accent.gold)
        .tracking(2)
        .padding(.leading, 4)

      ForEach(questions) { item in
        FAQCard(
          item: item,
          isExpanded: expandedQuestion == item.id,
          onTap: {
            withAnimation(.spring(response: 0.3)) {
              if expandedQuestion == item.id {
                expandedQuestion = nil
              } else {
                expandedQuestion = item.id
              }
            }
          }
        )
      }
    }
  }

  // MARK: - Trust Statement

  private var trustStatement: some View {
    VStack(spacing: 12) {
      Divider()
        .background(Color.white.opacity(0.2))

      Text("Our Commitment")
        .font(.system(size: 14, weight: .bold))
        .foregroundColor(Palette.accent.gold)

      Text(
        "Aperture is educational, comparative, and exploratory. We encourage you to question all material—including this platform. Form your own conclusions. Your awakening is yours alone."
      )
      .font(.system(size: 13))
      .foregroundColor(.gray)
      .multilineTextAlignment(.center)
      .padding(.horizontal)
    }
    .padding(.vertical, 20)
  }

  // MARK: - FAQ Data

  private var apertureQuestions: [FAQItem] {
    [
      FAQItem(
        question: "What is Aperture?",
        answer:
          "Aperture is a consciousness education platform that synthesizes wisdom traditions, hidden history, and practical awakening methods into a coherent journey. We believe all paths point to the same truth—and we're here to help you find yours."
      ),
      FAQItem(
        question: "Is Aperture a religion or cult?",
        answer:
          "Absolutely not. Aperture is an educational tool, not a belief system. We present comparative information from many traditions and encourage you to question everything—including us. There are no gurus here, no required beliefs, and no pressure. Your journey is self-directed."
      ),
      FAQItem(
        question: "Why do you present controversial content?",
        answer:
          "We believe in presenting multiple perspectives on important topics. Our goal isn't to tell you what to think, but to show you patterns that might otherwise remain hidden. We compare traditional teachings with alternative historical sources so you can form your own understanding."
      ),
      FAQItem(
        question: "Is my data private?",
        answer:
          "Yes. Your spiritual journey is personal. We use industry-standard encryption, and your data is never sold. Dragon Companion conversations are processed locally when possible. See our Privacy Policy for details."
      ),
    ]
  }

  private var awakeningQuestions: [FAQItem] {
    [
      FAQItem(
        question: "What is spiritual awakening?",
        answer:
          "Awakening is the process of becoming aware of deeper aspects of reality and yourself. Different traditions call it enlightenment, gnosis, satori, or union with the divine. The mechanism is universal: dormant inner potential activates, limited ego-identity loosens, and a sense of unity emerges."
      ),
      FAQItem(
        question: "Is awakening dangerous?",
        answer:
          "Like any transformative process, awakening can be challenging. That's why we emphasize safety, grounding, and gradual practice. If you experience overwhelming symptoms, we recommend pausing practice and consulting a professional. The Dragon Companion can help you navigate difficult moments."
      ),
      FAQItem(
        question: "Which tradition should I follow?",
        answer:
          "There's no single right path. Aperture shows you many traditions because they all point to the same truth using different languages and methods. Explore what resonates with you. Many people find that combining elements from multiple traditions creates a personalized practice."
      ),
      FAQItem(
        question: "How long does awakening take?",
        answer:
          "There's no set timeline. Some experience sudden shifts, while others grow gradually over years. Focus on consistent practice rather than achieving a destination. The journey itself is the transformation."
      ),
    ]
  }

  private var dragonQuestions: [FAQItem] {
    [
      FAQItem(
        question: "What is the Dragon Companion?",
        answer:
          "Your Dragon is an AI-powered guide that grows alongside your spiritual journey. It provides personalized guidance, answers questions about content, and helps you navigate challenging moments. The more you engage with Aperture, the more your Dragon evolves."
      ),
      FAQItem(
        question: "How does my Dragon grow?",
        answer:
          "Your Dragon gains experience when you complete courses, maintain practice streaks, explore content across modules, and ask thoughtful questions. Different activities develop different aspects—courses build wisdom, practices build energy, and exploration builds curiosity."
      ),
      FAQItem(
        question: "Can I summon the Dragon anytime?",
        answer:
          "Yes! Long-press anywhere for 1.5 seconds or triple-tap to summon the Dragon bubble if you've dismissed it. You can also tap the floating bubble whenever it's visible. The Dragon is always available to help."
      ),
    ]
  }

  private var technicalQuestions: [FAQItem] {
    [
      FAQItem(
        question: "Does Aperture work offline?",
        answer:
          "Most content is available offline once loaded. Your progress syncs when you reconnect. For the best experience, we recommend periodic connectivity to sync your Dragon's growth and unlock new content."
      ),
      FAQItem(
        question: "How do I restore my progress on a new device?",
        answer:
          "Sign in with the same account you used before. Your Dragon, progress, and preferences sync via iCloud/Firebase. If you used guest mode, progress is stored locally and won't transfer."
      ),
      FAQItem(
        question: "Why do I see network errors in the console?",
        answer:
          "Some Firebase analytics may show connection errors in development—this doesn't affect app functionality. If you experience actual issues, ensure you have internet connectivity and try restarting the app."
      ),
    ]
  }
}

// MARK: - FAQ Item Model

struct FAQItem: Identifiable {
  let id = UUID().uuidString
  let question: String
  let answer: String
}

// MARK: - FAQ Card View

struct FAQCard: View {
  let item: FAQItem
  let isExpanded: Bool
  let onTap: () -> Void

  var body: some View {
    VStack(alignment: .leading, spacing: 0) {
      // Question header
      Button(action: onTap) {
        HStack {
          Text(item.question)
            .font(.system(size: 15, weight: .semibold))
            .foregroundColor(.white)
            .multilineTextAlignment(.leading)

          Spacer()

          Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
            .font(.system(size: 12, weight: .semibold))
            .foregroundColor(Palette.accent.gold)
        }
        .padding()
      }

      // Answer (when expanded)
      if isExpanded {
        Text(item.answer)
          .font(.system(size: 14))
          .foregroundColor(.gray)
          .padding(.horizontal)
          .padding(.bottom)
          .transition(.opacity.combined(with: .move(edge: .top)))
      }
    }
    .background(
      RoundedRectangle(cornerRadius: 12)
        .fill(Color.white.opacity(0.05))
        .overlay(
          RoundedRectangle(cornerRadius: 12)
            .stroke(isExpanded ? Palette.accent.gold.opacity(0.3) : Color.clear, lineWidth: 1)
        )
    )
  }
}

// MARK: - Preview

#Preview {
  NavigationStack {
    FAQView()
  }
}
