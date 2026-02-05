// FreeEducationResourcesView.swift
// Real education without the debt trap
// MIT, Harvard, and more - all free

import SwiftUI

struct FreeEducationResourcesView: View {
    
    @State private var selectedCategory: FreeEduCategory = .all
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Header
                headerSection
                
                // Category picker
                categoryPicker
                
                // Resources list
                resourcesList
                
                // YouTube channels
                youtubeSection
                
                // Tips
                tipsSection
            }
            .padding()
        }
        .background(Color.black.ignoresSafeArea())
        .navigationTitle("Free Education")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    // MARK: - Header
    
    private var headerSection: some View {
        VStack(spacing: 16) {
            ZStack {
                Circle()
                    .fill(Color.green.opacity(0.2))
                    .frame(width: 100, height: 100)
                
                Image(systemName: "book.fill")
                    .font(.system(size: 44))
                    .foregroundColor(.green)
            }
            
            Text("Free World-Class Education")
                .font(.system(size: 22, weight: .bold))
                .foregroundColor(.white)
            
            Text("The same knowledge that costs $60,000/year\nat elite universities—completely free.")
                .font(.system(size: 14))
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
            
            // Key stat
            HStack(spacing: 20) {
                statBubble("$0", "Cost")
                statBubble("1000s", "Courses")
                statBubble("∞", "Access")
            }
        }
    }
    
    private func statBubble(_ value: String, _ label: String) -> some View {
        VStack(spacing: 4) {
            Text(value)
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.green)
            Text(label)
                .font(.system(size: 11))
                .foregroundColor(.gray)
        }
        .frame(width: 80)
        .padding(.vertical, 12)
        .background(Color.white.opacity(0.05))
        .cornerRadius(12)
    }
    
    // MARK: - Category Picker
    
    private var categoryPicker: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(FreeEduCategory.allCases, id: \.self) { category in
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
    
    // MARK: - Resources
    
    private var resourcesList: some View {
        VStack(spacing: 16) {
            ForEach(filteredResources, id: \.name) { resource in
                resourceCard(resource)
            }
        }
    }
    
    private var filteredResources: [FreeResource] {
        if selectedCategory == .all {
            return allResources
        }
        return allResources.filter { $0.category == selectedCategory }
    }
    
    private func resourceCard(_ resource: FreeResource) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                // Logo placeholder
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(resource.color.opacity(0.2))
                        .frame(width: 50, height: 50)
                    Image(systemName: resource.icon)
                        .font(.system(size: 22))
                        .foregroundColor(resource.color)
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(resource.name)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.white)
                    Text(resource.provider)
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                // Free badge
                Text("FREE")
                    .font(.system(size: 10, weight: .black))
                    .foregroundColor(.green)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color.green.opacity(0.2))
                    .cornerRadius(4)
            }
            
            Text(resource.description)
                .font(.system(size: 13))
                .foregroundColor(.white.opacity(0.8))
                .lineLimit(2)
            
            // What you can learn
            HStack(spacing: 8) {
                ForEach(resource.topics.prefix(3), id: \.self) { topic in
                    Text(topic)
                        .font(.system(size: 10, weight: .medium))
                        .foregroundColor(.white.opacity(0.7))
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Color.white.opacity(0.1))
                        .cornerRadius(4)
                }
            }
            
            // Link button
            Button(action: {
                HapticManager.shared.medium()
                if let url = URL(string: resource.url) {
                    UIApplication.shared.open(url)
                }
            }) {
                HStack {
                    Text("Visit Site")
                        .font(.system(size: 13, weight: .semibold))
                    Image(systemName: "arrow.up.right")
                        .font(.system(size: 11))
                }
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 10)
                .background(resource.color)
                .cornerRadius(8)
            }
        }
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(16)
    }
    
    // MARK: - YouTube Section
    
    private var youtubeSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "play.rectangle.fill")
                    .foregroundColor(.red)
                Text("YouTube Channels")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.white)
            }
            
            VStack(spacing: 12) {
                youtubeChannel("3Blue1Brown", "Math visualized beautifully", "Math")
                youtubeChannel("CrashCourse", "History, science, more", "General")
                youtubeChannel("Khan Academy", "Everything K-12 to college", "All Subjects")
                youtubeChannel("Professor Dave Explains", "Science and debunking", "Science")
                youtubeChannel("Economics Explained", "How economies really work", "Economics")
                youtubeChannel("Second Thought", "Political economy", "Politics")
                youtubeChannel("Knowing Better", "History and social issues", "History")
                youtubeChannel("Philosophy Tube", "Philosophy accessible", "Philosophy")
                youtubeChannel("Computerphile", "Computer science", "CS")
                youtubeChannel("Fireship", "Coding in 100 seconds", "Programming")
            }
        }
        .padding()
        .background(Color.red.opacity(0.05))
        .cornerRadius(16)
    }
    
    private func youtubeChannel(_ name: String, _ desc: String, _ topic: String) -> some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                Text(name)
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.white)
                Text(desc)
                    .font(.system(size: 11))
                    .foregroundColor(.gray)
            }
            Spacer()
            Text(topic)
                .font(.system(size: 10, weight: .medium))
                .foregroundColor(.red)
                .padding(.horizontal, 8)
                .padding(.vertical, 4)
                .background(Color.red.opacity(0.2))
                .cornerRadius(4)
        }
    }
    
    // MARK: - Tips
    
    private var tipsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(systemName: "lightbulb.fill")
                    .foregroundColor(.yellow)
                Text("How to Self-Educate")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.white)
            }
            
            VStack(alignment: .leading, spacing: 12) {
                tipRow("1", "Start with curiosity", "What do you actually want to know?")
                tipRow("2", "Pick one course and finish it", "Completion > collection")
                tipRow("3", "Take notes actively", "Writing helps retention")
                tipRow("4", "Apply immediately", "Use knowledge or lose it")
                tipRow("5", "Teach someone else", "Best way to solidify learning")
                tipRow("6", "Build projects", "Portfolio > credentials")
            }
            
            Text("A motivated self-learner can match any college graduate. The knowledge is free—only effort has a price.")
                .font(.system(size: 12, weight: .medium))
                .foregroundColor(.orange)
                .padding(.top, 8)
        }
        .padding()
        .background(Color.yellow.opacity(0.05))
        .cornerRadius(16)
    }
    
    private func tipRow(_ num: String, _ title: String, _ desc: String) -> some View {
        HStack(alignment: .top, spacing: 12) {
            Text(num)
                .font(.system(size: 12, weight: .bold))
                .foregroundColor(.black)
                .frame(width: 24, height: 24)
                .background(Color.yellow)
                .cornerRadius(12)
            
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
    
    // MARK: - Data
    
    private var allResources: [FreeResource] {
        [
            // Universities
            FreeResource(
                name: "MIT OpenCourseWare",
                provider: "Massachusetts Institute of Technology",
                description: "2,500+ courses from one of the world's top universities. Complete lecture notes, assignments, exams.",
                url: "https://ocw.mit.edu",
                icon: "building.columns.fill",
                color: .red,
                category: .universities,
                topics: ["CS", "Math", "Physics", "Economics"]
            ),
            FreeResource(
                name: "Harvard Online Learning",
                provider: "Harvard University",
                description: "Free courses from Harvard professors. CS50 is legendary for computer science beginners.",
                url: "https://pll.harvard.edu/catalog/free",
                icon: "building.columns.fill",
                color: .red,
                category: .universities,
                topics: ["CS50", "Data Science", "Philosophy"]
            ),
            FreeResource(
                name: "Stanford Online",
                provider: "Stanford University",
                description: "Courses in AI, machine learning, and more from Silicon Valley's university.",
                url: "https://online.stanford.edu/free-courses",
                icon: "building.columns.fill",
                color: .red,
                category: .universities,
                topics: ["AI", "Machine Learning", "Algorithms"]
            ),
            FreeResource(
                name: "Yale Open Courses",
                provider: "Yale University",
                description: "Full courses with video lectures. Excellent humanities and social sciences.",
                url: "https://oyc.yale.edu",
                icon: "building.columns.fill",
                color: .blue,
                category: .universities,
                topics: ["History", "Philosophy", "Psychology"]
            ),
            
            // Platforms
            FreeResource(
                name: "Khan Academy",
                provider: "Nonprofit",
                description: "The gold standard for free education. Math, science, history—K-12 through college.",
                url: "https://khanacademy.org",
                icon: "graduationcap.fill",
                color: .green,
                category: .platforms,
                topics: ["Math", "Science", "Economics", "History"]
            ),
            FreeResource(
                name: "Coursera (Audit)",
                provider: "Various Universities",
                description: "Audit courses free from top universities. Pay only for certificate if you want one.",
                url: "https://coursera.org",
                icon: "graduationcap.fill",
                color: .blue,
                category: .platforms,
                topics: ["Everything", "Certificates Available", "University Courses"]
            ),
            FreeResource(
                name: "edX (Audit)",
                provider: "Harvard, MIT, etc.",
                description: "Similar to Coursera. Audit mode is free. Created by Harvard and MIT.",
                url: "https://edx.org",
                icon: "graduationcap.fill",
                color: .purple,
                category: .platforms,
                topics: ["CS", "Business", "Science", "Humanities"]
            ),
            
            // Programming
            FreeResource(
                name: "freeCodeCamp",
                provider: "Nonprofit",
                description: "Learn to code for free. 3,000+ hour curriculum. Build real projects.",
                url: "https://freecodecamp.org",
                icon: "chevron.left.forwardslash.chevron.right",
                color: .green,
                category: .programming,
                topics: ["Web Dev", "JavaScript", "Python", "Data Science"]
            ),
            FreeResource(
                name: "The Odin Project",
                provider: "Open Source",
                description: "Full stack web development. Project-based learning. Very comprehensive.",
                url: "https://theodinproject.com",
                icon: "chevron.left.forwardslash.chevron.right",
                color: .orange,
                category: .programming,
                topics: ["Full Stack", "Ruby", "JavaScript", "React"]
            ),
            FreeResource(
                name: "CS50",
                provider: "Harvard",
                description: "Harvard's intro to CS. Best programming course in the world. Free on edX.",
                url: "https://cs50.harvard.edu",
                icon: "chevron.left.forwardslash.chevron.right",
                color: .red,
                category: .programming,
                topics: ["C", "Python", "SQL", "Web"]
            ),
            
            // Finance
            FreeResource(
                name: "Investopedia",
                provider: "Financial Education",
                description: "Everything about money, investing, markets. Dictionary and courses.",
                url: "https://investopedia.com",
                icon: "dollarsign.circle.fill",
                color: .green,
                category: .finance,
                topics: ["Investing", "Economics", "Personal Finance"]
            ),
            FreeResource(
                name: "CORE Econ",
                provider: "Academic Consortium",
                description: "Free economics textbook that's actually good. Used by top universities.",
                url: "https://core-econ.org",
                icon: "chart.line.uptrend.xyaxis",
                color: .blue,
                category: .finance,
                topics: ["Economics", "Macro", "Micro", "Policy"]
            ),
            
            // Languages
            FreeResource(
                name: "Duolingo",
                provider: "Freemium App",
                description: "Learn languages for free. Gamified learning. 40+ languages.",
                url: "https://duolingo.com",
                icon: "globe",
                color: .green,
                category: .languages,
                topics: ["Spanish", "French", "Japanese", "40+ Languages"]
            ),
            FreeResource(
                name: "Language Transfer",
                provider: "Nonprofit",
                description: "Audio courses teaching languages through understanding, not memorization.",
                url: "https://languagetransfer.org",
                icon: "waveform",
                color: .purple,
                category: .languages,
                topics: ["Spanish", "French", "German", "Greek"]
            ),
            
            // Reading
            FreeResource(
                name: "Project Gutenberg",
                provider: "Nonprofit",
                description: "70,000+ free ebooks. All public domain classics. No cost ever.",
                url: "https://gutenberg.org",
                icon: "book.fill",
                color: .orange,
                category: .reading,
                topics: ["Classics", "Literature", "Philosophy", "History"]
            ),
            FreeResource(
                name: "OpenLibrary",
                provider: "Internet Archive",
                description: "Borrow ebooks for free. Millions of books. Like a digital library.",
                url: "https://openlibrary.org",
                icon: "books.vertical.fill",
                color: .blue,
                category: .reading,
                topics: ["Everything", "Modern Books", "Textbooks"]
            ),
            FreeResource(
                name: "Libby (Library App)",
                provider: "Your Local Library",
                description: "Borrow ebooks and audiobooks free with your library card.",
                url: "https://libbyapp.com",
                icon: "building.2.fill",
                color: .cyan,
                category: .reading,
                topics: ["New Releases", "Audiobooks", "Magazines"]
            )
        ]
    }
}

// MARK: - Models

enum FreeEduCategory: String, CaseIterable {
    case all = "All"
    case universities = "Universities"
    case platforms = "Platforms"
    case programming = "Coding"
    case finance = "Finance"
    case languages = "Languages"
    case reading = "Books"
}

struct FreeResource {
    let name: String
    let provider: String
    let description: String
    let url: String
    let icon: String
    let color: Color
    let category: FreeEduCategory
    let topics: [String]
}

#Preview {
    NavigationStack {
        FreeEducationResourcesView()
    }
}
