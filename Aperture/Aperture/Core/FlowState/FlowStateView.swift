// FlowStateView.swift
// Aperture
//
// Flow State Dashboard - Your command center for deep work

import SwiftUI


// MARK: - Main Flow State View

struct FlowStateView: View {
    
    @StateObject private var orchestrator = FlowOrchestrator.shared
    @State private var showSetup = false
    @State private var showWeeklyPlanning = false
    @State private var showDistractionAudit = false
    @State private var showAddPriority = false
    @State private var selectedTab = 0
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Background
                LinearGradient(
                    colors: [
                        Color(hex: "#0a0a1a"),
                        Color(hex: "#1a1a2e"),
                        Color(hex: "#0f0f23")
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                if orchestrator.userProfile == nil {
                    // Show setup
                    FlowSetupPromptView(showSetup: $showSetup)
                } else {
                    // Main dashboard
                    ScrollView(showsIndicators: false) {
                        VStack(spacing: 24) {
                            flowScoreCard
                            todaysFocusSection
                            priorityInboxSection
                            quickActionsSection
                            weeklyInsightsSection
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle("Flow State")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Menu {
                        Button {
                            showWeeklyPlanning = true
                        } label: {
                            Label("Weekly Planning", systemImage: "calendar")
                        }
                        
                        Button {
                            showDistractionAudit = true
                        } label: {
                            Label("Distraction Audit", systemImage: "shield.lefthalf.filled")
                        }
                        
                        Button {
                            showSetup = true
                        } label: {
                            Label("Settings", systemImage: "gear")
                        }
                    } label: {
                        Image(systemName: "ellipsis.circle")
                            .foregroundColor(.white)
                    }
                }
            }
            .sheet(isPresented: $showSetup) {
                FlowSetupView()
            }
            .sheet(isPresented: $showWeeklyPlanning) {
                WeeklyPlanningView()
            }
            .sheet(isPresented: $showDistractionAudit) {
                DistractionAuditView()
            }
            .sheet(isPresented: $showAddPriority) {
                AddPriorityItemView()
            }
        }
        .withModuleTutorial(.flowState)
    }
    
    
    // MARK: - Flow Score Card
    
    private var flowScoreCard: some View {
        VStack(spacing: 16) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("TODAY'S FLOW")
                        .font(.caption.bold())
                        .foregroundColor(.white.opacity(0.5))
                        .tracking(1)
                    
                    Text(currentFlowState)
                        .font(.title2.bold())
                        .foregroundColor(.white)
                }
                
                Spacer()
                
                // Flow Score Ring
                ZStack {
                    Circle()
                        .stroke(Color.white.opacity(0.1), lineWidth: 8)
                        .frame(width: 70, height: 70)
                    
                    Circle()
                        .trim(from: 0, to: CGFloat(flowScore) / 100)
                        .stroke(
                            LinearGradient(
                                colors: [Color(hex: "#7C4DFF"), Color(hex: "#E040FB")],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ),
                            style: StrokeStyle(lineWidth: 8, lineCap: .round)
                        )
                        .frame(width: 70, height: 70)
                        .rotationEffect(.degrees(-90))
                    
                    Text("\(flowScore)")
                        .font(.title3.bold())
                        .foregroundColor(.white)
                }
            }
            
            // Current focus block indicator
            if let currentBlock = getCurrentFocusBlock() {
                HStack(spacing: 12) {
                    Image(systemName: currentBlock.type.icon)
                        .foregroundColor(currentBlock.type.color)
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text(currentBlock.title)
                            .font(.subheadline.bold())
                            .foregroundColor(.white)
                        
                        Text(currentBlock.timeRange)
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.6))
                    }
                    
                    Spacer()
                    
                    Text("NOW")
                        .font(.caption.bold())
                        .foregroundColor(.black)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(currentBlock.type.color)
                        .cornerRadius(8)
                }
                .padding()
                .background(Color.white.opacity(0.05))
                .cornerRadius(12)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white.opacity(0.05))
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(
                            LinearGradient(
                                colors: [Color(hex: "#7C4DFF").opacity(0.5), Color(hex: "#E040FB").opacity(0.3)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ),
                            lineWidth: 1
                        )
                )
        )
    }
    
    private var currentFlowState: String {
        let hour = Calendar.current.component(.hour, from: Date())
        if hour < 6 { return "Rest & Recovery" }
        if hour < 10 { return "Morning Focus Zone" }
        if hour < 12 { return "Peak Performance" }
        if hour < 14 { return "Midday Recharge" }
        if hour < 17 { return "Afternoon Focus" }
        if hour < 20 { return "Wind Down" }
        return "Evening Reflection"
    }
    
    private var flowScore: Int {
        orchestrator.distractionAudit?.flowScore ?? 75
    }
    
    private func getCurrentFocusBlock() -> FocusBlock? {
        let hour = Calendar.current.component(.hour, from: Date())
        return orchestrator.todaysFocusBlocks.first { block in
            hour >= block.startHour && hour < block.endHour
        }
    }
    
    
    // MARK: - Today's Focus Section
    
    private var todaysFocusSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("TODAY'S FOCUS BLOCKS")
                .font(.caption.bold())
                .foregroundColor(.white.opacity(0.5))
                .tracking(1)
            
            if orchestrator.todaysFocusBlocks.isEmpty {
                Text("Set up your profile to generate focus blocks")
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.6))
                    .padding()
            } else {
                ForEach(orchestrator.todaysFocusBlocks) { block in
                    FocusBlockRow(block: block)
                }
            }
        }
    }
    
    
    // MARK: - Priority Inbox Section
    
    private var priorityInboxSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("PRIORITY INBOX")
                    .font(.caption.bold())
                    .foregroundColor(.white.opacity(0.5))
                    .tracking(1)
                
                Spacer()
                
                Button {
                    showAddPriority = true
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .foregroundColor(Color(hex: "#7C4DFF"))
                }
            }
            
            if orchestrator.priorityInbox.isEmpty {
                VStack(spacing: 8) {
                    Image(systemName: "tray")
                        .font(.title)
                        .foregroundColor(.white.opacity(0.3))
                    
                    Text("Inbox Zero! 🎉")
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.6))
                }
                .frame(maxWidth: .infinity)
                .padding()
            } else {
                // Show P1 and P2 items only
                let urgentItems = orchestrator.priorityInbox.filter { $0.priority == .p1 || $0.priority == .p2 }
                
                ForEach(urgentItems.prefix(5)) { item in
                    PriorityItemRow(item: item)
                }
                
                if urgentItems.count > 5 {
                    Text("+\(urgentItems.count - 5) more items")
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.5))
                }
            }
        }
    }
    
    
    // MARK: - Quick Actions
    
    private var quickActionsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("QUICK ACTIONS")
                .font(.caption.bold())
                .foregroundColor(.white.opacity(0.5))
                .tracking(1)
            
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                QuickActionButton(
                    icon: "shield.lefthalf.filled",
                    title: "Haikai Audit",
                    color: Color(hex: "#7C4DFF")
                ) {
                    showDistractionAudit = true
                }
                
                QuickActionButton(
                    icon: "calendar",
                    title: "Plan Week",
                    color: Color(hex: "#00BCD4")
                ) {
                    showWeeklyPlanning = true
                }
                
                QuickActionButton(
                    icon: "bell.slash.fill",
                    title: "Focus Mode",
                    color: Color(hex: "#FF9800")
                ) {
                    // Enable focus mode
                }
                
                QuickActionButton(
                    icon: "chart.bar.fill",
                    title: "Statistics",
                    color: Color(hex: "#4CAF50")
                ) {
                    // Show stats
                }
            }
        }
    }
    
    
    // MARK: - Weekly Insights
    
    private var weeklyInsightsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("THIS WEEK")
                .font(.caption.bold())
                .foregroundColor(.white.opacity(0.5))
                .tracking(1)
            
            HStack(spacing: 16) {
                FlowInsightCard(
                    value: "\(orchestrator.currentStreak)",
                    label: "Day Streak",
                    icon: "flame.fill",
                    color: .orange
                )
                
                FlowInsightCard(
                    value: "\(orchestrator.priorityInbox.filter { $0.isCompleted }.count)",
                    label: "Completed",
                    icon: "checkmark.circle.fill",
                    color: .green
                )
                
                FlowInsightCard(
                    value: orchestrator.distractionAudit?.formattedTimeSaved ?? "0m",
                    label: "Time Saved",
                    icon: "clock.fill",
                    color: Color(hex: "#7C4DFF")
                )
            }
        }
    }
}


// MARK: - Supporting Views

struct FlowSetupPromptView: View {
    @Binding var showSetup: Bool
    
    var body: some View {
        VStack(spacing: 24) {
            Spacer()
            
            ZStack {
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [Color(hex: "#7C4DFF").opacity(0.3), Color.clear],
                            center: .center,
                            startRadius: 30,
                            endRadius: 100
                        )
                    )
                    .frame(width: 200, height: 200)
                    .blur(radius: 30)
                
                Image(systemName: "brain.head.profile")
                    .font(.system(size: 80))
                    .foregroundStyle(
                        LinearGradient(
                            colors: [Color(hex: "#7C4DFF"), Color(hex: "#E040FB")],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
            }
            
            VStack(spacing: 12) {
                Text("Enter Flow State")
                    .font(.title.bold())
                    .foregroundColor(.white)
                
                Text("Remove distractions. Optimize your time.\nAchieve deep focus.")
                    .font(.body)
                    .foregroundColor(.white.opacity(0.7))
                    .multilineTextAlignment(.center)
            }
            
            Spacer()
            
            Button {
                showSetup = true
            } label: {
                Text("Get Started")
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(
                        LinearGradient(
                            colors: [Color(hex: "#7C4DFF"), Color(hex: "#E040FB")],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .cornerRadius(16)
            }
            .padding(.horizontal, 40)
            .padding(.bottom, 40)
        }
    }
}

struct FocusBlockRow: View {
    let block: FocusBlock
    
    var isCurrentBlock: Bool {
        let hour = Calendar.current.component(.hour, from: Date())
        return hour >= block.startHour && hour < block.endHour
    }
    
    var body: some View {
        HStack(spacing: 12) {
            Circle()
                .fill(block.type.color)
                .frame(width: 12, height: 12)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(block.title)
                    .font(.subheadline.bold())
                    .foregroundColor(.white)
                
                Text(block.timeRange)
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.6))
            }
            
            Spacer()
            
            Image(systemName: block.type.icon)
                .foregroundColor(block.type.color)
            
            if isCurrentBlock {
                Text("NOW")
                    .font(.caption2.bold())
                    .foregroundColor(.black)
                    .padding(.horizontal, 6)
                    .padding(.vertical, 2)
                    .background(block.type.color)
                    .cornerRadius(4)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(isCurrentBlock ? block.type.color.opacity(0.15) : Color.white.opacity(0.05))
        )
    }
}

struct PriorityItemRow: View {
    let item: PriorityItem
    
    var body: some View {
        HStack(spacing: 12) {
            Circle()
                .fill(item.priority.color)
                .frame(width: 10, height: 10)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(item.title)
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .strikethrough(item.isCompleted)
                
                HStack(spacing: 8) {
                    Text(item.priority.shortLabel)
                        .font(.caption2.bold())
                        .foregroundColor(item.priority.color)
                    
                    Text(item.source.rawValue)
                        .font(.caption2)
                        .foregroundColor(.white.opacity(0.5))
                }
            }
            
            Spacer()
            
            if let dueDate = item.dueDate {
                Text(dueDate, style: .date)
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.5))
            }
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(12)
    }
}

struct QuickActionButton: View {
    let icon: String
    let title: String
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 8) {
                Image(systemName: icon)
                    .font(.title2)
                    .foregroundColor(color)
                
                Text(title)
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.8))
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.white.opacity(0.05))
            .cornerRadius(16)
        }
    }
}

struct FlowInsightCard: View {
    let value: String
    let label: String
    let icon: String
    let color: Color
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: icon)
                .foregroundColor(color)
            
            Text(value)
                .font(.title2.bold())
                .foregroundColor(.white)
            
            Text(label)
                .font(.caption)
                .foregroundColor(.white.opacity(0.6))
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(16)
    }
}


// MARK: - Preview

#Preview {
    FlowStateView()
}
