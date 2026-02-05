// ScienceOfConsciousnessHub.swift
// Curated Library of Consciousness Research
// TED clips, YouTube channels, Books, Researchers
// "Why consciousness matters" - your edge in an AI-driven future

import SwiftUI

// MARK: - Models

struct ConsciousnessResource: Identifiable {
    let id = UUID()
    let title: String
    let creator: String
    let type: HubResourceType
    let category: ConsciousnessCategory
    let description: String
    let keyInsights: [String]
    let duration: String? // For videos
    let url: String
    let thumbnail: String // SF Symbol
    let difficulty: Int // 1-5
    let viewCount: String? // e.g., "16M views"
    let isFeatured: Bool
}

enum HubResourceType: String, CaseIterable {
    case tedTalk = "TED Talk"
    case youtube = "YouTube"
    case book = "Book"
    case podcast = "Podcast"
    case researcher = "Researcher"
    case course = "Course"
    
    var icon: String {
        switch self {
        case .tedTalk: return "play.rectangle.fill"
        case .youtube: return "play.circle.fill"
        case .book: return "book.fill"
        case .podcast: return "headphones"
        case .researcher: return "person.crop.circle.fill"
        case .course: return "graduationcap.fill"
        }
    }
    
    var color: Color {
        switch self {
        case .tedTalk: return .red
        case .youtube: return .red
        case .book: return .orange
        case .podcast: return .purple
        case .researcher: return .blue
        case .course: return .green
        }
    }
}

enum ConsciousnessCategory: String, CaseIterable {
    case neuroscience = "Neuroscience"
    case philosophy = "Philosophy"
    case spirituality = "Spirituality"
    case psychology = "Psychology"
    case physics = "Physics & Consciousness"
    case meditation = "Meditation & Practice"
    case awakening = "Awakening"
    
    var icon: String {
        switch self {
        case .neuroscience: return "brain.head.profile"
        case .philosophy: return "lightbulb.fill"
        case .spirituality: return "sparkles"
        case .psychology: return "person.fill.questionmark"
        case .physics: return "atom"
        case .meditation: return "figure.mind.and.body"
        case .awakening: return "sunrise.fill"
        }
    }
    
    var color: Color {
        switch self {
        case .neuroscience: return .pink
        case .philosophy: return .purple
        case .spirituality: return .yellow
        case .psychology: return .cyan
        case .physics: return .blue
        case .meditation: return .green
        case .awakening: return .orange
        }
    }
}

// MARK: - Main View

struct ScienceOfConsciousnessHubView: View {
    @State private var selectedCategory: ConsciousnessCategory?
    @State private var selectedType: HubResourceType?
    @State private var searchText = ""
    @State private var showingResourceDetail: ConsciousnessResource?
    
    private let resources = ConsciousnessLibrary.allResources
    
    var filteredResources: [ConsciousnessResource] {
        resources.filter { resource in
            let matchesCategory = selectedCategory == nil || resource.category == selectedCategory
            let matchesType = selectedType == nil || resource.type == selectedType
            let matchesSearch = searchText.isEmpty ||
                resource.title.localizedCaseInsensitiveContains(searchText) ||
                resource.creator.localizedCaseInsensitiveContains(searchText) ||
                resource.description.localizedCaseInsensitiveContains(searchText)
            return matchesCategory && matchesType && matchesSearch
        }
    }
    
    var featuredResources: [ConsciousnessResource] {
        resources.filter { $0.isFeatured }
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Header
                headerSection
                
                // Search
                searchBar
                
                // Category Filter
                categoryFilter
                
                // Type Filter
                typeFilter
                
                // Featured Section (only when no filters)
                if selectedCategory == nil && selectedType == nil && searchText.isEmpty {
                    featuredSection
                }
                
                // All Resources
                allResourcesSection
                
                // Why Consciousness Matters
                whyConsciousnessMattersSection
                
                // Recommended Learning Path
                learningPathSection
            }
            .padding()
        }
        .background(Color.black.ignoresSafeArea())
        .navigationTitle("Consciousness Hub")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(item: $showingResourceDetail) { resource in
            ResourceDetailView(resource: resource)
        }
    }
    
    // MARK: - Header
    
    private var headerSection: some View {
        VStack(spacing: 12) {
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(
                            colors: [.purple, .blue, .cyan],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 80, height: 80)
                
                Image(systemName: "brain.head.profile")
                    .font(.system(size: 32))
                    .foregroundColor(.white)
            }
            
            Text("SCIENCE OF CONSCIOUSNESS")
                .font(.system(size: 22, weight: .black))
                .foregroundColor(.white)
            
            Text("Curated library of consciousness research")
                .font(.system(size: 13))
                .foregroundColor(.gray)
            
            Text("Your edge in an AI-driven future")
                .font(.system(size: 11))
                .foregroundColor(.cyan)
                .italic()
        }
    }
    
    // MARK: - Search
    
    private var searchBar: some View {
        HStack(spacing: 10) {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            
            TextField("Search talks, books, researchers...", text: $searchText)
                .foregroundColor(.white)
        }
        .padding(12)
        .background(Color.white.opacity(0.1))
        .cornerRadius(12)
    }
    
    // MARK: - Category Filter
    
    private var categoryFilter: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                categoryPill(nil, "All")
                ForEach(ConsciousnessCategory.allCases, id: \.self) { category in
                    categoryPill(category, category.rawValue)
                }
            }
        }
    }
    
    private func categoryPill(_ category: ConsciousnessCategory?, _ title: String) -> some View {
        Button(action: { selectedCategory = category }) {
            HStack(spacing: 4) {
                if let cat = category {
                    Image(systemName: cat.icon)
                        .font(.system(size: 10))
                }
                Text(title)
                    .font(.system(size: 11, weight: .semibold))
            }
            .foregroundColor(selectedCategory == category ? .white : .gray)
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(selectedCategory == category ? (category?.color ?? Color.cyan) : Color.white.opacity(0.1))
            .cornerRadius(20)
        }
    }
    
    // MARK: - Type Filter
    
    private var typeFilter: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                typePill(nil, "All Types")
                ForEach(HubResourceType.allCases, id: \.self) { type in
                    typePill(type, type.rawValue)
                }
            }
        }
    }
    
    private func typePill(_ type: HubResourceType?, _ title: String) -> some View {
        Button(action: { selectedType = type }) {
            HStack(spacing: 4) {
                if let t = type {
                    Image(systemName: t.icon)
                        .font(.system(size: 10))
                }
                Text(title)
                    .font(.system(size: 10, weight: .medium))
            }
            .foregroundColor(selectedType == type ? .white : .gray)
            .padding(.horizontal, 10)
            .padding(.vertical, 6)
            .background(selectedType == type ? (type?.color ?? Color.white.opacity(0.3)) : Color.white.opacity(0.05))
            .cornerRadius(16)
        }
    }
    
    // MARK: - Featured Section
    
    private var featuredSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                Text("ESSENTIAL CONSCIOUSNESS TALKS")
                    .font(.system(size: 12, weight: .black))
                    .foregroundColor(.yellow)
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(featuredResources) { resource in
                        featuredCard(resource)
                    }
                }
            }
        }
    }
    
    private func featuredCard(_ resource: ConsciousnessResource) -> some View {
        Button(action: { showingResourceDetail = resource }) {
            VStack(alignment: .leading, spacing: 8) {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(
                            LinearGradient(
                                colors: [resource.type.color.opacity(0.8), resource.type.color.opacity(0.4)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 160, height: 100)
                    
                    VStack {
                        Image(systemName: resource.thumbnail)
                            .font(.system(size: 32))
                            .foregroundColor(.white)
                        
                        if let views = resource.viewCount {
                            Text(views)
                                .font(.system(size: 9))
                                .foregroundColor(.white.opacity(0.8))
                        }
                    }
                    
                    // Type badge
                    VStack {
                        HStack {
                            Spacer()
                            Text(resource.type.rawValue)
                                .font(.system(size: 8, weight: .bold))
                                .foregroundColor(.white)
                                .padding(.horizontal, 6)
                                .padding(.vertical, 2)
                                .background(Color.black.opacity(0.5))
                                .cornerRadius(4)
                        }
                        Spacer()
                    }
                    .padding(6)
                }
                
                Text(resource.title)
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundColor(.white)
                    .lineLimit(2)
                
                Text(resource.creator)
                    .font(.system(size: 10))
                    .foregroundColor(.gray)
                
                if let duration = resource.duration {
                    HStack(spacing: 4) {
                        Image(systemName: "clock")
                        Text(duration)
                    }
                    .font(.system(size: 9))
                    .foregroundColor(.gray)
                }
            }
            .frame(width: 160)
        }
    }
    
    // MARK: - All Resources
    
    private var allResourcesSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "square.grid.2x2.fill")
                    .foregroundColor(.cyan)
                Text("ALL RESOURCES (\(filteredResources.count))")
                    .font(.system(size: 12, weight: .black))
                    .foregroundColor(.cyan)
            }
            
            if filteredResources.isEmpty {
                Text("No resources match your filters")
                    .font(.system(size: 13))
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity)
                    .padding()
            } else {
                ForEach(filteredResources) { resource in
                    resourceRow(resource)
                }
            }
        }
    }
    
    private func resourceRow(_ resource: ConsciousnessResource) -> some View {
        Button(action: { showingResourceDetail = resource }) {
            HStack(spacing: 12) {
                // Thumbnail
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(resource.type.color.opacity(0.3))
                        .frame(width: 60, height: 60)
                    Image(systemName: resource.thumbnail)
                        .font(.system(size: 24))
                        .foregroundColor(resource.type.color)
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(resource.title)
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundColor(.white)
                        .lineLimit(2)
                    
                    Text(resource.creator)
                        .font(.system(size: 11))
                        .foregroundColor(.gray)
                    
                    HStack(spacing: 8) {
                        // Type badge
                        HStack(spacing: 2) {
                            Image(systemName: resource.type.icon)
                            Text(resource.type.rawValue)
                        }
                        .font(.system(size: 9))
                        .foregroundColor(resource.type.color)
                        
                        // Category badge
                        Text(resource.category.rawValue)
                            .font(.system(size: 9))
                            .foregroundColor(resource.category.color)
                        
                        // Difficulty
                        HStack(spacing: 1) {
                            ForEach(0..<5) { i in
                                Circle()
                                    .fill(i < resource.difficulty ? Color.cyan : Color.white.opacity(0.2))
                                    .frame(width: 4, height: 4)
                            }
                        }
                    }
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
                    .font(.system(size: 12))
            }
            .padding(10)
            .background(Color.white.opacity(0.05))
            .cornerRadius(12)
        }
    }
    
    // MARK: - Why Consciousness Matters
    
    private var whyConsciousnessMattersSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "questionmark.circle.fill")
                    .foregroundColor(.purple)
                Text("WHY CONSCIOUSNESS MATTERS")
                    .font(.system(size: 12, weight: .black))
                    .foregroundColor(.purple)
            }
            
            VStack(alignment: .leading, spacing: 10) {
                whyRow("🧠", "Decision Making", "Consciousness enables adaptive choices beyond autopilot")
                whyRow("😊", "Positive Emotions", "Higher awareness correlates with well-being")
                whyRow("🎯", "Self-Awareness", "Know thyself - the foundation of growth")
                whyRow("🤖", "AI-Proof Skills", "Consciousness is what AI can't replicate")
                whyRow("🔮", "Higher States", "Access intuition, creativity, flow")
                whyRow("🌍", "Collective Evolution", "Individual awakening ripples outward")
            }
        }
        .padding()
        .background(Color.purple.opacity(0.1))
        .cornerRadius(16)
    }
    
    private func whyRow(_ emoji: String, _ title: String, _ desc: String) -> some View {
        HStack(alignment: .top, spacing: 10) {
            Text(emoji)
                .font(.system(size: 20))
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundColor(.white)
                Text(desc)
                    .font(.system(size: 10))
                    .foregroundColor(.gray)
            }
        }
    }
    
    // MARK: - Learning Path
    
    private var learningPathSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "arrow.right.circle.fill")
                    .foregroundColor(.green)
                Text("RECOMMENDED LEARNING PATH")
                    .font(.system(size: 12, weight: .black))
                    .foregroundColor(.green)
            }
            
            VStack(alignment: .leading, spacing: 8) {
                pathStep(1, "Start with Anil Seth's TED Talk", "Understand how brain hallucinates reality")
                pathStep(2, "Read 'Being You' by Anil Seth", "Deep dive into new science of consciousness")
                pathStep(3, "Watch David Chalmers on Hard Problem", "Understand the philosophical questions")
                pathStep(4, "Explore Eckhart Tolle's Presence", "Apply consciousness practically")
                pathStep(5, "Study Hawkins' Map of Consciousness", "Navigate your own evolution")
            }
        }
        .padding()
        .background(Color.green.opacity(0.1))
        .cornerRadius(16)
    }
    
    private func pathStep(_ num: Int, _ title: String, _ desc: String) -> some View {
        HStack(alignment: .top, spacing: 10) {
            ZStack {
                Circle()
                    .fill(Color.green)
                    .frame(width: 24, height: 24)
                Text("\(num)")
                    .font(.system(size: 12, weight: .bold))
                    .foregroundColor(.white)
            }
            
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundColor(.white)
                Text(desc)
                    .font(.system(size: 10))
                    .foregroundColor(.gray)
            }
        }
    }
}

// MARK: - Resource Detail View

struct ResourceDetailView: View {
    let resource: ConsciousnessResource
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    // Hero
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .fill(
                                LinearGradient(
                                    colors: [resource.type.color, resource.type.color.opacity(0.5)],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .frame(height: 180)
                        
                        VStack {
                            Image(systemName: resource.thumbnail)
                                .font(.system(size: 50))
                                .foregroundColor(.white)
                            
                            if let views = resource.viewCount {
                                Text(views)
                                    .font(.system(size: 12))
                                    .foregroundColor(.white.opacity(0.8))
                            }
                        }
                    }
                    
                    // Title & Creator
                    VStack(spacing: 6) {
                        Text(resource.title)
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                        
                        Text(resource.creator)
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                    }
                    
                    // Badges
                    HStack(spacing: 12) {
                        badge(resource.type.icon, resource.type.rawValue, resource.type.color)
                        badge(resource.category.icon, resource.category.rawValue, resource.category.color)
                        if let duration = resource.duration {
                            badge("clock", duration, .gray)
                        }
                    }
                    
                    // Description
                    VStack(alignment: .leading, spacing: 8) {
                        Text("About")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(.white)
                        Text(resource.description)
                            .font(.system(size: 13))
                            .foregroundColor(.gray)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    // Key Insights
                    if !resource.keyInsights.isEmpty {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Key Insights")
                                .font(.system(size: 14, weight: .bold))
                                .foregroundColor(.cyan)
                            
                            ForEach(resource.keyInsights, id: \.self) { insight in
                                HStack(alignment: .top, spacing: 8) {
                                    Image(systemName: "lightbulb.fill")
                                        .foregroundColor(.yellow)
                                        .font(.system(size: 10))
                                    Text(insight)
                                        .font(.system(size: 12))
                                        .foregroundColor(.white.opacity(0.9))
                                }
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(Color.cyan.opacity(0.1))
                        .cornerRadius(12)
                    }
                    
                    // Watch/Read Button
                    Link(destination: URL(string: resource.url) ?? URL(string: "https://ted.com")!) {
                        HStack {
                            Image(systemName: resource.type == .book ? "book.fill" : "play.fill")
                            Text(resource.type == .book ? "Find This Book" : "Watch Now")
                                .font(.system(size: 16, weight: .bold))
                        }
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(resource.type.color)
                        .cornerRadius(12)
                    }
                }
                .padding()
            }
            .background(Color.black.ignoresSafeArea())
            .navigationTitle(resource.type.rawValue)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") { dismiss() }
                }
            }
        }
    }
    
    private func badge(_ icon: String, _ text: String, _ color: Color) -> some View {
        HStack(spacing: 4) {
            Image(systemName: icon)
            Text(text)
        }
        .font(.system(size: 10, weight: .semibold))
        .foregroundColor(color)
        .padding(.horizontal, 10)
        .padding(.vertical, 6)
        .background(color.opacity(0.2))
        .cornerRadius(12)
    }
}

// MARK: - Consciousness Library

struct ConsciousnessLibrary {
    
    static let allResources: [ConsciousnessResource] = tedTalks + youtubeChannels + books + researchers + podcasts
    
    // MARK: - TED Talks
    
    static let tedTalks: [ConsciousnessResource] = [
        // Featured TED Talks
        ConsciousnessResource(
            title: "Your Brain Hallucinates Your Conscious Reality",
            creator: "Anil Seth",
            type: .tedTalk,
            category: .neuroscience,
            description: "Right now, billions of neurons in your brain are working together to generate a conscious experience—and not just any experience, your experience of the world around you and of yourself within it. How does this happen? According to neuroscientist Anil Seth, we're all hallucinating all the time; when we agree about our hallucinations, we call it 'reality.'",
            keyInsights: [
                "Consciousness is a controlled hallucination",
                "The brain is a prediction engine",
                "We don't perceive reality, we construct it",
                "The self is also a hallucination"
            ],
            duration: "17 min",
            url: "https://www.ted.com/talks/anil_seth_your_brain_hallucinates_your_conscious_reality",
            thumbnail: "brain.head.profile",
            difficulty: 3,
            viewCount: "16M+ views",
            isFeatured: true
        ),
        
        ConsciousnessResource(
            title: "How Do You Explain Consciousness?",
            creator: "David Chalmers",
            type: .tedTalk,
            category: .philosophy,
            description: "Our consciousness is a fundamental aspect of our existence, says philosopher David Chalmers: 'There's nothing we know about more directly… but at the same time it's the most mysterious phenomenon in the universe.' He explores the 'hard problem of consciousness' - explaining subjective experience.",
            keyInsights: [
                "The 'hard problem' distinguishes experience from function",
                "Consciousness may be fundamental like space/time",
                "Panpsychism: consciousness as universal property",
                "We need new paradigms beyond reductionism"
            ],
            duration: "18 min",
            url: "https://www.ted.com/talks/david_chalmers_how_do_you_explain_consciousness",
            thumbnail: "questionmark.circle.fill",
            difficulty: 4,
            viewCount: "8M+ views",
            isFeatured: true
        ),
        
        ConsciousnessResource(
            title: "The Quest to Understand Consciousness",
            creator: "Antonio Damasio",
            type: .tedTalk,
            category: .neuroscience,
            description: "Every morning we wake up and regain consciousness — that is a marvelous fact — but what exactly is it that we regain? Neuroscientist Antonio Damasio uses this simple question to give us a glimpse into how our brains create our sense of self.",
            keyInsights: [
                "Consciousness requires a self to experience",
                "The brainstem is crucial for consciousness",
                "Mind and body are deeply interconnected",
                "Feelings are the bedrock of consciousness"
            ],
            duration: "19 min",
            url: "https://www.ted.com/talks/antonio_damasio_the_quest_to_understand_consciousness",
            thumbnail: "figure.mind.and.body",
            difficulty: 3,
            viewCount: "4M+ views",
            isFeatured: true
        ),
        
        ConsciousnessResource(
            title: "The Illusion of Consciousness",
            creator: "Dan Dennett",
            type: .tedTalk,
            category: .philosophy,
            description: "Philosopher Dan Dennett makes a compelling argument that not only don't we understand our own consciousness, but that half the time our brains are actively deceiving us.",
            keyInsights: [
                "Our sense of consciousness may be an illusion",
                "The brain deceives us about our experience",
                "Consciousness evolved as a useful fiction",
                "We overestimate our access to our minds"
            ],
            duration: "21 min",
            url: "https://www.ted.com/talks/dan_dennett_the_illusion_of_consciousness",
            thumbnail: "eye.slash.fill",
            difficulty: 4,
            viewCount: "5M+ views",
            isFeatured: false
        ),
        
        ConsciousnessResource(
            title: "Consciousness is a Mathematical Pattern",
            creator: "Max Tegmark",
            type: .tedTalk,
            category: .physics,
            description: "MIT physicist Max Tegmark proposes that consciousness is a state of matter, like gas or liquid, with specific mathematical properties. He argues consciousness could emerge from complex information processing patterns.",
            keyInsights: [
                "Consciousness may be a mathematical structure",
                "Information integration creates experience",
                "Physics can describe consciousness",
                "AI could potentially be conscious"
            ],
            duration: "14 min",
            url: "https://www.ted.com/talks/max_tegmark_consciousness_is_a_mathematical_pattern",
            thumbnail: "function",
            difficulty: 5,
            viewCount: "2M+ views",
            isFeatured: false
        ),
        
        ConsciousnessResource(
            title: "My Stroke of Insight",
            creator: "Jill Bolte Taylor",
            type: .tedTalk,
            category: .neuroscience,
            description: "Brain researcher Jill Bolte Taylor studied her own stroke as it happened - and has become a powerful voice for brain recovery. In this profound talk, she describes experiencing nirvana when her left brain shut down.",
            keyInsights: [
                "Right brain experiences interconnectedness",
                "Left brain creates separation/ego",
                "Stroke revealed two distinct consciousnesses",
                "We can choose which brain to engage"
            ],
            duration: "18 min",
            url: "https://www.ted.com/talks/jill_bolte_taylor_my_stroke_of_insight",
            thumbnail: "brain",
            difficulty: 2,
            viewCount: "28M+ views",
            isFeatured: true
        ),
        
        ConsciousnessResource(
            title: "What Hallucination Reveals About Our Minds",
            creator: "Oliver Sacks",
            type: .tedTalk,
            category: .neuroscience,
            description: "Neurologist Oliver Sacks brings our attention to Charles Bonnet syndrome - when visually impaired people experience lucid hallucinations. He describes the experiences his patients have had, illuminating the brain's capacity to generate conscious experience.",
            keyInsights: [
                "The brain generates experience actively",
                "Hallucinations reveal brain's creative power",
                "Specific brain regions create specific experiences",
                "Normal consciousness is also brain-generated"
            ],
            duration: "18 min",
            url: "https://www.ted.com/talks/oliver_sacks_what_hallucination_reveals_about_our_minds",
            thumbnail: "eye.trianglebadge.exclamationmark",
            difficulty: 2,
            viewCount: "5M+ views",
            isFeatured: false
        ),
        
        ConsciousnessResource(
            title: "Being You: A New Science of Consciousness",
            creator: "Anil Seth",
            type: .tedTalk,
            category: .neuroscience,
            description: "Who are you, really? Neuroscientist Anil Seth lays out his fascinating new theory of consciousness and self, centered on the notion that we 'predict' the world into existence. From sleep to memory and everything in between.",
            keyInsights: [
                "The self is a prediction, not a perception",
                "Consciousness exists on a spectrum",
                "Being you is a controlled hallucination",
                "Understanding consciousness transforms life"
            ],
            duration: "52 min",
            url: "https://www.ted.com/talks/anil_seth_being_you_a_new_science_of_consciousness",
            thumbnail: "person.fill.questionmark",
            difficulty: 4,
            viewCount: "2M+ views",
            isFeatured: false
        ),
        
        ConsciousnessResource(
            title: "Consciousness - The Final Frontier",
            creator: "Dada Gunamuktananda",
            type: .tedTalk,
            category: .spirituality,
            description: "In this provocative talk, Dada Gunamuktananda presents consciousness as the essence of the universe, arguing that mind is not a byproduct of matter, but the foundation of reality itself.",
            keyInsights: [
                "Consciousness may be primary, not matter",
                "Ancient yogic science anticipated quantum physics",
                "Meditation is the tool to explore consciousness",
                "We are consciousness expressing itself"
            ],
            duration: "15 min",
            url: "https://www.youtube.com/watch?v=lo0X2ZdElQ4",
            thumbnail: "sparkles",
            difficulty: 3,
            viewCount: "4M+ views",
            isFeatured: false
        )
    ]
    
    // MARK: - YouTube Channels
    
    static let youtubeChannels: [ConsciousnessResource] = [
        ConsciousnessResource(
            title: "Eckhart Tolle Official Channel",
            creator: "Eckhart Tolle",
            type: .youtube,
            category: .spirituality,
            description: "Eckhart Tolle is widely recognized as one of the most original and inspiring spiritual teachers of our time. His teachings focus on the power of presence and living in the now.",
            keyInsights: [
                "The ego is the source of suffering",
                "Presence is the key to peace",
                "Pain-body recognition transforms reactions",
                "Consciousness evolves through individuals"
            ],
            duration: nil,
            url: "https://www.youtube.com/@EckhartTolle",
            thumbnail: "sun.max.fill",
            difficulty: 2,
            viewCount: "2.5M subs",
            isFeatured: true
        ),
        
        ConsciousnessResource(
            title: "Sadhguru Official",
            creator: "Sadhguru",
            type: .youtube,
            category: .spirituality,
            description: "Sadhguru, a yogi, mystic and visionary, offers profound spiritual teachings with humor and practical wisdom. His channel covers inner transformation, yoga, and modern life.",
            keyInsights: [
                "Inner engineering for outer success",
                "Yoga is technology for transformation",
                "Consciousness is the ultimate frontier",
                "Balance eastern wisdom with modern life"
            ],
            duration: nil,
            url: "https://www.youtube.com/@sadhguru",
            thumbnail: "figure.yoga",
            difficulty: 2,
            viewCount: "13M subs",
            isFeatured: true
        ),
        
        ConsciousnessResource(
            title: "Actualized.org",
            creator: "Leo Gura",
            type: .youtube,
            category: .awakening,
            description: "Deep philosophical and consciousness explorations. Leo Gura covers topics like self-actualization, enlightenment, psychedelics, and understanding reality at the deepest levels.",
            keyInsights: [
                "Reality is stranger than you think",
                "Ego death reveals true nature",
                "Spiral dynamics explains worldviews",
                "Direct experience trumps belief"
            ],
            duration: nil,
            url: "https://www.youtube.com/@ActualizedOrg",
            thumbnail: "infinity",
            difficulty: 5,
            viewCount: "1.6M subs",
            isFeatured: true
        ),
        
        ConsciousnessResource(
            title: "Alan Watts Organization",
            creator: "Alan Watts",
            type: .youtube,
            category: .philosophy,
            description: "Alan Watts was a British philosopher known for interpreting Eastern philosophy for Western audiences. His lectures on Zen, consciousness, and the nature of reality remain timeless.",
            keyInsights: [
                "You are the universe experiencing itself",
                "The ego is a social fiction",
                "Let go and life flows",
                "The real you is eternal"
            ],
            duration: nil,
            url: "https://www.youtube.com/@AlanWattsOrg",
            thumbnail: "circle.dashed",
            difficulty: 3,
            viewCount: "900K subs",
            isFeatured: true
        ),
        
        ConsciousnessResource(
            title: "Rupert Spira",
            creator: "Rupert Spira",
            type: .youtube,
            category: .spirituality,
            description: "Rupert Spira is a teacher of non-dual awareness. His approach is contemporary and direct, focusing on the recognition of our true nature as pure awareness.",
            keyInsights: [
                "You are awareness, not its contents",
                "Suffering points to mistaken identity",
                "Happiness is your nature",
                "Separation is an illusion"
            ],
            duration: nil,
            url: "https://www.youtube.com/@RupertSpira",
            thumbnail: "water.waves",
            difficulty: 4,
            viewCount: "500K subs",
            isFeatured: false
        ),
        
        ConsciousnessResource(
            title: "Aaron Doughty",
            creator: "Aaron Doughty",
            type: .youtube,
            category: .awakening,
            description: "Aaron Doughty focuses on raising consciousness, manifestation, and understanding reality. His content is practical and accessible for spiritual beginners.",
            keyInsights: [
                "Raise your vibration intentionally",
                "Beliefs create reality",
                "Shadow work unlocks potential",
                "Consciousness is shifting globally"
            ],
            duration: nil,
            url: "https://www.youtube.com/@AaronDoughty",
            thumbnail: "arrow.up.circle.fill",
            difficulty: 2,
            viewCount: "1.3M subs",
            isFeatured: false
        ),
        
        ConsciousnessResource(
            title: "Teal Swan",
            creator: "Teal Swan",
            type: .youtube,
            category: .psychology,
            description: "Teal Swan offers teachings on emotional healing, shadow work, and spiritual growth. Known for her direct approach to addressing trauma and unconscious patterns.",
            keyInsights: [
                "Trauma creates unconscious patterns",
                "Integration heals fragmented parts",
                "Authenticity requires shadow work",
                "Relationships mirror inner state"
            ],
            duration: nil,
            url: "https://www.youtube.com/@TheSpiritualCatalyst",
            thumbnail: "heart.fill",
            difficulty: 3,
            viewCount: "1.3M subs",
            isFeatured: false
        ),
        
        ConsciousnessResource(
            title: "Dr. Joe Dispenza",
            creator: "Dr. Joe Dispenza",
            type: .youtube,
            category: .neuroscience,
            description: "Dr. Joe Dispenza combines neuroscience, epigenetics, and quantum physics to explain how thoughts change brain and body. His meditations have helped millions.",
            keyInsights: [
                "Thoughts chemically change the body",
                "Meditation rewires the brain",
                "You can heal through consciousness",
                "Future memories create new realities"
            ],
            duration: nil,
            url: "https://www.youtube.com/@drjoedispenza",
            thumbnail: "brain.head.profile",
            difficulty: 3,
            viewCount: "1M subs",
            isFeatured: false
        ),
        
        ConsciousnessResource(
            title: "Theories of Everything",
            creator: "Curt Jaimungal",
            type: .youtube,
            category: .physics,
            description: "In-depth interviews with physicists, mathematicians, and philosophers exploring consciousness, physics, and the nature of reality at the highest intellectual level.",
            keyInsights: [
                "Physics approaches consciousness",
                "Mathematics underlies reality",
                "Multiple theories compete",
                "Consciousness remains mysterious"
            ],
            duration: nil,
            url: "https://www.youtube.com/@TheoriesOfEverything",
            thumbnail: "atom",
            difficulty: 5,
            viewCount: "400K subs",
            isFeatured: false
        )
    ]
    
    // MARK: - Books
    
    static let books: [ConsciousnessResource] = [
        ConsciousnessResource(
            title: "Being You: A New Science of Consciousness",
            creator: "Anil Seth",
            type: .book,
            category: .neuroscience,
            description: "A groundbreaking exploration of consciousness from one of the world's leading neuroscientists. Seth presents the idea that we don't perceive reality but predict it into existence.",
            keyInsights: [
                "Perception is controlled hallucination",
                "The beast machine theory of consciousness",
                "Self as predictive model",
                "New framework for understanding awareness"
            ],
            duration: "352 pages",
            url: "https://www.amazon.com/Being-You-Science-Consciousness/dp/0593238168",
            thumbnail: "book.fill",
            difficulty: 4,
            viewCount: "NYT Bestseller",
            isFeatured: true
        ),
        
        ConsciousnessResource(
            title: "The Map of Consciousness Explained",
            creator: "David R. Hawkins",
            type: .book,
            category: .spirituality,
            description: "Dr. Hawkins' famous Map of Consciousness, a logarithmic scale from 0-1000 charting human consciousness from shame to enlightenment. A practical tool for understanding emotional and spiritual evolution.",
            keyInsights: [
                "Consciousness exists on a measurable scale",
                "Below 200 is destructive, above is constructive",
                "Each level has distinct characteristics",
                "You can evolve through awareness"
            ],
            duration: "400 pages",
            url: "https://www.amazon.com/Map-Consciousness-Explained-Actualize-Potential/dp/1401959644",
            thumbnail: "map.fill",
            difficulty: 3,
            viewCount: "Bestseller",
            isFeatured: true
        ),
        
        ConsciousnessResource(
            title: "The Power of Now",
            creator: "Eckhart Tolle",
            type: .book,
            category: .spirituality,
            description: "The seminal guide to spiritual enlightenment that has transformed millions of lives. Tolle teaches how to quiet the mind and live fully in the present moment.",
            keyInsights: [
                "The present moment is all we have",
                "Ego is the source of suffering",
                "Pain-body creates unconscious reactions",
                "Presence dissolves problems"
            ],
            duration: "236 pages",
            url: "https://www.amazon.com/Power-Now-Guide-Spiritual-Enlightenment/dp/1577314808",
            thumbnail: "clock.fill",
            difficulty: 2,
            viewCount: "5M+ copies",
            isFeatured: true
        ),
        
        ConsciousnessResource(
            title: "A New Earth",
            creator: "Eckhart Tolle",
            type: .book,
            category: .spirituality,
            description: "Tolle's follow-up masterpiece exploring the evolution of human consciousness and how awakening from ego can save humanity and the planet.",
            keyInsights: [
                "Humanity is at a crossroads",
                "Ego dysfunction creates suffering",
                "A new consciousness is emerging",
                "Awakening is our collective destiny"
            ],
            duration: "336 pages",
            url: "https://www.amazon.com/New-Earth-Awakening-Purpose-Selection/dp/0452289963",
            thumbnail: "globe.americas.fill",
            difficulty: 2,
            viewCount: "Oprah's Book Club",
            isFeatured: false
        ),
        
        ConsciousnessResource(
            title: "The Conscious Mind",
            creator: "David Chalmers",
            type: .book,
            category: .philosophy,
            description: "The definitive philosophical exploration of the 'hard problem' of consciousness - why we have subjective experience at all. A landmark in consciousness studies.",
            keyInsights: [
                "The hard problem vs easy problems",
                "Consciousness may be fundamental",
                "Zombies thought experiment",
                "Naturalistic dualism proposed"
            ],
            duration: "432 pages",
            url: "https://www.amazon.com/Conscious-Mind-Search-Fundamental-Philosophy/dp/0195117891",
            thumbnail: "questionmark.app.fill",
            difficulty: 5,
            viewCount: "Academic Classic",
            isFeatured: false
        ),
        
        ConsciousnessResource(
            title: "Waking Up",
            creator: "Sam Harris",
            type: .book,
            category: .meditation,
            description: "A rational, scientific approach to spirituality and meditation. Harris explores how one can pursue spiritual experiences without religious dogma.",
            keyInsights: [
                "Spirituality without religion is possible",
                "The self is an illusion",
                "Meditation reveals truth directly",
                "Consciousness is the ultimate mystery"
            ],
            duration: "256 pages",
            url: "https://www.amazon.com/Waking-Up-Spirituality-Without-Religion/dp/1451636024",
            thumbnail: "sunrise.fill",
            difficulty: 3,
            viewCount: "NYT Bestseller",
            isFeatured: false
        ),
        
        ConsciousnessResource(
            title: "Why Buddhism is True",
            creator: "Robert Wright",
            type: .book,
            category: .psychology,
            description: "An evolutionary psychology perspective on Buddhist insights about the mind. Wright shows how meditation and Buddhist philosophy align with modern science.",
            keyInsights: [
                "Natural selection shaped our suffering",
                "Buddhist insights are scientifically valid",
                "Meditation reveals mind's illusions",
                "Liberation is possible through practice"
            ],
            duration: "336 pages",
            url: "https://www.amazon.com/Why-Buddhism-True-Philosophy-Enlightenment/dp/1439195463",
            thumbnail: "leaf.fill",
            difficulty: 3,
            viewCount: "Bestseller",
            isFeatured: false
        )
    ]
    
    // MARK: - Researchers
    
    static let researchers: [ConsciousnessResource] = [
        ConsciousnessResource(
            title: "Anil Seth, PhD",
            creator: "University of Sussex",
            type: .researcher,
            category: .neuroscience,
            description: "Professor of Cognitive and Computational Neuroscience and Director of the Centre for Consciousness Science. Pioneer of the 'controlled hallucination' theory of consciousness.",
            keyInsights: [
                "Perception as prediction",
                "Beast machine theory",
                "Interoception and consciousness",
                "Bridging science and philosophy"
            ],
            duration: nil,
            url: "https://www.anilseth.com",
            thumbnail: "person.crop.circle.fill.badge.checkmark",
            difficulty: 4,
            viewCount: "Top Global Thinker",
            isFeatured: false
        ),
        
        ConsciousnessResource(
            title: "David Chalmers, PhD",
            creator: "NYU",
            type: .researcher,
            category: .philosophy,
            description: "Distinguished Professor of Philosophy, known for formulating the 'hard problem of consciousness' and his work on the philosophy of mind.",
            keyInsights: [
                "Hard problem of consciousness",
                "Panpsychism advocate",
                "Virtual reality philosophy",
                "Extended mind thesis"
            ],
            duration: nil,
            url: "https://consc.net",
            thumbnail: "person.crop.circle.fill.badge.checkmark",
            difficulty: 5,
            viewCount: "Leading Philosopher",
            isFeatured: false
        ),
        
        ConsciousnessResource(
            title: "Giulio Tononi, MD/PhD",
            creator: "University of Wisconsin",
            type: .researcher,
            category: .neuroscience,
            description: "Creator of Integrated Information Theory (IIT), one of the leading scientific theories of consciousness. His work attempts to mathematically quantify consciousness.",
            keyInsights: [
                "Consciousness = integrated information (Phi)",
                "IIT provides mathematical framework",
                "Explains why some systems are conscious",
                "Consciousness can be measured"
            ],
            duration: nil,
            url: "https://www.iit.it",
            thumbnail: "person.crop.circle.fill.badge.checkmark",
            difficulty: 5,
            viewCount: "IIT Pioneer",
            isFeatured: false
        ),
        
        ConsciousnessResource(
            title: "Christof Koch, PhD",
            creator: "Allen Institute",
            type: .researcher,
            category: .neuroscience,
            description: "Chief Scientist at the Allen Institute for Brain Science. Pioneer in neural correlates of consciousness research and collaborator with Francis Crick.",
            keyInsights: [
                "Neural correlates of consciousness",
                "Claustrum as consciousness substrate",
                "IIT contributor",
                "Consciousness in AI debate"
            ],
            duration: nil,
            url: "https://alleninstitute.org",
            thumbnail: "person.crop.circle.fill.badge.checkmark",
            difficulty: 4,
            viewCount: "Neuroscience Leader",
            isFeatured: false
        )
    ]
    
    // MARK: - Podcasts
    
    static let podcasts: [ConsciousnessResource] = [
        ConsciousnessResource(
            title: "Making Sense",
            creator: "Sam Harris",
            type: .podcast,
            category: .philosophy,
            description: "Sam Harris explores questions about the human mind, consciousness, meditation, AI, and the nature of reality through conversations with leading thinkers.",
            keyInsights: [
                "Rigorous approach to consciousness",
                "Interviews top scientists and philosophers",
                "Meditation and neuroscience",
                "AI and consciousness ethics"
            ],
            duration: nil,
            url: "https://www.samharris.org/podcasts",
            thumbnail: "headphones",
            difficulty: 4,
            viewCount: "Top 10 Podcast",
            isFeatured: false
        ),
        
        ConsciousnessResource(
            title: "On Being",
            creator: "Krista Tippett",
            type: .podcast,
            category: .spirituality,
            description: "Deep conversations about the big questions of meaning, faith, ethics, and ideas at the center of human life. Features poets, scientists, and spiritual teachers.",
            keyInsights: [
                "Wisdom from diverse traditions",
                "Poetry and consciousness",
                "Science meets spirituality",
                "Healing through dialogue"
            ],
            duration: nil,
            url: "https://onbeing.org",
            thumbnail: "headphones",
            difficulty: 2,
            viewCount: "Award-Winning",
            isFeatured: false
        )
    ]
}

#Preview {
    NavigationStack {
        ScienceOfConsciousnessHubView()
    }
}
