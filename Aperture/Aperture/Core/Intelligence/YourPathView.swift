// YourPathView.swift
// Intelligence Layer - Personalized learning path feed
// ☀️ SunFlow: Reignited

import SwiftUI

struct YourPathView: View {
  @Environment(\.dismiss) var dismiss
  @StateObject private var engine = CourseRecommendationEngine.shared
  @StateObject private var analytics = UserBehaviorAnalytics.shared
  @StateObject private var progress = ProgressTracker.shared

  @State private var selectedCourseId: String?
  @State private var showingCourseHub = false
  @State private var animateHeader = false

  var body: some View {
    NavigationStack {
      ZStack {
        // Background
        LinearGradient(
          colors: [
            Color.black,
            Color(hex: "0a0a1a"),
            Color(hex: "0f0a15"),
            Color.black,
          ],
          startPoint: .top,
          endPoint: .bottom
        )
        .ignoresSafeArea()

        ScrollView(showsIndicators: false) {
          VStack(spacing: 28) {
            headerSection

            insightCards

            continueSection

            recommendationsSection

            explorationSection

            Spacer(minLength: 100)
          }
          .padding(.horizontal, 20)
          .padding(.top, 10)
        }
      }
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarLeading) {
          Button {
            dismiss()
          } label: {
            HStack(spacing: 4) {
              Image(systemName: "chevron.left")
              Text("Back")
            }
            .foregroundColor(Palette.primary.cyan)
          }
        }

        ToolbarItem(placement: .navigationBarTrailing) {
          Button {
            showingCourseHub = true
          } label: {
            Image(systemName: "square.grid.2x2")
              .foregroundColor(Palette.text.secondary)
          }
        }
      }
      .sheet(isPresented: $showingCourseHub) {
        CourseHubView()
      }
      .onAppear {
        analytics.trackScreenViewed("your_path")
        withAnimation(.easeOut(duration: 0.8)) {
          animateHeader = true
        }
      }
    }
  }

  // MARK: - Header

  private var headerSection: some View {
    VStack(spacing: 16) {
      HStack {
        VStack(alignment: .leading, spacing: 4) {
          Text(greetingText)
            .font(.system(size: 14, weight: .medium))
            .foregroundColor(Palette.text.secondary)

          Text("Your Path")
            .font(.system(size: 28, weight: .bold, design: .rounded))
            .foregroundColor(Palette.text.primary)
        }

        Spacer()

        ZStack {
          Circle()
            .fill(engagementColor.opacity(0.2))
            .frame(width: 50, height: 50)

          Image(systemName: engagementIcon)
            .font(.system(size: 22))
            .foregroundColor(engagementColor)
        }
      }

      insightMessage
    }
    .opacity(animateHeader ? 1 : 0)
    .offset(y: animateHeader ? 0 : 20)
  }

  private var greetingText: String {
    let hour = Calendar.current.component(.hour, from: Date())
    if hour < 12 {
      return "Good morning"
    } else if hour < 17 {
      return "Good afternoon"
    } else {
      return "Good evening"
    }
  }

  private var engagementIcon: String {
    switch analytics.getEngagementLevel() {
    case "Dedicated": return "flame.fill"
    case "Regular": return "bolt.fill"
    default: return "leaf.fill"
    }
  }

  private var engagementColor: Color {
    switch analytics.getEngagementLevel() {
    case "Dedicated": return .orange
    case "Regular": return Palette.primary.cyan
    default: return .green
    }
  }

  private var insightMessage: some View {
    HStack(alignment: .top, spacing: 10) {
      Image(systemName: "sparkles")
        .font(.system(size: 16))
        .foregroundColor(Palette.accent.gold)

      Text(generateInsight())
        .font(.system(size: 14, weight: .medium, design: .rounded))
        .foregroundColor(Palette.text.secondary)
        .lineSpacing(4)
    }
    .padding(14)
    .background(
      RoundedRectangle(cornerRadius: 14)
        .fill(Palette.accent.gold.opacity(0.08))
        .overlay(
          RoundedRectangle(cornerRadius: 14)
            .stroke(Palette.accent.gold.opacity(0.2), lineWidth: 1)
        )
    )
  }

  private func generateInsight() -> String {
    let interests = analytics.getTopInterests(limit: 2)
    let streak = progress.stats.currentStreak

    if streak >= 7 {
      return "You're on a \(streak)-day streak. Consistency builds mastery."
    } else if interests.isEmpty {
      return "Start exploring to discover content tailored to your interests."
    } else {
      return
        "Based on your interest in \(interests.first ?? "learning"), we've curated recommendations for you."
    }
  }

  // MARK: - Insight Cards

  private var insightCards: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack(spacing: 12) {
        InsightCard(
          icon: "flame.fill", value: "\(progress.stats.currentStreak)", label: "Day Streak",
          color: .orange)
        InsightCard(
          icon: "checkmark.circle.fill", value: "\(progress.stats.lessonsCompleted)",
          label: "Lessons Done", color: .green)
        InsightCard(
          icon: "speedometer", value: analytics.getRecommendedDifficulty(), label: "Your Level",
          color: Palette.primary.cyan)
        InsightCard(
          icon: engagementIcon, value: analytics.getEngagementLevel(), label: "Engagement",
          color: engagementColor)
      }
      .padding(.horizontal, 4)
    }
  }

  // MARK: - Continue Section

  private var continueSection: some View {
    let inProgress = engine.getRecommendations(for: .continueJourney, limit: 3)

    return Group {
      if !inProgress.isEmpty {
        VStack(alignment: .leading, spacing: 14) {
          SectionHeader(
            icon: "arrow.right.circle.fill", title: "CONTINUE", color: Palette.accent.gold)

          ForEach(inProgress) { rec in
            ContinueCourseCard(recommendation: rec) {
              selectedCourseId = rec.courseId
            }
          }
        }
      }
    }
  }

  // MARK: - Recommendations Section

  private var recommendationsSection: some View {
    VStack(alignment: .leading, spacing: 14) {
      HStack {
        SectionHeader(icon: "sparkles", title: "RECOMMENDED FOR YOU", color: Palette.primary.cyan)
        Spacer()
        if engine.isLoading {
          ProgressView().scaleEffect(0.7).tint(Palette.primary.cyan)
        }
      }

      let recs = engine.getTopRecommendations(limit: 4)

      if recs.isEmpty {
        emptyRecommendations
      } else {
        ForEach(recs) { rec in
          RecommendationCard(recommendation: rec) {
            selectedCourseId = rec.courseId
          }
        }
      }
    }
  }

  private var emptyRecommendations: some View {
    VStack(spacing: 12) {
      Image(systemName: "wand.and.stars")
        .font(.system(size: 36))
        .foregroundColor(Palette.text.muted)

      Text("Building your recommendations...")
        .font(.system(size: 15, weight: .medium))
        .foregroundColor(Palette.text.secondary)

      Text("Start exploring to see personalized suggestions")
        .font(.system(size: 13))
        .foregroundColor(Palette.text.muted)

      Button {
        showingCourseHub = true
      } label: {
        Text("Browse All Courses")
          .font(.system(size: 14, weight: .semibold))
          .foregroundColor(.white)
          .padding(.horizontal, 20)
          .padding(.vertical, 10)
          .background(Capsule().fill(Palette.primary.cyan))
      }
      .padding(.top, 8)
    }
    .frame(maxWidth: .infinity)
    .padding(.vertical, 30)
  }

  // MARK: - Exploration Section

  private var explorationSection: some View {
    let quickWins = engine.getRecommendations(for: .quickWin, limit: 3)
    let explore = engine.getRecommendations(for: .newExploration, limit: 3)

    return VStack(alignment: .leading, spacing: 20) {
      if !quickWins.isEmpty {
        VStack(alignment: .leading, spacing: 12) {
          SectionHeader(icon: "bolt.circle.fill", title: "QUICK WINS", color: .yellow)

          ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
              ForEach(quickWins) { rec in
                CompactCourseCard(recommendation: rec) { selectedCourseId = rec.courseId }
              }
            }
          }
        }
      }

      if !explore.isEmpty {
        VStack(alignment: .leading, spacing: 12) {
          SectionHeader(icon: "safari.fill", title: "EXPLORE NEW", color: Palette.primary.violet)

          ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
              ForEach(explore) { rec in
                CompactCourseCard(recommendation: rec) { selectedCourseId = rec.courseId }
              }
            }
          }
        }
      }
    }
  }
}

// MARK: - Components

struct SectionHeader: View {
  let icon: String
  let title: String
  let color: Color

  var body: some View {
    HStack {
      Image(systemName: icon)
        .foregroundColor(color)
      Text(title)
        .font(.system(size: 11, weight: .bold, design: .rounded))
        .tracking(2)
        .foregroundColor(color)
    }
  }
}

struct InsightCard: View {
  let icon: String
  let value: String
  let label: String
  let color: Color

  var body: some View {
    VStack(spacing: 8) {
      HStack(spacing: 6) {
        Image(systemName: icon)
          .font(.system(size: 14))
          .foregroundColor(color)
        Text(value)
          .font(.system(size: 18, weight: .bold, design: .rounded))
          .foregroundColor(Palette.text.primary)
      }
      Text(label)
        .font(.system(size: 11, weight: .medium))
        .foregroundColor(Palette.text.muted)
    }
    .frame(width: 100)
    .padding(.vertical, 14)
    .background(
      RoundedRectangle(cornerRadius: 14)
        .fill(color.opacity(0.1))
        .overlay(RoundedRectangle(cornerRadius: 14).stroke(color.opacity(0.2), lineWidth: 1))
    )
  }
}

struct ContinueCourseCard: View {
  let recommendation: CourseRecommendation
  let action: () -> Void

  var body: some View {
    Button(action: action) {
      HStack(spacing: 14) {
        ZStack {
          Circle()
            .stroke(recommendation.color.opacity(0.2), lineWidth: 4)
            .frame(width: 50, height: 50)
          Circle()
            .trim(from: 0, to: recommendation.score)
            .stroke(recommendation.color, style: StrokeStyle(lineWidth: 4, lineCap: .round))
            .frame(width: 50, height: 50)
            .rotationEffect(.degrees(-90))
          Image(systemName: recommendation.icon)
            .font(.system(size: 18))
            .foregroundColor(recommendation.color)
        }

        VStack(alignment: .leading, spacing: 4) {
          Text(recommendation.title)
            .font(.system(size: 15, weight: .semibold, design: .rounded))
            .foregroundColor(Palette.text.primary)
          Text(recommendation.subtitle)
            .font(.system(size: 13, weight: .medium))
            .foregroundColor(recommendation.color)
        }

        Spacer()

        Image(systemName: "play.circle.fill")
          .font(.system(size: 28))
          .foregroundColor(recommendation.color)
      }
      .padding(14)
      .background(
        RoundedRectangle(cornerRadius: 16)
          .fill(recommendation.color.opacity(0.1))
          .overlay(
            RoundedRectangle(cornerRadius: 16).stroke(
              recommendation.color.opacity(0.3), lineWidth: 1))
      )
    }
    .buttonStyle(ScaleButtonStyle())
  }
}

struct CompactCourseCard: View {
  let recommendation: CourseRecommendation
  let action: () -> Void

  var body: some View {
    Button(action: action) {
      VStack(alignment: .leading, spacing: 10) {
        ZStack {
          RoundedRectangle(cornerRadius: 10)
            .fill(recommendation.color.opacity(0.15))
            .frame(width: 44, height: 44)
          Image(systemName: recommendation.icon)
            .font(.system(size: 20))
            .foregroundColor(recommendation.color)
        }

        VStack(alignment: .leading, spacing: 2) {
          Text(recommendation.title)
            .font(.system(size: 14, weight: .semibold, design: .rounded))
            .foregroundColor(Palette.text.primary)
            .lineLimit(2)
            .multilineTextAlignment(.leading)
          Text(recommendation.category)
            .font(.system(size: 11, weight: .medium))
            .foregroundColor(Palette.text.muted)
        }
      }
      .frame(width: 140)
      .padding(12)
      .background(
        RoundedRectangle(cornerRadius: 14)
          .fill(Color.white.opacity(0.04))
          .overlay(
            RoundedRectangle(cornerRadius: 14).stroke(
              recommendation.color.opacity(0.2), lineWidth: 1))
      )
    }
    .buttonStyle(ScaleButtonStyle())
  }
}

#Preview {
  YourPathView()
}
