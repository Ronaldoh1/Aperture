// IndependentMediaGuide.swift
// The truth-tellers outside the corporate system
// Independent journalists doing real work

import SwiftUI

struct IndependentMediaGuide: View {
    
    @State private var selectedCategory: IndieMediaCategory = .all
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Header
                headerSection
                
                // Why independent media matters
                whyItMatters
                
                // Category filter
                categoryPicker
                
                // Outlets and journalists
                mediaList
                
                // How to support
                supportSection
                
                // Warning about grifters
                warningSection
            }
            .padding()
        }
        .background(Color.black.ignoresSafeArea())
        .navigationTitle("Independent Media")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    // MARK: - Header
    
    private var headerSection: some View {
        VStack(spacing: 16) {
            ZStack {
                Circle()
                    .fill(Color.green.opacity(0.2))
                    .frame(width: 100, height: 100)
                
                Image(systemName: "antenna.radiowaves.left.and.right")
                    .font(.system(size: 44))
                    .foregroundColor(.green)
            }
            
            Text("Independent Media")
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.white)
            
            Text("Journalism without corporate masters")
                .font(.system(size: 14))
                .foregroundColor(.gray)
        }
    }
    
    // MARK: - Why It Matters
    
    private var whyItMatters: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                Text("Why Independent Media Matters")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.white)
            }
            
            Text("Independent journalists aren't beholden to corporate advertisers or billionaire owners. They can cover stories the mainstream won't touch, challenge power without fear of losing their jobs, and represent perspectives excluded from corporate media.")
                .font(.system(size: 13))
                .foregroundColor(.white.opacity(0.8))
            
            HStack(spacing: 16) {
                benefitBubble("No corporate\nowners", "building.2")
                benefitBubble("No advertiser\npressure", "dollarsign.circle")
                benefitBubble("Accountable to\naudience", "person.3")
            }
        }
        .padding()
        .background(Color.green.opacity(0.1))
        .cornerRadius(16)
    }
    
    private func benefitBubble(_ text: String, _ icon: String) -> some View {
        VStack(spacing: 8) {
            Image(systemName: icon)
                .font(.system(size: 20))
                .foregroundColor(.green)
            Text(text)
                .font(.system(size: 10))
                .foregroundColor(.white.opacity(0.8))
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
    }
    
    // MARK: - Category Picker
    
    private var categoryPicker: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(IndieMediaCategory.allCases, id: \.self) { category in
                    Button(action: {
                        HapticManager.shared.light()
                        withAnimation { selectedCategory = category }
                    }) {
                        Text(category.rawValue)
                            .font(.system(size: 13, weight: .medium))
                            .foregroundColor(selectedCategory == category ? .black : .white)
                            .padding(.horizontal, 14)
                            .padding(.vertical, 8)
                            .background(selectedCategory == category ? Color.green : Color.white.opacity(0.1))
                            .cornerRadius(20)
                    }
                }
            }
        }
    }
    
    // MARK: - Media List
    
    private var mediaList: some View {
        VStack(spacing: 16) {
            ForEach(filteredMedia, id: \.name) { outlet in
                indieMediaCard(outlet)
            }
        }
    }
    
    private var filteredMedia: [IndieMediaOutlet] {
        if selectedCategory == .all {
            return allIndieMedia
        }
        return allIndieMedia.filter { $0.category == selectedCategory }
    }
    
    private func indieMediaCard(_ outlet: IndieMediaOutlet) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(outlet.name)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.white)
                    
                    HStack(spacing: 8) {
                        Text(outlet.format)
                            .font(.system(size: 11))
                            .foregroundColor(.gray)
                        
                        if let perspective = outlet.perspective {
                            Text(perspective)
                                .font(.system(size: 10, weight: .medium))
                                .foregroundColor(perspectiveColor(perspective))
                                .padding(.horizontal, 6)
                                .padding(.vertical, 2)
                                .background(perspectiveColor(perspective).opacity(0.2))
                                .cornerRadius(4)
                        }
                    }
                }
                
                Spacer()
                
                // Trust indicator
                VStack(spacing: 2) {
                    Image(systemName: outlet.trustLevel == .high ? "checkmark.shield.fill" : "shield.fill")
                        .foregroundColor(outlet.trustLevel == .high ? .green : .yellow)
                    Text(outlet.trustLevel.rawValue)
                        .font(.system(size: 9))
                        .foregroundColor(.gray)
                }
            }
            
            Text(outlet.description)
                .font(.system(size: 13))
                .foregroundColor(.white.opacity(0.8))
                .lineLimit(3)
            
            // Known for
            if !outlet.knownFor.isEmpty {
                HStack(spacing: 6) {
                    ForEach(outlet.knownFor.prefix(3), id: \.self) { topic in
                        Text(topic)
                            .font(.system(size: 10))
                            .foregroundColor(.green)
                            .padding(.horizontal, 6)
                            .padding(.vertical, 3)
                            .background(Color.green.opacity(0.2))
                            .cornerRadius(4)
                    }
                }
            }
            
            // Link
            if let url = outlet.url {
                Button(action: {
                    if let link = URL(string: url) {
                        UIApplication.shared.open(link)
                    }
                }) {
                    HStack {
                        Text("Visit")
                        Image(systemName: "arrow.up.right")
                            .font(.system(size: 10))
                    }
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(.green)
                }
            }
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(12)
    }
    
    private func perspectiveColor(_ perspective: String) -> Color {
        switch perspective.lowercased() {
        case "left", "progressive": return .blue
        case "right", "conservative": return .red
        case "libertarian": return .orange
        case "nonpartisan": return .purple
        default: return .gray
        }
    }
    
    // MARK: - Support Section
    
    private var supportSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "heart.fill")
                    .foregroundColor(.red)
                Text("How to Support Independent Media")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.white)
            }
            
            VStack(alignment: .leading, spacing: 8) {
                supportRow("Subscribe", "Even $5/month helps sustain journalism")
                supportRow("Share", "Amplify their work on social media")
                supportRow("Patreon/Substack", "Many journalists are reader-supported")
                supportRow("Turn off ad blockers", "If you won't pay, at least let ads run")
                supportRow("Donate", "One-time donations matter")
            }
        }
        .padding()
        .background(Color.red.opacity(0.1))
        .cornerRadius(16)
    }
    
    private func supportRow(_ title: String, _ desc: String) -> some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: "checkmark.circle.fill")
                .foregroundColor(.green)
                .font(.system(size: 14))
            
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
    
    // MARK: - Warning
    
    private var warningSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: "exclamationmark.triangle.fill")
                    .foregroundColor(.yellow)
                Text("Beware of Grifters")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.yellow)
            }
            
            Text("Not everyone claiming to be 'independent' is trustworthy. Watch out for:")
                .font(.system(size: 13))
                .foregroundColor(.white.opacity(0.8))
            
            VStack(alignment: .leading, spacing: 6) {
                warningRow("Those who never criticize 'their side'")
                warningRow("Conspiracy theories without evidence")
                warningRow("Constant rage-bait and outrage farming")
                warningRow("Promoting products/supplements aggressively")
                warningRow("'Alternative facts' that are just lies")
                warningRow("Claiming mainstream medicine/science is all lies")
            }
            
            Text("Independence ≠ Truth. Apply the same skepticism to all sources.")
                .font(.system(size: 12, weight: .medium))
                .foregroundColor(.orange)
        }
        .padding()
        .background(Color.yellow.opacity(0.1))
        .cornerRadius(16)
    }
    
    private func warningRow(_ text: String) -> some View {
        HStack(spacing: 8) {
            Image(systemName: "xmark.circle.fill")
                .foregroundColor(.red)
                .font(.system(size: 12))
            Text(text)
                .font(.system(size: 12))
                .foregroundColor(.white.opacity(0.8))
        }
    }
    
    // MARK: - Data
    
    private var allIndieMedia: [IndieMediaOutlet] {
        [
            // Nonprofit Investigative
            IndieMediaOutlet(
                name: "ProPublica",
                format: "Nonprofit Investigative",
                category: .investigative,
                description: "Pulitzer Prize-winning investigative journalism. Exposed Trump's tax returns, Supreme Court ethics scandals, PPP loan fraud. Free to read, funded by donations.",
                knownFor: ["Investigations", "Data journalism", "Accountability"],
                perspective: "Nonpartisan",
                trustLevel: .high,
                url: "https://propublica.org"
            ),
            IndieMediaOutlet(
                name: "The Intercept",
                format: "Online News",
                category: .investigative,
                description: "Founded on Snowden documents. Covers national security, civil liberties, criminal justice. Strong investigative work with progressive perspective.",
                knownFor: ["Surveillance", "War crimes", "Civil liberties"],
                perspective: "Left",
                trustLevel: .high,
                url: "https://theintercept.com"
            ),
            IndieMediaOutlet(
                name: "Reveal (CIR)",
                format: "Podcast + Articles",
                category: .investigative,
                description: "Center for Investigative Reporting. Award-winning podcast and investigations into corporate abuse, government failures, systemic injustice.",
                knownFor: ["Podcasts", "Deep investigations", "Corporate accountability"],
                perspective: "Nonpartisan",
                trustLevel: .high,
                url: "https://revealnews.org"
            ),
            
            // Independent Journalists (Substack, etc.)
            IndieMediaOutlet(
                name: "Matt Taibbi",
                format: "Substack",
                category: .journalists,
                description: "Former Rolling Stone journalist. Covers media criticism, Wall Street, and government overreach. Sometimes controversial but does original reporting.",
                knownFor: ["Twitter Files", "Wall Street", "Media criticism"],
                perspective: "Libertarian",
                trustLevel: .medium,
                url: "https://taibbi.substack.com"
            ),
            IndieMediaOutlet(
                name: "Judd Legum (Popular Information)",
                format: "Substack",
                category: .journalists,
                description: "Accountability journalism focused on corporate political donations and hypocrisy. Broke stories on companies backing insurrectionists.",
                knownFor: ["Corporate donations", "Accountability", "Political money"],
                perspective: "Progressive",
                trustLevel: .high,
                url: "https://popular.info"
            ),
            IndieMediaOutlet(
                name: "Heather Cox Richardson",
                format: "Substack",
                category: .journalists,
                description: "Boston College historian providing daily context on American politics and history. 'Letters from an American' has huge following.",
                knownFor: ["Historical context", "Daily analysis", "American history"],
                perspective: "Progressive",
                trustLevel: .high,
                url: "https://heathercoxrichardson.substack.com"
            ),
            IndieMediaOutlet(
                name: "Caitlin Johnstone",
                format: "Substack",
                category: .journalists,
                description: "Australian independent journalist covering anti-war, anti-imperialist perspectives. Critical of US foreign policy from the left.",
                knownFor: ["Anti-war", "US foreign policy", "Media criticism"],
                perspective: "Left",
                trustLevel: .medium,
                url: "https://caitlinjohnstone.substack.com"
            ),
            
            // Video/YouTube
            IndieMediaOutlet(
                name: "Breaking Points",
                format: "YouTube/Podcast",
                category: .video,
                description: "Krystal Ball (left) and Saagar Enjeti (right) provide cross-partisan analysis. Left populist + right populist perspectives together.",
                knownFor: ["Cross-partisan", "Anti-establishment", "Daily news"],
                perspective: "Populist (both)",
                trustLevel: .medium,
                url: "https://breakingpoints.com"
            ),
            IndieMediaOutlet(
                name: "Democracy Now!",
                format: "Video/Radio",
                category: .video,
                description: "Daily independent news program since 1996. Amy Goodman. Covers movements, war, climate, labor—stories corporate media ignores.",
                knownFor: ["Movements", "International", "Labor", "Climate"],
                perspective: "Progressive",
                trustLevel: .high,
                url: "https://democracynow.org"
            ),
            IndieMediaOutlet(
                name: "The Majority Report",
                format: "YouTube/Podcast",
                category: .video,
                description: "Sam Seder's daily political show. Progressive analysis with humor. Emma Vigeland. Covers politics, labor, media.",
                knownFor: ["Progressive politics", "Humor", "Labor coverage"],
                perspective: "Progressive",
                trustLevel: .medium,
                url: "https://youtube.com/majorityreport"
            ),
            IndieMediaOutlet(
                name: "Second Thought",
                format: "YouTube",
                category: .video,
                description: "JT Chapman explains socialist and anti-capitalist perspectives with high production value. Educational content on political economy.",
                knownFor: ["Political economy", "Socialism", "Education"],
                perspective: "Left",
                trustLevel: .medium,
                url: "https://youtube.com/secondthought"
            ),
            IndieMediaOutlet(
                name: "Some More News",
                format: "YouTube",
                category: .video,
                description: "Cody Johnston's satirical but well-researched deep dives on political and media issues. Long-form, heavily sourced, funny.",
                knownFor: ["Deep dives", "Satire", "Media criticism"],
                perspective: "Progressive",
                trustLevel: .medium,
                url: "https://youtube.com/somemorenews"
            ),
            
            // Nonprofit News
            IndieMediaOutlet(
                name: "Texas Tribune",
                format: "Nonprofit News",
                category: .nonprofit,
                description: "Nonpartisan Texas news. Free to read. Excellent state politics, policy, and data journalism. Model for nonprofit local news.",
                knownFor: ["Texas politics", "Data", "State government"],
                perspective: "Nonpartisan",
                trustLevel: .high,
                url: "https://texastribune.org"
            ),
            IndieMediaOutlet(
                name: "The Marshall Project",
                format: "Nonprofit News",
                category: .nonprofit,
                description: "Criminal justice journalism. Covers prisons, policing, courts, incarceration. Essential for understanding mass incarceration.",
                knownFor: ["Criminal justice", "Prisons", "Policing"],
                perspective: "Nonpartisan",
                trustLevel: .high,
                url: "https://themarshallproject.org"
            ),
            IndieMediaOutlet(
                name: "Mother Jones",
                format: "Magazine/Online",
                category: .nonprofit,
                description: "Nonprofit investigative journalism with progressive perspective. Broke story on Romney's '47%' video. Strong investigative work.",
                knownFor: ["Investigations", "Environment", "Politics"],
                perspective: "Progressive",
                trustLevel: .high,
                url: "https://motherjones.com"
            ),
            IndieMediaOutlet(
                name: "Current Affairs",
                format: "Magazine",
                category: .nonprofit,
                description: "Nathan Robinson's socialist magazine. Long-form analysis, cultural criticism, and political commentary from the left.",
                knownFor: ["Socialist analysis", "Culture", "Long-form"],
                perspective: "Left",
                trustLevel: .medium,
                url: "https://currentaffairs.org"
            ),
            
            // Podcasts
            IndieMediaOutlet(
                name: "Citations Needed",
                format: "Podcast",
                category: .podcasts,
                description: "Media criticism podcast examining media narratives and propaganda. Adam Johnson and Nima Shirazi. Excellent media literacy resource.",
                knownFor: ["Media criticism", "Propaganda analysis", "Narrative deconstruction"],
                perspective: "Left",
                trustLevel: .high,
                url: "https://citationsneeded.libsyn.com"
            ),
            IndieMediaOutlet(
                name: "On The Media",
                format: "Podcast (NPR)",
                category: .podcasts,
                description: "WNYC's media criticism show. Brooke Gladstone. Examines how media shapes stories. Essential for media literacy.",
                knownFor: ["Media literacy", "Analysis", "Breaking down coverage"],
                perspective: "Nonpartisan",
                trustLevel: .high,
                url: "https://wnycstudios.org/podcasts/otm"
            ),
            IndieMediaOutlet(
                name: "The Daily Zeitgeist",
                format: "Podcast",
                category: .podcasts,
                description: "Jack O'Brien and Miles Gray break down daily news with humor. Left-leaning but accessible and entertaining.",
                knownFor: ["Daily news", "Humor", "Accessible"],
                perspective: "Progressive",
                trustLevel: .medium,
                url: "https://iheartradio.com/show/the-daily-zeitgeist"
            ),
            IndieMediaOutlet(
                name: "Behind the Bastards",
                format: "Podcast",
                category: .podcasts,
                description: "Robert Evans profiles history's worst people. Well-researched, darkly funny. Covers authoritarians, grifters, and terrible people.",
                knownFor: ["History", "Fascism", "Grifters"],
                perspective: "Left",
                trustLevel: .medium,
                url: "https://iheart.com/podcast/behind-the-bastards"
            ),
            
            // International
            IndieMediaOutlet(
                name: "The Guardian",
                format: "UK Newspaper",
                category: .international,
                description: "British paper with strong US coverage. Free to read (reader-supported). Good investigative work, international perspective.",
                knownFor: ["Snowden", "Panama Papers", "International"],
                perspective: "Center-Left",
                trustLevel: .high,
                url: "https://theguardian.com/us"
            ),
            IndieMediaOutlet(
                name: "Al Jazeera English",
                format: "International News",
                category: .international,
                description: "Qatar-funded but provides perspective on Middle East that US media lacks. Bias on Gulf issues, otherwise strong journalism.",
                knownFor: ["Middle East", "Global South", "International"],
                perspective: nil,
                trustLevel: .medium,
                url: "https://aljazeera.com"
            ),
            IndieMediaOutlet(
                name: "The Conversation",
                format: "Academic Journalism",
                category: .international,
                description: "Academics writing for general audience. Experts explaining their research areas. High quality, well-sourced, educational.",
                knownFor: ["Academic", "Expert analysis", "Research-based"],
                perspective: "Nonpartisan",
                trustLevel: .high,
                url: "https://theconversation.com"
            )
        ]
    }
}

// MARK: - Models

enum IndieMediaCategory: String, CaseIterable {
    case all = "All"
    case investigative = "Investigative"
    case journalists = "Journalists"
    case video = "Video"
    case nonprofit = "Nonprofit"
    case podcasts = "Podcasts"
    case international = "International"
}

enum TrustLevel: String {
    case high = "Trusted"
    case medium = "Good"
    case low = "Verify"
}

struct IndieMediaOutlet {
    let name: String
    let format: String
    let category: IndieMediaCategory
    let description: String
    let knownFor: [String]
    let perspective: String?
    let trustLevel: TrustLevel
    let url: String?
}

#Preview {
    NavigationStack {
        IndependentMediaGuide()
    }
}
