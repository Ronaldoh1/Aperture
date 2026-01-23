// CognitiveDissonanceSheet.swift

import SwiftUI

struct CognitiveDissonanceSheet: View {
    let entries: [CognitiveDissonanceEntry]
    let onSave: (CognitiveDissonanceEntry) -> Void
    let onDismiss: () -> Void
    
    @State private var showAddEntry = false
    @State private var selectedEntry: CognitiveDissonanceEntry?
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack(spacing: 0) {
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Cognitive Dissonance").font(.system(size: 20, weight: .bold, design: .rounded)).foregroundColor(Palette.text.primary)
                        Text("When reality ≠ what you were taught").font(.system(size: 13, weight: .medium, design: .rounded)).foregroundColor(Palette.primary.violet)
                    }
                    Spacer()
                    Button(action: onDismiss) { Image(systemName: "xmark.circle.fill").font(.system(size: 28)).foregroundColor(Palette.text.secondary) }
                }
                .padding(.horizontal, 20).padding(.top, 20).padding(.bottom, 16)
                
                Button { showAddEntry = true } label: {
                    HStack { Image(systemName: "plus.circle.fill"); Text("Log Dissonance").font(.system(size: 15, weight: .bold, design: .rounded)) }
                    .foregroundColor(.black).frame(maxWidth: .infinity).padding(.vertical, 14)
                    .background(RoundedRectangle(cornerRadius: 12, style: .continuous).fill(Palette.primary.violet))
                }
                .padding(.horizontal, 20).padding(.bottom, 16)
                
                HStack(spacing: 20) {
                    statBox(value: "\(entries.count)", label: "Total", color: Palette.primary.violet)
                    statBox(value: "\(entries.filter { $0.resolved }.count)", label: "Resolved", color: Color.green)
                    statBox(value: "\(entries.filter { !$0.resolved }.count)", label: "Open", color: Palette.primary.orange)
                }
                .padding(.horizontal, 20).padding(.bottom, 16)
                
                if entries.isEmpty {
                    Spacer()
                    VStack(spacing: 16) {
                        Image(systemName: "brain.head.profile").font(.system(size: 50)).foregroundColor(Palette.primary.violet.opacity(0.5))
                        Text("No entries yet").font(.system(size: 18, weight: .semibold, design: .rounded)).foregroundColor(Palette.text.secondary)
                        Text("Log moments when reality conflicts\nwith what you were taught").font(.system(size: 14, weight: .medium, design: .rounded)).foregroundColor(Palette.text.muted).multilineTextAlignment(.center)
                    }
                    Spacer()
                } else {
                    ScrollView {
                        LazyVStack(spacing: 12) {
                            ForEach(entries.sorted { $0.date > $1.date }) { entry in
                                DissonanceEntryCard(entry: entry).onTapGesture { selectedEntry = entry }
                            }
                        }
                        .padding(.horizontal, 20).padding(.bottom, 40)
                    }
                }
            }
        }
        .sheet(isPresented: $showAddEntry) { AddDissonanceEntryView(onSave: onSave) { showAddEntry = false } }
        .sheet(item: $selectedEntry) { entry in DissonanceDetailView(entry: entry) { selectedEntry = nil } }
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

struct DissonanceEntryCard: View {
    let entry: CognitiveDissonanceEntry
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                HStack(spacing: 6) {
                    Image(systemName: entry.domain.icon).font(.system(size: 12))
                    Text(entry.domain.rawValue).font(.system(size: 11, weight: .semibold, design: .rounded))
                }
                .foregroundColor(entry.domain.color).padding(.horizontal, 10).padding(.vertical, 5)
                .background(Capsule().fill(entry.domain.color.opacity(0.15)))
                
                Spacer()
                if entry.resolved {
                    HStack(spacing: 4) { Image(systemName: "checkmark.circle.fill").font(.system(size: 10)); Text("Resolved").font(.system(size: 10, weight: .semibold, design: .rounded)) }.foregroundColor(Color.green)
                }
                Text(entry.date, style: .date).font(.system(size: 11, weight: .medium, design: .rounded)).foregroundColor(Palette.text.muted)
            }
            Text(entry.trigger).font(.system(size: 15, weight: .semibold, design: .rounded)).foregroundColor(Palette.text.primary).lineLimit(2)
            HStack(spacing: 4) {
                ForEach(0..<10, id: \.self) { i in
                    Circle().fill(i < entry.emotionalIntensity ? intensityColor(entry.emotionalIntensity) : Color.white.opacity(0.1)).frame(width: 8, height: 8)
                }
            }
        }
        .padding(16)
        .background(RoundedRectangle(cornerRadius: 14, style: .continuous).fill(Color.white.opacity(0.05)).overlay(RoundedRectangle(cornerRadius: 14, style: .continuous).stroke(entry.domain.color.opacity(0.2), lineWidth: 1)))
    }
    
    private func intensityColor(_ intensity: Int) -> Color {
        switch intensity { case 1...3: return Color.green; case 4...6: return Color.yellow; case 7...8: return Palette.primary.orange; default: return Palette.primary.red }
    }
}

struct AddDissonanceEntryView: View {
    let onSave: (CognitiveDissonanceEntry) -> Void
    let onDismiss: () -> Void
    
    @State private var trigger = ""
    @State private var whatIWasTaught = ""
    @State private var whatIObserved = ""
    @State private var emotionalIntensity: Double = 5
    @State private var selectedDomain: CognitiveDissonanceEntry.DissonanceDomain = .education
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack(spacing: 0) {
                HStack {
                    Text("Log Dissonance").font(.system(size: 20, weight: .bold, design: .rounded)).foregroundColor(Palette.text.primary)
                    Spacer()
                    Button(action: onDismiss) { Image(systemName: "xmark.circle.fill").font(.system(size: 28)).foregroundColor(Palette.text.secondary) }
                }
                .padding(.horizontal, 20).padding(.top, 20).padding(.bottom, 16)
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 24) {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("DOMAIN").font(.system(size: 12, weight: .bold, design: .rounded)).tracking(1).foregroundColor(Palette.text.secondary)
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 8) {
                                    ForEach(CognitiveDissonanceEntry.DissonanceDomain.allCases, id: \.self) { domain in
                                        Button { selectedDomain = domain } label: {
                                            HStack(spacing: 6) { Image(systemName: domain.icon).font(.system(size: 12)); Text(domain.rawValue).font(.system(size: 12, weight: .semibold, design: .rounded)) }
                                            .foregroundColor(selectedDomain == domain ? .black : domain.color).padding(.horizontal, 12).padding(.vertical, 8)
                                            .background(Capsule().fill(selectedDomain == domain ? domain.color : domain.color.opacity(0.15)))
                                        }
                                    }
                                }
                            }
                        }
                        inputSection(title: "WHAT TRIGGERED THIS?", placeholder: "e.g., I read something that contradicted...", text: $trigger, color: Palette.primary.violet)
                        inputSection(title: "WHAT I WAS TAUGHT", placeholder: "e.g., I was taught that...", text: $whatIWasTaught, color: Palette.primary.red)
                        inputSection(title: "WHAT I OBSERVED", placeholder: "e.g., But I noticed that...", text: $whatIObserved, color: Color.green)
                        VStack(alignment: .leading, spacing: 10) {
                            HStack {
                                Text("EMOTIONAL INTENSITY").font(.system(size: 12, weight: .bold, design: .rounded)).tracking(1).foregroundColor(Palette.text.secondary)
                                Spacer()
                                Text("\(Int(emotionalIntensity))/10").font(.system(size: 14, weight: .bold, design: .rounded)).foregroundColor(Palette.primary.orange)
                            }
                            Slider(value: $emotionalIntensity, in: 1...10, step: 1).accentColor(Palette.primary.orange)
                        }
                        Button { saveEntry() } label: {
                            HStack { Image(systemName: "brain.head.profile"); Text("Save Entry").font(.system(size: 16, weight: .bold, design: .rounded)) }
                            .foregroundColor(.black).frame(maxWidth: .infinity).padding(.vertical, 16)
                            .background(RoundedRectangle(cornerRadius: 14, style: .continuous).fill(Palette.primary.violet))
                        }
                        .disabled(!isValid).opacity(isValid ? 1.0 : 0.5)
                        Spacer(minLength: 40)
                    }
                    .padding(.horizontal, 20)
                }
            }
        }
    }
    
    private var isValid: Bool { !trigger.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty && !whatIWasTaught.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty && !whatIObserved.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty }
    
    private func inputSection(title: String, placeholder: String, text: Binding<String>, color: Color) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title).font(.system(size: 12, weight: .bold, design: .rounded)).tracking(1).foregroundColor(color)
            ZStack(alignment: .topLeading) {
                if text.wrappedValue.isEmpty { Text(placeholder).font(.system(size: 14)).foregroundColor(Palette.text.muted).padding(.top, 12).padding(.leading, 12) }
                TextEditor(text: text).font(.system(size: 14)).foregroundColor(Palette.text.primary).scrollContentBackground(.hidden).frame(minHeight: 80)
            }
            .padding(8).background(RoundedRectangle(cornerRadius: 12, style: .continuous).fill(Color.white.opacity(0.05)).overlay(RoundedRectangle(cornerRadius: 12, style: .continuous).stroke(color.opacity(0.3), lineWidth: 1)))
        }
    }
    
    private func saveEntry() {
        let entry = CognitiveDissonanceEntry(trigger: trigger.trimmingCharacters(in: .whitespacesAndNewlines), whatIWasTaught: whatIWasTaught.trimmingCharacters(in: .whitespacesAndNewlines), whatIObserved: whatIObserved.trimmingCharacters(in: .whitespacesAndNewlines), emotionalIntensity: Int(emotionalIntensity), domain: selectedDomain)
        onSave(entry)
        onDismiss()
    }
}

struct DissonanceDetailView: View {
    let entry: CognitiveDissonanceEntry
    let onDismiss: () -> Void
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack(spacing: 0) {
                HStack { Spacer(); Button(action: onDismiss) { Image(systemName: "xmark.circle.fill").font(.system(size: 28)).foregroundColor(Palette.text.secondary) } }
                .padding(.horizontal, 20).padding(.top, 20)
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 24) {
                        VStack(spacing: 12) {
                            ZStack { Circle().fill(entry.domain.color.opacity(0.2)).frame(width: 70, height: 70); Image(systemName: entry.domain.icon).font(.system(size: 30, weight: .semibold)).foregroundColor(entry.domain.color) }
                            Text(entry.domain.rawValue).font(.system(size: 20, weight: .bold, design: .rounded)).foregroundColor(Palette.text.primary)
                            Text(entry.date, style: .date).font(.system(size: 13, weight: .medium, design: .rounded)).foregroundColor(Palette.text.muted)
                        }
                        .frame(maxWidth: .infinity)
                        
                        detailSection(title: "TRIGGER", content: entry.trigger, color: Palette.primary.violet)
                        detailSection(title: "❌ WHAT I WAS TAUGHT", content: entry.whatIWasTaught, color: Palette.primary.red)
                        HStack { Spacer(); Image(systemName: "arrow.down").font(.system(size: 24, weight: .bold)).foregroundColor(Palette.text.muted); Spacer() }
                        detailSection(title: "✅ WHAT I OBSERVED", content: entry.whatIObserved, color: Color.green)
                        if let resolution = entry.resolution { detailSection(title: "💡 RESOLUTION", content: resolution, color: Palette.accent.gold) }
                        Spacer(minLength: 40)
                    }
                    .padding(.horizontal, 20)
                }
            }
        }
    }
    
    private func detailSection(title: String, content: String, color: Color) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title).font(.system(size: 12, weight: .bold, design: .rounded)).tracking(1).foregroundColor(color)
            Text(content).font(.system(size: 15)).foregroundColor(Palette.text.primary).lineSpacing(5)
        }
        .padding(16).frame(maxWidth: .infinity, alignment: .leading)
        .background(RoundedRectangle(cornerRadius: 12, style: .continuous).fill(color.opacity(0.1)).overlay(RoundedRectangle(cornerRadius: 12, style: .continuous).stroke(color.opacity(0.25), lineWidth: 1)))
    }
}
