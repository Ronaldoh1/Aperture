// TimelineEntryView.swift
// Aperture — Timeline Module
//
// Root entry for the Timeline tab.
// First launch → mode selector (Standard vs Extended).
// Returning users → directly into their saved mode.
// Nav bar toggle → switch mode anytime.

import SwiftUI
import Swinject

struct TimelineEntryView: View {
    
    // MARK: - Mode persistence
    @AppStorage("aperture_timeline_mode") private var savedMode: String = ""
    @State private var showModeSelector: Bool = false
    
    // MARK: - VIPER (for standard mode)
    private let presenter: TimelinePresenterType
    
    init(container: Container, onRoute: @escaping (TimelineRoute) -> Void) {
        print("🟡 TimelineEntryView: Starting initialization")
        
        let router = TimelineRouter(onRoute: onRoute)
        container.register(TimelineRouterType.self) { _ in router }
        print("🟡 TimelineEntryView: Router registered")
        
        self.presenter = container.resolve(TimelinePresenterType.self)!
        print("🟡 TimelineEntryView: Presenter resolved")
        
        _ = container.resolve(TimelineInteractorType.self)!
        print("🟡 TimelineEntryView: Interactor wired, interactor is \(presenter.interactor != nil ? "set ✓" : "NIL ❌")")
    }
    
    // MARK: - Computed
    
    private var activeMode: TimelineViewMode? {
        guard !savedMode.isEmpty else { return nil }
        return TimelineViewMode(rawValue: savedMode)
    }
    
    // MARK: - Body
    
    var body: some View {
        Group {
            if let mode = activeMode, !showModeSelector {
                activeView(for: mode)
                    .onReceive(NotificationCenter.default.publisher(for: .timelineRequestModeSwitch)) { _ in
                        withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                            showModeSelector = true
                        }
                    }
            } else {
                TimelineModeSelectionView(
                    onSelect: { mode in
                        withAnimation(.easeInOut(duration: 0.3)) {
                            savedMode = mode.rawValue
                            showModeSelector = false
                        }
                    },
                    canDismiss: !savedMode.isEmpty,
                    onDismiss: { showModeSelector = false }
                )
            }
        }
    }
    
    // MARK: - Active View
    
    @ViewBuilder
    private func activeView(for mode: TimelineViewMode) -> some View {
        switch mode {
        case .standard:
            TimelineView(presenter: presenter)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        modeSwitchButton
                    }
                }
        case .extended:
            NavigationStack {
                TimelineExtendedWebView()
                    .navigationTitle("Timeline")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            modeSwitchButton
                        }
                    }
            }
        }
    }
    
    // MARK: - Mode Switch Button
    
    private var modeSwitchButton: some View {
        Button {
            withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                showModeSelector = true
            }
        } label: {
            HStack(spacing: 5) {
                Image(systemName: activeMode == .extended ? "hourglass.tophalf.filled" : "clock.arrow.circlepath")
                    .font(.system(size: 12, weight: .medium))
                Text(activeMode?.title ?? "")
                    .font(.system(size: 12, weight: .semibold))
                Image(systemName: "chevron.down")
                    .font(.system(size: 10, weight: .medium))
            }
            .foregroundColor(Palette.accent.gold)
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(
                Capsule()
                    .fill(Palette.accent.gold.opacity(0.1))
                    .overlay(
                        Capsule()
                            .stroke(Palette.accent.gold.opacity(0.35), lineWidth: 1)
                    )
            )
        }
    }
}
