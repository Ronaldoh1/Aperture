// CouncilOfNicaeaCourseView.swift
// 1,700 Years of Programming - Course UI
// ☀️ SunFlow: Reignited

import SwiftUI

// MARK: - Main Course View

struct CouncilOfNicaeaCourseView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var selectedModule: NicaeaModule?
    @State private var selectedLesson: NicaeaLesson?
    @State private var showLessonDetail = false
    @State private var scrollOffset: CGFloat = 0
    @State private var animateHeader = false
    
    private let course = CouncilOfNicaeaCourse.self
    
    var body: some View {
        ZStack {
            // Background
            nicaeaBackground
            
            ScrollView {
                VStack(spacing: 0) {
                    // Header
                    headerSection
                        .padding(.bottom, 24)
                    
                    // Course info
                    courseInfoSection
                        .padding(.horizontal)
                        .padding(.bottom, 32)
                    
                    // Modules
                    modulesSection
                        .padding(.horizontal)
                }
                .padding(.bottom, 100)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: { dismiss() }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                }
            }
        }
        .sheet(isPresented: $showLessonDetail) {
            if let lesson = selectedLesson, let module = selectedModule {
                NicaeaLessonDetailView(lesson: lesson, module: module)
            }
        }
        .onAppear {
            withAnimation(.easeOut(duration: 1.0)) {
                animateHeader = true
            }
        }
    }
    
    // MARK: - Background
    
    private var nicaeaBackground: some View {
        ZStack {
            // Deep burgundy/ancient paper base
            LinearGradient(
                colors: [
                    Color(hex: "#1a0a0a"),
                    Color(hex: "#0d0505"),
                    Color.black
                ],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            // Ancient texture overlay
            GeometryReader { geo in
                ZStack {
                    // Cross pattern (subtle)
                    ForEach(0..<8, id: \.self) { i in
                        ForEach(0..<12, id: \.self) { j in
                            Image(systemName: "plus")
                                .font(.system(size: 8))
                                .foregroundColor(Color(hex: "#8B0000").opacity(0.05))
                                .position(
                                    x: CGFloat(i) * (geo.size.width / 7),
                                    y: CGFloat(j) * (geo.size.height / 11)
                                )
                        }
                    }
                    
                    // Radial glow from top
                    RadialGradient(
                        colors: [
                            Color(hex: "#FFD700").opacity(0.1),
                            Color.clear
                        ],
                        center: .top,
                        startRadius: 0,
                        endRadius: 300
                    )
                }
            }
            .ignoresSafeArea()
        }
    }
    
    // MARK: - Header Section
    
    private var headerSection: some View {
        VStack(spacing: 16) {
            // Animated council icon
            ZStack {
                // Outer glow
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [
                                Color(hex: "#FFD700").opacity(0.3),
                                Color(hex: "#8B0000").opacity(0.1),
                                Color.clear
                            ],
                            center: .center,
                            startRadius: 0,
                            endRadius: animateHeader ? 80 : 40
                        )
                    )
                    .frame(width: 160, height: 160)
                
                // Inner circle
                Circle()
                    .fill(
                        LinearGradient(
                            colors: [
                                Color(hex: "#8B0000"),
                                Color(hex: "#4a0000")
                            ],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 100, height: 100)
                
                // Chi-Rho symbol (☧) - Constantine's sign
                Text("☧")
                    .font(.system(size: 50, weight: .light))
                    .foregroundColor(Color(hex: "#FFD700"))
                    .shadow(color: Color(hex: "#FFD700").opacity(0.5), radius: 10)
                
                // Rotating outer ring
                Circle()
                    .strokeBorder(
                        AngularGradient(
                            colors: [
                                Color(hex: "#FFD700").opacity(0.8),
                                Color(hex: "#FFD700").opacity(0.2),
                                Color.clear,
                                Color(hex: "#FFD700").opacity(0.2),
                                Color(hex: "#FFD700").opacity(0.8)
                            ],
                            center: .center
                        ),
                        lineWidth: 2
                    )
                    .frame(width: 120, height: 120)
                    .rotationEffect(.degrees(animateHeader ? 360 : 0))
                    .animation(.linear(duration: 20).repeatForever(autoreverses: false), value: animateHeader)
            }
            
            // Title
            VStack(spacing: 8) {
                Text("THE COUNCIL OF NICAEA")
                    .font(.caption)
                    .fontWeight(.black)
                    .tracking(4)
                    .foregroundColor(Color(hex: "#FFD700"))
                
                Text("1,700 Years of Programming")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text("325 AD — Present")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
        .padding(.top, 20)
    }
    
    // MARK: - Course Info Section
    
    private var courseInfoSection: some View {
        VStack(spacing: 20) {
            // Stats row
            HStack(spacing: 0) {
                statItem(value: "6", label: "Modules", icon: "book.closed.fill")
                Divider().frame(height: 40)
                statItem(value: "18", label: "Lessons", icon: "doc.text.fill")
                Divider().frame(height: 40)
                statItem(value: "4h", label: "Duration", icon: "clock.fill")
                Divider().frame(height: 40)
                statItem(value: "ADV", label: "Level", icon: "chart.bar.fill")
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.white.opacity(0.05))
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .strokeBorder(Color(hex: "#8B0000").opacity(0.3), lineWidth: 1)
                    )
            )
            
            // Description
            Text(course.description)
                .font(.subheadline)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            // Learning outcomes
            VStack(alignment: .leading, spacing: 12) {
                Text("WHAT YOU'LL UNCOVER")
                    .font(.caption)
                    .fontWeight(.bold)
                    .tracking(2)
                    .foregroundColor(Color(hex: "#FFD700"))
                
                ForEach(course.outcomes, id: \.self) { outcome in
                    HStack(alignment: .top, spacing: 12) {
                        Image(systemName: "eye.fill")
                            .font(.caption)
                            .foregroundColor(Color(hex: "#8B0000"))
                        
                        Text(outcome)
                            .font(.subheadline)
                            .foregroundColor(.white.opacity(0.9))
                    }
                }
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.white.opacity(0.03))
            )
        }
    }
    
    private func statItem(value: String, label: String, icon: String) -> some View {
        VStack(spacing: 4) {
            Image(systemName: icon)
                .font(.caption)
                .foregroundColor(Color(hex: "#8B0000"))
            
            Text(value)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.white)
            
            Text(label)
                .font(.caption2)
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity)
    }
    
    // MARK: - Modules Section
    
    private var modulesSection: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("COURSE MODULES")
                .font(.caption)
                .fontWeight(.bold)
                .tracking(2)
                .foregroundColor(Color(hex: "#FFD700"))
            
            ForEach(course.modules) { module in
                NicaeaModuleCard(
                    module: module,
                    onLessonTap: { lesson in
                        selectedModule = module
                        selectedLesson = lesson
                        showLessonDetail = true
                    }
                )
            }
        }
    }
}

// MARK: - Module Card

struct NicaeaModuleCard: View {
    let module: NicaeaModule
    let onLessonTap: (NicaeaLesson) -> Void
    
    @State private var isExpanded = false
    
    var body: some View {
        VStack(spacing: 0) {
            // Header
            Button(action: {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                    isExpanded.toggle()
                }
            }) {
                HStack(spacing: 16) {
                    // Module number
                    ZStack {
                        Circle()
                            .fill(
                                LinearGradient(
                                    colors: [
                                        Color(hex: "#8B0000"),
                                        Color(hex: "#4a0000")
                                    ],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .frame(width: 44, height: 44)
                        
                        Text("\(module.number)")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(Color(hex: "#FFD700"))
                    }
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(module.title)
                            .font(.headline)
                            .foregroundColor(.white)
                        
                        Text(module.subtitle)
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .trailing, spacing: 4) {
                        Text("\(module.lessonCount) lessons")
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                        Text(module.totalDuration)
                            .font(.caption2)
                            .foregroundColor(Color(hex: "#8B0000"))
                    }
                    
                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                .padding()
            }
            .buttonStyle(.plain)
            
            // Expanded lessons
            if isExpanded {
                VStack(spacing: 0) {
                    Divider()
                        .background(Color(hex: "#8B0000").opacity(0.3))
                    
                    ForEach(Array(module.lessons.enumerated()), id: \.element.id) { index, lesson in
                        Button(action: { onLessonTap(lesson) }) {
                            HStack(spacing: 12) {
                                Text("\(module.number).\(index + 1)")
                                    .font(.caption)
                                    .fontWeight(.medium)
                                    .foregroundColor(Color(hex: "#8B0000"))
                                    .frame(width: 30)
                                
                                VStack(alignment: .leading, spacing: 2) {
                                    Text(lesson.title)
                                        .font(.subheadline)
                                        .foregroundColor(.white)
                                    
                                    Text(lesson.duration)
                                        .font(.caption2)
                                        .foregroundColor(.gray)
                                }
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .font(.caption2)
                                    .foregroundColor(.gray)
                            }
                            .padding(.horizontal)
                            .padding(.vertical, 12)
                        }
                        .buttonStyle(.plain)
                        
                        if index < module.lessons.count - 1 {
                            Divider()
                                .background(Color.white.opacity(0.1))
                                .padding(.leading, 50)
                        }
                    }
                }
                .background(Color.black.opacity(0.3))
            }
        }
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white.opacity(0.05))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .strokeBorder(Color(hex: "#8B0000").opacity(0.3), lineWidth: 1)
                )
        )
    }
}

// MARK: - Lesson Detail View

struct NicaeaLessonDetailView: View {
    let lesson: NicaeaLesson
    let module: NicaeaModule
    @Environment(\.dismiss) private var dismiss
    @State private var showReflection = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Background
                Color.black.ignoresSafeArea()
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 24) {
                        // Header
                        VStack(alignment: .leading, spacing: 8) {
                            Text("MODULE \(module.number)")
                                .font(.caption)
                                .fontWeight(.bold)
                                .tracking(2)
                                .foregroundColor(Color(hex: "#8B0000"))
                            
                            Text(lesson.title)
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            
                            HStack {
                                Label(lesson.duration, systemImage: "clock")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding(.horizontal)
                        
                        Divider()
                            .background(Color(hex: "#8B0000").opacity(0.3))
                        
                        // Content
                        Text(lesson.content)
                            .font(.body)
                            .foregroundColor(.white.opacity(0.9))
                            .lineSpacing(6)
                            .padding(.horizontal)
                        
                        // Key Insight
                        VStack(alignment: .leading, spacing: 12) {
                            HStack {
                                Image(systemName: "lightbulb.fill")
                                    .foregroundColor(Color(hex: "#FFD700"))
                                
                                Text("KEY INSIGHT")
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .tracking(2)
                                    .foregroundColor(Color(hex: "#FFD700"))
                            }
                            
                            Text(lesson.keyInsight)
                                .font(.subheadline)
                                .fontWeight(.medium)
                                .foregroundColor(.white)
                                .italic()
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color(hex: "#FFD700").opacity(0.1))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .strokeBorder(Color(hex: "#FFD700").opacity(0.3), lineWidth: 1)
                                )
                        )
                        .padding(.horizontal)
                        
                        // Reflection
                        VStack(alignment: .leading, spacing: 12) {
                            Button(action: {
                                withAnimation {
                                    showReflection.toggle()
                                }
                            }) {
                                HStack {
                                    Image(systemName: "bubble.left.and.bubble.right.fill")
                                        .foregroundColor(Color(hex: "#8B0000"))
                                    
                                    Text("REFLECTION QUESTION")
                                        .font(.caption)
                                        .fontWeight(.bold)
                                        .tracking(2)
                                        .foregroundColor(Color(hex: "#8B0000"))
                                    
                                    Spacer()
                                    
                                    Image(systemName: showReflection ? "chevron.up" : "chevron.down")
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                }
                            }
                            
                            if showReflection {
                                Text(lesson.reflection)
                                    .font(.subheadline)
                                    .foregroundColor(.white.opacity(0.8))
                                    .padding(.top, 4)
                            }
                        }
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.white.opacity(0.03))
                        )
                        .padding(.horizontal)
                        
                        // Complete button
                        Button(action: {
                            // Mark complete and dismiss
                            dismiss()
                        }) {
                            HStack {
                                Image(systemName: "checkmark.circle.fill")
                                Text("Mark Complete")
                            }
                            .font(.headline)
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(hex: "#FFD700"))
                            .cornerRadius(12)
                        }
                        .padding(.horizontal)
                        .padding(.top, 8)
                    }
                    .padding(.vertical)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") { dismiss() }
                        .foregroundColor(Color(hex: "#FFD700"))
                }
            }
        }
    }
}

// MARK: - Preview

#Preview {
    NavigationStack {
        CouncilOfNicaeaCourseView()
    }
}
