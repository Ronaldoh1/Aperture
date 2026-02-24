// FlowSetupView.swift
// Aperture
//
// Flow State Setup - Collect user preferences for personalized flow optimization

import SwiftUI


struct FlowSetupView: View {
    
    @StateObject private var orchestrator = FlowOrchestrator.shared
    @Environment(\.dismiss) private var dismiss
    
    @State private var currentStep = 0
    @State private var name = ""
    @State private var circadianType: CircadianType = .balanced
    @State private var workStartHour = 9
    @State private var workEndHour = 17
    @State private var workDays: Set<Int> = [2, 3, 4, 5, 6]  // Mon-Fri
    @State private var socialMediaMinutes: Double = 60
    @State private var emailChecksPerDay = 5
    @State private var meetingHoursPerDay = 3.0
    @State private var hasOptimizedNotifications = false
    @State private var dailyFlowGoal = 4
    @State private var topPriorities: [String] = ["", "", ""]
    @State private var vipContacts: [String] = []
    @State private var newVIP = ""
    
    private let totalSteps = 5
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(hex: "#0a0a1a")
                    .ignoresSafeArea()
                
                VStack(spacing: 24) {
                    // Progress
                    progressIndicator
                    
                    // Step content
                    TabView(selection: $currentStep) {
                        step1Basics.tag(0)
                        step2Circadian.tag(1)
                        step3CurrentHabits.tag(2)
                        step4Priorities.tag(3)
                        step5VIPs.tag(4)
                    }
                    .tabViewStyle(.page(indexDisplayMode: .never))
                    
                    // Navigation buttons
                    navigationButtons
                }
            }
            .navigationTitle("Flow Setup")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") { dismiss() }
                        .foregroundColor(.white.opacity(0.6))
                }
            }
        }
    }
    
    
    // MARK: - Progress Indicator
    
    private var progressIndicator: some View {
        HStack(spacing: 8) {
            ForEach(0..<totalSteps, id: \.self) { step in
                RoundedRectangle(cornerRadius: 2)
                    .fill(step <= currentStep ? Color(hex: "#7C4DFF") : Color.white.opacity(0.2))
                    .frame(height: 4)
            }
        }
        .padding(.horizontal)
    }
    
    
    // MARK: - Step 1: Basics
    
    private var step1Basics: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                stepHeader(
                    icon: "person.fill",
                    title: "Let's Get Started",
                    subtitle: "Tell us a bit about yourself"
                )
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Your Name")
                        .font(.subheadline.bold())
                        .foregroundColor(.white.opacity(0.7))
                    
                    TextField("Enter your name", text: $name)
                        .textFieldStyle(FlowTextFieldStyle())
                }
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("Work Schedule")
                        .font(.subheadline.bold())
                        .foregroundColor(.white.opacity(0.7))
                    
                    HStack(spacing: 16) {
                        VStack(alignment: .leading) {
                            Text("Start")
                                .font(.caption)
                                .foregroundColor(.white.opacity(0.5))
                            
                            Picker("Start", selection: $workStartHour) {
                                ForEach(5..<22) { hour in
                                    Text(formatHour(hour)).tag(hour)
                                }
                            }
                            .pickerStyle(.wheel)
                            .frame(height: 100)
                            .clipped()
                        }
                        
                        VStack(alignment: .leading) {
                            Text("End")
                                .font(.caption)
                                .foregroundColor(.white.opacity(0.5))
                            
                            Picker("End", selection: $workEndHour) {
                                ForEach(5..<24) { hour in
                                    Text(formatHour(hour)).tag(hour)
                                }
                            }
                            .pickerStyle(.wheel)
                            .frame(height: 100)
                            .clipped()
                        }
                    }
                }
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("Work Days")
                        .font(.subheadline.bold())
                        .foregroundColor(.white.opacity(0.7))
                    
                    HStack(spacing: 8) {
                        ForEach(1..<8) { day in
                            DayButton(
                                day: day,
                                isSelected: workDays.contains(day),
                                action: {
                                    if workDays.contains(day) {
                                        workDays.remove(day)
                                    } else {
                                        workDays.insert(day)
                                    }
                                }
                            )
                        }
                    }
                }
            }
            .padding()
        }
    }
    
    
    // MARK: - Step 2: Circadian Rhythm
    
    private var step2Circadian: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                stepHeader(
                    icon: "sun.max.fill",
                    title: "Your Natural Rhythm",
                    subtitle: "When do you feel most energized?"
                )
                
                ForEach(CircadianType.allCases, id: \.self) { type in
                    CircadianOptionCard(
                        type: type,
                        isSelected: circadianType == type,
                        action: { circadianType = type }
                    )
                }
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("Daily Flow Goal")
                        .font(.subheadline.bold())
                        .foregroundColor(.white.opacity(0.7))
                    
                    HStack {
                        Text("\(dailyFlowGoal) hours")
                            .font(.title2.bold())
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        Stepper("", value: $dailyFlowGoal, in: 1...8)
                            .labelsHidden()
                    }
                    
                    Text("Deep work hours per day")
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.5))
                }
                .padding()
                .background(Color.white.opacity(0.05))
                .cornerRadius(16)
            }
            .padding()
        }
    }
    
    
    // MARK: - Step 3: Current Habits
    
    private var step3CurrentHabits: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                stepHeader(
                    icon: "chart.bar.fill",
                    title: "Current Habits",
                    subtitle: "Be honest - we'll help you improve"
                )
                
                // Social Media
                HabitSlider(
                    title: "Social Media",
                    icon: "iphone",
                    value: $socialMediaMinutes,
                    range: 0...180,
                    unit: "min/day",
                    color: .pink
                )
                
                // Email Checks
                HabitSlider(
                    title: "Email Checks",
                    icon: "envelope.fill",
                    value: Binding(
                        get: { Double(emailChecksPerDay) },
                        set: { emailChecksPerDay = Int($0) }
                    ),
                    range: 0...20,
                    unit: "times/day",
                    color: .blue
                )
                
                // Meetings
                HabitSlider(
                    title: "Meetings",
                    icon: "person.3.fill",
                    value: $meetingHoursPerDay,
                    range: 0...8,
                    unit: "hrs/day",
                    color: .purple
                )
                
                // Notifications
                Toggle(isOn: $hasOptimizedNotifications) {
                    HStack(spacing: 12) {
                        Image(systemName: "bell.slash.fill")
                            .foregroundColor(.orange)
                        
                        VStack(alignment: .leading, spacing: 2) {
                            Text("Optimized Notifications")
                                .foregroundColor(.white)
                            
                            Text("Already turned off non-essential alerts")
                                .font(.caption)
                                .foregroundColor(.white.opacity(0.5))
                        }
                    }
                }
                .toggleStyle(SwitchToggleStyle(tint: Color(hex: "#7C4DFF")))
                .padding()
                .background(Color.white.opacity(0.05))
                .cornerRadius(16)
            }
            .padding()
        }
    }
    
    
    // MARK: - Step 4: Priorities
    
    private var step4Priorities: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                stepHeader(
                    icon: "target",
                    title: "Your Top Priorities",
                    subtitle: "What matters most to you right now?"
                )
                
                Text("List 3 things you want to focus on")
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.6))
                
                ForEach(0..<3, id: \.self) { index in
                    HStack(spacing: 12) {
                        Text("\(index + 1)")
                            .font(.title3.bold())
                            .foregroundColor(Color(hex: "#7C4DFF"))
                            .frame(width: 30)
                        
                        TextField("Priority \(index + 1)", text: $topPriorities[index])
                            .textFieldStyle(FlowTextFieldStyle())
                    }
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("💡 Examples:")
                        .font(.caption.bold())
                        .foregroundColor(.white.opacity(0.5))
                    
                    Text("• Ship the MVP\n• Spend quality time with family\n• Exercise 4x/week\n• Learn Swift")
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.5))
                }
                .padding()
                .background(Color.white.opacity(0.05))
                .cornerRadius(12)
            }
            .padding()
        }
    }
    
    
    // MARK: - Step 5: VIPs
    
    private var step5VIPs: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                stepHeader(
                    icon: "star.fill",
                    title: "Your VIPs",
                    subtitle: "Who should always get through?"
                )
                
                Text("These people's messages will never be silenced")
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.6))
                
                HStack {
                    TextField("Add name or email", text: $newVIP)
                        .textFieldStyle(FlowTextFieldStyle())
                    
                    Button {
                        if !newVIP.isEmpty {
                            vipContacts.append(newVIP)
                            newVIP = ""
                        }
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.title2)
                            .foregroundColor(Color(hex: "#7C4DFF"))
                    }
                }
                
                ForEach(vipContacts, id: \.self) { vip in
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        
                        Text(vip)
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        Button {
                            vipContacts.removeAll { $0 == vip }
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.white.opacity(0.5))
                        }
                    }
                    .padding()
                    .background(Color.white.opacity(0.05))
                    .cornerRadius(12)
                }
                
                if vipContacts.isEmpty {
                    Text("No VIPs added yet")
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.5))
                        .frame(maxWidth: .infinity)
                        .padding()
                }
            }
            .padding()
        }
    }
    
    
    // MARK: - Navigation Buttons
    
    private var navigationButtons: some View {
        HStack(spacing: 16) {
            if currentStep > 0 {
                Button {
                    withAnimation {
                        currentStep -= 1
                    }
                } label: {
                    Text("Back")
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.white.opacity(0.1))
                        .cornerRadius(12)
                }
            }
            
            Button {
                if currentStep < totalSteps - 1 {
                    withAnimation {
                        currentStep += 1
                    }
                } else {
                    saveAndDismiss()
                }
            } label: {
                Text(currentStep < totalSteps - 1 ? "Continue" : "Start Flow")
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
                    .cornerRadius(12)
            }
        }
        .padding(.horizontal)
        .padding(.bottom)
    }
    
    
    // MARK: - Helpers
    
    private func stepHeader(icon: String, title: String, subtitle: String) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(systemName: icon)
                .font(.title)
                .foregroundColor(Color(hex: "#7C4DFF"))
            
            Text(title)
                .font(.title2.bold())
                .foregroundColor(.white)
            
            Text(subtitle)
                .font(.subheadline)
                .foregroundColor(.white.opacity(0.6))
        }
    }
    
    private func formatHour(_ hour: Int) -> String {
        let h = hour % 12 == 0 ? 12 : hour % 12
        let ampm = hour < 12 ? "AM" : "PM"
        return "\(h) \(ampm)"
    }
    
    private func saveAndDismiss() {
        let profile = FlowUserProfile(
            name: name,
            workStartHour: workStartHour,
            workEndHour: workEndHour,
            workDays: Array(workDays).sorted(),
            circadianType: circadianType,
            currentSocialMediaMinutes: Int(socialMediaMinutes),
            emailChecksPerDay: emailChecksPerDay,
            averageMeetingHoursPerDay: meetingHoursPerDay,
            hasOptimizedNotifications: hasOptimizedNotifications,
            dailyFlowHoursGoal: dailyFlowGoal,
            topPriorities: topPriorities.filter { !$0.isEmpty },
            vipContacts: vipContacts
        )
        
        orchestrator.saveUserProfile(profile)
        _ = orchestrator.runDistractionAudit()
        dismiss()
    }
}


// MARK: - Supporting Views

struct FlowTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding()
            .background(Color.white.opacity(0.1))
            .cornerRadius(12)
            .foregroundColor(.white)
    }
}

struct DayButton: View {
    let day: Int
    let isSelected: Bool
    let action: () -> Void
    
    private var dayLetter: String {
        ["S", "M", "T", "W", "T", "F", "S"][day - 1]
    }
    
    var body: some View {
        Button(action: action) {
            Text(dayLetter)
                .font(.subheadline.bold())
                .foregroundColor(isSelected ? .black : .white)
                .frame(width: 40, height: 40)
                .background(isSelected ? Color(hex: "#7C4DFF") : Color.white.opacity(0.1))
                .cornerRadius(20)
        }
    }
}

struct CircadianOptionCard: View {
    let type: CircadianType
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 16) {
                Image(systemName: type.icon)
                    .font(.title2)
                    .foregroundColor(isSelected ? Color(hex: "#7C4DFF") : .white.opacity(0.5))
                    .frame(width: 40)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(type.rawValue)
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    Text(type.description)
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.6))
                }
                
                Spacer()
                
                if isSelected {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(Color(hex: "#7C4DFF"))
                }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.white.opacity(0.05))
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(isSelected ? Color(hex: "#7C4DFF") : Color.clear, lineWidth: 2)
                    )
            )
        }
    }
}

struct HabitSlider<T: BinaryFloatingPoint>: View where T.Stride: BinaryFloatingPoint {
    let title: String
    let icon: String
    @Binding var value: T
    let range: ClosedRange<T>
    let unit: String
    let color: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: icon)
                    .foregroundColor(color)
                
                Text(title)
                    .font(.subheadline.bold())
                    .foregroundColor(.white)
                
                Spacer()
                
                Text("\(Int(value)) \(unit)")
                    .font(.subheadline.bold())
                    .foregroundColor(color)
            }
            
            Slider(value: $value, in: range)
                .tint(color)
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(16)
    }
}


#Preview {
    FlowSetupView()
}
