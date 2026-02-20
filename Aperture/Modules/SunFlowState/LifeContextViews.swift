// LifeContextViews.swift
// Onboarding flow + context-aware displays.
// "What does your day look like?" → tailored everything.
// ☀️ SunFlow: Reignited

import SwiftUI

// MARK: - ═══════════════════════════════════════════════════
// LIFE CONTEXT ONBOARDING — "What does your day look like?"
// ═══════════════════════════════════════════════════════════

struct LifeContextOnboardingView: View {
    
    @StateObject private var contextManager = LifeContextManager.shared
    @Environment(\.dismiss) var dismiss
    @State private var phase = 0  // 0=select, 1=encouragement, 2=dream, 3=time-thieves, 4=locked-in
    @State private var dreamText = ""
    @State private var selectedDream: String?
    
    var body: some View {
        ZStack {
            Color(hex: "#0a0a0f").ignoresSafeArea()
            
            switch phase {
            case 0: contextSelectionPhase
            case 1: encouragementPhase
            case 2: dreamPhase
            case 3: timeThievesPhase
            default: lockedInPhase
            }
        }
    }
    
    // MARK: - Phase 0: Context Selection
    
    private var contextSelectionPhase: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 16) {
                Spacer(minLength: 20)
                
                Text("☀️").font(.system(size: 44))
                Text("What does your day look like?")
                    .font(.system(size: 22, weight: .black)).foregroundColor(.white)
                    .multilineTextAlignment(.center)
                Text("No judgment. Just context.\nSunFlow adapts to YOUR life — not the other way around.")
                    .font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.35))
                    .multilineTextAlignment(.center)
                
                VStack(spacing: 8) {
                    ForEach(LifeContext.allCases) { ctx in
                        Button {
                            contextManager.selectContext(ctx)
                            withAnimation(.easeInOut(duration: 0.3)) { phase = 1 }
                        } label: {
                            contextRow(ctx)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(.top, 8)
                
                Spacer(minLength: 40)
            }
            .padding(.horizontal, 16)
        }
    }
    
    private func contextRow(_ ctx: LifeContext) -> some View {
        let isSelected = contextManager.selectedContext == ctx
        return HStack(spacing: 12) {
            Text(ctx.emoji).font(.system(size: 22))
            VStack(alignment: .leading, spacing: 2) {
                Text(ctx.title).font(.system(size: 14, weight: .bold)).foregroundColor(isSelected ? .black : .white)
                Text(ctx.subtitle).font(.system(size: 10, weight: .medium))
                    .foregroundColor(isSelected ? .black.opacity(0.6) : .white.opacity(0.3))
                    .lineLimit(1)
            }
            Spacer()
            if isSelected {
                Image(systemName: "checkmark.circle.fill").foregroundColor(.black).font(.system(size: 16))
            }
        }
        .padding(12)
        .background(RoundedRectangle(cornerRadius: 12).fill(
            isSelected ? Color(red: 1.0, green: 0.85, blue: 0.3) : Color.white.opacity(0.03)
        ))
        .overlay(RoundedRectangle(cornerRadius: 12).stroke(
            isSelected ? Color.clear : Color.white.opacity(0.04), lineWidth: 1
        ))
    }
    
    // MARK: - Phase 1: Encouragement (personalized)
    
    private var encouragementPhase: some View {
        guard let ctx = contextManager.selectedContext else { return AnyView(EmptyView()) }
        
        return AnyView(
            VStack(spacing: 24) {
                Spacer()
                
                Text(ctx.emoji).font(.system(size: 60))
                
                Text("We see you.")
                    .font(.system(size: 24, weight: .black)).foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3))
                
                Text(ctx.encouragement)
                    .font(.system(size: 14, weight: .medium)).foregroundColor(.white.opacity(0.65))
                    .lineSpacing(5).multilineTextAlignment(.center)
                    .padding(.horizontal, 24)
                
                Button {
                    withAnimation(.easeInOut(duration: 0.3)) { phase = 2 }
                } label: {
                    Text("Next →")
                        .font(.system(size: 15, weight: .bold)).foregroundColor(.black)
                        .frame(maxWidth: .infinity).padding(.vertical, 14)
                        .background(RoundedRectangle(cornerRadius: 14).fill(Color(red: 1.0, green: 0.85, blue: 0.3)))
                }
                .padding(.horizontal, 30)
                
                Spacer()
            }
        )
    }
    
    // MARK: - Phase 2: Dream Setting
    
    private var dreamPhase: some View {
        guard let ctx = contextManager.selectedContext else { return AnyView(EmptyView()) }
        
        return AnyView(
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    Spacer(minLength: 30)
                    
                    Text("🎯").font(.system(size: 44))
                    Text("What are you building toward?")
                        .font(.system(size: 20, weight: .black)).foregroundColor(.white)
                    Text("Your current situation is a launchpad.\nName where you're going.")
                        .font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.35))
                        .multilineTextAlignment(.center)
                    
                    // Suggested dreams
                    VStack(alignment: .leading, spacing: 8) {
                        Text("IDEAS FOR YOU").font(.system(size: 9, weight: .black)).tracking(1).foregroundColor(.white.opacity(0.2))
                        
                        ForEach(ctx.dreamPrompts, id: \.self) { dream in
                            Button {
                                selectedDream = dream
                                dreamText = dream
                            } label: {
                                HStack(spacing: 8) {
                                    Image(systemName: selectedDream == dream ? "checkmark.circle.fill" : "circle")
                                        .font(.system(size: 14))
                                        .foregroundColor(selectedDream == dream ? Color(red: 1.0, green: 0.85, blue: 0.3) : .white.opacity(0.15))
                                    Text(dream)
                                        .font(.system(size: 13, weight: selectedDream == dream ? .bold : .medium))
                                        .foregroundColor(selectedDream == dream ? .white : .white.opacity(0.5))
                                        .multilineTextAlignment(.leading)
                                    Spacer()
                                }
                                .padding(10)
                                .background(RoundedRectangle(cornerRadius: 8).fill(
                                    selectedDream == dream ? Color(red: 1.0, green: 0.85, blue: 0.3).opacity(0.06) : Color.white.opacity(0.02)
                                ))
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    
                    // Custom dream
                    VStack(alignment: .leading, spacing: 6) {
                        Text("OR WRITE YOUR OWN").font(.system(size: 9, weight: .black)).tracking(1).foregroundColor(.white.opacity(0.2))
                        TextField("", text: $dreamText, prompt: Text("My goal is...").foregroundColor(.white.opacity(0.15)))
                            .font(.system(size: 14)).foregroundColor(.white)
                            .padding(12).background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.04)))
                            .onChange(of: dreamText) { _ in selectedDream = nil }
                    }
                    
                    Button {
                        contextManager.setAspirationGoal(dreamText)
                        withAnimation(.easeInOut(duration: 0.3)) { phase = 3 }
                    } label: {
                        Text("Lock It In").font(.system(size: 15, weight: .bold)).foregroundColor(.black)
                            .frame(maxWidth: .infinity).padding(.vertical, 14)
                            .background(RoundedRectangle(cornerRadius: 14).fill(
                                dreamText.isEmpty ? Color.white.opacity(0.1) : Color(red: 1.0, green: 0.85, blue: 0.3)
                            ))
                    }
                    .disabled(dreamText.isEmpty)
                    
                    Spacer(minLength: 40)
                }
                .padding(.horizontal, 16)
            }
        )
    }
    
    // MARK: - Phase 3: Time Thieves Reveal
    
    private var timeThievesPhase: some View {
        guard let ctx = contextManager.selectedContext else { return AnyView(EmptyView()) }
        
        return AnyView(
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    Spacer(minLength: 20)
                    
                    Text("🕳️").font(.system(size: 44))
                    Text("Here's where your time goes")
                        .font(.system(size: 20, weight: .black)).foregroundColor(.red)
                    Text("These are the things standing between you\nand \"\(dreamText)\"")
                        .font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.35))
                        .multilineTextAlignment(.center)
                    
                    VStack(spacing: 10) {
                        ForEach(ctx.topTimeThieves, id: \.0) { thief, stat in
                            HStack(spacing: 12) {
                                Text(String(thief.prefix(2))).font(.system(size: 18))
                                VStack(alignment: .leading, spacing: 2) {
                                    Text(String(thief.dropFirst(2)).trimmingCharacters(in: .whitespaces))
                                        .font(.system(size: 14, weight: .bold)).foregroundColor(.white)
                                    Text(stat).font(.system(size: 10, weight: .medium)).foregroundColor(.red.opacity(0.6))
                                }
                                Spacer()
                            }
                            .padding(12)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.red.opacity(0.04)))
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.red.opacity(0.08), lineWidth: 1))
                        }
                    }
                    
                    Text("SunFlow helps you reclaim this time.\nNot by shaming you — by showing you what's possible with it.")
                        .font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.4))
                        .multilineTextAlignment(.center).padding(.top, 8)
                    
                    Button {
                        withAnimation(.easeInOut(duration: 0.3)) { phase = 4 }
                    } label: {
                        Text("I'm Ready").font(.system(size: 15, weight: .bold)).foregroundColor(.black)
                            .frame(maxWidth: .infinity).padding(.vertical, 14)
                            .background(RoundedRectangle(cornerRadius: 14).fill(Color(red: 1.0, green: 0.85, blue: 0.3)))
                    }
                    
                    Spacer(minLength: 40)
                }
                .padding(.horizontal, 16)
            }
        )
    }
    
    // MARK: - Phase 4: Locked In
    
    private var lockedInPhase: some View {
        guard let ctx = contextManager.selectedContext else { return AnyView(EmptyView()) }
        
        return AnyView(
            VStack(spacing: 24) {
                Spacer()
                
                Text("☀️").font(.system(size: 60))
                
                Text("You're in.")
                    .font(.system(size: 28, weight: .black)).foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3))
                
                VStack(spacing: 6) {
                    HStack(spacing: 6) {
                        Text(ctx.emoji).font(.system(size: 14))
                        Text(ctx.title).font(.system(size: 13, weight: .bold)).foregroundColor(.white.opacity(0.6))
                    }
                    if !dreamText.isEmpty {
                        Text("Building toward: \(dreamText)")
                            .font(.system(size: 12, weight: .medium)).foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3).opacity(0.7))
                            .multilineTextAlignment(.center).padding(.horizontal, 20)
                    }
                }
                
                VStack(spacing: 4) {
                    Text("SunFlow is now tailored to your life.")
                        .font(.system(size: 13, weight: .medium)).foregroundColor(.white.opacity(0.5))
                    Text("Your morning routine, your examples, your path — all adapted for YOU.")
                        .font(.system(size: 11, weight: .medium)).foregroundColor(.white.opacity(0.3))
                        .multilineTextAlignment(.center).padding(.horizontal, 30)
                }
                
                Text("It's OK to take care of yourself.\nNo one said you're not allowed to.")
                    .font(.system(size: 14, weight: .bold)).foregroundColor(.white.opacity(0.6))
                    .multilineTextAlignment(.center).padding(.horizontal, 30)
                
                Button {
                    contextManager.completeSelection()
                    dismiss()
                } label: {
                    Text("Let's COOK ☀️").font(.system(size: 16, weight: .bold)).foregroundColor(.black)
                        .frame(maxWidth: .infinity).padding(.vertical, 14)
                        .background(RoundedRectangle(cornerRadius: 14).fill(Color(red: 1.0, green: 0.85, blue: 0.3)))
                }
                .padding(.horizontal, 30)
                
                Spacer()
            }
        )
    }
}

// MARK: - ═══════════════════════════════════════════════════
// CONTEXT-AWARE PSYOPS EXAMPLES VIEW
// Shows manipulation tactics specific to their life context
// ═══════════════════════════════════════════════════════════

struct ContextAwarePsyopsView: View {
    
    @StateObject private var contextManager = LifeContextManager.shared
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        guard let ctx = contextManager.selectedContext else { return AnyView(EmptyView()) }
        
        return AnyView(
            NavigationStack {
                ZStack {
                    Color(hex: "#0a0a0f").ignoresSafeArea()
                    
                    ScrollView(showsIndicators: false) {
                        VStack(spacing: 14) {
                            HStack(spacing: 8) {
                                Text(ctx.emoji).font(.system(size: 22))
                                Text("Psyops targeting \(ctx.title.lowercased())")
                                    .font(.system(size: 15, weight: .bold)).foregroundColor(.white)
                            }
                            .padding(.top, 10)
                            
                            Text("These tactics are designed specifically for your situation.\nRecognize them. Then #404Error every single one.")
                                .font(.system(size: 11, weight: .medium)).foregroundColor(.white.opacity(0.35))
                                .multilineTextAlignment(.center)
                            
                            ForEach(Array(ctx.psyopsExamples.enumerated()), id: \.offset) { idx, example in
                                HStack(alignment: .top, spacing: 10) {
                                    Text("🎯").font(.system(size: 14))
                                    Text(example)
                                        .font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.6))
                                        .lineSpacing(3)
                                }
                                .padding(12)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color(hex: "#F39C12").opacity(0.03)))
                                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(hex: "#F39C12").opacity(0.06), lineWidth: 1))
                            }
                            
                            Spacer(minLength: 60)
                        }
                        .padding(.horizontal, 16)
                    }
                }
                .navigationTitle("")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) { Text("Your Targeted Psyops").font(.system(size: 16, weight: .bold)).foregroundColor(Color(hex: "#F39C12")) }
                    ToolbarItem(placement: .navigationBarTrailing) { Button("Done") { dismiss() }.foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3)) }
                }
                .toolbarBackground(Color(hex: "#0a0a0f"), for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
            }
        )
    }
}

// MARK: - ═══════════════════════════════════════════════════
// CONTEXT-AWARE DREAM TRACKER
// Keeps their aspiration visible + shows progress
// ═══════════════════════════════════════════════════════════

struct DreamTrackerView: View {
    
    @StateObject private var contextManager = LifeContextManager.shared
    @StateObject private var engine = SunFlowStateEngine.shared
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        guard let ctx = contextManager.selectedContext else { return AnyView(EmptyView()) }
        
        return AnyView(
            NavigationStack {
                ZStack {
                    Color(hex: "#0a0a0f").ignoresSafeArea()
                    
                    ScrollView(showsIndicators: false) {
                        VStack(spacing: 20) {
                            // Dream header
                            VStack(spacing: 10) {
                                Text("🎯").font(.system(size: 40))
                                Text("Your North Star").font(.system(size: 20, weight: .black)).foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3))
                                
                                Text("\"\(contextManager.aspirationalGoal)\"")
                                    .font(.system(size: 16, weight: .bold)).foregroundColor(.white).italic()
                                    .multilineTextAlignment(.center).padding(.horizontal, 20)
                                
                                HStack(spacing: 6) {
                                    Text(ctx.emoji).font(.system(size: 12))
                                    Text("From: \(ctx.title)").font(.system(size: 11, weight: .medium)).foregroundColor(.white.opacity(0.3))
                                }
                            }
                            .padding(.top, 10)
                            
                            // What's been cleared
                            VStack(alignment: .leading, spacing: 10) {
                                Text("NOISE CLEARED").font(.system(size: 9, weight: .black)).tracking(1).foregroundColor(.green.opacity(0.4))
                                
                                statRow("404 Errors logged", "\(engine.errorLog.count)", color: .red)
                                statRow("Stillness sessions", "\(engine.bootcamp.stillnessCompletedDays.count)", color: .purple)
                                statRow("Bootcamp progress", "\(Int(engine.bootcamp.progressPercent * 100))%", color: .cyan)
                            }
                            .padding(14)
                            .background(RoundedRectangle(cornerRadius: 14).fill(Color.green.opacity(0.03)))
                            .overlay(RoundedRectangle(cornerRadius: 14).stroke(Color.green.opacity(0.08), lineWidth: 1))
                            
                            // Time reclaimed estimate
                            let minutesReclaimed = engine.errorLog.count * 15 // rough estimate: each 404 = ~15 min saved
                            let hoursReclaimed = minutesReclaimed / 60
                            
                            VStack(spacing: 6) {
                                Text("ESTIMATED TIME RECLAIMED").font(.system(size: 9, weight: .black)).tracking(1).foregroundColor(.white.opacity(0.2))
                                Text("~\(hoursReclaimed) hours")
                                    .font(.system(size: 32, weight: .black, design: .rounded)).foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3))
                                Text("That's \(hoursReclaimed) hours you could spend on\n\"\(contextManager.aspirationalGoal)\"")
                                    .font(.system(size: 11, weight: .medium)).foregroundColor(.white.opacity(0.35))
                                    .multilineTextAlignment(.center)
                            }
                            .padding(16)
                            .background(RoundedRectangle(cornerRadius: 14).fill(Color(red: 1.0, green: 0.85, blue: 0.3).opacity(0.03)))
                            
                            // Reminder
                            VStack(spacing: 6) {
                                Text("Your job is the bridge.").font(.system(size: 14, weight: .bold)).foregroundColor(.white.opacity(0.6))
                                Text("What's on the other side is what you're building right now.")
                                    .font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.3))
                                    .multilineTextAlignment(.center)
                            }
                            .padding(.horizontal, 20)
                            
                            Spacer(minLength: 60)
                        }
                        .padding(.horizontal, 16)
                    }
                }
                .navigationTitle("")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) { Text("Dream Tracker").font(.system(size: 16, weight: .bold)).foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3)) }
                    ToolbarItem(placement: .navigationBarTrailing) { Button("Done") { dismiss() }.foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3)) }
                }
                .toolbarBackground(Color(hex: "#0a0a0f"), for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
            }
        )
    }
    
    private func statRow(_ label: String, _ value: String, color: Color) -> some View {
        HStack {
            Text(label).font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.5))
            Spacer()
            Text(value).font(.system(size: 14, weight: .bold, design: .rounded)).foregroundColor(color)
        }
    }
}

// MARK: - ═══════════════════════════════════════════════════
// CONTEXT-AWARE MORNING ROUTINE GENERATOR
// Pulls templates from LifeContext and creates routine steps
// ═══════════════════════════════════════════════════════════

struct ContextAwareMorningView: View {
    
    @StateObject private var contextManager = LifeContextManager.shared
    @Environment(\.dismiss) var dismiss
    @State private var completedSteps: Set<Int> = []
    
    var body: some View {
        guard let ctx = contextManager.selectedContext else { return AnyView(EmptyView()) }
        let templates = ctx.morningRoutineTemplates
        let allDone = completedSteps.count == templates.count
        
        return AnyView(
            NavigationStack {
                ZStack {
                    Color(hex: "#0a0a0f").ignoresSafeArea()
                    
                    ScrollView(showsIndicators: false) {
                        VStack(spacing: 14) {
                            HStack(spacing: 8) {
                                Text(ctx.emoji).font(.system(size: 18))
                                Text("Your Morning Routine").font(.system(size: 18, weight: .black)).foregroundColor(.white)
                            }
                            .padding(.top, 10)
                            
                            Text("Tailored for \(ctx.title.lowercased()).\nNo phone first \(ctx.noPhoneFirstMinutes) minutes.")
                                .font(.system(size: 11, weight: .medium)).foregroundColor(.white.opacity(0.35))
                                .multilineTextAlignment(.center)
                            
                            // Progress
                            let pct = templates.isEmpty ? 0.0 : Double(completedSteps.count) / Double(templates.count)
                            GeometryReader { geo in
                                ZStack(alignment: .leading) {
                                    RoundedRectangle(cornerRadius: 3).fill(Color.white.opacity(0.05)).frame(height: 5)
                                    RoundedRectangle(cornerRadius: 3).fill(Color.green).frame(width: geo.size.width * pct, height: 5)
                                }
                            }
                            .frame(height: 5)
                            
                            ForEach(Array(templates.enumerated()), id: \.offset) { idx, template in
                                let done = completedSteps.contains(idx)
                                Button { 
                                    if done { completedSteps.remove(idx) } else { completedSteps.insert(idx) }
                                } label: {
                                    HStack(spacing: 12) {
                                        Image(systemName: done ? "checkmark.circle.fill" : "circle")
                                            .font(.system(size: 20))
                                            .foregroundColor(done ? .green : .white.opacity(0.15))
                                        
                                        Text(template.0).font(.system(size: 16))
                                        
                                        VStack(alignment: .leading, spacing: 1) {
                                            Text(template.1)
                                                .font(.system(size: 13, weight: done ? .medium : .bold))
                                                .foregroundColor(done ? .white.opacity(0.3) : .white)
                                                .strikethrough(done)
                                            Text("\(template.2) min").font(.system(size: 9, weight: .bold))
                                                .foregroundColor(.white.opacity(0.15))
                                        }
                                        
                                        Spacer()
                                    }
                                    .padding(10)
                                    .background(RoundedRectangle(cornerRadius: 10).fill(done ? Color.green.opacity(0.03) : Color.white.opacity(0.02)))
                                }
                                .buttonStyle(.plain)
                            }
                            
                            if allDone {
                                VStack(spacing: 6) {
                                    Text("✓ Morning Complete").font(.system(size: 16, weight: .black)).foregroundColor(.green)
                                    Text("You showed up before the algorithm could. That's sovereignty.")
                                        .font(.system(size: 11, weight: .medium)).foregroundColor(.white.opacity(0.35))
                                        .multilineTextAlignment(.center)
                                }
                                .padding(14)
                                .background(RoundedRectangle(cornerRadius: 12).fill(Color.green.opacity(0.04)))
                            }
                            
                            Spacer(minLength: 60)
                        }
                        .padding(.horizontal, 16)
                    }
                }
                .navigationTitle("")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) { Text("Morning Routine").font(.system(size: 16, weight: .bold)).foregroundColor(.green) }
                    ToolbarItem(placement: .navigationBarTrailing) { Button("Done") { dismiss() }.foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3)) }
                }
                .toolbarBackground(Color(hex: "#0a0a0f"), for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
            }
        )
    }
}
