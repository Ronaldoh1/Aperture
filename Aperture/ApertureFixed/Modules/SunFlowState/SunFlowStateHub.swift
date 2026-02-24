// SunFlowStateHub.swift
// Central command. Badge-gated unlock. Change Scale assessment.
// Session chooser, status dashboard, bootcamp entry.
// ☀️ SunFlow: Reignited

import SwiftUI

// MARK: - ═══════════════════════════════════════════════════
// SUN FLOW STATE HUB — The OS Dashboard
// ═══════════════════════════════════════════════════════════

struct SunFlowStateHub: View {
    
    @StateObject private var engine = SunFlowStateEngine.shared
    @Environment(\.dismiss) var dismiss
    @State private var showChangeScale = false
    @State private var showCompass = false
    @State private var showBootcamp = false
    @State private var showSession: GuidedSessionType?
    @State private var showBlueprintBuilder = false
    @State private var showScorecard = false
    @State private var showErrorLog = false
    @State private var showSwipeFile = false
    @State private var showLifeContext = false
    @State private var showDreamTracker = false
    @State private var showContextPsyops = false
    @State private var showContextMorning = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(hex: "#0a0a0f").ignoresSafeArea()
                
                if !SunFlowUnlockGate.isUnlocked {
                    lockedView
                } else if !engine.hasCompletedOnboarding {
                    onboardingView
                } else {
                    mainDashboard
                }
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button { dismiss() } label: {
                        Image(systemName: "chevron.left").font(.system(size: 16, weight: .semibold)).foregroundColor(.white)
                    }
                }
                ToolbarItem(placement: .principal) {
                    Text("Sun Flow State").font(.system(size: 17, weight: .bold)).foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3))
                }
            }
            .toolbarBackground(Color(hex: "#0a0a0f"), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .sheet(isPresented: $showChangeScale) { ChangeScaleView() }
            .sheet(isPresented: $showCompass) { NextLevelCompassView() }
            .sheet(isPresented: $showBootcamp) { PhaseZeroBootcampView() }
            .sheet(item: $showSession) { session in GuidedSessionView(sessionType: session) }
            .sheet(isPresented: $showBlueprintBuilder) { WeeklyBlueprintView() }
            .sheet(isPresented: $showScorecard) { ExecutionScorecardView() }
            .sheet(isPresented: $showErrorLog) { ErrorLogView() }
            .sheet(isPresented: $showSwipeFile) { SwipeFileView() }
            .sheet(isPresented: $showLifeContext) { LifeContextOnboardingView() }
            .sheet(isPresented: $showDreamTracker) { DreamTrackerView() }
            .sheet(isPresented: $showContextPsyops) { ContextAwarePsyopsView() }
            .sheet(isPresented: $showContextMorning) { ContextAwareMorningView() }
        }
    }
    
    // MARK: - Locked View (Badge Gate)
    
    private var lockedView: some View {
        VStack(spacing: 24) {
            Spacer()
            
            ZStack {
                Circle()
                    .fill(Color(red: 1.0, green: 0.85, blue: 0.3).opacity(0.05))
                    .frame(width: 160, height: 160)
                Circle()
                    .stroke(Color(red: 1.0, green: 0.85, blue: 0.3).opacity(0.2), lineWidth: 2)
                    .frame(width: 160, height: 160)
                Image(systemName: "lock.fill")
                    .font(.system(size: 44))
                    .foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3).opacity(0.4))
            }
            
            VStack(spacing: 12) {
                Text("Sun Flow State").font(.system(size: 24, weight: .black)).foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3))
                Text("Cognitive Sovereignty Protocol").font(.system(size: 13, weight: .bold)).foregroundColor(.white.opacity(0.4))
            }
            
            VStack(spacing: 8) {
                Text("Remove the static so you can hear yourself think.")
                    .font(.system(size: 14, weight: .medium)).foregroundColor(.white.opacity(0.6))
                    .multilineTextAlignment(.center)
                Text("Power doesn't come from effort — it comes from alignment. You can't help anyone when so much noise doesn't let you think clearly. Take care of yourself first. No one said you're not allowed to.")
                    .font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.35))
                    .multilineTextAlignment(.center)
            }
            .padding(.horizontal, 30)
            
            VStack(spacing: 6) {
                Text("EARN \(SunFlowUnlockGate.requiredBadgeCount) BADGES TO UNLOCK")
                    .font(.system(size: 10, weight: .black)).tracking(1.5).foregroundColor(.white.opacity(0.25))
                Text("\(SunFlowUnlockGate.badgesNeeded) more needed")
                    .font(.system(size: 14, weight: .bold)).foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3))
                
                // Badge progress
                HStack(spacing: 8) {
                    ForEach(0..<SunFlowUnlockGate.requiredBadgeCount, id: \.self) { i in
                        let earned = i < SacredBadgeManager.shared.totalBadgeCount
                        Circle()
                            .fill(earned ? Color(red: 1.0, green: 0.85, blue: 0.3) : Color.white.opacity(0.08))
                            .frame(width: 16, height: 16)
                            .overlay(
                                earned ? Image(systemName: "checkmark").font(.system(size: 8, weight: .black)).foregroundColor(.black) : nil
                            )
                    }
                }
            }
            .padding(20)
            .background(RoundedRectangle(cornerRadius: 16).fill(Color.white.opacity(0.02)))
            
            Spacer()
        }
    }
    
    // MARK: - Onboarding (Change Scale + Compass)
    
    private var onboardingView: some View {
        VStack(spacing: 24) {
            Spacer()
            
            Text("☀️").font(.system(size: 60))
            
            Text("Welcome to Sun Flow State")
                .font(.system(size: 22, weight: .black)).foregroundColor(.white)
            
            VStack(spacing: 8) {
                Text("This is not a productivity app.")
                    .font(.system(size: 14, weight: .bold)).foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3))
                Text("This is a mental operating system that reclaims total ownership of your attention, energy, and identity.")
                    .font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.5))
                    .multilineTextAlignment(.center)
            }
            .padding(.horizontal, 30)
            
            VStack(spacing: 8) {
                Text("Before we begin, you need to be honest with yourself.")
                    .font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.4))
                    .multilineTextAlignment(.center)
                Text("Self-deception breaks the system instantly.")
                    .font(.system(size: 11, weight: .bold)).foregroundColor(.red.opacity(0.6))
            }
            .padding(.horizontal, 30)
            
            Button {
                showChangeScale = true
            } label: {
                Text("Take the Change Scale Assessment")
                    .font(.system(size: 15, weight: .bold)).foregroundColor(.black)
                    .frame(maxWidth: .infinity).padding(.vertical, 14)
                    .background(RoundedRectangle(cornerRadius: 14).fill(Color(red: 1.0, green: 0.85, blue: 0.3)))
            }
            .padding(.horizontal, 30)
            
            if engine.compass.changeScaleLevel.meetsMinimum {
                if !LifeContextManager.shared.hasCompletedContextSelection {
                    Button {
                        showLifeContext = true
                    } label: {
                        Text("Set Your Life Context →")
                            .font(.system(size: 14, weight: .bold)).foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3))
                    }
                } else {
                    Button {
                        engine.completeOnboarding()
                    } label: {
                        Text("Enter Sun Flow State →")
                            .font(.system(size: 14, weight: .bold)).foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3))
                    }
                }
            }
            
            Spacer()
        }
    }
    
    // MARK: - Main Dashboard
    
    private var mainDashboard: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
                // Status header
                dashboardHeader
                
                // Phase 0 Bootcamp (if not complete)
                if !engine.bootcamp.isComplete {
                    bootcampCard
                }
                
                // Reset alert
                if engine.needsPhaseZeroReset {
                    resetAlertCard
                }
                
                // Guided Sessions
                Text("SESSIONS").font(.system(size: 9, weight: .black)).tracking(1.5).foregroundColor(.white.opacity(0.2)).frame(maxWidth: .infinity, alignment: .leading)
                
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                    ForEach(GuidedSessionType.allCases) { session in
                        sessionCard(session)
                    }
                }
                
                // Tools
                Text("TOOLS").font(.system(size: 9, weight: .black)).tracking(1.5).foregroundColor(.white.opacity(0.2)).frame(maxWidth: .infinity, alignment: .leading)
                
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                    toolCard(emoji: "🧭", title: "Compass", subtitle: "Pillars & Vision", color: Color(red: 1.0, green: 0.85, blue: 0.3)) { showCompass = true }
                    toolCard(emoji: "📋", title: "Blueprint", subtitle: engine.currentBlueprint == nil ? "Create" : "\(Int((engine.currentBlueprint?.completionPercent ?? 0) * 100))% done", color: .cyan) { showBlueprintBuilder = true }
                    toolCard(emoji: "📊", title: "Scorecard", subtitle: engine.currentScorecard?.grade.emoji ?? "Start", color: .green) { showScorecard = true }
                    toolCard(emoji: "🚫", title: "404 Log", subtitle: "\(engine.errorLog.count) cleared", color: .red) { showErrorLog = true }
                    toolCard(emoji: "💬", title: "No Scripts", subtitle: "25 ready", color: .purple) { showSwipeFile = true }
                    toolCard(emoji: "⚖️", title: "Change Scale", subtitle: engine.compass.changeScaleLevel.shortLabel, color: .orange) { showChangeScale = true }
                }
                
                // Context-aware tools (only if context set)
                if LifeContextManager.shared.selectedContext != nil {
                    Text("YOUR PATH").font(.system(size: 9, weight: .black)).tracking(1.5).foregroundColor(.white.opacity(0.2)).frame(maxWidth: .infinity, alignment: .leading)
                    
                    let ctx = LifeContextManager.shared.selectedContext!
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                        toolCard(emoji: "🎯", title: "Dream Tracker", subtitle: LifeContextManager.shared.aspirationalGoal.isEmpty ? "Set your goal" : String(LifeContextManager.shared.aspirationalGoal.prefix(20)), color: Color(red: 1.0, green: 0.85, blue: 0.3)) { showDreamTracker = true }
                        toolCard(emoji: ctx.emoji, title: "Your Psyops", subtitle: "Tactics targeting you", color: Color(hex: "#F39C12")) { showContextPsyops = true }
                        toolCard(emoji: "🌅", title: "Your Morning", subtitle: "\(ctx.title) routine", color: .green) { showContextMorning = true }
                        toolCard(emoji: "🔧", title: "Life Context", subtitle: ctx.title, color: .cyan) { showLifeContext = true }
                    }
                }
                
                // Privacy banner
                privacyBanner
                
                Spacer(minLength: 100)
            }
            .padding(.horizontal, 16)
            .padding(.top, 16)
        }
    }
    
    // MARK: - Dashboard Header
    
    private var dashboardHeader: some View {
        VStack(spacing: 8) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("☀️ COGNITIVE SOVEREIGNTY").font(.system(size: 9, weight: .black)).tracking(1).foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3).opacity(0.6))
                    Text("Show Up and COOK")
                        .font(.system(size: 20, weight: .black)).foregroundColor(.white)
                }
                Spacer()
                // Change scale badge
                VStack(spacing: 2) {
                    Text(engine.compass.changeScaleLevel.shortLabel)
                        .font(.system(size: 11, weight: .black))
                        .foregroundColor(.black)
                        .padding(.horizontal, 10).padding(.vertical, 4)
                        .background(Capsule().fill(Color(red: 1.0, green: 0.85, blue: 0.3)))
                    Text("Level \(engine.compass.changeScaleLevel.rawValue)/5")
                        .font(.system(size: 8, weight: .bold)).foregroundColor(.white.opacity(0.2))
                }
            }
            
            // Life context + Pillar chips
            if let ctx = LifeContextManager.shared.selectedContext {
                HStack(spacing: 6) {
                    HStack(spacing: 4) {
                        Text(ctx.emoji).font(.system(size: 10))
                        Text(ctx.title).font(.system(size: 9, weight: .bold)).foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3).opacity(0.7))
                    }
                    .padding(.horizontal, 8).padding(.vertical, 4)
                    .background(Capsule().fill(Color(red: 1.0, green: 0.85, blue: 0.3).opacity(0.08)))
                }
            }
            
            if !engine.compass.pillars.isEmpty {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 6) {
                        ForEach(engine.compass.pillars) { pillar in
                            HStack(spacing: 4) {
                                Text(pillar.emoji).font(.system(size: 10))
                                Text(pillar.title).font(.system(size: 9, weight: .bold)).foregroundColor(.white.opacity(0.6))
                            }
                            .padding(.horizontal, 8).padding(.vertical, 4)
                            .background(Capsule().fill(Color.white.opacity(0.05)))
                        }
                    }
                }
            }
        }
        .padding(14)
        .background(RoundedRectangle(cornerRadius: 14).fill(Color(red: 1.0, green: 0.85, blue: 0.3).opacity(0.03)))
        .overlay(RoundedRectangle(cornerRadius: 14).stroke(Color(red: 1.0, green: 0.85, blue: 0.3).opacity(0.1), lineWidth: 1))
    }
    
    // MARK: - Bootcamp Card
    
    private var bootcampCard: some View {
        Button { showBootcamp = true } label: {
            HStack(spacing: 14) {
                ZStack {
                    Circle().fill(Color.purple.opacity(0.15)).frame(width: 50, height: 50)
                    Text("🧘").font(.system(size: 24))
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("PHASE 0 BOOTCAMP").font(.system(size: 9, weight: .black)).tracking(1).foregroundColor(.purple.opacity(0.6))
                    Text("Day \(engine.bootcamp.currentDay)/14")
                        .font(.system(size: 16, weight: .bold)).foregroundColor(.white)
                    
                    GeometryReader { geo in
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 3).fill(Color.white.opacity(0.05)).frame(height: 4)
                            RoundedRectangle(cornerRadius: 3).fill(Color.purple).frame(width: geo.size.width * engine.bootcamp.progressPercent, height: 4)
                        }
                    }
                    .frame(height: 4)
                }
                
                Spacer()
                Image(systemName: "chevron.right").font(.system(size: 12)).foregroundColor(.purple.opacity(0.4))
            }
            .padding(14)
            .background(RoundedRectangle(cornerRadius: 14).fill(Color.purple.opacity(0.04)))
            .overlay(RoundedRectangle(cornerRadius: 14).stroke(Color.purple.opacity(0.12), lineWidth: 1))
        }
        .buttonStyle(.plain)
    }
    
    // MARK: - Reset Alert
    
    private var resetAlertCard: some View {
        HStack(spacing: 12) {
            Text("🔄").font(.system(size: 24))
            VStack(alignment: .leading, spacing: 2) {
                Text("EXECUTION BELOW 70%").font(.system(size: 10, weight: .black)).tracking(1).foregroundColor(.red)
                Text("3-day Phase 0 Reset recommended").font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.5))
            }
            Spacer()
            Button { showBootcamp = true } label: {
                Text("Reset").font(.system(size: 11, weight: .bold)).foregroundColor(.black)
                    .padding(.horizontal, 14).padding(.vertical, 6)
                    .background(Capsule().fill(Color.red))
            }
        }
        .padding(12)
        .background(RoundedRectangle(cornerRadius: 12).fill(Color.red.opacity(0.05)))
        .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.red.opacity(0.2), lineWidth: 1))
    }
    
    // MARK: - Session Card
    
    private func sessionCard(_ session: GuidedSessionType) -> some View {
        Button { showSession = session } label: {
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text(session.emoji).font(.system(size: 22))
                    Spacer()
                    Text(session.duration).font(.system(size: 9, weight: .bold)).foregroundColor(session.color.opacity(0.6))
                }
                Text(session.rawValue).font(.system(size: 13, weight: .bold)).foregroundColor(.white)
            }
            .padding(14)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(RoundedRectangle(cornerRadius: 12).fill(session.color.opacity(0.04)))
            .overlay(RoundedRectangle(cornerRadius: 12).stroke(session.color.opacity(0.12), lineWidth: 1))
        }
        .buttonStyle(.plain)
    }
    
    // MARK: - Tool Card
    
    private func toolCard(emoji: String, title: String, subtitle: String, color: Color, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            VStack(alignment: .leading, spacing: 6) {
                Text(emoji).font(.system(size: 20))
                Text(title).font(.system(size: 12, weight: .bold)).foregroundColor(.white)
                Text(subtitle).font(.system(size: 9, weight: .medium)).foregroundColor(color.opacity(0.6))
            }
            .padding(12)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(RoundedRectangle(cornerRadius: 10).fill(color.opacity(0.03)))
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(color.opacity(0.08), lineWidth: 1))
        }
        .buttonStyle(.plain)
    }
    
    // MARK: - Privacy Banner
    
    private var privacyBanner: some View {
        HStack(spacing: 8) {
            Image(systemName: "lock.shield.fill").font(.system(size: 14)).foregroundColor(.green.opacity(0.5))
            Text("All reflections, voice notes, and Compass data stay 100% on your device. Processed locally. Nothing is sent to any server. Ever.")
                .font(.system(size: 9, weight: .medium)).foregroundColor(.white.opacity(0.2))
        }
        .padding(10)
        .background(RoundedRectangle(cornerRadius: 8).fill(Color.green.opacity(0.02)))
    }
}

// MARK: - ═══════════════════════════════════════════════════
// CHANGE SCALE VIEW
// ═══════════════════════════════════════════════════════════

struct ChangeScaleView: View {
    
    @StateObject private var engine = SunFlowStateEngine.shared
    @Environment(\.dismiss) var dismiss
    @State private var selected: ChangeScaleLevel?
    
    var body: some View {
        ZStack {
            Color(hex: "#0a0a0f").ignoresSafeArea()
            
            VStack(spacing: 20) {
                Spacer()
                
                Text("⚖️").font(.system(size: 44))
                Text("The Change Scale").font(.system(size: 22, weight: .black)).foregroundColor(.white)
                Text("Be honest. Self-deception breaks the system.")
                    .font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.4))
                
                VStack(spacing: 10) {
                    ForEach(ChangeScaleLevel.allCases, id: \.rawValue) { level in
                        Button {
                            selected = level
                            engine.setChangeScale(level)
                        } label: {
                            HStack(spacing: 12) {
                                Text("\(level.rawValue)")
                                    .font(.system(size: 18, weight: .black, design: .rounded))
                                    .foregroundColor(selected == level ? .black : .white.opacity(0.4))
                                    .frame(width: 30)
                                
                                Text(level.label)
                                    .font(.system(size: 12, weight: selected == level ? .bold : .medium))
                                    .foregroundColor(selected == level ? .black : .white.opacity(0.5))
                                    .multilineTextAlignment(.leading)
                                
                                Spacer()
                            }
                            .padding(12)
                            .background(RoundedRectangle(cornerRadius: 10).fill(
                                selected == level ? (level.meetsMinimum ? Color(red: 1.0, green: 0.85, blue: 0.3) : Color.white.opacity(0.1)) : Color.white.opacity(0.03)
                            ))
                        }
                    }
                }
                .padding(.horizontal, 20)
                
                if let sel = selected {
                    if sel.meetsMinimum {
                        Text("You meet the minimum. Let's build your OS.")
                            .font(.system(size: 13, weight: .bold)).foregroundColor(.green)
                    } else {
                        Text("Come back when you're ready. No judgment — just honesty.")
                            .font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.35))
                    }
                }
                
                Button { dismiss() } label: {
                    Text("Confirm").font(.system(size: 15, weight: .bold)).foregroundColor(.black)
                        .frame(maxWidth: .infinity).padding(.vertical, 14)
                        .background(RoundedRectangle(cornerRadius: 14).fill(Color(red: 1.0, green: 0.85, blue: 0.3)))
                }
                .padding(.horizontal, 20)
                
                Spacer()
            }
        }
    }
}

// MARK: - Make GuidedSessionType work with sheet(item:)
extension GuidedSessionType: Hashable {}
