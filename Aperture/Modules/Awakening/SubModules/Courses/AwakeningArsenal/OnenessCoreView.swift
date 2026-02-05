// OnenessCoreView.swift
// Interactive visualization showing all traditions connect to the same truth
// "Energy rises, ego dissolves, unity is realized"

import SwiftUI

struct OnenessCoreView: View {
    @State private var rotation: Double = 0
    @State private var selectedTradition: TraditionNode? = nil
    @State private var showingComparison = false
    @State private var pulseAnimation = false
    
    let traditions: [TraditionNode] = [
        TraditionNode(name: "Kundalini", icon: "🐍", color: .red, energyTerm: "Shakti", egoTerm: "Ego Death", unityTerm: "Samadhi", angle: 0),
        TraditionNode(name: "Qi", icon: "☯️", color: .green, energyTerm: "Qi/Chi", egoTerm: "Wu Wei", unityTerm: "Tao", angle: 25.7),
        TraditionNode(name: "Buddhism", icon: "🪷", color: .yellow, energyTerm: "Prana", egoTerm: "Anatta", unityTerm: "Nibbana", angle: 51.4),
        TraditionNode(name: "Sufism", icon: "🌹", color: .pink, energyTerm: "Baraka", egoTerm: "Fana", unityTerm: "Baqa", angle: 77.1),
        TraditionNode(name: "Christ", icon: "✝️", color: .purple, energyTerm: "Holy Spirit", egoTerm: "Kenosis", unityTerm: "Theosis", angle: 102.9),
        TraditionNode(name: "Kabbalah", icon: "✡️", color: .blue, energyTerm: "Shefa", egoTerm: "Bitul", unityTerm: "Devekut", angle: 128.6),
        TraditionNode(name: "Shamanism", icon: "🦅", color: .brown, energyTerm: "Power", egoTerm: "Soul Loss", unityTerm: "Wholeness", angle: 154.3),
        TraditionNode(name: "Egypt", icon: "𓂀", color: Palette.accent.gold, energyTerm: "Ka", egoTerm: "Weighing", unityTerm: "Akh", angle: 180),
        TraditionNode(name: "Zen", icon: "🎎", color: .gray, energyTerm: "Ki", egoTerm: "No-Self", unityTerm: "Satori", angle: 205.7),
        TraditionNode(name: "Aboriginal", icon: "🌌", color: .indigo, energyTerm: "Mana", egoTerm: "Dissolution", unityTerm: "Dreamtime", angle: 231.4),
        TraditionNode(name: "Maya/Aztec", icon: "🌞", color: .orange, energyTerm: "Tonalli", egoTerm: "Death", unityTerm: "Cosmic Union", angle: 257.1),
        TraditionNode(name: "Yoruba", icon: "🥁", color: .red, energyTerm: "Ashe", egoTerm: "Surrender", unityTerm: "Ori Alignment", angle: 282.9),
        TraditionNode(name: "Druidism", icon: "🌳", color: .green, energyTerm: "Awen", egoTerm: "Sacrifice", unityTerm: "Otherworld", angle: 308.6),
        TraditionNode(name: "Sikhism", icon: "☬", color: .orange, energyTerm: "Naam", egoTerm: "Haumai", unityTerm: "Waheguru", angle: 334.3)
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Header
                headerSection
                
                // Interactive Wheel
                wheelSection
                
                // Selected Tradition Detail
                if let selected = selectedTradition {
                    selectedTraditionCard(selected)
                }
                
                // Core Mechanism
                coreMechanismCard
                
                // Comparison Grid
                comparisonButton
            }
            .padding()
        }
        .background(Color.black.ignoresSafeArea())
        .navigationTitle("Oneness Core")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            withAnimation(.linear(duration: 120).repeatForever(autoreverses: false)) {
                rotation = 360
            }
            withAnimation(.easeInOut(duration: 2).repeatForever()) {
                pulseAnimation = true
            }
        }
        .sheet(isPresented: $showingComparison) {
            ComparisonGridView(traditions: traditions)
        }
    }
    
    // MARK: - Header
    
    private var headerSection: some View {
        VStack(spacing: 12) {
            Text("THE ONENESS CORE")
                .font(.system(size: 24, weight: .black))
                .foregroundColor(.white)
            
            Text("Tap any tradition to see how it connects")
                .font(.system(size: 14))
                .foregroundColor(.gray)
            
            HStack(spacing: 8) {
                Image(systemName: "equal.circle.fill")
                    .foregroundColor(.green)
                Text("All paths describe the same journey")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(.green)
            }
        }
    }
    
    // MARK: - Wheel Section
    
    private var wheelSection: some View {
        ZStack {
            outerRingConnections
            connectionLinesToCenter
            centerCore
            traditionNodes
        }
        .frame(width: 300, height: 300)
        .rotationEffect(.degrees(rotation / 10))
    }
    
    private var outerRingConnections: some View {
        ForEach(0..<traditions.count, id: \.self) { i in
            outerRingArc(index: i)
        }
    }
    
    private func outerRingArc(index i: Int) -> some View {
        let startAngle = traditions[i].angle
        let endAngle = traditions[(i + 1) % traditions.count].angle
        let startColor = traditions[i].color
        let endColor = traditions[(i + 1) % traditions.count].color
        
        return Path { path in
            let center = CGPoint(x: 150, y: 150)
            path.addArc(center: center, radius: 140, startAngle: .degrees(startAngle), endAngle: .degrees(endAngle), clockwise: false)
        }
        .stroke(
            LinearGradient(
                colors: [startColor, endColor],
                startPoint: .leading,
                endPoint: .trailing
            ),
            lineWidth: 2
        )
        .opacity(0.5)
    }
    
    private var connectionLinesToCenter: some View {
        ForEach(traditions) { tradition in
            connectionLine(for: tradition)
        }
    }
    
    private func connectionLine(for tradition: TraditionNode) -> some View {
        Path { path in
            let center = CGPoint(x: 150, y: 150)
            let angle = tradition.angle * .pi / 180
            let outerPoint = CGPoint(
                x: center.x + 110 * cos(angle),
                y: center.y + 110 * sin(angle)
            )
            path.move(to: CGPoint(x: center.x + 40 * cos(angle), y: center.y + 40 * sin(angle)))
            path.addLine(to: outerPoint)
        }
        .stroke(tradition.color.opacity(0.3), lineWidth: 1)
    }
    
    private var centerCore: some View {
        ZStack {
            // Pulsing outer glow
            Circle()
                .fill(
                    RadialGradient(
                        colors: [Color.white.opacity(0.3), Color.clear],
                        center: .center,
                        startRadius: 30,
                        endRadius: pulseAnimation ? 70 : 50
                    )
                )
                .frame(width: 120, height: 120)
            
            // Core circle
            Circle()
                .fill(
                    RadialGradient(
                        colors: [Color.white, Color.yellow, Color.orange],
                        center: .center,
                        startRadius: 0,
                        endRadius: 35
                    )
                )
                .frame(width: 70, height: 70)
            
            // Center symbol
            Image(systemName: "sparkles")
                .font(.system(size: 24))
                .foregroundColor(.black)
        }
    }
    
    private var traditionNodes: some View {
        ForEach(traditions) { tradition in
            traditionNode(tradition)
        }
    }
    
    private func traditionNode(_ tradition: TraditionNode) -> some View {
        let angle = tradition.angle * .pi / 180
        let radius: CGFloat = 120
        let x = 150 + radius * cos(angle)
        let y = 150 + radius * sin(angle)
        
        return Button(action: {
            withAnimation(.spring()) {
                if selectedTradition?.id == tradition.id {
                    selectedTradition = nil
                } else {
                    selectedTradition = tradition
                }
            }
        }) {
            ZStack {
                Circle()
                    .fill(tradition.color.opacity(selectedTradition?.id == tradition.id ? 0.8 : 0.3))
                    .frame(width: 44, height: 44)
                
                if selectedTradition?.id == tradition.id {
                    Circle()
                        .stroke(tradition.color, lineWidth: 2)
                        .frame(width: 50, height: 50)
                }
                
                Text(tradition.icon)
                    .font(.system(size: 20))
            }
        }
        .position(x: x, y: y)
    }
    
    // MARK: - Selected Tradition Card
    
    private func selectedTraditionCard(_ tradition: TraditionNode) -> some View {
        VStack(spacing: 16) {
            HStack {
                Text(tradition.icon)
                    .font(.system(size: 32))
                Text(tradition.name)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.white)
            }
            
            // Three stages
            HStack(spacing: 0) {
                stageColumn("1. ENERGY", tradition.energyTerm, tradition.color, "bolt.fill")
                dividerLine()
                stageColumn("2. EGO", tradition.egoTerm, .orange, "xmark.circle.fill")
                dividerLine()
                stageColumn("3. UNITY", tradition.unityTerm, .green, "infinity")
            }
            
            Text("Same mechanism, different vocabulary")
                .font(.system(size: 12))
                .foregroundColor(.gray)
                .italic()
        }
        .padding()
        .background(tradition.color.opacity(0.1))
        .cornerRadius(16)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(tradition.color.opacity(0.5), lineWidth: 1)
        )
        .transition(.scale.combined(with: .opacity))
    }
    
    private func stageColumn(_ stage: String, _ term: String, _ color: Color, _ icon: String) -> some View {
        VStack(spacing: 8) {
            Image(systemName: icon)
                .font(.system(size: 18))
                .foregroundColor(color)
            
            Text(stage)
                .font(.system(size: 9, weight: .bold))
                .foregroundColor(.gray)
            
            Text(term)
                .font(.system(size: 13, weight: .semibold))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
    }
    
    private func dividerLine() -> some View {
        Rectangle()
            .fill(Color.white.opacity(0.2))
            .frame(width: 1, height: 60)
    }
    
    // MARK: - Core Mechanism Card
    
    private var coreMechanismCard: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "cpu")
                    .foregroundColor(.cyan)
                Text("THE UNIVERSAL MECHANISM")
                    .font(.system(size: 12, weight: .black))
                    .foregroundColor(.cyan)
            }
            
            VStack(alignment: .leading, spacing: 12) {
                mechanismRow("1", "Energy Activation", "Dormant force awakens (whatever they call it)", .red)
                
                Image(systemName: "arrow.down")
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity)
                
                mechanismRow("2", "Ego Dissolution", "False self recognized and released", .orange)
                
                Image(systemName: "arrow.down")
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity)
                
                mechanismRow("3", "Unity Realized", "Oneness with source experienced", .green)
            }
            
            Text("The map is not the territory. The name is not the thing. But all maps point to the same mountain.")
                .font(.system(size: 12))
                .foregroundColor(.white.opacity(0.8))
                .italic()
        }
        .padding()
        .background(Color.cyan.opacity(0.1))
        .cornerRadius(16)
    }
    
    private func mechanismRow(_ num: String, _ title: String, _ desc: String, _ color: Color) -> some View {
        HStack(spacing: 12) {
            ZStack {
                Circle()
                    .fill(color.opacity(0.3))
                    .frame(width: 32, height: 32)
                Text(num)
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(color)
            }
            
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.white)
                Text(desc)
                    .font(.system(size: 11))
                    .foregroundColor(.gray)
            }
        }
    }
    
    // MARK: - Comparison Button
    
    private var comparisonButton: some View {
        Button(action: {
            showingComparison = true
        }) {
            HStack {
                Image(systemName: "tablecells")
                Text("View Full Comparison Grid")
                    .font(.system(size: 14, weight: .semibold))
            }
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.white.opacity(0.1))
            .cornerRadius(12)
        }
    }
}

// MARK: - Tradition Node Model

struct TraditionNode: Identifiable {
    let id = UUID()
    let name: String
    let icon: String
    let color: Color
    let energyTerm: String
    let egoTerm: String
    let unityTerm: String
    let angle: Double
}

// MARK: - Comparison Grid View

struct ComparisonGridView: View {
    let traditions: [TraditionNode]
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            ScrollView(.horizontal) {
                VStack(alignment: .leading, spacing: 0) {
                    // Header Row
                    HStack(spacing: 0) {
                        headerCell("Tradition", .gray)
                        headerCell("Energy Term", .red)
                        headerCell("Ego Term", .orange)
                        headerCell("Unity Term", .green)
                    }
                    
                    Divider().background(Color.white.opacity(0.3))
                    
                    // Data Rows
                    ForEach(traditions) { tradition in
                        HStack(spacing: 0) {
                            VStack {
                                Text(tradition.icon)
                                    .font(.system(size: 20))
                                Text(tradition.name)
                                    .font(.system(size: 11, weight: .medium))
                                    .foregroundColor(.white)
                            }
                            .frame(width: 90, height: 60)
                            .background(tradition.color.opacity(0.2))
                            
                            dataCell(tradition.energyTerm)
                            dataCell(tradition.egoTerm)
                            dataCell(tradition.unityTerm)
                        }
                        
                        Divider().background(Color.white.opacity(0.1))
                    }
                }
            }
            .background(Color.black.ignoresSafeArea())
            .navigationTitle("Comparison Grid")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") { dismiss() }
                }
            }
        }
    }
    
    private func headerCell(_ text: String, _ color: Color) -> some View {
        Text(text)
            .font(.system(size: 12, weight: .bold))
            .foregroundColor(color)
            .frame(width: 90, height: 40)
            .background(Color.white.opacity(0.05))
    }
    
    private func dataCell(_ text: String) -> some View {
        Text(text)
            .font(.system(size: 12))
            .foregroundColor(.white.opacity(0.8))
            .frame(width: 90, height: 60)
            .background(Color.white.opacity(0.02))
    }
}

// MARK: - Preview

#Preview("OnenessCoreView") {
    NavigationStack {
        OnenessCoreView()
    }
}
