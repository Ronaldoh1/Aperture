// AchievementViews.swift
// Achievement Badge UI Components
// ☀️ SunFlow: Reignited

import SwiftUI

// MARK: - Achievement Badge View

struct AchievementBadgeView: View {
    let achievement: Achievement
    let isUnlocked: Bool
    let size: BadgeSize
    
    enum BadgeSize {
        case small, medium, large
        
        var dimension: CGFloat {
            switch self {
            case .small: return 50
            case .medium: return 80
            case .large: return 120
            }
        }
        
        var iconSize: CGFloat {
            switch self {
            case .small: return 20
            case .medium: return 32
            case .large: return 48
            }
        }
        
        var fontSize: Font {
            switch self {
            case .small: return .caption2
            case .medium: return .caption
            case .large: return .subheadline
            }
        }
    }
    
    var body: some View {
        VStack(spacing: 8) {
            ZStack {
                // Background glow for unlocked
                if isUnlocked {
                    Circle()
                        .fill(achievement.rarity.color.opacity(0.3))
                        .blur(radius: 10 * achievement.rarity.glowIntensity)
                        .scaleEffect(1.2)
                }
                
                // Badge circle
                Circle()
                    .fill(
                        isUnlocked
                            ? LinearGradient(
                                colors: [
                                    achievement.rarity.color,
                                    achievement.rarity.color.opacity(0.7)
                                ],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                            : LinearGradient(
                                colors: [Color.gray.opacity(0.3), Color.gray.opacity(0.2)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                    )
                    .frame(width: size.dimension, height: size.dimension)
                
                // Border ring
                Circle()
                    .strokeBorder(
                        isUnlocked
                            ? achievement.rarity.color
                            : Color.gray.opacity(0.3),
                        lineWidth: size == .large ? 3 : 2
                    )
                    .frame(width: size.dimension, height: size.dimension)
                
                // Icon
                if isUnlocked || !achievement.secretUntilUnlocked {
                    Image(systemName: isUnlocked ? achievement.icon : "lock.fill")
                        .font(.system(size: size.iconSize, weight: .semibold))
                        .foregroundColor(isUnlocked ? .white : .gray)
                } else {
                    Image(systemName: "questionmark")
                        .font(.system(size: size.iconSize, weight: .semibold))
                        .foregroundColor(.gray)
                }
                
                // Rarity indicator (small dots at bottom)
                if isUnlocked && size != .small {
                    VStack {
                        Spacer()
                        HStack(spacing: 2) {
                            ForEach(0..<rarityDots, id: \.self) { _ in
                                Circle()
                                    .fill(Color.white)
                                    .frame(width: 4, height: 4)
                            }
                        }
                        .padding(.bottom, 8)
                    }
                    .frame(width: size.dimension, height: size.dimension)
                }
            }
            
            // Title (for medium and large)
            if size != .small {
                Text(isUnlocked || !achievement.secretUntilUnlocked ? achievement.title : "???")
                    .font(size.fontSize)
                    .fontWeight(.medium)
                    .foregroundColor(isUnlocked ? .white : .gray)
                    .lineLimit(1)
                    .frame(maxWidth: size.dimension + 20)
            }
        }
    }
    
    private var rarityDots: Int {
        switch achievement.rarity {
        case .common: return 1
        case .rare: return 2
        case .epic: return 3
        case .legendary: return 4
        case .mythic: return 5
        }
    }
}

// MARK: - Achievement Card View

struct AchievementCardView: View {
    let achievement: Achievement
    let isUnlocked: Bool
    let progress: Double
    
    @State private var isExpanded = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 16) {
                AchievementBadgeView(
                    achievement: achievement,
                    isUnlocked: isUnlocked,
                    size: .medium
                )
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text(isUnlocked || !achievement.secretUntilUnlocked ? achievement.title : "Secret Achievement")
                            .font(.headline)
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        if isUnlocked {
                            Text("+\(achievement.xpReward) XP")
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundColor(achievement.rarity.color)
                        }
                    }
                    
                    Text(isUnlocked || !achievement.secretUntilUnlocked ? achievement.description : "Complete hidden requirements to unlock")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    HStack {
                        // Category tag
                        Label(achievement.category.rawValue, systemImage: achievement.category.icon)
                            .font(.caption2)
                            .foregroundColor(achievement.category.color)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(achievement.category.color.opacity(0.2))
                            .cornerRadius(8)
                        
                        // Rarity tag
                        Text(achievement.rarity.rawValue)
                            .font(.caption2)
                            .foregroundColor(achievement.rarity.color)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(achievement.rarity.color.opacity(0.2))
                            .cornerRadius(8)
                    }
                }
            }
            
            // Progress bar (if not unlocked)
            if !isUnlocked && !achievement.secretUntilUnlocked {
                VStack(alignment: .leading, spacing: 4) {
                    GeometryReader { geo in
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 4)
                                .fill(Color.white.opacity(0.1))
                            
                            RoundedRectangle(cornerRadius: 4)
                                .fill(achievement.category.color)
                                .frame(width: geo.size.width * progress)
                        }
                    }
                    .frame(height: 6)
                    
                    Text(achievement.requirement.progressDescription)
                        .font(.caption2)
                        .foregroundColor(.gray)
                }
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white.opacity(0.05))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .strokeBorder(
                            isUnlocked
                                ? achievement.rarity.color.opacity(0.5)
                                : Color.white.opacity(0.1),
                            lineWidth: 1
                        )
                )
        )
    }
}

// MARK: - Achievement Unlock Animation

struct AchievementUnlockView: View {
    let achievement: Achievement
    let onDismiss: () -> Void
    
    @State private var showBadge = false
    @State private var showDetails = false
    @State private var showParticles = false
    @State private var rotation: Double = 0
    
    var body: some View {
        ZStack {
            // Background blur
            Color.black.opacity(0.8)
                .ignoresSafeArea()
                .onTapGesture { onDismiss() }
            
            // Particle effect
            if showParticles {
                ParticleEmitterView(color: achievement.rarity.color)
            }
            
            VStack(spacing: 24) {
                // "Achievement Unlocked" text
                if showDetails {
                    Text("ACHIEVEMENT UNLOCKED")
                        .font(.caption)
                        .fontWeight(.black)
                        .tracking(4)
                        .foregroundColor(achievement.rarity.color)
                        .transition(.move(edge: .top).combined(with: .opacity))
                }
                
                // Badge with glow
                ZStack {
                    // Rotating glow ring
                    Circle()
                        .stroke(
                            AngularGradient(
                                colors: [
                                    achievement.rarity.color,
                                    achievement.rarity.color.opacity(0.5),
                                    .clear,
                                    achievement.rarity.color.opacity(0.5),
                                    achievement.rarity.color
                                ],
                                center: .center
                            ),
                            lineWidth: 4
                        )
                        .frame(width: 160, height: 160)
                        .rotationEffect(.degrees(rotation))
                    
                    AchievementBadgeView(
                        achievement: achievement,
                        isUnlocked: true,
                        size: .large
                    )
                    .scaleEffect(showBadge ? 1.0 : 0.3)
                    .opacity(showBadge ? 1.0 : 0.0)
                }
                
                // Achievement details
                if showDetails {
                    VStack(spacing: 8) {
                        Text(achievement.title)
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Text(achievement.description)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                        
                        HStack(spacing: 16) {
                            Label(achievement.category.rawValue, systemImage: achievement.category.icon)
                                .font(.caption)
                                .foregroundColor(achievement.category.color)
                            
                            Text("•")
                                .foregroundColor(.gray)
                            
                            Text(achievement.rarity.rawValue)
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundColor(achievement.rarity.color)
                        }
                        
                        // XP reward
                        HStack {
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                            Text("+\(achievement.xpReward) XP")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(.yellow)
                        }
                        .padding(.top, 8)
                    }
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                }
                
                // Dismiss button
                if showDetails {
                    Button(action: onDismiss) {
                        Text("Awesome!")
                            .font(.headline)
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(achievement.rarity.color)
                            .cornerRadius(12)
                    }
                    .padding(.horizontal, 40)
                    .padding(.top, 16)
                    .transition(.opacity)
                }
            }
        }
        .onAppear {
            // Animation sequence
            withAnimation(.spring(response: 0.5, dampingFraction: 0.6)) {
                showBadge = true
                showParticles = true
            }
            
            withAnimation(.linear(duration: 10).repeatForever(autoreverses: false)) {
                rotation = 360
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                withAnimation(.easeOut(duration: 0.4)) {
                    showDetails = true
                }
            }
        }
    }
}

// MARK: - Particle Emitter View

struct ParticleEmitterView: View {
    let color: Color
    
    @State private var particles: [Particle] = []
    
    struct Particle: Identifiable {
        let id = UUID()
        var x: CGFloat
        var y: CGFloat
        var scale: CGFloat
        var opacity: Double
        var rotation: Double
    }
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                ForEach(particles) { particle in
                    Image(systemName: "sparkle")
                        .font(.system(size: 20))
                        .foregroundColor(color)
                        .scaleEffect(particle.scale)
                        .opacity(particle.opacity)
                        .rotationEffect(.degrees(particle.rotation))
                        .position(x: particle.x, y: particle.y)
                }
            }
            .onAppear {
                createParticles(in: geo.size)
            }
        }
    }
    
    private func createParticles(in size: CGSize) {
        for _ in 0..<30 {
            let particle = Particle(
                x: size.width / 2,
                y: size.height / 2,
                scale: CGFloat.random(in: 0.5...1.5),
                opacity: 1.0,
                rotation: Double.random(in: 0...360)
            )
            particles.append(particle)
        }
        
        // Animate particles outward
        for i in particles.indices {
            let angle = Double.random(in: 0...(2 * .pi))
            let distance = CGFloat.random(in: 100...300)
            let targetX = size.width / 2 + cos(angle) * distance
            let targetY = size.height / 2 + sin(angle) * distance
            
            withAnimation(.easeOut(duration: Double.random(in: 1.0...2.0))) {
                particles[i].x = targetX
                particles[i].y = targetY
                particles[i].opacity = 0
                particles[i].rotation = Double.random(in: 0...720)
            }
        }
    }
}

// MARK: - Achievements Hub View

struct AchievementsHubView: View {
    @StateObject private var manager = AchievementManager.shared
    @State private var selectedCategory: AchievementCategory?
    @State private var showUnlockAnimation: Achievement?
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Header with level and XP
                levelHeader
                
                // Category filter
                categoryFilter
                
                // Progress overview
                progressOverview
                
                // Achievements grid
                achievementsGrid
            }
            .padding()
        }
        .background(Color.black.ignoresSafeArea())
        .navigationTitle("Achievements")
        .navigationBarTitleDisplayMode(.large)
        .overlay {
            if let achievement = showUnlockAnimation {
                AchievementUnlockView(achievement: achievement) {
                    manager.markAsSeen(achievement.id)
                    showUnlockAnimation = nil
                }
            }
        }
        .onAppear {
            // Check for newly unlocked achievements to show
            if let recent = manager.recentlyUnlocked.first {
                showUnlockAnimation = recent
            }
        }
    }
    
    // MARK: - Level Header
    
    private var levelHeader: some View {
        VStack(spacing: 16) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Level \(manager.currentLevel)")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text("\(manager.totalXP) XP Total")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                // Level badge
                ZStack {
                    Circle()
                        .fill(
                            LinearGradient(
                                colors: [.purple, .blue],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 60, height: 60)
                    
                    Text("\(manager.currentLevel)")
                        .font(.title2)
                        .fontWeight(.black)
                        .foregroundColor(.white)
                }
            }
            
            // XP progress bar
            VStack(alignment: .leading, spacing: 4) {
                GeometryReader { geo in
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 6)
                            .fill(Color.white.opacity(0.1))
                        
                        RoundedRectangle(cornerRadius: 6)
                            .fill(
                                LinearGradient(
                                    colors: [.purple, .blue],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .frame(width: geo.size.width * manager.levelProgress)
                    }
                }
                .frame(height: 12)
                
                Text("\(manager.xpToNextLevel) XP to Level \(manager.currentLevel + 1)")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white.opacity(0.05))
        )
    }
    
    // MARK: - Category Filter
    
    private var categoryFilter: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                // All button
                Button(action: { selectedCategory = nil }) {
                    Text("All")
                        .font(.subheadline)
                        .fontWeight(selectedCategory == nil ? .bold : .medium)
                        .foregroundColor(selectedCategory == nil ? .black : .white)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(
                            selectedCategory == nil
                                ? Color.white
                                : Color.white.opacity(0.1)
                        )
                        .cornerRadius(20)
                }
                
                ForEach(AchievementCategory.allCases, id: \.self) { category in
                    Button(action: { selectedCategory = category }) {
                        Label(category.rawValue, systemImage: category.icon)
                            .font(.subheadline)
                            .fontWeight(selectedCategory == category ? .bold : .medium)
                            .foregroundColor(selectedCategory == category ? .black : category.color)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(
                                selectedCategory == category
                                    ? category.color
                                    : category.color.opacity(0.2)
                            )
                            .cornerRadius(20)
                    }
                }
            }
        }
    }
    
    // MARK: - Progress Overview
    
    private var progressOverview: some View {
        HStack(spacing: 16) {
            // Total unlocked
            VStack(spacing: 4) {
                Text("\(manager.totalUnlocked)")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Text("Unlocked")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity)
            
            Divider()
                .frame(height: 40)
            
            // Total achievements
            VStack(spacing: 4) {
                Text("\(manager.totalAchievements)")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Text("Total")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity)
            
            Divider()
                .frame(height: 40)
            
            // Completion percentage
            VStack(spacing: 4) {
                Text("\(Int(manager.completionPercentage * 100))%")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Text("Complete")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white.opacity(0.05))
        )
    }
    
    // MARK: - Achievements Grid
    
    private var achievementsGrid: some View {
        let achievements = filteredAchievements
        
        return LazyVStack(spacing: 16) {
            ForEach(achievements) { achievement in
                AchievementCardView(
                    achievement: achievement,
                    isUnlocked: manager.unlockedAchievements[achievement.id]?.isUnlocked == true,
                    progress: manager.getProgress(for: achievement)
                )
            }
        }
    }
    
    private var filteredAchievements: [Achievement] {
        if let category = selectedCategory {
            return manager.achievementsByCategory(category)
        }
        return manager.allAchievements
    }
}

// MARK: - Mini Achievement Toast

struct AchievementToastView: View {
    let achievement: Achievement
    @Binding var isShowing: Bool
    
    var body: some View {
        HStack(spacing: 12) {
            AchievementBadgeView(
                achievement: achievement,
                isUnlocked: true,
                size: .small
            )
            
            VStack(alignment: .leading, spacing: 2) {
                Text("Achievement Unlocked!")
                    .font(.caption)
                    .foregroundColor(achievement.rarity.color)
                
                Text(achievement.title)
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
            
            Spacer()
            
            Text("+\(achievement.xpReward)")
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.yellow)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.black.opacity(0.9))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .strokeBorder(achievement.rarity.color, lineWidth: 2)
                )
        )
        .shadow(color: achievement.rarity.color.opacity(0.5), radius: 10)
        .padding(.horizontal)
        .transition(.move(edge: .top).combined(with: .opacity))
        .onTapGesture {
            withAnimation {
                isShowing = false
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                withAnimation {
                    isShowing = false
                }
            }
        }
    }
}

// MARK: - Preview

#Preview {
    NavigationStack {
        AchievementsHubView()
    }
}
