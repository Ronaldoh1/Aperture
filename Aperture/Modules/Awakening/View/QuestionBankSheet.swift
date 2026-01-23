// QuestionBankSheet.swift

import SwiftUI

struct QuestionBankSheet: View {
    let entries: [QuestionEntry]
    let onSave: (QuestionEntry) -> Void
    let onDismiss: () -> Void
    
    @State private var selectedCategory: QuestionEntry.QuestionCategory?
    @State private var selectedQuestion: QuestionEntry?
    @State private var newQuestion: QuestionEntry?
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack(spacing: 0) {
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Question Bank").font(.system(size: 20, weight: .bold, design: .rounded)).foregroundColor(Palette.text.primary)
                        Text("Socratic questions to challenge assumptions").font(.system(size: 13, weight: .medium, design: .rounded)).foregroundColor(Palette.primary.orange)
                    }
                    Spacer()
                    Button(action: onDismiss) { Image(systemName: "xmark.circle.fill").font(.system(size: 28)).foregroundColor(Palette.text.secondary) }
                }
                .padding(.horizontal, 20).padding(.top, 20).padding(.bottom, 16)
                
                HStack(spacing: 20) {
                    statBox(value: "\(entries.count)", label: "Total", color: Palette.primary.orange)
                    statBox(value: "\(entries.filter { $0.isAnswered }.count)", label: "Answered", color: Color.green)
                    statBox(value: "\(entries.filter { !$0.isAnswered }.count)", label: "Pending", color: Palette.text.muted)
                }
                .padding(.horizontal, 20).padding(.bottom, 16)
                
                Button { generateNewQuestion() } label: {
                    HStack { Image(systemName: "sparkles"); Text("Generate New Question").font(.system(size: 15, weight: .bold, design: .rounded)) }
                    .foregroundColor(.black).frame(maxWidth: .infinity).padding(.vertical, 14)
                    .background(RoundedRectangle(cornerRadius: 12, style: .continuous).fill(LinearGradient(colors: [Palette.primary.orange, Palette.accent.gold], startPoint: .leading, endPoint: .trailing)))
                }
                .padding(.horizontal, 20).padding(.bottom, 16)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 8) {
                        Button { selectedCategory = nil } label: {
                            Text("All").font(.system(size: 12, weight: .semibold, design: .rounded)).foregroundColor(selectedCategory == nil ? .black : Palette.text.secondary).padding(.horizontal, 14).padding(.vertical, 8).background(Capsule().fill(selectedCategory == nil ? Palette.primary.orange : Color.white.opacity(0.1)))
                        }
                        ForEach(QuestionEntry.QuestionCategory.allCases, id: \.self) { category in
                            Button { selectedCategory = category } label: {
                                HStack(spacing: 4) { Image(systemName: category.icon).font(.system(size: 10)); Text(category.rawValue).font(.system(size: 11, weight: .semibold, design: .rounded)) }
                                .foregroundColor(selectedCategory == category ? .black : category.color).padding(.horizontal, 12).padding(.vertical, 8)
                                .background(Capsule().fill(selectedCategory == category ? category.color : category.color.opacity(0.15)))
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                }
                .padding(.bottom, 16)
                
                if filteredEntries.isEmpty {
                    Spacer()
                    VStack(spacing: 16) {
                        Image(systemName: "questionmark.circle").font(.system(size: 50)).foregroundColor(Palette.primary.orange.opacity(0.5))
                        Text("No questions yet").font(.system(size: 18, weight: .semibold, design: .rounded)).foregroundColor(Palette.text.secondary)
                        Text("Tap ✨ to generate a new question").font(.system(size: 14, weight: .medium, design: .rounded)).foregroundColor(Palette.text.muted)
                    }
                    Spacer()
                } else {
                    ScrollView {
                        LazyVStack(spacing: 12) {
                            ForEach(filteredEntries) { entry in
                                QuestionCard(entry: entry).onTapGesture { selectedQuestion = entry }
                            }
                        }
                        .padding(.horizontal, 20).padding(.bottom, 40)
                    }
                }
            }
        }
        .sheet(item: $selectedQuestion) { question in AnswerQuestionView(question: question, onSave: onSave) { selectedQuestion = nil } }
        .sheet(item: $newQuestion) { question in AnswerQuestionView(question: question, onSave: onSave) { newQuestion = nil } }
    }
    
    private var filteredEntries: [QuestionEntry] {
        let sorted = entries.sorted { $0.askedDate > $1.askedDate }
        if let category = selectedCategory { return sorted.filter { $0.category == category } }
        return sorted
    }
    
    private func generateNewQuestion() {
        let question = QuestionBank.getRandomQuestion()
        onSave(question)
        newQuestion = question
    }
    
    private func statBox(value: String, label: String, color: Color) -> some View {
        VStack(spacing: 4) {
            Text(value).font(.system(size: 24, weight: .bold, design: .rounded)).foregroundColor(color)
            Text(label).font(.system(size: 11, weight: .medium, design: .rounded)).foregroundColor(Palette.text.muted)
        }
        .frame(maxWidth: .infinity).padding(.vertical, 12)
        .background(RoundedRectangle(cornerRadius: 12, style: .continuous).fill(color.opacity(0.1)))
    }
}

struct QuestionCard: View {
    let entry: QuestionEntry
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                HStack(spacing: 4) { Image(systemName: entry.category.icon).font(.system(size: 10)); Text(entry.category.rawValue).font(.system(size: 10, weight: .semibold, design: .rounded)) }
                .foregroundColor(entry.category.color).padding(.horizontal, 8).padding(.vertical, 4)
                .background(Capsule().fill(entry.category.color.opacity(0.15)))
                Spacer()
                if entry.isAnswered { HStack(spacing: 4) { Image(systemName: "checkmark.circle.fill").font(.system(size: 10)); Text("Answered").font(.system(size: 10, weight: .semibold, design: .rounded)) }.foregroundColor(Color.green) }
                else { Text("Tap to reflect").font(.system(size: 10, weight: .medium, design: .rounded)).foregroundColor(Palette.text.muted) }
            }
            Text(entry.question).font(.system(size: 16, weight: .semibold, design: .rounded)).foregroundColor(Palette.text.primary).lineSpacing(4)
            if let reflection = entry.reflection, !reflection.isEmpty { Text(reflection).font(.system(size: 13)).foregroundColor(Palette.text.secondary).lineLimit(2) }
            Text(entry.askedDate, style: .date).font(.system(size: 11, weight: .medium, design: .rounded)).foregroundColor(Palette.text.muted)
        }
        .padding(16)
        .background(RoundedRectangle(cornerRadius: 14, style: .continuous).fill(Color.white.opacity(0.05)).overlay(RoundedRectangle(cornerRadius: 14, style: .continuous).stroke(entry.category.color.opacity(0.2), lineWidth: 1)))
    }
}

struct AnswerQuestionView: View {
    let question: QuestionEntry
    let onSave: (QuestionEntry) -> Void
    let onDismiss: () -> Void
    
    @State private var reflection: String
    
    init(question: QuestionEntry, onSave: @escaping (QuestionEntry) -> Void, onDismiss: @escaping () -> Void) {
        self.question = question
        self.onSave = onSave
        self.onDismiss = onDismiss
        _reflection = State(initialValue: question.reflection ?? "")
    }
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack(spacing: 0) {
                HStack {
                    Text("Reflect").font(.system(size: 20, weight: .bold, design: .rounded)).foregroundColor(Palette.text.primary)
                    Spacer()
                    Button(action: onDismiss) { Image(systemName: "xmark.circle.fill").font(.system(size: 28)).foregroundColor(Palette.text.secondary) }
                }
                .padding(.horizontal, 20).padding(.top, 20).padding(.bottom, 24)
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 24) {
                        VStack(alignment: .leading, spacing: 12) {
                            HStack(spacing: 6) { Image(systemName: question.category.icon).font(.system(size: 12)); Text(question.category.rawValue).font(.system(size: 12, weight: .semibold, design: .rounded)) }.foregroundColor(question.category.color)
                            Text(question.question)
                                .font(.system(size: 22, weight: .bold, design: .rounded))
                                .foregroundStyle(LinearGradient(colors: [question.category.color, Palette.text.primary], startPoint: .leading, endPoint: .trailing))
                                .lineSpacing(6)
                        }
                        .padding(20)
                        .background(RoundedRectangle(cornerRadius: 16, style: .continuous).fill(question.category.color.opacity(0.1)).overlay(RoundedRectangle(cornerRadius: 16, style: .continuous).stroke(question.category.color.opacity(0.25), lineWidth: 1)))
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("YOUR REFLECTION").font(.system(size: 12, weight: .bold, design: .rounded)).tracking(1).foregroundColor(Palette.accent.gold)
                            Text("Take your time. This is for you, not for anyone else.").font(.system(size: 13, weight: .medium, design: .rounded)).foregroundColor(Palette.text.muted).lineSpacing(4)
                        }
                        
                        ZStack(alignment: .topLeading) {
                            if reflection.isEmpty { Text("Let your thoughts flow freely...").font(.system(size: 15)).foregroundColor(Palette.text.muted).padding(.top, 14).padding(.leading, 14) }
                            TextEditor(text: $reflection).font(.system(size: 15)).foregroundColor(Palette.text.primary).scrollContentBackground(.hidden).frame(minHeight: 200)
                        }
                        .padding(10)
                        .background(RoundedRectangle(cornerRadius: 14, style: .continuous).fill(Color.white.opacity(0.05)).overlay(RoundedRectangle(cornerRadius: 14, style: .continuous).stroke(Palette.accent.gold.opacity(0.3), lineWidth: 1)))
                        
                        Button { saveReflection() } label: {
                            HStack { Image(systemName: "checkmark.circle.fill"); Text("Save Reflection").font(.system(size: 16, weight: .bold, design: .rounded)) }
                            .foregroundColor(.black).frame(maxWidth: .infinity).padding(.vertical, 16)
                            .background(RoundedRectangle(cornerRadius: 14, style: .continuous).fill(LinearGradient(colors: [Palette.accent.gold, Palette.primary.orange], startPoint: .leading, endPoint: .trailing)))
                        }
                        .disabled(reflection.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                        .opacity(reflection.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ? 0.5 : 1.0)
                        
                        HStack(alignment: .top, spacing: 10) {
                            Text("🐉").font(.system(size: 18))
                            Text("\"The quality of your questions determines the quality of your life. Sit with this. Don't rush to an answer.\"")
                                .font(.system(size: 13, weight: .medium, design: .rounded)).italic().foregroundColor(Palette.accent.gold.opacity(0.8)).lineSpacing(4)
                        }
                        .padding(14)
                        .background(RoundedRectangle(cornerRadius: 12, style: .continuous).fill(Palette.accent.gold.opacity(0.1)))
                        
                        Spacer(minLength: 40)
                    }
                    .padding(.horizontal, 20)
                }
            }
        }
    }
    
    private func saveReflection() {
        var updated = question
        updated.reflection = reflection.trimmingCharacters(in: .whitespacesAndNewlines)
        updated.answeredDate = Date()
        onSave(updated)
        onDismiss()
    }
}
