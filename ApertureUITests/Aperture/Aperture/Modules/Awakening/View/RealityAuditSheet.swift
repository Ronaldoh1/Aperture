// RealityAuditSheet.swift

import SwiftUI

struct RealityAuditSheet: View {
  let entries: [RealityAuditEntry]
  let onSave: (RealityAuditEntry) -> Void
  let onDismiss: () -> Void

  @State private var showAddEntry = false
  @State private var selectedDomain: RealityAuditEntry.AuditDomain?

  var body: some View {
    ZStack {
      Color.black.ignoresSafeArea()

      VStack(spacing: 0) {
        HStack {
          VStack(alignment: .leading, spacing: 4) {
            Text("Reality Audit").font(.system(size: 20, weight: .bold, design: .rounded))
              .foregroundColor(Palette.text.primary)
            Text("Inventory and examine your beliefs").font(
              .system(size: 13, weight: .medium, design: .rounded)
            ).foregroundColor(Palette.primary.cyan)
          }
          Spacer()
          Button(action: onDismiss) {
            Image(systemName: "xmark.circle.fill").font(.system(size: 28)).foregroundColor(
              Palette.text.secondary)
          }
        }
        .padding(.horizontal, 20).padding(.top, 20).padding(.bottom, 16)

        HStack(spacing: 12) {
          statusStat(status: .inherited, count: entries.filter { $0.status == .inherited }.count)
          statusStat(status: .examining, count: entries.filter { $0.status == .examining }.count)
          statusStat(status: .integrated, count: entries.filter { $0.status == .integrated }.count)
          statusStat(status: .discarded, count: entries.filter { $0.status == .discarded }.count)
        }
        .padding(.horizontal, 20).padding(.bottom, 16)

        ScrollView(.horizontal, showsIndicators: false) {
          HStack(spacing: 8) {
            Button {
              selectedDomain = nil
            } label: {
              Text("All").font(.system(size: 12, weight: .semibold, design: .rounded))
                .foregroundColor(selectedDomain == nil ? .black : Palette.text.secondary).padding(
                  .horizontal, 14
                ).padding(.vertical, 8).background(
                  Capsule().fill(
                    selectedDomain == nil ? Palette.primary.cyan : Color.white.opacity(0.1)))
            }
            ForEach(RealityAuditEntry.AuditDomain.allCases, id: \.self) { domain in
              Button {
                selectedDomain = domain
              } label: {
                HStack(spacing: 4) {
                  Image(systemName: domain.icon).font(.system(size: 10))
                  Text(domain.rawValue).font(.system(size: 11, weight: .semibold, design: .rounded))
                }
                .foregroundColor(selectedDomain == domain ? .black : domain.color).padding(
                  .horizontal, 12
                ).padding(.vertical, 8)
                .background(
                  Capsule().fill(
                    selectedDomain == domain ? domain.color : domain.color.opacity(0.15)))
              }
            }
          }
          .padding(.horizontal, 20)
        }
        .padding(.bottom, 16)

        Button {
          showAddEntry = true
        } label: {
          HStack {
            Image(systemName: "plus.circle.fill")
            Text("Add Belief").font(.system(size: 15, weight: .bold, design: .rounded))
          }
          .foregroundColor(.black).frame(maxWidth: .infinity).padding(.vertical, 14)
          .background(
            RoundedRectangle(cornerRadius: 12, style: .continuous).fill(Palette.primary.cyan))
        }
        .padding(.horizontal, 20).padding(.bottom, 16)

        if filteredEntries.isEmpty {
          Spacer()
          VStack(spacing: 16) {
            Image(systemName: "checklist").font(.system(size: 50)).foregroundColor(
              Palette.primary.cyan.opacity(0.5))
            Text("No beliefs yet").font(.system(size: 18, weight: .semibold, design: .rounded))
              .foregroundColor(Palette.text.secondary)
            Text("Start examining what you believe").font(
              .system(size: 14, weight: .medium, design: .rounded)
            ).foregroundColor(Palette.text.muted)
          }
          Spacer()
        } else {
          ScrollView {
            LazyVStack(spacing: 12) {
              ForEach(filteredEntries) { entry in
                BeliefCard(entry: entry) { newStatus in
                  var updated = entry
                  updated.status = newStatus
                  updated.lastExamined = Date()
                  onSave(updated)
                }
              }
            }
            .padding(.horizontal, 20).padding(.bottom, 40)
          }
        }
      }
    }
    .sheet(isPresented: $showAddEntry) {
      AddBeliefView(selectedDomain: selectedDomain, onSave: onSave) { showAddEntry = false }
    }
  }

  private var filteredEntries: [RealityAuditEntry] {
    if let domain = selectedDomain {
      return entries.filter { $0.domain == domain }.sorted { $0.lastExamined > $1.lastExamined }
    }
    return entries.sorted { $0.lastExamined > $1.lastExamined }
  }

  private func statusStat(status: RealityAuditEntry.BeliefStatus, count: Int) -> some View {
    VStack(spacing: 2) {
      Text("\(count)").font(.system(size: 18, weight: .bold, design: .rounded)).foregroundColor(
        status.color)
      Text(status.rawValue).font(.system(size: 9, weight: .medium, design: .rounded))
        .foregroundColor(Palette.text.muted)
    }
    .frame(maxWidth: .infinity).padding(.vertical, 10)
    .background(
      RoundedRectangle(cornerRadius: 10, style: .continuous).fill(status.color.opacity(0.1)))
  }
}

struct BeliefCard: View {
  let entry: RealityAuditEntry
  let onStatusChange: (RealityAuditEntry.BeliefStatus) -> Void
  @State private var showStatusPicker = false

  var body: some View {
    VStack(alignment: .leading, spacing: 12) {
      HStack {
        HStack(spacing: 5) {
          Image(systemName: entry.domain.icon).font(.system(size: 10))
          Text(entry.domain.rawValue).font(.system(size: 10, weight: .semibold, design: .rounded))
        }
        .foregroundColor(entry.domain.color).padding(.horizontal, 8).padding(.vertical, 4)
        .background(Capsule().fill(entry.domain.color.opacity(0.15)))
        Spacer()
        Button {
          showStatusPicker = true
        } label: {
          HStack(spacing: 4) {
            Image(systemName: entry.status.icon).font(.system(size: 10))
            Text(entry.status.rawValue).font(.system(size: 10, weight: .semibold, design: .rounded))
            Image(systemName: "chevron.down").font(.system(size: 8))
          }
          .foregroundColor(entry.status.color).padding(.horizontal, 10).padding(.vertical, 5)
          .background(Capsule().fill(entry.status.color.opacity(0.15)))
        }
      }
      Text(entry.belief).font(.system(size: 15, weight: .semibold, design: .rounded))
        .foregroundColor(Palette.text.primary)
      if let origin = entry.origin, !origin.isEmpty {
        HStack(spacing: 6) {
          Image(systemName: "arrow.up.right.circle").font(.system(size: 11))
          Text("Origin: \(origin)").font(.system(size: 12, weight: .medium, design: .rounded))
        }.foregroundColor(Palette.text.muted)
      }
      if let notes = entry.notes, !notes.isEmpty {
        Text(notes).font(.system(size: 13)).foregroundColor(Palette.text.secondary).lineLimit(2)
      }
    }
    .padding(16)
    .background(
      RoundedRectangle(cornerRadius: 14, style: .continuous).fill(Color.white.opacity(0.05))
        .overlay(
          RoundedRectangle(cornerRadius: 14, style: .continuous).stroke(
            entry.status.color.opacity(0.2), lineWidth: 1))
    )
    .confirmationDialog("Update Status", isPresented: $showStatusPicker) {
      ForEach(RealityAuditEntry.BeliefStatus.allCases, id: \.self) { status in
        Button(status.rawValue) { onStatusChange(status) }
      }
    }
  }
}

struct AddBeliefView: View {
  let selectedDomain: RealityAuditEntry.AuditDomain?
  let onSave: (RealityAuditEntry) -> Void
  let onDismiss: () -> Void

  @State private var domain: RealityAuditEntry.AuditDomain = .identity
  @State private var belief = ""
  @State private var origin = ""
  @State private var notes = ""
  @State private var status: RealityAuditEntry.BeliefStatus = .inherited

  var body: some View {
    ZStack {
      Color.black.ignoresSafeArea()
      VStack(spacing: 0) {
        HStack {
          Text("Add Belief").font(.system(size: 20, weight: .bold, design: .rounded))
            .foregroundColor(Palette.text.primary)
          Spacer()
          Button(action: onDismiss) {
            Image(systemName: "xmark.circle.fill").font(.system(size: 28)).foregroundColor(
              Palette.text.secondary)
          }
        }
        .padding(.horizontal, 20).padding(.top, 20).padding(.bottom, 16)

        ScrollView {
          VStack(alignment: .leading, spacing: 24) {
            VStack(alignment: .leading, spacing: 10) {
              Text("DOMAIN").font(.system(size: 12, weight: .bold, design: .rounded)).tracking(1)
                .foregroundColor(Palette.text.secondary)
              LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 8) {
                ForEach(RealityAuditEntry.AuditDomain.allCases, id: \.self) { d in
                  Button {
                    domain = d
                  } label: {
                    HStack(spacing: 6) {
                      Image(systemName: d.icon).font(.system(size: 12))
                      Text(d.rawValue).font(.system(size: 11, weight: .semibold, design: .rounded))
                    }
                    .foregroundColor(domain == d ? .black : d.color).padding(.horizontal, 10)
                    .padding(.vertical, 10).frame(maxWidth: .infinity)
                    .background(
                      RoundedRectangle(cornerRadius: 10, style: .continuous).fill(
                        domain == d ? d.color : d.color.opacity(0.15)))
                  }
                }
              }
            }

            VStack(alignment: .leading, spacing: 8) {
              Text("WHAT DO YOU BELIEVE?").font(.system(size: 12, weight: .bold, design: .rounded))
                .tracking(1).foregroundColor(Palette.primary.cyan)
              ZStack(alignment: .topLeading) {
                if belief.isEmpty {
                  Text("e.g., Success requires hard work...").font(.system(size: 14))
                    .foregroundColor(Palette.text.muted).padding(.top, 12).padding(.leading, 12)
                }
                TextEditor(text: $belief).font(.system(size: 14)).foregroundColor(
                  Palette.text.primary
                ).scrollContentBackground(.hidden).frame(minHeight: 80)
              }
              .padding(8).background(
                RoundedRectangle(cornerRadius: 12, style: .continuous).fill(
                  Color.white.opacity(0.05)
                ).overlay(
                  RoundedRectangle(cornerRadius: 12, style: .continuous).stroke(
                    Palette.primary.cyan.opacity(0.3), lineWidth: 1)))
            }

            VStack(alignment: .leading, spacing: 8) {
              Text("WHERE DID THIS COME FROM? (Optional)").font(
                .system(size: 12, weight: .bold, design: .rounded)
              ).tracking(1).foregroundColor(Palette.text.secondary)
              TextField("Parents, school, media, culture...", text: $origin).font(.system(size: 14))
                .foregroundColor(Palette.text.primary).padding(14).background(
                  RoundedRectangle(cornerRadius: 12, style: .continuous).fill(
                    Color.white.opacity(0.05)))
            }

            VStack(alignment: .leading, spacing: 10) {
              Text("CURRENT STATUS").font(.system(size: 12, weight: .bold, design: .rounded))
                .tracking(1).foregroundColor(Palette.text.secondary)
              HStack(spacing: 8) {
                ForEach(RealityAuditEntry.BeliefStatus.allCases, id: \.self) { s in
                  Button {
                    status = s
                  } label: {
                    VStack(spacing: 4) {
                      Image(systemName: s.icon).font(.system(size: 16))
                      Text(s.rawValue).font(.system(size: 9, weight: .semibold, design: .rounded))
                    }
                    .foregroundColor(status == s ? .black : s.color).frame(maxWidth: .infinity)
                    .padding(.vertical, 12)
                    .background(
                      RoundedRectangle(cornerRadius: 10, style: .continuous).fill(
                        status == s ? s.color : s.color.opacity(0.15)))
                  }
                }
              }
            }

            VStack(alignment: .leading, spacing: 8) {
              Text("NOTES (Optional)").font(.system(size: 12, weight: .bold, design: .rounded))
                .tracking(1).foregroundColor(Palette.text.secondary)
              ZStack(alignment: .topLeading) {
                if notes.isEmpty {
                  Text("Any thoughts or evidence...").font(.system(size: 14)).foregroundColor(
                    Palette.text.muted
                  ).padding(.top, 12).padding(.leading, 12)
                }
                TextEditor(text: $notes).font(.system(size: 14)).foregroundColor(
                  Palette.text.primary
                ).scrollContentBackground(.hidden).frame(minHeight: 60)
              }
              .padding(8).background(
                RoundedRectangle(cornerRadius: 12, style: .continuous).fill(
                  Color.white.opacity(0.05)))
            }

            Button {
              saveEntry()
            } label: {
              HStack {
                Image(systemName: "checkmark.circle.fill")
                Text("Save Belief").font(.system(size: 16, weight: .bold, design: .rounded))
              }
              .foregroundColor(.black).frame(maxWidth: .infinity).padding(.vertical, 16)
              .background(
                RoundedRectangle(cornerRadius: 14, style: .continuous).fill(Palette.primary.cyan))
            }
            .disabled(belief.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
            .opacity(belief.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ? 0.5 : 1.0)

            Spacer(minLength: 40)
          }
          .padding(.horizontal, 20)
        }
      }
    }
    .onAppear { if let d = selectedDomain { domain = d } }
  }

  private func saveEntry() {
    let entry = RealityAuditEntry(
      domain: domain, belief: belief.trimmingCharacters(in: .whitespacesAndNewlines),
      status: status,
      origin: origin.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ? nil : origin,
      notes: notes.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ? nil : notes)
    HapticManager.shared.success()
    onSave(entry)
    onDismiss()
  }
}
