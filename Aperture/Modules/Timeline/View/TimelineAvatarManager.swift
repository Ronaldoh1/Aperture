// TimelineAvatarManager.swift
// Personal avatar for Timeline "You Are Here" indicator
// Stored locally on device — easily movable to Firebase later
// ☀️ SunFlow: Reignited

import SwiftUI
import PhotosUI

// MARK: - Preset Avatar Options

struct PresetAvatar: Identifiable, Equatable {
    let id: String
    let emoji: String
    let name: String
    let gradientColors: [Color]
    
    static func == (lhs: PresetAvatar, rhs: PresetAvatar) -> Bool {
        lhs.id == rhs.id
    }
    
    static let all: [PresetAvatar] = [
        PresetAvatar(id: "sun_warrior", emoji: "☀️", name: "Sun Warrior", gradientColors: [Color(hex: "#FFD700"), Color(hex: "#FF8C00")]),
        PresetAvatar(id: "third_eye", emoji: "👁️", name: "Third Eye", gradientColors: [Color(hex: "#9B59B6"), Color(hex: "#3498DB")]),
        PresetAvatar(id: "phoenix", emoji: "🔥", name: "Phoenix Rising", gradientColors: [Color(hex: "#E74C3C"), Color(hex: "#F39C12")]),
        PresetAvatar(id: "lotus", emoji: "🪷", name: "Lotus Bloom", gradientColors: [Color(hex: "#E91E63"), Color(hex: "#9C27B0")]),
        PresetAvatar(id: "dragon", emoji: "🐉", name: "Dragon Spirit", gradientColors: [Color(hex: "#2ECC71"), Color(hex: "#1ABC9C")]),
        PresetAvatar(id: "star", emoji: "⭐", name: "Star Seed", gradientColors: [Color(hex: "#FFD700"), Color(hex: "#FFFFFF")]),
        PresetAvatar(id: "moon", emoji: "🌙", name: "Moon Child", gradientColors: [Color(hex: "#2C3E50"), Color(hex: "#3498DB")]),
        PresetAvatar(id: "crystal", emoji: "💎", name: "Crystal Clear", gradientColors: [Color(hex: "#00BCD4"), Color(hex: "#E0F7FA")]),
        PresetAvatar(id: "serpent", emoji: "🐍", name: "Kundalini", gradientColors: [Color(hex: "#FF5722"), Color(hex: "#FFD700")]),
        PresetAvatar(id: "eye_of_ra", emoji: "𓂀", name: "Eye of Ra", gradientColors: [Color(hex: "#FFD700"), Color(hex: "#1ABC9C")])
    ]
}

// MARK: - Avatar Manager (Local Persistence)

@MainActor
class TimelineAvatarManager: ObservableObject {
    
    static let shared = TimelineAvatarManager()
    
    @Published var avatarImageData: Data? {
        didSet { persistAvatar() }
    }
    @Published var selectedPresetId: String? {
        didSet { persistAvatar() }
    }
    @Published var hasCompletedSetup: Bool {
        didSet { UserDefaults.standard.set(hasCompletedSetup, forKey: "timeline_avatar_setup_done") }
    }
    
    var selectedPreset: PresetAvatar? {
        guard let id = selectedPresetId else { return nil }
        return PresetAvatar.all.first(where: { $0.id == id })
    }
    
    private init() {
        self.hasCompletedSetup = UserDefaults.standard.bool(forKey: "timeline_avatar_setup_done")
        self.selectedPresetId = UserDefaults.standard.string(forKey: "timeline_avatar_preset_id")
        self.avatarImageData = Self.loadImageData()
    }
    
    // MARK: - Persistence (All Local — UserDefaults + Documents)
    
    private func persistAvatar() {
        UserDefaults.standard.set(selectedPresetId, forKey: "timeline_avatar_preset_id")
        
        if let data = avatarImageData {
            Self.saveImageData(data)
        } else {
            Self.deleteImageData()
        }
    }
    
    private static var avatarFileURL: URL {
        let docs = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        return docs.appendingPathComponent("timeline_avatar.jpg")
    }
    
    private static func saveImageData(_ data: Data) {
        try? data.write(to: avatarFileURL)
    }
    
    private static func loadImageData() -> Data? {
        try? Data(contentsOf: avatarFileURL)
    }
    
    private static func deleteImageData() {
        try? FileManager.default.removeItem(at: avatarFileURL)
    }
    
    // MARK: - Actions
    
    func selectPreset(_ preset: PresetAvatar) {
        avatarImageData = nil
        selectedPresetId = preset.id
    }
    
    func setPhotoImage(_ image: UIImage) {
        selectedPresetId = nil
        avatarImageData = image.jpegData(compressionQuality: 0.7)
    }
    
    func clearAvatar() {
        avatarImageData = nil
        selectedPresetId = nil
    }
    
    func skipSetup() {
        hasCompletedSetup = true
    }
    
    func reset() {
        clearAvatar()
        hasCompletedSetup = false
    }
}

// MARK: - Avatar Setup View (Shown During Onboarding or First Timeline Visit)

struct TimelineAvatarSetupView: View {
    
    @ObservedObject var manager: TimelineAvatarManager
    @State private var showPhotoPicker = false
    @State private var selectedPhotoItem: PhotosPickerItem?
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 24) {
                        
                        headerSection
                        explanationSection
                        currentAvatarPreview
                        presetGrid
                        photoPickerSection
                        privacyNote
                        actionButtons
                        
                        Spacer(minLength: 40)
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 16)
                }
            }
            .navigationTitle("Your Avatar")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Skip") {
                        manager.skipSetup()
                        dismiss()
                    }
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(Palette.text.muted)
                }
            }
            .onChange(of: selectedPhotoItem) { _, newItem in
                loadPhoto(from: newItem)
            }
        }
    }
    
    // MARK: - Header
    
    private var headerSection: some View {
        VStack(spacing: 12) {
            ZStack {
                Circle()
                    .fill(RadialGradient(
                        colors: [Palette.accent.gold.opacity(0.3), Color.clear],
                        center: .center,
                        startRadius: 30,
                        endRadius: 60
                    ))
                    .frame(width: 120, height: 120)
                
                TimelineAvatarBadge(manager: manager, size: 80)
            }
            
            Text("Choose Your Avatar")
                .font(.system(size: 24, weight: .bold, design: .rounded))
                .foregroundStyle(
                    LinearGradient(
                        colors: [Palette.accent.gold, Palette.primary.cyan],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
        }
    }
    
    // MARK: - Explanation
    
    private var explanationSection: some View {
        VStack(spacing: 8) {
            Text("This image represents YOU on the Timeline.")
                .font(.system(size: 15, weight: .semibold, design: .rounded))
                .foregroundColor(Palette.text.primary)
            
            Text("As you scroll through centuries of hidden history, your avatar marks where you are in the journey. Pick a photo or choose a spirit symbol below.")
                .font(.system(size: 13, weight: .medium, design: .rounded))
                .foregroundColor(Palette.text.secondary)
                .multilineTextAlignment(.center)
                .lineSpacing(3)
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 14)
                .fill(Color.white.opacity(0.04))
                .overlay(RoundedRectangle(cornerRadius: 14).stroke(Palette.accent.gold.opacity(0.15), lineWidth: 1))
        )
    }
    
    // MARK: - Current Preview
    
    private var currentAvatarPreview: some View {
        VStack(spacing: 6) {
            Text("CURRENT SELECTION")
                .font(.system(size: 9, weight: .bold)).tracking(1.5)
                .foregroundColor(Palette.text.muted)
            
            TimelineYouAreHereIndicator(
                era: nil,
                avatarManager: manager
            )
        }
    }
    
    // MARK: - Preset Grid
    
    private var presetGrid: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("SPIRIT AVATARS")
                .font(.system(size: 10, weight: .bold, design: .rounded))
                .tracking(1.5)
                .foregroundColor(Palette.text.muted)
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 70), spacing: 12)], spacing: 12) {
                ForEach(PresetAvatar.all) { preset in
                    presetCard(preset)
                }
            }
        }
    }
    
    private func presetCard(_ preset: PresetAvatar) -> some View {
        let isSelected: Bool = manager.selectedPresetId == preset.id
        
        return Button(action: {
            HapticManager.shared.light()
            manager.selectPreset(preset)
        }) {
            VStack(spacing: 4) {
                ZStack {
                    Circle()
                        .fill(
                            LinearGradient(
                                colors: preset.gradientColors,
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 50, height: 50)
                    
                    Text(preset.emoji)
                        .font(.system(size: 24))
                    
                    if isSelected {
                        Circle()
                            .stroke(Palette.accent.gold, lineWidth: 2.5)
                            .frame(width: 54, height: 54)
                        
                        Image(systemName: "checkmark.circle.fill")
                            .font(.system(size: 16))
                            .foregroundColor(Palette.accent.gold)
                            .background(Circle().fill(Color.black).frame(width: 14, height: 14))
                            .offset(x: 18, y: -18)
                    }
                }
                
                Text(preset.name)
                    .font(.system(size: 9, weight: .semibold, design: .rounded))
                    .foregroundColor(isSelected ? Palette.accent.gold : Palette.text.muted)
                    .lineLimit(1)
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
    
    // MARK: - Photo Picker
    
    private var photoPickerSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("OR USE YOUR PHOTO")
                .font(.system(size: 10, weight: .bold, design: .rounded))
                .tracking(1.5)
                .foregroundColor(Palette.text.muted)
            
            PhotosPicker(selection: $selectedPhotoItem, matching: .images) {
                HStack(spacing: 10) {
                    Image(systemName: "photo.on.rectangle.angled")
                        .font(.system(size: 18))
                        .foregroundColor(Palette.primary.cyan)
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text("Choose from Photo Library")
                            .font(.system(size: 14, weight: .semibold, design: .rounded))
                            .foregroundColor(Palette.text.primary)
                        Text("Select any photo from your camera roll")
                            .font(.system(size: 11, weight: .medium))
                            .foregroundColor(Palette.text.muted)
                    }
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(Palette.text.muted)
                }
                .padding(14)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.white.opacity(0.04))
                        .overlay(RoundedRectangle(cornerRadius: 12).stroke(Palette.primary.cyan.opacity(0.2), lineWidth: 1))
                )
            }
        }
    }
    
    // MARK: - Privacy
    
    private var privacyNote: some View {
        HStack(spacing: 8) {
            Image(systemName: "lock.shield.fill")
                .font(.system(size: 14))
                .foregroundColor(Palette.primary.cyan.opacity(0.7))
            
            Text("Your avatar is stored locally on this device only. It never leaves your phone and is never uploaded anywhere.")
                .font(.system(size: 11, weight: .medium, design: .rounded))
                .foregroundColor(Palette.text.muted)
                .lineSpacing(2)
        }
        .padding(12)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Palette.primary.cyan.opacity(0.04))
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Palette.primary.cyan.opacity(0.1), lineWidth: 0.5))
        )
    }
    
    // MARK: - Actions
    
    private var actionButtons: some View {
        VStack(spacing: 12) {
            Button(action: {
                HapticManager.shared.medium()
                manager.hasCompletedSetup = true
                dismiss()
            }) {
                HStack(spacing: 8) {
                    Image(systemName: "checkmark.circle.fill")
                    Text("Save Avatar")
                        .font(.system(size: 16, weight: .bold, design: .rounded))
                }
                .foregroundColor(.black)
                .frame(maxWidth: .infinity)
                .padding(16)
                .background(
                    RoundedRectangle(cornerRadius: 14)
                        .fill(Palette.accent.gold)
                )
            }
            
            if manager.avatarImageData != nil || manager.selectedPresetId != nil {
                Button(action: {
                    manager.clearAvatar()
                }) {
                    Text("Clear Selection")
                        .font(.system(size: 13, weight: .medium))
                        .foregroundColor(Palette.text.muted)
                }
            }
        }
    }
    
    // MARK: - Photo Loading
    
    private func loadPhoto(from item: PhotosPickerItem?) {
        guard let item = item else { return }
        item.loadTransferable(type: Data.self) { result in
            Task { @MainActor in
                switch result {
                case .success(let data):
                    if let data = data, let image = UIImage(data: data) {
                        let size = CGSize(width: 200, height: 200)
                        let renderer = UIGraphicsImageRenderer(size: size)
                        let resized = renderer.image { _ in
                            image.draw(in: CGRect(origin: .zero, size: size))
                        }
                        manager.setPhotoImage(resized)
                    }
                case .failure:
                    break
                }
            }
        }
    }
}

// MARK: - Avatar Tap-to-Change Overlay (Inline in Timeline)

struct TimelineAvatarTapOverlay: View {
    
    @ObservedObject var manager: TimelineAvatarManager
    @State private var showSetup = false
    
    var body: some View {
        Button(action: {
            HapticManager.shared.light()
            showSetup = true
        }) {
            TimelineAvatarBadge(manager: manager, size: 32)
                .overlay(
                    Image(systemName: "pencil.circle.fill")
                        .font(.system(size: 12))
                        .foregroundColor(Palette.accent.gold)
                        .background(Circle().fill(Color.black).frame(width: 10, height: 10))
                        .offset(x: 12, y: -12)
                )
        }
        .sheet(isPresented: $showSetup) {
            TimelineAvatarSetupView(manager: manager)
        }
    }
}
