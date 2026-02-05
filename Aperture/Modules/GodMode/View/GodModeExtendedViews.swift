// EsotericArchivesView.swift
// GodMode - Lemuria, Atlantis, Ra, Thoth, Kundalini

import SwiftUI

struct EsotericArchivesView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var selectedArchive: String?
    
    let archives = [
        ("🏝️", "Lemuria", "The Motherland", "Ancient civilization of consciousness"),
        ("🌊", "Atlantis", "The Lost Empire", "Technology meets spirituality"),
        ("☀️", "Ra", "The Sun God", "Egyptian solar deity wisdom"),
        ("📿", "Thoth", "The Scribe", "Hermetic founder's teachings"),
        ("🐍", "Kundalini", "The Serpent Power", "Awakening the inner fire"),
        ("⚡", "Energy Mastery", "Chi/Prana/Life Force", "Directing vital energy"),
        ("👁️", "The God Within", "Divine Spark", "Recognizing your true nature")
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    colors: [Color(hex: "0a0a1a"), Color(hex: "2a1a1a")],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 24) {
                        headerSection
                        archivesList
                        dragonWisdom
                        Spacer(minLength: 50)
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                }
            }
            .navigationTitle("🏛️ Esoteric Archives")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") { dismiss() }
                        .foregroundStyle(Color(hex: "FFD700"))
                }
            }
        }
    }
    
    private var headerSection: some View {
        VStack(spacing: 12) {
            Text("🏛️")
                .font(.system(size: 50))
            Text("Ancient Knowledge Preserved")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundStyle(.white)
            Text("What they didn't want you to remember")
                .font(.subheadline)
                .foregroundStyle(.white.opacity(0.7))
        }
        .padding(.vertical, 20)
    }
    
    private var archivesList: some View {
        VStack(spacing: 12) {
            ForEach(archives, id: \.1) { archive in
                Button(action: { selectedArchive = archive.1 }) {
                    HStack(spacing: 16) {
                        Text(archive.0)
                            .font(.title)
                            .frame(width: 50)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(archive.1)
                                .font(.headline)
                                .foregroundStyle(.white)
                            Text(archive.2)
                                .font(.caption)
                                .foregroundStyle(Color(hex: "FFD700"))
                            Text(archive.3)
                                .font(.caption2)
                                .foregroundStyle(.white.opacity(0.6))
                        }
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .foregroundStyle(.white.opacity(0.4))
                    }
                    .padding()
                    .background(Color.white.opacity(0.05))
                    .cornerRadius(12)
                }
                .buttonStyle(.plain)
            }
        }
    }
    
    private var dragonWisdom: some View {
        VStack(spacing: 12) {
            Text("🐉 DRAGON WISDOM")
                .font(.caption)
                .foregroundStyle(.white.opacity(0.5))
            
            Text("\"Ancient civilizations didn't vanish—their wisdom went underground, encoded in symbols, waiting for this moment.\"")
                .font(.caption)
                .italic()
                .foregroundStyle(.white.opacity(0.7))
                .multilineTextAlignment(.center)
        }
        .padding()
        .background(Color(hex: "FFD700").opacity(0.05))
        .cornerRadius(12)
    }
}

// MARK: - Consciousness Trainer View
struct ConsciousnessTrainerView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var currentStreak = 0
    @State private var totalMinutes = 0
    @State private var showDailyMission = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    colors: [Color(hex: "0a0a1a"), Color(hex: "0a1a2a")],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 24) {
                        // Header
                        VStack(spacing: 12) {
                            Text("🎓")
                                .font(.system(size: 50))
                            Text("Consciousness Trainer")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                            Text("Active learning replaces passive consumption")
                                .font(.subheadline)
                                .foregroundStyle(.white.opacity(0.7))
                        }
                        .padding(.vertical, 20)
                        
                        // Stats
                        HStack(spacing: 20) {
                            StatBox(value: "\(currentStreak)", label: "Day Streak", icon: "🔥")
                            StatBox(value: "\(totalMinutes)", label: "Minutes", icon: "⏱️")
                        }
                        
                        // Training Modules
                        VStack(alignment: .leading, spacing: 16) {
                            Text("📚 TRAINING MODULES")
                                .font(.caption)
                                .foregroundStyle(.white.opacity(0.6))
                                .tracking(2)
                            
                            TrainingCard(icon: "🎯", title: "Daily Mission", subtitle: "Today's actionable task", color: .orange) {
                                showDailyMission = true
                            }
                            TrainingCard(icon: "✅", title: "Practice Tracker", subtitle: "Log your daily work", color: .green) {}
                            TrainingCard(icon: "🧠", title: "Active Recall Quiz", subtitle: "Spaced repetition system", color: .blue) {}
                            TrainingCard(icon: "📝", title: "Integration Journal", subtitle: "Real-life application", color: .purple) {}
                            TrainingCard(icon: "📈", title: "Mastery Path", subtitle: "Track your progress", color: .cyan) {}
                        }
                        
                        Spacer(minLength: 50)
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                }
            }
            .navigationTitle("🎓 Training")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") { dismiss() }
                        .foregroundStyle(Color(hex: "FFD700"))
                }
            }
        }
    }
}

struct StatBox: View {
    let value: String
    let label: String
    let icon: String
    
    var body: some View {
        VStack(spacing: 8) {
            Text(icon)
            Text(value)
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.white)
            Text(label)
                .font(.caption2)
                .foregroundStyle(.white.opacity(0.6))
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.white.opacity(0.05))
        .cornerRadius(12)
    }
}

struct TrainingCard: View {
    let icon: String
    let title: String
    let subtitle: String
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 16) {
                Text(icon)
                    .font(.title2)
                    .frame(width: 50, height: 50)
                    .background(color.opacity(0.2))
                    .cornerRadius(12)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(title)
                        .font(.headline)
                        .foregroundStyle(.white)
                    Text(subtitle)
                        .font(.caption)
                        .foregroundStyle(.white.opacity(0.6))
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundStyle(.white.opacity(0.4))
            }
            .padding()
            .background(Color.white.opacity(0.05))
            .cornerRadius(12)
        }
        .buttonStyle(.plain)
    }
}

// MARK: - Frequency Mastery View
struct FrequencyMasteryView: View {
    @Environment(\.dismiss) private var dismiss
    
    let protocols = [
        ("🧘", "Void Meditation", "30 min", "Clear the mental chatter"),
        ("🔥", "Breath of Fire", "11 min", "Kundalini activation"),
        ("🎵", "Vocal Toning", "15 min", "Sound vibration healing"),
        ("🎶", "Solfeggio Tuning", "20 min", "Sacred frequencies"),
        ("🌌", "Cosmic Channel", "12 min", "Higher self connection"),
        ("💃", "Ecstatic Movement", "20 min", "Body wisdom activation"),
        ("⚡", "5-Min Calibration", "5 min", "Quick frequency reset")
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    colors: [Color(hex: "0a0a1a"), Color(hex: "2a0a2a")],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 24) {
                        // Header
                        VStack(spacing: 12) {
                            Text("📊")
                                .font(.system(size: 50))
                            Text("Frequency Mastery")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                            Text("Deliberately hold high vibration")
                                .font(.subheadline)
                                .foregroundStyle(.white.opacity(0.7))
                        }
                        .padding(.vertical, 20)
                        
                        // Guided Protocols
                        VStack(alignment: .leading, spacing: 16) {
                            Text("🎯 GUIDED PROTOCOLS")
                                .font(.caption)
                                .foregroundStyle(.white.opacity(0.6))
                                .tracking(2)
                            
                            ForEach(protocols, id: \.1) { proto in
                                HStack(spacing: 16) {
                                    Text(proto.0)
                                        .font(.title2)
                                        .frame(width: 50)
                                    
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text(proto.1)
                                            .font(.headline)
                                            .foregroundStyle(.white)
                                        Text(proto.3)
                                            .font(.caption)
                                            .foregroundStyle(.white.opacity(0.6))
                                    }
                                    
                                    Spacer()
                                    
                                    Text(proto.2)
                                        .font(.caption)
                                        .foregroundStyle(Color(hex: "FFD700"))
                                        .padding(.horizontal, 8)
                                        .padding(.vertical, 4)
                                        .background(Color(hex: "FFD700").opacity(0.2))
                                        .cornerRadius(8)
                                }
                                .padding()
                                .background(Color.white.opacity(0.05))
                                .cornerRadius(12)
                            }
                        }
                        
                        Spacer(minLength: 50)
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                }
            }
            .navigationTitle("📊 Frequency")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") { dismiss() }
                        .foregroundStyle(Color(hex: "FFD700"))
                }
            }
        }
    }
}

// MARK: - Forbidden Section View
struct ForbiddenSectionView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var acceptedWarning = false
    
    let tiers: [(color: Color, name: String, count: Int, desc: String)] = [
        (Color.green, "GREEN - Safe", 20, "General awakening content"),
        (Color.yellow, "YELLOW - Awareness", 25, "Requires discernment"),
        (Color.red, "RED - Advanced", 20, "Challenge your reality"),
        (Color(hex: "2C3E50"), "BLACK - Extreme", 10, "Handle with care")
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()
                
                if !acceptedWarning {
                    warningView
                } else {
                    contentView
                }
            }
            .navigationTitle("🔒 Forbidden")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") { dismiss() }
                        .foregroundStyle(Color(hex: "FFD700"))
                }
            }
        }
    }
    
    private var warningView: some View {
        VStack(spacing: 24) {
            Text("⚠️")
                .font(.system(size: 60))
            
            Text("FORBIDDEN SECTION")
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.white)
            
            Text("This section contains teachings that challenge fundamental beliefs about reality, religion, and consciousness.\n\nProceed with discernment. Question everything—including this.")
                .font(.body)
                .foregroundStyle(.white.opacity(0.8))
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            Button(action: { acceptedWarning = true }) {
                Text("I Understand - Enter")
                    .font(.headline)
                    .foregroundStyle(.black)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(hex: "FFD700"))
                    .cornerRadius(12)
            }
            .padding(.horizontal, 40)
        }
    }
    
    private var contentView: some View {
        ScrollView {
            VStack(spacing: 24) {
                VStack(spacing: 12) {
                    Text("🔒")
                        .font(.system(size: 50))
                    Text("85+ Forbidden Teachings")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                    Text("Organized by intensity level")
                        .font(.subheadline)
                        .foregroundStyle(.white.opacity(0.7))
                }
                .padding(.vertical, 20)
                
                ForEach(tiers, id: \.name) { tier in
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Circle()
                                .fill(tier.color)
                                .frame(width: 12, height: 12)
                            Text(tier.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                            Spacer()
                            Text("~\(tier.count) teachings")
                                .font(.caption)
                                .foregroundStyle(.white.opacity(0.6))
                        }
                        Text(tier.desc)
                            .font(.caption)
                            .foregroundStyle(.white.opacity(0.5))
                    }
                    .padding()
                    .background(tier.color.opacity(0.1))
                    .cornerRadius(12)
                }
                
                Spacer(minLength: 50)
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
        }
    }
}

// MARK: - Reality Architect View
struct RealityArchitectView: View {
    @Environment(\.dismiss) private var dismiss
    
    let modules = [
        ("🧠", "Mind Mastery", ["Brain Synchronization", "Visualization", "Focus Training"]),
        ("⚛️", "Quantum Techniques", ["Quantum Jumping", "Dimensional Shifting", "Timeline Navigation"]),
        ("🫀", "Embodiment", ["Nervous System Reset", "Silent Power", "Somatic Release"]),
        ("🌌", "Cosmic Law", ["Command Reality", "The Four Codes", "Manifestation Mechanics"])
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    colors: [Color(hex: "0a0a1a"), Color(hex: "0a2a2a")],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 24) {
                        VStack(spacing: 12) {
                            Text("🏗️")
                                .font(.system(size: 50))
                            Text("Reality Architect")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                            Text("Build your world consciously")
                                .font(.subheadline)
                                .foregroundStyle(.white.opacity(0.7))
                        }
                        .padding(.vertical, 20)
                        
                        ForEach(modules, id: \.0) { module in
                            VStack(alignment: .leading, spacing: 12) {
                                HStack {
                                    Text(module.0)
                                        .font(.title2)
                                    Text(module.1)
                                        .font(.headline)
                                        .foregroundStyle(.white)
                                }
                                
                                ForEach(module.2, id: \.self) { item in
                                    HStack {
                                        Image(systemName: "circle.fill")
                                            .font(.system(size: 4))
                                            .foregroundStyle(Color(hex: "FFD700"))
                                        Text(item)
                                            .font(.subheadline)
                                            .foregroundStyle(.white.opacity(0.8))
                                    }
                                    .padding(.leading, 16)
                                }
                            }
                            .padding()
                            .background(Color.white.opacity(0.05))
                            .cornerRadius(12)
                        }
                        
                        Spacer(minLength: 50)
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                }
            }
            .navigationTitle("🏗️ Architect")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") { dismiss() }
                        .foregroundStyle(Color(hex: "FFD700"))
                }
            }
        }
    }
}

// MARK: - Sacred Symbols View
struct SacredSymbolsView: View {
    @Environment(\.dismiss) private var dismiss
    
    let symbols = [
        ("⭕", "The Monad", "Unity, the source"),
        ("🔺", "3-6-9 Triangle", "Tesla's key"),
        ("◎", "Vesica Piscis", "Creation portal"),
        ("❀", "Seed of Life", "Genesis pattern"),
        ("🍩", "Torus Field", "Energy flow"),
        ("✡️", "Merkaba", "Light vehicle"),
        ("∞", "Infinity", "Eternal cycle"),
        ("🌀", "Golden Spiral", "Divine proportion")
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    colors: [Color(hex: "0a0a1a"), Color(hex: "1a0a2a")],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 24) {
                        VStack(spacing: 12) {
                            Text("🔯")
                                .font(.system(size: 50))
                            Text("Sacred Symbols")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                            Text("10 Hermetic keys to meditation")
                                .font(.subheadline)
                                .foregroundStyle(.white.opacity(0.7))
                        }
                        .padding(.vertical, 20)
                        
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                            ForEach(symbols, id: \.1) { symbol in
                                VStack(spacing: 8) {
                                    Text(symbol.0)
                                        .font(.system(size: 40))
                                    Text(symbol.1)
                                        .font(.caption)
                                        .fontWeight(.semibold)
                                        .foregroundStyle(.white)
                                    Text(symbol.2)
                                        .font(.caption2)
                                        .foregroundStyle(.white.opacity(0.6))
                                }
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.white.opacity(0.05))
                                .cornerRadius(12)
                            }
                        }
                        
                        Spacer(minLength: 50)
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                }
            }
            .navigationTitle("🔯 Symbols")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") { dismiss() }
                        .foregroundStyle(Color(hex: "FFD700"))
                }
            }
        }
    }
}

// MARK: - Astral Projection Guide View
struct AstralProjectionGuideView: View {
    @Environment(\.dismiss) private var dismiss
    
    let techniques = [
        ("🪢", "Rope Technique", "Visualize climbing a rope from your body"),
        ("🔄", "Roll-Out Method", "Roll sideways out of your physical form"),
        ("⏰", "Wake Back to Bed", "Wake at 4-5am, stay up briefly, return to sleep"),
        ("🎯", "Target Technique", "Focus on a destination to pull yourself there"),
        ("🌊", "Monroe Method", "Focus 10-12 states of consciousness")
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    colors: [Color(hex: "0a0a1a"), Color(hex: "0a0a2a")],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 24) {
                        VStack(spacing: 12) {
                            Text("🚀")
                                .font(.system(size: 50))
                            Text("Astral Projection Guide")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                            Text("5 proven techniques for OBE")
                                .font(.subheadline)
                                .foregroundStyle(.white.opacity(0.7))
                        }
                        .padding(.vertical, 20)
                        
                        ForEach(techniques, id: \.1) { tech in
                            HStack(spacing: 16) {
                                Text(tech.0)
                                    .font(.title)
                                    .frame(width: 50)
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(tech.1)
                                        .font(.headline)
                                        .foregroundStyle(.white)
                                    Text(tech.2)
                                        .font(.caption)
                                        .foregroundStyle(.white.opacity(0.6))
                                }
                                
                                Spacer()
                            }
                            .padding()
                            .background(Color.white.opacity(0.05))
                            .cornerRadius(12)
                        }
                        
                        // Disclaimer
                        Text("⚠️ Astral projection is an advanced practice. Ensure you are grounded and mentally prepared.")
                            .font(.caption)
                            .foregroundStyle(.white.opacity(0.5))
                            .multilineTextAlignment(.center)
                            .padding()
                        
                        Spacer(minLength: 50)
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                }
            }
            .navigationTitle("🚀 Astral Guide")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") { dismiss() }
                        .foregroundStyle(Color(hex: "FFD700"))
                }
            }
        }
    }
}

#Preview {
    EsotericArchivesView()
}
