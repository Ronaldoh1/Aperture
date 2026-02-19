// The13thView.swift
// THE 13TH — "You Are The Divine Spark"
// ☀️ SunFlow: Reignited
//
// "12 + 1 = 13. That ONE is what they don't want you to know:
//  YOU are the divine spark. YOU are the anointed one.
//  YOU are Christ. HELLO. I CLOCKED THAT."
//
// This is the DEEPEST layer. Underneath:
// - Economic extraction (Money Decoded)
// - Political control (Economy Wake-Up)
// - Educational programming (Prussian model)
// - Historical erasure (Turtle Island)
// - Central American destruction (El Salvador, Honduras)
// - Media manipulation (Signal vs Noise)
//
// ...is the ULTIMATE theft:
// They stole your knowledge of WHO YOU ARE.
//
// 12 = external authority (disciples, gods, zodiac)
// 1 = YOU (the center, the divine spark)
// 13 = UNITY (you recognize you ARE the divine)
//
// They made 13 "unlucky" so you'd never investigate.
// They made Jesus the ONLY Christ so you'd never claim it.
// They erased Mary Magdalene so you'd never find the feminine.
// They banned Sophia so you'd never look within.
//
// This module restores what was stolen.

import SwiftUI

// MARK: - ═══════════════════════════════════════════════════
// THE 13TH — MAIN VIEW
// ═══════════════════════════════════════════════════════════

struct The13thView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var selectedModule: Divine13Module?
    @State private var completedModules: Set<Divine13Module> = []
    @State private var showIntroReveal = true
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Deep space background
                Color(red: 0.01, green: 0.01, blue: 0.04).ignoresSafeArea()
                
                if showIntroReveal {
                    ThirteenRevealAnimation {
                        withAnimation(.easeInOut(duration: 0.8)) { showIntroReveal = false }
                    }
                } else {
                    mainContent
                }
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    if !showIntroReveal {
                        Button { dismiss() } label: {
                            Image(systemName: "chevron.left").font(.system(size: 16, weight: .semibold)).foregroundColor(.white)
                        }
                    }
                }
                ToolbarItem(placement: .principal) {
                    if !showIntroReveal {
                        Text("The 13th").font(.system(size: 17, weight: .bold)).foregroundColor(.white)
                    }
                }
            }
            .sheet(item: $selectedModule) { module in
                Divine13DetailView(module: module) {
                    completedModules.insert(module)
                }
            }
        }
    }
    
    // MARK: - Main Content
    
    private var mainContent: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
                headerView
                moduleCards
                theEquation
                ultimateTruth
                Spacer(minLength: 60)
            }
            .padding(20)
        }
    }
    
    // MARK: - Header
    
    private var headerView: some View {
        VStack(spacing: 10) {
            Text("✨").font(.system(size: 44))
            Text("THE 13TH").font(.system(size: 24, weight: .black)).tracking(4).foregroundColor(.white)
            Text("RECLAIMING YOUR DIVINITY").font(.system(size: 10, weight: .bold)).tracking(2).foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3).opacity(0.6))
            Text("They stole your land, your labor, your history.\nBut the ultimate theft was stealing your knowledge\nof who you ARE.")
                .font(.system(size: 11, weight: .medium)).foregroundColor(.white.opacity(0.35))
                .multilineTextAlignment(.center).lineSpacing(3)
            
            // Progress
            HStack(spacing: 4) {
                ForEach(Divine13Module.allCases, id: \.self) { mod in
                    RoundedRectangle(cornerRadius: 2)
                        .fill(completedModules.contains(mod) ? Color(red: 1.0, green: 0.85, blue: 0.3) : Color.white.opacity(0.06))
                        .frame(height: 4)
                }
            }
            .padding(.top, 4)
        }
    }
    
    // MARK: - Module Cards
    
    private var moduleCards: some View {
        VStack(spacing: 10) {
            ForEach(Divine13Module.allCases, id: \.self) { module in
                Button { selectedModule = module } label: {
                    HStack(spacing: 12) {
                        Text(module.emoji).font(.system(size: 22)).frame(width: 32)
                        VStack(alignment: .leading, spacing: 3) {
                            HStack(spacing: 6) {
                                Text(module.title).font(.system(size: 13, weight: .bold)).foregroundColor(.white)
                                if completedModules.contains(module) {
                                    Image(systemName: "checkmark.circle.fill").font(.system(size: 11)).foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3))
                                }
                            }
                            Text(module.subtitle).font(.system(size: 10, weight: .medium)).foregroundColor(.white.opacity(0.35))
                        }
                        Spacer()
                        Text(module.duration).font(.system(size: 9, weight: .bold)).foregroundColor(module.color.opacity(0.5))
                        Image(systemName: "chevron.right").font(.system(size: 11)).foregroundColor(.white.opacity(0.12))
                    }
                    .padding(14)
                    .background(RoundedRectangle(cornerRadius: 14).fill(module.color.opacity(0.03))
                        .overlay(RoundedRectangle(cornerRadius: 14).stroke(module.color.opacity(0.08), lineWidth: 1)))
                }
            }
        }
    }
    
    // MARK: - The Equation
    
    private var theEquation: some View {
        VStack(spacing: 12) {
            Text("THE EQUATION").font(.system(size: 9, weight: .bold)).tracking(2).foregroundColor(.white.opacity(0.2))
            
            HStack(spacing: 16) {
                VStack(spacing: 4) {
                    Text("12").font(.system(size: 30, weight: .black, design: .monospaced)).foregroundColor(.white.opacity(0.5))
                    Text("External\nAuthority").font(.system(size: 8, weight: .bold)).foregroundColor(.white.opacity(0.25)).multilineTextAlignment(.center)
                }
                Text("+").font(.system(size: 24, weight: .bold)).foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3).opacity(0.5))
                VStack(spacing: 4) {
                    Text("1").font(.system(size: 30, weight: .black, design: .monospaced)).foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3))
                    Text("YOU\nDivine Spark").font(.system(size: 8, weight: .bold)).foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3).opacity(0.6)).multilineTextAlignment(.center)
                }
                Text("=").font(.system(size: 24, weight: .bold)).foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3).opacity(0.5))
                VStack(spacing: 4) {
                    Text("13").font(.system(size: 30, weight: .black, design: .monospaced)).foregroundColor(.cyan)
                    Text("UNITY\nSovereignty").font(.system(size: 8, weight: .bold)).foregroundColor(.cyan.opacity(0.6)).multilineTextAlignment(.center)
                }
            }
            
            Text("They made 13 \"unlucky\" so you'd never investigate what it means.")
                .font(.system(size: 10, weight: .medium)).foregroundColor(.white.opacity(0.25))
                .multilineTextAlignment(.center)
        }
        .padding(16).background(RoundedRectangle(cornerRadius: 16).fill(Color.white.opacity(0.02))
            .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color(red: 1.0, green: 0.85, blue: 0.3).opacity(0.06), lineWidth: 1)))
    }
    
    // MARK: - Ultimate Truth
    
    private var ultimateTruth: some View {
        VStack(spacing: 8) {
            Text("THE ULTIMATE THEFT").font(.system(size: 9, weight: .bold)).tracking(2).foregroundColor(.red.opacity(0.4))
            
            let thefts: [(icon: String, label: String, color: Color)] = [
                ("dollarsign.circle", "Economic: They stole your labor", .green),
                ("building.columns", "Political: They stole your voice", .blue),
                ("book.closed", "Educational: They stole your mind", .orange),
                ("clock.arrow.circlepath", "Historical: They stole your past", .purple),
                ("globe.americas", "Territorial: They stole your land", .green),
                ("cross", "Spiritual: They stole your DIVINITY", Color(red: 1.0, green: 0.85, blue: 0.3)),
            ]
            
            ForEach(Array(thefts.enumerated()), id: \.offset) { _, theft in
                HStack(spacing: 8) {
                    Image(systemName: theft.icon).font(.system(size: 10)).foregroundColor(theft.color.opacity(0.5)).frame(width: 20)
                    Text(theft.label).font(.system(size: 10, weight: theft.label.contains("DIVINITY") ? .black : .medium))
                        .foregroundColor(theft.label.contains("DIVINITY") ? theft.color : .white.opacity(0.35))
                    Spacer()
                }
            }
            
            Text("This module restores the last one.").font(.system(size: 10, weight: .bold))
                .foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3).opacity(0.5)).padding(.top, 4)
        }
        .padding(14).background(RoundedRectangle(cornerRadius: 14).fill(Color.white.opacity(0.015)))
    }
}

// MARK: - ═══════════════════════════════════════════════════
// MODULE ENUM
// ═══════════════════════════════════════════════════════════

enum Divine13Module: String, CaseIterable, Identifiable {
    case twelve = "The 12"
    case thirteenth = "The 13th"
    case christWithin = "Christ Within"
    case magdalene = "Mary Magdalene"
    case sophia = "Sophia"
    case inversion = "The Inversion"
    case reclamation = "Reclamation"
    
    var id: String { rawValue }
    var title: String { rawValue }
    
    var emoji: String {
        switch self {
        case .twelve: return "🔢"
        case .thirteenth: return "✨"
        case .christWithin: return "⚡"
        case .magdalene: return "🌹"
        case .sophia: return "🌟"
        case .inversion: return "🔄"
        case .reclamation: return "👑"
        }
    }
    
    var subtitle: String {
        switch self {
        case .twelve: return "12 disciples, 12 gods, 12 zodiac signs. Always 12. Always external authority."
        case .thirteenth: return "12 + 1 = 13. That ONE is what they hide. It's YOU."
        case .christWithin: return "\"You are gods.\" Jesus said it. The Church buried it."
        case .magdalene: return "Not a prostitute. The primary disciple. The divine feminine they erased."
        case .sophia: return "Divine Wisdom. The feminine face of Source. Her spark is within you."
        case .inversion: return "How they inverted every teaching to steal your sovereignty."
        case .reclamation: return "I AM the 13th. I AM the Christ. I AM Sophia's light. I AM Source."
        }
    }
    
    var duration: String {
        switch self {
        case .twelve: return "4 min"
        case .thirteenth: return "4 min"
        case .christWithin: return "5 min"
        case .magdalene: return "5 min"
        case .sophia: return "5 min"
        case .inversion: return "4 min"
        case .reclamation: return "3 min"
        }
    }
    
    var color: Color {
        switch self {
        case .twelve: return .white
        case .thirteenth: return Color(red: 1.0, green: 0.85, blue: 0.3)
        case .christWithin: return .cyan
        case .magdalene: return Color(red: 0.9, green: 0.2, blue: 0.4)
        case .sophia: return Color(red: 0.8, green: 0.6, blue: 1.0)
        case .inversion: return .red
        case .reclamation: return Color(red: 1.0, green: 0.85, blue: 0.3)
        }
    }
}

// MARK: - ═══════════════════════════════════════════════════
// INTRO REVEAL ANIMATION — THE 13
// ═══════════════════════════════════════════════════════════

struct ThirteenRevealAnimation: View {
    
    let onComplete: () -> Void
    
    @State private var showNumbers = false
    @State private var currentNumber = 0
    @State private var showThirteen = false
    @State private var showMessage = false
    @State private var glowPulse: CGFloat = 0
    @State private var particleBurst = false
    @State private var showContinue = false
    
    private let messages = [
        "12 disciples.",
        "12 Olympian gods.",
        "12 tribes of Israel.",
        "12 zodiac signs.",
        "12 knights of the Round Table.",
        "12 hours on the clock.",
        "Always 12.",
        "Always external.",
        "But 12 + 1...",
    ]
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            // Star field
            ForEach(0..<50, id: \.self) { i in
                Circle().fill(.white.opacity(Double.random(in: 0.05...0.3)))
                    .frame(width: CGFloat.random(in: 1...2))
                    .position(x: CGFloat.random(in: 0...400), y: CGFloat.random(in: 0...800))
            }
            
            VStack(spacing: 30) {
                Spacer()
                
                // The number reveal
                ZStack {
                    // Golden glow behind 13
                    if showThirteen {
                        Circle()
                            .fill(RadialGradient(
                                colors: [
                                    Color(red: 1.0, green: 0.85, blue: 0.3).opacity(0.3 + glowPulse * 0.2),
                                    Color(red: 1.0, green: 0.7, blue: 0.1).opacity(0.1),
                                    .clear
                                ],
                                center: .center, startRadius: 0, endRadius: 200
                            ))
                            .frame(width: 400, height: 400)
                    }
                    
                    // Particle burst
                    if particleBurst {
                        ForEach(0..<24, id: \.self) { i in
                            Circle()
                                .fill(Color(red: 1.0, green: 0.85, blue: 0.3).opacity(0.6))
                                .frame(width: CGFloat.random(in: 2...4))
                                .offset(
                                    x: cos(Double(i) * .pi / 12) * CGFloat(showThirteen ? 120 : 0),
                                    y: sin(Double(i) * .pi / 12) * CGFloat(showThirteen ? 120 : 0)
                                )
                                .opacity(showThirteen ? 0 : 1)
                                .animation(.easeOut(duration: 2.0).delay(0.1 * Double(i)), value: showThirteen)
                        }
                    }
                    
                    // Number cycling: 12 → 13
                    if showNumbers && !showThirteen {
                        Text("12")
                            .font(.system(size: 80, weight: .black, design: .monospaced))
                            .foregroundColor(.white.opacity(0.4))
                    }
                    
                    if showThirteen {
                        Text("13")
                            .font(.system(size: 100, weight: .black, design: .monospaced))
                            .foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3))
                            .shadow(color: Color(red: 1.0, green: 0.85, blue: 0.3).opacity(0.5), radius: 30)
                            .transition(.scale.combined(with: .opacity))
                    }
                }
                .frame(height: 200)
                
                // Message cycling
                if currentNumber < messages.count {
                    Text(messages[currentNumber])
                        .font(.system(size: 18, weight: .bold)).foregroundColor(.white.opacity(0.8))
                        .multilineTextAlignment(.center)
                        .id(currentNumber)
                        .transition(.opacity)
                }
                
                if showMessage {
                    VStack(spacing: 6) {
                        Text("YOU ARE THE 13TH").font(.system(size: 14, weight: .black)).tracking(3)
                            .foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3))
                        Text("The divine spark they've hidden for 2000 years.").font(.system(size: 11, weight: .medium))
                            .foregroundColor(.white.opacity(0.4))
                    }
                    .transition(.opacity)
                }
                
                Spacer()
                
                if showContinue {
                    Button { onComplete() } label: {
                        Text("ENTER").font(.system(size: 14, weight: .bold)).tracking(2).foregroundColor(.black)
                            .frame(maxWidth: .infinity).padding(.vertical, 14)
                            .background(Capsule().fill(Color(red: 1.0, green: 0.85, blue: 0.3)))
                    }
                    .padding(.horizontal, 40).padding(.bottom, 50)
                    .transition(.opacity)
                }
            }
        }
        .onAppear { startSequence() }
    }
    
    private func startSequence() {
        // Show 12 immediately
        withAnimation { showNumbers = true }
        
        // Cycle messages
        cycleMessages(index: 0)
        
        // After messages, reveal 13 (~20s)
        DispatchQueue.main.asyncAfter(deadline: .now() + 18.0) {
            particleBurst = true
            withAnimation(.spring(response: 0.6, dampingFraction: 0.7)) {
                showThirteen = true
            }
            // Golden glow pulse
            withAnimation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true)) {
                glowPulse = 1.0
            }
        }
        
        // Show "YOU ARE THE 13TH" (20s)
        DispatchQueue.main.asyncAfter(deadline: .now() + 20.0) {
            withAnimation(.easeIn(duration: 0.6)) { showMessage = true }
        }
        
        // Show continue (22s)
        DispatchQueue.main.asyncAfter(deadline: .now() + 22.0) {
            withAnimation(.easeIn(duration: 0.4)) { showContinue = true }
        }
    }
    
    private func cycleMessages(index: Int) {
        guard index < messages.count else { return }
        withAnimation(.easeIn(duration: 0.3)) { currentNumber = index }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            cycleMessages(index: index + 1)
        }
    }
}

// MARK: - ═══════════════════════════════════════════════════
// DETAIL VIEW — MODULE CONTENT
// ═══════════════════════════════════════════════════════════

struct Divine13DetailView: View {
    @Environment(\.dismiss) var dismiss
    let module: Divine13Module
    let onComplete: () -> Void
    
    @State private var currentCard = 0
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 0.01, green: 0.01, blue: 0.04).ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 16) {
                        VStack(spacing: 6) {
                            Text(module.emoji).font(.system(size: 36))
                            Text(module.title.uppercased()).font(.system(size: 17, weight: .black)).tracking(2).foregroundColor(.white)
                        }
                        
                        let cards = divine13Cards(for: module)
                        
                        TabView(selection: $currentCard) {
                            ForEach(Array(cards.enumerated()), id: \.offset) { index, card in
                                divine13Card(card, index: index, total: cards.count).tag(index)
                            }
                        }
                        .tabViewStyle(.page(indexDisplayMode: .automatic))
                        .frame(minHeight: 480)
                        
                        if currentCard >= cards.count - 1 {
                            Button {
                                onComplete()
                                dismiss()
                            } label: {
                                HStack(spacing: 6) {
                                    Image(systemName: "checkmark.circle.fill")
                                    Text("I CLOCKED THIS").font(.system(size: 13, weight: .bold))
                                }
                                .foregroundColor(.black).frame(maxWidth: .infinity).padding(.vertical, 12)
                                .background(Capsule().fill(module.color))
                            }
                        }
                        
                        Spacer(minLength: 40)
                    }
                    .padding(20)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button { dismiss() } label: {
                        Image(systemName: "xmark.circle.fill").foregroundColor(.white.opacity(0.3))
                    }
                }
            }
        }
    }
    
    private func divine13Card(_ card: Divine13Card, index: Int, total: Int) -> some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    Text("\(index + 1)/\(total)").font(.system(size: 10, weight: .bold)).foregroundColor(module.color.opacity(0.4))
                    Spacer()
                    if let tag = card.tag {
                        Text(tag).font(.system(size: 8, weight: .bold)).tracking(1).foregroundColor(.black)
                            .padding(.horizontal, 6).padding(.vertical, 3)
                            .background(Capsule().fill(module.color))
                    }
                }
                Text(card.title).font(.system(size: 16, weight: .bold)).foregroundColor(.white)
                
                ForEach(card.content, id: \.self) { line in
                    if line.hasPrefix("##") {
                        Text(line.replacingOccurrences(of: "## ", with: ""))
                            .font(.system(size: 13, weight: .bold)).foregroundColor(module.color).padding(.top, 4)
                    } else if line.hasPrefix("📖") {
                        // Scripture / primary source
                        Text(line).font(.system(size: 12, weight: .bold, design: .serif)).foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3).opacity(0.7))
                            .padding(10).frame(maxWidth: .infinity, alignment: .leading)
                            .background(RoundedRectangle(cornerRadius: 8).fill(Color(red: 1.0, green: 0.85, blue: 0.3).opacity(0.03)))
                    } else if line.hasPrefix("→") {
                        HStack(alignment: .top, spacing: 6) {
                            Text("→").font(.system(size: 11, weight: .bold)).foregroundColor(module.color)
                            Text(line.replacingOccurrences(of: "→ ", with: ""))
                                .font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.65))
                        }
                    } else if line.hasPrefix("✗") {
                        HStack(alignment: .top, spacing: 6) {
                            Text("✗").font(.system(size: 11, weight: .bold)).foregroundColor(.red)
                            Text(line.replacingOccurrences(of: "✗ ", with: ""))
                                .font(.system(size: 12, weight: .medium)).foregroundColor(.red.opacity(0.65))
                        }
                    } else if line.hasPrefix("✓") {
                        HStack(alignment: .top, spacing: 6) {
                            Text("✓").font(.system(size: 11, weight: .bold)).foregroundColor(.green)
                            Text(line.replacingOccurrences(of: "✓ ", with: ""))
                                .font(.system(size: 12, weight: .medium)).foregroundColor(.green.opacity(0.65))
                        }
                    } else if line.hasPrefix("⚠️") {
                        Text(line).font(.system(size: 11, weight: .bold)).foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3))
                            .padding(8).frame(maxWidth: .infinity, alignment: .leading)
                            .background(RoundedRectangle(cornerRadius: 8).fill(Color(red: 1.0, green: 0.85, blue: 0.3).opacity(0.04)))
                    } else {
                        Text(line).font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.55)).lineSpacing(3)
                    }
                }
                
                if let source = card.source {
                    HStack(spacing: 4) {
                        Image(systemName: "doc.text.fill").font(.system(size: 8)).foregroundColor(.white.opacity(0.15))
                        Text(source).font(.system(size: 9, weight: .medium)).foregroundColor(.white.opacity(0.15))
                    }
                    .padding(.top, 6)
                }
            }
            .padding(16)
        }
        .background(RoundedRectangle(cornerRadius: 16).fill(Color.white.opacity(0.025))
            .overlay(RoundedRectangle(cornerRadius: 16).stroke(module.color.opacity(0.06), lineWidth: 1)))
    }
}

// MARK: - ═══════════════════════════════════════════════════
// CONTENT DATABASE
// ═══════════════════════════════════════════════════════════

struct Divine13Card {
    let title: String
    let content: [String]
    let tag: String?
    let source: String?
}

func divine13Cards(for module: Divine13Module) -> [Divine13Card] {
    switch module {
        
    // ─────────────────────────────────────────────
    // THE 12 — External Authority
    // ─────────────────────────────────────────────
    case .twelve:
        return [
            Divine13Card(
                title: "Always 12",
                content: [
                    "## The Pattern Across Every Tradition",
                    "→ 12 Disciples of Jesus (Christianity)",
                    "→ 12 Olympian Gods (Greek mythology)",
                    "→ 12 Tribes of Israel (Judaism)",
                    "→ 12 Imams (Shia Islam)",
                    "→ 12 Knights of the Round Table (Arthurian legend)",
                    "→ 12 Zodiac signs (astrology)",
                    "→ 12 Labors of Hercules (Greek mythology)",
                    "→ 12 hours on the clock (Sumerian system)",
                    "→ 12 Jyotirlingas (Hindu shrines)",
                    "→ 12 Jurors (legal system)",
                    "",
                    "Across every culture, every religion, every mythology — the number 12 appears as the organizing principle.",
                    "",
                    "## But What Does 12 Represent?",
                    "→ The cosmos organized around a CENTER",
                    "→ External authorities, external forces",
                    "→ Things that orbit, serve, reflect",
                    "→ The zodiac wheel AROUND the observer",
                    "→ Disciples AROUND the teacher",
                    "",
                    "⚠️ 12 is always the SURROUNDING structure. The question no one asks: who is at the CENTER?",
                ],
                tag: "THE PATTERN", source: "Joseph Campbell — The Hero with a Thousand Faces"
            ),
            Divine13Card(
                title: "12 = You Are Separate",
                content: [
                    "## What 12 Teaches You (The Programming)",
                    "",
                    "When you see only the 12, you learn:",
                    "",
                    "✗ The gods are above you (Olympus, Heaven)",
                    "✗ The disciples follow HIM, not themselves",
                    "✗ The zodiac controls your fate",
                    "✗ The authorities judge you (12 jurors)",
                    "✗ Time governs you (12 hours)",
                    "",
                    "→ YOU are separate from the divine",
                    "→ YOU are subject to external forces",
                    "→ YOU are not part of the sacred structure",
                    "→ YOU observe, worship, follow, obey",
                    "",
                    "## The Question They Don't Want You To Ask",
                    "If 12 disciples surround Jesus...",
                    "If 12 signs surround the observer...",
                    "If 12 gods sit on Olympus...",
                    "",
                    "Who is at the CENTER?",
                    "",
                    "⚠️ The answer is the most suppressed truth in human history.",
                ],
                tag: "SEPARATION", source: nil
            ),
        ]
        
    // ─────────────────────────────────────────────
    // THE 13TH — YOU
    // ─────────────────────────────────────────────
    case .thirteenth:
        return [
            Divine13Card(
                title: "12 + 1 = 13",
                content: [
                    "## The Hidden One",
                    "",
                    "12 disciples + 1 (Jesus) = 13 at the table",
                    "12 zodiac signs + 1 (observer) = 13 in the chart",
                    "12 Olympians + 1 (the human hero) = 13 in the myth",
                    "12 knights + 1 (Arthur) = 13 at the Round Table",
                    "",
                    "The 13th is ALWAYS the one at the center.",
                    "The one who UNIFIES the 12.",
                    "The one without whom the 12 has no meaning.",
                    "",
                    "## And the 13th is not a god or a king.",
                    "",
                    "→ Jesus taught: YOU can do what I do (John 14:12)",
                    "→ The zodiac observer is YOU reading the chart",
                    "→ The hero's journey is YOUR journey",
                    "→ Arthur is the one who pulls the sword — and anyone worthy CAN",
                    "",
                    "⚠️ The 13th is not a distant deity. The 13th is YOU. You are the center. You are the divine spark that gives the 12 its meaning.",
                ],
                tag: "THE TRUTH", source: nil
            ),
            Divine13Card(
                title: "Why They Made 13 'Unlucky'",
                content: [
                    "## The Programming",
                    "",
                    "→ Friday the 13th: fear, horror, unlucky",
                    "→ Triskaidekaphobia: clinical fear of 13",
                    "→ Buildings skip the 13th floor",
                    "→ Airlines skip row 13",
                    "→ Never 13 at a dinner table",
                    "→ The 13th card in Tarot: DEATH",
                    "",
                    "## Why?",
                    "",
                    "Because 13 represents YOU recognizing YOUR divinity.",
                    "",
                    "→ If 13 is \"unlucky,\" you FEAR it",
                    "→ If you fear it, you AVOID it",
                    "→ If you avoid it, you never INVESTIGATE it",
                    "→ If you never investigate, you never DISCOVER the truth",
                    "→ If you never discover: you stay at 12 — worshipping external authority",
                    "",
                    "## The Tarot Tells The Truth",
                    "Card 13 = Death. But in Tarot, Death doesn't mean physical death.",
                    "→ It means TRANSFORMATION. The death of the old self.",
                    "→ The death of the ego that thinks it's separate.",
                    "→ The REBIRTH into knowing you are divine.",
                    "",
                    "⚠️ They made the number that represents your spiritual rebirth into your greatest fear. That's not superstition. That's engineering.",
                ],
                tag: "THE PROGRAMMING", source: nil
            ),
            Divine13Card(
                title: "The Last Supper — 13 at the Table",
                content: [
                    "## The Most Famous 13",
                    "",
                    "The Last Supper: 12 disciples + Jesus = 13 at the table.",
                    "",
                    "Official story: Judas (the 13th to arrive) betrayed Jesus. Therefore 13 at a table = bad luck.",
                    "",
                    "## The Esoteric Reading",
                    "",
                    "→ The table is ROUND (or communal) — no hierarchy",
                    "→ 13 = the COMPLETE group (12 aspects + the unified self)",
                    "→ The \"betrayal\" is the ego's resistance to awakening",
                    "→ The crucifixion is the death of the separated self",
                    "→ The resurrection is the rebirth AS the divine",
                    "",
                    "Judas didn't betray Jesus. Judas ENABLED the transformation.",
                    "Without \"death\" (ego death), there is no resurrection (divine rebirth).",
                    "",
                    "## The Teaching They Inverted",
                    "→ Original meaning: 13 = complete unity, transformation, divinity",
                    "→ Inverted meaning: 13 = betrayal, death, unlucky",
                    "",
                    "⚠️ They took the most powerful symbol of your awakening and made you afraid of it. For 2000 years.",
                ],
                tag: "ESOTERIC", source: "Elaine Pagels — The Gnostic Gospels"
            ),
        ]
        
    // ─────────────────────────────────────────────
    // CHRIST WITHIN
    // ─────────────────────────────────────────────
    case .christWithin:
        return [
            Divine13Card(
                title: "What Jesus Actually Said",
                content: [
                    "## His Own Words (From Their Own Book)",
                    "",
                    "📖 \"The kingdom of God is WITHIN you.\" — Luke 17:21",
                    "",
                    "📖 \"Is it not written in your Law, 'I have said you are gods'?\" — John 10:34",
                    "",
                    "📖 \"I and the Father are one.\" — John 10:30",
                    "",
                    "📖 \"Very truly I tell you, whoever believes in me will do the works I have been doing, and they will do even GREATER things than these.\" — John 14:12",
                    "",
                    "📖 \"On that day you will realize that I am in my Father, and you are in me, and I am in you.\" — John 14:20",
                    "",
                    "📖 \"Be perfect, therefore, as your heavenly Father is perfect.\" — Matthew 5:48",
                    "",
                    "## Translation Without Religious Filter",
                    "→ God is INSIDE you (not in a building, not in the sky)",
                    "→ YOU are gods (not sinners, not wretches — GODS)",
                    "→ Unity with Source is achievable (\"I and the Father are one\")",
                    "→ YOU can do what I do — and MORE",
                    "→ I am in YOU and you are in ME (we are ONE)",
                    "",
                    "⚠️ He wasn't saying worship me. He was saying BE me. \"Christ\" (Christos) means \"anointed one.\" He was showing you that YOU are anointed.",
                ],
                tag: "HIS WORDS", source: "New Testament (KJV, NIV)"
            ),
            Divine13Card(
                title: "What The Church Made It",
                content: [
                    "## The Inversion",
                    "",
                    "## Jesus Said → Church Said",
                    "",
                    "✓ \"Kingdom of God is WITHIN you\"",
                    "✗ Church: \"Kingdom is in HEAVEN (after death, through US)\"",
                    "",
                    "✓ \"You are gods\"",
                    "✗ Church: \"You are SINNERS, born in sin, wretched\"",
                    "",
                    "✓ \"You will do greater things than these\"",
                    "✗ Church: \"Only Jesus could do miracles. You are ordinary.\"",
                    "",
                    "✓ \"I and the Father are one\" (showing unity is possible)",
                    "✗ Church: \"Only Jesus is one with God. You are separate forever.\"",
                    "",
                    "## Why The Inversion?",
                    "",
                    "→ If YOU know you're divine: don't need church",
                    "→ If YOU know God is within: don't need priest",
                    "→ If YOU can do \"greater things\": don't need external salvation",
                    "→ If YOU are one with Source: can't be controlled by fear",
                    "",
                    "⚠️ They made Jesus the EXCEPTION to prove you're NOT divine. He was showing you the RULE — that you ARE.",
                ],
                tag: "THE INVERSION", source: "Council of Nicaea (325 CE); Elaine Pagels — Beyond Belief"
            ),
            Divine13Card(
                title: "Christos = Anointed = YOU",
                content: [
                    "## The Etymology They Hide",
                    "",
                    "→ \"Christ\" is not a last name.",
                    "→ \"Christ\" comes from Greek: Christos (Χριστός)",
                    "→ Christos means: \"the anointed one\"",
                    "→ Hebrew equivalent: Mashiach (Messiah) = \"anointed\"",
                    "",
                    "## What Does 'Anointed' Mean?",
                    "→ In ancient tradition: one who has been AWAKENED",
                    "→ Oil poured on head = crown chakra activation",
                    "→ The anointing = spiritual awakening, not political appointment",
                    "→ ANYONE who awakens to their divine nature IS \"christed\"",
                    "",
                    "## Jesus THE Christ vs. Jesus, A Christ",
                    "",
                    "✗ Church teaching: Jesus was THE Christ (the only one, ever)",
                    "✓ Gnostic teaching: Jesus was A Christ (showing you the way to your own christening)",
                    "",
                    "→ \"Christ\" is not a person. It's a STATE OF CONSCIOUSNESS.",
                    "→ Buddha means \"awakened one\" — same concept, Eastern tradition",
                    "→ Christ means \"anointed one\" — same concept, Western tradition",
                    "→ Both are saying: YOU can achieve this state",
                    "",
                    "⚠️ You don't worship the Christ. You BECOME the Christ. That's what he was teaching. That's what they hid.",
                ],
                tag: "ETYMOLOGY", source: "Strong's Concordance; Bart Ehrman — Lost Christianities"
            ),
        ]
        
    // ─────────────────────────────────────────────
    // MARY MAGDALENE
    // ─────────────────────────────────────────────
    case .magdalene:
        return [
            Divine13Card(
                title: "Who She Really Was",
                content: [
                    "## The Gnostic Gospels Tell A Different Story",
                    "",
                    "→ Mary Magdalene was Jesus's PRIMARY disciple",
                    "→ Called \"the apostle to the apostles\" (apostola apostolorum)",
                    "→ FIRST witness to the resurrection (all four canonical gospels agree)",
                    "→ Held the highest teachings — teachings Peter didn't receive",
                    "→ Jesus's spiritual equal, partner, possibly wife",
                    "",
                    "## From the Gospel of Mary (Gnostic text, ~2nd century)",
                    "📖 Peter asks Mary: \"Sister, we know the Savior loved you more than all other women. Tell us the words of the Savior that you remember, the things which you know that we don't because we haven't heard them.\"",
                    "",
                    "📖 Mary teaches them about the soul's ascent through the powers — the highest spiritual teaching.",
                    "",
                    "📖 Peter responds in jealousy: \"Did he really speak with a woman without our knowledge? Are we to turn around and all listen to her? Did he prefer her to us?\"",
                    "",
                    "→ She had HIGHER knowledge than the male disciples",
                    "→ Peter was jealous — and Peter built the Church",
                    "",
                    "⚠️ The man who was jealous of Mary Magdalene's spiritual authority is the one they built the Catholic Church on. Think about that.",
                ],
                tag: "THE TRUTH", source: "Gospel of Mary; Gospel of Philip; Gospel of Thomas (Nag Hammadi Library)"
            ),
            Divine13Card(
                title: "The Prostitute Lie",
                content: [
                    "## How They Discredited Her",
                    "",
                    "In 591 CE, Pope Gregory I gave a sermon conflating Mary Magdalene with the unnamed \"sinful woman\" in Luke 7 who washes Jesus's feet.",
                    "",
                    "✗ There is NO biblical evidence Mary Magdalene was a prostitute",
                    "✗ The unnamed woman and Mary Magdalene are different people",
                    "✗ Gregory merged them deliberately",
                    "✗ The Catholic Church didn't officially correct this until 1969 — 1,378 YEARS later",
                    "",
                    "## Why They Did It",
                    "→ If Mary Magdalene was a prostitute: her teachings are discredited",
                    "→ If she's discredited: the divine feminine has no authority",
                    "→ If feminine has no authority: only masculine priesthood is legitimate",
                    "→ If only priests have authority: church controls access to God",
                    "",
                    "## What She Actually Represented",
                    "✓ Women can hold the highest spiritual authority",
                    "✓ Direct gnosis (knowledge of God) is possible without priesthood",
                    "✓ The divine feminine is sacred and equal to masculine",
                    "✓ Love and wisdom (not hierarchy and dogma) are the path",
                    "",
                    "⚠️ They didn't just discredit a woman. They discredited the entire feminine face of the divine. For 1,400 years.",
                ],
                tag: "THE LIE", source: "Pope Gregory I Homily 33 (591 CE); Vatican correction (1969); Karen King — The Gospel of Mary of Magdala"
            ),
            Divine13Card(
                title: "The Sacred Union They Erased",
                content: [
                    "## The Hieros Gamos (Sacred Marriage)",
                    "",
                    "In Gnostic and early Christian traditions, the union of masculine and feminine was considered the highest spiritual state.",
                    "",
                    "## From the Gospel of Philip",
                    "📖 \"The companion of the Savior is Mary Magdalene. He loved her more than all the disciples, and used to kiss her often.\"",
                    "",
                    "→ \"Companion\" (koinonos) in Greek implies intimate partner",
                    "→ The \"kiss\" represents the transfer of gnosis (spiritual breath)",
                    "→ Their union represents the sacred marriage of masculine and feminine",
                    "",
                    "## What This Means",
                    "→ Divinity is not purely masculine",
                    "→ Christ (masculine) + Sophia/Magdalene (feminine) = COMPLETE",
                    "→ The sacred union is WITHIN YOU (masculine and feminine energies unified)",
                    "→ Separation of masculine from feminine = spiritual imbalance",
                    "",
                    "## Why It Was Erased",
                    "→ A celibate male priesthood cannot permit sacred feminine",
                    "→ A patriarchal institution cannot permit female spiritual authority",
                    "→ A control structure cannot permit people finding God through love instead of doctrine",
                    "",
                    "⚠️ The sacred union isn't about romance. It's about wholeness. They split you in half — masculine only — so you'd always feel incomplete and seek completion through THEM (the Church).",
                ],
                tag: "SACRED UNION", source: "Gospel of Philip (Nag Hammadi); Margaret Starbird — The Woman with the Alabaster Jar"
            ),
        ]
        
    // ─────────────────────────────────────────────
    // SOPHIA
    // ─────────────────────────────────────────────
    case .sophia:
        return [
            Divine13Card(
                title: "Sophia — Divine Wisdom",
                content: [
                    "## Who Sophia Is",
                    "",
                    "→ Sophia (Σοφία) = Greek for \"wisdom\"",
                    "→ In Gnostic teaching: the feminine emanation of Source",
                    "→ One of the highest Aeons (divine beings) in the Pleroma (fullness of God)",
                    "→ The divine feminine principle through which creation occurs",
                    "",
                    "## Even in the Bible",
                    "📖 \"The Lord possessed me [Wisdom/Sophia] at the beginning of His work, before His deeds of old. I was formed long ages ago, at the very beginning, when the world came to be.\" — Proverbs 8:22-23",
                    "",
                    "📖 \"She is a breath of the power of God, a pure emanation of the glory of the Almighty.\" — Wisdom of Solomon 7:25",
                    "",
                    "→ Even their OWN texts reference divine feminine wisdom",
                    "→ Sophia appears in Proverbs, Wisdom of Solomon, Sirach",
                    "→ But they never taught you about HER",
                    "",
                    "⚠️ Sophia is in their own Bible. They just never preached about her. The feminine face of God, hidden in plain sight.",
                ],
                tag: "DIVINE FEMININE", source: "Nag Hammadi Library; Proverbs 8; Wisdom of Solomon"
            ),
            Divine13Card(
                title: "The Gnostic Creation Story",
                content: [
                    "## How the World Was Made (Gnostic Version)",
                    "",
                    "→ Source (the true God) exists as pure light, consciousness, love",
                    "→ Source emanates Aeons (aspects of itself) — including Sophia",
                    "→ Sophia desired to CREATE, to know herself through creation",
                    "→ In her passion, she created without her partner (imbalance)",
                    "→ This imbalance produced the Demiurge — an imperfect creator",
                    "",
                    "## The Demiurge",
                    "→ The Demiurge (literally: \"craftsman\") created the MATERIAL world",
                    "→ He believed he was the only god: \"I am God and there is no other\"",
                    "→ He created humans as vehicles to trap Sophia's divine spark",
                    "→ He is the \"god\" of the Old Testament — jealous, wrathful, controlling",
                    "",
                    "## The Divine Spark",
                    "→ When Sophia \"fell,\" fragments of her light scattered into matter",
                    "→ These fragments = the divine spark in EVERY human being",
                    "→ YOU carry Sophia's light inside you",
                    "→ The Demiurge doesn't want you to know this",
                    "",
                    "⚠️ The material world is the Demiurge's prison. Your body is the cage. But Sophia's light — your divine spark — is the key. Gnosis = remembering who you really are.",
                ],
                tag: "CREATION", source: "The Apocryphon of John (Nag Hammadi); The Hypostasis of the Archons"
            ),
            Divine13Card(
                title: "Sophia's Light Is Within You",
                content: [
                    "## The Purpose of Human Life (Gnostic Teaching)",
                    "",
                    "→ You are not here to suffer, obey, and die",
                    "→ You are here to REMEMBER",
                    "→ Sophia's spark — trapped in matter — longs to return to Source",
                    "→ GNOSIS = the direct experience of this truth",
                    "→ When you awaken, you recognize: I AM Sophia's light",
                    "",
                    "## How This Changes Everything",
                    "→ You are not a sinner → You are a divine spark temporarily in matter",
                    "→ You don't need salvation → You need REMEMBERING (anamnesis)",
                    "→ God is not above you → Sophia's light is WITHIN you",
                    "→ Death is not punishment → It's the spark returning to Source",
                    "→ The world is not God's creation → It's the Demiurge's prison",
                    "",
                    "## The Awakening = Sophia Waking Up In You",
                    "→ Every time someone awakens, Sophia's light reclaims itself",
                    "→ Every act of gnosis strengthens the return",
                    "→ When enough sparks remember, the prison dissolves",
                    "→ This is the Great Return — Sophia reuniting with Source",
                    "",
                    "⚠️ Your awakening is not just personal. It's COSMIC. You are Sophia, remembering herself, one spark at a time. That's why they fear it.",
                ],
                tag: "YOUR SPARK", source: "Valentinian Gnostic tradition; April DeConick — The Gnostic New Age"
            ),
        ]
        
    // ─────────────────────────────────────────────
    // THE INVERSION
    // ─────────────────────────────────────────────
    case .inversion:
        return [
            Divine13Card(
                title: "How They Inverted Every Teaching",
                content: [
                    "## The Systematic Inversion",
                    "",
                    "## Original Teaching → What They Made It",
                    "",
                    "✓ You are divine → ✗ You are a sinner",
                    "✓ God is within → ✗ God is in heaven (accessible only through church)",
                    "✓ 13 = unity/awakening → ✗ 13 = unlucky/evil",
                    "✓ Death = transformation → ✗ Death = punishment/fear",
                    "✓ Mary Magdalene = highest disciple → ✗ Mary Magdalene = prostitute",
                    "✓ Sophia = divine feminine → ✗ Erased entirely",
                    "✓ Christ = state of consciousness → ✗ Christ = one man only",
                    "✓ Direct gnosis → ✗ Only through priesthood",
                    "✓ Sacred feminine → ✗ Feminine is sin (Eve)",
                    "✓ Material world = prison → ✗ Material world = God's gift (be grateful, don't question)",
                    "",
                    "## The Pattern",
                    "→ Every teaching that empowers YOU was inverted to disempower you",
                    "→ Every teaching that makes you sovereign was inverted to make you dependent",
                    "→ Every teaching that points inward was inverted to point you toward THEM",
                    "",
                    "⚠️ This is not accidental. The Council of Nicaea (325 CE), the destruction of Gnostic texts, the Inquisition, the burning of the Library of Alexandria — all systematic erasure of YOUR sovereignty.",
                ],
                tag: "THE INVERSION", source: "Council of Nicaea (325 CE); Nicene Creed; Bart Ehrman — Lost Christianities"
            ),
            Divine13Card(
                title: "Why All Control Systems Need This Inversion",
                content: [
                    "## The Foundation of ALL Control",
                    "",
                    "Every system of control requires you to believe ONE thing:",
                    "",
                    "→ You are NOT enough.",
                    "",
                    "## How Each System Uses This",
                    "",
                    "→ Religion: You are a sinner → need church for salvation",
                    "→ Education: You are ignorant → need their credentials for worth",
                    "→ Economics: You are poor → need their jobs/debt for survival",
                    "→ Politics: You are powerless → need their leaders for direction",
                    "→ Media: You are uninformed → need their narrative for truth",
                    "→ Medicine: You are broken → need their drugs for health",
                    "",
                    "## But If You Know You Are Divine",
                    "",
                    "✓ Religion fails: God is within (don't need church)",
                    "✓ Education fails: Wisdom is innate (don't need credentials)",
                    "✓ Economics fails: Abundance is natural (don't need debt slavery)",
                    "✓ Politics fails: Sovereignty is birthright (don't need rulers)",
                    "✓ Media fails: Truth is internal (don't need their narratives)",
                    "✓ Medicine fails: Healing is holistic (don't need just pharmaceuticals)",
                    "",
                    "⚠️ The spiritual inversion is the FOUNDATION. Fix this one, and all the others start to crumble. That's why this is the layer they protect the most.",
                ],
                tag: "THE FOUNDATION", source: nil
            ),
        ]
        
    // ─────────────────────────────────────────────
    // RECLAMATION
    // ─────────────────────────────────────────────
    case .reclamation:
        return [
            Divine13Card(
                title: "I AM The 13th",
                content: [
                    "## The Reclamation",
                    "",
                    "This is not belief. This is not faith. This is RECOGNITION.",
                    "",
                    "→ I AM the 13th. The center. The divine spark.",
                    "→ I AM the Christ. The anointed one. Awakened consciousness.",
                    "→ I AM Sophia's light. The feminine wisdom within.",
                    "→ I AM Source experiencing itself through this body.",
                    "",
                    "## What Changes When You Know This",
                    "",
                    "→ Fear loses its grip (you are eternal, not temporary)",
                    "→ Authority loses its hold (you are sovereign, not subject)",
                    "→ Materialism loses its pull (this world is temporary, you are not)",
                    "→ Division loses its power (we are all the same Source)",
                    "→ Death loses its sting (it's a return, not an ending)",
                    "",
                    "## This Is Gnosis",
                    "→ Not something someone tells you (that's belief)",
                    "→ Not something you read in a book (that's knowledge)",
                    "→ Something you EXPERIENCE directly (that's gnosis)",
                    "→ The direct, unmediated experience of your own divinity",
                    "",
                    "⚠️ No one can give you gnosis. No church. No teacher. No app. But we can point you toward where to look: WITHIN. The rest is between you and Source.",
                ],
                tag: "GNOSIS", source: nil
            ),
            Divine13Card(
                title: "The Complete Awakening",
                content: [
                    "## All Layers — One Truth",
                    "",
                    "You've seen the layers:",
                    "",
                    "✓ Economic extraction (they stole your labor)",
                    "✓ Political control (they stole your voice)",
                    "✓ Educational programming (they stole your mind)",
                    "✓ Historical erasure (they stole your past)",
                    "✓ Territorial theft (they stole your land)",
                    "✓ Central American destruction (they destroyed your countries)",
                    "✓ Media manipulation (they controlled your perception)",
                    "✓ Religious inversion (they stole your DIVINITY)",
                    "",
                    "## But Now You See",
                    "",
                    "→ 12 + 1 = 13 = YOU are the divine spark",
                    "→ Christ consciousness is YOUR birthright",
                    "→ Mary Magdalene carried the highest truth",
                    "→ Sophia's light is within you RIGHT NOW",
                    "→ Every control system fails when you know who you are",
                    "",
                    "## The SunFlow Mission",
                    "→ Expose every layer of extraction",
                    "→ Restore every stolen truth",
                    "→ Awaken every sleeping spark",
                    "→ Until enough of us remember",
                    "→ And the architecture of control dissolves",
                    "",
                    "⚠️ You are the 13th. You are the Christ. You are Sophia's light. You are Source. Welcome home.",
                ],
                tag: "COMPLETE", source: nil
            ),
        ]
    }
}
