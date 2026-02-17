// GlobalSearchView.swift
// Search across all Aperture content: Courses, Cosmos, Timeline, Alexandria, Practices

import SwiftUI

// MARK: - Search Result Type

enum SearchResultType: String, CaseIterable {
  case course = "Courses"
  case cosmos = "Cosmos"
  case timeline = "Timeline"
  case alexandria = "Alexandria"
  case practice = "Practices"
  case entity = "Entities"

  var icon: String {
    switch self {
    case .course: return "book.fill"
    case .cosmos: return "globe.americas.fill"
    case .timeline: return "clock.arrow.circlepath"
    case .alexandria: return "books.vertical.fill"
    case .practice: return "figure.mind.and.body"
    case .entity: return "sparkles"
    }
  }

  var color: Color {
    switch self {
    case .course: return Palette.accent.gold
    case .cosmos: return Palette.primary.cyan
    case .timeline: return Palette.primary.violet
    case .alexandria: return .green
    case .practice: return .orange
    case .entity: return .pink
    }
  }
}

// MARK: - Search Result

struct SearchResult: Identifiable {
  let id: String
  let title: String
  let subtitle: String
  let type: SearchResultType
  let matchedText: String?
  let destinationId: String

  /// For navigation
  var tabIndex: Int {
    switch type {
    case .course, .practice: return 3  // Awakening
    case .cosmos, .entity: return 2  // Cosmos
    case .timeline: return 1  // Timeline
    case .alexandria: return 4  // More
    }
  }
}

// MARK: - Search Manager

@MainActor
class SearchManager: ObservableObject {
  static let shared = SearchManager()

  @Published var searchText: String = ""
  @Published var results: [SearchResult] = []
  @Published var isSearching: Bool = false
  @Published var recentSearches: [String] = []
  @Published var selectedFilter: SearchResultType?

  private let maxRecentSearches = 5

  private init() {
    loadRecentSearches()
  }

  // MARK: - Search

  func search() {
    guard !searchText.trimmingCharacters(in: .whitespaces).isEmpty else {
      results = []
      return
    }

    isSearching = true
    let query = searchText.lowercased()

    var allResults: [SearchResult] = []

    // Search courses
    allResults.append(contentsOf: searchCourses(query: query))

    // Search cosmos realms and entities
    allResults.append(contentsOf: searchCosmos(query: query))

    // Search timeline events
    allResults.append(contentsOf: searchTimeline(query: query))

    // Search practices
    allResults.append(contentsOf: searchPractices(query: query))

    // Search Alexandria texts
    allResults.append(contentsOf: searchAlexandria(query: query))

    // Apply filter if selected
    if let filter = selectedFilter {
      results = allResults.filter { $0.type == filter }
    } else {
      results = allResults
    }

    // Sort by relevance (title match first)
    results.sort { r1, r2 in
      let r1TitleMatch = r1.title.lowercased().contains(query)
      let r2TitleMatch = r2.title.lowercased().contains(query)
      if r1TitleMatch, !r2TitleMatch { return true }
      if !r1TitleMatch, r2TitleMatch { return false }
      return r1.title < r2.title
    }

    isSearching = false
  }

  // MARK: - Search Functions

  private func searchCourses(query: String) -> [SearchResult] {
    // Course titles to search
    let courses = [
      ("kundalini", "Kundalini Awakening", "Ancient serpent energy path"),
      ("breathwork", "Breathwork Foundations", "Master your breath, master your energy"),
      ("meditation", "Meditation Mastery", "Still the mind, awaken the spirit"),
      ("chakra", "Chakra Activation", "Balance your energy centers"),
      ("gnostic", "Gnostic Wisdom", "Hidden teachings revealed"),
      ("shadow", "Shadow Integration", "Embrace your whole self"),
      ("lucid", "Lucid Dreaming", "Awaken within the dream"),
      ("astral", "Astral Projection", "Journey beyond the body"),
      ("qi gong", "Qi Gong Flow", "Cultivate life force energy"),
      ("tantra", "Sacred Tantra", "Unite polarity within"),
      ("hermetic", "Hermetic Principles", "As above, so below"),
      ("dragonball", "Dragon Ball Awakening", "Ultra Instinct consciousness"),
      ("flow state", "Flow State Mastery", "Enter the zone at will"),
    ]

    return courses.compactMap { key, title, subtitle in
      if key.contains(query) || title.lowercased().contains(query)
        || subtitle.lowercased().contains(query)
      {
        return SearchResult(
          id: "course_\(key)",
          title: title,
          subtitle: subtitle,
          type: .course,
          matchedText: nil,
          destinationId: key
        )
      }
      return nil
    }
  }

  private func searchCosmos(query: String) -> [SearchResult] {
    var results: [SearchResult] = []

    // Realms
    let realms = [
      ("pleroma", "Pleroma", "The Fullness - Divine Source"),
      ("aeons", "Realm of Aeons", "Divine emanations"),
      ("ogdoad", "Ogdoad", "The Eighth - Higher heavens"),
      ("hebdomad", "Hebdomad", "The Seven - Archon realms"),
      ("kenoma", "Kenoma", "The Void - Material realm"),
      ("earth", "Earth", "Hyle - The material world"),
    ]

    for (key, title, subtitle) in realms {
      if key.contains(query) || title.lowercased().contains(query)
        || subtitle.lowercased().contains(query)
      {
        results.append(
          SearchResult(
            id: "realm_\(key)",
            title: title,
            subtitle: subtitle,
            type: .cosmos,
            matchedText: nil,
            destinationId: key
          ))
      }
    }

    // Entities
    let entities = [
      ("sophia", "Sophia", "Divine wisdom who fell"),
      ("yaldabaoth", "Yaldabaoth", "The Demiurge - blind god"),
      ("christ", "Christ Aeon", "Savior consciousness"),
      ("lilith", "Lilith", "First woman, demonized rebel"),
      ("lucifer", "Lucifer", "Light-bringer, misunderstood"),
      ("serpent", "The Serpent", "Bringer of knowledge"),
      ("archons", "Archons", "Rulers of the material"),
      ("metatron", "Metatron", "Highest angel"),
      ("michael", "Michael", "Warrior of light"),
      ("samael", "Samael", "Angel of death"),
    ]

    for (key, title, subtitle) in entities {
      if key.contains(query) || title.lowercased().contains(query)
        || subtitle.lowercased().contains(query)
      {
        results.append(
          SearchResult(
            id: "entity_\(key)",
            title: title,
            subtitle: subtitle,
            type: .entity,
            matchedText: nil,
            destinationId: key
          ))
      }
    }

    return results
  }

  private func searchTimeline(query: String) -> [SearchResult] {
    let events = [
      ("nag_hammadi", "Nag Hammadi Discovery", "1945 - Lost gospels found"),
      ("dead_sea", "Dead Sea Scrolls", "1947 - Ancient texts revealed"),
      ("council_nicaea", "Council of Nicaea", "325 CE - Canon established"),
      ("burning_library", "Burning of Alexandria", "Ancient wisdom destroyed"),
      ("inquisition", "The Inquisition", "Suppression of gnosis"),
      ("templars", "Knights Templar", "Guardians of secret knowledge"),
      ("cathar", "Cathar Genocide", "Gnostic purge"),
      ("renaissance", "Hermetic Renaissance", "Wisdom resurfaces"),
      ("theosophy", "Theosophical Society", "1875 - Modern awakening begins"),
      ("jung", "Jung's Red Book", "Psychology meets gnosis"),
    ]

    return events.compactMap { key, title, subtitle in
      if key.contains(query) || title.lowercased().contains(query)
        || subtitle.lowercased().contains(query)
      {
        return SearchResult(
          id: "timeline_\(key)",
          title: title,
          subtitle: subtitle,
          type: .timeline,
          matchedText: nil,
          destinationId: key
        )
      }
      return nil
    }
  }

  private func searchPractices(query: String) -> [SearchResult] {
    let practices = [
      ("breath_fire", "Breath of Fire", "Kundalini activation breathing"),
      ("body_scan", "Body Scan", "Grounding meditation"),
      ("third_eye", "Third Eye Activation", "Pineal awakening"),
      ("root_chakra", "Root Chakra", "Foundation grounding"),
      ("heart_opening", "Heart Opening", "Compassion cultivation"),
      ("void_meditation", "Void Meditation", "Empty awareness"),
      ("mantra", "Mantra Practice", "Sound vibration healing"),
      ("visualization", "Creative Visualization", "Reality shaping"),
      ("grounding", "Earthing Practice", "Connect to Gaia"),
    ]

    return practices.compactMap { key, title, subtitle in
      if key.contains(query) || title.lowercased().contains(query)
        || subtitle.lowercased().contains(query)
      {
        return SearchResult(
          id: "practice_\(key)",
          title: title,
          subtitle: subtitle,
          type: .practice,
          matchedText: nil,
          destinationId: key
        )
      }
      return nil
    }
  }

  private func searchAlexandria(query: String) -> [SearchResult] {
    let texts = [
      ("gospel_thomas", "Gospel of Thomas", "114 sayings of Jesus"),
      ("gospel_philip", "Gospel of Philip", "Sacraments and bridal chamber"),
      ("gospel_truth", "Gospel of Truth", "Valentinian revelation"),
      ("apocryphon_john", "Apocryphon of John", "Secret teaching to John"),
      ("pistis_sophia", "Pistis Sophia", "Faith Wisdom journey"),
      ("corpus_hermeticum", "Corpus Hermeticum", "Hermetic teachings"),
      ("emerald_tablet", "Emerald Tablet", "As above, so below"),
      ("book_enoch", "Book of Enoch", "Watchers and nephilim"),
      ("thunder_perfect", "Thunder, Perfect Mind", "Divine feminine speaks"),
      ("hymn_pearl", "Hymn of the Pearl", "Soul's journey home"),
    ]

    return texts.compactMap { key, title, subtitle in
      if key.contains(query) || title.lowercased().contains(query)
        || subtitle.lowercased().contains(query)
      {
        return SearchResult(
          id: "text_\(key)",
          title: title,
          subtitle: subtitle,
          type: .alexandria,
          matchedText: nil,
          destinationId: key
        )
      }
      return nil
    }
  }

  // MARK: - Recent Searches

  func addToRecentSearches(_ query: String) {
    let trimmed = query.trimmingCharacters(in: .whitespaces)
    guard !trimmed.isEmpty else { return }

    // Remove if already exists
    recentSearches.removeAll { $0.lowercased() == trimmed.lowercased() }

    // Add to front
    recentSearches.insert(trimmed, at: 0)

    // Trim to max
    if recentSearches.count > maxRecentSearches {
      recentSearches = Array(recentSearches.prefix(maxRecentSearches))
    }

    saveRecentSearches()
  }

  func clearRecentSearches() {
    recentSearches = []
    saveRecentSearches()
  }

  private func loadRecentSearches() {
    recentSearches = UserDefaults.standard.stringArray(forKey: "aperture.recentSearches") ?? []
  }

  private func saveRecentSearches() {
    UserDefaults.standard.set(recentSearches, forKey: "aperture.recentSearches")
  }
}

// MARK: - Global Search View

struct GlobalSearchView: View {
  @StateObject private var searchManager = SearchManager.shared
  @Environment(\.dismiss) private var dismiss
  @FocusState private var isSearchFocused: Bool

  @Binding var selectedTab: Int

  var body: some View {
    NavigationStack {
      ZStack {
        Color(hex: "#0a0a1a").ignoresSafeArea()

        VStack(spacing: 0) {
          // Search bar
          searchBar

          // Filter chips
          filterChips

          // Content
          if searchManager.searchText.isEmpty {
            emptyStateView
          } else if searchManager.results.isEmpty && !searchManager.isSearching {
            noResultsView
          } else {
            resultsList
          }
        }
      }
      .navigationTitle("Search")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button("Done") { dismiss() }
            .foregroundColor(Palette.primary.cyan)
        }
      }
    }
    .onAppear {
      isSearchFocused = true
    }
  }

  // MARK: - Search Bar

  private var searchBar: some View {
    HStack(spacing: 12) {
      Image(systemName: "magnifyingglass")
        .foregroundColor(.gray)

      TextField("Search Aperture...", text: $searchManager.searchText)
        .foregroundColor(.white)
        .autocorrectionDisabled()
        .textInputAutocapitalization(.never)
        .focused($isSearchFocused)
        .onSubmit {
          searchManager.search()
          searchManager.addToRecentSearches(searchManager.searchText)
        }
        .onChange(of: searchManager.searchText) { _, _ in
          searchManager.search()
        }

      if !searchManager.searchText.isEmpty {
        Button(action: {
          searchManager.searchText = ""
          searchManager.results = []
        }) {
          Image(systemName: "xmark.circle.fill")
            .foregroundColor(.gray)
        }
      }
    }
    .padding()
    .background(
      RoundedRectangle(cornerRadius: 12)
        .fill(Color.white.opacity(0.08))
    )
    .padding(.horizontal)
    .padding(.top, 8)
  }

  // MARK: - Filter Chips

  private var filterChips: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack(spacing: 8) {
        // All filter
        filterChip(title: "All", type: nil)

        ForEach(SearchResultType.allCases, id: \.self) { type in
          filterChip(title: type.rawValue, type: type)
        }
      }
      .padding(.horizontal)
      .padding(.vertical, 12)
    }
  }

  private func filterChip(title: String, type: SearchResultType?) -> some View {
    let isSelected = searchManager.selectedFilter == type

    return Button(action: {
      withAnimation(.spring(response: 0.3)) {
        searchManager.selectedFilter = type
        searchManager.search()
      }
      HapticManager.shared.selectionChanged()
    }) {
      HStack(spacing: 4) {
        if let type = type {
          Image(systemName: type.icon)
            .font(.system(size: 11))
        }
        Text(title)
          .font(.system(size: 13, weight: .medium))
      }
      .foregroundColor(isSelected ? .black : .white.opacity(0.7))
      .padding(.horizontal, 12)
      .padding(.vertical, 6)
      .background(
        Capsule()
          .fill(isSelected ? Palette.accent.gold : Color.white.opacity(0.1))
      )
    }
    .buttonStyle(PlainButtonStyle())
  }

  // MARK: - Empty State

  private var emptyStateView: some View {
    ScrollView {
      VStack(spacing: 24) {
        // Recent searches
        if !searchManager.recentSearches.isEmpty {
          recentSearchesSection
        }

        // Suggestions
        suggestionsSection

        Spacer(minLength: 50)
      }
      .padding()
    }
  }

  private var recentSearchesSection: some View {
    VStack(alignment: .leading, spacing: 12) {
      HStack {
        Text("RECENT")
          .font(.system(size: 12, weight: .bold))
          .foregroundColor(.gray)
          .tracking(2)

        Spacer()

        Button("Clear") {
          searchManager.clearRecentSearches()
        }
        .font(.system(size: 12))
        .foregroundColor(Palette.primary.cyan)
      }

      ForEach(searchManager.recentSearches, id: \.self) { search in
        Button(action: {
          searchManager.searchText = search
          searchManager.search()
        }) {
          HStack {
            Image(systemName: "clock.arrow.circlepath")
              .foregroundColor(.gray)
            Text(search)
              .foregroundColor(.white)
            Spacer()
          }
          .padding(.vertical, 8)
        }
      }
    }
  }

  private var suggestionsSection: some View {
    VStack(alignment: .leading, spacing: 12) {
      Text("SUGGESTIONS")
        .font(.system(size: 12, weight: .bold))
        .foregroundColor(.gray)
        .tracking(2)

      let suggestions = ["Kundalini", "Sophia", "Gospel of Thomas", "Chakra", "Meditation"]

      SearchFlowLayout(spacing: 8) {
        ForEach(suggestions, id: \.self) { suggestion in
          Button(action: {
            searchManager.searchText = suggestion
            searchManager.search()
          }) {
            Text(suggestion)
              .font(.system(size: 14))
              .foregroundColor(.white.opacity(0.8))
              .padding(.horizontal, 12)
              .padding(.vertical, 6)
              .background(
                Capsule()
                  .fill(Color.white.opacity(0.08))
              )
          }
        }
      }
    }
  }

  // MARK: - No Results

  private var noResultsView: some View {
    VStack(spacing: 16) {
      Spacer()

      Image(systemName: "magnifyingglass")
        .font(.system(size: 50))
        .foregroundColor(.gray.opacity(0.5))

      Text("No results found")
        .font(.system(size: 18, weight: .semibold))
        .foregroundColor(.white)

      Text("Try different keywords or check the spelling")
        .font(.system(size: 14))
        .foregroundColor(.gray)

      Spacer()
    }
  }

  // MARK: - Results List

  private var resultsList: some View {
    ScrollView {
      LazyVStack(spacing: 12) {
        // Group by type
        let groupedResults = Dictionary(grouping: searchManager.results) { $0.type }

        ForEach(SearchResultType.allCases, id: \.self) { type in
          if let typeResults = groupedResults[type], !typeResults.isEmpty {
            Section(
              header: HStack {
                Image(systemName: type.icon)
                  .foregroundColor(type.color)
                Text(type.rawValue.uppercased())
                  .font(.system(size: 12, weight: .bold))
                  .foregroundColor(type.color)
                  .tracking(2)
                Spacer()
                Text("\(typeResults.count)")
                  .font(.system(size: 12))
                  .foregroundColor(.gray)
              }
              .padding(.horizontal)
              .padding(.top, 16)
            ) {
              ForEach(typeResults) { result in
                SearchResultRow(result: result) {
                  navigateToResult(result)
                }
              }
            }
          }
        }
      }
      .padding(.bottom, 100)
    }
  }

  // MARK: - Navigation

  private func navigateToResult(_ result: SearchResult) {
    searchManager.addToRecentSearches(searchManager.searchText)
    selectedTab = result.tabIndex
    dismiss()

    // Post notification for deep navigation
    NotificationCenter.default.post(
      name: .searchResultSelected,
      object: nil,
      userInfo: [
        "type": result.type.rawValue,
        "destinationId": result.destinationId,
      ]
    )
  }
}

// MARK: - Search Result Row

struct SearchResultRow: View {
  let result: SearchResult
  let onTap: () -> Void

  var body: some View {
    Button(action: onTap) {
      HStack(spacing: 12) {
        // Icon
        Image(systemName: result.type.icon)
          .font(.system(size: 16))
          .foregroundColor(result.type.color)
          .frame(width: 36, height: 36)
          .background(result.type.color.opacity(0.15))
          .clipShape(Circle())

        // Text
        VStack(alignment: .leading, spacing: 2) {
          Text(result.title)
            .font(.system(size: 15, weight: .semibold))
            .foregroundColor(.white)

          Text(result.subtitle)
            .font(.system(size: 12))
            .foregroundColor(.gray)
            .lineLimit(1)
        }

        Spacer()

        Image(systemName: "chevron.right")
          .font(.system(size: 12))
          .foregroundColor(.gray)
      }
      .padding()
      .background(
        RoundedRectangle(cornerRadius: 12)
          .fill(Color.white.opacity(0.05))
      )
    }
    .buttonStyle(PlainButtonStyle())
    .padding(.horizontal)
  }
}

// MARK: - Flow Layout

struct SearchFlowLayout: Layout {
  var spacing: CGFloat = 8

  func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache _: inout ()) -> CGSize {
    let result = FlowResult(in: proposal.width ?? 0, subviews: subviews, spacing: spacing)
    return result.size
  }

  func placeSubviews(
    in bounds: CGRect, proposal _: ProposedViewSize, subviews: Subviews, cache _: inout ()
  ) {
    let result = FlowResult(in: bounds.width, subviews: subviews, spacing: spacing)
    for (index, subview) in subviews.enumerated() {
      subview.place(
        at: CGPoint(
          x: bounds.minX + result.positions[index].x,
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
      var lineHeight: CGFloat = 0

      for subview in subviews {
        let size = subview.sizeThatFits(.unspecified)

        if x + size.width > width, x > 0 {
          x = 0
          y += lineHeight + spacing
          lineHeight = 0
        }

        positions.append(CGPoint(x: x, y: y))
        lineHeight = max(lineHeight, size.height)
        x += size.width + spacing
      }

      size = CGSize(width: width, height: y + lineHeight)
    }
  }
}

// MARK: - Notification Names

extension Notification.Name {
  static let searchResultSelected = Notification.Name("searchResultSelected")
}

// MARK: - Preview

#Preview {
  GlobalSearchView(selectedTab: .constant(0))
}
