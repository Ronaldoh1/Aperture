// VortexMathVisuals.swift
// Programmatic sacred geometry illustrations for the 369 Vortex Math course
// ☀️ SunFlow: Reignited — no external image assets required
import SwiftUI
import Foundation

// MARK: - Rodin Vortex Circle (3-6-9 + 1-2-4-8-7-5)
struct RodinVortexView: View {
    @State private var pulse: Bool = false
    @State private var rotationAngle: Double = 0

    private let sequence: [Int] = [1, 2, 4, 8, 7, 5]
    private let trinity: [Int] = [3, 6, 9]

    private func angleRadians(for position: Int, total: Int = 9) -> Double {
        // Position 9 at top (270°), going clockwise
        let base = Double(position - 1) / Double(total) * 360.0 - 90.0
        return base * .pi / 180.0
    }

    private func point(for n: Int, in size: CGFloat) -> CGPoint {
        let r = size * 0.42
        let a = angleRadians(for: n)
        // FIX: explicitly cast cos/sin results to CGFloat to resolve ambiguity
        return CGPoint(
            x: size / 2 + r * CGFloat(cos(a)),
            y: size / 2 + r * CGFloat(sin(a))
        )
    }

    var body: some View {
        GeometryReader { geo in
            let size = min(geo.size.width, geo.size.height)
            ZStack {
                // Outer glow ring
                Circle()
                    .stroke(Color.purple.opacity(0.15), lineWidth: size * 0.06)
                    .frame(width: size * 0.92, height: size * 0.92)
                    .blur(radius: 8)

                // Main circle
                Circle()
                    .stroke(Color.white.opacity(0.2), lineWidth: 1.5)
                    .frame(width: size * 0.88, height: size * 0.88)

                // Flow sequence lines (1-2-4-8-7-5)
                let seqPoints = sequence.map { point(for: $0, in: size) }
                Path { path in
                    path.move(to: seqPoints[0])
                    for p in seqPoints.dropFirst() { path.addLine(to: p) }
                    path.closeSubpath()
                }
                .stroke(
                    LinearGradient(
                        colors: [Color.cyan, Color.blue.opacity(0.6)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ),
                    lineWidth: 1.5
                )
                .opacity(0.85)

                // Trinity triangle (3-6-9)
                let triPoints = trinity.map { point(for: $0, in: size) }
                Path { path in
                    path.move(to: triPoints[0])
                    for p in triPoints.dropFirst() { path.addLine(to: p) }
                    path.closeSubpath()
                }
                .stroke(
                    LinearGradient(
                        colors: [Color.yellow, Color.orange.opacity(0.8)],
                        startPoint: .top,
                        endPoint: .bottom
                    ),
                    lineWidth: 2
                )

                // All 9 node dots
                ForEach(1...9, id: \.self) { n in
                    vortexNode(n: n, size: size)
                }

                // Center infinity symbol
                Text("∞")
                    .font(.system(size: size * 0.14, weight: .thin))
                    .foregroundColor(Color.purple.opacity(0.6))
                    .rotationEffect(.degrees(rotationAngle))
            }
        }
        .aspectRatio(1, contentMode: .fit)
        .onAppear {
            withAnimation(.easeInOut(duration: 1.4).repeatForever(autoreverses: true)) {
                pulse = true
            }
            withAnimation(.linear(duration: 18).repeatForever(autoreverses: false)) {
                rotationAngle = 360
            }
        }
    }

    // FIX: extracted to a @ViewBuilder to resolve "expression too complex" errors
    @ViewBuilder
    private func vortexNode(n: Int, size: CGFloat) -> some View {
        let pt = point(for: n, in: size)
        let isTrinity = trinity.contains(n)
        let isFlow = sequence.contains(n)
        let nodeColor: Color = isTrinity ? .yellow : (isFlow ? .cyan : .white)
        let nodeSize: CGFloat = isTrinity ? 12 : 8
        let shadowColor: Color = isTrinity ? Color.yellow.opacity(0.9) : Color.cyan.opacity(0.6)
        let shadowRadius: CGFloat = isTrinity ? 8 : 4

        Circle()
            .fill(nodeColor)
            .frame(width: nodeSize, height: nodeSize)
            .shadow(color: shadowColor, radius: shadowRadius)
            .scaleEffect(isTrinity && pulse ? 1.25 : 1.0)
            .position(pt)

        Text("\(n)")
            .font(.system(size: size * 0.055, weight: .bold, design: .monospaced))
            .foregroundColor(isTrinity ? .yellow : .white.opacity(0.8))
            .position(
                x: pt.x + (pt.x - size / 2) * 0.22,
                y: pt.y + (pt.y - size / 2) * 0.22
            )
    }
}

// MARK: - Solfeggio Frequency Scale Visualization
struct SolfeggioScaleView: View {

    private struct FreqRow: Identifiable {
        let id = UUID()
        let hz: Int
        let syllable: String
        let color: Color
        let attribute: String
        let digitalRoot: Int
    }

    private let rows: [FreqRow] = [
        FreqRow(hz: 174,  syllable: "—",   color: Color(hex: "#8B4513"), attribute: "Foundation · Reduces Pain",      digitalRoot: 3),
        FreqRow(hz: 285,  syllable: "—",   color: Color(hex: "#6B8E23"), attribute: "Influence Energy Fields",       digitalRoot: 6),
        FreqRow(hz: 396,  syllable: "DO",  color: Color(hex: "#CC2200"), attribute: "Liberation · Grief into Joy",   digitalRoot: 9),
        FreqRow(hz: 417,  syllable: "RE",  color: Color(hex: "#D4660A"), attribute: "Facilitate Change",             digitalRoot: 3),
        FreqRow(hz: 528,  syllable: "MI",  color: Color(hex: "#D4AF00"), attribute: "Love · Transformation · DNA",  digitalRoot: 6),
        FreqRow(hz: 639,  syllable: "FA",  color: Color(hex: "#2E8B57"), attribute: "Connection · Relationships",   digitalRoot: 9),
        FreqRow(hz: 741,  syllable: "SOL", color: Color(hex: "#1E6B9E"), attribute: "Expression · Truth · Cleaning",digitalRoot: 3),
        FreqRow(hz: 852,  syllable: "LA",  color: Color(hex: "#4B0082"), attribute: "Intuition · Spiritual Order",  digitalRoot: 6),
        FreqRow(hz: 963,  syllable: "—",   color: Color(hex: "#8B0080"), attribute: "Pineal · Perfect State",        digitalRoot: 9),
    ]

    var body: some View {
        VStack(spacing: 0) {
            columnHeader
            Divider().opacity(0.3)
            ForEach(rows) { row in
                freqRow(row)
            }
        }
        .background(Color.black.opacity(0.35))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.white.opacity(0.1), lineWidth: 1))
    }

    private var columnHeader: some View {
        HStack {
            Text("Hz")
                .frame(width: 52, alignment: .trailing)
            Text("Note")
                .frame(width: 38)
            Text("Attribute")
                .frame(maxWidth: .infinity, alignment: .leading)
            Text("Root")
                .frame(width: 36)
        }
        .font(.system(size: 11, weight: .semibold, design: .monospaced))
        .foregroundColor(.white.opacity(0.5))
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
    }

    // FIX: extracted row into its own @ViewBuilder to resolve "expression too complex"
    @ViewBuilder
    private func freqRow(_ row: FreqRow) -> some View {
        let rootColor: Color = {
            if row.digitalRoot == 3 { return .cyan }
            if row.digitalRoot == 6 { return .yellow }
            return .orange
        }()
        let isMiracle = row.hz == 528

        HStack(spacing: 0) {
            Text("\(row.hz)")
                .font(.system(size: 14, weight: .bold, design: .monospaced))
                .foregroundColor(.white)
                .frame(width: 52, alignment: .trailing)

            Text(row.syllable)
                .font(.system(size: 12, weight: .medium))
                .foregroundColor(row.color.opacity(0.9))
                .frame(width: 38)

            HStack(spacing: 8) {
                RoundedRectangle(cornerRadius: 2)
                    .fill(row.color)
                    .frame(width: 4)
                    .padding(.vertical, 4)
                Text(row.attribute)
                    .font(.system(size: 12))
                    .foregroundColor(.white.opacity(0.85))
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            Text("\(row.digitalRoot)")
                .font(.system(size: 13, weight: .black, design: .monospaced))
                .foregroundColor(rootColor)
                .frame(width: 36)
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 9)
        .background(isMiracle ? row.color.opacity(0.12) : Color.clear)
        .overlay(
            isMiracle
                ? RoundedRectangle(cornerRadius: 0).stroke(row.color.opacity(0.4), lineWidth: 1)
                : nil
        )
    }
}

// MARK: - Toroid Visualization
struct ToroidView: View {
    @State private var phase: Double = 0
    @State private var innerPhase: Double = 0

    var body: some View {
        GeometryReader { geo in
            let w = geo.size.width
            let h = geo.size.height
            let cx = w / 2
            let cy = h / 2

            ZStack {
                // Outer ambient glow
                Ellipse()
                    .fill(
                        RadialGradient(
                            colors: [Color.orange.opacity(0.18), Color.clear],
                            center: .center,
                            startRadius: 0,
                            endRadius: w * 0.52
                        )
                    )
                    .frame(width: w * 1.05, height: h * 0.65)
                    .blur(radius: 18)

                // Draw toroid field lines
                ForEach(0..<12) { i in
                    let angle = Double(i) / 12.0 * .pi + phase
                    ToroidFieldLine(angle: angle, size: CGSize(width: w, height: h))
                        .stroke(
                            LinearGradient(
                                colors: [Color.white.opacity(0.7), Color.white.opacity(0.0)],
                                startPoint: .top,
                                endPoint: .bottom
                            ),
                            lineWidth: 1.2
                        )
                }

                // Center axis glow
                Capsule()
                    .fill(
                        LinearGradient(
                            colors: [Color.white.opacity(0.9), Color.white.opacity(0.05)],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .frame(width: 3, height: h * 0.62)
                    .blur(radius: 2)
                    .position(x: cx, y: cy)

                // Top polar vortex
                Circle()
                    .fill(Color.white.opacity(0.85))
                    .frame(width: 8, height: 8)
                    .blur(radius: 3)
                    .position(x: cx, y: cy - h * 0.31)

                // Bottom polar vortex
                Circle()
                    .fill(Color.white.opacity(0.85))
                    .frame(width: 8, height: 8)
                    .blur(radius: 3)
                    .position(x: cx, y: cy + h * 0.31)

                // Equatorial ring glow
                Ellipse()
                    .stroke(Color.orange.opacity(0.5), lineWidth: 2)
                    .frame(width: w * 0.95, height: h * 0.15)
                    .blur(radius: 4)
                    .position(x: cx, y: cy)

                // Particle dots on field lines
                ForEach(0..<20) { i in
                    let t = (Double(i) / 20.0 + innerPhase).truncatingRemainder(dividingBy: 1.0)
                    let lineAngle = Double(i % 12) / 12.0 * .pi
                    let particlePt = toroidPoint(t: t, angle: lineAngle, size: CGSize(width: w, height: h))
                    Circle()
                        .fill(Color.orange.opacity(0.6))
                        .frame(width: 3, height: 3)
                        .position(particlePt)
                }
            }
        }
        .onAppear {
            withAnimation(.linear(duration: 8).repeatForever(autoreverses: false)) {
                phase = .pi
            }
            withAnimation(.linear(duration: 5).repeatForever(autoreverses: false)) {
                innerPhase = 1.0
            }
        }
    }

    private func toroidPoint(t: Double, angle: Double, size: CGSize) -> CGPoint {
        let cx = size.width / 2
        let cy = size.height / 2
        let a = size.width * 0.46
        let b = size.height * 0.30
        let theta = t * 2 * .pi
        // FIX: explicit CGFloat casts to avoid cos/sin ambiguity
        let x = cx + a * CGFloat(cos(theta + angle)) * 0.55
        let y = cy + b * CGFloat(sin(theta))
        return CGPoint(x: x, y: y)
    }
}

// MARK: - Toroid Field Line Shape
struct ToroidFieldLine: Shape {
    let angle: Double
    let size: CGSize

    func path(in rect: CGRect) -> Path {
        var path = Path()
        let cx = size.width / 2
        let cy = size.height / 2
        let rx = size.width * 0.42
        let ry = size.height * 0.30
        let steps = 60
        for i in 0...steps {
            let t = Double(i) / Double(steps)
            let theta = t * .pi
            // FIX: explicit CGFloat casts
            let x = cx + rx * CGFloat(cos(angle)) * CGFloat(sin(theta))
            let y = cy - ry * CGFloat(cos(theta))
            if i == 0 { path.move(to: CGPoint(x: x, y: y)) }
            else { path.addLine(to: CGPoint(x: x, y: y)) }
        }
        return path
    }
}

// MARK: - Digital Root Calculator (Interactive)
struct DigitalRootCalcView: View {
    @State private var input: String = ""
    @State private var steps: [String] = []
    @State private var finalRoot: Int? = nil

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text("Digital Root Calculator")
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(.white)

            HStack {
                TextField("Enter a number or word...", text: $input)
                    .textFieldStyle(PlainTextFieldStyle())
                    .font(.system(size: 15, design: .monospaced))
                    .foregroundColor(.white)
                    .padding(10)
                    .background(Color.white.opacity(0.08))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .onChange(of: input) { _, val in calculate(val) }

                if !input.isEmpty {
                    Button { input = "" } label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.white.opacity(0.4))
                    }
                }
            }

            if !steps.isEmpty {
                stepsView
                rootBadgeView
            }
        }
        .padding(16)
        .background(Color.white.opacity(0.06))
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }

    // FIX: extracted complex views into separate computed properties
    private var stepsView: some View {
        VStack(alignment: .leading, spacing: 6) {
            ForEach(Array(steps.enumerated()), id: \.0) { idx, step in
                Text(step)
                    .font(.system(size: 13, design: .monospaced))
                    .foregroundColor(idx == steps.count - 1 ? .yellow : .white.opacity(0.7))
            }
        }
        .padding(12)
        .background(Color.black.opacity(0.3))
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }

    @ViewBuilder
    private var rootBadgeView: some View {
        if let root = finalRoot {
            HStack(spacing: 8) {
                Text("Root:")
                    .font(.system(size: 14))
                    .foregroundColor(.white.opacity(0.6))

                Text("\(root)")
                    .font(.system(size: 32, weight: .black, design: .monospaced))
                    .foregroundColor(rootNumberColor(root))

                if [3, 6, 9].contains(root) {
                    trinityBadge
                } else if root == 8 {
                    infinityBadge
                }
            }
        }
    }

    private func rootNumberColor(_ root: Int) -> Color {
        if [3, 6, 9].contains(root) { return .yellow }
        if root == 8 { return .cyan }
        return .white
    }

    private var trinityBadge: some View {
        Text("✦ Trinity")
            .font(.system(size: 12, weight: .semibold))
            .foregroundColor(.yellow.opacity(0.8))
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(Color.yellow.opacity(0.12))
            .clipShape(Capsule())
    }

    private var infinityBadge: some View {
        Text("∞ Infinity")
            .font(.system(size: 12, weight: .semibold))
            .foregroundColor(.cyan.opacity(0.8))
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(Color.cyan.opacity(0.12))
            .clipShape(Capsule())
    }

    private func calculate(_ input: String) {
        var newSteps: [String] = []
        let upper = input.uppercased()
        let stripped = input.filter { !$0.isWhitespace }
        let isNumeric = stripped.allSatisfy { $0.isNumber }

        if !isNumeric && !input.isEmpty {
            var sum = 0
            var letterParts: [String] = []
            for char in upper {
                if let val = char.asciiLetterValue {
                    sum += val
                    letterParts.append("\(char)=\(val)")
                }
            }
            newSteps.append(letterParts.joined(separator: " "))
            newSteps.append("Sum = \(sum)")
        }

        var value = Int(input.filter { $0.isNumber }) ?? 0
        if value == 0 { steps = []; finalRoot = nil; return }

        while value > 9 {
            let digits = String(value).compactMap { $0.wholeNumberValue }
            let next = digits.reduce(0, +)
            let reduction = digits.map { "\($0)" }.joined(separator: "+")
            newSteps.append("\(value) → \(reduction) = \(next)")
            value = next
        }

        if newSteps.isEmpty { newSteps.append("\(value)") }

        steps = newSteps
        finalRoot = value
    }
}

private extension Character {
    var asciiLetterValue: Int? {
        guard let ascii = asciiValue, ascii >= 65, ascii <= 90 else { return nil }
        return Int(ascii - 64) // A=1, Z=26
    }
}

// MARK: - Preview
#Preview {
    ScrollView {
        VStack(spacing: 32) {
            RodinVortexView()
                .frame(width: 300, height: 300)

            SolfeggioScaleView()
                .padding(.horizontal, 16)

            ToroidView()
                .frame(width: 320, height: 200)
                .background(Color.black)
                .clipShape(RoundedRectangle(cornerRadius: 12))

            DigitalRootCalcView()
                .padding(.horizontal, 16)
        }
        .padding(.vertical, 32)
    }
    .background(Color(hex: "#0D0010"))
}
