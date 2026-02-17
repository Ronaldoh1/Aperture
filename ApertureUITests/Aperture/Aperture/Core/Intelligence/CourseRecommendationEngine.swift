// CourseRecommendationEngine.swift
// Intelligence Layer - ML-powered course recommendations
// ☀️ SunFlow: Reignited

import Combine
import SwiftUI

// MARK: - Recommendation Models

struct CourseRecommendation: Identifiable, Equatable {
  let id: String
  let courseId: String
  let title: String
  let subtitle: String
  let icon: String
  let colorHex: String
  let category: String
  let difficulty: String
  let score: Double
  let reasons: [RecommendationReason]

  var color: Color {
    Color(hex: colorHex)
  }

  static func == (lhs: CourseRecommendation, rhs: CourseRecommendation) -> Bool {
    lhs.id == rhs.id
  }
}

struct RecommendationReason: Identifiable {
  let id = UUID()
  let icon: String
  let text: String
  let weight: Double
}

enum RecommendationStrategy: String, CaseIterable {
  case personalizedMix = "For You"
  case continueJourney = "Continue"
  case newExploration = "Discover"
  case deepDive = "Deep Dive"
  case quickWin = "Quick Wins"

  var icon: String {
    switch self {
    case .personalizedMix: return "sparkles"
    case .continueJourney: return "arrow.right.circle"
    case .newExploration: return "safari"
    case .deepDive: return "arrow.down.circle"
    case .quickWin: return "bolt.circle"
    }
  }

  var description: String {
    switch self {
    case .personalizedMix: return "Tailored to your interests"
    case .continueJourney: return "Pick up where you left off"
    case .newExploration: return "Expand your horizons"
    case .deepDive: return "Go deeper on topics you love"
    case .quickWin: return "Short courses for quick progress"
    }
  }
}

// MARK: - Recommendation Engine

@MainActor
class CourseRecommendationEngine: ObservableObject {
  static let shared = CourseRecommendationEngine()

  @Published private(set) var recommendations: [CourseRecommendation] = []
  @Published private(set) var strategyRecommendations:
    [RecommendationStrategy: [CourseRecommendation]] = [:]
  @Published private(set) var isLoading = false
  @Published private(set) var lastUpdated: Date?

  private let analytics = UserBehaviorAnalytics.shared
  private let progressTracker = ProgressTracker.shared

  // Scoring weights
  private let interestWeight = 0.35
  private let categoryWeight = 0.25
  private let difficultyWeight = 0.15
  private let freshnessWeight = 0.15
  private let completionWeight = 0.10

  private init() {
    Task {
      await generateRecommendations()
    }
  }

  // MARK: - Public API

  func refreshRecommendations() async {
    await generateRecommendations()
  }

  func getTopRecommendations(limit: Int = 5) -> [CourseRecommendation] {
    return Array(recommendations.prefix(limit))
  }

  func getRecommendations(for strategy: RecommendationStrategy, limit: Int = 5)
    -> [CourseRecommendation]
  {
    return Array((strategyRecommendations[strategy] ?? []).prefix(limit))
  }

  func getNextRecommendedCourse() -> CourseRecommendation? {
    // Prioritize in-progress courses, then top recommendation
    let inProgress = strategyRecommendations[.continueJourney]?.first
    return inProgress ?? recommendations.first
  }

  // MARK: - Recommendation Generation

  private func generateRecommendations() async {
    isLoading = true
    defer {
      isLoading = false
      lastUpdated = Date()
    }

    let allCourses = CourseCatalog.courses
    let profile = analytics.interestProfile
    let progress = progressTracker.courseProgress

    // Score all courses
    var scoredCourses: [(CourseInfo, Double, [RecommendationReason])] = []

    for course in allCourses {
      let (score, reasons) = calculateScore(for: course, profile: profile, progress: progress)
      scoredCourses.append((course, score, reasons))
    }

    // Sort by score
    scoredCourses.sort { $0.1 > $1.1 }

    // Convert to recommendations
    recommendations = scoredCourses.map { course, score, reasons in
      CourseRecommendation(
        id: course.id,
        courseId: course.id,
        title: course.title,
        subtitle: course.subtitle,
        icon: course.icon,
        colorHex: course.colorHex,
        category: course.category.rawValue,
        difficulty: course.difficulty.rawValue,
        score: score,
        reasons: reasons
      )
    }

    // Generate strategy-specific recommendations
    await generateStrategyRecommendations(
      allCourses: allCourses, profile: profile, progress: progress)
  }

  private func calculateScore(
    for course: CourseInfo,
    profile: UserInterestProfile,
    progress: [TrackedCourseProgress]
  ) -> (Double, [RecommendationReason]) {
    var score: Double = 0
    var reasons: [RecommendationReason] = []

    // 1. Interest alignment
    let interestScore = calculateInterestScore(course: course, profile: profile)
    score += interestScore * interestWeight
    if interestScore > 0.5 {
      reasons.append(
        RecommendationReason(
          icon: "heart.fill",
          text: "Matches your interests",
          weight: interestScore
        ))
    }

    // 2. Category preference
    let categoryScore = profile.categoryScores[course.category.rawValue] ?? 0
    let normalizedCategoryScore = min(categoryScore / 50.0, 1.0)
    score += normalizedCategoryScore * categoryWeight
    if normalizedCategoryScore > 0.3 {
      reasons.append(
        RecommendationReason(
          icon: "folder.fill",
          text: "In your favorite category",
          weight: normalizedCategoryScore
        ))
    }

    // 3. Difficulty alignment
    let difficultyScore = calculateDifficultyScore(course: course, profile: profile)
    score += difficultyScore * difficultyWeight
    if difficultyScore > 0.7 {
      reasons.append(
        RecommendationReason(
          icon: "speedometer",
          text: "Right difficulty for you",
          weight: difficultyScore
        ))
    }

    // 4. Freshness (not started = fresh)
    let isStarted = progress.contains { $0.courseId == course.id }
    let freshnessScore = isStarted ? 0.3 : 1.0
    score += freshnessScore * freshnessWeight
    if !isStarted {
      reasons.append(
        RecommendationReason(
          icon: "sparkles",
          text: "New to explore",
          weight: freshnessScore
        ))
    }

    // 5. Completion potential (shorter = easier to complete)
    let completionScore = calculateCompletionScore(course: course, profile: profile)
    score += completionScore * completionWeight
    if completionScore > 0.7, course.estimatedHours < 2 {
      reasons.append(
        RecommendationReason(
          icon: "clock",
          text: "Quick to complete",
          weight: completionScore
        ))
    }

    // Bonus: In-progress courses get a boost
    if let courseProgress = progress.first(where: { $0.courseId == course.id }),
      !courseProgress.isCompleted
    {
      score += 0.2  // Boost for continuation
      reasons.insert(
        RecommendationReason(
          icon: "arrow.right.circle.fill",
          text: "Continue where you left off",
          weight: 1.0
        ), at: 0)
    }

    // Penalty: Completed courses
    if progress.first(where: { $0.courseId == course.id })?.isCompleted == true {
      score *= 0.3  // Significant reduction for completed
    }

    return (min(score, 1.0), reasons)
  }

  private func calculateInterestScore(course: CourseInfo, profile: UserInterestProfile) -> Double {
    // Extract topics from course title and subtitle
    let courseText = "\(course.title) \(course.subtitle)".lowercased()

    var totalScore: Double = 0
    var matchCount = 0

    for (topic, score) in profile.topicScores {
      if courseText.contains(topic) {
        totalScore += score
        matchCount += 1
      }
    }

    // Normalize
    if matchCount > 0 {
      return min(totalScore / (Double(matchCount) * 50.0), 1.0)
    }

    return 0.2  // Base score for unexplored content
  }

  private func calculateDifficultyScore(course: CourseInfo, profile: UserInterestProfile) -> Double
  {
    let courseDifficulty: Double
    switch course.difficulty {
    case .beginner: courseDifficulty = 0.2
    case .intermediate: courseDifficulty = 0.5
    case .advanced: courseDifficulty = 0.8
    }

    // Higher score when difficulty matches preference
    let difference = abs(courseDifficulty - profile.difficultyPreference)
    return 1.0 - difference
  }

  private func calculateCompletionScore(course: CourseInfo, profile: UserInterestProfile) -> Double
  {
    // Score based on course length vs user's session preference
    let courseMinutes = course.estimatedHours * 60
    let sessionsNeeded = courseMinutes / max(profile.sessionLengthPreference, 5)

    // Favor courses that can be completed in reasonable sessions
    if sessionsNeeded <= 3 {
      return 1.0
    } else if sessionsNeeded <= 7 {
      return 0.7
    } else if sessionsNeeded <= 14 {
      return 0.5
    } else {
      return 0.3
    }
  }

  // MARK: - Strategy-Specific Recommendations

  private func generateStrategyRecommendations(
    allCourses: [CourseInfo],
    profile: UserInterestProfile,
    progress: [TrackedCourseProgress]
  ) async {
    // Continue Journey - In-progress courses
    let inProgress =
      progress
      .filter { !$0.isCompleted }
      .compactMap { prog -> CourseRecommendation? in
        guard let course = allCourses.first(where: { $0.id == prog.courseId }) else { return nil }
        return CourseRecommendation(
          id: course.id,
          courseId: course.id,
          title: course.title,
          subtitle: "\(Int(prog.progress * 100))% complete",
          icon: course.icon,
          colorHex: course.colorHex,
          category: course.category.rawValue,
          difficulty: course.difficulty.rawValue,
          score: prog.progress,
          reasons: [
            RecommendationReason(
              icon: "arrow.right.circle.fill",
              text: "\(prog.lessonsCompleted)/\(prog.totalLessons) lessons done",
              weight: 1.0
            )
          ]
        )
      }
    strategyRecommendations[.continueJourney] = inProgress

    // New Exploration - Courses in categories user hasn't explored
    let exploredCategories = Set(
      progress.compactMap { prog in
        allCourses.first { $0.id == prog.courseId }?.category.rawValue
      })
    let unexplored =
      allCourses
      .filter { !exploredCategories.contains($0.category.rawValue) }
      .filter { course in !progress.contains { prog in prog.courseId == course.id } }
      .prefix(5)
      .map { course in
        CourseRecommendation(
          id: course.id,
          courseId: course.id,
          title: course.title,
          subtitle: course.subtitle,
          icon: course.icon,
          colorHex: course.colorHex,
          category: course.category.rawValue,
          difficulty: course.difficulty.rawValue,
          score: 0.7,
          reasons: [
            RecommendationReason(
              icon: "safari",
              text: "New category to explore",
              weight: 0.8
            )
          ]
        )
      }
    strategyRecommendations[.newExploration] = Array(unexplored)

    // Deep Dive - More courses in user's top category
    if let topCategory = profile.preferredCategory {
      let deepDive =
        allCourses
        .filter { $0.category.rawValue == topCategory }
        .filter { course in
          !progress.contains { prog in prog.courseId == course.id && prog.isCompleted }
        }
        .prefix(5)
        .map { course in
          CourseRecommendation(
            id: course.id,
            courseId: course.id,
            title: course.title,
            subtitle: course.subtitle,
            icon: course.icon,
            colorHex: course.colorHex,
            category: course.category.rawValue,
            difficulty: course.difficulty.rawValue,
            score: 0.8,
            reasons: [
              RecommendationReason(
                icon: "arrow.down.circle",
                text: "More \(topCategory)",
                weight: 0.9
              )
            ]
          )
        }
      strategyRecommendations[.deepDive] = Array(deepDive)
    }

    // Quick Wins - Short courses not yet completed
    let quickWins =
      allCourses
      .filter { $0.estimatedHours <= 2 }
      .filter { course in
        !progress.contains { prog in prog.courseId == course.id && prog.isCompleted }
      }
      .sorted { $0.estimatedHours < $1.estimatedHours }
      .prefix(5)
      .map { course in
        CourseRecommendation(
          id: course.id,
          courseId: course.id,
          title: course.title,
          subtitle: "\(course.estimatedHours)h • \(course.moduleCount) modules",
          icon: course.icon,
          colorHex: course.colorHex,
          category: course.category.rawValue,
          difficulty: course.difficulty.rawValue,
          score: 0.75,
          reasons: [
            RecommendationReason(
              icon: "bolt.circle",
              text: "Complete in one session",
              weight: 0.85
            )
          ]
        )
      }
    strategyRecommendations[.quickWin] = Array(quickWins)

    // Personalized Mix - Top overall recommendations
    strategyRecommendations[.personalizedMix] = Array(recommendations.prefix(5))
  }
}

// MARK: - Recommendation Card View

struct RecommendationCard: View {
  let recommendation: CourseRecommendation
  let onTap: () -> Void

  var body: some View {
    Button(action: onTap) {
      HStack(spacing: 14) {
        // Icon
        ZStack {
          RoundedRectangle(cornerRadius: 12)
            .fill(recommendation.color.opacity(0.15))
            .frame(width: 56, height: 56)

          Image(systemName: recommendation.icon)
            .font(.system(size: 24))
            .foregroundColor(recommendation.color)
        }

        VStack(alignment: .leading, spacing: 4) {
          Text(recommendation.title)
            .font(.system(size: 16, weight: .semibold, design: .rounded))
            .foregroundColor(Palette.text.primary)
            .lineLimit(1)

          Text(recommendation.subtitle)
            .font(.system(size: 13, weight: .medium))
            .foregroundColor(Palette.text.secondary)
            .lineLimit(1)

          // Top reason
          if let reason = recommendation.reasons.first {
            HStack(spacing: 4) {
              Image(systemName: reason.icon)
                .font(.system(size: 10))
              Text(reason.text)
                .font(.system(size: 11, weight: .medium))
            }
            .foregroundColor(recommendation.color)
          }
        }

        Spacer()

        // Match score indicator
        VStack(spacing: 2) {
          Text("\(Int(recommendation.score * 100))%")
            .font(.system(size: 14, weight: .bold, design: .rounded))
            .foregroundColor(recommendation.color)
          Text("match")
            .font(.system(size: 9, weight: .medium))
            .foregroundColor(Palette.text.muted)
        }

        Image(systemName: "chevron.right")
          .font(.system(size: 14, weight: .semibold))
          .foregroundColor(Palette.text.muted)
      }
      .padding(14)
      .background(
        RoundedRectangle(cornerRadius: 16)
          .fill(Color.white.opacity(0.04))
          .overlay(
            RoundedRectangle(cornerRadius: 16)
              .stroke(recommendation.color.opacity(0.2), lineWidth: 1)
          )
      )
    }
    .buttonStyle(ScaleButtonStyle())
    .accessibilityElement(children: .combine)
    .accessibilityLabel(
      "\(recommendation.title). \(recommendation.subtitle). \(Int(recommendation.score * 100)) percent match."
    )
    .accessibilityHint("Double tap to open course")
  }
}

// MARK: - Recommendations Section View

struct RecommendationsSection: View {
  @StateObject private var engine = CourseRecommendationEngine.shared
  @State private var selectedStrategy: RecommendationStrategy = .personalizedMix
  let onCourseSelected: (String) -> Void

  var body: some View {
    VStack(alignment: .leading, spacing: 16) {
      // Header
      HStack {
        VStack(alignment: .leading, spacing: 2) {
          Text("RECOMMENDED FOR YOU")
            .font(.system(size: 11, weight: .bold, design: .rounded))
            .tracking(2)
            .foregroundColor(Palette.text.muted)

          if engine.isLoading {
            Text("Analyzing your interests...")
              .font(.system(size: 12))
              .foregroundColor(Palette.primary.cyan)
          }
        }

        Spacer()

        Button {
          Task { await engine.refreshRecommendations() }
        } label: {
          Image(systemName: "arrow.clockwise")
            .font(.system(size: 14))
            .foregroundColor(Palette.text.muted)
            .rotationEffect(.degrees(engine.isLoading ? 360 : 0))
            .animation(
              engine.isLoading ? .linear(duration: 1).repeatForever(autoreverses: false) : .default,
              value: engine.isLoading)
        }
      }

      // Strategy pills
      ScrollView(.horizontal, showsIndicators: false) {
        HStack(spacing: 10) {
          ForEach(RecommendationStrategy.allCases, id: \.self) { strategy in
            StrategyPill(
              strategy: strategy,
              isSelected: selectedStrategy == strategy,
              count: engine.strategyRecommendations[strategy]?.count ?? 0
            ) {
              withAnimation(.spring(response: 0.3)) {
                selectedStrategy = strategy
              }
            }
          }
        }
      }

      // Recommendations list
      let recs = engine.getRecommendations(for: selectedStrategy, limit: 5)

      if recs.isEmpty {
        emptyState
      } else {
        ForEach(recs) { rec in
          RecommendationCard(recommendation: rec) {
            onCourseSelected(rec.courseId)
          }
        }
      }
    }
  }

  private var emptyState: some View {
    VStack(spacing: 12) {
      Image(systemName: selectedStrategy.icon)
        .font(.system(size: 32))
        .foregroundColor(Palette.text.muted)

      Text("No recommendations yet")
        .font(.system(size: 15, weight: .medium))
        .foregroundColor(Palette.text.secondary)

      Text("Start exploring courses to get personalized suggestions")
        .font(.system(size: 13))
        .foregroundColor(Palette.text.muted)
        .multilineTextAlignment(.center)
    }
    .frame(maxWidth: .infinity)
    .padding(.vertical, 40)
  }
}

struct StrategyPill: View {
  let strategy: RecommendationStrategy
  let isSelected: Bool
  let count: Int
  let action: () -> Void

  var body: some View {
    Button(action: action) {
      HStack(spacing: 6) {
        Image(systemName: strategy.icon)
          .font(.system(size: 12))

        Text(strategy.rawValue)
          .font(.system(size: 13, weight: .medium))

        if count > 0 {
          Text("\(count)")
            .font(.system(size: 11, weight: .bold))
            .padding(.horizontal, 6)
            .padding(.vertical, 2)
            .background(
              Capsule()
                .fill(isSelected ? Color.white.opacity(0.2) : Palette.primary.cyan.opacity(0.3))
            )
        }
      }
      .foregroundColor(isSelected ? .white : Palette.text.secondary)
      .padding(.horizontal, 14)
      .padding(.vertical, 8)
      .background(
        Capsule()
          .fill(isSelected ? Palette.primary.cyan : Color.white.opacity(0.05))
      )
    }
    .buttonStyle(PlainButtonStyle())
  }
}

#Preview {
  ZStack {
    Color.black.ignoresSafeArea()
    ScrollView {
      RecommendationsSection { courseId in
        print("Selected: \(courseId)")
      }
      .padding()
    }
  }
}
