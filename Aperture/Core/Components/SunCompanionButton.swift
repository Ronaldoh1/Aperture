// SunCompanionButton.swift
// The living sun presence — acknowledges the user, tracks streaks, radiates warmth.
// Replaces the static sacred geometry bubble with an interactive companion.
// ☀️ SunFlow: Reignited

import SwiftUI

// MARK: - ═══════════════════════════════════════════════════
// SUN COMPANION BUTTON — Floating golden presence
// ═══════════════════════════════════════════════════════════

struct SunCompanionButton: View {
    
    @StateObject private var companion = SunCompanionManager.shared
    @State private var isRadiating = false
    @State private var showAffirmation = false
    @State private var pulseScale: CGFloat = 1.0
    @State private var rotationAngle: Double = 0
    @State private var glowOpacity: Double = 0.4
    @State private var screenGlow = false
    
    private let size: CGFloat = 62
    
    var body: some View {
        ZStack {
            // Screen-wide radiance when tapped
            if screenGlow {
                RadialGradient(
                    colors: [
                        Color(red: 1.0, green: 0.85, blue: 0.3).opacity(0.15),
                        Color(red: 1.0, green: 0.7, blue: 0.2).opacity(0.05),
                        Color.clear
                    ],
                    center: .bottomTrailing,
                    startRadius: 30,
                    endRadius: 400
                )
                .ignoresSafeArea()
                .allowsHitTesting(false)
                .transition(.opacity)
            }
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    
                    VStack(spacing: 8) {
                        // Affirmation bubble
                        if showAffirmation {
                            affirmationBubble
                                .transition(.asymmetric(
                                    insertion: .scale(scale: 0.5).combined(with: .opacity),
                                    removal: .opacity
                                ))
                        }
                        
                        // The Sun Button
                        sunButton
                    }
                    .padding(.trailing, 20)
                    .padding(.bottom, 90) // Above tab bar
                }
            }
        }
    }
    
    // MARK: - Sun Button
    
    private var sunButton: some View {
        Button {
            tapSun()
        } label: {
            ZStack {
                // Outer glow rings
                ForEach(0..<3, id: \.self) { ring in
                    Circle()
                        .stroke(
                            Color(red: 1.0, green: 0.85, blue: 0.3).opacity(glowOpacity * (0.3 - Double(ring) * 0.08)),
                            lineWidth: 1.5
                        )
                        .frame(width: size + CGFloat(ring) * 14, height: size + CGFloat(ring) * 14)
                        .scaleEffect(isRadiating ? 1.3 : 1.0)
                }
                
                // Core gradient circle
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [
                                Color(red: 1.0, green: 0.95, blue: 0.6),
                                Color(red: 1.0, green: 0.85, blue: 0.3),
                                Color(red: 0.95, green: 0.7, blue: 0.1),
                                Color(red: 0.85, green: 0.55, blue: 0.05)
                            ],
                            center: .center,
                            startRadius: 2,
                            endRadius: size / 2
                        )
                    )
                    .frame(width: size, height: size)
                    .shadow(color: Color(red: 1.0, green: 0.85, blue: 0.3).opacity(0.6), radius: 15, x: 0, y: 0)
                    .shadow(color: Color(red: 1.0, green: 0.7, blue: 0.2).opacity(0.3), radius: 25, x: 0, y: 0)
                
                // Inner sacred geometry (Seed of Life simplified)
                SunSacredGeometryIcon()
                    .frame(width: size * 0.55, height: size * 0.55)
                    .rotationEffect(.degrees(rotationAngle))
                
                // Streak badge
                if companion.currentStreak > 0 {
                    Text("\(companion.currentStreak)")
                        .font(.system(size: 9, weight: .black, design: .rounded))
                        .foregroundColor(.black)
                        .padding(.horizontal, 5)
                        .padding(.vertical, 2)
                        .background(Capsule().fill(Color.white))
                        .offset(x: size / 2.5, y: -size / 2.5)
                }
            }
            .scaleEffect(pulseScale)
        }
        .buttonStyle(.plain)
        .onAppear {
            startAmbientAnimation()
        }
    }
    
    // MARK: - Affirmation Bubble
    
    private var affirmationBubble: some View {
        VStack(alignment: .trailing, spacing: 4) {
            Text(companion.currentAffirmation)
                .font(.system(size: 12, weight: .medium))
                .foregroundColor(.white.opacity(0.9))
                .multilineTextAlignment(.trailing)
                .fixedSize(horizontal: false, vertical: true)
            
            if let buddyName = companion.buddyName {
                Text("— \(buddyName)")
                    .font(.system(size: 10, weight: .bold))
                    .foregroundColor(Color(red: 1.0, green: 0.85, blue: 0.3).opacity(0.7))
            }
        }
        .padding(.horizontal, 14)
        .padding(.vertical, 10)
        .frame(maxWidth: 220)
        .background(
            RoundedRectangle(cornerRadius: 14)
                .fill(Color(hex: "#1a1a2e").opacity(0.95))
                .overlay(
                    RoundedRectangle(cornerRadius: 14)
                        .stroke(Color(red: 1.0, green: 0.85, blue: 0.3).opacity(0.3), lineWidth: 1)
                )
        )
        .shadow(color: Color(red: 1.0, green: 0.85, blue: 0.3).opacity(0.2), radius: 10)
    }
    
    // MARK: - Actions
    
    private func tapSun() {
        HapticManager.shared.medium()
        
        companion.recordInteraction()
        
        withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
            pulseScale = 1.2
            isRadiating = true
            screenGlow = true
        }
        
        withAnimation(.spring(response: 0.4, dampingFraction: 0.7).delay(0.1)) {
            showAffirmation = true
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                pulseScale = 1.0
                isRadiating = false
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
            withAnimation(.easeOut(duration: 0.5)) {
                showAffirmation = false
                screenGlow = false
            }
        }
    }
    
    private func startAmbientAnimation() {
        withAnimation(.linear(duration: 30).repeatForever(autoreverses: false)) {
            rotationAngle = 360
        }
        withAnimation(.easeInOut(duration: 3).repeatForever(autoreverses: true)) {
            glowOpacity = 0.6
        }
    }
}

// MARK: - ═══════════════════════════════════════════════════
// SUN SACRED GEOMETRY ICON
// ═══════════════════════════════════════════════════════════

struct SunSacredGeometryIcon: View {
    var body: some View {
        Canvas { context, size in
            let center = CGPoint(x: size.width / 2, y: size.height / 2)
            let r: CGFloat = min(size.width, size.height) * 0.35
            
            // 6 overlapping circles (Seed of Life)
            for i in 0..<6 {
                let angle: CGFloat = CGFloat(i) * .pi / 3.0
                let cx = center.x + r * cos(angle)
                let cy = center.y + r * sin(angle)
                let circle = Path(ellipseIn: CGRect(x: cx - r, y: cy - r, width: r * 2, height: r * 2))
                context.stroke(circle, with: .color(.black.opacity(0.5)), lineWidth: 1)
            }
            
            // Center circle
            let centerCircle = Path(ellipseIn: CGRect(x: center.x - r, y: center.y - r, width: r * 2, height: r * 2))
            context.stroke(centerCircle, with: .color(.black.opacity(0.5)), lineWidth: 1)
        }
    }
}

// MARK: - ═══════════════════════════════════════════════════
// SUN COMPANION MANAGER — State & Affirmations
// ═══════════════════════════════════════════════════════════

@MainActor
final class SunCompanionManager: ObservableObject {
    
    static let shared = SunCompanionManager()
    
    @Published var currentAffirmation: String = ""
    @Published var buddyName: String? = nil
    @Published var currentStreak: Int = 0
    @Published var totalInteractions: Int = 0
    
    private let defaults = UserDefaults.standard
    
    private init() {
        loadState()
        currentAffirmation = contextualAffirmation()
    }
    
    // MARK: - Buddy Naming
    
    func setBuddyName(_ name: String) {
        buddyName = name
        defaults.set(name, forKey: "sun_companion_buddy_name")
    }
    
    var hasBuddyName: Bool { buddyName != nil }
    
    // MARK: - Interactions
    
    func recordInteraction() {
        totalInteractions += 1
        defaults.set(totalInteractions, forKey: "sun_companion_interactions")
        
        // Update streak
        let today = Calendar.current.startOfDay(for: Date())
        let lastDate = defaults.object(forKey: "sun_companion_last_date") as? Date
        
        if let last = lastDate {
            let lastDay = Calendar.current.startOfDay(for: last)
            let diff = Calendar.current.dateComponents([.day], from: lastDay, to: today).day ?? 0
            if diff == 1 {
                currentStreak += 1
            } else if diff > 1 {
                currentStreak = 1
            }
        } else {
            currentStreak = 1
        }
        
        defaults.set(today, forKey: "sun_companion_last_date")
        defaults.set(currentStreak, forKey: "sun_companion_streak")
        
        currentAffirmation = contextualAffirmation()
    }
    
    // MARK: - Contextual Affirmations
    
    func contextualAffirmation() -> String {
        let hour = Calendar.current.component(.hour, from: Date())
        
        // Time-aware greetings
        if hour < 6 {
            return lateNight.randomElement()!
        } else if hour < 12 {
            return morning.randomElement()!
        } else if hour < 17 {
            return afternoon.randomElement()!
        } else if hour < 21 {
            return evening.randomElement()!
        } else {
            return lateNight.randomElement()!
        }
    }
    
    private let morning = [
        "You showed up today. That matters more than you think.",
        "Morning light hits different when you're awake inside too.",
        "New day, new patterns to recognize. I'm here.",
        "The fact that you're here before noon? That's discipline becoming instinct.",
        "Good morning. Your awareness is already sharper than yesterday.",
    ]
    
    private let afternoon = [
        "Still here. Still growing. That's not nothing — that's everything.",
        "Most people scroll through lunch. You're building something real.",
        "Halfway through the day and you chose consciousness. Respect.",
        "Your future self is going to look back at this moment with gratitude.",
        "The matrix gets louder in the afternoon. You're choosing signal over noise.",
    ]
    
    private let evening = [
        "You made it through another day of seeing clearly. That takes courage.",
        "Evening is when the programming tries to creep back in. Stay aware.",
        "Winding down doesn't mean turning off. Your awareness is always on.",
        "I've been tracking your journey. You're further than you think.",
        "Tomorrow you'll be even sharper. Tonight, rest knowing you showed up.",
    ]
    
    private let lateNight = [
        "Can't sleep? Your mind is processing what it's learning. That's growth.",
        "The quiet hours are when the deepest downloads happen.",
        "Late night seekers find what daytime scrollers miss.",
        "You're up late because something inside you won't settle for the old story.",
        "Rest when you can. The awakening doesn't require exhaustion.",
    ]
    
    // MARK: - Persistence
    
    private func loadState() {
        buddyName = defaults.string(forKey: "sun_companion_buddy_name")
        currentStreak = defaults.integer(forKey: "sun_companion_streak")
        totalInteractions = defaults.integer(forKey: "sun_companion_interactions")
        
        // Check if streak is still valid
        if let lastDate = defaults.object(forKey: "sun_companion_last_date") as? Date {
            let today = Calendar.current.startOfDay(for: Date())
            let lastDay = Calendar.current.startOfDay(for: lastDate)
            let diff = Calendar.current.dateComponents([.day], from: lastDay, to: today).day ?? 0
            if diff > 1 { currentStreak = 0 }
        }
    }
}

// MARK: - ═══════════════════════════════════════════════════
// VIEW MODIFIER — Replace old bubble with sun companion
// ═══════════════════════════════════════════════════════════

struct SunCompanionOverlay: ViewModifier {
    func body(content: Content) -> some View {
        ZStack {
            content
            SunCompanionButton()
        }
    }
}

extension View {
    func withSunCompanion() -> some View {
        modifier(SunCompanionOverlay())
    }
}
