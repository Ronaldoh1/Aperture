// SacredGeometryBackground.swift
// Reusable sacred geometry backgrounds for all screens

import SwiftUI

// MARK: - Sacred Geometry Background Styles

enum SacredGeometryStyle {
    case flowerOfLife
    case metatronsCube
    case sriYantra
    case treeOfLife
    case vesicaPiscis
    case seedOfLife
    case torusField
    case cosmic
    case chakra(Int) // 1-7 for each chakra
    
    var primaryColor: Color {
        switch self {
        case .flowerOfLife: return Color(hex: "#7C5CFF")
        case .metatronsCube: return Color(hex: "#00D9FF")
        case .sriYantra: return Color(hex: "#FFD700")
        case .treeOfLife: return Color(hex: "#00C853")
        case .vesicaPiscis: return Color(hex: "#FF6D00")
        case .seedOfLife: return Color(hex: "#E040FB")
        case .torusField: return Color(hex: "#00BCD4")
        case .cosmic: return Color(hex: "#7C5CFF")
        case .chakra(let n):
            let colors = ["#FF0000", "#FF7F00", "#FFFF00", "#00FF00", "#0000FF", "#4B0082", "#9400D3"]
            return Color(hex: colors[min(n - 1, 6)])
        }
    }
}

// MARK: - Main Sacred Geometry Background View

struct SacredGeometryBackground: View {
    
    let style: SacredGeometryStyle
    var opacity: Double = 0.15
    var animated: Bool = true
    
    @State private var rotation: Double = 0
    @State private var pulse: Double = 1.0
    @State private var phase: Double = 0
    
    var body: some View {
        
        ZStack {
            
            // Base cosmic gradient
            PaletteGradients.cosmicBackground
                .ignoresSafeArea()
            
            // Stars layer
            starsLayer
            
            // Sacred geometry layer
            geometryLayer
                .opacity(opacity)
            
            // Floating particles
            particlesLayer
            
        }
        .onAppear {
            if animated {
                withAnimation(.linear(duration: 120).repeatForever(autoreverses: false)) {
                    rotation = 360
                }
                withAnimation(.easeInOut(duration: 4).repeatForever(autoreverses: true)) {
                    pulse = 1.1
                }
                withAnimation(.linear(duration: 8).repeatForever(autoreverses: false)) {
                    phase = .pi * 2
                }
            }
        }
        
    }
    
    // MARK: - Stars Layer
    
    private var starsLayer: some View {
        GeometryReader { geo in
            ForEach(0..<100, id: \.self) { i in
                Circle()
                    .fill(Color.white)
                    .frame(width: CGFloat(i % 3 + 1))
                    .position(
                        x: CGFloat((i * 31) % max(1, Int(geo.size.width))),
                        y: CGFloat((i * 47) % max(1, Int(geo.size.height)))
                    )
                    .opacity(Double(i % 5) * 0.15 + 0.1)
            }
        }
    }
    
    // MARK: - Geometry Layer
    
    @ViewBuilder
    private var geometryLayer: some View {
        GeometryReader { geo in
            let size = min(geo.size.width, geo.size.height)
            
            ZStack {
                switch style {
                case .flowerOfLife:
                    flowerOfLifeView(size: size)
                case .metatronsCube:
                    metatronsCubeView(size: size)
                case .sriYantra:
                    sriYantraView(size: size)
                case .treeOfLife:
                    treeOfLifeView(size: size)
                case .vesicaPiscis:
                    vesicaPiscisView(size: size)
                case .seedOfLife:
                    seedOfLifeView(size: size)
                case .torusField:
                    torusFieldView(size: size)
                case .cosmic:
                    cosmicView(size: size)
                case .chakra(let n):
                    chakraView(size: size, chakra: n)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
    
    // MARK: - Particles Layer
    
    private var particlesLayer: some View {
        GeometryReader { geo in
            ForEach(0..<30, id: \.self) { i in
                Circle()
                    .fill(style.primaryColor)
                    .frame(width: CGFloat(i % 4 + 2))
                    .position(
                        x: CGFloat((i * 43) % max(1, Int(geo.size.width))),
                        y: CGFloat((i * 67) % max(1, Int(geo.size.height)))
                    )
                    .opacity(0.3)
                    .blur(radius: 1)
            }
        }
    }
    
    // MARK: - Flower of Life
    
    private func flowerOfLifeView(size: CGFloat) -> some View {
        ZStack {
            // Central pattern
            FlowerOfLife()
                .stroke(style.primaryColor, lineWidth: 1)
                .frame(width: size * 0.8, height: size * 0.8)
                .rotationEffect(.degrees(rotation * 0.1))
                .scaleEffect(pulse)
            
            // Outer ring
            FlowerOfLife()
                .stroke(style.primaryColor.opacity(0.5), lineWidth: 0.5)
                .frame(width: size * 1.2, height: size * 1.2)
                .rotationEffect(.degrees(-rotation * 0.05))
        }
    }
    
    // MARK: - Metatron's Cube
    
    private func metatronsCubeView(size: CGFloat) -> some View {
        ZStack {
            // Outer circles (13 circles of Fruit of Life)
            ForEach(0..<6, id: \.self) { i in
                let angle = Double(i) * .pi / 3
                Circle()
                    .stroke(style.primaryColor, lineWidth: 1)
                    .frame(width: size * 0.25)
                    .offset(
                        x: CGFloat(cos(angle)) * size * 0.25,
                        y: CGFloat(sin(angle)) * size * 0.25
                    )
            }
            
            // Center circle
            Circle()
                .stroke(style.primaryColor, lineWidth: 1)
                .frame(width: size * 0.25)
            
            // Connecting lines (cube)
            MetatronsCubeLines()
                .stroke(style.primaryColor.opacity(0.6), lineWidth: 0.5)
                .frame(width: size * 0.6, height: size * 0.6)
            
            // Inner hexagram
            StarOfDavid()
                .stroke(style.primaryColor.opacity(0.8), lineWidth: 1)
                .frame(width: size * 0.4, height: size * 0.4)
                .rotationEffect(.degrees(rotation * 0.1))
        }
        .rotationEffect(.degrees(rotation * 0.05))
    }
    
    // MARK: - Sri Yantra
    
    private func sriYantraView(size: CGFloat) -> some View {
        ZStack {
            // Outer lotus petals
            ForEach(0..<16, id: \.self) { i in
                LotusLeaf()
                    .stroke(style.primaryColor.opacity(0.4), lineWidth: 0.5)
                    .frame(width: size * 0.15, height: size * 0.25)
                    .rotationEffect(.degrees(Double(i) * 22.5))
                    .offset(y: -size * 0.35)
                    .rotationEffect(.degrees(Double(i) * 22.5))
            }
            
            // Interlocking triangles
            ForEach(0..<9, id: \.self) { i in
                Triangle()
                    .stroke(style.primaryColor, lineWidth: 1)
                    .frame(width: size * (0.5 - Double(i) * 0.04))
                    .rotationEffect(.degrees(i % 2 == 0 ? 0 : 180))
                    .scaleEffect(pulse)
            }
            
            // Central bindu
            Circle()
                .fill(style.primaryColor)
                .frame(width: 8, height: 8)
        }
    }
    
    // MARK: - Tree of Life
    
    private func treeOfLifeView(size: CGFloat) -> some View {
        ZStack {
            // Sephirot (10 circles)
            TreeOfLifeShape()
                .stroke(style.primaryColor, lineWidth: 1)
                .frame(width: size * 0.6, height: size * 0.8)
            
            // Paths connecting sephirot
            TreeOfLifePaths()
                .stroke(style.primaryColor.opacity(0.5), lineWidth: 0.5)
                .frame(width: size * 0.6, height: size * 0.8)
        }
        .scaleEffect(pulse)
    }
    
    // MARK: - Vesica Piscis
    
    private func vesicaPiscisView(size: CGFloat) -> some View {
        ZStack {
            // Two overlapping circles
            Circle()
                .stroke(style.primaryColor, lineWidth: 1)
                .frame(width: size * 0.5)
                .offset(x: -size * 0.125)
            
            Circle()
                .stroke(style.primaryColor, lineWidth: 1)
                .frame(width: size * 0.5)
                .offset(x: size * 0.125)
            
            // Central vesica shape
            VesicaPiscis()
                .fill(style.primaryColor.opacity(0.1))
                .frame(width: size * 0.3, height: size * 0.5)
        }
        .rotationEffect(.degrees(rotation * 0.1))
    }
    
    // MARK: - Seed of Life
    
    private func seedOfLifeView(size: CGFloat) -> some View {
        ZStack {
            // Center circle
            Circle()
                .stroke(style.primaryColor, lineWidth: 1)
                .frame(width: size * 0.3)
            
            // 6 surrounding circles
            ForEach(0..<6, id: \.self) { i in
                let angle = Double(i) * .pi / 3
                Circle()
                    .stroke(style.primaryColor, lineWidth: 1)
                    .frame(width: size * 0.3)
                    .offset(
                        x: CGFloat(cos(angle)) * size * 0.15,
                        y: CGFloat(sin(angle)) * size * 0.15
                    )
            }
        }
        .rotationEffect(.degrees(rotation * 0.1))
        .scaleEffect(pulse)
    }
    
    // MARK: - Torus Field
    
    private func torusFieldView(size: CGFloat) -> some View {
        ZStack {
            ForEach(0..<12, id: \.self) { i in
                Ellipse()
                    .stroke(style.primaryColor.opacity(0.3 + Double(i) * 0.05), lineWidth: 0.5)
                    .frame(width: size * 0.8, height: size * 0.3)
                    .rotationEffect(.degrees(Double(i) * 15 + rotation * 0.2))
            }
            
            // Central core
            Circle()
                .fill(
                    RadialGradient(
                        colors: [style.primaryColor.opacity(0.5), Color.clear],
                        center: .center,
                        startRadius: 0,
                        endRadius: size * 0.1
                    )
                )
                .frame(width: size * 0.2)
                .scaleEffect(pulse)
        }
    }
    
    // MARK: - Cosmic (Combined)
    
    private func cosmicView(size: CGFloat) -> some View {
        ZStack {
            // Flower of Life base
            FlowerOfLife()
                .stroke(Color(hex: "#7C5CFF").opacity(0.3), lineWidth: 0.5)
                .frame(width: size * 0.9)
                .rotationEffect(.degrees(rotation * 0.05))
            
            // Metatron overlay
            MetatronsCubeLines()
                .stroke(Color(hex: "#00D9FF").opacity(0.2), lineWidth: 0.5)
                .frame(width: size * 0.5)
                .rotationEffect(.degrees(-rotation * 0.08))
            
            // Central glow
            Circle()
                .fill(
                    RadialGradient(
                        colors: [Color(hex: "#FFD700").opacity(0.3), Color.clear],
                        center: .center,
                        startRadius: 0,
                        endRadius: size * 0.15
                    )
                )
                .frame(width: size * 0.3)
                .scaleEffect(pulse)
        }
    }
    
    // MARK: - Chakra
    
    private func chakraView(size: CGFloat, chakra: Int) -> some View {
        let petalCounts = [4, 6, 10, 12, 16, 2, 1000] // Traditional petal counts
        let petals = petalCounts[min(chakra - 1, 6)]
        
        return ZStack {
            // Lotus petals
            if petals < 100 {
                ForEach(0..<petals, id: \.self) { i in
                    LotusLeaf()
                        .stroke(style.primaryColor, lineWidth: 1)
                        .frame(width: size * 0.1, height: size * 0.2)
                        .offset(y: -size * 0.2)
                        .rotationEffect(.degrees(Double(i) * (360.0 / Double(petals))))
                }
            } else {
                // Crown chakra - many petals represented as rings
                ForEach(0..<7, id: \.self) { i in
                    Circle()
                        .stroke(style.primaryColor.opacity(0.3 + Double(i) * 0.1), lineWidth: 0.5)
                        .frame(width: size * (0.3 + Double(i) * 0.08))
                }
            }
            
            // Central symbol
            Circle()
                .fill(style.primaryColor.opacity(0.3))
                .frame(width: size * 0.15)
            
            // Inner geometry varies by chakra
            chakraSymbol(for: chakra, size: size * 0.1)
        }
        .scaleEffect(pulse)
    }
    
    @ViewBuilder
    private func chakraSymbol(for chakra: Int, size: CGFloat) -> some View {
        switch chakra {
        case 1: // Root - Square
            Rectangle()
                .stroke(style.primaryColor, lineWidth: 1)
                .frame(width: size, height: size)
        case 2: // Sacral - Crescent
            Circle()
                .trim(from: 0.25, to: 0.75)
                .stroke(style.primaryColor, lineWidth: 1)
                .frame(width: size)
        case 3: // Solar Plexus - Triangle down
            Triangle()
                .stroke(style.primaryColor, lineWidth: 1)
                .frame(width: size)
                .rotationEffect(.degrees(180))
        case 4: // Heart - Star of David
            StarOfDavid()
                .stroke(style.primaryColor, lineWidth: 1)
                .frame(width: size)
        case 5: // Throat - Circle
            Circle()
                .stroke(style.primaryColor, lineWidth: 1)
                .frame(width: size)
        case 6: // Third Eye - Om / Triangle
            Triangle()
                .stroke(style.primaryColor, lineWidth: 1)
                .frame(width: size)
        case 7: // Crown - Thousand petals
            Circle()
                .fill(style.primaryColor)
                .frame(width: size * 0.5)
        default:
            Circle()
                .stroke(style.primaryColor, lineWidth: 1)
                .frame(width: size)
        }
    }
}

// MARK: - Supporting Shapes

struct MetatronsCubeLines: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let r = min(rect.width, rect.height) / 2
        
        // Calculate 6 outer points
        var points: [CGPoint] = []
        for i in 0..<6 {
            let angle = Double(i) * .pi / 3 - .pi / 2
            points.append(CGPoint(
                x: center.x + CGFloat(cos(angle)) * r,
                y: center.y + CGFloat(sin(angle)) * r
            ))
        }
        points.append(center)
        
        // Connect all points
        for i in 0..<points.count {
            for j in (i + 1)..<points.count {
                path.move(to: points[i])
                path.addLine(to: points[j])
            }
        }
        
        return path
    }
}

struct StarOfDavid: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let r = min(rect.width, rect.height) / 2
        
        // Triangle pointing up
        for i in 0..<3 {
            let angle = Double(i) * 2 * .pi / 3 - .pi / 2
            let point = CGPoint(
                x: center.x + CGFloat(cos(angle)) * r,
                y: center.y + CGFloat(sin(angle)) * r
            )
            if i == 0 { path.move(to: point) }
            else { path.addLine(to: point) }
        }
        path.closeSubpath()
        
        // Triangle pointing down
        for i in 0..<3 {
            let angle = Double(i) * 2 * .pi / 3 + .pi / 2
            let point = CGPoint(
                x: center.x + CGFloat(cos(angle)) * r,
                y: center.y + CGFloat(sin(angle)) * r
            )
            if i == 0 { path.move(to: point) }
            else { path.addLine(to: point) }
        }
        path.closeSubpath()
        
        return path
    }
}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}

struct LotusLeaf: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.addQuadCurve(
            to: CGPoint(x: rect.midX, y: rect.minY),
            control: CGPoint(x: rect.maxX, y: rect.midY)
        )
        path.addQuadCurve(
            to: CGPoint(x: rect.midX, y: rect.maxY),
            control: CGPoint(x: rect.minX, y: rect.midY)
        )
        return path
    }
}

struct TreeOfLifeShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let w = rect.width
        let h = rect.height
        let r = w * 0.12
        
        // 10 Sephirot positions (simplified)
        let positions: [(CGFloat, CGFloat)] = [
            (0.5, 0.05),   // Keter
            (0.25, 0.2),   // Chokmah
            (0.75, 0.2),   // Binah
            (0.25, 0.4),   // Chesed
            (0.75, 0.4),   // Gevurah
            (0.5, 0.5),    // Tiferet
            (0.25, 0.65),  // Netzach
            (0.75, 0.65),  // Hod
            (0.5, 0.75),   // Yesod
            (0.5, 0.95)    // Malkuth
        ]
        
        for (x, y) in positions {
            path.addEllipse(in: CGRect(
                x: rect.minX + w * x - r,
                y: rect.minY + h * y - r,
                width: r * 2,
                height: r * 2
            ))
        }
        
        return path
    }
}

struct TreeOfLifePaths: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let w = rect.width
        let h = rect.height
        
        let positions: [CGPoint] = [
            CGPoint(x: 0.5, y: 0.05),
            CGPoint(x: 0.25, y: 0.2),
            CGPoint(x: 0.75, y: 0.2),
            CGPoint(x: 0.25, y: 0.4),
            CGPoint(x: 0.75, y: 0.4),
            CGPoint(x: 0.5, y: 0.5),
            CGPoint(x: 0.25, y: 0.65),
            CGPoint(x: 0.75, y: 0.65),
            CGPoint(x: 0.5, y: 0.75),
            CGPoint(x: 0.5, y: 0.95)
        ].map { CGPoint(x: rect.minX + w * $0.x, y: rect.minY + h * $0.y) }
        
        // Connect paths (22 paths in Kabbalah)
        let connections = [
            (0, 1), (0, 2), (1, 2), (1, 3), (2, 4), (1, 5), (2, 5),
            (3, 4), (3, 5), (4, 5), (3, 6), (4, 7), (5, 6), (5, 7),
            (6, 7), (6, 8), (7, 8), (5, 8), (8, 9)
        ]
        
        for (from, to) in connections {
            path.move(to: positions[from])
            path.addLine(to: positions[to])
        }
        
        return path
    }
}

// MARK: - Preview

#Preview {
    SacredGeometryBackground(style: .cosmic)
}
