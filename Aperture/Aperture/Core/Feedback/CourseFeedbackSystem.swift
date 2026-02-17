// CourseFeedbackSystem.swift
// Aperture
//
// Course Feedback & Improvement Suggestions
// Quiz-style predefined questions
// Open suggestions for what to add/change

import SwiftUI

// MARK: - Feedback Manager

@MainActor
final class CourseFeedbackManager: ObservableObject {
  static let shared = CourseFeedbackManager()

  @Published var submittedFeedback: [CourseFeedback] = []

  private let defaults = UserDefaults.standard
  private let feedbackKey = "course_feedback_submissions"

  init() {
    loadFeedback()
  }

  func submitFeedback(_ feedback: CourseFeedback) {
    submittedFeedback.append(feedback)
    saveFeedback()
  }

  func hasFeedback(for courseId: String) -> Bool {
    submittedFeedback.contains { $0.courseId == courseId }
  }

  private func loadFeedback() {
    guard let data = defaults.data(forKey: feedbackKey),
      let decoded = try? JSONDecoder().decode([CourseFeedback].self, from: data)
    else {
      return
    }
    submittedFeedback = decoded
  }

  private func saveFeedback() {
    if let encoded = try? JSONEncoder().encode(submittedFeedback) {
      defaults.set(encoded, forKey: feedbackKey)
    }
  }
}

// MARK: - Feedback Model

struct CourseFeedback: Identifiable, Codable {
  let id: UUID
  let courseId: String
  let courseName: String
  let submittedDate: Date

  // Ratings (1-5)
  var overallRating: Int
  var clarityRating: Int
  var depthRating: Int
  var practicalityRating: Int
  var engagementRating: Int

  // Predefined questions (multiple choice)
  var favoriteAspect: FavoriteAspect
  var difficultyLevel: DifficultyFeedback
  var wouldRecommend: Bool
  var wantsMoreContent: Bool

  // Open-ended
  var whatToAdd: String?
  var whatToChange: String?
  var additionalComments: String?
}

enum FavoriteAspect: String, Codable, CaseIterable {
  case theContent = "The deep content"
  case teachingStyle = "The teaching style"
  case practicalExercises = "The practical exercises"
  case quizzes = "The quizzes"
  case keyInsights = "The key insights"
  case overallFlow = "The overall flow"
  case badges = "Earning badges"
  case everything = "Everything!"
}

enum DifficultyFeedback: String, Codable, CaseIterable {
  case tooEasy = "Too easy - I wanted more depth"
  case justRight = "Just right - perfect balance"
  case challenging = "Challenging but manageable"
  case tooHard = "Too difficult - I got lost"
  case varied = "Varied - some easy, some hard"
}

// MARK: - Feedback View

struct CourseFeedbackView: View {
  let courseId: String
  let courseName: String
  let onSubmit: () -> Void

  @StateObject private var manager = CourseFeedbackManager.shared
  @Environment(\.dismiss) private var dismiss

  // Form state
  @State private var overallRating = 4
  @State private var clarityRating = 4
  @State private var depthRating = 4
  @State private var practicalityRating = 4
  @State private var engagementRating = 4
  @State private var favoriteAspect: FavoriteAspect = .theContent
  @State private var difficultyLevel: DifficultyFeedback = .justRight
  @State private var wouldRecommend = true
  @State private var wantsMoreContent = true
  @State private var whatToAdd = ""
  @State private var whatToChange = ""
  @State private var additionalComments = ""

  @State private var currentStep = 0
  private let totalSteps = 4

  var body: some View {
    NavigationStack {
      ZStack {
        Color(hex: "#0a0a1a")
          .ignoresSafeArea()

        VStack(spacing: 0) {
          // Progress
          progressBar

          // Content
          TabView(selection: $currentStep) {
            ratingsStep.tag(0)
            preferencesStep.tag(1)
            suggestionsStep.tag(2)
            confirmStep.tag(3)
          }
          .tabViewStyle(.page(indexDisplayMode: .never))

          // Navigation
          navigationButtons
        }
      }
      .navigationTitle("Course Feedback")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .topBarLeading) {
          Button("Cancel") { dismiss() }
            .foregroundColor(.white.opacity(0.6))
        }
      }
    }
  }

  // MARK: - Progress Bar

  private var progressBar: some View {
    HStack(spacing: 8) {
      ForEach(0..<totalSteps, id: \.self) { step in
        RoundedRectangle(cornerRadius: 2)
          .fill(step <= currentStep ? Color(hex: "#7C4DFF") : Color.white.opacity(0.2))
          .frame(height: 4)
      }
    }
    .padding()
  }

  // MARK: - Step 1: Ratings

  private var ratingsStep: some View {
    ScrollView {
      VStack(alignment: .leading, spacing: 24) {
        VStack(alignment: .leading, spacing: 8) {
          Text("Rate Your Experience")
            .font(.title2.bold())
            .foregroundColor(.white)

          Text("How would you rate \(courseName)?")
            .font(.subheadline)
            .foregroundColor(.white.opacity(0.6))
        }

        RatingRow(label: "Overall Experience", rating: $overallRating)
        RatingRow(label: "Clarity of Teaching", rating: $clarityRating)
        RatingRow(label: "Depth of Content", rating: $depthRating)
        RatingRow(label: "Practical Value", rating: $practicalityRating)
        RatingRow(label: "Engagement Level", rating: $engagementRating)
      }
      .padding()
    }
  }

  // MARK: - Step 2: Preferences

  private var preferencesStep: some View {
    ScrollView {
      VStack(alignment: .leading, spacing: 24) {
        VStack(alignment: .leading, spacing: 8) {
          Text("Tell Us More")
            .font(.title2.bold())
            .foregroundColor(.white)

          Text("Help us understand your experience")
            .font(.subheadline)
            .foregroundColor(.white.opacity(0.6))
        }

        // Favorite aspect
        VStack(alignment: .leading, spacing: 12) {
          Text("What was your favorite part?")
            .font(.subheadline.bold())
            .foregroundColor(.white.opacity(0.7))

          ForEach(FavoriteAspect.allCases, id: \.self) { aspect in
            SelectableRow(
              text: aspect.rawValue,
              isSelected: favoriteAspect == aspect,
              action: { favoriteAspect = aspect }
            )
          }
        }

        // Difficulty
        VStack(alignment: .leading, spacing: 12) {
          Text("How was the difficulty level?")
            .font(.subheadline.bold())
            .foregroundColor(.white.opacity(0.7))

          ForEach(DifficultyFeedback.allCases, id: \.self) { level in
            SelectableRow(
              text: level.rawValue,
              isSelected: difficultyLevel == level,
              action: { difficultyLevel = level }
            )
          }
        }

        // Yes/No questions
        Toggle("Would you recommend this course?", isOn: $wouldRecommend)
          .toggleStyle(SwitchToggleStyle(tint: Color(hex: "#7C4DFF")))
          .foregroundColor(.white)
          .padding()
          .background(Color.white.opacity(0.05))
          .cornerRadius(12)

        Toggle("Want more content like this?", isOn: $wantsMoreContent)
          .toggleStyle(SwitchToggleStyle(tint: Color(hex: "#7C4DFF")))
          .foregroundColor(.white)
          .padding()
          .background(Color.white.opacity(0.05))
          .cornerRadius(12)
      }
      .padding()
    }
  }

  // MARK: - Step 3: Suggestions

  private var suggestionsStep: some View {
    ScrollView {
      VStack(alignment: .leading, spacing: 24) {
        VStack(alignment: .leading, spacing: 8) {
          Text("Your Suggestions")
            .font(.title2.bold())
            .foregroundColor(.white)

          Text("Help us improve (optional)")
            .font(.subheadline)
            .foregroundColor(.white.opacity(0.6))
        }

        // What to add
        VStack(alignment: .leading, spacing: 8) {
          Text("What would you add to this course?")
            .font(.subheadline.bold())
            .foregroundColor(.white.opacity(0.7))

          TextEditor(text: $whatToAdd)
            .frame(minHeight: 80)
            .scrollContentBackground(.hidden)
            .background(Color.white.opacity(0.1))
            .cornerRadius(12)
            .foregroundColor(.white)
        }

        // What to change
        VStack(alignment: .leading, spacing: 8) {
          Text("What would you change?")
            .font(.subheadline.bold())
            .foregroundColor(.white.opacity(0.7))

          TextEditor(text: $whatToChange)
            .frame(minHeight: 80)
            .scrollContentBackground(.hidden)
            .background(Color.white.opacity(0.1))
            .cornerRadius(12)
            .foregroundColor(.white)
        }

        // Additional comments
        VStack(alignment: .leading, spacing: 8) {
          Text("Any other feedback?")
            .font(.subheadline.bold())
            .foregroundColor(.white.opacity(0.7))

          TextEditor(text: $additionalComments)
            .frame(minHeight: 80)
            .scrollContentBackground(.hidden)
            .background(Color.white.opacity(0.1))
            .cornerRadius(12)
            .foregroundColor(.white)
        }

        // Suggestions
        VStack(alignment: .leading, spacing: 8) {
          Text("💡 Suggestion ideas:")
            .font(.caption.bold())
            .foregroundColor(.white.opacity(0.5))

          Text(
            "• More real-world examples\n• Deeper historical context\n• Audio versions of lessons\n• Community discussion features\n• Advanced follow-up course"
          )
          .font(.caption)
          .foregroundColor(.white.opacity(0.5))
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(12)
      }
      .padding()
    }
  }

  // MARK: - Step 4: Confirm

  private var confirmStep: some View {
    ScrollView {
      VStack(spacing: 24) {
        // Thank you message
        VStack(spacing: 16) {
          Image(systemName: "heart.fill")
            .font(.system(size: 50))
            .foregroundColor(Color(hex: "#7C4DFF"))

          Text("Thank You!")
            .font(.title.bold())
            .foregroundColor(.white)

          Text("Your feedback helps us create better awakening experiences")
            .font(.subheadline)
            .foregroundColor(.white.opacity(0.6))
            .multilineTextAlignment(.center)
        }
        .padding(.vertical, 20)

        // Summary
        VStack(alignment: .leading, spacing: 16) {
          Text("YOUR FEEDBACK SUMMARY")
            .font(.caption.bold())
            .foregroundColor(.white.opacity(0.5))
            .tracking(1)

          SummaryRow(label: "Overall Rating", value: "\(overallRating)/5 ⭐")
          SummaryRow(label: "Favorite Part", value: favoriteAspect.rawValue)
          SummaryRow(label: "Difficulty", value: difficultyLevel.rawValue)
          SummaryRow(label: "Would Recommend", value: wouldRecommend ? "Yes ✓" : "No")

          if !whatToAdd.isEmpty {
            SummaryRow(label: "Suggested Addition", value: whatToAdd)
          }

          if !whatToChange.isEmpty {
            SummaryRow(label: "Suggested Change", value: whatToChange)
          }
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(16)
      }
      .padding()
    }
  }

  // MARK: - Navigation

  private var navigationButtons: some View {
    HStack(spacing: 16) {
      if currentStep > 0 {
        Button {
          withAnimation { currentStep -= 1 }
        } label: {
          Text("Back")
            .fontWeight(.medium)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.white.opacity(0.1))
            .cornerRadius(12)
        }
      }

      Button {
        if currentStep < totalSteps - 1 {
          withAnimation { currentStep += 1 }
        } else {
          submitFeedback()
        }
      } label: {
        Text(currentStep < totalSteps - 1 ? "Continue" : "Submit Feedback")
          .fontWeight(.semibold)
          .foregroundColor(.black)
          .frame(maxWidth: .infinity)
          .padding()
          .background(
            LinearGradient(
              colors: [Color(hex: "#7C4DFF"), Color(hex: "#E040FB")],
              startPoint: .leading,
              endPoint: .trailing
            )
          )
          .cornerRadius(12)
      }
    }
    .padding()
  }

  private func submitFeedback() {
    let feedback = CourseFeedback(
      id: UUID(),
      courseId: courseId,
      courseName: courseName,
      submittedDate: Date(),
      overallRating: overallRating,
      clarityRating: clarityRating,
      depthRating: depthRating,
      practicalityRating: practicalityRating,
      engagementRating: engagementRating,
      favoriteAspect: favoriteAspect,
      difficultyLevel: difficultyLevel,
      wouldRecommend: wouldRecommend,
      wantsMoreContent: wantsMoreContent,
      whatToAdd: whatToAdd.isEmpty ? nil : whatToAdd,
      whatToChange: whatToChange.isEmpty ? nil : whatToChange,
      additionalComments: additionalComments.isEmpty ? nil : additionalComments
    )

    manager.submitFeedback(feedback)
    onSubmit()
    dismiss()
  }
}

// MARK: - Supporting Views

struct RatingRow: View {
  let label: String
  @Binding var rating: Int

  var body: some View {
    VStack(alignment: .leading, spacing: 8) {
      Text(label)
        .font(.subheadline)
        .foregroundColor(.white.opacity(0.7))

      HStack(spacing: 8) {
        ForEach(1...5, id: \.self) { star in
          Button {
            rating = star
          } label: {
            Image(systemName: star <= rating ? "star.fill" : "star")
              .font(.title2)
              .foregroundColor(star <= rating ? Color(hex: "#FFD700") : .white.opacity(0.3))
          }
        }

        Spacer()

        Text(ratingLabel)
          .font(.caption)
          .foregroundColor(.white.opacity(0.5))
      }
    }
    .padding()
    .background(Color.white.opacity(0.05))
    .cornerRadius(12)
  }

  private var ratingLabel: String {
    switch rating {
    case 1: return "Poor"
    case 2: return "Fair"
    case 3: return "Good"
    case 4: return "Great"
    case 5: return "Excellent"
    default: return ""
    }
  }
}

struct SelectableRow: View {
  let text: String
  let isSelected: Bool
  let action: () -> Void

  var body: some View {
    Button(action: action) {
      HStack {
        Text(text)
          .font(.subheadline)
          .foregroundColor(.white)

        Spacer()

        if isSelected {
          Image(systemName: "checkmark.circle.fill")
            .foregroundColor(Color(hex: "#7C4DFF"))
        } else {
          Image(systemName: "circle")
            .foregroundColor(.white.opacity(0.3))
        }
      }
      .padding()
      .background(isSelected ? Color(hex: "#7C4DFF").opacity(0.2) : Color.white.opacity(0.05))
      .cornerRadius(12)
      .overlay(
        RoundedRectangle(cornerRadius: 12)
          .stroke(isSelected ? Color(hex: "#7C4DFF") : Color.clear, lineWidth: 1)
      )
    }
  }
}

struct SummaryRow: View {
  let label: String
  let value: String

  var body: some View {
    HStack(alignment: .top) {
      Text(label)
        .font(.caption)
        .foregroundColor(.white.opacity(0.5))
        .frame(width: 100, alignment: .leading)

      Text(value)
        .font(.caption)
        .foregroundColor(.white)
    }
  }
}

// MARK: - Course Completion View (with feedback prompt)

struct CourseCompletionView: View {
  let courseId: String
  let courseName: String
  let badge: SacredBadge
  let onContinue: () -> Void

  @State private var showFeedback = false
  @StateObject private var feedbackManager = CourseFeedbackManager.shared

  var body: some View {
    ZStack {
      Color(hex: "#0a0a1a")
        .ignoresSafeArea()

      VStack(spacing: 24) {
        // Celebration
        VStack(spacing: 16) {
          Image(systemName: "crown.fill")
            .font(.system(size: 60))
            .foregroundColor(Color(hex: "#FFD700"))

          Text("Course Complete!")
            .font(.title.bold())
            .foregroundColor(.white)

          Text(courseName)
            .font(.headline)
            .foregroundColor(.white.opacity(0.7))
        }

        // Badge earned
        VStack(spacing: 12) {
          Text("SACRED GEOMETRY EARNED")
            .font(.caption.bold())
            .foregroundColor(Color(hex: "#7C4DFF"))
            .tracking(1)

          SacredGeometryView(shape: badge.shape)
            .frame(width: 80, height: 80)

          Text(badge.shape.rawValue)
            .font(.subheadline)
            .foregroundColor(.white)
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(16)

        Spacer()

        // Actions
        VStack(spacing: 12) {
          if !feedbackManager.hasFeedback(for: courseId) {
            Button {
              showFeedback = true
            } label: {
              HStack {
                Image(systemName: "star.bubble.fill")
                Text("Share Your Feedback")
              }
              .fontWeight(.semibold)
              .foregroundColor(.black)
              .frame(maxWidth: .infinity)
              .padding()
              .background(Color(hex: "#FFD700"))
              .cornerRadius(12)
            }
          }

          Button(action: onContinue) {
            Text("Continue")
              .fontWeight(.medium)
              .foregroundColor(.white)
              .frame(maxWidth: .infinity)
              .padding()
              .background(Color.white.opacity(0.1))
              .cornerRadius(12)
          }
        }
        .padding()
      }
      .padding()
    }
    .sheet(isPresented: $showFeedback) {
      CourseFeedbackView(
        courseId: courseId,
        courseName: courseName,
        onSubmit: {}
      )
    }
  }
}

#Preview("Feedback") {
  CourseFeedbackView(
    courseId: "test",
    courseName: "The Word Is The Sword",
    onSubmit: {}
  )
}
