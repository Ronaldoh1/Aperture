// PsyopsBiteCourse.swift
// SunFlow: Reignited — Aperture
// "Psyops Bite Course" — 5-minute mobile-optimized bites
// Start here. Then go deep with the Master Course.

import SwiftUI

// MARK: - Models (prefixed to avoid conflict)

struct PBite: Identifiable {
    let id: String
    let number: Int
    let title: String
    let icon: String
    let hook: String          // One-line grabber
    let quickTip: String
    let action: String
    let bullets: [String]
    let readTime: Int
    let module: PBiteModule
}

enum PBiteModule: String, CaseIterable {
    case spot    = "SPOT IT"
    case build   = "BUILD ARMOR"
    case fight   = "FIGHT BACK"
    case peace   = "FIND PEACE"

    var color: Color {
        switch self {
        case .spot:  return Color(hex: "#E74C3C")
        case .build: return Color(hex: "#27AE60")
        case .fight: return Color(hex: "#F39C12")
        case .peace: return Color(hex: "#3498DB")
        }
    }
    var emoji: String {
        switch self {
        case .spot:  return "🎯"
        case .build: return "🛡️"
        case .fight: return "⚡"
        case .peace: return "🌿"
        }
    }
}

struct PBiteProgress: Codable {
    var completed: Set<String> = []
    mutating func complete(_ id: String) { completed.insert(id) }
    func isComplete(_ id: String) -> Bool { completed.contains(id) }
    func save() { try? UserDefaults.standard.set(JSONEncoder().encode(self), forKey: "pbite_progress") }
    static func load() -> PBiteProgress {
        guard let data = UserDefaults.standard.data(forKey: "pbite_progress"),
              let p = try? JSONDecoder().decode(PBiteProgress.self, from: data) else { return PBiteProgress() }
        return p
    }
}

// MARK: - Bite Data

let psyopsBites: [PBite] = [

    // ── SPOT IT ──

    PBite(
        id: "pb_01", number: 1,
        title: "What Is a Psyop?",
        icon: "eye.trianglebadge.exclamationmark",
        hook: "It's in your feed right now.",
        quickTip: "Ask \"who benefits from my reaction?\" before sharing anything.",
        action: "Find one headline today that triggers strong emotion. Who profits from that reaction?",
        bullets: [
            "Psyops = designed to move you without your awareness",
            "Not just military — workplace, relationships, social media",
            "Three flavors: political, interpersonal, digital",
            "Cambridge Analytica profiled 87M people to target their weak points",
            "Your amygdala fires before your logic brain — that's the exploit"
        ],
        readTime: 4, module: .spot
    ),

    PBite(
        id: "pb_02", number: 2,
        title: "Biases They're Using Against You",
        icon: "brain.fill",
        hook: "Your shortcuts are their weapons.",
        quickTip: "Pause emotional reactions — name the feeling before you act on it.",
        action: "Think of a belief you hold strongly. Can you trace when and how you formed it?",
        bullets: [
            "Confirmation bias: you seek info that confirms what you believe",
            "Availability heuristic: repetition = perceived reality",
            "Amygdala hijack: fear fires, logic goes offline — they love this",
            "Social proof: \"everyone agrees\" even when no one does (bots)",
            "Urgency pressure: no time to verify = manipulation window"
        ],
        readTime: 4, module: .spot
    ),

    PBite(
        id: "pb_03", number: 3,
        title: "5 Manipulation Signatures",
        icon: "signature",
        hook: "Once seen, can't be unseen.",
        quickTip: "Real info doesn't expire in the time it takes you to verify it.",
        action: "Apply the 24-hour rule to the next piece of outrage content you see.",
        bullets: [
            "Emotion before facts (feel first, think never)",
            "Urgency + time pressure (\"share before deleted\")",
            "Perfect villain / perfect victim (no complexity = engineered)",
            "Social proof pressure (\"everyone knows...\")",
            "Clean us/them binary (real issues are messy)"
        ],
        readTime: 3, module: .spot
    ),

    // ── BUILD ARMOR ──

    PBite(
        id: "pb_04", number: 4,
        title: "The 4 Resilience Pillars",
        icon: "shield.fill",
        hook: "Viktor Frankl built these in a concentration camp. You can build them here.",
        quickTip: "Reframe: \"This tests my strength\" instead of \"They're breaking me.\"",
        action: "Name the thing you're currently living FOR. Write it down in one sentence.",
        bullets: [
            "Emotional regulation: feel it, don't be controlled by it",
            "Cognitive flexibility: hold multiple interpretations simultaneously",
            "Social support: isolated people are easy targets",
            "Purpose-driven living: meaning makes manipulation less effective",
            "Frankl: everything can be taken except your response to it"
        ],
        readTime: 4, module: .build
    ),

    PBite(
        id: "pb_05", number: 5,
        title: "Regulate Your Nervous System",
        icon: "wind",
        hook: "Box breathing is physiological armor.",
        quickTip: "Hydrate — dehydration amplifies anxiety and reduces clear thinking.",
        action: "4-4-4-4 box breathing right now: inhale 4, hold 4, exhale 4, hold 4. Repeat 3×.",
        bullets: [
            "Sustained stress = amygdala stays hot = rational thought impaired",
            "Box breathing: 4 sec in, 4 hold, 4 out, 4 hold → resets threat response",
            "7-9 hours sleep protects your prefrontal cortex (your defense HQ)",
            "Exercise dumps stress hormones that keep you in reaction mode",
            "Regulated nervous system = psyops bounce off you"
        ],
        readTime: 3, module: .build
    ),

    PBite(
        id: "pb_06", number: 6,
        title: "Build Your Reality Network",
        icon: "person.3.fill",
        hook: "Isolation is infrastructure for manipulation.",
        quickTip: "Build trust on small things first — then use that network for big ones.",
        action: "Name 2 people you trust to tell you when you're being reactive. Text one today.",
        bullets: [
            "Strong trusted network = most resilient psyops defense available",
            "Shared reality checking — you catch what each other misses",
            "Include people who disagree with you on some things",
            "Homogeneous groups confirm bias at a group level",
            "Encrypted comms protect your private data from targeting"
        ],
        readTime: 3, module: .build
    ),

    // ── FIGHT BACK ──

    PBite(
        id: "pb_07", number: 7,
        title: "Information Hygiene",
        icon: "lock.shield.fill",
        hook: "You don't leave toxic waste in your home. Same standard for your mind.",
        quickTip: "Curate your feed — remove anything that consistently agitates without informing.",
        action: "48-hour audit: track every info source. Does it leave you informed or just angry?",
        bullets: [
            "Gray rock: be emotionally uninteresting to provocateurs",
            "Curate feeds — consistent agitation without insight = manipulation",
            "Diversify sources: read one that confirms and one that challenges your view",
            "Primary source priority — bypass all interpreters when possible",
            "24-hour rule before sharing anything emotionally charged"
        ],
        readTime: 4, module: .fight
    ),

    PBite(
        id: "pb_08", number: 8,
        title: "Fact-Check Protocol",
        icon: "magnifyingglass.circle.fill",
        hook: "\"Is this true?\" is the old question. The new one: \"What is this designed to make me do?\"",
        quickTip: "Trace story origins — who published it first, through what channel?",
        action: "Verify one piece of circulating content today using a primary source.",
        bullets: [
            "Reverse image search before sharing anything visual",
            "Snopes / AP Fact Check / Reuters for quick verification",
            "Who benefits? Trace the source and their incentives",
            "Deepfakes: even video requires origin verification now",
            "Disagreement survives fact-checking. Manipulation rarely does."
        ],
        readTime: 3, module: .fight
    ),

    PBite(
        id: "pb_09", number: 9,
        title: "Build Counter-Narrative",
        icon: "text.bubble.fill",
        hook: "Psyops create narratives. Your defense is your own intentional story.",
        quickTip: "Focus on issues, not personalities — de-center the manipulator.",
        action: "Write 3 affirmations that anchor your values. Read them before news intake.",
        bullets: [
            "Your internal narrative is the territory being fought over",
            "Affirmations interrupt automated narrative loops",
            "\"I determine my responses. My mind is my own.\"",
            "Educate others — teaching pattern recognition multiplies defense",
            "Report synthetic content — remove amplification from the operation"
        ],
        readTime: 3, module: .fight
    ),

    // ── FIND PEACE ──

    PBite(
        id: "pb_10", number: 10,
        title: "Stoic Armor",
        icon: "figure.mind.and.body",
        hook: "Marcus Aurelius managed state propaganda every day. His tools still work.",
        quickTip: "Control/not-control: draw the line. Everything outside it is information, not threat.",
        action: "Write your \"peace rules\" — 3-5 values that stay constant regardless of pressure.",
        bullets: [
            "Stoic distinction: what's up to you vs. what isn't",
            "Psyops targets \"not up to you\" to manipulate \"up to you\"",
            "The gap between stimulus and response is where sovereignty lives",
            "Marcus: \"You have power over your mind, not outside events\"",
            "Equanimity isn't indifference — it's unshakeable ground"
        ],
        readTime: 4, module: .peace
    ),

    PBite(
        id: "pb_11", number: 11,
        title: "Digital Threats: The Current Frontier",
        icon: "cpu.fill",
        hook: "Deepfakes have crossed the threshold where eyes can't detect them.",
        quickTip: "Use VPN + privacy tools — your data profile is used to target you.",
        action: "Learn one digital literacy tool this week: reverse image search, VPN, or Snopes.",
        bullets: [
            "AI-generated video: realistic enough to fabricate events that never happened",
            "Algorithmic radicalization: designed for engagement, not truth",
            "Astroturfing at scale: one operator, thousands of synthetic accounts",
            "Metaverse frontier: immersive manipulation with higher emotional bandwidth",
            "Origin verification is now non-negotiable for any shared content"
        ],
        readTime: 3, module: .peace
    ),

    PBite(
        id: "pb_12", number: 12,
        title: "Unity: The Endgame Counter",
        icon: "infinity.circle.fill",
        hook: "Division is the product. Community is the antidote.",
        quickTip: "Genuine disagreement produces synthesis. Manufactured conflict only escalates.",
        action: "Share what you've learned in this course with one person you trust.",
        bullets: [
            "Every psyop's end goal: prevent coordination",
            "Divided populations can't organize around shared interests",
            "\"Divide et impera\" — 2000 years old. Still the playbook.",
            "Spot manufactured conflict: no resolution, same charges repeat",
            "Knowledge shared = defense multiplied. This is how we win."
        ],
        readTime: 3, module: .peace
    ),
]

// MARK: - Bite Course View

struct PsyopsBiteCourseView: View {
    @Environment(\.dismiss) var dismiss
    @State private var progress = PBiteProgress.load()
    @State private var selectedBite: PBite?
    @State private var showBite = false
    @State private var filterModule: PBiteModule? = nil
    @State private var glitchOffset: CGFloat = 0

    private let accent = Color(hex: "#E74C3C")
    private let bg = Color(red: 0.04, green: 0.02, blue: 0.02)

    var body: some View {
        NavigationStack {
            ZStack {
                bg.ignoresSafeArea()

                ScrollView(showsIndicators: false) {
                    VStack(spacing: 18) {
                        biteHero
                        quickStats
                        biteModuleFilter
                        biteGrid
                        masterCourseCallout
                        Spacer(minLength: 60)
                    }
                    .padding(.horizontal, 18)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button { dismiss() } label: {
                        Image(systemName: "chevron.left").foregroundColor(.white)
                    }
                }
                ToolbarItem(placement: .principal) {
                    Text("⚡ Psyops · Bite Edition").font(.system(size: 15, weight: .bold)).foregroundColor(.white)
                }
            }
            .fullScreenCover(isPresented: $showBite) {
                if let bite = selectedBite {
                    PBiteReaderView(bite: bite, progress: $progress)
                }
            }
        }
    }

    private var biteHero: some View {
        VStack(spacing: 10) {
            Spacer().frame(height: 6)
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .fill(LinearGradient(colors: [accent.opacity(0.2), Color(hex: "#9B59B6").opacity(0.1)], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .frame(height: 110)
                HStack(spacing: 16) {
                    Text("⚡").font(.system(size: 42))
                    VStack(alignment: .leading, spacing: 4) {
                        Text("BITE-SIZED EDITION").font(.system(size: 9, weight: .black)).tracking(3).foregroundColor(accent.opacity(0.7))
                        Text("3–5 min each. Swipe, read, act.").font(.system(size: 18, weight: .black)).foregroundColor(.white)
                        Text("Start here → then unlock the Master Course").font(.system(size: 11)).foregroundColor(.white.opacity(0.45))
                    }
                    Spacer()
                }
                .padding(.horizontal, 18)
            }
        }
    }

    private var quickStats: some View {
        let done = progress.completed.count
        let total = psyopsBites.count
        let pct = Double(done) / Double(total)
        return HStack(spacing: 10) {
            PBiteStatBox(value: "\(done)/\(total)", label: "BITES READ", color: accent)
            PBiteStatBox(value: "\(Int(pct * 100))%", label: "COMPLETE", color: Color(hex: "#F39C12"))
            PBiteStatBox(value: "\(total - done)", label: "REMAINING", color: Color(hex: "#27AE60"))
        }
    }

    private var biteModuleFilter: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                PBiteChip(label: "ALL", emoji: "⚡", color: accent, isSelected: filterModule == nil) { filterModule = nil }
                ForEach(PBiteModule.allCases, id: \.self) { mod in
                    PBiteChip(label: mod.rawValue, emoji: mod.emoji, color: mod.color, isSelected: filterModule == mod) {
                        filterModule = filterModule == mod ? nil : mod
                    }
                }
            }
        }
    }

    private var biteGrid: some View {
        let filtered = filterModule == nil ? psyopsBites : psyopsBites.filter { $0.module == filterModule }
        return VStack(spacing: 10) {
            ForEach(filtered) { bite in
                PBiteCard(bite: bite, isCompleted: progress.isComplete(bite.id)) {
                    selectedBite = bite
                    showBite = true
                }
            }
        }
    }

    private var masterCourseCallout: some View {
        VStack(spacing: 10) {
            Divider().background(Color.white.opacity(0.08))
            HStack(spacing: 12) {
                Image(systemName: "graduationcap.fill").font(.system(size: 22)).foregroundColor(accent)
                VStack(alignment: .leading, spacing: 3) {
                    Text("Ready for more?").font(.system(size: 14, weight: .black)).foregroundColor(.white)
                    Text("The Master Course has 10 deep lessons + 5 interactive drills + a full Scenario Simulator. Look for \"Psyops Master\" in the course hub.").font(.system(size: 11)).foregroundColor(.white.opacity(0.45)).lineSpacing(3)
                }
            }
            .padding(14)
            .background(RoundedRectangle(cornerRadius: 12)
                .fill(accent.opacity(0.06))
                .overlay(RoundedRectangle(cornerRadius: 12).stroke(accent.opacity(0.2), lineWidth: 1)))
        }
    }
}

// MARK: - Stat Box

struct PBiteStatBox: View {
    let value: String; let label: String; let color: Color
    var body: some View {
        VStack(spacing: 4) {
            Text(value).font(.system(size: 18, weight: .black)).foregroundColor(color)
            Text(label).font(.system(size: 8, weight: .black)).tracking(1).foregroundColor(.white.opacity(0.35))
        }
        .frame(maxWidth: .infinity).padding(.vertical, 12)
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.04)))
    }
}

// MARK: - Filter Chip

struct PBiteChip: View {
    let label: String; let emoji: String; let color: Color
    let isSelected: Bool; let action: () -> Void
    var body: some View {
        Button(action: action) {
            HStack(spacing: 5) {
                Text(emoji).font(.system(size: 11))
                Text(label).font(.system(size: 10, weight: isSelected ? .black : .medium))
            }
            .foregroundColor(isSelected ? .black : .white.opacity(0.5))
            .padding(.horizontal, 12).padding(.vertical, 7)
            .background(isSelected ? color : Color.white.opacity(0.06))
            .clipShape(Capsule())
        }
    }
}

// MARK: - Bite Card

struct PBiteCard: View {
    let bite: PBite; let isCompleted: Bool; let action: () -> Void
    var body: some View {
        Button(action: action) {
            HStack(spacing: 12) {
                // Number badge
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(isCompleted ? bite.module.color.opacity(0.2) : bite.module.color.opacity(0.07))
                        .frame(width: 44, height: 44)
                    if isCompleted {
                        Image(systemName: "checkmark.circle.fill").font(.system(size: 20)).foregroundColor(bite.module.color)
                    } else {
                        Image(systemName: bite.icon).font(.system(size: 17)).foregroundColor(bite.module.color)
                    }
                }

                VStack(alignment: .leading, spacing: 4) {
                    HStack(spacing: 6) {
                        Text(bite.module.emoji + " " + bite.module.rawValue)
                            .font(.system(size: 9, weight: .black)).tracking(1)
                            .foregroundColor(bite.module.color.opacity(0.8))
                        Spacer()
                        Text("\(bite.readTime) min").font(.system(size: 10)).foregroundColor(.white.opacity(0.3))
                    }
                    Text(bite.title).font(.system(size: 13, weight: .bold)).foregroundColor(.white).lineLimit(1)
                    Text(bite.hook).font(.system(size: 11)).foregroundColor(.white.opacity(0.4)).lineLimit(1)
                }

                Image(systemName: "chevron.right").font(.system(size: 11)).foregroundColor(.white.opacity(0.2))
            }
            .padding(12)
            .background(RoundedRectangle(cornerRadius: 14)
                .fill(isCompleted ? bite.module.color.opacity(0.05) : Color.white.opacity(0.03))
                .overlay(RoundedRectangle(cornerRadius: 14).stroke(
                    isCompleted ? bite.module.color.opacity(0.25) : Color.white.opacity(0.05), lineWidth: 1)))
        }
    }
}

// MARK: - Bite Reader

struct PBiteReaderView: View {
    let bite: PBite
    @Binding var progress: PBiteProgress
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 0.04, green: 0.02, blue: 0.02).ignoresSafeArea()
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 20) {
                        biteHeader
                        Divider().background(bite.module.color.opacity(0.3))
                        bulletList
                        quickTipCard
                        actionCard
                        completeBtn
                        Spacer(minLength: 60)
                    }
                    .padding(.horizontal, 20).padding(.top, 16)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button { dismiss() } label: {
                        Image(systemName: "xmark.circle.fill").foregroundStyle(.white.opacity(0.4))
                    }
                }
                ToolbarItem(placement: .principal) {
                    Text("⚡ Bite \(bite.number) of \(psyopsBites.count)")
                        .font(.system(size: 13, weight: .semibold)).foregroundColor(.white.opacity(0.5))
                }
            }
        }
    }

    private var biteHeader: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(bite.module.emoji + " " + bite.module.rawValue)
                    .font(.system(size: 10, weight: .black)).tracking(2).foregroundColor(bite.module.color)
                Spacer()
                Text("\(bite.readTime) MIN READ").font(.system(size: 9, weight: .black)).tracking(2).foregroundColor(.white.opacity(0.3))
            }
            Text(bite.title).font(.system(size: 24, weight: .black)).foregroundColor(.white)
            Text(bite.hook).font(.system(size: 14)).foregroundColor(bite.module.color.opacity(0.85)).italic()
        }
    }

    private var bulletList: some View {
        VStack(alignment: .leading, spacing: 12) {
            ForEach(bite.bullets, id: \.self) { bullet in
                HStack(alignment: .top, spacing: 10) {
                    Text("→").font(.system(size: 13, weight: .bold)).foregroundColor(bite.module.color)
                    Text(bullet).font(.system(size: 14)).foregroundColor(.white.opacity(0.85)).lineSpacing(4)
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
        }
        .padding(16)
        .background(RoundedRectangle(cornerRadius: 14).fill(Color.white.opacity(0.03)))
    }

    private var quickTipCard: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: "bolt.circle.fill").font(.system(size: 18)).foregroundColor(.yellow)
            VStack(alignment: .leading, spacing: 4) {
                Text("QUICK TIP").font(.system(size: 10, weight: .black)).tracking(2).foregroundColor(.yellow)
                Text(bite.quickTip).font(.system(size: 13)).foregroundColor(.white.opacity(0.8)).lineSpacing(4)
            }
        }
        .padding(14)
        .background(RoundedRectangle(cornerRadius: 12)
            .fill(Color.yellow.opacity(0.06))
            .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.yellow.opacity(0.2), lineWidth: 1)))
    }

    private var actionCard: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: "hand.tap.fill").font(.system(size: 18)).foregroundColor(bite.module.color)
            VStack(alignment: .leading, spacing: 4) {
                Text("YOUR ACTION").font(.system(size: 10, weight: .black)).tracking(2).foregroundColor(bite.module.color)
                Text(bite.action).font(.system(size: 13)).foregroundColor(.white.opacity(0.8)).lineSpacing(4)
            }
        }
        .padding(14)
        .background(RoundedRectangle(cornerRadius: 12)
            .fill(bite.module.color.opacity(0.06))
            .overlay(RoundedRectangle(cornerRadius: 12).stroke(bite.module.color.opacity(0.25), lineWidth: 1)))
    }

    private var completeBtn: some View {
        let done = progress.isComplete(bite.id)
        return Button {
            progress.complete(bite.id)
            progress.save()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { dismiss() }
        } label: {
            HStack {
                Image(systemName: done ? "checkmark.circle.fill" : "checkmark.circle")
                Text(done ? "Bite Complete ✓" : "Got It — Mark Done").font(.system(size: 14, weight: .bold))
            }
            .foregroundColor(done ? bite.module.color : .black)
            .frame(maxWidth: .infinity).padding(.vertical, 14)
            .background(done
                ? RoundedRectangle(cornerRadius: 14).fill(bite.module.color.opacity(0.15))
                : RoundedRectangle(cornerRadius: 14).fill(bite.module.color))
        }
        .padding(.top, 6)
    }
}
