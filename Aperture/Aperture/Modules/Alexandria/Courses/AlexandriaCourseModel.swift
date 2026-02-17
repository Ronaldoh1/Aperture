// AlexandriaCourseModel.swift
// Shared model for all Alexandria expansion courses
// ☀️ SunFlow: Reignited

import SwiftUI

// MARK: - Course Definition

struct AlexandriaCourse: Identifiable {
  let id: String
  let title: String
  let subtitle: String
  let icon: String
  let colorHex: String
  let tier: Int  // 1-5 tier gating
  let isPremium: Bool
  let isUltraPremium: Bool
  let modules: [ACModule]
  let sources: [String]
  let dragonComment: String

  var color: Color {
    Color(hex: colorHex)
  }

  var moduleCount: Int {
    modules.count
  }

  var lessonCount: Int {
    modules.reduce(0) { $0 + $1.lessons.count }
  }

  var estimatedHours: Double {
    Double(lessonCount) * 0.25
  }
}

// MARK: - Module

struct ACModule: Identifiable {
  let id: String
  let number: Int
  let title: String
  let subtitle: String
  let icon: String
  let lessons: [ACLesson]
}

extension ACModule: Equatable {
  static func == (lhs: ACModule, rhs: ACModule) -> Bool {
    lhs.id == rhs.id
  }
}

extension ACModule: Hashable {
  func hash(into hasher: inout Hasher) {
    hasher.combine(id)
  }
}

// MARK: - Lesson

struct ACLesson: Identifiable {
  let id: String
  let title: String
  let content: String
  let keyInsight: String
  let practice: String
  let interactiveElement: InteractiveElement?

  init(
    id: String, title: String, content: String, keyInsight: String, practice: String,
    interactiveElement: InteractiveElement? = nil
  ) {
    self.id = id
    self.title = title
    self.content = content
    self.keyInsight = keyInsight
    self.practice = practice
    self.interactiveElement = interactiveElement
  }
}

extension ACLesson: Equatable {
  static func == (lhs: ACLesson, rhs: ACLesson) -> Bool {
    lhs.id == rhs.id
  }
}

extension ACLesson: Hashable {
  func hash(into hasher: inout Hasher) {
    hasher.combine(id)
  }
}

// MARK: - Interactive Elements

enum InteractiveElement {
  case inversionTable(rows: [(told: String, truth: String)])
  case symbolDecoder(elements: [(symbol: String, fear: String, truth: String)])
  case timeline(events: [(year: String, event: String, significance: String)])
  case comparison(left: String, right: String, rows: [(leftVal: String, rightVal: String)])
  case quiz(questions: [(question: String, options: [String], correctIndex: Int)])
  case reflectionPrompt(prompts: [String])
  case bilingualText(spanish: String, english: String)
}

// MARK: - Course Registry

enum AlexandriaCourseRegistry {
  static let allCourses: [AlexandriaCourse] = [
    AntiChristDecodedCourse.course,
    BaphometMirrorCourse.course,
    GospelOfJudasCourse.course,
    GuiltAndPowerCourse.course,
    TwelvePlusOneCourse.course,
    CrossSolarPortalCourse.course,
    CrucifixionInitiationCourse.course,
    AnunnakiCourse.course,
    NephilimWatchersCourse.course,
    ElohimCourse.course,
    UrantiaGaiaCourse.course,
    ChristConsciousnessCourse.course,
    TonantzinCourse.course,
    LemuriaAtlantisCourse.course,
    TarotArcanaCourse.course,
    AbracadabraCourse.course,
    OneFortyFourThousandCourse.course,
    AlchemyCourse.course,
    AntarcticaCourse.course,
    FourthTurningCourse.course,
    MoneyDecodedCourse.course,
  ]

  static func course(for id: String) -> AlexandriaCourse? {
    allCourses.first { $0.id == id }
  }
}
