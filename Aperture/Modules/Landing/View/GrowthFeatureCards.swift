// GrowthFeatureCards.swift
// Achievement Hub & Spark a Friend cards for Landing Page
// ☀️ SunFlow: Reignited

import SwiftUI

// MARK: - Achievements Quick Card

struct AchievementsQuickCard: View {
    @StateObject private var achievementManager = AchievementManager.shared
    @State private var showAchievementsHub = false
    @State private var pulseAnimation = false
    
    // Get the most recent unlocked or closest to completion
    private var featuredAchievement: Achievement? {
        // First try to get a recently unlocked one
        if let recentId = achievementManager.recentlyUnlocked.first?.id,
           let achievement = achievementManager.allAchievements.first(where: { $0.id == recentId }) {
            return achievement
        }
        
        // Otherwise get next achievement to unlock
        return achievementManager.allAchievements.first { achievement in
            achievementManager.unlockedAchievements[achievement.id]?.isUnlocked != true
        }
    }
    
    var body: some View {
        Button(action: { showAchievementsHub = true }) {
            HStack(spacing: 16) {
                // Trophy icon with glow
                ZStack {
                    Circle()
                        .fill(
                            RadialGradient(
                                colors: [
                                    Color.yellow.opacity(pulseAnimation ? 0.4 : 0.2),
                                    Color.clear
                                ],
                                center: .center,
                                startRadius: 5,
                                endRadius: pulseAnimation ? 35 : 25
                            )
                        )
                        .frame(width: 60, height: 60)
                    
                    ZStack {
                        Circle()
                            .fill(
                                LinearGradient(
                                    colors: [.yellow, .orange],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .frame(width: 44, height: 44)
                        
                        Image(systemName: "trophy.fill")
                            .font(.system(size: 20))
                            .foregroundColor(.black)
                    }
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Achievements")
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    HStack(spacing: 8) {
                        // Progress
                        Text("\(achievementManager.totalUnlocked)/\(achievementManager.totalAchievements)")
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .foregroundColor(.yellow)
                        
                        Text("•")
                            .foregroundColor(.gray)
                        
                        // Level
                        Text("Level \(achievementManager.currentLevel)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    
                    // Progress bar
                    GeometryReader { geo in
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 3)
                                .fill(Color.white.opacity(0.1))
                            
                            RoundedRectangle(cornerRadius: 3)
                                .fill(
                                    LinearGradient(
                                        colors: [.yellow, .orange],
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                )
                                .frame(width: geo.size.width * achievementManager.levelProgress)
                        }
                    }
                    .frame(height: 6)
                }
                
                Spacer()
                
                // XP badge
                VStack(spacing: 2) {
                    Text("\(achievementManager.totalXP)")
                        .font(.system(size: 16, weight: .bold, design: .rounded))
                        .foregroundColor(.yellow)
                    
                    Text("XP")
                        .font(.caption2)
                        .foregroundColor(.gray)
                }
                
                Image(systemName: "chevron.right")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.white.opacity(0.5))
            }
            .padding(16)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.white.opacity(0.05))
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(
                                LinearGradient(
                                    colors: [
                                        Color.yellow.opacity(0.3),
                                        Color.orange.opacity(0.1)
                                    ],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                ),
                                lineWidth: 1
                            )
                    )
            )
        }
        .buttonStyle(ScaleButtonStyle())
        .fullScreenCover(isPresented: $showAchievementsHub) {
            NavigationStack {
                AchievementsHubView()
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Done") { showAchievementsHub = false }
                        }
                    }
            }
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 2).repeatForever(autoreverses: true)) {
                pulseAnimation = true
            }
        }
    }
}

// MARK: - Spark a Friend Quick Card

struct SparkAFriendQuickCard: View {
    @StateObject private var sparkManager = SparkManager.shared
    @State private var showSparkView = false
    @State private var waveAnimation = false
    
    var body: some View {
        Button(action: { showSparkView = true }) {
            HStack(spacing: 16) {
                // Animated icon
                ZStack {
                    // Wave effect
                    ForEach(0..<3, id: \.self) { index in
                        Circle()
                            .stroke(Color.orange.opacity(0.3 - Double(index) * 0.1), lineWidth: 2)
                            .frame(
                                width: waveAnimation ? CGFloat(60 + index * 20) : CGFloat(44 + index * 10),
                                height: waveAnimation ? CGFloat(60 + index * 20) : CGFloat(44 + index * 10)
                            )
                            .opacity(waveAnimation ? 0 : 1)
                    }
                    
                    ZStack {
                        Circle()
                            .fill(
                                LinearGradient(
                                    colors: [.orange, .red],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .frame(width: 44, height: 44)
                        
                        Image(systemName: "person.2.wave.2.fill")
                            .font(.system(size: 18))
                            .foregroundColor(.white)
                    }
                }
                .frame(width: 60, height: 60)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Spark a Friend")
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    Text("Help others awaken")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    // Stats
                    if sparkManager.stats.friendsJoined > 0 {
                        HStack(spacing: 4) {
                            Image(systemName: "checkmark.circle.fill")
                                .font(.caption)
                                .foregroundColor(.green)
                            
                            Text("\(sparkManager.stats.friendsJoined) friend\(sparkManager.stats.friendsJoined == 1 ? "" : "s") awakened")
                                .font(.caption)
                                .foregroundColor(.green)
                        }
                    }
                }
                
                Spacer()
                
                // Share icon
                ZStack {
                    Circle()
                        .fill(Color.orange.opacity(0.2))
                        .frame(width: 36, height: 36)
                    
                    Image(systemName: "paperplane.fill")
                        .font(.system(size: 14))
                        .foregroundColor(.orange)
                }
                
                Image(systemName: "chevron.right")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.white.opacity(0.5))
            }
            .padding(16)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.white.opacity(0.05))
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(
                                LinearGradient(
                                    colors: [
                                        Color.orange.opacity(0.3),
                                        Color.red.opacity(0.1)
                                    ],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                ),
                                lineWidth: 1
                            )
                    )
            )
        }
        .buttonStyle(ScaleButtonStyle())
        .fullScreenCover(isPresented: $showSparkView) {
            NavigationStack {
                SparkAFriendView()
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Done") { showSparkView = false }
                        }
                    }
            }
        }
        .onAppear {
            withAnimation(.easeOut(duration: 1.5).repeatForever(autoreverses: false)) {
                waveAnimation = true
            }
        }
    }
}

// MARK: - Combined Growth Section

struct GrowthFeaturesSection: View {
    var body: some View {
        VStack(spacing: 12) {
            // Section header
            HStack {
                Text("Your Journey")
                    .font(.headline)
                    .foregroundColor(.white)
                
                Spacer()
            }
            
            AchievementsQuickCard()
            
            SparkAFriendQuickCard()
        }
    }
}

// MARK: - Inline Achievement Notification

struct InlineAchievementNotification: View {
    let achievement: Achievement
    @Binding var isShowing: Bool
    
    @State private var appear = false
    
    var body: some View {
        if isShowing {
            HStack(spacing: 12) {
                ZStack {
                    Circle()
                        .fill(achievement.rarity.color)
                        .frame(width: 36, height: 36)
                    
                    Image(systemName: achievement.icon)
                        .font(.system(size: 16))
                        .foregroundColor(.white)
                }
                
                VStack(alignment: .leading, spacing: 2) {
                    Text("Achievement Unlocked!")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(achievement.rarity.color)
                    
                    Text(achievement.title)
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                
                Spacer()
                
                Text("+\(achievement.xpReward) XP")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(.yellow)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.black.opacity(0.95))
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(achievement.rarity.color, lineWidth: 2)
                    )
            )
            .shadow(color: achievement.rarity.color.opacity(0.4), radius: 10)
            .padding(.horizontal)
            .offset(y: appear ? 0 : -100)
            .opacity(appear ? 1 : 0)
            .onAppear {
                withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                    appear = true
                }
                
                // Auto dismiss after 4 seconds
                DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                    withAnimation(.easeOut) {
                        appear = false
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        isShowing = false
                    }
                }
            }
            .onTapGesture {
                withAnimation(.easeOut) {
                    appear = false
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    isShowing = false
                }
            }
        }
    }
}

// MARK: - Level Up Celebration View

struct LevelUpCelebrationView: View {
    let newLevel: Int
    let onDismiss: () -> Void
    
    @State private var showContent = false
    @State private var showParticles = false
    @State private var ringRotation: Double = 0
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.9)
                .ignoresSafeArea()
                .onTapGesture { onDismiss() }
            
            // Particles
            if showParticles {
                LevelUpParticles()
            }
            
            VStack(spacing: 24) {
                // Level badge
                ZStack {
                    // Rotating ring
                    Circle()
                        .stroke(
                            AngularGradient(
                                colors: [.purple, .blue, .cyan, .purple],
                                center: .center
                            ),
                            lineWidth: 4
                        )
                        .frame(width: 140, height: 140)
                        .rotationEffect(.degrees(ringRotation))
                    
                    // Inner badge
                    ZStack {
                        Circle()
                            .fill(
                                LinearGradient(
                                    colors: [.purple, .blue],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .frame(width: 100, height: 100)
                        
                        VStack(spacing: 0) {
                            Text("LVL")
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundColor(.white.opacity(0.7))
                            
                            Text("\(newLevel)")
                                .font(.system(size: 40, weight: .black, design: .rounded))
                                .foregroundColor(.white)
                        }
                    }
                    .scaleEffect(showContent ? 1 : 0.5)
                    .opacity(showContent ? 1 : 0)
                }
                
                if showContent {
                    VStack(spacing: 8) {
                        Text("LEVEL UP!")
                            .font(.title)
                            .fontWeight(.black)
                            .tracking(4)
                            .foregroundStyle(
                                LinearGradient(
                                    colors: [.purple, .cyan],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                        
                        Text("You've reached Level \(newLevel)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                        Text("Keep awakening! 🔥")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.top, 8)
                    }
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                    
                    Button(action: onDismiss) {
                        Text("Continue")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(
                                LinearGradient(
                                    colors: [.purple, .blue],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .cornerRadius(12)
                    }
                    .padding(.horizontal, 40)
                    .padding(.top, 16)
                }
            }
        }
        .onAppear {
            withAnimation(.linear(duration: 8).repeatForever(autoreverses: false)) {
                ringRotation = 360
            }
            
            withAnimation(.spring(response: 0.6, dampingFraction: 0.7)) {
                showContent = true
                showParticles = true
            }
        }
    }
}

// MARK: - Level Up Particles

struct LevelUpParticles: View {
    @State private var particles: [LevelParticle] = []
    
    struct LevelParticle: Identifiable {
        let id = UUID()
        var x: CGFloat
        var y: CGFloat
        var scale: CGFloat
        var opacity: Double
        let color: Color
    }
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                ForEach(particles) { particle in
                    Image(systemName: "star.fill")
                        .font(.system(size: 16))
                        .foregroundColor(particle.color)
                        .scaleEffect(particle.scale)
                        .opacity(particle.opacity)
                        .position(x: particle.x, y: particle.y)
                }
            }
            .onAppear {
                createParticles(in: geo.size)
            }
        }
    }
    
    private func createParticles(in size: CGSize) {
        let colors: [Color] = [.purple, .blue, .cyan, .yellow, .pink]
        
        for _ in 0..<40 {
            let particle = LevelParticle(
                x: size.width / 2,
                y: size.height / 2,
                scale: CGFloat.random(in: 0.5...1.5),
                opacity: 1.0,
                color: colors.randomElement()!
            )
            particles.append(particle)
        }
        
        // Animate outward
        for i in particles.indices {
            let angle = Double.random(in: 0...(2 * .pi))
            let distance = CGFloat.random(in: 150...400)
            let targetX = size.width / 2 + cos(angle) * distance
            let targetY = size.height / 2 + sin(angle) * distance
            
            withAnimation(.easeOut(duration: Double.random(in: 1.5...3.0))) {
                particles[i].x = targetX
                particles[i].y = targetY
                particles[i].opacity = 0
                particles[i].scale = CGFloat.random(in: 0.1...0.5)
            }
        }
    }
}

// Note: ScaleButtonStyle is defined in Core/Components/Buttons/ScaleButtonStyle.swift

// MARK: - Previews

#Preview("Achievements Card") {
    ZStack {
        Color.black.ignoresSafeArea()
        AchievementsQuickCard()
            .padding()
    }
}

#Preview("Spark Card") {
    ZStack {
        Color.black.ignoresSafeArea()
        SparkAFriendQuickCard()
            .padding()
    }
}

#Preview("Growth Section") {
    ZStack {
        Color.black.ignoresSafeArea()
        GrowthFeaturesSection()
            .padding()
    }
}
