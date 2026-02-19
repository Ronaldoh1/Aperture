// SecondBrainHubView.swift
// SECOND BRAIN HUB — "Your External Operating System"
// ☀️ SunFlow: Reignited × Second Brain
//
// The daily-use entry point.
// Reminders + Brain Dump + Mood Tracker + Streaks + Mind Sanctuary.
// Everything an ADHD brain needs, one tap away.

import SwiftUI

struct SecondBrainHubView: View {
    
    @Environment(\.dismiss) var dismiss
    @StateObject private var streaks = StreakTracker()
    @StateObject private var moods = MoodStore()
    @StateObject private var dumps = BrainDumpStore()
    
    @State private var showReminders = false
    @State private var showBrainDump = false
    @State private var showMoodTracker = false
    @State private var showStreaks = false
    @State private var showSanctuary = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 0.02, green: 0.03, blue: 0.06).ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 16) {
                        headerView
                        quickStatsBar
                        todayCard
                        featureGrid
                        dailyMissions
                        Spacer(minLength: 60)
                    }
                    .padding(20)
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
                    HStack(spacing: 6) {
                        Image(systemName: "brain").font(.system(size: 14)).foregroundColor(.cyan)
                        Text("Second Brain").font(.system(size: 17, weight: .bold)).foregroundColor(.white)
                    }
                }
            }
            .fullScreenCover(isPresented: $showReminders) { AccountabilityRemindersView() }
            .fullScreenCover(isPresented: $showBrainDump) { BrainDumpView() }
            .fullScreenCover(isPresented: $showMoodTracker) { MoodTrackerView() }
            .fullScreenCover(isPresented: $showStreaks) { StreaksAndBadgesView() }
            .fullScreenCover(isPresented: $showSanctuary) { MindSanctuaryView() }
        }
    }
    
    // MARK: - Header
    
    private var headerView: some View {
        VStack(spacing: 6) {
            Text("🧠").font(.system(size: 40))
            Text("SECOND BRAIN").font(.system(size: 20, weight: .black)).tracking(1).foregroundColor(.white)
            Text("Your external operating system.\n3 working memory slots → unlimited.")
                .font(.system(size: 10, weight: .medium)).foregroundColor(.white.opacity(0.25)).multilineTextAlignment(.center)
        }
    }
    
    // MARK: - Quick Stats
    
    private var quickStatsBar: some View {
        HStack(spacing: 8) {
            quickStat("🔥", "\(longestActiveStreak)", "Streak")
            quickStat("⚡", "Lv \(streaks.currentLevel)", streaks.levelTitle)
            quickStat("💚", String(format: "%.0f", moods.averageMood), "Mood Avg")
            quickStat("🧠", "\(dumps.items.filter { !$0.isCompleted }.count)", "In Head")
        }
    }
    
    private func quickStat(_ emoji: String, _ value: String, _ label: String) -> some View {
        VStack(spacing: 3) {
            Text(emoji).font(.system(size: 14))
            Text(value).font(.system(size: 14, weight: .black)).foregroundColor(.white)
            Text(label).font(.system(size: 7, weight: .bold)).foregroundColor(.white.opacity(0.2))
        }
        .frame(maxWidth: .infinity).padding(.vertical, 10)
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.02)))
    }
    
    private var longestActiveStreak: Int {
        StreakType.allCases.map { streaks.getStreak($0) }.max() ?? 0
    }
    
    // MARK: - Today Card
    
    private var todayCard: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 4) {
                Text("☀️").font(.system(size: 10))
                Text("TODAY").font(.system(size: 10, weight: .black)).tracking(1).foregroundColor(.white.opacity(0.3))
            }
            
            HStack(spacing: 6) {
                todayCheck("💚", "Mood", moods.todayEntry != nil)
                todayCheck("🌬️", "Breathe", streaks.getStreak(.breathing) > 0)
                todayCheck("🧠", "Dump", streaks.getStreak(.brainDump) > 0)
                todayCheck("✅", "Task", streaks.getStreak(.taskComplete) > 0)
            }
        }
        .padding(14).background(RoundedRectangle(cornerRadius: 12).fill(Color.white.opacity(0.02)))
    }
    
    private func todayCheck(_ emoji: String, _ label: String, _ done: Bool) -> some View {
        VStack(spacing: 3) {
            Text(emoji).font(.system(size: 16)).opacity(done ? 1.0 : 0.3)
            Text(label).font(.system(size: 8, weight: .bold)).foregroundColor(done ? .green : .white.opacity(0.15))
            Image(systemName: done ? "checkmark.circle.fill" : "circle").font(.system(size: 10))
                .foregroundColor(done ? .green : .white.opacity(0.06))
        }
        .frame(maxWidth: .infinity).padding(.vertical, 6)
    }
    
    // MARK: - Feature Grid
    
    private var featureGrid: some View {
        VStack(spacing: 8) {
            HStack(spacing: 8) {
                featureTile("🔔", "Reminders", "External accountability", .cyan) { showReminders = true }
                featureTile("🧠", "Brain Dump", "Get it out of your head", .purple) { showBrainDump = true }
            }
            HStack(spacing: 8) {
                featureTile("💚", "Mood Tracker", "Name it to tame it", .pink) { showMoodTracker = true }
                featureTile("🔥", "Streaks", "Dopamine for growth", .orange) { showStreaks = true }
            }
            // Mind Sanctuary — full width
            Button { showSanctuary = true } label: {
                HStack(spacing: 10) {
                    Text("🕊️").font(.system(size: 20))
                    VStack(alignment: .leading, spacing: 2) {
                        Text("Mind Sanctuary").font(.system(size: 13, weight: .bold)).foregroundColor(.white)
                        Text("Breathing • Grounding • First Aid • Sensory Tools").font(.system(size: 9, weight: .medium)).foregroundColor(.green.opacity(0.4))
                    }
                    Spacer()
                    Image(systemName: "chevron.right").font(.system(size: 10)).foregroundColor(.white.opacity(0.1))
                }
                .padding(14).background(RoundedRectangle(cornerRadius: 12).fill(Color.green.opacity(0.03))
                    .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.green.opacity(0.06), lineWidth: 1)))
            }
        }
    }
    
    private func featureTile(_ emoji: String, _ title: String, _ subtitle: String, _ color: Color, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            VStack(spacing: 6) {
                Text(emoji).font(.system(size: 24))
                Text(title).font(.system(size: 12, weight: .bold)).foregroundColor(.white)
                Text(subtitle).font(.system(size: 8, weight: .medium)).foregroundColor(color.opacity(0.4))
            }
            .frame(maxWidth: .infinity).padding(16)
            .background(RoundedRectangle(cornerRadius: 12).fill(color.opacity(0.02))
                .overlay(RoundedRectangle(cornerRadius: 12).stroke(color.opacity(0.05), lineWidth: 1)))
        }
    }
    
    // MARK: - Daily Missions Preview
    
    private var dailyMissions: some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack {
                Text("DAILY MISSIONS").font(.system(size: 9, weight: .black)).tracking(1).foregroundColor(.white.opacity(0.2))
                Spacer()
                Button { showStreaks = true } label: {
                    Text("See all →").font(.system(size: 9, weight: .medium)).foregroundColor(.orange.opacity(0.4))
                }
            }
            
            ForEach(DailyMission.todaysMissions.prefix(3)) { mission in
                HStack(spacing: 8) {
                    Image(systemName: streaks.isMissionComplete(mission.id) ? "checkmark.circle.fill" : "circle")
                        .font(.system(size: 12)).foregroundColor(streaks.isMissionComplete(mission.id) ? .green : .white.opacity(0.08))
                    Text(mission.title).font(.system(size: 11, weight: .medium))
                        .foregroundColor(streaks.isMissionComplete(mission.id) ? .white.opacity(0.2) : .white.opacity(0.5))
                    Spacer()
                    Text("+\(mission.xpReward)").font(.system(size: 9, weight: .bold)).foregroundColor(.cyan.opacity(0.3))
                }
            }
        }
        .padding(12).background(RoundedRectangle(cornerRadius: 12).fill(Color.white.opacity(0.015)))
    }
}
