// SacredGeometryDrawings.swift
// SACRED GEOMETRY — Interactive SwiftUI Drawings
// ☀️ SunFlow: Reignited
//
// "Everything in the universe is geometric.
//  These aren't just pretty patterns —
//  they're the blueprints of creation itself.
//  And you can DRAW them with math."
//
// ALL geometry drawn programmatically.
// Zero images. Pure SwiftUI Path + Shape.
// Every circle, line, and spiral is mathematically precise.

import SwiftUI

// MARK: - ═══════════════════════════════════════════════════
// VESICA PISCIS — The First Creation
// Two circles overlapping, birth of the "Jesus Fish"
// Contains √2, √3, √5 — all infinite numbers
// ═══════════════════════════════════════════════════════════

struct VesicaPiscisView: View {
    @State private var progress: CGFloat = 0
    let color: Color
    
    init(color: Color = .cyan) { self.color = color }
    
    var body: some View {
        GeometryReader { geo in
            let size = min(geo.size.width, geo.size.height)
            let r = size * 0.3
            let cx = geo.size.width / 2
            let cy = geo.size.height / 2
            let offset = r * 0.5 * progress
            
            ZStack {
                // Left circle
                Circle().stroke(color.opacity(0.6), lineWidth: 1.5)
                    .frame(width: r * 2, height: r * 2)
                    .position(x: cx - offset, y: cy)
                
                // Right circle
                Circle().stroke(color.opacity(0.6), lineWidth: 1.5)
                    .frame(width: r * 2, height: r * 2)
                    .position(x: cx + offset, y: cy)
                
                // Vesica Piscis fill (intersection)
                if progress > 0.1 {
                    Path { path in
                        let d = offset * 2
                        let angle1 = acos(min(1, max(-1, d / (2 * r))))
                        
                        // Left arc
                        path.addArc(center: CGPoint(x: cx - offset, y: cy), radius: r,
                                    startAngle: .radians(-Double(angle1)), endAngle: .radians(Double(angle1)), clockwise: false)
                        // Right arc
                        path.addArc(center: CGPoint(x: cx + offset, y: cy), radius: r,
                                    startAngle: .radians(.pi - Double(angle1)), endAngle: .radians(.pi + Double(angle1)), clockwise: false)
                    }
                    .fill(color.opacity(0.08))
                }
            }
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 2.0)) { progress = 1.0 }
        }
    }
}

// MARK: - ═══════════════════════════════════════════════════
// SEED OF LIFE — The Genesis Pattern (7 circles)
// "6 days of creation" in geometric form
// ═══════════════════════════════════════════════════════════

struct SeedOfLifeView: View {
    @State private var visibleCircles: Int = 0
    let color: Color
    
    init(color: Color = Color(red: 1.0, green: 0.85, blue: 0.3)) { self.color = color }
    
    var body: some View {
        GeometryReader { geo in
            let size = min(geo.size.width, geo.size.height)
            let r = size * 0.2
            let cx = geo.size.width / 2
            let cy = geo.size.height / 2
            
            ZStack {
                // Center circle (Day 1)
                if visibleCircles >= 1 {
                    Circle().stroke(color.opacity(0.5), lineWidth: 1.2)
                        .frame(width: r * 2, height: r * 2)
                        .position(x: cx, y: cy)
                        .transition(.opacity)
                }
                
                // 6 surrounding circles (Days 2-7)
                ForEach(0..<6, id: \.self) { i in
                    if visibleCircles >= i + 2 {
                        let angle = Double(i) * .pi / 3 - .pi / 2
                        let px = cx + r * CGFloat(cos(angle))
                        let py = cy + r * CGFloat(sin(angle))
                        
                        Circle().stroke(color.opacity(0.5), lineWidth: 1.2)
                            .frame(width: r * 2, height: r * 2)
                            .position(x: px, y: py)
                            .transition(.opacity)
                    }
                }
            }
        }
        .onAppear { animateCircles() }
    }
    
    private func animateCircles() {
        for i in 1...7 {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i) * 0.4) {
                withAnimation(.easeInOut(duration: 0.3)) { visibleCircles = i }
            }
        }
    }
}

// MARK: - ═══════════════════════════════════════════════════
// FLOWER OF LIFE — The Creation Pattern (19 circles)
// Found in Ireland, Turkey, Israel, Egypt, China, Greece,
// Germany, India, Iceland, England, Tibet, Japan, Sweden...
// ═══════════════════════════════════════════════════════════

struct FlowerOfLifeView: View {
    @State private var progress: CGFloat = 0
    let color: Color
    
    init(color: Color = Color(red: 1.0, green: 0.85, blue: 0.3)) { self.color = color }
    
    var body: some View {
        GeometryReader { geo in
            let size = min(geo.size.width, geo.size.height)
            let r = size * 0.12
            let cx = geo.size.width / 2
            let cy = geo.size.height / 2
            
            let circles = flowerOfLifePositions(cx: cx, cy: cy, r: r)
            
            ZStack {
                // Outer boundary circle
                Circle().stroke(color.opacity(0.15), lineWidth: 1)
                    .frame(width: size * 0.88, height: size * 0.88)
                    .position(x: cx, y: cy)
                
                // All 19 circles
                ForEach(Array(circles.enumerated()), id: \.offset) { index, pos in
                    Circle().stroke(color.opacity(Double(progress) * 0.5), lineWidth: 1)
                        .frame(width: r * 2, height: r * 2)
                        .position(x: pos.x, y: pos.y)
                        .opacity(Double(index) < Double(circles.count) * Double(progress) ? 1 : 0)
                }
            }
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 3.0)) { progress = 1.0 }
        }
    }
    
    private func flowerOfLifePositions(cx: CGFloat, cy: CGFloat, r: CGFloat) -> [CGPoint] {
        var points: [CGPoint] = [CGPoint(x: cx, y: cy)] // Center
        
        // Ring 1: 6 circles
        for i in 0..<6 {
            let angle = Double(i) * .pi / 3 - .pi / 2
            points.append(CGPoint(x: cx + r * CGFloat(cos(angle)), y: cy + r * CGFloat(sin(angle))))
        }
        
        // Ring 2: 12 circles (6 at 2r + 6 between)
        for i in 0..<6 {
            let angle = Double(i) * .pi / 3 - .pi / 2
            points.append(CGPoint(x: cx + 2 * r * CGFloat(cos(angle)), y: cy + 2 * r * CGFloat(sin(angle))))
        }
        for i in 0..<6 {
            let angle1 = Double(i) * .pi / 3 - .pi / 2
            let angle2 = Double(i + 1) * .pi / 3 - .pi / 2
            let px = cx + r * CGFloat(cos(angle1)) + r * CGFloat(cos(angle2))
            let py = cy + r * CGFloat(sin(angle1)) + r * CGFloat(sin(angle2))
            points.append(CGPoint(x: px, y: py))
        }
        
        return Array(points.prefix(19))
    }
}

// MARK: - ═══════════════════════════════════════════════════
// FRUIT OF LIFE — 13 circles, "one of the holiest forms"
// From this comes Metatron's Cube and all Platonic Solids
// ═══════════════════════════════════════════════════════════

struct FruitOfLifeView: View {
    @State private var progress: CGFloat = 0
    let color: Color
    
    init(color: Color = .purple) { self.color = color }
    
    var body: some View {
        GeometryReader { geo in
            let size = min(geo.size.width, geo.size.height)
            let r = size * 0.09
            let cx = geo.size.width / 2
            let cy = geo.size.height / 2
            let spacing = r * 2 * 1.02
            
            let circles = fruitPositions(cx: cx, cy: cy, spacing: spacing)
            
            ZStack {
                ForEach(Array(circles.enumerated()), id: \.offset) { index, pos in
                    Circle().stroke(color.opacity(0.6), lineWidth: 1.5)
                        .frame(width: r * 2, height: r * 2)
                        .position(x: pos.x, y: pos.y)
                        .opacity(Double(index) < Double(circles.count) * Double(progress) ? 1 : 0)
                }
            }
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 2.5)) { progress = 1.0 }
        }
    }
    
    private func fruitPositions(cx: CGFloat, cy: CGFloat, spacing: CGFloat) -> [CGPoint] {
        var points: [CGPoint] = [CGPoint(x: cx, y: cy)]
        // Inner ring: 6
        for i in 0..<6 {
            let angle = Double(i) * .pi / 3
            points.append(CGPoint(x: cx + spacing * CGFloat(cos(angle)), y: cy + spacing * CGFloat(sin(angle))))
        }
        // Outer ring: 6 (every other position at 2x distance)
        for i in 0..<6 {
            let angle = Double(i) * .pi / 3 + .pi / 6
            points.append(CGPoint(x: cx + spacing * 1.732 * CGFloat(cos(angle)), y: cy + spacing * 1.732 * CGFloat(sin(angle))))
        }
        return points
    }
}

// MARK: - ═══════════════════════════════════════════════════
// METATRON'S CUBE — All 5 Platonic Solids hidden within
// Straight lines (masculine) + curves (feminine)
// ═══════════════════════════════════════════════════════════

struct MetatronsCubeView: View {
    @State private var showLines: Bool = false
    let color: Color
    
    init(color: Color = Color(red: 1.0, green: 0.85, blue: 0.3)) { self.color = color }
    
    var body: some View {
        GeometryReader { geo in
            let size = min(geo.size.width, geo.size.height)
            let r = size * 0.06
            let cx = geo.size.width / 2
            let cy = geo.size.height / 2
            let spacing = size * 0.18
            
            let centers = metatronPositions(cx: cx, cy: cy, spacing: spacing)
            
            ZStack {
                // Lines connecting ALL centers to ALL other centers
                if showLines {
                    ForEach(0..<centers.count, id: \.self) { i in
                        ForEach((i+1)..<centers.count, id: \.self) { j in
                            Path { path in
                                path.move(to: centers[i])
                                path.addLine(to: centers[j])
                            }
                            .stroke(color.opacity(0.12), lineWidth: 0.5)
                        }
                    }
                }
                
                // 13 circles
                ForEach(Array(centers.enumerated()), id: \.offset) { _, pos in
                    Circle().stroke(color.opacity(0.4), lineWidth: 1)
                        .frame(width: r * 2, height: r * 2)
                        .position(x: pos.x, y: pos.y)
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                withAnimation(.easeInOut(duration: 1.5)) { showLines = true }
            }
        }
    }
    
    private func metatronPositions(cx: CGFloat, cy: CGFloat, spacing: CGFloat) -> [CGPoint] {
        var points: [CGPoint] = [CGPoint(x: cx, y: cy)]
        for i in 0..<6 {
            let angle = Double(i) * .pi / 3 - .pi / 2
            points.append(CGPoint(x: cx + spacing * CGFloat(cos(angle)), y: cy + spacing * CGFloat(sin(angle))))
        }
        for i in 0..<6 {
            let angle = Double(i) * .pi / 3 - .pi / 2
            points.append(CGPoint(x: cx + spacing * 2 * CGFloat(cos(angle)), y: cy + spacing * 2 * CGFloat(sin(angle))))
        }
        return points
    }
}

// MARK: - ═══════════════════════════════════════════════════
// FIBONACCI SPIRAL — Life's attempt to reach Phi
// "Starts crude, gets closer to source every step"
// ═══════════════════════════════════════════════════════════

struct FibonacciSpiralView: View {
    @State private var progress: CGFloat = 0
    let color: Color
    
    init(color: Color = Color(red: 1.0, green: 0.85, blue: 0.3)) { self.color = color }
    
    var body: some View {
        GeometryReader { geo in
            let size = min(geo.size.width, geo.size.height)
            let cx = geo.size.width / 2
            let cy = geo.size.height / 2
            
            ZStack {
                // Golden rectangles (optional grid)
                fibonacciRectangles(cx: cx, cy: cy, size: size)
                
                // The spiral
                Path { path in
                    let fibs: [CGFloat] = [1, 1, 2, 3, 5, 8, 13, 21, 34]
                    let scale = size * 0.008
                    var x: CGFloat = cx
                    var y: CGFloat = cy
                    
                    path.move(to: CGPoint(x: x, y: y))
                    
                    for (i, fib) in fibs.enumerated() {
                        let r = fib * scale
                        let startAngle = Angle(degrees: Double(i) * 90)
                        let endAngle = Angle(degrees: Double(i + 1) * 90)
                        
                        let centerOffset: (CGFloat, CGFloat)
                        switch i % 4 {
                        case 0: centerOffset = (0, -r)
                        case 1: centerOffset = (r, 0)
                        case 2: centerOffset = (0, r)
                        default: centerOffset = (-r, 0)
                        }
                        
                        let arcCenter = CGPoint(x: x + centerOffset.0, y: y + centerOffset.1)
                        path.addArc(center: arcCenter, radius: r,
                                    startAngle: startAngle + .degrees(180),
                                    endAngle: endAngle + .degrees(180),
                                    clockwise: true)
                        
                        x = path.currentPoint?.x ?? x
                        y = path.currentPoint?.y ?? y
                    }
                }
                .trim(from: 0, to: progress)
                .stroke(color, lineWidth: 2)
            }
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 3.0)) { progress = 1.0 }
        }
    }
    
    private func fibonacciRectangles(cx: CGFloat, cy: CGFloat, size: CGFloat) -> some View {
        // Subtle grid showing the golden rectangles
        let scale = size * 0.008
        let fibs: [CGFloat] = [1, 1, 2, 3, 5, 8, 13, 21]
        
        return ZStack {
            ForEach(Array(fibs.enumerated()), id: \.offset) { i, fib in
                Rectangle()
                    .stroke(Color.white.opacity(0.03), lineWidth: 0.5)
                    .frame(width: fib * scale * 2, height: fib * scale * 2)
            }
        }
    }
}

// MARK: - ═══════════════════════════════════════════════════
// TREE OF LIFE (KABBALAH) — 10 Sephiroth + 22 Pathways
// "A compendium of science, psychology, philosophy, theology"
// ═══════════════════════════════════════════════════════════

struct TreeOfLifeView: View {
    @State private var visibleNodes: Int = 0
    @State private var showPaths: Bool = false
    @State private var selectedNode: Int? = nil
    let color: Color
    
    init(color: Color = Color(red: 1.0, green: 0.85, blue: 0.3)) { self.color = color }
    
    var body: some View {
        GeometryReader { geo in
            let w = geo.size.width
            let h = geo.size.height
            let nodeR: CGFloat = min(w, h) * 0.055
            
            // Sephiroth positions (normalized 0-1, mapped to view)
            let nodes = sephirothPositions(w: w, h: h)
            let paths = sephirothPaths()
            
            ZStack {
                // 22 Pathways
                if showPaths {
                    ForEach(Array(paths.enumerated()), id: \.offset) { _, pair in
                        Path { path in
                            path.move(to: nodes[pair.0])
                            path.addLine(to: nodes[pair.1])
                        }
                        .stroke(color.opacity(0.15), lineWidth: 1)
                    }
                }
                
                // 3 Pillars (subtle)
                VStack {
                    // Pillar labels
                }.opacity(0)
                
                // 10 Sephiroth
                ForEach(0..<10, id: \.self) { i in
                    if i < visibleNodes {
                        let pos = nodes[i]
                        let info = sephirothInfo(i)
                        
                        Button {
                            withAnimation { selectedNode = selectedNode == i ? nil : i }
                        } label: {
                            ZStack {
                                // Glow
                                Circle().fill(info.color.opacity(0.15))
                                    .frame(width: nodeR * 2.5, height: nodeR * 2.5)
                                
                                // Node
                                Circle().fill(info.color.opacity(0.3))
                                    .frame(width: nodeR * 2, height: nodeR * 2)
                                    .overlay(Circle().stroke(info.color.opacity(0.6), lineWidth: 1.5))
                                
                                // Number
                                Text("\(i + 1)").font(.system(size: 10, weight: .black))
                                    .foregroundColor(.white)
                            }
                        }
                        .position(x: pos.x, y: pos.y)
                        .transition(.scale.combined(with: .opacity))
                        
                        // Name label
                        Text(info.name).font(.system(size: 7, weight: .bold))
                            .foregroundColor(info.color.opacity(0.6))
                            .position(x: pos.x, y: pos.y + nodeR + 8)
                    }
                }
                
                // Selected node info
                if let selected = selectedNode {
                    let info = sephirothInfo(selected)
                    VStack(spacing: 3) {
                        Text(info.name).font(.system(size: 12, weight: .black)).foregroundColor(info.color)
                        Text(info.translation).font(.system(size: 10, weight: .bold)).foregroundColor(.white.opacity(0.6))
                        Text(info.meaning).font(.system(size: 9, weight: .medium))
                            .foregroundColor(.white.opacity(0.35)).multilineTextAlignment(.center)
                    }
                    .padding(10).background(RoundedRectangle(cornerRadius: 8).fill(Color.black.opacity(0.85)))
                    .position(x: w / 2, y: h - 40)
                }
            }
        }
        .onAppear { animateTree() }
    }
    
    private func animateTree() {
        for i in 1...10 {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i) * 0.25) {
                withAnimation(.spring(response: 0.4)) { visibleNodes = i }
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            withAnimation(.easeInOut(duration: 1.0)) { showPaths = true }
        }
    }
    
    private func sephirothPositions(w: CGFloat, h: CGFloat) -> [CGPoint] {
        let cx = w * 0.5
        let left = w * 0.2
        let right = w * 0.8
        let vSpacing = h * 0.1
        let top = h * 0.08
        
        return [
            CGPoint(x: cx, y: top),                        // 1 Keter
            CGPoint(x: right, y: top + vSpacing * 1.2),    // 2 Chokmah
            CGPoint(x: left, y: top + vSpacing * 1.2),     // 3 Binah
            CGPoint(x: right, y: top + vSpacing * 3),      // 4 Chesed
            CGPoint(x: left, y: top + vSpacing * 3),       // 5 Geburah
            CGPoint(x: cx, y: top + vSpacing * 4.2),       // 6 Tiphareth
            CGPoint(x: right, y: top + vSpacing * 5.5),    // 7 Netzach
            CGPoint(x: left, y: top + vSpacing * 5.5),     // 8 Hod
            CGPoint(x: cx, y: top + vSpacing * 6.8),       // 9 Yesod
            CGPoint(x: cx, y: top + vSpacing * 8.2),       // 10 Malkuth
        ]
    }
    
    private func sephirothPaths() -> [(Int, Int)] {
        [
            (0,1),(0,2),(1,2), // Supernal triangle
            (1,3),(2,4),(1,5),(2,5),(3,4),(3,5),(4,5), // Middle
            (3,6),(4,7),(5,6),(5,7),(5,8),(6,7),(6,8),(7,8),(6,9),(7,9),(8,9),(9,9) // Lower
        ]
    }
    
    struct SephInfo { let name: String; let translation: String; let meaning: String; let color: Color }
    
    private func sephirothInfo(_ index: Int) -> SephInfo {
        let infos: [SephInfo] = [
            SephInfo(name: "Keter", translation: "Crown", meaning: "Supreme source. Pure infinite potential. No form — only being.", color: .white),
            SephInfo(name: "Chokmah", translation: "Wisdom", meaning: "Divine masculine. First creation. 'Let there be light.' Pure unformed energy.", color: .cyan),
            SephInfo(name: "Binah", translation: "Understanding", meaning: "Divine feminine. Womb of creation. Gives form to raw energy.", color: Color(red: 0.8, green: 0.2, blue: 0.2)),
            SephInfo(name: "Chesed", translation: "Mercy / Loving-Kindness", meaning: "Archetypal goodness. Cosmic law. Truth, love, order.", color: .blue),
            SephInfo(name: "Geburah", translation: "Strength", meaning: "Cosmic justice. Karma. Corrective rebalancing of the universe.", color: .red),
            SephInfo(name: "Tiphareth", translation: "Beauty", meaning: "Christ consciousness. Bridge between force and form. The beautiful child.", color: Color(red: 1.0, green: 0.85, blue: 0.3)),
            SephInfo(name: "Netzach", translation: "Victory", meaning: "Emotions, intuition, feelings. Light scattered through a prism.", color: .green),
            SephInfo(name: "Hod", translation: "Glory / Splendor", meaning: "Thought, mind, ego. Philosophy, science, rationality.", color: .orange),
            SephInfo(name: "Yesod", translation: "Foundation", meaning: "Etheric realm. The strings that make Malkuth dance. Electromagnetic life force.", color: .purple),
            SephInfo(name: "Malkuth", translation: "Kingdom", meaning: "Physical reality. HERE and NOW. The kingdom of heaven is actually here — as Christ proclaimed.", color: Color(red: 0.6, green: 0.4, blue: 0.2)),
        ]
        return infos[index]
    }
}

// MARK: - ═══════════════════════════════════════════════════
// PLATONIC SOLIDS — 2D projections of the 5 sacred shapes
// Tetrahedron (Fire), Cube (Earth), Octahedron (Air),
// Icosahedron (Water), Dodecahedron (Ether)
// ═══════════════════════════════════════════════════════════

struct PlatonicSolid2DView: View {
    let solidType: PlatonicSolidType
    let color: Color
    
    var body: some View {
        GeometryReader { geo in
            let size = min(geo.size.width, geo.size.height) * 0.8
            let cx = geo.size.width / 2
            let cy = geo.size.height / 2
            
            ZStack {
                // Draw the 2D projection
                Path { path in
                    let vertices = solidType.vertices(size: size)
                    let edges = solidType.edges
                    
                    for edge in edges {
                        path.move(to: CGPoint(x: cx + vertices[edge.0].x, y: cy + vertices[edge.0].y))
                        path.addLine(to: CGPoint(x: cx + vertices[edge.1].x, y: cy + vertices[edge.1].y))
                    }
                }
                .stroke(color.opacity(0.6), lineWidth: 1.5)
                
                // Vertices
                let vertices = solidType.vertices(size: size)
                ForEach(Array(vertices.enumerated()), id: \.offset) { _, v in
                    Circle().fill(color.opacity(0.5))
                        .frame(width: 4, height: 4)
                        .position(x: cx + v.x, y: cy + v.y)
                }
                
                // Label
                VStack(spacing: 2) {
                    Text(solidType.emoji).font(.system(size: 12))
                    Text(solidType.name).font(.system(size: 8, weight: .bold)).foregroundColor(color)
                    Text(solidType.element).font(.system(size: 7, weight: .medium)).foregroundColor(.white.opacity(0.3))
                }
                .position(x: cx, y: cy)
            }
        }
    }
}

enum PlatonicSolidType: String, CaseIterable {
    case tetrahedron, hexahedron, octahedron, icosahedron, dodecahedron
    
    var name: String {
        switch self { case .tetrahedron: return "Tetrahedron"; case .hexahedron: return "Cube"
        case .octahedron: return "Octahedron"; case .icosahedron: return "Icosahedron"; case .dodecahedron: return "Dodecahedron" }
    }
    var element: String {
        switch self { case .tetrahedron: return "🔥 Fire"; case .hexahedron: return "🌍 Earth"
        case .octahedron: return "💨 Air"; case .icosahedron: return "💧 Water"; case .dodecahedron: return "✨ Ether" }
    }
    var emoji: String {
        switch self { case .tetrahedron: return "🔺"; case .hexahedron: return "🟫"
        case .octahedron: return "💠"; case .icosahedron: return "🔷"; case .dodecahedron: return "⬡" }
    }
    
    func vertices(size: CGFloat) -> [CGPoint] {
        let r = size * 0.4
        switch self {
        case .tetrahedron:
            var pts: [CGPoint] = []
            for i in 0..<3 {
                let a: CGFloat = CGFloat(i) * 2.0 * .pi / 3.0 - .pi / 2.0
                pts.append(CGPoint(x: r * cos(a), y: r * sin(a)))
            }
            pts.append(CGPoint(x: 0, y: -r * 0.3)) // projected apex
            return pts
            
        case .hexahedron:
            let s = r * 0.6
            return [
                CGPoint(x: -s, y: -s), CGPoint(x: s, y: -s),
                CGPoint(x: s, y: s), CGPoint(x: -s, y: s),
                CGPoint(x: -s * 0.6, y: -s * 1.3), CGPoint(x: s * 1.4, y: -s * 0.6),
                CGPoint(x: s * 1.4, y: s * 0.7), CGPoint(x: -s * 0.6, y: s * 0.4),
            ]
            
        case .octahedron:
            return [
                CGPoint(x: 0, y: -r), CGPoint(x: r, y: 0),
                CGPoint(x: 0, y: r), CGPoint(x: -r, y: 0),
                CGPoint(x: 0, y: -r * 0.2), CGPoint(x: 0, y: r * 0.2),
            ]
            
        case .icosahedron:
            var pts: [CGPoint] = []
            for i in 0..<6 {
                let a: CGFloat = CGFloat(i) * .pi / 3.0 - .pi / 2.0
                pts.append(CGPoint(x: r * cos(a), y: r * sin(a)))
            }
            for i in 0..<6 {
                let a: CGFloat = CGFloat(i) * .pi / 3.0 - .pi / 2.0 + .pi / 6.0
                pts.append(CGPoint(x: r * 0.55 * cos(a), y: r * 0.55 * sin(a)))
            }
            return pts
            
        case .dodecahedron:
            var pts: [CGPoint] = []
            for i in 0..<5 {
                let a: CGFloat = CGFloat(i) * 2.0 * .pi / 5.0 - .pi / 2.0
                pts.append(CGPoint(x: r * cos(a), y: r * sin(a)))
            }
            for i in 0..<5 {
                let a: CGFloat = CGFloat(i) * 2.0 * .pi / 5.0 - .pi / 2.0
                pts.append(CGPoint(x: r * 0.6 * cos(a + .pi / 5.0), y: r * 0.6 * sin(a + .pi / 5.0)))
            }
            return pts
        }
    }
    
    var edges: [(Int, Int)] {
        switch self {
        case .tetrahedron: return [(0,1),(1,2),(2,0),(0,3),(1,3),(2,3)]
        case .hexahedron: return [(0,1),(1,2),(2,3),(3,0),(0,4),(1,5),(2,6),(3,7),(4,5),(5,6)]
        case .octahedron: return [(0,1),(1,2),(2,3),(3,0),(0,4),(1,4),(2,5),(3,5),(4,5)]
        case .icosahedron:
            var e: [(Int, Int)] = []
            for i in 0..<6 { e.append((i, (i+1)%6)); e.append((i, i+6)); e.append((i, (i+1)%6 + 6)) }
            return e
        case .dodecahedron:
            var e: [(Int, Int)] = []
            for i in 0..<5 { e.append((i, (i+1)%5)); e.append((i, i+5)); e.append((i+5, (i+1)%5 + 5)) }
            return e
        }
    }
}

// MARK: - ═══════════════════════════════════════════════════
// PHI / GOLDEN RATIO VISUALIZATION
// 1.6180339... — "The math of God"
// ═══════════════════════════════════════════════════════════

struct GoldenRatioView: View {
    let color: Color
    
    init(color: Color = Color(red: 1.0, green: 0.85, blue: 0.3)) { self.color = color }
    
    var body: some View {
        GeometryReader { geo in
            let w = geo.size.width
            let h = geo.size.height
            let barH: CGFloat = 6
            let y = h * 0.4
            let margin: CGFloat = 20
            let totalW = w - margin * 2
            let phi: CGFloat = 1.618033988749
            let aLen = totalW / phi
            let bLen = totalW - aLen
            
            ZStack {
                // Full bar
                RoundedRectangle(cornerRadius: 2).fill(color.opacity(0.3))
                    .frame(width: totalW, height: barH)
                    .position(x: w / 2, y: y)
                
                // A segment
                RoundedRectangle(cornerRadius: 2).fill(color.opacity(0.6))
                    .frame(width: aLen, height: barH)
                    .position(x: margin + aLen / 2, y: y)
                
                // Labels
                Text("a").font(.system(size: 10, weight: .bold)).foregroundColor(color)
                    .position(x: margin + aLen / 2, y: y - 14)
                Text("b").font(.system(size: 10, weight: .bold)).foregroundColor(.white.opacity(0.4))
                    .position(x: margin + aLen + bLen / 2, y: y - 14)
                
                // Division mark
                Rectangle().fill(.white.opacity(0.4)).frame(width: 1, height: 16)
                    .position(x: margin + aLen, y: y)
                
                // Phi value
                Text("φ = 1.6180339...").font(.system(size: 14, weight: .black)).foregroundColor(color)
                    .position(x: w / 2, y: y + 30)
                Text("a/b = (a+b)/a = φ").font(.system(size: 10, weight: .medium)).foregroundColor(.white.opacity(0.3))
                    .position(x: w / 2, y: y + 46)
                Text("The only ratio that needs just 2 numbers.\nInfinite. No beginning. No end.\nThe mathematical signature of Source.")
                    .font(.system(size: 9, weight: .medium)).foregroundColor(.white.opacity(0.2))
                    .multilineTextAlignment(.center)
                    .position(x: w / 2, y: y + 76)
            }
        }
    }
}
