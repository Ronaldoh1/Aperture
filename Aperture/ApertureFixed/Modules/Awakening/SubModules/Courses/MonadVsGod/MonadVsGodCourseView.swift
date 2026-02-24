// MonadVsGodCourseView.swift
// SunFlow: Reignited — Aperture

import SwiftUI

// MARK: - Hub

struct MonadVsGodCourseView: View {
    @Environment(\.dismiss) var dismiss
    @State private var progress = MonadProgress()
    @State private var selectedModule: MonadModule? = nil
    @State private var showModule = false

    private let accent = Color(hex: "#A78BFA")  // violet

    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 0.02, green: 0.02, blue: 0.08).ignoresSafeArea()
                // Subtle cosmic particles
                ChosenOnesParticleField(accent: accent, symbols: ["·", "∞", "○", "◇", "·"])
                    .opacity(0.4).ignoresSafeArea()
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 22) {
                        heroHeader
                        progressCard
                        modulesList
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
                    Text("🌞 The Monad").font(.system(size: 17, weight: .bold)).foregroundColor(.white)
                }
            }
            .fullScreenCover(isPresented: $showModule) {
                if let mod = selectedModule {
                    MonadModuleReaderView(module: mod, accent: accent, progress: $progress)
                }
            }
            .onAppear { progress.load() }
        }
    }

    private var heroHeader: some View {
        VStack(spacing: 14) {
            Spacer().frame(height: 12)
            ZStack {
                // Animated sacred geometry
                MonadInfiniteLight(accent: accent, size: 200)
                    .opacity(0.8)
                Text("🌞").font(.system(size: 44))
            }
            .frame(width: 200, height: 200)
            VStack(spacing: 6) {
                Text("GOD vs. THE MONAD").font(.system(size: 9, weight: .black)).tracking(3).foregroundColor(accent.opacity(0.5))
                Text("The Distinction That Changes Everything").font(.system(size: 20, weight: .black)).foregroundColor(.white).multilineTextAlignment(.center)
                Text("5 modules · Gnostic cosmology · Direct knowing over belief")
                    .font(.system(size: 11)).foregroundColor(.white.opacity(0.35)).multilineTextAlignment(.center)
            }
        }
    }

    private var progressCard: some View {
        let completed = progress.completedModules.count
        let total = monadModules.count
        let fraction = Double(completed) / Double(total)
        return VStack(spacing: 10) {
            HStack {
                Text("\(completed)/\(total) modules complete").font(.system(size: 12, weight: .bold)).foregroundColor(.white.opacity(0.6))
                Spacer()
                if completed == total {
                    Text("🔮 GNOSIS UNLOCKED").font(.system(size: 9, weight: .black)).tracking(1).foregroundColor(accent.opacity(0.8))
                } else {
                    Text("\(Int(fraction * 100))%").font(.system(size: 11, weight: .bold)).foregroundColor(accent.opacity(0.6))
                }
            }
            GeometryReader { geo in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 4).fill(Color.white.opacity(0.04)).frame(height: 6)
                    RoundedRectangle(cornerRadius: 4).fill(accent.opacity(0.6))
                        .frame(width: geo.size.width * fraction, height: 6)
                        .animation(.spring(response: 0.5), value: completed)
                }
            }.frame(height: 6)
        }
        .padding(14)
        .background(RoundedRectangle(cornerRadius: 12).fill(accent.opacity(0.04))
            .overlay(RoundedRectangle(cornerRadius: 12).stroke(accent.opacity(0.1), lineWidth: 1)))
    }

    private var modulesList: some View {
        VStack(spacing: 10) {
            ForEach(Array(monadModules.enumerated()), id: \.1.id) { idx, mod in
                let done = progress.completedModules.contains(mod.id)
                let locked = idx > 0 && !progress.completedModules.contains(monadModules[idx - 1].id)
                Button {
                    guard !locked else { return }
                    selectedModule = mod
                    showModule = true
                } label: {
                    HStack(spacing: 12) {
                        ZStack {
                            Circle().fill(done ? accent.opacity(0.25) : accent.opacity(0.07)).frame(width: 48, height: 48)
                            if done {
                                Image(systemName: "checkmark").font(.system(size: 14, weight: .bold)).foregroundColor(accent)
                            } else if locked {
                                Image(systemName: "lock.fill").font(.system(size: 14)).foregroundColor(.white.opacity(0.2))
                            } else {
                                Text(mod.emoji).font(.system(size: 22))
                            }
                        }
                        VStack(alignment: .leading, spacing: 4) {
                            HStack(spacing: 6) {
                                Text("Module \(mod.number)").font(.system(size: 9, weight: .black)).foregroundColor(accent.opacity(0.5))
                                Text("·").foregroundColor(.white.opacity(0.2))
                                Text("\(mod.readingMinutes) min").font(.system(size: 9)).foregroundColor(.white.opacity(0.3))
                            }
                            Text(mod.title).font(.system(size: 14, weight: .bold)).foregroundColor(locked ? .white.opacity(0.3) : .white)
                            Text(mod.subtitle).font(.system(size: 10)).foregroundColor(.white.opacity(locked ? 0.2 : 0.4))
                        }
                        Spacer()
                        if !locked {
                            Image(systemName: "chevron.right").font(.system(size: 10)).foregroundColor(.white.opacity(0.2))
                        }
                    }
                    .padding(13)
                    .background(RoundedRectangle(cornerRadius: 12)
                        .fill(done ? accent.opacity(0.06) : Color.white.opacity(0.008))
                        .overlay(RoundedRectangle(cornerRadius: 12).stroke(done ? accent.opacity(0.2) : Color.white.opacity(0.03), lineWidth: 1)))
                    .opacity(locked ? 0.5 : 1)
                }
            }
        }
    }
}

// MARK: - Module Reader

struct MonadModuleReaderView: View {
    let module: MonadModule
    let accent: Color
    @Binding var progress: MonadProgress
    @Environment(\.dismiss) var dismiss
    @State private var tab = 0
    @State private var hasReflected = false

    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 0.02, green: 0.02, blue: 0.08).ignoresSafeArea()
                VStack(spacing: 0) {
                    // Tabs
                    HStack(spacing: 0) {
                        ForEach(Array(["Reading", "Key Points", "Reflection"].enumerated()), id: \.0) { idx, name in
                            Button { withAnimation { tab = idx } } label: {
                                VStack(spacing: 3) {
                                    Text(name).font(.system(size: 10, weight: tab == idx ? .black : .medium))
                                        .foregroundColor(tab == idx ? accent : .white.opacity(0.3))
                                    (tab == idx ? RoundedRectangle(cornerRadius: 1).fill(accent) : RoundedRectangle(cornerRadius: 1).fill(Color.clear))
                                        .frame(height: 2).padding(.horizontal, 8)
                                }
                                .frame(maxWidth: .infinity).padding(.vertical, 10)
                            }
                        }
                    }
                    .background(Color.white.opacity(0.02))
                    .overlay(Rectangle().frame(height: 1).foregroundColor(.white.opacity(0.04)), alignment: .bottom)

                    ScrollView(showsIndicators: false) {
                        VStack(alignment: .leading, spacing: 18) {
                            moduleHeader
                            if tab == 0 { readingTab }
                            else if tab == 1 { keyPointsTab }
                            else { reflectionTab }
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
                        Text(module.emoji)
                        Text(module.title).font(.system(size: 14, weight: .bold)).foregroundColor(.white)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    if progress.completedModules.contains(module.id) {
                        Image(systemName: "checkmark.circle.fill").foregroundColor(accent)
                    }
                }
            }
        }
    }

    private var moduleHeader: some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack(spacing: 8) {
                Text("MODULE \(module.number)").font(.system(size: 8, weight: .black)).tracking(2).foregroundColor(accent.opacity(0.5))
                Text("·")
                Text("\(module.readingMinutes) min read").font(.system(size: 8)).foregroundColor(.white.opacity(0.3))
            }
            Text(module.subtitle).font(.system(size: 14, weight: .medium)).foregroundColor(.white.opacity(0.5)).lineSpacing(3)
        }
    }

    private var readingTab: some View {
        DDMarkdownBodyView(text: module.body, accent: accent)
    }

    private var keyPointsTab: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("KEY POINTS").font(.system(size: 9, weight: .black)).tracking(2).foregroundColor(accent.opacity(0.5))
            ForEach(Array(module.keyPoints.enumerated()), id: \.0) { _, point in
                HStack(alignment: .top, spacing: 12) {
                    Text(point.icon).font(.system(size: 20))
                    Text(point.text).font(.system(size: 13, weight: .medium)).foregroundColor(.white.opacity(0.7)).lineSpacing(4)
                    Spacer()
                }
                .padding(12)
                .background(RoundedRectangle(cornerRadius: 10).fill(accent.opacity(0.04))
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(accent.opacity(0.08), lineWidth: 1)))
            }
        }
    }

    private var reflectionTab: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Prompt
            VStack(alignment: .leading, spacing: 8) {
                HStack(spacing: 6) {
                    Text("🌀").font(.system(size: 14))
                    Text("REFLECTION").font(.system(size: 9, weight: .black)).tracking(2).foregroundColor(accent.opacity(0.5))
                }
                Text(module.reflectionPrompt).font(.system(size: 11)).foregroundColor(.white.opacity(0.4)).lineSpacing(3)
            }

            // The question
            Text(module.reflectionQuestion)
                .font(.system(size: 14, weight: .medium)).foregroundColor(.white.opacity(0.8))
                .lineSpacing(6).italic()
                .padding(16)
                .background(RoundedRectangle(cornerRadius: 12).fill(accent.opacity(0.06))
                    .overlay(RoundedRectangle(cornerRadius: 12).stroke(accent.opacity(0.15), lineWidth: 1)))

            // Honest note
            Text("Don't answer this quickly. Don't answer it to be right. Sit with it. The question is more valuable than any answer you could produce right now.")
                .font(.system(size: 11)).foregroundColor(.white.opacity(0.35)).lineSpacing(4)
                .padding(12)
                .background(RoundedRectangle(cornerRadius: 8).fill(Color.white.opacity(0.005)))

            // Mark complete
            if !progress.completedModules.contains(module.id) {
                Button {
                    withAnimation {
                        hasReflected = true
                        progress.complete(module.id)
                        progress.save()
                    }
                } label: {
                    HStack(spacing: 8) {
                        Image(systemName: "checkmark").font(.system(size: 13, weight: .bold))
                        Text("I've reflected on this module")
                            .font(.system(size: 14, weight: .bold))
                    }
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity).padding(.vertical, 15)
                    .background(RoundedRectangle(cornerRadius: 14).fill(accent))
                }
                .padding(.top, 8)
            } else {
                HStack(spacing: 8) {
                    Image(systemName: "checkmark.circle.fill").foregroundColor(accent)
                    Text("Module complete").font(.system(size: 13, weight: .bold)).foregroundColor(accent.opacity(0.7))
                }
                .padding(.top, 8)
            }
        }
    }
}
