// AddPriorityItemView.swift
// Aperture
//
// Add and triage priority items - P1 through P5

import SwiftUI

struct AddPriorityItemView: View {
  @StateObject private var orchestrator = FlowOrchestrator.shared
  @Environment(\.dismiss) private var dismiss

  @State private var title = ""
  @State private var description = ""
  @State private var priority: Priority = .p2
  @State private var source: PrioritySource = .manual
  @State private var hasDueDate = false
  @State private var dueDate = Date()

  var body: some View {
    NavigationStack {
      ZStack {
        Color(hex: "#0a0a1a")
          .ignoresSafeArea()

        ScrollView {
          VStack(spacing: 24) {
            // Title
            VStack(alignment: .leading, spacing: 8) {
              Text("What needs your attention?")
                .font(.subheadline.bold())
                .foregroundColor(.white.opacity(0.7))

              TextField("Enter item", text: $title)
                .padding()
                .background(Color.white.opacity(0.1))
                .cornerRadius(12)
                .foregroundColor(.white)
            }

            // Description (optional)
            VStack(alignment: .leading, spacing: 8) {
              Text("Details (optional)")
                .font(.subheadline.bold())
                .foregroundColor(.white.opacity(0.7))

              TextEditor(text: $description)
                .frame(minHeight: 60)
                .scrollContentBackground(.hidden)
                .background(Color.white.opacity(0.1))
                .cornerRadius(12)
                .foregroundColor(.white)
            }

            // Priority Selection
            VStack(alignment: .leading, spacing: 12) {
              Text("Priority Level")
                .font(.subheadline.bold())
                .foregroundColor(.white.opacity(0.7))

              ForEach(Priority.allCases, id: \.self) { p in
                PriorityOptionRow(
                  priority: p,
                  isSelected: priority == p,
                  action: { priority = p }
                )
              }
            }

            // Source
            VStack(alignment: .leading, spacing: 12) {
              Text("Source")
                .font(.subheadline.bold())
                .foregroundColor(.white.opacity(0.7))

              HStack(spacing: 8) {
                ForEach([PrioritySource.email, .calendar, .slack, .manual], id: \.self) { s in
                  SourceButton(
                    source: s,
                    isSelected: source == s,
                    action: { source = s }
                  )
                }
              }
            }

            // Due Date
            VStack(alignment: .leading, spacing: 12) {
              Toggle(isOn: $hasDueDate) {
                Text("Has Due Date")
                  .foregroundColor(.white)
              }
              .toggleStyle(SwitchToggleStyle(tint: Color(hex: "#7C4DFF")))

              if hasDueDate {
                DatePicker(
                  "Due",
                  selection: $dueDate,
                  displayedComponents: [.date]
                )
                .datePickerStyle(.graphical)
                .colorScheme(.dark)
                .tint(Color(hex: "#7C4DFF"))
              }
            }
            .padding()
            .background(Color.white.opacity(0.05))
            .cornerRadius(16)

            Spacer(minLength: 100)
          }
          .padding()
        }
      }
      .navigationTitle("Add to Inbox")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .topBarLeading) {
          Button("Cancel") { dismiss() }
            .foregroundColor(.white.opacity(0.6))
        }

        ToolbarItem(placement: .topBarTrailing) {
          Button("Add") {
            addItem()
          }
          .fontWeight(.semibold)
          .foregroundColor(title.isEmpty ? .white.opacity(0.3) : Color(hex: "#7C4DFF"))
          .disabled(title.isEmpty)
        }
      }
    }
  }

  private func addItem() {
    let item = PriorityItem(
      id: UUID(),
      title: title,
      description: description.isEmpty ? nil : description,
      priority: priority,
      source: source,
      createdAt: Date(),
      dueDate: hasDueDate ? dueDate : nil
    )

    orchestrator.addPriorityItem(item)
    dismiss()
  }
}

// MARK: - Supporting Views

struct PriorityOptionRow: View {
  let priority: Priority
  let isSelected: Bool
  let action: () -> Void

  var body: some View {
    Button(action: action) {
      HStack(spacing: 12) {
        Circle()
          .fill(priority.color)
          .frame(width: 16, height: 16)

        VStack(alignment: .leading, spacing: 2) {
          Text(priority.label)
            .font(.subheadline.bold())
            .foregroundColor(.white)

          Text(priorityDescription)
            .font(.caption)
            .foregroundColor(.white.opacity(0.5))
        }

        Spacer()

        if isSelected {
          Image(systemName: "checkmark.circle.fill")
            .foregroundColor(priority.color)
        }
      }
      .padding()
      .background(
        RoundedRectangle(cornerRadius: 12)
          .fill(Color.white.opacity(0.05))
          .overlay(
            RoundedRectangle(cornerRadius: 12)
              .stroke(isSelected ? priority.color : Color.clear, lineWidth: 2)
          )
      )
    }
  }

  private var priorityDescription: String {
    switch priority {
    case .p1: return "Must do TODAY - critical"
    case .p2: return "Important - complete this week"
    case .p3: return "Should do - this month"
    case .p4: return "Nice to have - when possible"
    case .p5: return "Archive - get to it eventually"
    }
  }
}

struct SourceButton: View {
  let source: PrioritySource
  let isSelected: Bool
  let action: () -> Void

  private var icon: String {
    switch source {
    case .email: return "envelope.fill"
    case .calendar: return "calendar"
    case .slack: return "bubble.left.fill"
    case .manual: return "hand.tap.fill"
    case .other: return "ellipsis"
    }
  }

  var body: some View {
    Button(action: action) {
      VStack(spacing: 4) {
        Image(systemName: icon)
          .font(.title3)

        Text(source.rawValue)
          .font(.caption2)
      }
      .foregroundColor(isSelected ? .white : .white.opacity(0.5))
      .frame(maxWidth: .infinity)
      .padding(.vertical, 12)
      .background(isSelected ? Color(hex: "#7C4DFF").opacity(0.3) : Color.white.opacity(0.05))
      .cornerRadius(12)
    }
  }
}

// MARK: - Inbox View (Full list with triage)

struct PriorityInboxView: View {
  @StateObject private var orchestrator = FlowOrchestrator.shared
  @Environment(\.dismiss) private var dismiss
  @State private var showAddItem = false
  @State private var selectedPriority: Priority?

  var body: some View {
    NavigationStack {
      ZStack {
        Color(hex: "#0a0a1a")
          .ignoresSafeArea()

        if orchestrator.priorityInbox.isEmpty {
          emptyState
        } else {
          ScrollView {
            VStack(spacing: 16) {
              // Filter buttons
              ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                  FilterButton(
                    label: "All",
                    isSelected: selectedPriority == nil,
                    color: Color(hex: "#7C4DFF")
                  ) {
                    selectedPriority = nil
                  }

                  ForEach(Priority.allCases, id: \.self) { p in
                    FilterButton(
                      label: p.shortLabel,
                      isSelected: selectedPriority == p,
                      color: p.color
                    ) {
                      selectedPriority = p
                    }
                  }
                }
                .padding(.horizontal)
              }

              // Items
              LazyVStack(spacing: 12) {
                ForEach(filteredItems) { item in
                  InboxItemRow(item: item)
                }
              }
              .padding(.horizontal)
            }
            .padding(.vertical)
          }
        }
      }
      .navigationTitle("Priority Inbox")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .topBarLeading) {
          Button("Done") { dismiss() }
            .foregroundColor(.white)
        }

        ToolbarItem(placement: .topBarTrailing) {
          Button {
            showAddItem = true
          } label: {
            Image(systemName: "plus.circle.fill")
              .foregroundColor(Color(hex: "#7C4DFF"))
          }
        }
      }
      .sheet(isPresented: $showAddItem) {
        AddPriorityItemView()
      }
    }
  }

  private var filteredItems: [PriorityItem] {
    if let priority = selectedPriority {
      return orchestrator.priorityInbox.filter { $0.priority == priority }
    }
    return orchestrator.priorityInbox
  }

  private var emptyState: some View {
    VStack(spacing: 16) {
      Image(systemName: "tray")
        .font(.system(size: 50))
        .foregroundColor(.white.opacity(0.3))

      Text("Inbox Zero!")
        .font(.title2.bold())
        .foregroundColor(.white)

      Text("Your mind is clear 🧘")
        .font(.subheadline)
        .foregroundColor(.white.opacity(0.6))

      Button {
        showAddItem = true
      } label: {
        Text("Add Item")
          .fontWeight(.semibold)
          .foregroundColor(.white)
          .padding(.horizontal, 24)
          .padding(.vertical, 12)
          .background(Color(hex: "#7C4DFF"))
          .cornerRadius(20)
      }
      .padding(.top)
    }
  }
}

struct FilterButton: View {
  let label: String
  let isSelected: Bool
  let color: Color
  let action: () -> Void

  var body: some View {
    Button(action: action) {
      Text(label)
        .font(.subheadline.bold())
        .foregroundColor(isSelected ? .white : .white.opacity(0.6))
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
        .background(isSelected ? color : Color.white.opacity(0.1))
        .cornerRadius(20)
    }
  }
}

struct InboxItemRow: View {
  let item: PriorityItem
  @StateObject private var orchestrator = FlowOrchestrator.shared
  @State private var offset: CGFloat = 0

  var body: some View {
    HStack(spacing: 12) {
      // Priority indicator
      Circle()
        .fill(item.priority.color)
        .frame(width: 12, height: 12)

      VStack(alignment: .leading, spacing: 4) {
        Text(item.title)
          .font(.subheadline.bold())
          .foregroundColor(.white)
          .strikethrough(item.isCompleted)

        HStack(spacing: 8) {
          Text(item.priority.shortLabel)
            .font(.caption2.bold())
            .foregroundColor(item.priority.color)

          Text(item.source.rawValue)
            .font(.caption2)
            .foregroundColor(.white.opacity(0.5))

          if let dueDate = item.dueDate {
            Text(dueDate, style: .date)
              .font(.caption2)
              .foregroundColor(isDueSoon(dueDate) ? .red : .white.opacity(0.5))
          }
        }
      }

      Spacer()

      // Quick actions
      Menu {
        ForEach(Priority.allCases, id: \.self) { p in
          Button {
            orchestrator.updateItemPriority(item.id, priority: p)
          } label: {
            Label(p.label, systemImage: "circle.fill")
          }
        }

        Divider()

        Button(role: .destructive) {
          orchestrator.archiveItem(item.id)
        } label: {
          Label("Archive", systemImage: "archivebox")
        }
      } label: {
        Image(systemName: "ellipsis")
          .foregroundColor(.white.opacity(0.5))
          .padding(8)
      }
    }
    .padding()
    .background(Color.white.opacity(0.05))
    .cornerRadius(12)
  }

  private func isDueSoon(_ date: Date) -> Bool {
    let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: Date())!
    return date <= tomorrow
  }
}

#Preview("Add Priority") {
  AddPriorityItemView()
}

#Preview("Inbox") {
  PriorityInboxView()
}
