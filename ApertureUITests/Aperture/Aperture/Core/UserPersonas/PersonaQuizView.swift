// PersonaQuizView.swift
// Interactive quiz to identify user's awakening archetype
// Maps to the 10 User Personas for personalized content

import SwiftUI

// MARK: - Quiz Questions

struct PersonaQuizQuestion: Identifiable {
  let id: Int
  let question: String
  let options: [PersonaQuizOption]
}

struct PersonaQuizOption: Identifiable {
  let id: Int
  let text: String
  let personaWeights: [AwakeningPersona: Int]  // Which personas this answer suggests
}

enum PersonaQuizData {
  static let questions: [PersonaQuizQuestion] = [
    // Question 1: Current state
    PersonaQuizQuestion(
      id: 1,
      question: "How would you describe your current relationship with 'reality'?",
      options: [
        PersonaQuizOption(
          id: 1,
          text: "Things feel fine. I'm mostly satisfied with how I understand the world.",
          personaWeights: [.deeplyProgrammed: 5, .institutionalSkeptic: 2]
        ),
        PersonaQuizOption(
          id: 2,
          text: "Something feels off, but I can't quite name it yet.",
          personaWeights: [.newlyAwakening: 5, .eternalQuestioner: 2]
        ),
        PersonaQuizOption(
          id: 3,
          text: "I've seen too much. Nothing makes sense anymore.",
          personaWeights: [.rabbitHoleDweller: 5, .chosenSurvivor: 2]
        ),
        PersonaQuizOption(
          id: 4,
          text: "I've had powerful experiences but struggle to integrate them.",
          personaWeights: [.integrationSeeker: 5, .meditationSeeker: 3]
        ),
      ]
    ),

    // Question 2: Spiritual background
    PersonaQuizQuestion(
      id: 2,
      question: "What's your relationship with spirituality or religion?",
      options: [
        PersonaQuizOption(
          id: 1,
          text: "I was raised religious but rejected it. Institutions can't be trusted.",
          personaWeights: [.institutionalSkeptic: 5, .spirituallyWounded: 3]
        ),
        PersonaQuizOption(
          id: 2,
          text: "Religion hurt me or people I love. I'm cautious about anything 'spiritual.'",
          personaWeights: [.spirituallyWounded: 5, .chosenSurvivor: 2]
        ),
        PersonaQuizOption(
          id: 3,
          text: "I've always been curious and explored many traditions.",
          personaWeights: [.eternalQuestioner: 5, .meditationSeeker: 2]
        ),
        PersonaQuizOption(
          id: 4,
          text: "I need evidence. Show me the science behind any spiritual claim.",
          personaWeights: [.scientificMaterialist: 5, .institutionalSkeptic: 2]
        ),
      ]
    ),

    // Question 3: Practice experience
    PersonaQuizQuestion(
      id: 3,
      question: "Have you tried meditation, breathwork, or similar practices?",
      options: [
        PersonaQuizOption(
          id: 1,
          text: "No, or only briefly. I'm not sure it's for me.",
          personaWeights: [.deeplyProgrammed: 3, .scientificMaterialist: 3, .newlyAwakening: 2]
        ),
        PersonaQuizOption(
          id: 2,
          text: "Yes, I've practiced regularly but never had a breakthrough.",
          personaWeights: [.meditationSeeker: 5, .integrationSeeker: 2]
        ),
        PersonaQuizOption(
          id: 3,
          text: "I've had powerful experiences but couldn't sustain them.",
          personaWeights: [.meditationSeeker: 4, .integrationSeeker: 4]
        ),
        PersonaQuizOption(
          id: 4,
          text: "I've gone deep—maybe too deep. I need grounding now.",
          personaWeights: [.rabbitHoleDweller: 5, .integrationSeeker: 3]
        ),
      ]
    ),

    // Question 4: Information consumption
    PersonaQuizQuestion(
      id: 4,
      question: "How do you typically seek answers to big questions?",
      options: [
        PersonaQuizOption(
          id: 1,
          text: "I trust experts and established sources.",
          personaWeights: [.deeplyProgrammed: 4, .institutionalSkeptic: 2]
        ),
        PersonaQuizOption(
          id: 2,
          text: "I research obsessively across many sources, sometimes losing myself.",
          personaWeights: [.rabbitHoleDweller: 5, .eternalQuestioner: 3]
        ),
        PersonaQuizOption(
          id: 3,
          text: "I question everything but struggle to land on any conclusions.",
          personaWeights: [.eternalQuestioner: 5, .institutionalSkeptic: 2]
        ),
        PersonaQuizOption(
          id: 4,
          text: "I prioritize peer-reviewed science and empirical data.",
          personaWeights: [.scientificMaterialist: 5]
        ),
      ]
    ),

    // Question 5: Life circumstances
    PersonaQuizQuestion(
      id: 5,
      question: "How would you describe your life journey so far?",
      options: [
        PersonaQuizOption(
          id: 1,
          text: "Relatively stable. No major crises or transformations.",
          personaWeights: [.deeplyProgrammed: 4, .meditationSeeker: 2]
        ),
        PersonaQuizOption(
          id: 2,
          text: "I've been through significant challenges that changed how I see things.",
          personaWeights: [.chosenSurvivor: 4, .newlyAwakening: 3]
        ),
        PersonaQuizOption(
          id: 3,
          text: "Life has broken me multiple times, but I keep getting up.",
          personaWeights: [.chosenSurvivor: 5, .spirituallyWounded: 2]
        ),
        PersonaQuizOption(
          id: 4,
          text: "Something cracked open recently. I'm in the middle of it now.",
          personaWeights: [.newlyAwakening: 5, .integrationSeeker: 2]
        ),
      ]
    ),

    // Question 6: What you need most
    PersonaQuizQuestion(
      id: 6,
      question: "What do you need most right now?",
      options: [
        PersonaQuizOption(
          id: 1,
          text: "Permission to question what I've always believed.",
          personaWeights: [.deeplyProgrammed: 5, .institutionalSkeptic: 2]
        ),
        PersonaQuizOption(
          id: 2,
          text: "Practical tools to make sense of my experiences.",
          personaWeights: [.integrationSeeker: 5, .meditationSeeker: 2]
        ),
        PersonaQuizOption(
          id: 3,
          text: "Grounding. I've gone too far and need to come back to earth.",
          personaWeights: [.rabbitHoleDweller: 5, .chosenSurvivor: 2]
        ),
        PersonaQuizOption(
          id: 4,
          text: "A safe space to explore the sacred without religious baggage.",
          personaWeights: [.spirituallyWounded: 5, .eternalQuestioner: 2]
        ),
      ]
    ),
  ]
}

// MARK: - Quiz View

struct PersonaQuizView: View {
  @State private var currentQuestion = 0
  @State private var selectedOptions: [Int: Int] = [:]  // questionId: optionId
  @State private var showResult = false
  @State private var identifiedPersona: AwakeningPersona?
  @State private var personaScores: [AwakeningPersona: Int] = [:]

  @ObservedObject var personaStore = PersonaStore.shared
  @Environment(\.dismiss) private var dismiss

  let onComplete: ((AwakeningPersona) -> Void)?

  init(onComplete: ((AwakeningPersona) -> Void)? = nil) {
    self.onComplete = onComplete
  }

  var questions: [PersonaQuizQuestion] {
    PersonaQuizData.questions
  }

  var progress: Double {
    Double(selectedOptions.count) / Double(questions.count)
  }

  var body: some View {
    ZStack {
      // Background
      LinearGradient(
        colors: [
          Color(hex: "#0A0A0A"),
          Color(hex: "#1A0A20"),
          Color(hex: "#0A0A0A"),
        ],
        startPoint: .top,
        endPoint: .bottom
      )
      .ignoresSafeArea()

      if showResult, let persona = identifiedPersona {
        resultView(persona)
      } else {
        questionView
      }
    }
  }

  // MARK: - Question View

  private var questionView: some View {
    VStack(spacing: 24) {
      // Header
      HStack {
        Button {
          dismiss()
        } label: {
          Image(systemName: "xmark")
            .font(.system(size: 18))
            .foregroundColor(.white.opacity(0.6))
        }

        Spacer()

        Text("Question \(currentQuestion + 1) of \(questions.count)")
          .font(.system(size: 14, weight: .medium))
          .foregroundColor(.white.opacity(0.6))
      }
      .padding(.horizontal)
      .padding(.top, 20)

      // Progress bar
      GeometryReader { geo in
        ZStack(alignment: .leading) {
          RoundedRectangle(cornerRadius: 4)
            .fill(Color.white.opacity(0.1))

          RoundedRectangle(cornerRadius: 4)
            .fill(
              LinearGradient(
                colors: [Color(hex: "#9B59B6"), Color(hex: "#00CED1")],
                startPoint: .leading,
                endPoint: .trailing
              )
            )
            .frame(width: geo.size.width * progress)
        }
      }
      .frame(height: 6)
      .padding(.horizontal)

      Spacer()

      // Question
      let question = questions[currentQuestion]

      VStack(spacing: 16) {
        Text(question.question)
          .font(.system(size: 22, weight: .bold))
          .foregroundColor(.white)
          .multilineTextAlignment(.center)
          .padding(.horizontal, 20)
      }

      // Options
      VStack(spacing: 12) {
        ForEach(question.options) { option in
          optionButton(option, for: question.id)
        }
      }
      .padding(.horizontal, 20)

      Spacer()

      // Navigation
      HStack(spacing: 16) {
        if currentQuestion > 0 {
          Button {
            withAnimation { currentQuestion -= 1 }
          } label: {
            HStack {
              Image(systemName: "chevron.left")
              Text("Back")
            }
            .font(.system(size: 16, weight: .medium))
            .foregroundColor(.white.opacity(0.7))
            .padding(.horizontal, 24)
            .padding(.vertical, 14)
            .background(Capsule().fill(Color.white.opacity(0.1)))
          }
        }

        Spacer()

        if selectedOptions[questions[currentQuestion].id] != nil {
          Button {
            if currentQuestion < questions.count - 1 {
              withAnimation { currentQuestion += 1 }
            } else {
              calculateResult()
            }
          } label: {
            HStack {
              Text(currentQuestion < questions.count - 1 ? "Next" : "See Result")
              Image(
                systemName: currentQuestion < questions.count - 1 ? "chevron.right" : "sparkles")
            }
            .font(.system(size: 16, weight: .semibold))
            .foregroundColor(.black)
            .padding(.horizontal, 24)
            .padding(.vertical, 14)
            .background(Capsule().fill(Color(hex: "#9B59B6")))
          }
        }
      }
      .padding(.horizontal, 20)
      .padding(.bottom, 30)
    }
  }

  private func optionButton(_ option: PersonaQuizOption, for questionId: Int) -> some View {
    let isSelected = selectedOptions[questionId] == option.id

    return Button {
      withAnimation(.spring(response: 0.3)) {
        selectedOptions[questionId] = option.id
      }
      HapticManager.shared.selectionChanged()
    } label: {
      Text(option.text)
        .font(.system(size: 15, weight: .medium))
        .foregroundColor(.white)
        .multilineTextAlignment(.leading)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(16)
        .background(
          RoundedRectangle(cornerRadius: 12)
            .fill(isSelected ? Color(hex: "#9B59B6").opacity(0.3) : Color.white.opacity(0.05))
            .overlay(
              RoundedRectangle(cornerRadius: 12)
                .stroke(
                  isSelected ? Color(hex: "#9B59B6") : Color.white.opacity(0.1),
                  lineWidth: isSelected ? 2 : 1)
            )
        )
    }
  }

  // MARK: - Result View

  private func resultView(_ persona: AwakeningPersona) -> some View {
    ScrollView(showsIndicators: false) {
      VStack(spacing: 24) {
        Spacer(minLength: 40)

        // Icon
        ZStack {
          Circle()
            .fill(
              RadialGradient(
                colors: [persona.color.opacity(0.4), Color.clear],
                center: .center,
                startRadius: 30,
                endRadius: 80
              )
            )
            .frame(width: 160, height: 160)

          Image(systemName: persona.icon)
            .font(.system(size: 60))
            .foregroundColor(persona.color)
        }

        // Title
        Text("Your Archetype")
          .font(.system(size: 14, weight: .medium))
          .foregroundColor(.white.opacity(0.6))

        Text(persona.displayName)
          .font(.system(size: 28, weight: .bold))
          .foregroundColor(.white)

        // Description
        Text(persona.description)
          .font(.system(size: 16))
          .foregroundColor(.white.opacity(0.8))
          .multilineTextAlignment(.center)
          .padding(.horizontal, 30)

        // Primary need
        VStack(spacing: 8) {
          Text("YOUR PRIMARY NEED")
            .font(.system(size: 11, weight: .bold))
            .foregroundColor(persona.color)
            .tracking(1)

          Text(persona.primaryNeed)
            .font(.system(size: 15, weight: .medium))
            .foregroundColor(.white)
            .multilineTextAlignment(.center)
        }
        .padding(16)
        .background(
          RoundedRectangle(cornerRadius: 12)
            .fill(persona.color.opacity(0.1))
        )
        .padding(.horizontal, 20)

        // Recommended starting courses
        VStack(alignment: .leading, spacing: 12) {
          Text("RECOMMENDED START")
            .font(.system(size: 11, weight: .bold))
            .foregroundColor(.white.opacity(0.5))
            .tracking(1)

          ForEach(persona.recommendedStartingCourses.prefix(3), id: \.self) { course in
            HStack(spacing: 12) {
              Image(systemName: "checkmark.circle.fill")
                .foregroundColor(.green)
              Text(course)
                .font(.system(size: 14))
                .foregroundColor(.white)
              Spacer()
            }
          }
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
          RoundedRectangle(cornerRadius: 12)
            .fill(Color.white.opacity(0.05))
        )
        .padding(.horizontal, 20)

        // Welcome message
        Text(persona.welcomeMessage)
          .font(.system(size: 14))
          .foregroundColor(.white.opacity(0.7))
          .italic()
          .multilineTextAlignment(.center)
          .padding(.horizontal, 30)

        Spacer(minLength: 30)

        // Continue button
        Button {
          personaStore.setPersona(persona)
          onComplete?(persona)
          dismiss()
        } label: {
          HStack {
            Text("Begin Your Journey")
              .font(.system(size: 17, weight: .bold))
            Image(systemName: "arrow.right")
          }
          .foregroundColor(.black)
          .frame(maxWidth: .infinity)
          .padding(.vertical, 16)
          .background(
            RoundedRectangle(cornerRadius: 12)
              .fill(persona.color)
          )
        }
        .padding(.horizontal, 20)
        .padding(.bottom, 40)
      }
    }
  }

  // MARK: - Calculate Result

  private func calculateResult() {
    // Tally up scores
    var scores: [AwakeningPersona: Int] = [:]

    for (questionId, optionId) in selectedOptions {
      guard let question = questions.first(where: { $0.id == questionId }),
        let option = question.options.first(where: { $0.id == optionId })
      else { continue }

      for (persona, weight) in option.personaWeights {
        scores[persona, default: 0] += weight
      }
    }

    personaScores = scores

    // Find highest scoring persona
    let sorted = scores.sorted { $0.value > $1.value }
    identifiedPersona = sorted.first?.key ?? .newlyAwakening

    withAnimation(.spring()) {
      showResult = true
    }

    HapticManager.shared.success()
  }
}

// MARK: - Persona Store

class PersonaStore: ObservableObject {
  static let shared = PersonaStore()

  @Published private(set) var currentPersona: AwakeningPersona?

  private let key = "user_awakening_persona"

  init() {
    loadPersona()
  }

  func setPersona(_ persona: AwakeningPersona) {
    currentPersona = persona
    UserDefaults.standard.set(persona.rawValue, forKey: key)
  }

  private func loadPersona() {
    guard let raw = UserDefaults.standard.string(forKey: key),
      let persona = AwakeningPersona(rawValue: raw)
    else { return }
    currentPersona = persona
  }

  func clearPersona() {
    currentPersona = nil
    UserDefaults.standard.removeObject(forKey: key)
  }
}

// MARK: - Persona Quick Card

struct PersonaQuickCard: View {
  @ObservedObject var store = PersonaStore.shared
  @State private var showQuiz = false

  var body: some View {
    Button {
      showQuiz = true
    } label: {
      HStack(spacing: 16) {
        if let persona = store.currentPersona {
          Image(systemName: persona.icon)
            .font(.system(size: 24))
            .foregroundColor(persona.color)

          VStack(alignment: .leading, spacing: 2) {
            Text(persona.displayName)
              .font(.system(size: 15, weight: .bold))
              .foregroundColor(.white)

            Text("Your awakening archetype")
              .font(.system(size: 11))
              .foregroundColor(.white.opacity(0.5))
          }
        } else {
          Image(systemName: "person.fill.questionmark")
            .font(.system(size: 24))
            .foregroundColor(.purple)

          VStack(alignment: .leading, spacing: 2) {
            Text("Discover Your Archetype")
              .font(.system(size: 15, weight: .bold))
              .foregroundColor(.white)

            Text("Take the quick quiz")
              .font(.system(size: 11))
              .foregroundColor(.white.opacity(0.5))
          }
        }

        Spacer()

        Image(systemName: "chevron.right")
          .font(.system(size: 14))
          .foregroundColor(.white.opacity(0.3))
      }
      .padding(16)
      .background(
        RoundedRectangle(cornerRadius: 12)
          .fill(Color.white.opacity(0.03))
          .overlay(
            RoundedRectangle(cornerRadius: 12)
              .stroke(
                store.currentPersona?.color.opacity(0.3) ?? Color.white.opacity(0.1), lineWidth: 1)
          )
      )
    }
    .sheet(isPresented: $showQuiz) {
      PersonaQuizView()
    }
  }
}

// MARK: - Preview

#Preview {
  PersonaQuizView()
}
