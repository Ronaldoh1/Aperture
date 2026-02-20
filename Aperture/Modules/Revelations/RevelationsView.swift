// RevelationsView.swift
// The Revelations section — exposing the apps that track you most,
// behavioral exploitation patterns, and cross-linking to courses.
// ☀️ SunFlow: Reignited

import SwiftUI

// MARK: - ═══════════════════════════════════════════════════
// REVELATIONS HUB
// ═══════════════════════════════════════════════════════════

struct RevelationsView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var selectedRevelation: RevelationType?
    @State private var showSubscriptionAudit = false
    
    var body: some View {
        ZStack {
            Color(hex: "#0a0a0f").ignoresSafeArea()
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    headerSection
                    
                    // Revelation cards
                    ForEach(RevelationType.allCases) { rev in
                        Button { selectedRevelation = rev } label: {
                            revelationCard(rev)
                        }
                        .buttonStyle(.plain)
                    }
                    
                    // Cross-link to courses
                    crossLinkSection
                    
                    Spacer(minLength: 100)
                }
                .padding(.horizontal, 16)
                .padding(.top, 16)
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
                Text("Revelations").font(.system(size: 17, weight: .bold)).foregroundColor(.white)
            }
        }
        .toolbarBackground(Color(hex: "#0a0a0f"), for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .sheet(item: $selectedRevelation) { rev in
            revelationDetailView(for: rev)
        }
    }
    
    private var headerSection: some View {
        VStack(spacing: 10) {
            Text("🔮").font(.system(size: 50))
            Text("REVELATIONS")
                .font(.system(size: 26, weight: .black)).tracking(3).foregroundColor(Color(hex: "#E74C3C"))
            Text("The time of seeing clearly.\nWhat's been hidden in plain sight.")
                .font(.system(size: 13, weight: .medium)).foregroundColor(.white.opacity(0.4))
                .multilineTextAlignment(.center)
        }
    }
    
    private func revelationCard(_ rev: RevelationType) -> some View {
        HStack(spacing: 14) {
            Text(rev.emoji).font(.system(size: 32))
            
            VStack(alignment: .leading, spacing: 4) {
                Text(rev.title).font(.system(size: 15, weight: .bold)).foregroundColor(.white)
                Text(rev.subtitle).font(.system(size: 11, weight: .medium)).foregroundColor(.white.opacity(0.35)).lineLimit(2)
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .font(.system(size: 12, weight: .bold))
                .foregroundColor(rev.accentColor.opacity(0.5))
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 14)
                .fill(rev.accentColor.opacity(0.04))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 14)
                .stroke(rev.accentColor.opacity(0.15), lineWidth: 1)
        )
    }
    
    private var crossLinkSection: some View {
        VStack(spacing: 12) {
            Text("GO DEEPER").font(.system(size: 9, weight: .black)).tracking(1.5).foregroundColor(.white.opacity(0.2))
            
            NavigationLink {
                ConsumerPsyopsCourseView()
            } label: {
                crossLinkRow(emoji: "🧠", title: "Consumer Psyops Course", subtitle: "Learn the manipulation tactics", color: Color(hex: "#F39C12"))
            }
            
            NavigationLink {
                ConsumerPsyopsCourseView(isSubscriptionCourse: true)
            } label: {
                crossLinkRow(emoji: "💳", title: "Subscription Awakening", subtitle: "Cable was probably cheaper", color: Color(hex: "#E74C3C"))
            }
        }
    }
    
    private func crossLinkRow(emoji: String, title: String, subtitle: String, color: Color) -> some View {
        HStack(spacing: 12) {
            Text(emoji).font(.system(size: 22))
            VStack(alignment: .leading, spacing: 2) {
                Text(title).font(.system(size: 13, weight: .bold)).foregroundColor(color)
                Text(subtitle).font(.system(size: 10, weight: .medium)).foregroundColor(.white.opacity(0.3))
            }
            Spacer()
            Image(systemName: "arrow.right").font(.system(size: 11, weight: .bold)).foregroundColor(color.opacity(0.5))
        }
        .padding(12).background(RoundedRectangle(cornerRadius: 10).fill(color.opacity(0.04)))
    }
    
    @ViewBuilder
    private func revelationDetailView(for rev: RevelationType) -> some View {
        switch rev {
        case .appTracking: AppTrackingExposeView()
        case .subscriptionTrap: SubscriptionRevelationView()
        case .behavioralExploitation: BehavioralExploitationView()
        case .dataHarvesting: DataHarvestingView()
        }
    }
}

// MARK: - ═══════════════════════════════════════════════════
// REVELATION TYPES
// ═══════════════════════════════════════════════════════════

enum RevelationType: String, CaseIterable, Identifiable {
    case appTracking
    case subscriptionTrap
    case behavioralExploitation
    case dataHarvesting
    
    var id: String { rawValue }
    
    var title: String {
        switch self {
        case .appTracking: return "App Tracking Exposé"
        case .subscriptionTrap: return "The Subscription Revelation"
        case .behavioralExploitation: return "Behavioral Exploitation"
        case .dataHarvesting: return "Data Harvesting"
        }
    }
    
    var subtitle: String {
        switch self {
        case .appTracking: return "The apps stealing the most time and data from your life"
        case .subscriptionTrap: return "How much you're really paying and what they're really selling"
        case .behavioralExploitation: return "How apps use psychology to keep you coming back"
        case .dataHarvesting: return "What they know about you and who they sell it to"
        }
    }
    
    var emoji: String {
        switch self {
        case .appTracking: return "📡"
        case .subscriptionTrap: return "💳"
        case .behavioralExploitation: return "🧠"
        case .dataHarvesting: return "🕸️"
        }
    }
    
    var accentColor: Color {
        switch self {
        case .appTracking: return .red
        case .subscriptionTrap: return Color(hex: "#E74C3C")
        case .behavioralExploitation: return Color(hex: "#F39C12")
        case .dataHarvesting: return .purple
        }
    }
}

// MARK: - ═══════════════════════════════════════════════════
// APP TRACKING EXPOSÉ
// ═══════════════════════════════════════════════════════════

struct AppTrackingExposeView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(hex: "#0a0a0f").ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 16) {
                        Text("These apps are designed to consume your life.\nHere's how much they take.")
                            .font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.4))
                            .multilineTextAlignment(.center).padding(.top, 10)
                        
                        ForEach(AppTrackingData.worstOffenders) { app in
                            appExposureCard(app)
                        }
                        
                        sourceNote
                        Spacer(minLength: 60)
                    }
                    .padding(.horizontal, 16)
                }
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) { Text("App Tracking Exposé").font(.system(size: 16, weight: .bold)).foregroundColor(.white) }
                ToolbarItem(placement: .navigationBarTrailing) { Button("Done") { dismiss() }.foregroundColor(.red) }
            }
            .toolbarBackground(Color(hex: "#0a0a0f"), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
    
    private func appExposureCard(_ app: TrackedApp) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 10) {
                Text(app.emoji).font(.system(size: 28))
                VStack(alignment: .leading, spacing: 2) {
                    Text(app.name).font(.system(size: 16, weight: .black)).foregroundColor(.white)
                    Text(app.company).font(.system(size: 10, weight: .medium)).foregroundColor(.white.opacity(0.3))
                }
                Spacer()
                dangerBadge(app.dangerLevel)
            }
            
            // Stats
            HStack(spacing: 12) {
                statPill("Avg Time", app.avgDailyMinutes, color: .red)
                statPill("Trackers", "\(app.trackersCount)", color: .orange)
                statPill("Data Points", app.dataPointsCollected, color: .purple)
            }
            
            Text(app.exposureText)
                .font(.system(size: 11, weight: .medium))
                .foregroundColor(.white.opacity(0.5))
                .lineSpacing(3)
            
            // What they track
            VStack(alignment: .leading, spacing: 4) {
                Text("WHAT THEY TRACK:").font(.system(size: 8, weight: .black)).tracking(1).foregroundColor(.white.opacity(0.2))
                Text(app.trackedData.joined(separator: " · "))
                    .font(.system(size: 10, weight: .medium)).foregroundColor(.red.opacity(0.6))
            }
        }
        .padding(14)
        .background(RoundedRectangle(cornerRadius: 14).fill(Color.red.opacity(0.03)))
        .overlay(RoundedRectangle(cornerRadius: 14).stroke(Color.red.opacity(0.1), lineWidth: 1))
    }
    
    private func statPill(_ label: String, _ value: String, color: Color) -> some View {
        VStack(spacing: 2) {
            Text(value).font(.system(size: 12, weight: .black, design: .rounded)).foregroundColor(color)
            Text(label).font(.system(size: 7, weight: .bold)).foregroundColor(.white.opacity(0.2))
        }
        .frame(maxWidth: .infinity).padding(6)
        .background(RoundedRectangle(cornerRadius: 6).fill(color.opacity(0.06)))
    }
    
    private func dangerBadge(_ level: Int) -> some View {
        HStack(spacing: 2) {
            ForEach(0..<5, id: \.self) { i in
                Circle().fill(i < level ? Color.red : Color.white.opacity(0.1)).frame(width: 6, height: 6)
            }
        }
    }
    
    private var sourceNote: some View {
        Text("Data compiled from Apple App Privacy Labels, Exodus Privacy reports, and independent security audits. Time estimates from DataReportal and Statista 2024-2025 reports.")
            .font(.system(size: 9, weight: .medium)).foregroundColor(.white.opacity(0.15))
            .padding(.horizontal, 10).padding(.top, 10)
    }
}

// MARK: - ═══════════════════════════════════════════════════
// SUBSCRIPTION REVELATION VIEW
// ═══════════════════════════════════════════════════════════

struct SubscriptionRevelationView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var selectedSubs: Set<String> = []
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(hex: "#0a0a0f").ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 16) {
                        Text("Tap the subscriptions you pay for.\nWatch the total climb.")
                            .font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.4))
                            .multilineTextAlignment(.center).padding(.top, 10)
                        
                        // Running total
                        let monthlyTotal = SubscriptionData.commonSubs.filter { selectedSubs.contains($0.id) }.reduce(0.0) { $0 + $1.monthlyPrice }
                        let yearlyTotal = monthlyTotal * 12
                        
                        VStack(spacing: 4) {
                            Text("$\(String(format: "%.2f", monthlyTotal))/mo")
                                .font(.system(size: 32, weight: .black, design: .rounded))
                                .foregroundColor(monthlyTotal > 100 ? .red : monthlyTotal > 50 ? Color(hex: "#F39C12") : .green)
                            Text("$\(String(format: "%.0f", yearlyTotal))/year")
                                .font(.system(size: 14, weight: .bold))
                                .foregroundColor(.white.opacity(0.4))
                            if yearlyTotal > 1000 {
                                Text("That's $\(String(format: "%.0f", yearlyTotal * 10)) over 10 years. Before inflation.")
                                    .font(.system(size: 10, weight: .bold)).foregroundColor(.red.opacity(0.7))
                            }
                        }
                        .padding(16).background(RoundedRectangle(cornerRadius: 14).fill(Color.white.opacity(0.03)))
                        
                        // Subscription grid
                        ForEach(SubscriptionData.categories, id: \.name) { category in
                            VStack(alignment: .leading, spacing: 8) {
                                Text(category.name.uppercased()).font(.system(size: 9, weight: .black)).tracking(1).foregroundColor(.white.opacity(0.2))
                                ForEach(category.subs) { sub in
                                    subscriptionRow(sub)
                                }
                            }
                        }
                        
                        // Cable comparison
                        if monthlyTotal > 50 {
                            VStack(spacing: 8) {
                                Text("📺 REALITY CHECK").font(.system(size: 9, weight: .black)).tracking(1).foregroundColor(.red.opacity(0.5))
                                Text("Cable TV with 200+ channels was ~$89.99/month")
                                    .font(.system(size: 12, weight: .bold)).foregroundColor(.white.opacity(0.5))
                                Text("You're paying $\(String(format: "%.2f", monthlyTotal))/month for fragmented streaming")
                                    .font(.system(size: 12, weight: .bold)).foregroundColor(.red)
                                if monthlyTotal > 89.99 {
                                    Text("Cable was literally cheaper. 💀")
                                        .font(.system(size: 14, weight: .black)).foregroundColor(Color(hex: "#E74C3C"))
                                }
                            }
                            .padding(16).background(RoundedRectangle(cornerRadius: 14).fill(Color.red.opacity(0.04)))
                        }
                        
                        // Link to course
                        NavigationLink {
                            ConsumerPsyopsCourseView(isSubscriptionCourse: true)
                        } label: {
                            HStack {
                                Text("📚").font(.system(size: 18))
                                Text("Take the Subscription Awakening Course")
                                    .font(.system(size: 13, weight: .bold)).foregroundColor(Color(hex: "#E74C3C"))
                                Spacer()
                                Image(systemName: "arrow.right").foregroundColor(Color(hex: "#E74C3C").opacity(0.5))
                            }
                            .padding(12).background(RoundedRectangle(cornerRadius: 10).fill(Color(hex: "#E74C3C").opacity(0.06)))
                        }
                        
                        Spacer(minLength: 60)
                    }
                    .padding(.horizontal, 16)
                }
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) { Text("Subscription Revelation").font(.system(size: 16, weight: .bold)).foregroundColor(.white) }
                ToolbarItem(placement: .navigationBarTrailing) { Button("Done") { dismiss() }.foregroundColor(.red) }
            }
            .toolbarBackground(Color(hex: "#0a0a0f"), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
    
    private func subscriptionRow(_ sub: SubscriptionItem) -> some View {
        let isSelected = selectedSubs.contains(sub.id)
        return Button {
            if isSelected { selectedSubs.remove(sub.id) } else { selectedSubs.insert(sub.id) }
        } label: {
            HStack(spacing: 10) {
                Image(systemName: isSelected ? "checkmark.circle.fill" : "circle")
                    .font(.system(size: 18)).foregroundColor(isSelected ? Color(hex: "#E74C3C") : .white.opacity(0.15))
                Text(sub.emoji).font(.system(size: 16))
                Text(sub.name).font(.system(size: 13, weight: .medium)).foregroundColor(.white)
                Spacer()
                Text("$\(String(format: "%.2f", sub.monthlyPrice))/mo")
                    .font(.system(size: 12, weight: .bold, design: .rounded))
                    .foregroundColor(isSelected ? Color(hex: "#E74C3C") : .white.opacity(0.3))
            }
            .padding(10).background(RoundedRectangle(cornerRadius: 8).fill(isSelected ? Color(hex: "#E74C3C").opacity(0.04) : Color.white.opacity(0.02)))
        }
        .buttonStyle(.plain)
    }
}

// MARK: - ═══════════════════════════════════════════════════
// BEHAVIORAL EXPLOITATION VIEW
// ═══════════════════════════════════════════════════════════

struct BehavioralExploitationView: View {
    
    @Environment(\.dismiss) var dismiss
    
    private let tactics: [(String, String, String)] = [
        ("🎰", "Variable Reward Schedules", "Pull-to-refresh, likes, notifications — the same reward patterns used in slot machines. You check your phone 96 times/day because SOMETIMES there's a reward. That unpredictability is more addictive than guaranteed rewards."),
        ("🔴", "Notification Red Dots", "Red is a danger color. Every notification badge triggers a micro stress response. Your brain reads it as an unresolved threat. Clearing it provides relief — which trains you to check more."),
        ("♾️", "Infinite Scroll", "Feeds never end because endings create natural stop points. Without them, your brain can't find a 'good time to stop.' TikTok, Instagram, Twitter — all eliminate the natural conclusion your brain needs."),
        ("👤", "Social Comparison Engine", "Instagram shows you idealized versions of other people's lives. Your brain can't distinguish curated content from reality. Result: you feel inadequate, which makes you scroll more seeking validation."),
        ("⏰", "Streaks & Loss Aversion", "Snapchat streaks, Duolingo streaks, fitness app streaks — all weaponize loss aversion. Missing one day feels like losing something, even though the streak has no real value. You open the app not out of desire but out of fear."),
        ("🤖", "Algorithmic Radicalization", "YouTube's algorithm learned that outrage keeps people watching longer. It gradually pushes content further toward extremes — not because it's true, but because it's engaging. Your attention is monetized regardless of the cost to your worldview."),
        ("💬", "Read Receipts & Typing Indicators", "These create social obligation. If someone knows you saw their message, ignoring it creates anxiety. You respond not because you want to, but because the app manufactured a social expectation."),
        ("🎵", "Autoplay & Ambient Consumption", "Netflix autoplays the next episode. YouTube autoplays the next video. Spotify autoplays after your playlist ends. You didn't choose to keep consuming — the app chose for you. Your consent was assumed, not given."),
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(hex: "#0a0a0f").ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 14) {
                        Text("Every feature is a lever.\nEvery lever pulls your attention.")
                            .font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.4))
                            .multilineTextAlignment(.center).padding(.top, 10)
                        
                        ForEach(tactics, id: \.1) { emoji, title, body in
                            tacticCard(emoji: emoji, title: title, body: body)
                        }
                        
                        Spacer(minLength: 60)
                    }
                    .padding(.horizontal, 16)
                }
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) { Text("Behavioral Exploitation").font(.system(size: 16, weight: .bold)).foregroundColor(.white) }
                ToolbarItem(placement: .navigationBarTrailing) { Button("Done") { dismiss() }.foregroundColor(Color(hex: "#F39C12")) }
            }
            .toolbarBackground(Color(hex: "#0a0a0f"), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
    
    private func tacticCard(emoji: String, title: String, body: String) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 8) {
                Text(emoji).font(.system(size: 22))
                Text(title).font(.system(size: 14, weight: .bold)).foregroundColor(Color(hex: "#F39C12"))
            }
            Text(body).font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.55)).lineSpacing(3)
        }
        .padding(14).background(RoundedRectangle(cornerRadius: 12).fill(Color(hex: "#F39C12").opacity(0.03)))
        .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color(hex: "#F39C12").opacity(0.08), lineWidth: 1))
    }
}

// MARK: - ═══════════════════════════════════════════════════
// DATA HARVESTING VIEW
// ═══════════════════════════════════════════════════════════

struct DataHarvestingView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(hex: "#0a0a0f").ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 16) {
                        Text("You are not the customer.\nYou are the product.")
                            .font(.system(size: 14, weight: .bold)).foregroundColor(.purple.opacity(0.7))
                            .multilineTextAlignment(.center).padding(.top, 10)
                        
                        ForEach(DataHarvestingInfo.categories) { cat in
                            VStack(alignment: .leading, spacing: 8) {
                                HStack(spacing: 8) {
                                    Text(cat.emoji).font(.system(size: 24))
                                    VStack(alignment: .leading, spacing: 2) {
                                        Text(cat.title).font(.system(size: 14, weight: .bold)).foregroundColor(.white)
                                        Text(cat.subtitle).font(.system(size: 10, weight: .medium)).foregroundColor(.purple.opacity(0.5))
                                    }
                                }
                                Text(cat.body).font(.system(size: 12, weight: .medium)).foregroundColor(.white.opacity(0.5)).lineSpacing(3)
                            }
                            .padding(14).background(RoundedRectangle(cornerRadius: 12).fill(Color.purple.opacity(0.03)))
                            .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.purple.opacity(0.08), lineWidth: 1))
                        }
                        
                        Spacer(minLength: 60)
                    }
                    .padding(.horizontal, 16)
                }
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) { Text("Data Harvesting").font(.system(size: 16, weight: .bold)).foregroundColor(.white) }
                ToolbarItem(placement: .navigationBarTrailing) { Button("Done") { dismiss() }.foregroundColor(.purple) }
            }
            .toolbarBackground(Color(hex: "#0a0a0f"), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}

// MARK: - ═══════════════════════════════════════════════════
// DATA MODELS
// ═══════════════════════════════════════════════════════════

struct TrackedApp: Identifiable {
    let id: String
    let name: String
    let company: String
    let emoji: String
    let avgDailyMinutes: String
    let trackersCount: Int
    let dataPointsCollected: String
    let dangerLevel: Int // 1-5
    let trackedData: [String]
    let exposureText: String
}

struct AppTrackingData {
    static let worstOffenders: [TrackedApp] = [
        TrackedApp(id: "tiktok", name: "TikTok", company: "ByteDance", emoji: "🎵", avgDailyMinutes: "95 min", trackersCount: 14, dataPointsCollected: "High", dangerLevel: 5,
            trackedData: ["Keystroke patterns", "Face geometry", "Clipboard content", "Location", "Device info", "Browsing history", "Contacts"],
            exposureText: "TikTok's algorithm is considered the most sophisticated attention-capture system ever built. Internal documents reveal the app tracks keystroke timing, clipboard contents, and facial expressions to optimize content delivery. The average user opens it 19 times daily."),
        
        TrackedApp(id: "instagram", name: "Instagram", company: "Meta", emoji: "📸", avgDailyMinutes: "53 min", trackersCount: 11, dataPointsCollected: "Very High", dangerLevel: 5,
            trackedData: ["Facial recognition", "Location history", "Shopping behavior", "Ad interactions", "DM content", "Photo metadata", "Cross-app tracking"],
            exposureText: "Meta collects data across Instagram, Facebook, WhatsApp, and third-party apps via Meta Pixel. Internal research (leaked by Frances Haugen) showed Instagram worsens body image issues in 32% of teen girls — and the company knew and continued."),
        
        TrackedApp(id: "facebook", name: "Facebook", company: "Meta", emoji: "👤", avgDailyMinutes: "33 min", trackersCount: 13, dataPointsCollected: "Extreme", dangerLevel: 5,
            trackedData: ["Shadow profiles", "Off-platform activity", "Political leanings", "Relationship status changes", "Life events", "Purchase history"],
            exposureText: "Facebook creates 'shadow profiles' of people who don't even have accounts, built from contact lists uploaded by friends. The platform tracks you across the web via embedded Like buttons and Meta Pixel on millions of websites."),
        
        TrackedApp(id: "twitter", name: "X (Twitter)", company: "X Corp", emoji: "🐦", avgDailyMinutes: "34 min", trackersCount: 9, dataPointsCollected: "High", dangerLevel: 4,
            trackedData: ["Political engagement", "Outrage patterns", "Location", "Link clicks", "DMs", "Device info"],
            exposureText: "The platform's algorithm prioritizes engagement over accuracy. Outrage-inducing content gets 6x more retweets. The recommendation system has been shown to amplify extreme political content regardless of user preference."),
        
        TrackedApp(id: "snapchat", name: "Snapchat", company: "Snap Inc.", emoji: "👻", avgDailyMinutes: "30 min", trackersCount: 8, dataPointsCollected: "High", dangerLevel: 4,
            trackedData: ["Location (Snap Map)", "Face data (filters)", "Friend proximity", "Usage patterns", "Content preferences"],
            exposureText: "Snap Map tracks your real-time location and shares it with friends by default. The Streak feature weaponizes loss aversion — users maintain daily exchanges not out of desire but fear of losing streaks."),
        
        TrackedApp(id: "youtube", name: "YouTube", company: "Google/Alphabet", emoji: "▶️", avgDailyMinutes: "74 min", trackersCount: 10, dataPointsCollected: "Very High", dangerLevel: 4,
            trackedData: ["Watch history", "Search history", "Pause/rewind behavior", "Ad interactions", "Voice (smart speakers)", "Cross-Google profile"],
            exposureText: "YouTube's recommendation algorithm drives 70% of total watch time. Internal research showed the algorithm gradually pushes users toward more extreme content because it generates longer watch sessions."),
        
        TrackedApp(id: "amazon", name: "Amazon", company: "Amazon", emoji: "📦", avgDailyMinutes: "12 min", trackersCount: 7, dataPointsCollected: "Extreme", dangerLevel: 4,
            trackedData: ["Purchase history", "Browsing patterns", "Alexa recordings", "Ring doorbell footage", "Kindle reading habits", "Whole Foods purchases"],
            exposureText: "Amazon's ecosystem spans shopping, Alexa, Ring, Kindle, Whole Foods, Twitch, and AWS. Combined, they build one of the most complete consumer profiles in existence — from what you buy to what you read to what's happening at your front door."),
    ]
}

struct SubscriptionItem: Identifiable {
    let id: String
    let name: String
    let emoji: String
    let monthlyPrice: Double
}

struct SubscriptionCategory {
    let name: String
    let subs: [SubscriptionItem]
}

struct SubscriptionData {
    static let commonSubs: [SubscriptionItem] = categories.flatMap(\.subs)
    
    static let categories: [SubscriptionCategory] = [
        SubscriptionCategory(name: "Streaming", subs: [
            .init(id: "netflix", name: "Netflix", emoji: "🎬", monthlyPrice: 15.49),
            .init(id: "hulu", name: "Hulu", emoji: "📺", monthlyPrice: 17.99),
            .init(id: "disneyplus", name: "Disney+", emoji: "🏰", monthlyPrice: 13.99),
            .init(id: "max", name: "Max (HBO)", emoji: "🎭", monthlyPrice: 16.99),
            .init(id: "paramount", name: "Paramount+", emoji: "⛰️", monthlyPrice: 11.99),
            .init(id: "peacock", name: "Peacock", emoji: "🦚", monthlyPrice: 7.99),
            .init(id: "appletv", name: "Apple TV+", emoji: "🍎", monthlyPrice: 9.99),
            .init(id: "prime", name: "Amazon Prime", emoji: "📦", monthlyPrice: 14.99),
            .init(id: "ytpremium", name: "YouTube Premium", emoji: "▶️", monthlyPrice: 13.99),
        ]),
        SubscriptionCategory(name: "Music", subs: [
            .init(id: "spotify", name: "Spotify", emoji: "🎵", monthlyPrice: 11.99),
            .init(id: "applemusic", name: "Apple Music", emoji: "🎧", monthlyPrice: 10.99),
            .init(id: "tidal", name: "Tidal", emoji: "🌊", monthlyPrice: 10.99),
        ]),
        SubscriptionCategory(name: "Cloud & Productivity", subs: [
            .init(id: "icloud", name: "iCloud+", emoji: "☁️", monthlyPrice: 2.99),
            .init(id: "gdrive", name: "Google One", emoji: "🔵", monthlyPrice: 2.99),
            .init(id: "dropbox", name: "Dropbox", emoji: "📁", monthlyPrice: 11.99),
            .init(id: "office", name: "Microsoft 365", emoji: "📊", monthlyPrice: 9.99),
            .init(id: "adobe", name: "Adobe Creative", emoji: "🎨", monthlyPrice: 54.99),
        ]),
        SubscriptionCategory(name: "Fitness & Health", subs: [
            .init(id: "gym", name: "Gym Membership", emoji: "💪", monthlyPrice: 40.00),
            .init(id: "peloton", name: "Peloton", emoji: "🚴", monthlyPrice: 12.99),
            .init(id: "headspace", name: "Headspace", emoji: "🧘", monthlyPrice: 12.99),
        ]),
        SubscriptionCategory(name: "Food & Delivery", subs: [
            .init(id: "doordash", name: "DoorDash DashPass", emoji: "🍔", monthlyPrice: 9.99),
            .init(id: "ubereats", name: "Uber One", emoji: "🚗", monthlyPrice: 9.99),
            .init(id: "mealkit", name: "Meal Kit Service", emoji: "🥘", monthlyPrice: 60.00),
        ]),
        SubscriptionCategory(name: "News & Reading", subs: [
            .init(id: "nyt", name: "NY Times", emoji: "📰", monthlyPrice: 17.00),
            .init(id: "wsj", name: "Wall Street Journal", emoji: "📈", monthlyPrice: 12.49),
            .init(id: "audible", name: "Audible", emoji: "🎧", monthlyPrice: 14.95),
            .init(id: "kindle", name: "Kindle Unlimited", emoji: "📚", monthlyPrice: 11.99),
        ]),
    ]
}

struct DataHarvestCategory: Identifiable {
    let id = UUID()
    let emoji: String
    let title: String
    let subtitle: String
    let body: String
}

struct DataHarvestingInfo {
    static let categories: [DataHarvestCategory] = [
        .init(emoji: "📍", title: "Location Tracking", subtitle: "They know where you live, work, and shop",
              body: "Your phone logs GPS coordinates thousands of times per day. Apps sell this data to brokers who build movement profiles. They know your commute, your gym, your therapist's office, and which stores you walk into. In 2023, a data broker was caught selling location data from a prayer app to the U.S. military."),
        .init(emoji: "🎤", title: "Audio & Voice", subtitle: "Alexa is always listening",
              body: "Smart speakers record 'wake word' activations — but they also capture conversations before and after. Amazon employees have listened to thousands of Alexa recordings. Siri recordings were sent to contractors without user knowledge until Apple was caught in 2019."),
        .init(emoji: "🖼️", title: "Facial Recognition", subtitle: "Your face is a data point",
              body: "Every time you use a face filter on Instagram, Snapchat, or TikTok, you're training their facial recognition models for free. Clearview AI scraped billions of social media photos to build a surveillance database sold to law enforcement. Your selfies are their training data."),
        .init(emoji: "💳", title: "Purchase Behavior", subtitle: "Every transaction tells a story",
              body: "Credit card companies sell anonymized purchase data. Google tracks purchases from Gmail receipts. Amazon knows your buying patterns better than you do. Target famously identified a teenager's pregnancy from her shopping patterns before her father knew."),
        .init(emoji: "🧬", title: "Health & Biometric", subtitle: "Your body is monetized",
              body: "Fitness trackers, period tracking apps, and health surveys create intimate profiles. Some period tracking apps sold data to Facebook. DNA testing companies like 23andMe have faced scrutiny over sharing genetic data with pharmaceutical companies and researchers."),
        .init(emoji: "🗳️", title: "Political Profiling", subtitle: "Your beliefs are for sale",
              body: "Cambridge Analytica harvested data from 87 million Facebook users to influence elections. Data brokers categorize you by political leaning, social issues, and susceptibility to specific messaging. Your data isn't just sold to advertisers — it's sold to campaigns."),
    ]
}
