// SparkAFriendSystem.swift
// Viral Sharing & Friend Invitation System
// ☀️ SunFlow: Reignited

import SwiftUI
import Foundation

// MARK: - Referred Friend

struct ReferredFriend: Identifiable, Codable {
    let id: String
    let displayName: String
    let joinedAt: Date
    let coursesCompleted: Int
    let isActive: Bool
    
    init(id: String = UUID().uuidString, displayName: String, joinedAt: Date = Date(), coursesCompleted: Int = 0, isActive: Bool = true) {
        self.id = id
        self.displayName = displayName
        self.joinedAt = joinedAt
        self.coursesCompleted = coursesCompleted
        self.isActive = isActive
    }
}

// MARK: - Spark Stats

struct SparkStats: Codable {
    var totalShares: Int = 0
    var friendsInvited: Int = 0
    var friendsJoined: Int = 0
    var xpEarned: Int = 0
    var friends: [ReferredFriend] = []
    var referralCode: String = ""
}

// MARK: - Spark Manager

@MainActor
class SparkManager: ObservableObject {
    static let shared = SparkManager()
    
    @Published var stats = SparkStats()
    
    private let userDefaults = UserDefaults.standard
    private let statsKey = "spark_stats"
    
    var referralCode: String {
        stats.referralCode
    }
    
    var shareText: String {
        "☀️ Join me on Aperture - the consciousness expansion app! Use my code: \(stats.referralCode)\n\nhttps://aperture.app/invite/\(stats.referralCode)"
    }
    
    init() {
        loadStats()
        if stats.referralCode.isEmpty {
            stats.referralCode = Self.generateReferralCode()
            saveStats()
        }
    }
    
    private static func generateReferralCode() -> String {
        let characters = "ABCDEFGHJKLMNPQRSTUVWXYZ23456789"
        return String((0..<6).map { _ in characters.randomElement() ?? Character("A") })
    }
    
    private func loadStats() {
        if let data = userDefaults.data(forKey: statsKey),
           let savedStats = try? JSONDecoder().decode(SparkStats.self, from: data) {
            stats = savedStats
        }
    }
    
    private func saveStats() {
        if let data = try? JSONEncoder().encode(stats) {
            userDefaults.set(data, forKey: statsKey)
        }
    }
    
    func trackShare() {
        stats.totalShares += 1
        stats.friendsInvited += 1
        saveStats()
    }
    
    func copyReferralCode() {
        UIPasteboard.general.string = stats.referralCode
    }
    
    func addFriend(_ friend: ReferredFriend) {
        stats.friends.append(friend)
        stats.friendsJoined += 1
        stats.xpEarned += 100
        saveStats()
    }
}

// MARK: - Spark a Friend Hub View

struct SparkAFriendHubView: View {
    @StateObject private var sparkManager = SparkManager.shared
    @State private var showShareSheet = false
    @State private var showCopiedToast = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                heroSection
                referralCodeCard
                statsOverview
                
                if !sparkManager.stats.friends.isEmpty {
                    friendsSection
                }
                
                howItWorksSection
            }
            .padding()
        }
        .background(Color.black.ignoresSafeArea())
        .navigationTitle("Spark a Friend")
        .navigationBarTitleDisplayMode(.large)
        .overlay(alignment: .top) {
            if showCopiedToast {
                copiedToast
                    .transition(.move(edge: .top).combined(with: .opacity))
            }
        }
        .sheet(isPresented: $showShareSheet) {
            SparkShareSheetView(text: sparkManager.shareText) {
                sparkManager.trackShare()
            }
        }
    }
    
    // MARK: - Hero Section
    
    private var heroSection: some View {
        VStack(spacing: 16) {
            ZStack {
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [.orange.opacity(0.3), .clear],
                            center: .center,
                            startRadius: 0,
                            endRadius: 60
                        )
                    )
                    .frame(width: 120, height: 120)
                
                Image(systemName: "flame.fill")
                    .font(.system(size: 50))
                    .foregroundStyle(
                        LinearGradient(
                            colors: [.yellow, .orange, .red],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .shadow(color: .orange.opacity(0.5), radius: 10)
            }
            
            Text("Spread the Spark")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
            
            Text("Help others see through the programming.\nEarn XP for every friend who joins.")
                .font(.subheadline)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
        }
        .padding(.vertical)
    }
    
    // MARK: - Referral Code Card
    
    private var referralCodeCard: some View {
        VStack(spacing: 16) {
            Text("YOUR SPARK CODE")
                .font(.caption)
                .fontWeight(.bold)
                .tracking(2)
                .foregroundColor(.orange)
            
            HStack(spacing: 8) {
                ForEach(Array(sparkManager.referralCode), id: \.self) { char in
                    Text(String(char))
                        .font(.system(size: 32, weight: .black, design: .monospaced))
                        .foregroundColor(.white)
                        .frame(width: 44, height: 56)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color.white.opacity(0.1))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .strokeBorder(Color.orange.opacity(0.5), lineWidth: 1)
                                )
                        )
                }
            }
            
            HStack(spacing: 12) {
                Button(action: copyCode) {
                    Label("Copy", systemImage: "doc.on.doc")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 12)
                        .background(Color.white.opacity(0.1))
                        .cornerRadius(10)
                }
                
                Button(action: { showShareSheet = true }) {
                    Label("Share", systemImage: "paperplane.fill")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 12)
                        .background(
                            LinearGradient(
                                colors: [.yellow, .orange],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .cornerRadius(10)
                }
            }
        }
        .padding(24)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white.opacity(0.05))
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .strokeBorder(
                            LinearGradient(
                                colors: [.orange.opacity(0.5), .yellow.opacity(0.3)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            ),
                            lineWidth: 1
                        )
                )
        )
    }
    
    // MARK: - Stats Overview
    
    private var statsOverview: some View {
        HStack(spacing: 0) {
            statItem(value: "\(sparkManager.stats.totalShares)", label: "Invites Sent", icon: "paperplane")
            Divider().frame(height: 50)
            statItem(value: "\(sparkManager.stats.friendsJoined)", label: "Friends Joined", icon: "person.badge.plus")
            Divider().frame(height: 50)
            statItem(value: "+\(sparkManager.stats.xpEarned)", label: "XP Earned", icon: "star.fill", valueColor: .yellow)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white.opacity(0.05))
        )
    }
    
    private func statItem(value: String, label: String, icon: String, valueColor: Color = .white) -> some View {
        VStack(spacing: 8) {
            Image(systemName: icon)
                .font(.title3)
                .foregroundColor(.orange)
            
            Text(value)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(valueColor)
            
            Text(label)
                .font(.caption2)
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity)
    }
    
    // MARK: - Friends Section
    
    private var friendsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Your Awakened Friends")
                .font(.headline)
                .foregroundColor(.white)
            
            ForEach(sparkManager.stats.friends) { friend in
                HStack(spacing: 12) {
                    Circle()
                        .fill(Color.orange.opacity(0.3))
                        .frame(width: 40, height: 40)
                        .overlay(
                            Text(String(friend.displayName.prefix(1)))
                                .font(.headline)
                                .foregroundColor(.orange)
                        )
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text(friend.displayName)
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                        
                        Text("Joined \(friend.joinedAt.formatted(date: .abbreviated, time: .omitted))")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                    
                    if friend.isActive {
                        Text("Active")
                            .font(.caption2)
                            .fontWeight(.medium)
                            .foregroundColor(.green)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(Color.green.opacity(0.2))
                            .cornerRadius(4)
                    }
                }
                .padding()
                .background(Color.white.opacity(0.05))
                .cornerRadius(12)
            }
        }
    }
    
    // MARK: - How It Works
    
    private var howItWorksSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("How It Works")
                .font(.headline)
                .foregroundColor(.white)
            
            VStack(spacing: 12) {
                howItWorksRow(number: "1", title: "Share Your Code", description: "Send your spark code to friends")
                howItWorksRow(number: "2", title: "They Join", description: "Friends sign up with your code")
                howItWorksRow(number: "3", title: "Earn Rewards", description: "Get 100 XP per friend who joins")
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white.opacity(0.05))
        )
    }
    
    private func howItWorksRow(number: String, title: String, description: String) -> some View {
        HStack(spacing: 12) {
            Text(number)
                .font(.headline)
                .foregroundColor(.black)
                .frame(width: 28, height: 28)
                .background(Color.orange)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                
                Text(description)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            Spacer()
        }
    }
    
    // MARK: - Copied Toast
    
    private var copiedToast: some View {
        Text("Code Copied!")
            .font(.subheadline)
            .fontWeight(.medium)
            .foregroundColor(.white)
            .padding(.horizontal, 20)
            .padding(.vertical, 12)
            .background(Color.green)
            .cornerRadius(25)
            .padding(.top, 10)
    }
    
    private func copyCode() {
        sparkManager.copyReferralCode()
        withAnimation {
            showCopiedToast = true
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation {
                showCopiedToast = false
            }
        }
        
        HapticManager.shared.medium()
    }
}

// MARK: - Spark Share Sheet View

struct SparkShareSheetView: UIViewControllerRepresentable {
    let text: String
    var onComplete: (() -> Void)?
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: [text], applicationActivities: nil)
        controller.completionWithItemsHandler = { _, completed, _, _ in
            if completed {
                onComplete?()
            }
        }
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {}
}

// MARK: - Spark Landing Card

struct SparkLandingCard: View {
    var body: some View {
        NavigationLink(destination: SparkAFriendHubView()) {
            HStack(spacing: 16) {
                ZStack {
                    Circle()
                        .fill(
                            LinearGradient(
                                colors: [.orange.opacity(0.3), .yellow.opacity(0.2)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 50, height: 50)
                    
                    Image(systemName: "flame.fill")
                        .font(.title2)
                        .foregroundStyle(
                            LinearGradient(
                                colors: [.yellow, .orange],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Spark a Friend")
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    Text("Invite friends & earn rewards")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.white.opacity(0.05))
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .strokeBorder(Color.orange.opacity(0.3), lineWidth: 1)
                    )
            )
        }
    }
}

// MARK: - Spark a Friend View (Alias for Hub)

typealias SparkAFriendView = SparkAFriendHubView

// MARK: - Preview

#Preview {
    NavigationStack {
        SparkAFriendHubView()
    }
}
