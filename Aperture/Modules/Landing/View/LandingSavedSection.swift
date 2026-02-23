// LandingSavedSection.swift
// Quick-access saved modules, courses, and texts on the landing page
// ☀️ SunFlow: Reignited

import SwiftUI

struct LandingSavedSection: View {

    @Binding var selectedTab: Int
    @ObservedObject private var bookmarks = BookmarksManager.shared
    @State private var showAllBookmarks = false

    private var recentSaved: [BookmarkItem] {
        Array(bookmarks.bookmarks.prefix(6))
    }

    var body: some View {
        // Only render if there's something saved
        if !bookmarks.bookmarks.isEmpty {
            VStack(spacing: 14) {

                // Section header
                HStack {
                    HStack(spacing: 6) {
                        Image(systemName: "bookmark.fill")
                            .font(.system(size: 11))
                            .foregroundColor(Palette.accent.gold)
                        Text("SAVED")
                            .font(.system(size: 12, weight: .bold, design: .rounded))
                            .tracking(2)
                            .foregroundColor(Palette.accent.gold)
                    }

                    Spacer()

                    Button {
                        showAllBookmarks = true
                    } label: {
                        HStack(spacing: 3) {
                            Text("See All")
                                .font(.system(size: 12, weight: .medium))
                            Text("(\(bookmarks.bookmarks.count))")
                                .font(.system(size: 11))
                                .foregroundColor(Palette.text.muted)
                        }
                        .foregroundColor(Palette.primary.cyan)
                    }
                }

                // Horizontal scroll of saved cards
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(recentSaved) { bookmark in
                            SavedItemCard(bookmark: bookmark) {
                                navigateTo(bookmark)
                            } onRemove: {
                                withAnimation(.spring(response: 0.35)) {
                                    bookmarks.removeBookmark(id: bookmark.id)
                                }
                            }
                        }

                        // "More" overflow card if needed
                        if bookmarks.bookmarks.count > 6 {
                            overflowCard
                        }
                    }
                    .padding(.horizontal, 2)
                    .padding(.vertical, 4)
                }
            }
            .sheet(isPresented: $showAllBookmarks) {
                BookmarksView(selectedTab: $selectedTab)
            }
        }
    }

    // MARK: - Overflow Card

    private var overflowCard: some View {
        Button {
            showAllBookmarks = true
        } label: {
            VStack(spacing: 8) {
                ZStack {
                    Circle()
                        .fill(Color.white.opacity(0.08))
                        .frame(width: 44, height: 44)
                    Text("+\(bookmarks.bookmarks.count - 6)")
                        .font(.system(size: 14, weight: .bold, design: .rounded))
                        .foregroundColor(Palette.text.secondary)
                }

                Text("View All")
                    .font(.system(size: 11, weight: .medium))
                    .foregroundColor(Palette.text.muted)
            }
            .frame(width: 80)
            .padding(.vertical, 14)
            .background(
                RoundedRectangle(cornerRadius: 14)
                    .fill(Color.white.opacity(0.03))
                    .overlay(
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(Color.white.opacity(0.1), lineWidth: 1)
                    )
            )
        }
        .buttonStyle(.plain)
    }

    // MARK: - Navigation

    private func navigateTo(_ bookmark: BookmarkItem) {
        HapticManager.shared.selectionChanged()
        switch bookmark.type {
        case .course, .practice:
            selectedTab = 3 // Awakening
        case .cosmos, .entity:
            selectedTab = 2 // Cosmos
        case .timeline:
            selectedTab = 1 // Timeline
        case .alexandria:
            selectedTab = 4 // Alexandria Library
        }
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

// MARK: - Individual Saved Item Card

struct SavedItemCard: View {

    let bookmark: BookmarkItem
    let onTap: () -> Void
    let onRemove: () -> Void

    @State private var showRemoveOption = false

    var body: some View {
        Button(action: onTap) {
            VStack(alignment: .leading, spacing: 10) {

                HStack(alignment: .top) {
                    // Icon
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(bookmark.type.color.opacity(0.15))
                            .frame(width: 40, height: 40)
                        Image(systemName: bookmark.type.icon)
                            .font(.system(size: 18))
                            .foregroundColor(bookmark.type.color)
                    }

                    Spacer()

                    // Remove button (long press reveals)
                    if showRemoveOption {
                        Button {
                            onRemove()
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                                .font(.system(size: 16))
                                .foregroundColor(.gray.opacity(0.7))
                        }
                        .transition(.scale.combined(with: .opacity))
                    }
                }

                VStack(alignment: .leading, spacing: 3) {
                    Text(bookmark.title)
                        .font(.system(size: 13, weight: .semibold, design: .rounded))
                        .foregroundColor(Palette.text.primary)
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)

                    Text(bookmark.type.displayName)
                        .font(.system(size: 10, weight: .medium))
                        .foregroundColor(bookmark.type.color.opacity(0.8))
                }

                Spacer(minLength: 0)
            }
            .frame(width: 120, height: 120)
            .padding(12)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.white.opacity(0.04))
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(bookmark.type.color.opacity(0.2), lineWidth: 1)
                    )
            )
        }
        .buttonStyle(.plain)
        .onLongPressGesture(minimumDuration: 0.4) {
            HapticManager.shared.medium()
            withAnimation(.spring(response: 0.3)) {
                showRemoveOption.toggle()
            }
        }
    }
}
