// NarratableContentView.swift
// Reusable component for any text-heavy content with built-in narration
// Use throughout Aperture for courses, articles, and educational content

import SwiftUI

// MARK: - Narratable Content

struct NarratableContent: Identifiable {
    let id = UUID()
    let title: String?
    let paragraphs: [String]
    let icon: String?
    
    init(title: String? = nil, paragraphs: [String], icon: String? = nil) {
        self.title = title
        self.paragraphs = paragraphs
        self.icon = icon
    }
    
    init(title: String? = nil, text: String, icon: String? = nil) {
        self.title = title
        self.paragraphs = text.components(separatedBy: "\n\n").filter { !$0.isEmpty }
        self.icon = icon
    }
    
    var fullText: String {
        paragraphs.joined(separator: "\n\n")
    }
}

// MARK: - Narratable Content View

struct NarratableContentView: View {
    
    let content: NarratableContent
    var showTitle: Bool = true
    var accentColor: Color = Palette.accent.gold
    
    @ObservedObject private var tts = TextToSpeechManager.shared
    @State private var currentlyReadingIndex: Int = -1
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Header with narration button
            if showTitle || content.title != nil {
                HStack {
                    if let icon = content.icon {
                        Image(systemName: icon)
                            .font(.system(size: 18))
                            .foregroundColor(accentColor)
                    }
                    
                    if let title = content.title {
                        Text(title)
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.white)
                    }
                    
                    Spacer()
                    
                    // Narration button
                    narrationButton
                }
            } else {
                HStack {
                    Spacer()
                    narrationButton
                }
            }
            
            // Progress bar when narrating
            if isNarrating {
                GeometryReader { geo in
                    ZStack(alignment: .leading) {
                        Capsule()
                            .fill(Color.white.opacity(0.1))
                        
                        Capsule()
                            .fill(accentColor)
                            .frame(width: geo.size.width * tts.progress)
                    }
                }
                .frame(height: 3)
            }
            
            // Content paragraphs
            ForEach(Array(content.paragraphs.enumerated()), id: \.offset) { index, paragraph in
                Text(paragraph)
                    .font(.system(size: 15))
                    .foregroundColor(.white.opacity(0.9))
                    .lineSpacing(6)
                    .padding(isCurrentParagraph(index) ? 12 : 0)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(isCurrentParagraph(index) ? accentColor.opacity(0.1) : Color.clear)
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(isCurrentParagraph(index) ? accentColor.opacity(0.3) : Color.clear, lineWidth: 1)
                    )
                    .animation(.easeInOut(duration: 0.3), value: tts.currentParagraphIndex)
            }
        }
    }
    
    private var narrationButton: some View {
        Button {
            HapticManager.shared.medium()
            toggleNarration()
        } label: {
            HStack(spacing: 6) {
                Image(systemName: narrationIcon)
                    .font(.system(size: 12))
                
                Text(narrationText)
                    .font(.system(size: 13, weight: .medium))
            }
            .foregroundColor(accentColor)
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(
                Capsule()
                    .fill(accentColor.opacity(0.15))
            )
        }
    }
    
    private var isNarrating: Bool {
        tts.isSpeaking && tts.currentText == content.paragraphs[safe: tts.currentParagraphIndex]
    }
    
    private var narrationIcon: String {
        if isNarrating {
            return tts.isPaused ? "play.fill" : "pause.fill"
        }
        return "play.fill"
    }
    
    private var narrationText: String {
        if isNarrating {
            return tts.isPaused ? "Resume" : "Pause"
        }
        return "Listen"
    }
    
    private func isCurrentParagraph(_ index: Int) -> Bool {
        guard tts.autoHighlight else { return false }
        return isNarrating && tts.currentParagraphIndex == index
    }
    
    private func toggleNarration() {
        if isNarrating {
            tts.togglePlayPause()
        } else {
            tts.speakParagraphs(content.paragraphs)
        }
    }
}

// MARK: - Narratable Article View

struct NarratableArticleView: View {
    
    let title: String
    let subtitle: String?
    let content: [NarratableContent]
    var heroIcon: String = "book.fill"
    var accentColor: Color = Palette.accent.gold
    
    @Environment(\.dismiss) private var dismiss
    @ObservedObject private var tts = TextToSpeechManager.shared
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(hex: "#0a0a1a").ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 24) {
                        // Hero
                        VStack(spacing: 12) {
                            ZStack {
                                Circle()
                                    .fill(accentColor.opacity(0.2))
                                    .frame(width: 80, height: 80)
                                
                                Image(systemName: heroIcon)
                                    .font(.system(size: 32))
                                    .foregroundColor(accentColor)
                            }
                            
                            Text(title)
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                            
                            if let subtitle = subtitle {
                                Text(subtitle)
                                    .font(.system(size: 14))
                                    .foregroundColor(accentColor)
                            }
                        }
                        .padding(.top, 20)
                        
                        // Full article narration
                        fullNarrationButton
                        
                        // Content sections
                        ForEach(content) { section in
                            NarratableContentView(
                                content: section,
                                accentColor: accentColor
                            )
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(Color.white.opacity(0.03))
                            )
                        }
                        
                        Spacer(minLength: 100)
                    }
                    .padding(.horizontal)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        tts.stop()
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                    }
                }
            }
        }
        .onDisappear {
            tts.stop()
        }
    }
    
    private var fullNarrationButton: some View {
        Button {
            HapticManager.shared.medium()
            if tts.isSpeaking {
                tts.togglePlayPause()
            } else {
                let allParagraphs = content.flatMap { $0.paragraphs }
                tts.speakParagraphs(allParagraphs)
            }
        } label: {
            HStack(spacing: 12) {
                Image(systemName: tts.isSpeaking && !tts.isPaused ? "pause.circle.fill" : "play.circle.fill")
                    .font(.system(size: 24))
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(tts.isSpeaking ? (tts.isPaused ? "Paused" : "Playing") : "Listen to Article")
                        .font(.system(size: 14, weight: .semibold))
                    
                    if tts.isSpeaking {
                        Text("\(Int(tts.progress * 100))% complete")
                            .font(.system(size: 11))
                            .foregroundColor(.white.opacity(0.6))
                    }
                }
                
                Spacer()
                
                if tts.isSpeaking {
                    Button {
                        tts.stop()
                    } label: {
                        Image(systemName: "stop.fill")
                            .foregroundColor(.gray)
                    }
                }
            }
            .foregroundColor(.white)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(accentColor.opacity(0.15))
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(accentColor.opacity(0.2), lineWidth: 1)
                    )
            )
        }
    }
}

// MARK: - Mini Narration Pill

struct MiniNarrationPill: View {
    
    let text: String
    var size: NarrationPillSize = .regular
    
    @ObservedObject private var tts = TextToSpeechManager.shared
    
    enum NarrationPillSize {
        case compact, regular
        
        var iconSize: CGFloat {
            switch self {
            case .compact: return 10
            case .regular: return 12
            }
        }
        
        var padding: CGFloat {
            switch self {
            case .compact: return 6
            case .regular: return 8
            }
        }
    }
    
    var body: some View {
        Button {
            HapticManager.shared.light()
            if tts.isSpeaking && tts.currentText == text {
                tts.togglePlayPause()
            } else {
                tts.speak(text)
            }
        } label: {
            Image(systemName: isPlaying ? "pause.fill" : "speaker.wave.2.fill")
                .font(.system(size: size.iconSize))
                .foregroundColor(Palette.accent.gold)
                .padding(size.padding)
                .background(
                    Circle()
                        .fill(Palette.accent.gold.opacity(0.15))
                )
        }
    }
    
    private var isPlaying: Bool {
        tts.isSpeaking && !tts.isPaused && tts.currentText == text
    }
}


// MARK: - Preview

#Preview("Narratable Content") {
    ZStack {
        Color.black.ignoresSafeArea()
        
        ScrollView {
            VStack(spacing: 20) {
                NarratableContentView(
                    content: NarratableContent(
                        title: "The Nature of Consciousness",
                        paragraphs: [
                            "Consciousness is the fundamental substrate of reality. Everything you perceive, think, and feel arises within this field of awareness.",
                            "Your body is not the source of consciousness—it's more like an antenna that receives and transmits it. When the body ceases, consciousness doesn't end; it simply changes form.",
                            "This understanding transforms how we approach life. Instead of desperately clinging to physical existence, we can engage with it as a temporary expression of something eternal."
                        ],
                        icon: "brain.head.profile"
                    ),
                    accentColor: Palette.primary.cyan
                )
                .padding()
            }
        }
    }
}
