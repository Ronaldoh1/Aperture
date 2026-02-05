// AwakeningPodcastsView.swift
// Curated spiritual awakening podcasts - "Neural bridges for consciousness"
// Turn your commute into an enlightenment portal 🎧

import SwiftUI

// MARK: - Podcast Models

struct AwakeningPodcast: Identifiable {
    let id = UUID()
    let name: String
    let host: String
    let description: String
    let longDescription: String
    let category: PodcastCategory
    let coverColor: Color
    let icon: String
    let spotifyURL: String?
    let applePodcastsURL: String?
    let websiteURL: String?
    let keyTopics: [String]
    let bestFor: [String]
    let sampleEpisodes: [SampleEpisode]
    let vibe: String // Quick descriptor
    let difficultyLevel: Int // 1-5 (1 = beginner friendly, 5 = advanced)
    let isTopPick: Bool
}

struct SampleEpisode: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let duration: String
}

enum PodcastCategory: String, CaseIterable {
    case consciousness = "Consciousness"
    case shadowWork = "Shadow Work"
    case easternWisdom = "Eastern Wisdom"
    case scienceSpirit = "Science + Spirit"
    case practicalAwakening = "Practical Awakening"
    case meditation = "Meditation & Mindfulness"
    case mysticism = "Mysticism & Energy"
    case philosophy = "Philosophy & Inquiry"
    
    var icon: String {
        switch self {
        case .consciousness: return "brain.head.profile"
        case .shadowWork: return "moon.fill"
        case .easternWisdom: return "leaf.fill"
        case .scienceSpirit: return "atom"
        case .practicalAwakening: return "figure.walk"
        case .meditation: return "wind"
        case .mysticism: return "sparkles"
        case .philosophy: return "book.fill"
        }
    }
    
    var color: Color {
        switch self {
        case .consciousness: return .purple
        case .shadowWork: return .indigo
        case .easternWisdom: return .green
        case .scienceSpirit: return .cyan
        case .practicalAwakening: return .orange
        case .meditation: return .blue
        case .mysticism: return .pink
        case .philosophy: return .yellow
        }
    }
}

// MARK: - Main View

struct AwakeningPodcastsView: View {
    @StateObject private var interactor = PodcastInteractor()
    @State private var selectedCategory: PodcastCategory? = nil
    @State private var searchText = ""
    @State private var showingPodcast: AwakeningPodcast? = nil
    
    var filteredPodcasts: [AwakeningPodcast] {
        var results = PodcastLibrary.allPodcasts
        
        if let category = selectedCategory {
            results = results.filter { $0.category == category }
        }
        
        if !searchText.isEmpty {
            results = results.filter {
                $0.name.localizedCaseInsensitiveContains(searchText) ||
                $0.host.localizedCaseInsensitiveContains(searchText) ||
                $0.keyTopics.joined().localizedCaseInsensitiveContains(searchText)
            }
        }
        
        return results
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                // Header
                headerSection
                
                // Search
                searchBar
                
                // Category Filter
                categoryFilter
                
                // Top Picks (if no filter)
                if selectedCategory == nil && searchText.isEmpty {
                    topPicksSection
                }
                
                // All Podcasts
                podcastsGrid
                
                // Why Podcasts Matter
                whyPodcastsSection
                
                // Pro Tips
                proTipsSection
            }
        }
        .background(Color.black.ignoresSafeArea())
        .navigationTitle("Awakening Podcasts")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(item: $showingPodcast) { podcast in
            PodcastDetailSheet(podcast: podcast)
        }
    }
    
    // MARK: - Header
    
    private var headerSection: some View {
        VStack(spacing: 16) {
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(
                            colors: [.purple, .pink, .orange],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 80, height: 80)
                
                Image(systemName: "headphones")
                    .font(.system(size: 32))
                    .foregroundColor(.white)
            }
            
            Text("AWAKENING PODCASTS")
                .font(.system(size: 24, weight: .black))
                .foregroundColor(.white)
            
            Text("Turn your commute into an enlightenment portal")
                .font(.system(size: 14))
                .foregroundColor(.gray)
            
            HStack(spacing: 6) {
                Image(systemName: "brain.head.profile")
                    .foregroundColor(.purple)
                Text("Neural bridges for consciousness expansion")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(.purple)
            }
        }
        .padding()
    }
    
    // MARK: - Search
    
    private var searchBar: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            
            TextField("Search podcasts, hosts, topics...", text: $searchText)
                .foregroundColor(.white)
            
            if !searchText.isEmpty {
                Button(action: { searchText = "" }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                }
            }
        }
        .padding(12)
        .background(Color.white.opacity(0.1))
        .cornerRadius(12)
        .padding(.horizontal)
    }
    
    // MARK: - Category Filter
    
    private var categoryFilter: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                // All button
                Button(action: { selectedCategory = nil }) {
                    Text("All")
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(selectedCategory == nil ? .black : .white)
                        .padding(.horizontal, 14)
                        .padding(.vertical, 8)
                        .background(selectedCategory == nil ? Color.white : Color.white.opacity(0.1))
                        .cornerRadius(20)
                }
                
                ForEach(PodcastCategory.allCases, id: \.self) { category in
                    Button(action: { selectedCategory = category }) {
                        HStack(spacing: 4) {
                            Image(systemName: category.icon)
                                .font(.system(size: 10))
                            Text(category.rawValue)
                                .font(.system(size: 12, weight: .semibold))
                        }
                        .foregroundColor(selectedCategory == category ? .black : .white)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .background(selectedCategory == category ? category.color : Color.white.opacity(0.1))
                        .cornerRadius(20)
                    }
                }
            }
            .padding(.horizontal)
        }
        .padding(.vertical, 16)
    }
    
    // MARK: - Top Picks
    
    private var topPicksSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                Text("TOP PICKS FOR AWAKENING")
                    .font(.system(size: 12, weight: .black))
                    .foregroundColor(.yellow)
            }
            .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(PodcastLibrary.allPodcasts.filter { $0.isTopPick }) { podcast in
                        TopPickCard(podcast: podcast) {
                            showingPodcast = podcast
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
        .padding(.bottom, 24)
    }
    
    // MARK: - Podcasts Grid
    
    private var podcastsGrid: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "square.grid.2x2.fill")
                    .foregroundColor(.cyan)
                Text(selectedCategory?.rawValue.uppercased() ?? "ALL PODCASTS")
                    .font(.system(size: 12, weight: .black))
                    .foregroundColor(.cyan)
                
                Spacer()
                
                Text("\(filteredPodcasts.count) shows")
                    .font(.system(size: 11))
                    .foregroundColor(.gray)
            }
            .padding(.horizontal)
            
            LazyVStack(spacing: 12) {
                ForEach(filteredPodcasts) { podcast in
                    PodcastRowCard(podcast: podcast) {
                        showingPodcast = podcast
                    }
                }
            }
            .padding(.horizontal)
        }
    }
    
    // MARK: - Why Podcasts Matter
    
    private var whyPodcastsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "lightbulb.fill")
                    .foregroundColor(.orange)
                Text("WHY PODCASTS FOR AWAKENING?")
                    .font(.system(size: 12, weight: .black))
                    .foregroundColor(.orange)
            }
            
            VStack(alignment: .leading, spacing: 12) {
                whyRow("🚇", "Commute Alchemy", "Transform dead time into growth time. Subway rides become enlightenment portals.")
                whyRow("🔄", "Passive Rewiring", "Audio bypasses the critical mind. Wisdom absorbs while you're 'just listening.'")
                whyRow("🌍", "Global Teachers", "Access masters you'd never meet in person. The world's best, in your pocket.")
                whyRow("📴", "Offline Ready", "Download episodes. No Wi-Fi? No problem. Growth happens anywhere.")
                whyRow("🧠", "Repetition = Integration", "Re-listen to episodes that hit. Each time, you hear something new.")
            }
        }
        .padding()
        .background(Color.orange.opacity(0.1))
        .cornerRadius(16)
        .padding()
    }
    
    private func whyRow(_ emoji: String, _ title: String, _ desc: String) -> some View {
        HStack(alignment: .top, spacing: 12) {
            Text(emoji)
                .font(.system(size: 20))
            
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.white)
                Text(desc)
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
            }
        }
    }
    
    // MARK: - Pro Tips
    
    private var proTipsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "sparkle")
                    .foregroundColor(.green)
                Text("PRO TIPS FOR PODCAST AWAKENING")
                    .font(.system(size: 12, weight: .black))
                    .foregroundColor(.green)
            }
            
            VStack(alignment: .leading, spacing: 10) {
                tipRow("1", "Start with ONE podcast. Go deep before wide.")
                tipRow("2", "Voice memo your insights immediately. Capture the aha.")
                tipRow("3", "1.25x speed for familiar topics. Normal for new territory.")
                tipRow("4", "Re-listen to episodes that triggered you. There's gold there.")
                tipRow("5", "Create a 'Spiritual Queue' playlist. Curate your consciousness.")
            }
        }
        .padding()
        .background(Color.green.opacity(0.1))
        .cornerRadius(16)
        .padding()
        .padding(.bottom, 40)
    }
    
    private func tipRow(_ num: String, _ tip: String) -> some View {
        HStack(alignment: .top, spacing: 10) {
            Text(num)
                .font(.system(size: 12, weight: .bold))
                .foregroundColor(.green)
                .frame(width: 20)
            
            Text(tip)
                .font(.system(size: 13))
                .foregroundColor(.white.opacity(0.9))
        }
    }
}

// MARK: - Top Pick Card

struct TopPickCard: View {
    let podcast: AwakeningPodcast
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            VStack(alignment: .leading, spacing: 10) {
                // Cover
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(
                            LinearGradient(
                                colors: [podcast.coverColor, podcast.coverColor.opacity(0.6)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 140, height: 140)
                    
                    Text(podcast.icon)
                        .font(.system(size: 40))
                    
                    // Top Pick Badge
                    VStack {
                        HStack {
                            Spacer()
                            Image(systemName: "star.fill")
                                .font(.system(size: 12))
                                .foregroundColor(.yellow)
                                .padding(6)
                                .background(Color.black.opacity(0.6))
                                .clipShape(Circle())
                        }
                        Spacer()
                    }
                    .padding(8)
                }
                
                // Info
                VStack(alignment: .leading, spacing: 4) {
                    Text(podcast.name)
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(.white)
                        .lineLimit(1)
                    
                    Text(podcast.host)
                        .font(.system(size: 11))
                        .foregroundColor(.gray)
                        .lineLimit(1)
                    
                    Text(podcast.vibe)
                        .font(.system(size: 10))
                        .foregroundColor(podcast.coverColor)
                        .lineLimit(1)
                }
                .frame(width: 140, alignment: .leading)
            }
        }
    }
}

// MARK: - Podcast Row Card

struct PodcastRowCard: View {
    let podcast: AwakeningPodcast
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            HStack(spacing: 14) {
                // Cover
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(
                            LinearGradient(
                                colors: [podcast.coverColor, podcast.coverColor.opacity(0.6)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 70, height: 70)
                    
                    Text(podcast.icon)
                        .font(.system(size: 28))
                }
                
                // Info
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text(podcast.name)
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundColor(.white)
                        
                        if podcast.isTopPick {
                            Image(systemName: "star.fill")
                                .font(.system(size: 10))
                                .foregroundColor(.yellow)
                        }
                    }
                    
                    Text(podcast.host)
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                    
                    HStack(spacing: 4) {
                        Image(systemName: podcast.category.icon)
                            .font(.system(size: 9))
                        Text(podcast.category.rawValue)
                            .font(.system(size: 10))
                    }
                    .foregroundColor(podcast.category.color)
                    
                    // Difficulty
                    HStack(spacing: 2) {
                        ForEach(0..<5) { i in
                            Circle()
                                .fill(i < podcast.difficultyLevel ? podcast.coverColor : Color.white.opacity(0.2))
                                .frame(width: 6, height: 6)
                        }
                        Text(difficultyLabel(podcast.difficultyLevel))
                            .font(.system(size: 9))
                            .foregroundColor(.gray)
                    }
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
                    .font(.system(size: 12))
            }
            .padding(12)
            .background(Color.white.opacity(0.05))
            .cornerRadius(12)
        }
    }
    
    private func difficultyLabel(_ level: Int) -> String {
        switch level {
        case 1: return "Beginner"
        case 2: return "Easy"
        case 3: return "Intermediate"
        case 4: return "Advanced"
        case 5: return "Deep Dive"
        default: return ""
        }
    }
}

// MARK: - Podcast Detail Sheet

struct PodcastDetailSheet: View {
    let podcast: AwakeningPodcast
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 24) {
                    // Header
                    VStack(spacing: 16) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(
                                    LinearGradient(
                                        colors: [podcast.coverColor, podcast.coverColor.opacity(0.5)],
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                )
                                .frame(width: 150, height: 150)
                            
                            Text(podcast.icon)
                                .font(.system(size: 60))
                        }
                        
                        Text(podcast.name)
                            .font(.system(size: 22, weight: .bold))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                        
                        Text("Hosted by \(podcast.host)")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                        
                        Text(podcast.vibe)
                            .font(.system(size: 13, weight: .medium))
                            .foregroundColor(podcast.coverColor)
                        
                        // Category & Difficulty
                        HStack(spacing: 16) {
                            HStack(spacing: 4) {
                                Image(systemName: podcast.category.icon)
                                Text(podcast.category.rawValue)
                            }
                            .font(.system(size: 11))
                            .foregroundColor(podcast.category.color)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 6)
                            .background(podcast.category.color.opacity(0.2))
                            .cornerRadius(12)
                            
                            HStack(spacing: 2) {
                                ForEach(0..<podcast.difficultyLevel, id: \.self) { _ in
                                    Image(systemName: "flame.fill")
                                        .font(.system(size: 10))
                                }
                            }
                            .foregroundColor(.orange)
                        }
                    }
                    .padding(.top, 20)
                    
                    // Listen Buttons
                    VStack(spacing: 10) {
                        if let spotify = podcast.spotifyURL {
                            Link(destination: URL(string: spotify)!) {
                                HStack {
                                    Image(systemName: "play.circle.fill")
                                    Text("Listen on Spotify")
                                        .font(.system(size: 14, weight: .semibold))
                                }
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.green)
                                .cornerRadius(12)
                            }
                        }
                        
                        if let apple = podcast.applePodcastsURL {
                            Link(destination: URL(string: apple)!) {
                                HStack {
                                    Image(systemName: "play.circle.fill")
                                    Text("Listen on Apple Podcasts")
                                        .font(.system(size: 14, weight: .semibold))
                                }
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.purple)
                                .cornerRadius(12)
                            }
                        }
                        
                        if let website = podcast.websiteURL {
                            Link(destination: URL(string: website)!) {
                                HStack {
                                    Image(systemName: "globe")
                                    Text("Visit Website")
                                        .font(.system(size: 14, weight: .semibold))
                                }
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.white.opacity(0.2))
                                .cornerRadius(12)
                            }
                        }
                    }
                    .padding(.horizontal)
                    
                    // Description
                    VStack(alignment: .leading, spacing: 10) {
                        Text("About")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(.white)
                        
                        Text(podcast.longDescription)
                            .font(.system(size: 13))
                            .foregroundColor(.white.opacity(0.8))
                            .lineSpacing(4)
                    }
                    .padding()
                    .background(Color.white.opacity(0.05))
                    .cornerRadius(12)
                    .padding(.horizontal)
                    
                    // Key Topics
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Key Topics")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(.white)
                        
                        PodcastFlowLayout(spacing: 8) {
                            ForEach(podcast.keyTopics, id: \.self) { topic in
                                Text(topic)
                                    .font(.system(size: 11))
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 6)
                                    .background(podcast.coverColor.opacity(0.3))
                                    .cornerRadius(12)
                            }
                        }
                    }
                    .padding()
                    .background(Color.white.opacity(0.05))
                    .cornerRadius(12)
                    .padding(.horizontal)
                    
                    // Best For
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Best For")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(.white)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            ForEach(podcast.bestFor, id: \.self) { item in
                                HStack(alignment: .top, spacing: 8) {
                                    Image(systemName: "checkmark.circle.fill")
                                        .foregroundColor(.green)
                                        .font(.system(size: 12))
                                    Text(item)
                                        .font(.system(size: 12))
                                        .foregroundColor(.white.opacity(0.8))
                                }
                            }
                        }
                    }
                    .padding()
                    .background(Color.white.opacity(0.05))
                    .cornerRadius(12)
                    .padding(.horizontal)
                    
                    // Sample Episodes
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Episodes to Start With")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(.white)
                        
                        ForEach(podcast.sampleEpisodes) { episode in
                            VStack(alignment: .leading, spacing: 6) {
                                HStack {
                                    Image(systemName: "play.circle")
                                        .foregroundColor(podcast.coverColor)
                                    Text(episode.title)
                                        .font(.system(size: 13, weight: .semibold))
                                        .foregroundColor(.white)
                                    Spacer()
                                    Text(episode.duration)
                                        .font(.system(size: 10))
                                        .foregroundColor(.gray)
                                }
                                Text(episode.description)
                                    .font(.system(size: 11))
                                    .foregroundColor(.gray)
                            }
                            .padding(12)
                            .background(Color.white.opacity(0.03))
                            .cornerRadius(10)
                        }
                    }
                    .padding()
                    .background(Color.white.opacity(0.05))
                    .cornerRadius(12)
                    .padding(.horizontal)
                    .padding(.bottom, 40)
                }
            }
            .background(Color.black.ignoresSafeArea())
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") { dismiss() }
                }
            }
        }
    }
}

// MARK: - Flow Layout Helper

struct PodcastFlowLayout: Layout {
    var spacing: CGFloat = 8
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let result = FlowResult(in: proposal.width ?? 0, subviews: subviews, spacing: spacing)
        return result.size
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let result = FlowResult(in: bounds.width, subviews: subviews, spacing: spacing)
        for (index, subview) in subviews.enumerated() {
            subview.place(at: CGPoint(x: bounds.minX + result.positions[index].x,
                                      y: bounds.minY + result.positions[index].y),
                         proposal: .unspecified)
        }
    }
    
    struct FlowResult {
        var size: CGSize = .zero
        var positions: [CGPoint] = []
        
        init(in width: CGFloat, subviews: Subviews, spacing: CGFloat) {
            var x: CGFloat = 0
            var y: CGFloat = 0
            var rowHeight: CGFloat = 0
            
            for subview in subviews {
                let size = subview.sizeThatFits(.unspecified)
                
                if x + size.width > width && x > 0 {
                    x = 0
                    y += rowHeight + spacing
                    rowHeight = 0
                }
                
                positions.append(CGPoint(x: x, y: y))
                rowHeight = max(rowHeight, size.height)
                x += size.width + spacing
            }
            
            self.size = CGSize(width: width, height: y + rowHeight)
        }
    }
}

// MARK: - Preview

#Preview {
    NavigationStack {
        AwakeningPodcastsView()
    }
}
