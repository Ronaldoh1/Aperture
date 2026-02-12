// SolarCalendarVisualization.swift
// Aperture
//
// Animated visualization of the sun's annual journey
// Used in Solar Theology course to show astronomical foundations of religion

import SwiftUI

// MARK: - Solar Calendar View

struct SolarCalendarView: View {
    
    @State private var sunPosition: CGFloat = 0  // 0-1 representing the year
    @State private var isAnimating = false
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                // Background
                Color(hex: "#0a0a1a")
                
                // Zodiac circle
                zodiacCircle(size: geo.size)
                
                // Seasons overlay
                seasonsOverlay(size: geo.size)
                
                // Sun on path
                sunOnPath(size: geo.size)
                
                // Center info
                centerInfo
            }
        }
        .aspectRatio(1, contentMode: .fit)
        .onAppear {
            startAnimation()
        }
    }
    
    // MARK: - Zodiac Circle
    
    private func zodiacCircle(size: CGSize) -> some View {
        let center = CGPoint(x: size.width / 2, y: size.height / 2)
        let radius = min(size.width, size.height) * 0.4
        
        return ZStack {
            // Outer ring
            Circle()
                .stroke(Color.white.opacity(0.1), lineWidth: 2)
                .frame(width: radius * 2, height: radius * 2)
                .position(center)
            
            // Zodiac signs
            ForEach(0..<12, id: \.self) { i in
                let angle = Double(i) * 30 - 90  // Start from top
                let x = center.x + radius * cos(angle * .pi / 180)
                let y = center.y + radius * sin(angle * .pi / 180)
                
                VStack(spacing: 2) {
                    Image(systemName: zodiacSymbol(for: i))
                        .font(.system(size: 14))
                        .foregroundColor(zodiacColor(for: i))
                    
                    Text(zodiacName(for: i))
                        .font(.system(size: 8, weight: .medium))
                        .foregroundColor(.white.opacity(0.5))
                }
                .position(x: x, y: y)
            }
        }
    }
    
    // MARK: - Seasons Overlay
    
    private func seasonsOverlay(size: CGSize) -> some View {
        let center = CGPoint(x: size.width / 2, y: size.height / 2)
        let radius = min(size.width, size.height) * 0.28
        
        return ZStack {
            // Season arcs
            ForEach(0..<4, id: \.self) { i in
                SeasonArc(
                    startAngle: Double(i) * 90 - 90,
                    endAngle: Double(i + 1) * 90 - 90,
                    season: Season.allCases[i]
                )
                .stroke(
                    Season.allCases[i].color.opacity(0.3),
                    lineWidth: 20
                )
                .frame(width: radius * 2, height: radius * 2)
                .position(center)
            }
        }
    }
    
    // MARK: - Sun on Path
    
    private func sunOnPath(size: CGSize) -> some View {
        let center = CGPoint(x: size.width / 2, y: size.height / 2)
        let radius = min(size.width, size.height) * 0.28
        let angle = sunPosition * 360 - 90  // Start from top (winter solstice)
        let x = center.x + radius * cos(angle * .pi / 180)
        let y = center.y + radius * sin(angle * .pi / 180)
        
        return ZStack {
            // Sun glow
            Circle()
                .fill(
                    RadialGradient(
                        colors: [
                            Color(hex: "#FFD700").opacity(0.6),
                            Color(hex: "#FF8C00").opacity(0.3),
                            Color.clear
                        ],
                        center: .center,
                        startRadius: 5,
                        endRadius: 25
                    )
                )
                .frame(width: 50, height: 50)
                .position(x: x, y: y)
            
            // Sun core
            Circle()
                .fill(
                    RadialGradient(
                        colors: [Color(hex: "#FFF4E0"), Color(hex: "#FFD700")],
                        center: .center,
                        startRadius: 0,
                        endRadius: 12
                    )
                )
                .frame(width: 20, height: 20)
                .position(x: x, y: y)
        }
    }
    
    // MARK: - Center Info
    
    private var centerInfo: some View {
        VStack(spacing: 4) {
            Text(currentSeason.rawValue.uppercased())
                .font(.system(size: 12, weight: .bold))
                .foregroundColor(currentSeason.color)
            
            Text(currentDateString)
                .font(.system(size: 10))
                .foregroundColor(.white.opacity(0.6))
            
            Text(currentReligiousEvent)
                .font(.system(size: 9, weight: .medium))
                .foregroundColor(Color(hex: "#FFD700"))
                .multilineTextAlignment(.center)
        }
        .frame(width: 80)
    }
    
    // MARK: - Helpers
    
    private var currentSeason: Season {
        switch sunPosition {
        case 0..<0.25: return .winter
        case 0.25..<0.5: return .spring
        case 0.5..<0.75: return .summer
        default: return .fall
        }
    }
    
    private var currentDateString: String {
        let dayOfYear = Int(sunPosition * 365) + 1
        // Simplified date calculation starting from Dec 21
        let months = ["Dec", "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov"]
        let daysInMonth = [10, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30]
        
        var remaining = dayOfYear
        for (i, days) in daysInMonth.enumerated() {
            if remaining <= days {
                return "\(months[i]) \(remaining)"
            }
            remaining -= days
        }
        return "Dec 21"
    }
    
    private var currentReligiousEvent: String {
        switch sunPosition {
        case 0..<0.02: return "☀️ SUN REBORN\nDec 25"
        case 0.24..<0.28: return "🌸 PASSOVER\nResurrection"
        case 0.48..<0.52: return "🦁 LION KING\nSummer Peak"
        case 0.73..<0.77: return "🍂 THE FALL\nSun Weakens"
        default: return ""
        }
    }
    
    private func zodiacSymbol(for index: Int) -> String {
        let symbols = ["arrow.up", "diamond", "person.2", "drop", "flame", "leaf", "scale.3d", "ant", "arrow.up.right", "mountain.2", "drop.triangle", "fish"]
        return symbols[index]
    }
    
    private func zodiacName(for index: Int) -> String {
        let names = ["Cap", "Aqu", "Pis", "Ari", "Tau", "Gem", "Can", "Leo", "Vir", "Lib", "Sco", "Sag"]
        return names[index]
    }
    
    private func zodiacColor(for index: Int) -> Color {
        let colors: [Color] = [
            .gray, .cyan, .purple, .red, .green, .yellow,
            .white, .orange, .brown, .pink, .red, .purple
        ]
        return colors[index].opacity(0.7)
    }
    
    private func startAnimation() {
        withAnimation(.linear(duration: 20).repeatForever(autoreverses: false)) {
            sunPosition = 1
        }
    }
}

// MARK: - Season

enum Season: String, CaseIterable {
    case winter = "Winter"
    case spring = "Spring"
    case summer = "Summer"
    case fall = "Fall"
    
    var color: Color {
        switch self {
        case .winter: return Color(hex: "#87CEEB")
        case .spring: return Color(hex: "#90EE90")
        case .summer: return Color(hex: "#FFD700")
        case .fall: return Color(hex: "#FF8C00")
        }
    }
}

// MARK: - Season Arc Shape

struct SeasonArc: Shape {
    let startAngle: Double
    let endAngle: Double
    let season: Season
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        
        path.addArc(
            center: center,
            radius: radius,
            startAngle: .degrees(startAngle),
            endAngle: .degrees(endAngle),
            clockwise: false
        )
        
        return path
    }
}

// MARK: - December 25th Animation

struct December25Animation: View {
    
    @State private var phase = 0
    @State private var showRebirth = false
    
    var body: some View {
        ZStack {
            // Background
            Color(hex: "#0a0a1a")
            
            VStack(spacing: 30) {
                // Title
                Text(titleForPhase)
                    .font(.title2.bold())
                    .foregroundColor(.white)
                
                // Sun visualization
                ZStack {
                    // Dec 22-24: Sun doesn't move (dead)
                    if phase < 3 {
                        Circle()
                            .fill(Color.gray.opacity(0.3))
                            .frame(width: 80, height: 80)
                        
                        Text("☠️")
                            .font(.system(size: 40))
                    }
                    
                    // Dec 25: Rebirth
                    if phase >= 3 {
                        Circle()
                            .fill(
                                RadialGradient(
                                    colors: [Color(hex: "#FFF4E0"), Color(hex: "#FFD700"), Color(hex: "#FF8C00")],
                                    center: .center,
                                    startRadius: 0,
                                    endRadius: showRebirth ? 60 : 20
                                )
                            )
                            .frame(width: showRebirth ? 120 : 40, height: showRebirth ? 120 : 40)
                            .animation(.spring(response: 0.5, dampingFraction: 0.6), value: showRebirth)
                        
                        if showRebirth {
                            // Rays
                            ForEach(0..<12, id: \.self) { i in
                                Rectangle()
                                    .fill(Color(hex: "#FFD700"))
                                    .frame(width: 3, height: 30)
                                    .offset(y: -80)
                                    .rotationEffect(.degrees(Double(i) * 30))
                            }
                        }
                    }
                }
                .frame(height: 200)
                
                // Description
                Text(descriptionForPhase)
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.8))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                // Phase indicator
                HStack(spacing: 12) {
                    ForEach(0..<4, id: \.self) { i in
                        Circle()
                            .fill(phase >= i ? Color(hex: "#FFD700") : Color.white.opacity(0.2))
                            .frame(width: 10, height: 10)
                    }
                }
                
                // Next button
                Button {
                    advancePhase()
                } label: {
                    Text(phase < 3 ? "Next Day" : "The Sun is Reborn!")
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding(.horizontal, 30)
                        .padding(.vertical, 12)
                        .background(Color(hex: "#FFD700"))
                        .cornerRadius(12)
                }
            }
        }
    }
    
    private var titleForPhase: String {
        switch phase {
        case 0: return "December 22nd"
        case 1: return "December 23rd"
        case 2: return "December 24th"
        default: return "December 25th"
        }
    }
    
    private var descriptionForPhase: String {
        switch phase {
        case 0: return "The sun hits its lowest point.\nIt does not move northward."
        case 1: return "The sun still does not move.\nIt sits on the same degree."
        case 2: return "Third day. The sun is DEAD.\nIt has not moved for three days."
        default: return "The sun moves one degree north!\nGod's Sun is BORN AGAIN.\n\n'On the third day, He rose again.'"
        }
    }
    
    private func advancePhase() {
        if phase < 3 {
            phase += 1
            if phase == 3 {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    showRebirth = true
                }
            }
        }
    }
}

// MARK: - Trinity Comparison View

struct TrinityComparisonView: View {
    
    let traditions: [(name: String, trinity: [String], color: Color)] = [
        ("Hinduism", ["Brahma", "Vishnu", "Shiva"], Color(hex: "#FF9800")),
        ("Egypt", ["Osiris", "Isis", "Horus"], Color(hex: "#00BCD4")),
        ("Christianity", ["Father", "Son", "Holy Spirit"], Color(hex: "#9C27B0")),
        ("Judaism", ["Abraham", "Isaac", "Jacob"], Color(hex: "#2196F3"))
    ]
    
    @State private var selectedIndex = 0
    
    var body: some View {
        VStack(spacing: 24) {
            // Triangle visualization
            ZStack {
                // Triangle shape
                SolarTriangle()
                    .stroke(traditions[selectedIndex].color, lineWidth: 2)
                    .frame(width: 150, height: 130)
                
                // Three points
                VStack {
                    // Top
                    trinityPoint(traditions[selectedIndex].trinity[0], offset: CGSize(width: 0, height: -40))
                    
                    HStack(spacing: 100) {
                        // Bottom left
                        trinityPoint(traditions[selectedIndex].trinity[1], offset: CGSize(width: 0, height: 20))
                        
                        // Bottom right
                        trinityPoint(traditions[selectedIndex].trinity[2], offset: CGSize(width: 0, height: 20))
                    }
                }
            }
            .frame(height: 180)
            
            // Tradition name
            Text(traditions[selectedIndex].name)
                .font(.title2.bold())
                .foregroundColor(traditions[selectedIndex].color)
            
            // Tradition selector
            HStack(spacing: 16) {
                ForEach(traditions.indices, id: \.self) { i in
                    Button {
                        withAnimation(.spring(response: 0.3)) {
                            selectedIndex = i
                        }
                    } label: {
                        Circle()
                            .fill(selectedIndex == i ? traditions[i].color : traditions[i].color.opacity(0.3))
                            .frame(width: 12, height: 12)
                    }
                }
            }
            
            // Connection text
            Text("Same pattern.\nDifferent names.")
                .font(.caption)
                .foregroundColor(.white.opacity(0.6))
                .multilineTextAlignment(.center)
        }
        .padding()
        .background(Color(hex: "#0a0a1a"))
    }
    
    private func trinityPoint(_ text: String, offset: CGSize) -> some View {
        Text(text)
            .font(.caption.bold())
            .foregroundColor(.white)
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(traditions[selectedIndex].color.opacity(0.3))
            .cornerRadius(8)
            .offset(offset)
    }
}

// MARK: - Triangle Shape

struct SolarTriangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}

// MARK: - Preview

#Preview {
    VStack {
        SolarCalendarView()
            .frame(height: 300)
        
        December25Animation()
            .frame(height: 400)
    }
    .background(Color(hex: "#0a0a1a"))
}
