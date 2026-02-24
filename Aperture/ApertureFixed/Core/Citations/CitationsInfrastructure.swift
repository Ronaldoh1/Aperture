// CitationsInfrastructure.swift
// SunFlow: Reignited — Aperture
// Shared citations toolbar button + generic fallback citations

import SwiftUI

// MARK: - Consistent Citations Toolbar Button

struct CitationsToolbarButton: ToolbarContent {
    let onTap: () -> Void
    var tintColor: Color = .white.opacity(0.5)

    var body: some ToolbarContent {
        ToolbarItem(placement: .navigationBarTrailing) {
            Button(action: onTap) {
                Image(systemName: "books.vertical.fill")
                    .font(.system(size: 13))
                    .foregroundColor(tintColor)
            }
            .accessibilityLabel("Sources and Citations")
            .accessibilityHint("View research sources and further reading")
        }
    }
}

// MARK: - Fallback Citations (for courses pending full bibliography)

let genericFallbackCitations: [CourseCitation] = [
    CourseCitation(
        id: "generic_in_progress",
        type: .furtherReading,
        title: "Full Citations In Progress",
        author: "SunFlow: Reignited",
        year: "2025",
        publisher: "Aperture",
        url: nil,
        doi: nil,
        note: "We are committed to citing every factual claim. Course-specific citations for this module are being compiled and will appear in the next update. Claims are sourced — the bibliography is being formatted.",
        tags: ["in-progress"]
    )
]
