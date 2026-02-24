// FinancialLiteracyView.swift
// Unified view for all financial literacy courses
// Money, Stocks, Crypto, and Anti-Scam content

import SwiftUI

// MARK: - Financial Literacy Course View

struct FinancialLiteracyView: View {
    
    @Environment(\.dismiss) var dismiss
    let courseId: String
    
    @State private var selectedModule: Any?
    @State private var selectedLesson: Any?
    @State private var completedLessons: Set<String> = []
    
    var body: some View {
        
        ZStack {
            
            // Background
            LinearGradient(
                colors: [Color.black, courseColor.opacity(0.1), Color.black],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                // Header
                header
                
                // Content
                ScrollView {
                    VStack(spacing: 24) {
                        
                        // Course intro
                        courseIntroCard
                        
                        // Modules
                        modulesSection
                        
                        Spacer(minLength: 100)
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                }
            }
        }
        .navigationBarHidden(true)
        .onAppear {
            loadProgress()
        }
    }
    
    // MARK: - Header
    
    private var header: some View {
        HStack {
            Button(action: { dismiss() }) {
                Image(systemName: "chevron.left")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.white)
                    .frame(width: 44, height: 44)
                    .background(Color.white.opacity(0.1))
                    .clipShape(Circle())
            }
            
            Spacer()
            
            Text(courseTitle)
                .font(.system(size: 18, weight: .bold, design: .rounded))
                .foregroundColor(.white)
            
            Spacer()
            
            // Progress indicator
            Text("\(completedLessons.count)/\(totalLessons)")
                .font(.system(size: 14, weight: .bold, design: .rounded))
                .foregroundColor(courseColor)
                .padding(.horizontal, 12)
                .padding(.vertical, 6)
                .background(courseColor.opacity(0.2))
                .clipShape(Capsule())
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 16)
    }
    
    // MARK: - Course Intro Card
    
    private var courseIntroCard: some View {
        VStack(spacing: 16) {
            
            Image(systemName: courseIcon)
                .font(.system(size: 48))
                .foregroundColor(courseColor)
            
            Text(courseSubtitle)
                .font(.system(size: 14, weight: .medium, design: .rounded))
                .foregroundColor(Palette.text.secondary)
                .multilineTextAlignment(.center)
            
            // Warning/disclaimer
            HStack(spacing: 10) {
                Image(systemName: "exclamationmark.triangle.fill")
                    .foregroundColor(.orange)
                Text("Not financial advice. Educational content only.")
                    .font(.system(size: 12, weight: .medium, design: .rounded))
                    .foregroundColor(.orange)
            }
            .padding(12)
            .background(Color.orange.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
        .padding(24)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white.opacity(0.05))
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(courseColor.opacity(0.3), lineWidth: 1)
                )
        )
    }
    
    // MARK: - Modules Section
    
    private var modulesSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            
            Text("MODULES")
                .font(.system(size: 12, weight: .bold, design: .rounded))
                .tracking(1)
                .foregroundColor(Palette.text.secondary)
            
            switch courseId {
            case "money-fundamentals":
                ForEach(MoneyFundamentalsCourse.modules) { module in
                    moneyModuleCard(module)
                }
            case "anti-scam-awareness":
                ForEach(AntiScamCourse.modules) { module in
                    scamModuleCard(module)
                }
            case "stock-market-fundamentals":
                ForEach(StockMarketCourse.modules) { module in
                    stockModuleCard(module)
                }
            case "crypto-fundamentals":
                ForEach(CryptoCourse.modules) { module in
                    cryptoModuleCard(module)
                }
            default:
                Text("Course not found")
            }
        }
    }
    
    // MARK: - Module Cards
    
    private func moneyModuleCard(_ module: MoneyModule) -> some View {
        let completedCount = module.lessons.filter { completedLessons.contains($0.id) }.count
        
        return DisclosureGroup {
            VStack(spacing: 8) {
                ForEach(module.lessons) { lesson in
                    lessonRow(
                        id: lesson.id,
                        title: lesson.title,
                        duration: lesson.duration,
                        isCompleted: completedLessons.contains(lesson.id)
                    ) {
                        // Would open lesson detail
                    }
                }
            }
            .padding(.leading, 16)
            .padding(.vertical, 8)
        } label: {
            moduleHeader(
                icon: module.icon,
                title: module.title,
                lessonCount: module.lessons.count,
                completedCount: completedCount
            )
        }
        .accentColor(courseColor)
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white.opacity(0.05))
        )
    }
    
    private func scamModuleCard(_ module: AntiScamModule) -> some View {
        let completedCount = module.lessons.filter { completedLessons.contains($0.id) }.count
        
        return DisclosureGroup {
            VStack(spacing: 8) {
                ForEach(module.lessons) { lesson in
                    lessonRow(
                        id: lesson.id,
                        title: lesson.title,
                        duration: lesson.duration,
                        isCompleted: completedLessons.contains(lesson.id)
                    ) {
                        // Would open lesson detail
                    }
                }
            }
            .padding(.leading, 16)
            .padding(.vertical, 8)
        } label: {
            moduleHeader(
                icon: module.icon,
                title: module.title,
                lessonCount: module.lessons.count,
                completedCount: completedCount
            )
        }
        .accentColor(courseColor)
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white.opacity(0.05))
        )
    }
    
    private func stockModuleCard(_ module: StockModule) -> some View {
        let completedCount = module.lessons.filter { completedLessons.contains($0.id) }.count
        
        return DisclosureGroup {
            VStack(spacing: 8) {
                ForEach(module.lessons) { lesson in
                    lessonRow(
                        id: lesson.id,
                        title: lesson.title,
                        duration: lesson.duration,
                        isCompleted: completedLessons.contains(lesson.id)
                    ) {
                        // Would open lesson detail
                    }
                }
            }
            .padding(.leading, 16)
            .padding(.vertical, 8)
        } label: {
            moduleHeader(
                icon: module.icon,
                title: module.title,
                lessonCount: module.lessons.count,
                completedCount: completedCount
            )
        }
        .accentColor(courseColor)
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white.opacity(0.05))
        )
    }
    
    private func cryptoModuleCard(_ module: CryptoModule) -> some View {
        let completedCount = module.lessons.filter { completedLessons.contains($0.id) }.count
        
        return DisclosureGroup {
            VStack(spacing: 8) {
                ForEach(module.lessons) { lesson in
                    lessonRow(
                        id: lesson.id,
                        title: lesson.title,
                        duration: lesson.duration,
                        isCompleted: completedLessons.contains(lesson.id)
                    ) {
                        // Would open lesson detail
                    }
                }
            }
            .padding(.leading, 16)
            .padding(.vertical, 8)
        } label: {
            moduleHeader(
                icon: module.icon,
                title: module.title,
                lessonCount: module.lessons.count,
                completedCount: completedCount
            )
        }
        .accentColor(courseColor)
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white.opacity(0.05))
        )
    }
    
    // MARK: - Module Header
    
    private func moduleHeader(icon: String, title: String, lessonCount: Int, completedCount: Int) -> some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .font(.system(size: 24))
                .foregroundColor(courseColor)
                .frame(width: 44, height: 44)
                .background(courseColor.opacity(0.2))
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.system(size: 16, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                
                Text("\(completedCount)/\(lessonCount) lessons")
                    .font(.system(size: 12, weight: .medium, design: .rounded))
                    .foregroundColor(Palette.text.secondary)
            }
            
            Spacer()
        }
    }
    
    // MARK: - Lesson Row
    
    private func lessonRow(id: String, title: String, duration: Int, isCompleted: Bool, onTap: @escaping () -> Void) -> some View {
        Button(action: {
            HapticManager.shared.light()
            // Mark as completed for now (would normally open detail)
            if !completedLessons.contains(id) {
                completedLessons.insert(id)
                HapticManager.shared.lessonCompleted()
                saveProgress()
            }
        }) {
            HStack(spacing: 12) {
                // Status indicator
                ZStack {
                    Circle()
                        .stroke(isCompleted ? courseColor : Color.white.opacity(0.3), lineWidth: 2)
                        .frame(width: 24, height: 24)
                    
                    if isCompleted {
                        Image(systemName: "checkmark")
                            .font(.system(size: 12, weight: .bold))
                            .foregroundColor(courseColor)
                    }
                }
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(title)
                        .font(.system(size: 14, weight: .semibold, design: .rounded))
                        .foregroundColor(isCompleted ? courseColor : .white)
                        .lineLimit(2)
                    
                    Text("\(duration) min")
                        .font(.system(size: 11, weight: .medium, design: .rounded))
                        .foregroundColor(Palette.text.muted)
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundColor(Palette.text.muted)
            }
            .padding(.vertical, 8)
        }
        .buttonStyle(PlainButtonStyle())
    }
    
    // MARK: - Computed Properties
    
    private var courseTitle: String {
        switch courseId {
        case "money-fundamentals": return MoneyFundamentalsCourse.title
        case "anti-scam-awareness": return AntiScamCourse.title
        case "stock-market-fundamentals": return StockMarketCourse.title
        case "crypto-fundamentals": return CryptoCourse.title
        default: return "Course"
        }
    }
    
    private var courseSubtitle: String {
        switch courseId {
        case "money-fundamentals": return MoneyFundamentalsCourse.subtitle
        case "anti-scam-awareness": return AntiScamCourse.subtitle
        case "stock-market-fundamentals": return StockMarketCourse.subtitle
        case "crypto-fundamentals": return CryptoCourse.subtitle
        default: return ""
        }
    }
    
    private var courseIcon: String {
        switch courseId {
        case "money-fundamentals": return MoneyFundamentalsCourse.icon
        case "anti-scam-awareness": return AntiScamCourse.icon
        case "stock-market-fundamentals": return StockMarketCourse.icon
        case "crypto-fundamentals": return CryptoCourse.icon
        default: return "book"
        }
    }
    
    private var courseColor: Color {
        switch courseId {
        case "money-fundamentals": return MoneyFundamentalsCourse.color
        case "anti-scam-awareness": return AntiScamCourse.color
        case "stock-market-fundamentals": return StockMarketCourse.color
        case "crypto-fundamentals": return CryptoCourse.color
        default: return .white
        }
    }
    
    private var totalLessons: Int {
        switch courseId {
        case "money-fundamentals": 
            return MoneyFundamentalsCourse.modules.reduce(0) { $0 + $1.lessons.count }
        case "anti-scam-awareness": 
            return AntiScamCourse.modules.reduce(0) { $0 + $1.lessons.count }
        case "stock-market-fundamentals": 
            return StockMarketCourse.modules.reduce(0) { $0 + $1.lessons.count }
        case "crypto-fundamentals": 
            return CryptoCourse.modules.reduce(0) { $0 + $1.lessons.count }
        default: return 0
        }
    }
    
    // MARK: - Progress
    
    private func loadProgress() {
        let key = "financial_\(courseId)_progress"
        if let data = UserDefaults.standard.data(forKey: key),
           let lessons = try? JSONDecoder().decode(Set<String>.self, from: data) {
            completedLessons = lessons
        }
    }
    
    private func saveProgress() {
        let key = "financial_\(courseId)_progress"
        if let data = try? JSONEncoder().encode(completedLessons) {
            UserDefaults.standard.set(data, forKey: key)
        }
    }
}

// MARK: - Preview

#Preview {
    FinancialLiteracyView(courseId: "money-fundamentals")
}
