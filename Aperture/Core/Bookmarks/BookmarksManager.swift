// BookmarksManager.swift
// Save and manage bookmarked content across all modules

import SwiftUI
import Combine

// MARK: - Bookmark Item

struct BookmarkItem: Identifiable, Codable, Equatable {
    let id: String
    let title: String
    let subtitle: String
    let type: BookmarkType
    let destinationId: String
    let dateAdded: Date
    var notes: String?
    
    static func == (lhs: BookmarkItem, rhs: BookmarkItem) -> Bool {
        lhs.id == rhs.id
    }
}

enum BookmarkType: String, Codable, CaseIterable {
    case course = "course"
    case cosmos = "cosmos"
    case entity = "entity"
    case timeline = "timeline"
    case alexandria = "alexandria"
    case practice = "practice"
    
    var displayName: String {
        switch self {
        case .course: return "Courses"
        case .cosmos: return "Cosmos"
        case .entity: return "Entities"
        case .timeline: return "Timeline"
        case .alexandria: return "Alexandria"
        case .practice: return "Practices"
        }
    }
    
    var icon: String {
        switch self {
        case .course: return "book.fill"
        case .cosmos: return "globe.americas.fill"
        case .entity: return "sparkles"
        case .timeline: return "clock.arrow.circlepath"
        case .alexandria: return "books.vertical.fill"
        case .practice: return "figure.mind.and.body"
        }
    }
    
    var color: Color {
        switch self {
        case .course: return Palette.accent.gold
        case .cosmos: return Palette.primary.cyan
        case .entity: return .pink
        case .timeline: return Palette.primary.violet
        case .alexandria: return .green
        case .practice: return .orange
        }
    }
}

// MARK: - Bookmarks Manager

@MainActor
class BookmarksManager: ObservableObject {
    
    static let shared = BookmarksManager()
    
    @Published private(set) var bookmarks: [BookmarkItem] = []
    @Published var selectedFilter: BookmarkType?
    
    var filteredBookmarks: [BookmarkItem] {
        if let filter = selectedFilter {
            return bookmarks.filter { $0.type == filter }
        }
        return bookmarks
    }
    
    private let storageKey = "aperture.bookmarks.v1"
    
    private init() {
        load()
    }
    
    // MARK: - CRUD Operations
    
    func addBookmark(
        id: String,
        title: String,
        subtitle: String,
        type: BookmarkType,
        destinationId: String,
        notes: String? = nil
    ) {
        // Don't add duplicates
        guard !bookmarks.contains(where: { $0.id == id }) else { return }
        
        let bookmark = BookmarkItem(
            id: id,
            title: title,
            subtitle: subtitle,
            type: type,
            destinationId: destinationId,
            dateAdded: Date(),
            notes: notes
        )
        
        bookmarks.insert(bookmark, at: 0)
        save()
        
        HapticManager.shared.success()
    }
    
    func removeBookmark(id: String) {
        bookmarks.removeAll { $0.id == id }
        save()
    }
    
    func isBookmarked(id: String) -> Bool {
        bookmarks.contains { $0.id == id }
    }
    
    func toggleBookmark(
        id: String,
        title: String,
        subtitle: String,
        type: BookmarkType,
        destinationId: String
    ) {
        if isBookmarked(id: id) {
            removeBookmark(id: id)
        } else {
            addBookmark(id: id, title: title, subtitle: subtitle, type: type, destinationId: destinationId)
        }
    }
    
    func updateNotes(for id: String, notes: String) {
        if let index = bookmarks.firstIndex(where: { $0.id == id }) {
            var updated = bookmarks[index]
            updated.notes = notes
            bookmarks[index] = updated
            save()
        }
    }
    
    func clearAll() {
        bookmarks = []
        save()
    }
    
    // MARK: - Persistence
    
    private func load() {
        guard let data = UserDefaults.standard.data(forKey: storageKey),
              let decoded = try? JSONDecoder().decode([BookmarkItem].self, from: data) else {
            return
        }
        bookmarks = decoded
    }
    
    private func save() {
        if let encoded = try? JSONEncoder().encode(bookmarks) {
            UserDefaults.standard.set(encoded, forKey: storageKey)
        }
    }
}

// MARK: - Bookmarks View

struct BookmarksView: View {
    
    @StateObject private var manager = BookmarksManager.shared
    @State private var showingClearConfirmation = false
    @Binding var selectedTab: Int
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(hex: "#0a0a1a").ignoresSafeArea()
                
                VStack(spacing: 0) {
                    // Filter chips
                    filterChips
                    
                    if manager.filteredBookmarks.isEmpty {
                        emptyState
                    } else {
                        bookmarksList
                    }
                }
            }
            .navigationTitle("Bookmarks")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    if !manager.bookmarks.isEmpty {
                        Menu {
                            Button(role: .destructive) {
                                showingClearConfirmation = true
                            } label: {
                                Label("Clear All", systemImage: "trash")
                            }
                        } label: {
                            Image(systemName: "ellipsis.circle")
                                .foregroundColor(Palette.primary.cyan)
                        }
                    }
                }
            }
            .alert("Clear All Bookmarks?", isPresented: $showingClearConfirmation) {
                Button("Cancel", role: .cancel) {}
                Button("Clear All", role: .destructive) {
                    manager.clearAll()
                }
            } message: {
                Text("This action cannot be undone.")
            }
        }
    }
    
    // MARK: - Filter Chips
    
    private var filterChips: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                filterChip(title: "All", type: nil, count: manager.bookmarks.count)
                
                ForEach(BookmarkType.allCases, id: \.self) { type in
                    let count = manager.bookmarks.filter { $0.type == type }.count
                    if count > 0 {
                        filterChip(title: type.displayName, type: type, count: count)
                    }
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 12)
        }
    }
    
    private func filterChip(title: String, type: BookmarkType?, count: Int) -> some View {
        let isSelected = manager.selectedFilter == type
        
        return Button(action: {
            withAnimation(.spring(response: 0.3)) {
                manager.selectedFilter = type
            }
            HapticManager.shared.selectionChanged()
        }) {
            HStack(spacing: 4) {
                Text(title)
                    .font(.system(size: 13, weight: .medium))
                Text("(\(count))")
                    .font(.system(size: 11))
                    .foregroundColor(isSelected ? .black.opacity(0.6) : .white.opacity(0.4))
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
    
    private var emptyState: some View {
        VStack(spacing: 16) {
            Spacer()
            
            Image(systemName: "bookmark")
                .font(.system(size: 50))
                .foregroundColor(.gray.opacity(0.5))
            
            Text("No bookmarks yet")
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(.white)
            
            Text("Save content you want to revisit later")
                .font(.system(size: 14))
                .foregroundColor(.gray)
            
            Spacer()
        }
    }
    
    // MARK: - Bookmarks List
    
    private var bookmarksList: some View {
        ScrollView {
            LazyVStack(spacing: 12) {
                ForEach(manager.filteredBookmarks) { bookmark in
                    BookmarkRow(bookmark: bookmark) {
                        navigateToBookmark(bookmark)
                    } onDelete: {
                        withAnimation {
                            manager.removeBookmark(id: bookmark.id)
                        }
                    }
                }
            }
            .padding()
        }
    }
    
    // MARK: - Navigation
    
    private func navigateToBookmark(_ bookmark: BookmarkItem) {
        switch bookmark.type {
        case .course, .practice:
            selectedTab = 3 // Awakening
        case .cosmos, .entity:
            selectedTab = 2 // Cosmos
        case .timeline:
            selectedTab = 1 // Timeline
        case .alexandria:
            selectedTab = 4 // More
        }
        
        dismiss()
        
        // Post notification for deep navigation
        NotificationCenter.default.post(
            name: .bookmarkSelected,
            object: nil,
            userInfo: [
                "type": bookmark.type.rawValue,
                "destinationId": bookmark.destinationId
            ]
        )
    }
}

// MARK: - Bookmark Row

struct BookmarkRow: View {
    let bookmark: BookmarkItem
    let onTap: () -> Void
    let onDelete: () -> Void
    
    @State private var showingNotes = false
    
    var body: some View {
        Button(action: onTap) {
            HStack(spacing: 12) {
                // Icon
                Image(systemName: bookmark.type.icon)
                    .font(.system(size: 16))
                    .foregroundColor(bookmark.type.color)
                    .frame(width: 40, height: 40)
                    .background(bookmark.type.color.opacity(0.15))
                    .clipShape(Circle())
                
                // Text
                VStack(alignment: .leading, spacing: 2) {
                    Text(bookmark.title)
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundColor(.white)
                    
                    Text(bookmark.subtitle)
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                        .lineLimit(1)
                    
                    // Date added
                    Text(bookmark.dateAdded.formatted(date: .abbreviated, time: .omitted))
                        .font(.system(size: 10))
                        .foregroundColor(.gray.opacity(0.6))
                }
                
                Spacer()
                
                // Actions
                Menu {
                    Button {
                        showingNotes = true
                    } label: {
                        Label("Add Note", systemImage: "note.text")
                    }
                    
                    Button(role: .destructive, action: onDelete) {
                        Label("Remove", systemImage: "trash")
                    }
                } label: {
                    Image(systemName: "ellipsis")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                        .frame(width: 30, height: 30)
                }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.white.opacity(0.05))
            )
        }
        .buttonStyle(PlainButtonStyle())
    }
}

// MARK: - Bookmark Button Component

struct BookmarkButton: View {
    let id: String
    let title: String
    let subtitle: String
    let type: BookmarkType
    let destinationId: String
    
    @ObservedObject private var manager = BookmarksManager.shared
    
    var isBookmarked: Bool {
        manager.isBookmarked(id: id)
    }
    
    var body: some View {
        Button(action: {
            manager.toggleBookmark(
                id: id,
                title: title,
                subtitle: subtitle,
                type: type,
                destinationId: destinationId
            )
        }) {
            Image(systemName: isBookmarked ? "bookmark.fill" : "bookmark")
                .font(.system(size: 18))
                .foregroundColor(isBookmarked ? Palette.accent.gold : .white.opacity(0.6))
        }
        .buttonStyle(PlainButtonStyle())
    }
}

// MARK: - Notification Names

extension Notification.Name {
    static let bookmarkSelected = Notification.Name("bookmarkSelected")
}

// MARK: - Preview

#Preview {
    BookmarksView(selectedTab: .constant(0))
}
