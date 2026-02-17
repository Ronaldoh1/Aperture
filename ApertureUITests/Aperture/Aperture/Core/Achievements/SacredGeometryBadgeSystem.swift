// SacredGeometryBadgeSystem.swift
// Aperture
//
// Sacred Geometry Rewards for Course Completion
// Each course awards a SPECIFIC geometry (same for all users)
// Customizable colors, save to device, share to social media

import Photos
import SwiftUI
import UIKit

// MARK: - Sacred Geometry Shape Enum

enum SacredGeometryShape: String, CaseIterable, Codable {
  case vesicaPiscis = "Vesica Piscis"
  case seedOfLife = "Seed of Life"
  case flowerOfLife = "Flower of Life"
  case hexagram = "Hexagram"
  case metatronsCube = "Metatron's Cube"
  case infinityLoop = "Infinity Loop"
  case tetrahedron = "Tetrahedron"
  case hexahedron = "Hexahedron"
  case octahedron = "Octahedron"
  case icosahedron = "Icosahedron"
  case dodecahedron = "Dodecahedron"
  case torus = "Torus"
  case goldenSpiral = "Golden Spiral"
  case treeOfLife = "Tree of Life"
  case sriYantra = "Sri Yantra"
  case shriYantra = "Shri Yantra"
  case merkabaField = "Merkaba Field"
  case cosmicEgg = "Cosmic Egg"
  case yantra64 = "64 Tetrahedron"
  case platoniSolids = "Platonic Solids"

  var complexity: Int {
    switch self {
    case .vesicaPiscis, .seedOfLife, .infinityLoop: return 1
    case .tetrahedron, .hexahedron, .hexagram: return 2
    case .flowerOfLife, .octahedron, .torus: return 3
    case .goldenSpiral, .icosahedron, .dodecahedron: return 4
    case .metatronsCube, .treeOfLife, .merkabaField: return 5
    case .sriYantra, .shriYantra, .platoniSolids: return 6
    case .cosmicEgg, .yantra64: return 7
    }
  }

  var gnosticMeaning: String {
    switch self {
    case .vesicaPiscis:
      return
        "The womb of creation. Where two circles intersect, new reality is born. The portal between worlds."
    case .seedOfLife:
      return
        "The seven days of creation encoded in geometry. Each circle represents a stage of cosmic manifestation."
    case .flowerOfLife:
      return
        "The blueprint of the universe. All forms emerge from this pattern. Contains the Platonic solids within."
    case .hexagram:
      return
        "As above, so below. The union of masculine and feminine principles. The seal of Solomon."
    case .metatronsCube:
      return
        "The throne of God. Contains all Platonic solids. The key to understanding matter and spirit."
    case .infinityLoop:
      return "The eternal return. No beginning, no end. The continuous flow of consciousness."
    case .tetrahedron:
      return
        "Fire element. The simplest Platonic solid. Represents divine masculine energy and willpower."
    case .hexahedron:
      return "Earth element. Stability and foundation. The grounding of spirit into matter."
    case .octahedron:
      return "Air element. The heart chakra shape. Bridge between physical and spiritual realms."
    case .icosahedron:
      return "Water element. Emotional fluidity. The shape of consciousness in flow state."
    case .dodecahedron:
      return "Ether/Spirit element. The universe container. Plato's shape of the cosmos itself."
    case .torus:
      return
        "The shape of the universe. Energy flows in, folds through center, emerges transformed."
    case .goldenSpiral:
      return
        "The fingerprint of God. Found in galaxies, shells, and DNA. The pattern of natural growth."
    case .treeOfLife:
      return
        "The map of consciousness. Ten spheres connected by 22 paths. The Kabbalistic key to creation."
    case .sriYantra, .shriYantra:
      return
        "The supreme yantra. Nine interlocking triangles create 43 smaller triangles. The cosmos in geometry."
    case .merkabaField:
      return "The light body vehicle. Counter-rotating tetrahedrons activate dimensional travel."
    case .cosmicEgg:
      return
        "The primordial form. All potential contained before manifestation. You have returned to source."
    case .yantra64:
      return
        "The 64 tetrahedron grid. The structure of the vacuum. Nassim Haramein's unified field geometry."
    case .platoniSolids:
      return
        "The five perfect forms. Earth, Water, Fire, Air, and Ether. The building blocks of reality."
    }
  }

  var sfSymbol: String {
    switch self {
    case .vesicaPiscis: return "circle.lefthalf.filled"
    case .seedOfLife: return "seal"
    case .flowerOfLife: return "seal.fill"
    case .hexagram: return "star.fill"
    case .metatronsCube: return "cube.transparent"
    case .infinityLoop: return "infinity"
    case .tetrahedron: return "triangle"
    case .hexahedron: return "square"
    case .octahedron: return "diamond"
    case .icosahedron: return "pentagon"
    case .dodecahedron: return "hexagon"
    case .torus: return "circle.circle"
    case .goldenSpiral: return "hurricane"
    case .treeOfLife: return "tree"
    case .sriYantra, .shriYantra: return "star.circle.fill"
    case .merkabaField: return "pyramid"
    case .cosmicEgg: return "oval.fill"
    case .yantra64: return "cube.fill"
    case .platoniSolids: return "squares.leadinghalf.filled"
    }
  }
}

// MARK: - Course to Geometry Mapping

/// Defines which sacred geometry each course/lesson awards
/// All users completing the same lesson get the SAME geometry
enum CourseGeometryMapping {
  /// Get the specific geometry for a lesson
  static func geometry(for lessonId: String) -> SacredGeometryShape {
    // Etymology Course Mappings
    let etymologyMappings: [String: SacredGeometryShape] = [
      "etym0_1": .vesicaPiscis,  // Words Are Spells
      "etym0_2": .metatronsCube,  // Legal Word Prison
      "etym0_3": .flowerOfLife,  // Sound Creates Form
      "etym1_1": .sriYantra,  // God Names Hidden
      "etym1_2": .tetrahedron,  // Latin/Greek Controllers
      "etym1_3": .treeOfLife,  // Proto-Indo-European
      "etym2_1": .icosahedron,  // Negative Self-Curses
      "etym2_2": .seedOfLife,  // I AM Power
      "etym2_3": .merkabaField,  // Questions
      "etym3_1": .octahedron,  // Programming Words
      "etym3_2": .dodecahedron,  // Vocabulary as Reality
      "etym4_1": .torus,  // Science of Mantras
      "etym4_2": .hexagram,  // Creating Power Mantras
      "etym5_1": .shriYantra,  // The Verbal Fast
      "etym5_2": .cosmicEgg,  // Word Master Graduation
    ]

    // GodMode Esoteric Course Mappings
    let godModeMappings: [String: SacredGeometryShape] = [
      "gm0_1": .seedOfLife,  // Welcome to GodMode
      "gm0_2": .vesicaPiscis,  // Your Toolkit
      "gm0_3": .tetrahedron,  // Three Commitments
      "gm1_1": .flowerOfLife,  // Ra: Original Authority
      "gm1_2": .hexagram,  // Solar Coding
      "gm1_3": .torus,  // Pineal Activation
      "gm2_1": .octahedron,  // Death as Teacher
      "gm2_2": .icosahedron,  // Bardo Navigation
      "gm2_3": .metatronsCube,  // Rebirth Protocol
      "gm3_1": .sriYantra,  // Addiction Alchemy
      "gm3_2": .treeOfLife,  // Transmutation
      "gm4_1": .merkabaField,  // Masonic Laws
      "gm4_2": .dodecahedron,  // Reality Architecture
      "gm5_1": .goldenSpiral,  // 3-6-9 Vortex
      "gm5_2": .yantra64,  // Tesla Encoding
      "gm6_1": .platoniSolids,  // Integration
      "gm6_2": .cosmicEgg,  // GODMODE UNLOCKED
    ]

    // Check mappings
    if let shape = etymologyMappings[lessonId] {
      return shape
    }
    if let shape = godModeMappings[lessonId] {
      return shape
    }

    // Fallback: Generate deterministic geometry based on lesson ID hash
    let hash = abs(lessonId.hashValue)
    let allShapes = SacredGeometryShape.allCases
    return allShapes[hash % allShapes.count]
  }

  /// Get course completion badge (final lesson of each course)
  static func completionGeometry(for courseId: String) -> SacredGeometryShape {
    switch courseId {
    case "godmode_etymology": return .cosmicEgg
    case "godmode_esoteric": return .cosmicEgg
    case "consciousness_course": return .flowerOfLife
    case "pattern_recognition": return .metatronsCube
    case "psyop_detection": return .sriYantra
    default: return .seedOfLife
    }
  }
}

// MARK: - Badge Manager

@MainActor
final class SacredBadgeManager: ObservableObject {
  static let shared = SacredBadgeManager()

  @Published var earnedBadges: [SacredBadge] = []
  @Published var recentlyEarnedBadge: SacredBadge?
  @Published var showBadgeAnimation = false

  private let defaults = UserDefaults.standard
  private let badgesKey = "sacred_geometry_badges"

  // MARK: - Initialization

  init() {
    loadBadges()
  }

  // MARK: - Badge Award

  /// Award the SPECIFIC badge for this lesson (same for all users)
  func awardBadge(forLesson lessonId: String, lessonTitle: String, courseId: String) -> SacredBadge
  {
    // Get the deterministic geometry for this lesson
    let shape = CourseGeometryMapping.geometry(for: lessonId)

    let badge = SacredBadge(
      id: UUID(),
      lessonId: lessonId,
      shape: shape,
      earnedFrom: courseId,
      lessonTitle: lessonTitle,
      earnedDate: Date(),
      customColors: nil
    )

    earnedBadges.append(badge)
    recentlyEarnedBadge = badge
    showBadgeAnimation = true
    saveBadges()

    return badge
  }

  /// Award course completion badge
  func awardCompletionBadge(courseId: String, courseName: String) -> SacredBadge {
    let shape = CourseGeometryMapping.completionGeometry(for: courseId)

    let badge = SacredBadge(
      id: UUID(),
      lessonId: "\(courseId)_complete",
      shape: shape,
      earnedFrom: courseId,
      lessonTitle: "\(courseName) - COMPLETE",
      earnedDate: Date(),
      customColors: nil
    )

    earnedBadges.append(badge)
    recentlyEarnedBadge = badge
    showBadgeAnimation = true
    saveBadges()

    return badge
  }

  /// Update badge colors
  func updateBadgeColors(_ badgeId: UUID, colors: BadgeCustomColors) {
    if let index = earnedBadges.firstIndex(where: { $0.id == badgeId }) {
      earnedBadges[index].customColors = colors
      saveBadges()
    }
  }

  // MARK: - Queries

  func uniqueShapesEarned() -> Set<SacredGeometryShape> {
    Set(earnedBadges.map { $0.shape })
  }

  func badgesFromCourse(_ courseId: String) -> [SacredBadge] {
    earnedBadges.filter { $0.earnedFrom == courseId }
  }

  func hasBadge(forLesson lessonId: String) -> Bool {
    earnedBadges.contains { $0.lessonId == lessonId }
  }

  var totalBadgeCount: Int {
    earnedBadges.count
  }

  var collectionProgress: Double {
    Double(uniqueShapesEarned().count) / Double(SacredGeometryShape.allCases.count)
  }

  // MARK: - Persistence

  private func loadBadges() {
    guard let data = defaults.data(forKey: badgesKey),
      let decoded = try? JSONDecoder().decode([SacredBadge].self, from: data)
    else {
      return
    }
    earnedBadges = decoded
  }

  private func saveBadges() {
    if let encoded = try? JSONEncoder().encode(earnedBadges) {
      defaults.set(encoded, forKey: badgesKey)
    }
  }

  func dismissBadgeAnimation() {
    showBadgeAnimation = false
    recentlyEarnedBadge = nil
  }
}

// MARK: - Sacred Badge Model

struct SacredBadge: Identifiable, Codable {
  let id: UUID
  let lessonId: String
  let shape: SacredGeometryShape
  let earnedFrom: String  // Course ID
  let lessonTitle: String
  let earnedDate: Date
  var customColors: BadgeCustomColors?

  var lineColor: Color {
    if let custom = customColors {
      return Color(hex: custom.lineColorHex)
    }
    return Color(hex: "#FFD700")  // Default gold
  }

  var backgroundColor: Color {
    if let custom = customColors {
      return Color(hex: custom.backgroundColorHex)
    }
    return Color(hex: "#0a0a1a")  // Default dark
  }

  var glowColor: Color {
    if let custom = customColors {
      return Color(hex: custom.glowColorHex)
    }
    return Color(hex: "#7C4DFF")  // Default purple
  }
}

struct BadgeCustomColors: Codable {
  var lineColorHex: String
  var backgroundColorHex: String
  var glowColorHex: String
}

// MARK: - Badge Award Animation View

struct BadgeAwardView: View {
  @ObservedObject var manager = SacredBadgeManager.shared
  @State private var showDetails = false
  @State private var rotation: Double = 0
  @State private var scale: CGFloat = 0.3
  @State private var opacity: Double = 0

  var body: some View {
    if manager.showBadgeAnimation, let badge = manager.recentlyEarnedBadge {
      ZStack {
        // Background blur
        Color.black.opacity(0.8)
          .ignoresSafeArea()
          .onTapGesture {
            dismissWithAnimation()
          }

        VStack(spacing: 24) {
          // Glowing geometry
          ZStack {
            // Outer glow
            Circle()
              .fill(
                RadialGradient(
                  colors: [
                    badge.lineColor.opacity(0.5),
                    badge.glowColor.opacity(0.3),
                    Color.clear,
                  ],
                  center: .center,
                  startRadius: 50,
                  endRadius: 150
                )
              )
              .frame(width: 300, height: 300)
              .blur(radius: 30)

            // The sacred geometry shape
            SacredGeometryView(shape: badge.shape, lineColor: badge.lineColor)
              .frame(width: 150, height: 150)
              .rotationEffect(.degrees(rotation))
          }
          .scaleEffect(scale)

          VStack(spacing: 8) {
            Text("Sacred Geometry Unlocked")
              .font(.caption.bold())
              .foregroundColor(badge.lineColor)
              .tracking(2)

            Text(badge.shape.rawValue)
              .font(.title.bold())
              .foregroundColor(.white)

            Text("From: \(badge.lessonTitle)")
              .font(.subheadline)
              .foregroundColor(.white.opacity(0.6))
          }
          .opacity(opacity)

          if showDetails {
            // Gnostic meaning
            VStack(spacing: 12) {
              Text("ENCODED MEANING")
                .font(.caption2.bold())
                .foregroundColor(badge.glowColor)
                .tracking(1)

              Text(badge.shape.gnosticMeaning)
                .font(.subheadline)
                .foregroundColor(.white.opacity(0.8))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
            }
            .transition(.opacity.combined(with: .move(edge: .bottom)))
          }

          Button {
            dismissWithAnimation()
          } label: {
            Text("Continue")
              .fontWeight(.semibold)
              .foregroundColor(.black)
              .padding(.horizontal, 40)
              .padding(.vertical, 12)
              .background(badge.lineColor)
              .cornerRadius(20)
          }
          .opacity(opacity)
        }
      }
      .onAppear {
        animateIn()
      }
    }
  }

  private func animateIn() {
    withAnimation(.spring(response: 0.6, dampingFraction: 0.7)) {
      scale = 1.0
    }

    withAnimation(.easeInOut(duration: 2).repeatForever(autoreverses: false)) {
      rotation = 360
    }

    withAnimation(.easeOut(duration: 0.5).delay(0.3)) {
      opacity = 1
    }

    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
      withAnimation(.easeOut(duration: 0.5)) {
        showDetails = true
      }
    }
  }

  private func dismissWithAnimation() {
    withAnimation(.easeIn(duration: 0.3)) {
      scale = 0.3
      opacity = 0
    }

    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
      manager.dismissBadgeAnimation()
      showDetails = false
    }
  }
}

// MARK: - Sacred Geometry Renderer

struct SacredGeometryView: View {
  let shape: SacredGeometryShape
  var lineColor: Color = .init(hex: "#FFD700")
  var fillColor: Color = Color(hex: "#7C4DFF").opacity(0.3)
  var lineWidth: CGFloat = 2

  var body: some View {
    GeometryReader { _ in
      ZStack {
        switch shape {
        case .vesicaPiscis:
          VesicaPiscisShape()
            .stroke(lineColor, lineWidth: lineWidth)

        case .seedOfLife:
          SeedOfLifeShape()
            .stroke(lineColor, lineWidth: lineWidth * 0.75)

        case .flowerOfLife:
          FlowerOfLifeShape()
            .stroke(lineColor, lineWidth: lineWidth * 0.5)

        case .hexagram:
          HexagramShape()
            .stroke(lineColor, lineWidth: lineWidth)

        case .metatronsCube:
          MetatronsCubeShape()
            .stroke(lineColor, lineWidth: lineWidth * 0.5)

        case .infinityLoop:
          InfinityShape()
            .stroke(lineColor, lineWidth: lineWidth)

        case .tetrahedron, .hexahedron, .octahedron, .icosahedron, .dodecahedron:
          PlatonicSolidShape(type: shape)
            .stroke(lineColor, lineWidth: lineWidth)

        case .torus:
          TorusShape()
            .stroke(lineColor, lineWidth: lineWidth * 0.75)

        case .goldenSpiral:
          GoldenSpiralShape()
            .stroke(lineColor, lineWidth: lineWidth)

        case .treeOfLife:
          BadgeTreeOfLifeShape()
            .stroke(lineColor, lineWidth: lineWidth * 0.75)

        case .sriYantra, .shriYantra:
          BadgeSriYantraShape()
            .stroke(lineColor, lineWidth: lineWidth * 0.5)

        case .merkabaField:
          MerkabaShape()
            .stroke(lineColor, lineWidth: lineWidth)

        case .cosmicEgg:
          CosmicEggShape()
            .stroke(lineColor, lineWidth: lineWidth)

        case .yantra64:
          Yantra64Shape()
            .stroke(lineColor, lineWidth: lineWidth * 0.5)

        case .platoniSolids:
          PlatonicSolidsCollectionShape()
            .stroke(lineColor, lineWidth: lineWidth * 0.75)
        }
      }
    }
  }
}

// MARK: - Sacred Geometry Shapes

struct VesicaPiscisShape: Shape {
  func path(in rect: CGRect) -> Path {
    var path = Path()
    let center = CGPoint(x: rect.midX, y: rect.midY)
    let radius = min(rect.width, rect.height) * 0.4
    let offset = radius * 0.5

    path.addEllipse(
      in: CGRect(
        x: center.x - offset - radius, y: center.y - radius, width: radius * 2, height: radius * 2))
    path.addEllipse(
      in: CGRect(
        x: center.x + offset - radius, y: center.y - radius, width: radius * 2, height: radius * 2))

    return path
  }
}

struct SeedOfLifeShape: Shape {
  func path(in rect: CGRect) -> Path {
    var path = Path()
    let center = CGPoint(x: rect.midX, y: rect.midY)
    let radius = min(rect.width, rect.height) * 0.25

    path.addEllipse(
      in: CGRect(x: center.x - radius, y: center.y - radius, width: radius * 2, height: radius * 2))

    for i in 0..<6 {
      let angle = CGFloat(i) * .pi / 3
      let x = center.x + radius * cos(angle)
      let y = center.y + radius * sin(angle)
      path.addEllipse(
        in: CGRect(x: x - radius, y: y - radius, width: radius * 2, height: radius * 2))
    }

    return path
  }
}

struct FlowerOfLifeShape: Shape {
  func path(in rect: CGRect) -> Path {
    var path = Path()
    let center = CGPoint(x: rect.midX, y: rect.midY)
    let radius = min(rect.width, rect.height) * 0.15

    path.addEllipse(
      in: CGRect(x: center.x - radius, y: center.y - radius, width: radius * 2, height: radius * 2))

    for i in 0..<6 {
      let angle = CGFloat(i) * .pi / 3
      let x = center.x + radius * cos(angle)
      let y = center.y + radius * sin(angle)
      path.addEllipse(
        in: CGRect(x: x - radius, y: y - radius, width: radius * 2, height: radius * 2))
    }

    for i in 0..<6 {
      let angle1 = CGFloat(i) * .pi / 3
      let angle2 = CGFloat(i) * .pi / 3 + .pi / 6

      let x1 = center.x + radius * 2 * cos(angle1)
      let y1 = center.y + radius * 2 * sin(angle1)
      path.addEllipse(
        in: CGRect(x: x1 - radius, y: y1 - radius, width: radius * 2, height: radius * 2))

      let dist = radius * sqrt(3)
      let x2 = center.x + dist * cos(angle2)
      let y2 = center.y + dist * sin(angle2)
      path.addEllipse(
        in: CGRect(x: x2 - radius, y: y2 - radius, width: radius * 2, height: radius * 2))
    }

    return path
  }
}

struct HexagramShape: Shape {
  func path(in rect: CGRect) -> Path {
    var path = Path()
    let center = CGPoint(x: rect.midX, y: rect.midY)
    let size = min(rect.width, rect.height) * 0.4

    let up1 = CGPoint(x: center.x, y: center.y - size)
    let up2 = CGPoint(x: center.x - size * 0.866, y: center.y + size * 0.5)
    let up3 = CGPoint(x: center.x + size * 0.866, y: center.y + size * 0.5)

    path.move(to: up1)
    path.addLine(to: up2)
    path.addLine(to: up3)
    path.closeSubpath()

    let down1 = CGPoint(x: center.x, y: center.y + size)
    let down2 = CGPoint(x: center.x - size * 0.866, y: center.y - size * 0.5)
    let down3 = CGPoint(x: center.x + size * 0.866, y: center.y - size * 0.5)

    path.move(to: down1)
    path.addLine(to: down2)
    path.addLine(to: down3)
    path.closeSubpath()

    return path
  }
}

struct MetatronsCubeShape: Shape {
  func path(in rect: CGRect) -> Path {
    var path = Path()
    let center = CGPoint(x: rect.midX, y: rect.midY)
    let radius = min(rect.width, rect.height) * 0.12
    let outerRadius = radius * 3

    var points: [CGPoint] = [center]

    for i in 0..<6 {
      let angle = CGFloat(i) * .pi / 3 - .pi / 2
      points.append(
        CGPoint(x: center.x + radius * 2 * cos(angle), y: center.y + radius * 2 * sin(angle)))
    }

    for i in 0..<6 {
      let angle = CGFloat(i) * .pi / 3 - .pi / 2
      points.append(
        CGPoint(x: center.x + outerRadius * cos(angle), y: center.y + outerRadius * sin(angle)))
    }

    for point in points {
      path.addEllipse(
        in: CGRect(x: point.x - radius, y: point.y - radius, width: radius * 2, height: radius * 2))
    }

    for i in 0..<points.count {
      for j in (i + 1)..<points.count {
        path.move(to: points[i])
        path.addLine(to: points[j])
      }
    }

    return path
  }
}

struct InfinityShape: Shape {
  func path(in rect: CGRect) -> Path {
    var path = Path()
    let center = CGPoint(x: rect.midX, y: rect.midY)
    let width = rect.width * 0.35
    let height = rect.height * 0.2

    path.move(to: center)
    path.addCurve(
      to: CGPoint(x: center.x - width, y: center.y),
      control1: CGPoint(x: center.x - width * 0.5, y: center.y - height),
      control2: CGPoint(x: center.x - width, y: center.y - height * 0.5))
    path.addCurve(
      to: center, control1: CGPoint(x: center.x - width, y: center.y + height * 0.5),
      control2: CGPoint(x: center.x - width * 0.5, y: center.y + height))
    path.addCurve(
      to: CGPoint(x: center.x + width, y: center.y),
      control1: CGPoint(x: center.x + width * 0.5, y: center.y + height),
      control2: CGPoint(x: center.x + width, y: center.y + height * 0.5))
    path.addCurve(
      to: center, control1: CGPoint(x: center.x + width, y: center.y - height * 0.5),
      control2: CGPoint(x: center.x + width * 0.5, y: center.y - height))

    return path
  }
}

struct PlatonicSolidShape: Shape {
  let type: SacredGeometryShape

  func path(in rect: CGRect) -> Path {
    var path = Path()
    let center = CGPoint(x: rect.midX, y: rect.midY)
    let size = min(rect.width, rect.height) * 0.4

    switch type {
    case .tetrahedron:
      let points = [
        CGPoint(x: center.x, y: center.y - size),
        CGPoint(x: center.x - size * 0.866, y: center.y + size * 0.5),
        CGPoint(x: center.x + size * 0.866, y: center.y + size * 0.5),
      ]
      path.move(to: points[0])
      for point in points.dropFirst() {
        path.addLine(to: point)
      }
      path.closeSubpath()

    case .hexahedron:
      let halfSize = size * 0.7
      path.addRect(
        CGRect(
          x: center.x - halfSize, y: center.y - halfSize, width: halfSize * 2, height: halfSize * 2)
      )

    case .octahedron:
      let points = [
        CGPoint(x: center.x, y: center.y - size),
        CGPoint(x: center.x + size * 0.7, y: center.y),
        CGPoint(x: center.x, y: center.y + size),
        CGPoint(x: center.x - size * 0.7, y: center.y),
      ]
      path.move(to: points[0])
      for point in points.dropFirst() {
        path.addLine(to: point)
      }
      path.closeSubpath()

    case .icosahedron:
      for i in 0..<5 {
        let angle = CGFloat(i) * 2 * .pi / 5 - .pi / 2
        let point = CGPoint(x: center.x + size * cos(angle), y: center.y + size * sin(angle))
        if i == 0 { path.move(to: point) } else { path.addLine(to: point) }
      }
      path.closeSubpath()

    case .dodecahedron:
      var points: [CGPoint] = []
      for i in 0..<5 {
        let angle = CGFloat(i) * 2 * .pi / 5 - .pi / 2
        points.append(CGPoint(x: center.x + size * cos(angle), y: center.y + size * sin(angle)))
      }
      path.move(to: points[0])
      for point in points.dropFirst() {
        path.addLine(to: point)
      }
      path.closeSubpath()
      for i in 0..<5 {
        path.move(to: points[i])
        path.addLine(to: points[(i + 2) % 5])
      }

    default:
      path.addEllipse(
        in: CGRect(x: center.x - size, y: center.y - size, width: size * 2, height: size * 2))
    }

    return path
  }
}

struct TorusShape: Shape {
  func path(in rect: CGRect) -> Path {
    var path = Path()
    let center = CGPoint(x: rect.midX, y: rect.midY)
    let outerRadius = min(rect.width, rect.height) * 0.4
    let innerRadius = outerRadius * 0.4

    path.addEllipse(
      in: CGRect(
        x: center.x - outerRadius, y: center.y - outerRadius * 0.5, width: outerRadius * 2,
        height: outerRadius))
    path.addEllipse(
      in: CGRect(
        x: center.x - innerRadius, y: center.y - innerRadius * 0.3, width: innerRadius * 2,
        height: innerRadius * 0.6))

    return path
  }
}

struct GoldenSpiralShape: Shape {
  func path(in rect: CGRect) -> Path {
    var path = Path()
    let center = CGPoint(x: rect.midX, y: rect.midY)
    let maxRadius = min(rect.width, rect.height) * 0.45
    let phi: CGFloat = 1.618033988749895
    var currentRadius: CGFloat = maxRadius
    var currentAngle: CGFloat = 0

    path.move(to: CGPoint(x: center.x + currentRadius, y: center.y))

    for _ in 0..<50 {
      currentAngle += 0.1
      currentRadius = maxRadius * pow(1 / phi, currentAngle / (2 * .pi))
      path.addLine(
        to: CGPoint(
          x: center.x + currentRadius * cos(currentAngle),
          y: center.y + currentRadius * sin(currentAngle)))
    }

    return path
  }
}

struct BadgeTreeOfLifeShape: Shape {
  func path(in rect: CGRect) -> Path {
    var path = Path()
    let center = CGPoint(x: rect.midX, y: rect.midY)
    let radius = min(rect.width, rect.height) * 0.08
    let height = rect.height * 0.4

    let sephiroth: [CGPoint] = [
      CGPoint(x: center.x, y: center.y - height),
      CGPoint(x: center.x - height * 0.5, y: center.y - height * 0.6),
      CGPoint(x: center.x + height * 0.5, y: center.y - height * 0.6),
      CGPoint(x: center.x - height * 0.5, y: center.y - height * 0.2),
      CGPoint(x: center.x + height * 0.5, y: center.y - height * 0.2),
      CGPoint(x: center.x, y: center.y),
      CGPoint(x: center.x - height * 0.5, y: center.y + height * 0.3),
      CGPoint(x: center.x + height * 0.5, y: center.y + height * 0.3),
      CGPoint(x: center.x, y: center.y + height * 0.6),
      CGPoint(x: center.x, y: center.y + height),
    ]

    for point in sephiroth {
      path.addEllipse(
        in: CGRect(x: point.x - radius, y: point.y - radius, width: radius * 2, height: radius * 2))
    }

    let connections = [
      (0, 1), (0, 2), (1, 3), (2, 4), (1, 5), (2, 5), (3, 5), (4, 5), (3, 6), (4, 7), (5, 8),
      (6, 8), (7, 8), (8, 9),
    ]
    for (from, to) in connections {
      path.move(to: sephiroth[from])
      path.addLine(to: sephiroth[to])
    }

    return path
  }
}

struct BadgeSriYantraShape: Shape {
  func path(in rect: CGRect) -> Path {
    var path = Path()
    let center = CGPoint(x: rect.midX, y: rect.midY)
    let size = min(rect.width, rect.height) * 0.4

    for i in 0..<4 {
      let scale = 1.0 - CGFloat(i) * 0.2
      let s = size * scale

      path.move(to: CGPoint(x: center.x, y: center.y - s))
      path.addLine(to: CGPoint(x: center.x - s * 0.866, y: center.y + s * 0.5))
      path.addLine(to: CGPoint(x: center.x + s * 0.866, y: center.y + s * 0.5))
      path.closeSubpath()

      path.move(to: CGPoint(x: center.x, y: center.y + s * 0.8))
      path.addLine(to: CGPoint(x: center.x - s * 0.7, y: center.y - s * 0.4))
      path.addLine(to: CGPoint(x: center.x + s * 0.7, y: center.y - s * 0.4))
      path.closeSubpath()
    }

    path.addEllipse(in: CGRect(x: center.x - 4, y: center.y - 4, width: 8, height: 8))

    return path
  }
}

struct MerkabaShape: Shape {
  func path(in rect: CGRect) -> Path {
    var path = Path()
    let center = CGPoint(x: rect.midX, y: rect.midY)
    let size = min(rect.width, rect.height) * 0.4

    path.move(to: CGPoint(x: center.x, y: center.y - size))
    path.addLine(to: CGPoint(x: center.x - size * 0.866, y: center.y + size * 0.5))
    path.addLine(to: CGPoint(x: center.x + size * 0.866, y: center.y + size * 0.5))
    path.closeSubpath()

    path.move(to: CGPoint(x: center.x, y: center.y + size))
    path.addLine(to: CGPoint(x: center.x - size * 0.866, y: center.y - size * 0.5))
    path.addLine(to: CGPoint(x: center.x + size * 0.866, y: center.y - size * 0.5))
    path.closeSubpath()

    path.addEllipse(
      in: CGRect(
        x: center.x - size * 0.3, y: center.y - size * 0.3, width: size * 0.6, height: size * 0.6))

    return path
  }
}

struct CosmicEggShape: Shape {
  func path(in rect: CGRect) -> Path {
    var path = Path()
    let center = CGPoint(x: rect.midX, y: rect.midY)
    let width = min(rect.width, rect.height) * 0.35
    let height = width * 1.3

    path.addEllipse(
      in: CGRect(x: center.x - width, y: center.y - height, width: width * 2, height: height * 2))

    var angle: CGFloat = 0
    var radius: CGFloat = 5
    path.move(to: center)
    while radius < width * 0.8 {
      angle += 0.2
      radius += 1.5
      path.addLine(
        to: CGPoint(x: center.x + radius * cos(angle), y: center.y + radius * sin(angle) * 1.2))
    }

    return path
  }
}

struct Yantra64Shape: Shape {
  func path(in rect: CGRect) -> Path {
    var path = Path()
    let center = CGPoint(x: rect.midX, y: rect.midY)
    let size = min(rect.width, rect.height) * 0.08

    for row in 0..<4 {
      for col in 0..<4 {
        let x = center.x + CGFloat(col - 2) * size * 2 + size
        let y = center.y + CGFloat(row - 2) * size * 2 + size

        path.move(to: CGPoint(x: x, y: y - size * 0.8))
        path.addLine(to: CGPoint(x: x - size * 0.7, y: y + size * 0.4))
        path.addLine(to: CGPoint(x: x + size * 0.7, y: y + size * 0.4))
        path.closeSubpath()
      }
    }

    return path
  }
}

struct PlatonicSolidsCollectionShape: Shape {
  func path(in rect: CGRect) -> Path {
    var path = Path()
    let center = CGPoint(x: rect.midX, y: rect.midY)
    let size = min(rect.width, rect.height) * 0.15

    for i in 0..<5 {
      let angle = CGFloat(i) * 2 * .pi / 5 - .pi / 2
      let cx = center.x + size * 2 * cos(angle)
      let cy = center.y + size * 2 * sin(angle)

      let sides = [3, 4, 4, 5, 5][i]
      for j in 0..<sides {
        let a = CGFloat(j) * 2 * .pi / CGFloat(sides) - .pi / 2
        let point = CGPoint(x: cx + size * 0.6 * cos(a), y: cy + size * 0.6 * sin(a))
        if j == 0 { path.move(to: point) } else { path.addLine(to: point) }
      }
      path.closeSubpath()
    }

    return path
  }
}

// MARK: - Badge Collection View

struct BadgeCollectionView: View {
  @StateObject private var manager = SacredBadgeManager.shared
  @State private var selectedBadge: SacredBadge?

  private let columns = [
    GridItem(.flexible()),
    GridItem(.flexible()),
    GridItem(.flexible()),
  ]

  var body: some View {
    NavigationStack {
      ZStack {
        Color(hex: "#0a0a1a")
          .ignoresSafeArea()

        ScrollView {
          VStack(spacing: 24) {
            collectionProgressCard
            badgeGrid
          }
          .padding()
        }
      }
      .navigationTitle("Sacred Geometry")
      .navigationBarTitleDisplayMode(.large)
      .sheet(item: $selectedBadge) { badge in
        BadgeDetailView(badge: badge)
      }
    }
  }

  private var collectionProgressCard: some View {
    VStack(spacing: 12) {
      HStack {
        Text("COLLECTION")
          .font(.caption.bold())
          .foregroundColor(.white.opacity(0.5))
          .tracking(1)

        Spacer()

        Text("\(manager.uniqueShapesEarned().count) / \(SacredGeometryShape.allCases.count)")
          .font(.subheadline.bold())
          .foregroundColor(Color(hex: "#FFD700"))
      }

      ProgressView(value: manager.collectionProgress)
        .tint(Color(hex: "#FFD700"))

      Text("Total badges earned: \(manager.totalBadgeCount)")
        .font(.caption)
        .foregroundColor(.white.opacity(0.6))
    }
    .padding()
    .background(Color.white.opacity(0.05))
    .cornerRadius(16)
  }

  private var badgeGrid: some View {
    LazyVGrid(columns: columns, spacing: 16) {
      ForEach(manager.earnedBadges.reversed()) { badge in
        Button {
          selectedBadge = badge
        } label: {
          VStack(spacing: 8) {
            SacredGeometryView(shape: badge.shape, lineColor: badge.lineColor)
              .frame(width: 60, height: 60)

            Text(badge.shape.rawValue)
              .font(.caption2)
              .foregroundColor(.white.opacity(0.7))
              .lineLimit(1)
          }
          .padding()
          .background(Color.white.opacity(0.05))
          .cornerRadius(12)
        }
      }
    }
  }
}

// MARK: - Badge Detail View (with customization, save, share)

struct BadgeDetailView: View {
  let badge: SacredBadge
  @Environment(\.dismiss) private var dismiss
  @StateObject private var manager = SacredBadgeManager.shared

  @State private var lineColor: Color = .init(hex: "#FFD700")
  @State private var backgroundColor: Color = .init(hex: "#0a0a1a")
  @State private var glowColor: Color = .init(hex: "#7C4DFF")
  @State private var savedMessage = ""
  @State private var showSavedMessage = false

  var body: some View {
    NavigationStack {
      ZStack {
        backgroundColor
          .ignoresSafeArea()

        ScrollView {
          VStack(spacing: 24) {
            badgePreview
              .id("\(lineColor.description)\(backgroundColor.description)\(glowColor.description)")

            VStack(spacing: 8) {
              Text(badge.shape.rawValue)
                .font(.title.bold())
                .foregroundColor(.white)

              Text("Complexity: \(badge.shape.complexity)/7")
                .font(.caption)
                .foregroundColor(lineColor)
            }

            VStack(alignment: .leading, spacing: 12) {
              Text("ENCODED MEANING")
                .font(.caption.bold())
                .foregroundColor(glowColor)
                .tracking(1)

              Text(badge.shape.gnosticMeaning)
                .font(.body)
                .foregroundColor(.white.opacity(0.8))
            }
            .padding()
            .background(Color.white.opacity(0.05))
            .cornerRadius(16)

            colorCustomizationSection
            actionButtons
            earnedInfoSection
          }
          .padding()
        }

        if showSavedMessage {
          VStack {
            Spacer()
            Text(savedMessage)
              .font(.subheadline.bold())
              .foregroundColor(.white)
              .padding()
              .background(Color.green.opacity(0.8))
              .cornerRadius(12)
              .padding(.bottom, 50)
          }
          .transition(.move(edge: .bottom).combined(with: .opacity))
        }
      }
      .navigationTitle("Badge Details")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .topBarTrailing) {
          Button("Done") { dismiss() }
            .foregroundColor(.white)
        }
      }
      .onAppear {
        lineColor = badge.lineColor
        backgroundColor = badge.backgroundColor
        glowColor = badge.glowColor
      }
    }
  }

  private var badgePreview: some View {
    ZStack {
      Circle()
        .fill(
          RadialGradient(
            colors: [lineColor.opacity(0.4), glowColor.opacity(0.2), Color.clear],
            center: .center,
            startRadius: 50,
            endRadius: 150
          )
        )
        .frame(width: 280, height: 280)

      SacredGeometryView(shape: badge.shape, lineColor: lineColor)
        .frame(width: 140, height: 140)
    }
  }

  private var colorCustomizationSection: some View {
    VStack(alignment: .leading, spacing: 16) {
      Text("CUSTOMIZE COLORS")
        .font(.caption.bold())
        .foregroundColor(.white.opacity(0.5))
        .tracking(1)

      HStack(spacing: 20) {
        BadgeColorButton(label: "Line", color: $lineColor)
        BadgeColorButton(label: "Background", color: $backgroundColor)
        BadgeColorButton(label: "Glow", color: $glowColor)
      }

      Button {
        saveColors()
      } label: {
        Text("Save Colors")
          .font(.subheadline.bold())
          .foregroundColor(.white)
          .frame(maxWidth: .infinity)
          .padding(.vertical, 12)
          .background(glowColor.opacity(0.3))
          .cornerRadius(12)
      }
    }
    .padding()
    .background(Color.white.opacity(0.05))
    .cornerRadius(16)
  }

  private var actionButtons: some View {
    HStack(spacing: 16) {
      Button {
        saveToPhotos()
      } label: {
        HStack {
          Image(systemName: "square.and.arrow.down")
          Text("Save Image")
        }
        .font(.subheadline.bold())
        .foregroundColor(.white)
        .frame(maxWidth: .infinity)
        .padding()
        .background(lineColor.opacity(0.3))
        .cornerRadius(12)
      }

      Button {
        shareImage()
      } label: {
        HStack {
          Image(systemName: "square.and.arrow.up")
          Text("Share")
        }
        .font(.subheadline.bold())
        .foregroundColor(.white)
        .frame(maxWidth: .infinity)
        .padding()
        .background(glowColor.opacity(0.3))
        .cornerRadius(12)
      }
    }
  }

  private var earnedInfoSection: some View {
    VStack(alignment: .leading, spacing: 8) {
      Text("EARNED FROM")
        .font(.caption.bold())
        .foregroundColor(.white.opacity(0.5))
        .tracking(1)

      Text(badge.lessonTitle)
        .font(.subheadline)
        .foregroundColor(.white)

      Text(badge.earnedDate, style: .date)
        .font(.caption)
        .foregroundColor(.white.opacity(0.5))
    }
    .frame(maxWidth: .infinity, alignment: .leading)
    .padding()
    .background(Color.white.opacity(0.05))
    .cornerRadius(16)
  }

  private func saveColors() {
    let colors = BadgeCustomColors(
      lineColorHex: lineColor.toHex() ?? "#FFD700",
      backgroundColorHex: backgroundColor.toHex() ?? "#0a0a1a",
      glowColorHex: glowColor.toHex() ?? "#7C4DFF"
    )
    manager.updateBadgeColors(badge.id, colors: colors)
    showMessage("Colors saved!")
  }

  private func saveToPhotos() {
    let renderer = ImageRenderer(content: badgeImageForExport)
    renderer.scale = 3.0

    if let uiImage = renderer.uiImage {
      PHPhotoLibrary.requestAuthorization(for: .addOnly) { status in
        if status == .authorized || status == .limited {
          UIImageWriteToSavedPhotosAlbum(uiImage, nil, nil, nil)
          DispatchQueue.main.async {
            showMessage("Saved to Photos!")
          }
        }
      }
    }
  }

  private func shareImage() {
    let renderer = ImageRenderer(content: badgeImageForExport)
    renderer.scale = 3.0

    if let uiImage = renderer.uiImage {
      let activityVC = UIActivityViewController(
        activityItems: [
          uiImage, "My Sacred Geometry Badge: \(badge.shape.rawValue) from Aperture 🔮",
        ],
        applicationActivities: nil
      )

      if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
        let rootVC = windowScene.windows.first?.rootViewController
      {
        rootVC.present(activityVC, animated: true)
      }
    }
  }

  private func showMessage(_ message: String) {
    savedMessage = message
    withAnimation { showSavedMessage = true }
    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
      withAnimation { showSavedMessage = false }
    }
  }

  private var badgeImageForExport: some View {
    ZStack {
      backgroundColor

      Circle()
        .fill(
          RadialGradient(
            colors: [lineColor.opacity(0.4), glowColor.opacity(0.2), Color.clear],
            center: .center,
            startRadius: 100,
            endRadius: 300
          )
        )
        .frame(width: 600, height: 600)

      SacredGeometryView(shape: badge.shape, lineColor: lineColor, lineWidth: 4)
        .frame(width: 300, height: 300)

      VStack {
        Spacer()
        Text(badge.shape.rawValue)
          .font(.system(size: 24, weight: .bold))
          .foregroundColor(.white)
          .padding(.bottom, 40)
      }
    }
    .frame(width: 600, height: 600)
  }
}

struct BadgeColorButton: View {
  let label: String
  @Binding var color: Color

  var body: some View {
    VStack(spacing: 8) {
      ColorPicker("", selection: $color)
        .labelsHidden()
        .frame(width: 50, height: 50)
        .background(
          Circle()
            .fill(color)
            .overlay(Circle().stroke(Color.white.opacity(0.3), lineWidth: 2))
        )

      Text(label)
        .font(.caption2)
        .foregroundColor(.white.opacity(0.6))
    }
    .frame(maxWidth: .infinity)
  }
}

// MARK: - Color Extension for Hex

extension Color {
  func toHex() -> String? {
    guard let components = UIColor(self).cgColor.components else { return nil }
    let r = components[0]
    let g = components.count > 1 ? components[1] : r
    let b = components.count > 2 ? components[2] : r
    return String(format: "#%02X%02X%02X", Int(r * 255), Int(g * 255), Int(b * 255))
  }
}

#Preview {
  BadgeCollectionView()
}
