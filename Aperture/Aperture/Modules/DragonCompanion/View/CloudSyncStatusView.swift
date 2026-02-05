// CloudSyncStatusView.swift
// Shows iCloud sync status so users know their progress is safe

import SwiftUI

struct CloudSyncStatusView: View {

    @ObservedObject private var repository = DragonCompanionRepository.shared

    var body: some View {

        HStack(spacing: 10) {

            statusIcon

            VStack(alignment: .leading, spacing: 2) {
                Text(statusTitle)
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundColor(statusColor)

                Text(statusMessage)
                    .font(.system(size: 10, weight: .medium))
                    .foregroundColor(Palette.text.muted)
            }

            Spacer()

            if repository.isSyncing {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: Palette.primary.cyan))
                    .scaleEffect(0.8)
            }

        }
        .padding(12)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(statusColor.opacity(0.1))
        )

    }

    private var statusIcon: some View {

        Image(systemName: iconName)
            .font(.system(size: 18))
            .foregroundColor(statusColor)

    }

    private var iconName: String {
        switch repository.cloudStatus {
        case .available: return "icloud.fill"
        case .notSignedIn: return "icloud.slash"
        case .restricted: return "exclamationmark.icloud"
        }
    }

    private var statusTitle: String {
        switch repository.cloudStatus {
        case .available: return "iCloud Sync Active"
        case .notSignedIn: return "iCloud Not Connected"
        case .restricted: return "iCloud Restricted"
        }
    }

    private var statusMessage: String {
        switch repository.cloudStatus {
        case .available:
            return "Your progress syncs across all your devices"
        case .notSignedIn:
            return "Sign into iCloud to backup your progress"
        case .restricted:
            return "Data stored locally only"
        }
    }

    private var statusColor: Color {
        switch repository.cloudStatus {
        case .available: return Palette.accent.gold
        case .notSignedIn: return Palette.primary.orange
        case .restricted: return Palette.text.muted
        }
    }

}

// MARK: - Compact Version

struct CloudSyncBadge: View {

    @ObservedObject private var repository = DragonCompanionRepository.shared

    var body: some View {

        HStack(spacing: 4) {

            Image(systemName: iconName)
                .font(.system(size: 10))

            if repository.isSyncing {
                Text("Syncing...")
                    .font(.system(size: 9, weight: .medium))
            }

        }
        .foregroundColor(statusColor)
        .padding(.horizontal, 8)
        .padding(.vertical, 4)
        .background(
            Capsule().fill(statusColor.opacity(0.15))
        )

    }

    private var iconName: String {
        if repository.isSyncing {
            return "arrow.triangle.2.circlepath"
        }
        switch repository.cloudStatus {
        case .available: return "checkmark.icloud.fill"
        case .notSignedIn: return "icloud.slash"
        case .restricted: return "exclamationmark.icloud"
        }
    }

    private var statusColor: Color {
        switch repository.cloudStatus {
        case .available: return Palette.accent.gold
        case .notSignedIn: return Palette.primary.orange
        case .restricted: return Palette.text.muted
        }
    }

}

// MARK: - Settings Section

struct CloudSyncSettingsSection: View {

    @ObservedObject private var repository = DragonCompanionRepository.shared

    var body: some View {

        VStack(alignment: .leading, spacing: 16) {

            Text("DATA & SYNC")
                .font(.system(size: 11, weight: .bold))
                .foregroundColor(Palette.text.muted)
                .tracking(1)

            VStack(spacing: 12) {

                CloudSyncStatusView()

                // Privacy reminder
                HStack(spacing: 8) {
                    Image(systemName: "lock.shield.fill")
                        .foregroundColor(Palette.accent.gold)
                    Text("Your data stays with YOU via your Apple ID. We never see or store your personal information.")
                        .font(.system(size: 11, weight: .medium))
                        .foregroundColor(Palette.text.secondary)
                }
                .padding(12)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white.opacity(0.05))
                )

                // What syncs
                VStack(alignment: .leading, spacing: 8) {

                    Text("What syncs to iCloud:")
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(Palette.text.primary)

                    syncItem(icon: "person.fill", text: "Your profile information")
                    syncItem(icon: "flame.fill", text: "Dragon companion progress")
                    syncItem(icon: "checkmark.circle.fill", text: "Completed courses")
                    syncItem(icon: "chart.bar.fill", text: "XP and achievements")

                }
                .padding(12)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white.opacity(0.05))
                )

            }

        }

    }

    private func syncItem(icon: String, text: String) -> some View {

        HStack(spacing: 10) {
            Image(systemName: icon)
                .font(.system(size: 12))
                .foregroundColor(Palette.primary.cyan)
                .frame(width: 20)
            Text(text)
                .font(.system(size: 12, weight: .medium))
                .foregroundColor(Palette.text.secondary)
        }

    }

}

// MARK: - Preview

#Preview {

    ZStack {
        Color.black.ignoresSafeArea()
        VStack(spacing: 20) {
            CloudSyncStatusView()
            CloudSyncBadge()
            CloudSyncSettingsSection()
        }
        .padding()
    }

}
