// LessonView.swift
// Individual lesson reading experience

import SwiftUI

struct LessonView: View {
    let lesson: ConsciousnessModule.Lesson
    let module: ConsciousnessModule
    @Binding var progress: CourseProgress
    @Environment(\.dismiss) var dismiss
    
    @State private var showReflections = false
    @State private var showFurtherReading = false
    @State private var notes: String = ""
    
    private var isComplete: Bool {
        progress.completedLessons.contains(lesson.id)
    }
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Header
                lessonHeader
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 24) {
                        lessonTitle
                        contentBlocks
                        keyTakeaways
                        reflectionSection
                        furtherReadingSection
                        notesSection
                        completeButton
                        Spacer(minLength: 60)
                    }
                    .padding(.horizontal, 20)
                }
            }
        }
        .onAppear { loadNotes() }
    }
    
    // MARK: - Header
    
    private var lessonHeader: some View {
        HStack {
            Button(action: { dismiss() }) {
                HStack(spacing: 6) {
                    Image(systemName: "chevron.left").font(.system(size: 14, weight: .semibold))
                    Text("Module").font(.system(size: 15, weight: .medium))
                }
                .foregroundColor(module.color)
            }
            Spacer()
            Text("Lesson \(lesson.number)").font(.system(size: 14, weight: .bold, design: .rounded)).foregroundColor(Palette.text.muted)
            Spacer()
            HStack(spacing: 4) {
                Image(systemName: "clock").font(.system(size: 12))
                Text("\(lesson.duration) min").font(.system(size: 12, weight: .semibold, design: .rounded))
            }
            .foregroundColor(Palette.text.muted)
        }
        .padding(.horizontal, 20).padding(.top, 16).padding(.bottom, 12)
    }
    
    // MARK: - Title
    
    private var lessonTitle: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 8) {
                Text("MODULE \(module.number)")
                    .font(.system(size: 11, weight: .bold, design: .rounded))
                    .tracking(1)
                    .foregroundColor(module.color)
                
                if isComplete {
                    HStack(spacing: 4) {
                        Image(systemName: "checkmark.circle.fill").font(.system(size: 12))
                        Text("Completed").font(.system(size: 11, weight: .bold, design: .rounded))
                    }
                    .foregroundColor(Color.green)
                }
            }
            
            Text(lesson.title)
                .font(.system(size: 26, weight: .bold, design: .rounded))
                .foregroundColor(Palette.text.primary)
        }
        .padding(.top, 8)
    }
    
    // MARK: - Content Blocks
    
    private var contentBlocks: some View {
        VStack(alignment: .leading, spacing: 20) {
            ForEach(lesson.content) { block in
                contentBlockView(block)
            }
        }
    }
    
    @ViewBuilder
    private func contentBlockView(_ block: ConsciousnessModule.ContentBlock) -> some View {
        switch block {
        case .text(let text):
            Text(text)
                .font(.system(size: 16, weight: .regular, design: .rounded))
                .foregroundColor(Palette.text.primary)
                .lineSpacing(7)
            
        case .quote(let text, let author):
            VStack(alignment: .leading, spacing: 8) {
                HStack(alignment: .top, spacing: 12) {
                    Rectangle()
                        .fill(module.color)
                        .frame(width: 3)
                    
                    Text(text)
                        .font(.system(size: 15, weight: .medium, design: .serif))
                        .italic()
                        .foregroundColor(Palette.text.primary.opacity(0.9))
                        .lineSpacing(5)
                }
                
                Text("— \(author)")
                    .font(.system(size: 13, weight: .semibold, design: .rounded))
                    .foregroundColor(module.color)
                    .padding(.leading, 15)
            }
            .padding(.vertical, 8)
            
        case .concept(let title, let explanation):
            VStack(alignment: .leading, spacing: 8) {
                HStack(spacing: 8) {
                    Image(systemName: "lightbulb.fill")
                        .font(.system(size: 14))
                        .foregroundColor(Palette.accent.gold)
                    Text(title)
                        .font(.system(size: 15, weight: .bold, design: .rounded))
                        .foregroundColor(Palette.accent.gold)
                }
                
                Text(explanation)
                    .font(.system(size: 14, weight: .medium, design: .rounded))
                    .foregroundColor(Palette.text.primary)
                    .lineSpacing(5)
            }
            .padding(14)
            .background(
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .fill(Palette.accent.gold.opacity(0.1))
                    .overlay(RoundedRectangle(cornerRadius: 12, style: .continuous).stroke(Palette.accent.gold.opacity(0.3), lineWidth: 1))
            )
            
        case .warning(let text):
            HStack(alignment: .top, spacing: 12) {
                Image(systemName: "exclamationmark.triangle.fill")
                    .font(.system(size: 16))
                    .foregroundColor(Palette.primary.orange)
                
                Text(text)
                    .font(.system(size: 14, weight: .medium, design: .rounded))
                    .foregroundColor(Palette.text.primary)
                    .lineSpacing(4)
            }
            .padding(14)
            .background(
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .fill(Palette.primary.orange.opacity(0.1))
                    .overlay(RoundedRectangle(cornerRadius: 12, style: .continuous).stroke(Palette.primary.orange.opacity(0.3), lineWidth: 1))
            )
            
        case .insight(let text):
            HStack(alignment: .top, spacing: 12) {
                Image(systemName: "sparkles")
                    .font(.system(size: 16))
                    .foregroundColor(Palette.primary.cyan)
                
                Text(text)
                    .font(.system(size: 15, weight: .semibold, design: .rounded))
                    .foregroundColor(Palette.primary.cyan)
                    .lineSpacing(5)
            }
            .padding(14)
            .background(
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .fill(Palette.primary.cyan.opacity(0.1))
                    .overlay(RoundedRectangle(cornerRadius: 12, style: .continuous).stroke(Palette.primary.cyan.opacity(0.3), lineWidth: 1))
            )
            
        case .practice(let title, let instructions, let duration):
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    HStack(spacing: 6) {
                        Image(systemName: "figure.mind.and.body")
                            .font(.system(size: 14))
                        Text("PRACTICE")
                            .font(.system(size: 11, weight: .bold, design: .rounded))
                            .tracking(1)
                    }
                    .foregroundColor(Color.green)
                    
                    Spacer()
                    
                    Text(duration)
                        .font(.system(size: 11, weight: .semibold, design: .rounded))
                        .foregroundColor(Palette.text.muted)
                }
                
                Text(title)
                    .font(.system(size: 16, weight: .bold, design: .rounded))
                    .foregroundColor(Palette.text.primary)
                
                Text(instructions)
                    .font(.system(size: 14, weight: .medium, design: .rounded))
                    .foregroundColor(Palette.text.primary.opacity(0.9))
                    .lineSpacing(5)
            }
            .padding(14)
            .background(
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .fill(Color.green.opacity(0.1))
                    .overlay(RoundedRectangle(cornerRadius: 12, style: .continuous).stroke(Color.green.opacity(0.3), lineWidth: 1))
            )
        }
    }
    
    // MARK: - Key Takeaways
    
    private var keyTakeaways: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 8) {
                Image(systemName: "key.fill").font(.system(size: 14)).foregroundColor(module.color)
                Text("KEY TAKEAWAYS").font(.system(size: 11, weight: .bold, design: .rounded)).tracking(1).foregroundColor(module.color)
            }
            
            ForEach(lesson.keyTakeaways, id: \.self) { takeaway in
                HStack(alignment: .top, spacing: 10) {
                    Image(systemName: "checkmark.circle.fill")
                        .font(.system(size: 14))
                        .foregroundColor(module.color)
                        .padding(.top, 2)
                    
                    Text(takeaway)
                        .font(.system(size: 14, weight: .medium, design: .rounded))
                        .foregroundColor(Palette.text.primary)
                        .lineSpacing(4)
                }
            }
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 14, style: .continuous)
                .fill(module.color.opacity(0.1))
                .overlay(RoundedRectangle(cornerRadius: 14, style: .continuous).stroke(module.color.opacity(0.3), lineWidth: 1))
        )
    }
    
    // MARK: - Reflection Section
    
    private var reflectionSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Button {
                withAnimation { showReflections.toggle() }
            } label: {
                HStack {
                    HStack(spacing: 8) {
                        Image(systemName: "bubble.left.and.bubble.right.fill").font(.system(size: 14)).foregroundColor(Palette.primary.violet)
                        Text("REFLECTION PROMPTS").font(.system(size: 11, weight: .bold, design: .rounded)).tracking(1).foregroundColor(Palette.primary.violet)
                    }
                    Spacer()
                    Image(systemName: showReflections ? "chevron.up" : "chevron.down")
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(Palette.text.muted)
                }
            }
            
            if showReflections {
                ForEach(lesson.reflectionPrompts, id: \.self) { prompt in
                    HStack(alignment: .top, spacing: 10) {
                        Text("?")
                            .font(.system(size: 16, weight: .bold, design: .rounded))
                            .foregroundColor(Palette.primary.violet)
                            .frame(width: 20)
                        
                        Text(prompt)
                            .font(.system(size: 14, weight: .medium, design: .rounded))
                            .italic()
                            .foregroundColor(Palette.text.primary)
                            .lineSpacing(4)
                    }
                    .padding(12)
                    .background(RoundedRectangle(cornerRadius: 10, style: .continuous).fill(Palette.primary.violet.opacity(0.1)))
                }
            }
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 14, style: .continuous)
                .fill(Color.white.opacity(0.05))
        )
    }
    
    // MARK: - Further Reading
    
    private var furtherReadingSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Button {
                withAnimation { showFurtherReading.toggle() }
            } label: {
                HStack {
                    HStack(spacing: 8) {
                        Image(systemName: "book.fill").font(.system(size: 14)).foregroundColor(Palette.text.secondary)
                        Text("FURTHER READING").font(.system(size: 11, weight: .bold, design: .rounded)).tracking(1).foregroundColor(Palette.text.secondary)
                    }
                    Spacer()
                    Image(systemName: showFurtherReading ? "chevron.up" : "chevron.down")
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(Palette.text.muted)
                }
            }
            
            if showFurtherReading {
                ForEach(lesson.furtherReading, id: \.self) { book in
                    HStack(spacing: 10) {
                        Image(systemName: "book.closed")
                            .font(.system(size: 12))
                            .foregroundColor(Palette.text.muted)
                        
                        Text(book)
                            .font(.system(size: 13, weight: .medium, design: .rounded))
                            .foregroundColor(Palette.text.primary)
                    }
                }
            }
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 14, style: .continuous)
                .fill(Color.white.opacity(0.05))
        )
    }
    
    // MARK: - Notes Section
    
    private var notesSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 8) {
                Image(systemName: "pencil.circle.fill").font(.system(size: 14)).foregroundColor(Palette.accent.gold)
                Text("YOUR NOTES").font(.system(size: 11, weight: .bold, design: .rounded)).tracking(1).foregroundColor(Palette.accent.gold)
            }
            
            TextEditor(text: $notes)
                .font(.system(size: 14, weight: .regular, design: .rounded))
                .foregroundColor(Palette.text.primary)
                .scrollContentBackground(.hidden)
                .frame(minHeight: 80, maxHeight: 150)
                .padding(10)
                .background(RoundedRectangle(cornerRadius: 10, style: .continuous).fill(Color.white.opacity(0.05)))
                .onChange(of: notes) { _ in saveNotes() }
            
            Text("Notes are saved automatically")
                .font(.system(size: 11, weight: .medium, design: .rounded))
                .foregroundColor(Palette.text.muted)
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 14, style: .continuous)
                .fill(Color.white.opacity(0.05))
        )
    }
    
    // MARK: - Complete Button
    
    private var completeButton: some View {
        Button {
            markComplete()
        } label: {
            HStack(spacing: 10) {
                Image(systemName: isComplete ? "checkmark.circle.fill" : "circle")
                    .font(.system(size: 20))
                Text(isComplete ? "Lesson Completed ✓" : "Mark as Complete")
                    .font(.system(size: 16, weight: .bold, design: .rounded))
            }
            .foregroundColor(isComplete ? Color.green : .black)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .background(
                RoundedRectangle(cornerRadius: 14, style: .continuous)
                    .fill(isComplete ? Color.green.opacity(0.2) : module.color)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 14, style: .continuous)
                    .stroke(isComplete ? Color.green : Color.clear, lineWidth: 2)
            )
        }
        .disabled(isComplete)
    }
    
    // MARK: - Data
    
    private func markComplete() {
        if !progress.completedLessons.contains(lesson.id) {
            progress.completedLessons.append(lesson.id)
            progress.lastAccessDate = Date()
            saveProgress()
        }
    }
    
    private func saveProgress() {
        if let data = try? JSONEncoder().encode(progress) {
            UserDefaults.standard.set(data, forKey: "consciousness_course_progress")
        }
    }
    
    private func loadNotes() {
        notes = progress.notes[lesson.id] ?? ""
    }
    
    private func saveNotes() {
        progress.notes[lesson.id] = notes
        saveProgress()
    }
}
