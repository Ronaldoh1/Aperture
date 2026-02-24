// ChosenOnesCourseView.swift
// SunFlow: Reignited — Aperture

import SwiftUI

// MARK: - State

class ChosenOnesState: ObservableObject {
    @Published var quizScores: [String: Int] = [:]
    @Published var quizComplete = false
    @Published var selectedArchetype: ChosenOneArchetype? = nil
    @Published var showDetail = false
    @Published var showQuiz = false
    private let key = "aperture_chosen_ones_v1"

    var primaryArchetype: ChosenOneArchetype? {
        guard quizComplete else { return nil }
        return chosenOnesArchetypes.max { (quizScores[$0.id] ?? 0) < (quizScores[$1.id] ?? 0) }
    }

    var topThree: [ChosenOneArchetype] {
        chosenOnesArchetypes.sorted { (quizScores[$0.id] ?? 0) > (quizScores[$1.id] ?? 0) }.prefix(3).map { $0 }
    }

    func save() {
        UserDefaults.standard.set(["scores": quizScores, "complete": quizComplete], forKey: key)
    }

    func load() {
        guard let d = UserDefaults.standard.dictionary(forKey: key) else { return }
        quizScores = (d["scores"] as? [String: Int]) ?? [:]
        quizComplete = (d["complete"] as? Bool) ?? false
    }

    func reset() {
        quizScores = [:]
        quizComplete = false
        save()
    }
}

// MARK: - Hub

struct ChosenOnesCourseView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var state = ChosenOnesState()

    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 0.02, green: 0.02, blue: 0.08).ignoresSafeArea()
                ChosenOnesParticleField(accent: .purple, symbols: ["✨", "⭐", "·", "💫", "◇"])
                    .opacity(0.35).ignoresSafeArea()
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 22) {
                        heroHeader
                        if state.quizComplete { resultSection }
                        else { quizCTA }
                        allArchetypesList
                        the144KCard
                        Spacer(minLength: 40)
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
                    Text("✨ Chosen Ones").font(.system(size: 17, weight: .bold)).foregroundColor(.white)
                }
                if state.quizComplete {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Retake") { state.reset() }
                            .font(.system(size: 12)).foregroundColor(.white.opacity(0.4))
                    }
                }
            }
            .fullScreenCover(isPresented: $state.showQuiz) { ChosenOnesQuizView(state: state) }
            .fullScreenCover(isPresented: $state.showDetail) {
                if let a = state.selectedArchetype { ChosenOnesDetailView(archetype: a) }
            }
            .onAppear { state.load() }
        }
    }

    private var heroHeader: some View {
        VStack(spacing: 14) {
            Spacer().frame(height: 12)
            ZStack {
                SacredGeometryRing(accent: .purple, size: 180)
                    .opacity(0.6)
                SacredGeometryRing(accent: .purple, size: 120)
                    .opacity(0.4)
                Text("✨").font(.system(size: 52))
            }
            .frame(width: 200, height: 200)
            VStack(spacing: 6) {
                Text("CHOSEN ONES").font(.system(size: 9, weight: .black)).tracking(3).foregroundColor(.purple.opacity(0.5))
                Text("8 Archetypal Missions").font(.system(size: 22, weight: .black)).foregroundColor(.white)
                Text("Discover the pattern of who you came here to be")
                    .font(.system(size: 12)).foregroundColor(.white.opacity(0.35)).multilineTextAlignment(.center)
            }
        }
    }

    private var quizCTA: some View {
        Button { state.showQuiz = true } label: {
            HStack(spacing: 14) {
                ZStack {
                    RoundedRectangle(cornerRadius: 10).fill(Color.purple.opacity(0.15)).frame(width: 52, height: 52)
                    Text("🎯").font(.system(size: 26))
                }
                VStack(alignment: .leading, spacing: 4) {
                    Text("Discover Your Archetype").font(.system(size: 15, weight: .black)).foregroundColor(.white)
                    Text("7 questions · Pattern recognition, not flattery")
                        .font(.system(size: 10)).foregroundColor(.white.opacity(0.35))
                }
                Spacer()
                Image(systemName: "play.fill").font(.system(size: 14)).foregroundColor(.purple.opacity(0.6))
            }
            .padding(14)
            .background(RoundedRectangle(cornerRadius: 12).fill(Color.purple.opacity(0.05))
                .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.purple.opacity(0.2), lineWidth: 1)))
        }
    }

    private var resultSection: some View {
        VStack(spacing: 14) {
            if let primary = state.primaryArchetype {
                Button {
                    state.selectedArchetype = primary
                    state.showDetail = true
                } label: {
                    VStack(spacing: 12) {
                        HStack {
                            Text("YOUR PRIMARY ARCHETYPE").font(.system(size: 8, weight: .black)).tracking(2).foregroundColor(primary.accent.opacity(0.6))
                            Spacer()
                            Text("TAP TO EXPLORE →").font(.system(size: 8, weight: .black)).tracking(1).foregroundColor(.white.opacity(0.2))
                        }
                        HStack(spacing: 14) {
                            ZStack {
                                Circle().fill(primary.accent.opacity(0.15)).frame(width: 64, height: 64)
                                Text(primary.emoji).font(.system(size: 32))
                            }
                            VStack(alignment: .leading, spacing: 5) {
                                Text(primary.name).font(.system(size: 20, weight: .black)).foregroundColor(.white)
                                Text(primary.tagline).font(.system(size: 11)).foregroundColor(.white.opacity(0.5)).lineSpacing(2)
                            }
                            Spacer()
                        }
                    }
                    .padding(14)
                    .background(RoundedRectangle(cornerRadius: 14).fill(primary.accent.opacity(0.07))
                        .overlay(RoundedRectangle(cornerRadius: 14).stroke(primary.accent.opacity(0.2), lineWidth: 1)))
                }
                .buttonStyle(.plain)

                let others = Array(state.topThree.dropFirst())
                if !others.isEmpty {
                    HStack(spacing: 10) {
                        ForEach(others) { a in
                            Button {
                                state.selectedArchetype = a
                                state.showDetail = true
                            } label: {
                                HStack(spacing: 8) {
                                    Text(a.emoji).font(.system(size: 18))
                                    Text(a.name).font(.system(size: 12, weight: .bold)).foregroundColor(.white)
                                    Spacer()
                                }
                                .padding(10)
                                .background(RoundedRectangle(cornerRadius: 10).fill(a.accent.opacity(0.06))
                                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(a.accent.opacity(0.12), lineWidth: 1)))
                            }
                            .frame(maxWidth: .infinity)
                        }
                    }
                }
            }
        }
    }

    private var allArchetypesList: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("ALL 8 ARCHETYPES").font(.system(size: 9, weight: .black)).tracking(2).foregroundColor(.white.opacity(0.2)).padding(.top, 4)
            ForEach(chosenOnesArchetypes) { a in
                let isPrimary = state.primaryArchetype?.id == a.id
                Button {
                    state.selectedArchetype = a
                    state.showDetail = true
                } label: {
                    HStack(spacing: 12) {
                        ZStack {
                            Circle().fill(a.accent.opacity(isPrimary ? 0.2 : 0.08)).frame(width: 44, height: 44)
                            Text(a.emoji).font(.system(size: 22))
                        }
                        VStack(alignment: .leading, spacing: 3) {
                            HStack(spacing: 6) {
                                Text(a.name).font(.system(size: 14, weight: .bold)).foregroundColor(.white)
                                if isPrimary {
                                    Text("YOU").font(.system(size: 6, weight: .black)).tracking(1)
                                        .foregroundColor(.black).padding(.horizontal, 5).padding(.vertical, 2)
                                        .background(Capsule().fill(a.accent))
                                }
                            }
                            Text(a.tagline).font(.system(size: 9)).foregroundColor(.white.opacity(0.3))
                        }
                        Spacer()
                        Image(systemName: "chevron.right").font(.system(size: 10)).foregroundColor(.white.opacity(0.15))
                    }
                    .padding(12)
                    .background(RoundedRectangle(cornerRadius: 10)
                        .fill(isPrimary ? a.accent.opacity(0.05) : Color.white.opacity(0.008))
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(isPrimary ? a.accent.opacity(0.15) : Color.clear, lineWidth: 1)))
                }
            }
        }
    }

    @State private var show144K = false

    private var the144KCard: some View {
        Button { show144K = true } label: {
            HStack(spacing: 14) {
                ZStack {
                    ConnectionPulse(accent: .purple).frame(width: 52, height: 52)
                    Text("🌍").font(.system(size: 24))
                }
                .frame(width: 52, height: 52)
                VStack(alignment: .leading, spacing: 4) {
                    Text("THE 144,000").font(.system(size: 9, weight: .black)).tracking(2).foregroundColor(.purple.opacity(0.5))
                    Text("You're Not Alone").font(.system(size: 15, weight: .black)).foregroundColor(.white)
                    Text("The global awakening · TikTok · Your mission").font(.system(size: 9)).foregroundColor(.white.opacity(0.35))
                }
                Spacer()
                Image(systemName: "chevron.right").font(.system(size: 10)).foregroundColor(.purple.opacity(0.3))
            }
            .padding(14)
            .background(RoundedRectangle(cornerRadius: 14)
                .fill(Color.purple.opacity(0.06))
                .overlay(RoundedRectangle(cornerRadius: 14).stroke(
                    LinearGradient(colors: [Color.purple.opacity(0.3), Color.blue.opacity(0.2)], startPoint: .leading, endPoint: .trailing),
                    lineWidth: 1)))
        }
        .fullScreenCover(isPresented: $show144K) { The144KModuleView() }
    }
}

// MARK: - Quiz

struct ChosenOnesQuizView: View {
    @ObservedObject var state: ChosenOnesState
    @Environment(\.dismiss) var dismiss
    @State private var currentQ = 0
    @State private var runningScores: [String: Int] = [:]
    @State private var selectedOption: Int? = nil
    @State private var showNext = false
    @State private var done = false

    var body: some View {
        ZStack {
            Color(red: 0.02, green: 0.02, blue: 0.08).ignoresSafeArea()
            if done { resultScreen } else { questionScreen }
        }
    }

    private var questionScreen: some View {
        let q = chosenOnesQuestions[currentQ]
        return ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    Button { dismiss() } label: {
                        Image(systemName: "xmark").font(.system(size: 14, weight: .semibold)).foregroundColor(.white.opacity(0.4))
                    }
                    Spacer()
                    Text("\(currentQ + 1) / \(chosenOnesQuestions.count)")
                        .font(.system(size: 11, weight: .bold)).foregroundColor(.white.opacity(0.3))
                }
                .padding(.top, 20)

                GeometryReader { geo in
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 3).fill(Color.white.opacity(0.04)).frame(height: 4)
                        RoundedRectangle(cornerRadius: 3).fill(Color.purple.opacity(0.6))
                            .frame(width: geo.size.width * CGFloat(currentQ + 1) / CGFloat(chosenOnesQuestions.count), height: 4)
                            .animation(.spring(response: 0.4), value: currentQ)
                    }
                }.frame(height: 4)

                Text(q.question).font(.system(size: 18, weight: .black)).foregroundColor(.white).lineSpacing(4)

                ForEach(Array(q.options.enumerated()), id: \.0) { idx, option in
                    Button {
                        guard !showNext else { return }
                        withAnimation(.spring(response: 0.3)) {
                            selectedOption = idx
                            showNext = true
                            for (id, w) in option.weights { runningScores[id, default: 0] += w }
                        }
                    } label: {
                        HStack(spacing: 12) {
                            ZStack {
                                Circle().fill(selectedOption == idx ? Color.purple.opacity(0.3) : Color.white.opacity(0.04)).frame(width: 32, height: 32)
                                if selectedOption == idx {
                                    Image(systemName: "checkmark").font(.system(size: 13, weight: .bold)).foregroundColor(.purple)
                                }
                            }
                            Text(option.text).font(.system(size: 13, weight: .medium))
                                .foregroundColor(.white.opacity(selectedOption == idx ? 0.9 : 0.65))
                                .lineSpacing(3).multilineTextAlignment(.leading)
                            Spacer()
                        }
                        .padding(13)
                        .background(RoundedRectangle(cornerRadius: 10)
                            .fill(selectedOption == idx ? Color.purple.opacity(0.1) : Color.white.opacity(0.012))
                            .overlay(RoundedRectangle(cornerRadius: 10)
                                .stroke(selectedOption == idx ? Color.purple.opacity(0.4) : Color.white.opacity(0.04), lineWidth: 1)))
                    }
                    .animation(.easeInOut(duration: 0.2), value: selectedOption)
                }

                if showNext {
                    Button {
                        if currentQ < chosenOnesQuestions.count - 1 {
                            withAnimation { currentQ += 1; selectedOption = nil; showNext = false }
                        } else {
                            state.quizScores = runningScores
                            state.quizComplete = true
                            state.save()
                            withAnimation { done = true }
                        }
                    } label: {
                        Text(currentQ < chosenOnesQuestions.count - 1 ? "Next →" : "See Your Archetype →")
                            .font(.system(size: 15, weight: .bold)).foregroundColor(.black)
                            .frame(maxWidth: .infinity).padding(.vertical, 15)
                            .background(RoundedRectangle(cornerRadius: 12).fill(Color.purple))
                    }
                    .transition(.opacity)
                }

                Spacer(minLength: 40)
            }
            .padding(.horizontal, 20)
        }
    }

    private var resultScreen: some View {
        let primary = chosenOnesArchetypes.max { (runningScores[$0.id] ?? 0) < (runningScores[$1.id] ?? 0) }!
        return ArchetypeRevealView(archetype: primary) {
            dismiss()
        }
    }
}

// MARK: - Detail

struct ChosenOnesDetailView: View {
    let archetype: ChosenOneArchetype
    @Environment(\.dismiss) var dismiss
    @State private var tab = 0

    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 0.02, green: 0.02, blue: 0.08).ignoresSafeArea()
                VStack(spacing: 0) {
                    // Tab bar
                    HStack(spacing: 0) {
                        ForEach(Array(["Archetype","Shadow","Activation"].enumerated()), id: \.0) { idx, name in
                            Button { withAnimation { tab = idx } } label: {
                                VStack(spacing: 3) {
                                    Text(name).font(.system(size: 10, weight: tab == idx ? .black : .medium))
                                        .foregroundColor(tab == idx ? archetype.accent : .white.opacity(0.3))
                                    (tab == idx ? RoundedRectangle(cornerRadius: 1).fill(archetype.accent) : RoundedRectangle(cornerRadius: 1).fill(Color.clear))
                                        .frame(height: 2).padding(.horizontal, 10)
                                }
                                .frame(maxWidth: .infinity).padding(.vertical, 10)
                            }
                        }
                    }
                    .background(Color.white.opacity(0.02))
                    .overlay(Rectangle().frame(height: 1).foregroundColor(.white.opacity(0.04)), alignment: .bottom)

                    ScrollView(showsIndicators: false) {
                        VStack(alignment: .leading, spacing: 16) {
                            // Header
                            VStack(alignment: .leading, spacing: 8) {
                                Text(archetype.tagline).font(.system(size: 15, weight: .black)).foregroundColor(archetype.accent.opacity(0.9)).lineSpacing(4)
                                HStack(spacing: 8) {
                                    pill("🎁 Gift", archetype.coreGift, .green)
                                    pill("⚖️ Burden", archetype.coreBurden, .red)
                                }
                            }

                            if tab == 0 { archetypeTab }
                            else if tab == 1 { shadowTab }
                            else { activationTab }

                            Spacer(minLength: 40)
                        }
                        .padding(.horizontal, 18).padding(.top, 16)
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button { dismiss() } label: {
                        Image(systemName: "xmark").foregroundColor(.white)
                    }
                }
                ToolbarItem(placement: .principal) {
                    HStack(spacing: 6) {
                        Text(archetype.emoji)
                        Text(archetype.name).font(.system(size: 15, weight: .bold)).foregroundColor(.white)
                    }
                }
            }
        }
    }

    private func pill(_ label: String, _ text: String, _ c: Color) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(label).font(.system(size: 8, weight: .black)).tracking(1).foregroundColor(c.opacity(0.5))
            Text(text).font(.system(size: 9)).foregroundColor(.white.opacity(0.5)).lineSpacing(2).lineLimit(3)
        }
        .frame(maxWidth: .infinity, alignment: .leading).padding(10)
        .background(RoundedRectangle(cornerRadius: 8).fill(c.opacity(0.05))
            .overlay(RoundedRectangle(cornerRadius: 8).stroke(c.opacity(0.1), lineWidth: 1)))
    }

    private var archetypeTab: some View {
        VStack(alignment: .leading, spacing: 14) {
            VStack(alignment: .leading, spacing: 8) {
                Text("YOU MIGHT BE THIS IF...").font(.system(size: 8, weight: .black)).tracking(2).foregroundColor(archetype.accent.opacity(0.5))
                ForEach(archetype.recognitionSigns, id: \.self) { sign in
                    HStack(alignment: .top, spacing: 10) {
                        Text("✓").font(.system(size: 11, weight: .bold)).foregroundColor(archetype.accent.opacity(0.6)).padding(.top, 1)
                        Text(sign).font(.system(size: 12)).foregroundColor(.white.opacity(0.65)).lineSpacing(3)
                    }
                }
            }
            .padding(12).background(RoundedRectangle(cornerRadius: 10).fill(archetype.accent.opacity(0.04)))

            DDMarkdownBodyView(text: archetype.body, accent: archetype.accent)

            VStack(alignment: .leading, spacing: 6) {
                Text("KNOWN EXAMPLES").font(.system(size: 8, weight: .black)).tracking(2).foregroundColor(.white.opacity(0.2))
                ForEach(archetype.famousExamples, id: \.self) { ex in
                    Text("— \(ex)").font(.system(size: 11)).foregroundColor(.white.opacity(0.45)).lineSpacing(3)
                }
            }

            let comps = chosenOnesArchetypes.filter { archetype.compatibleWith.contains($0.id) }
            if !comps.isEmpty {
                VStack(alignment: .leading, spacing: 8) {
                    Text("WORKS WELL WITH").font(.system(size: 8, weight: .black)).tracking(2).foregroundColor(.white.opacity(0.2))
                    HStack(spacing: 8) {
                        ForEach(comps) { c in
                            HStack(spacing: 5) {
                                Text(c.emoji).font(.system(size: 13))
                                Text(c.name).font(.system(size: 9, weight: .bold)).foregroundColor(.white.opacity(0.6))
                            }
                            .padding(.horizontal, 8).padding(.vertical, 5)
                            .background(RoundedRectangle(cornerRadius: 7).fill(c.accent.opacity(0.08)))
                        }
                    }
                }
            }
        }
    }

    private var shadowTab: some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack(spacing: 6) {
                Text("🌑").font(.system(size: 14))
                Text("THE SHADOW").font(.system(size: 9, weight: .black)).tracking(2).foregroundColor(.red.opacity(0.6))
            }
            Text("The part nobody talks about. Understanding your shadow is what separates the archetype as tool from the archetype as trap.")
                .font(.system(size: 11)).foregroundColor(.white.opacity(0.4)).lineSpacing(4)
            Text(archetype.shadow).font(.system(size: 13)).foregroundColor(.white.opacity(0.7)).lineSpacing(5)
                .padding(14)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.red.opacity(0.05))
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.red.opacity(0.1), lineWidth: 1)))

            VStack(alignment: .leading, spacing: 8) {
                Text("SHADOW INQUIRY").font(.system(size: 8, weight: .black)).tracking(2).foregroundColor(.white.opacity(0.2))
                Text("In the last month, has the shadow version of this archetype been more active than the gift version? What specific circumstances triggered it?")
                    .font(.system(size: 12)).foregroundColor(.white.opacity(0.5)).lineSpacing(4)
            }
            .padding(12).background(RoundedRectangle(cornerRadius: 8).fill(Color.white.opacity(0.008)))
        }
    }

    private var activationTab: some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack(spacing: 6) {
                Text("⚡").font(.system(size: 14))
                Text("ACTIVATION PRACTICE").font(.system(size: 9, weight: .black)).tracking(2).foregroundColor(archetype.accent.opacity(0.6))
            }
            Text(archetype.activationPractice).font(.system(size: 13)).foregroundColor(.white.opacity(0.7)).lineSpacing(5)
                .padding(14)
                .background(RoundedRectangle(cornerRadius: 10).fill(archetype.accent.opacity(0.06))
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(archetype.accent.opacity(0.12), lineWidth: 1)))

            VStack(alignment: .leading, spacing: 8) {
                Text("YOUR MISSION").font(.system(size: 8, weight: .black)).tracking(2).foregroundColor(.white.opacity(0.2))
                Text(archetype.mission).font(.system(size: 13)).foregroundColor(.white.opacity(0.6)).lineSpacing(5)
            }
            .padding(12).background(RoundedRectangle(cornerRadius: 8).fill(Color.white.opacity(0.008)))
        }
    }
}

// MARK: - 144K Module View

struct The144KModuleView: View {
    @Environment(\.dismiss) var dismiss
    private let accent = Color(hex: "#A78BFA")
    private let mod = the144KModule

    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 0.02, green: 0.02, blue: 0.08).ignoresSafeArea()

                // Animated network background
                AwakenedNodeNetwork(accent: accent)
                    .opacity(0.4)
                    .ignoresSafeArea()

                ScrollView(showsIndicators: false) {
                    VStack(spacing: 20) {
                        Spacer().frame(height: 16)

                        // Hero
                        ZStack {
                            // Connection pulse rings
                            ConnectionPulse(accent: accent)
                                .frame(width: 140, height: 140)
                            Text(mod.emoji).font(.system(size: 48))
                        }
                        .frame(width: 140, height: 140)

                        VStack(spacing: 8) {
                            Text("THE 144,000").font(.system(size: 10, weight: .black)).tracking(3).foregroundColor(accent.opacity(0.6))
                            Text(mod.subtitle).font(.system(size: 17, weight: .black)).foregroundColor(.white)
                                .multilineTextAlignment(.center).lineSpacing(4)
                                .padding(.horizontal, 24)
                        }

                        // Key points
                        VStack(spacing: 8) {
                            ForEach(Array(mod.keyPoints.enumerated()), id: \.0) { _, kp in
                                HStack(alignment: .top, spacing: 12) {
                                    Text(kp.icon).font(.system(size: 18))
                                    Text(kp.text).font(.system(size: 12)).foregroundColor(.white.opacity(0.65)).lineSpacing(3)
                                    Spacer()
                                }
                                .padding(12)
                                .background(RoundedRectangle(cornerRadius: 10).fill(accent.opacity(0.04))
                                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(accent.opacity(0.1), lineWidth: 1)))
                            }
                        }
                        .padding(.horizontal, 18)

                        // Body
                        DDMarkdownBodyView(text: mod.body, accent: accent)
                            .padding(.horizontal, 18)

                        // CTA to final quiz
                        NavigationLink(destination: ChosenOneFinalQuizView()) {
                            HStack(spacing: 10) {
                                Text("🔮").font(.system(size: 18))
                                VStack(alignment: .leading, spacing: 3) {
                                    Text("Are You a Chosen One?").font(.system(size: 15, weight: .black)).foregroundColor(.white)
                                    Text("The 10-question final assessment").font(.system(size: 10)).foregroundColor(.white.opacity(0.4))
                                }
                                Spacer()
                                Image(systemName: "chevron.right").foregroundColor(accent.opacity(0.5))
                            }
                            .padding(14)
                            .background(RoundedRectangle(cornerRadius: 14).fill(accent.opacity(0.08))
                                .overlay(RoundedRectangle(cornerRadius: 14).stroke(accent.opacity(0.25), lineWidth: 1)))
                        }
                        .padding(.horizontal, 18)

                        Spacer(minLength: 40)
                    }
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
                    Text("🌍 The 144,000").font(.system(size: 15, weight: .bold)).foregroundColor(.white)
                }
            }
        }
    }
}

// MARK: - Are You A Chosen One? Final Quiz

struct ChosenOneFinalQuizView: View {
    @Environment(\.dismiss) var dismiss
    @State private var currentQ = 0
    @State private var yesCount = 0
    @State private var totalScore = 0
    @State private var answers: [Bool?] = Array(repeating: nil, count: ChosenOneFinalQuiz.questions.count)
    @State private var showContext = false
    @State private var done = false
    @State private var selectedAnswer: Bool? = nil

    private let accent = Color(hex: "#A78BFA")
    private let questions = ChosenOneFinalQuiz.questions

    var body: some View {
        ZStack {
            Color(red: 0.02, green: 0.02, blue: 0.08).ignoresSafeArea()
            ChosenOnesParticleField(accent: accent, symbols: ["✨", "·", "⭐", "💫"])
                .opacity(0.5)
            if done { resultView } else { questionView }
        }
        .navigationBarBackButtonHidden(done)
    }

    private var questionView: some View {
        let q = questions[currentQ]
        return ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 22) {
                // Progress
                VStack(spacing: 8) {
                    HStack {
                        Text("ARE YOU A CHOSEN ONE?").font(.system(size: 8, weight: .black)).tracking(2).foregroundColor(accent.opacity(0.5))
                        Spacer()
                        Text("\(currentQ + 1)/\(questions.count)").font(.system(size: 11, weight: .bold)).foregroundColor(.white.opacity(0.3))
                    }
                    GeometryReader { geo in
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 3).fill(Color.white.opacity(0.04)).frame(height: 4)
                            RoundedRectangle(cornerRadius: 3).fill(accent.opacity(0.6))
                                .frame(width: geo.size.width * CGFloat(currentQ) / CGFloat(questions.count), height: 4)
                        }
                    }.frame(height: 4)
                }
                .padding(.top, 20)

                Text(q.question)
                    .font(.system(size: 17, weight: .bold)).foregroundColor(.white).lineSpacing(5)

                // Context after answering
                if showContext {
                    Text(q.context)
                        .font(.system(size: 11)).foregroundColor(accent.opacity(0.7)).lineSpacing(4)
                        .padding(12)
                        .background(RoundedRectangle(cornerRadius: 10).fill(accent.opacity(0.06))
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(accent.opacity(0.12), lineWidth: 1)))
                        .transition(.opacity.combined(with: .move(edge: .top)))
                }

                // Yes / No / Sometimes
                if !showContext {
                    VStack(spacing: 10) {
                        answerButton("Yes — consistently", points: q.yesPoints, color: .green)
                        answerButton("Sometimes / Partially", points: q.yesPoints / 2, color: accent)
                        answerButton("Not really / No", points: 0, color: .white.opacity(0.3))
                    }
                } else {
                    // Next button
                    Button {
                        withAnimation {
                            if currentQ < questions.count - 1 {
                                currentQ += 1
                                showContext = false
                                selectedAnswer = nil
                            } else {
                                done = true
                            }
                        }
                    } label: {
                        Text(currentQ < questions.count - 1 ? "Next Question →" : "See My Result →")
                            .font(.system(size: 15, weight: .bold)).foregroundColor(.black)
                            .frame(maxWidth: .infinity).padding(.vertical, 15)
                            .background(RoundedRectangle(cornerRadius: 12).fill(accent))
                    }
                }

                Spacer(minLength: 40)
            }
            .padding(.horizontal, 22)
        }
        .animation(.easeInOut(duration: 0.3), value: showContext)
    }

    private func answerButton(_ label: String, points: Int, color: Color) -> some View {
        Button {
            totalScore += points
            if points > 0 { yesCount += 1 }
            withAnimation { showContext = true }
        } label: {
            HStack {
                Text(label).font(.system(size: 14, weight: .medium)).foregroundColor(.white.opacity(0.8))
                Spacer()
            }
            .padding(14)
            .background(RoundedRectangle(cornerRadius: 12).fill(color.opacity(0.06))
                .overlay(RoundedRectangle(cornerRadius: 12).stroke(color.opacity(0.2), lineWidth: 1)))
        }
    }

    private var resultView: some View {
        let result = ChosenOneFinalQuiz.result(for: totalScore)
        return ScrollView(showsIndicators: false) {
            VStack(spacing: 24) {
                Spacer().frame(height: 40)

                ZStack {
                    ConnectionPulse(accent: accent).frame(width: 160, height: 160)
                    SacredGeometryRing(accent: accent, size: 140)
                    Text(result.emoji).font(.system(size: 64))
                }
                .frame(width: 160, height: 160)

                VStack(spacing: 10) {
                    Text(result.title.uppercased()).font(.system(size: 10, weight: .black)).tracking(2).foregroundColor(accent.opacity(0.6))
                    Text(result.title).font(.system(size: 28, weight: .black)).foregroundColor(.white).multilineTextAlignment(.center)
                    Text(result.description).font(.system(size: 14)).foregroundColor(.white.opacity(0.6))
                        .multilineTextAlignment(.center).lineSpacing(5).padding(.horizontal, 24)
                }

                // Score breakdown
                VStack(spacing: 8) {
                    HStack {
                        Text("SCORE").font(.system(size: 9, weight: .black)).tracking(2).foregroundColor(.white.opacity(0.2))
                        Spacer()
                        Text("\(totalScore) pts · \(yesCount)/\(questions.count) positive").font(.system(size: 11)).foregroundColor(accent.opacity(0.6))
                    }
                    GeometryReader { geo in
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 4).fill(Color.white.opacity(0.04)).frame(height: 6)
                            RoundedRectangle(cornerRadius: 4).fill(
                                LinearGradient(colors: [accent.opacity(0.6), accent], startPoint: .leading, endPoint: .trailing)
                            )
                            .frame(width: geo.size.width * min(CGFloat(totalScore) / 33.0, 1.0), height: 6)
                        }
                    }.frame(height: 6)
                }
                .padding(14)
                .background(RoundedRectangle(cornerRadius: 10).fill(accent.opacity(0.04)))
                .padding(.horizontal, 24)

                // You are not alone card
                VStack(spacing: 10) {
                    Text("📱").font(.system(size: 32))
                    Text("You Are Not Alone").font(.system(size: 18, weight: .black)).foregroundColor(.white)
                    Text("Right now, hundreds of thousands of people who felt exactly what you feel — the outsider feeling, the 3am wakeups, the unexplained knowing — are finding each other on TikTok, Instagram, and in communities like this one.\n\nSearch: #spiritualawakening #144k #lightworker #starseed\n\nThe reunion is already happening. You just found part of it.")
                        .font(.system(size: 12)).foregroundColor(.white.opacity(0.55))
                        .lineSpacing(4).multilineTextAlignment(.center)
                }
                .padding(18)
                .background(RoundedRectangle(cornerRadius: 14).fill(accent.opacity(0.06))
                    .overlay(RoundedRectangle(cornerRadius: 14).stroke(accent.opacity(0.15), lineWidth: 1)))
                .padding(.horizontal, 20)

                Button { dismiss() } label: {
                    Text("← Back to Course")
                        .font(.system(size: 14, weight: .bold)).foregroundColor(accent.opacity(0.7))
                }
                .padding(.bottom, 40)
            }
        }
    }
}
