// RightsScriptsCard.swift
// Critical scripts to memorize - displayed as a quick reference card
// Text() strings will be auto-extracted by Xcode for localization

import SwiftUI

// MARK: - Rights Scripts Card

struct RightsScriptsCard: View {

    @State private var copiedScript: String?

    var body: some View {

        VStack(alignment: .leading, spacing: 16) {

            // Header
            HStack {
                Image(systemName: "shield.checkered")
                    .font(.title2)
                    .foregroundColor(Palette.accent.gold)

                Text("Scripts to Memorize")
                    .font(.system(size: 18, weight: .bold, design: .rounded))
                    .foregroundColor(.white)

                Spacer()
            }

            Text("Tap to copy. Practice saying these out loud.")
                .font(.system(size: 12, weight: .medium))
                .foregroundColor(Palette.text.muted)

            Divider()
                .background(Color.white.opacity(0.1))

            // Scripts
            VStack(spacing: 12) {

                scriptRow(
                    icon: "hand.raised.fill",
                    title: "Remain Silent",
                    script: "I invoke my Fifth Amendment right to remain silent."
                )

                scriptRow(
                    icon: "magnifyingglass.circle.fill",
                    title: "Refuse Search",
                    script: "I do not consent to any searches."
                )

                scriptRow(
                    icon: "figure.walk",
                    title: "Ask if Detained",
                    script: "Am I being detained or am I free to go?"
                )

                scriptRow(
                    icon: "person.crop.rectangle.fill",
                    title: "Request Attorney",
                    script: "I want to speak to an attorney."
                )

                scriptRow(
                    icon: "house.fill",
                    title: "Refuse Entry",
                    script: "I do not consent to entry into my home."
                )

                scriptRow(
                    icon: "doc.text.fill",
                    title: "Request Warrant",
                    script: "Please show me a warrant signed by a judge."
                )

                scriptRow(
                    icon: "pencil.slash",
                    title: "Refuse to Sign",
                    script: "I do not wish to sign any documents."
                )

            }

        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white.opacity(0.05))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Palette.accent.gold.opacity(0.3), lineWidth: 1)
                )
        )

    }

    private func scriptRow(icon: String, title: String, script: String) -> some View {

        let isCopied = copiedScript == script

        return Button(action: {
            UIPasteboard.general.string = script
            withAnimation {
                copiedScript = script
            }
            // Haptic
            let generator = UIImpactFeedbackGenerator(style: .light)
            generator.impactOccurred()
            // Reset after delay
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                if copiedScript == script {
                    withAnimation {
                        copiedScript = nil
                    }
                }
            }
        }) {
            HStack(spacing: 12) {

                Image(systemName: icon)
                    .font(.system(size: 16))
                    .foregroundColor(isCopied ? .green : Palette.accent.gold)
                    .frame(width: 24)

                VStack(alignment: .leading, spacing: 2) {
                    Text(title)
                        .font(.system(size: 11, weight: .semibold))
                        .foregroundColor(Palette.text.muted)

                    Text(script)
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                }

                Spacer()

                Image(systemName: isCopied ? "checkmark.circle.fill" : "doc.on.doc")
                    .font(.system(size: 14))
                    .foregroundColor(isCopied ? .green : Palette.text.muted)

            }
            .padding(.vertical, 8)
            .padding(.horizontal, 12)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(isCopied ? Color.green.opacity(0.1) : Color.white.opacity(0.03))
            )
        }

    }

}

// MARK: - ICE Warrant Comparison Card

struct ICEWarrantCard: View {

    var body: some View {

        VStack(alignment: .leading, spacing: 16) {

            // Header
            HStack {
                Image(systemName: "exclamationmark.triangle.fill")
                    .font(.title2)
                    .foregroundColor(.orange)

                Text("Know Your Warrants")
                    .font(.system(size: 18, weight: .bold, design: .rounded))
                    .foregroundColor(.white)

                Spacer()
            }

            Text("This distinction could determine your fate.")
                .font(.system(size: 12, weight: .medium))
                .foregroundColor(Palette.text.muted)

            // Judicial Warrant
            VStack(alignment: .leading, spacing: 8) {

                HStack {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.green)
                    Text("JUDICIAL WARRANT")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(.green)
                }

                VStack(alignment: .leading, spacing: 4) {
                    bulletPoint("Signed by a JUDGE")
                    bulletPoint("Has court letterhead")
                    bulletPoint("Says 'United States District Court'")
                    bulletPoint("DOES authorize entry")
                }
                .font(.system(size: 13, weight: .medium))
                .foregroundColor(Palette.text.secondary)

            }
            .padding(12)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.green.opacity(0.1))
            )

            // ICE Administrative Warrant
            VStack(alignment: .leading, spacing: 8) {

                HStack {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.red)
                    Text("ICE ADMINISTRATIVE WARRANT")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(.red)
                }

                VStack(alignment: .leading, spacing: 4) {
                    bulletPoint("Form I-200 or I-205")
                    bulletPoint("Signed by ICE OFFICER")
                    bulletPoint("Says 'Department of Homeland Security'")
                    bulletPoint("Does NOT authorize home entry")
                }
                .font(.system(size: 13, weight: .medium))
                .foregroundColor(Palette.text.secondary)

            }
            .padding(12)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.red.opacity(0.1))
            )

            // Bottom note
            Text("If only an ICE warrant: 'This is not a judicial warrant. I do not consent to entry.'")
                .font(.system(size: 12, weight: .semibold))
                .foregroundColor(Palette.accent.gold)
                .italic()

        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white.opacity(0.05))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.orange.opacity(0.3), lineWidth: 1)
                )
        )

    }

    private func bulletPoint(_ text: String) -> some View {
        HStack(alignment: .top, spacing: 6) {
            Text("•")
            Text(text)
        }
    }

}

// MARK: - Emergency Contacts Card

struct EmergencyContactsCard: View {

    var body: some View {

        VStack(alignment: .leading, spacing: 16) {

            // Header
            HStack {
                Image(systemName: "phone.fill")
                    .font(.title2)
                    .foregroundColor(.blue)

                Text("Emergency Resources")
                    .font(.system(size: 18, weight: .bold, design: .rounded))
                    .foregroundColor(.white)

                Spacer()
            }

            Text("Save these numbers BEFORE you need them.")
                .font(.system(size: 12, weight: .medium))
                .foregroundColor(Palette.text.muted)

            VStack(spacing: 10) {

                resourceRow(
                    name: "ICE Detainee Locator",
                    number: "1-888-351-4024",
                    note: "Find where someone is detained"
                )

                resourceRow(
                    name: "ACLU",
                    number: "aclu.org",
                    note: "Know Your Rights resources"
                )

                resourceRow(
                    name: "National Immigration Law Center",
                    number: "nilc.org",
                    note: "Immigration legal information"
                )

                resourceRow(
                    name: "United We Dream",
                    number: "unitedwedream.org",
                    note: "Immigrant youth network"
                )

                resourceRow(
                    name: "RAICES",
                    number: "raicestexas.org",
                    note: "Free legal services"
                )

            }

            // Local note
            HStack {
                Image(systemName: "info.circle.fill")
                    .foregroundColor(Palette.text.muted)
                Text("Search for local rapid response hotlines in your area")
                    .font(.system(size: 11, weight: .medium))
                    .foregroundColor(Palette.text.muted)
            }

        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white.opacity(0.05))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.blue.opacity(0.3), lineWidth: 1)
                )
        )

    }

    private func resourceRow(name: String, number: String, note: String) -> some View {
        VStack(alignment: .leading, spacing: 2) {
            HStack {
                Text(name)
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.white)
                Spacer()
                Text(number)
                    .font(.system(size: 13, weight: .bold, design: .monospaced))
                    .foregroundColor(.blue)
            }
            Text(note)
                .font(.system(size: 11, weight: .medium))
                .foregroundColor(Palette.text.muted)
        }
        .padding(10)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.white.opacity(0.03))
        )
    }

}

// MARK: - Quick Rights Reference View

struct QuickRightsReferenceView: View {

    @Environment(\.dismiss) private var dismiss

    var body: some View {

        NavigationStack {

            ZStack {

                Color.black.ignoresSafeArea()

                ScrollView(showsIndicators: false) {

                    VStack(spacing: 20) {

                        // Important Note
                        HStack {
                            Image(systemName: "exclamationmark.circle.fill")
                                .foregroundColor(.orange)
                            Text("This is educational information, NOT legal advice.")
                                .font(.system(size: 12, weight: .medium))
                                .foregroundColor(.orange)
                        }
                        .padding(12)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.orange.opacity(0.1))
                        )

                        RightsScriptsCard()

                        ICEWarrantCard()

                        EmergencyContactsCard()

                        Spacer(minLength: 50)

                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 16)

                }

            }
            .navigationTitle("Quick Reference")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { dismiss() }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(Palette.text.secondary)
                    }
                }
            }

        }

    }

}

// MARK: - Preview

#Preview {
    QuickRightsReferenceView()
}
