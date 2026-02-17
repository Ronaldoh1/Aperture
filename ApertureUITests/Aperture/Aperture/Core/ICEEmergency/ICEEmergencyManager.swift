// ICEEmergencyManager.swift
// Aperture - ICE Emergency Response System
// Global accessibility - shake phone, floating button, or Settings

import CoreLocation
import MessageUI
import SwiftUI

@MainActor
final class ICEEmergencyManager: ObservableObject {
  static let shared = ICEEmergencyManager()

  @Published var isEmergencyActive = false
  @Published var emergencyContacts: [EmergencyContact] = []
  @Published var currentLanguage: EmergencyLanguage = .english
  @Published var lastKnownLocation: CLLocationCoordinate2D?

  @AppStorage("iceContactsData") private var contactsData: Data = .init()

  enum EmergencyLanguage: String, CaseIterable {
    case english = "English"
    case spanish = "Español"
  }

  private let locationManager = CLLocationManager()

  private init() {
    loadContacts()
  }

  func activateEmergency() {
    isEmergencyActive = true
    requestLocation()
  }

  func deactivateEmergency() {
    isEmergencyActive = false
  }

  func requestLocation() {
    locationManager.requestWhenInUseAuthorization()
    locationManager.requestLocation()
  }

  func addContact(_ contact: EmergencyContact) {
    emergencyContacts.append(contact)
    saveContacts()
  }

  func removeContact(at index: Int) {
    guard index < emergencyContacts.count else { return }
    emergencyContacts.remove(at: index)
    saveContacts()
  }

  private func loadContacts() {
    if let decoded = try? JSONDecoder().decode([EmergencyContact].self, from: contactsData) {
      emergencyContacts = decoded
    }
  }

  private func saveContacts() {
    if let encoded = try? JSONEncoder().encode(emergencyContacts) {
      contactsData = encoded
    }
  }

  // MARK: - Rights Data

  var rights: [(String, String)] {
    switch currentLanguage {
    case .english:
      return [
        ("🛡️", "You have the right to remain silent"),
        ("📝", "You do NOT have to sign anything"),
        ("🚪", "You do NOT have to open your door without a warrant"),
        ("📞", "You have the right to a phone call"),
        ("⚖️", "You have the right to an attorney"),
        ("🏠", "ICE cannot enter your home without a judicial warrant"),
        ("📋", "Ask to see the warrant through the window"),
        ("🤐", "Say: 'I am exercising my right to remain silent'"),
      ]
    case .spanish:
      return [
        ("🛡️", "Tiene derecho a permanecer en silencio"),
        ("📝", "NO tiene que firmar nada"),
        ("🚪", "NO tiene que abrir la puerta sin una orden judicial"),
        ("📞", "Tiene derecho a una llamada telefónica"),
        ("⚖️", "Tiene derecho a un abogado"),
        ("🏠", "ICE no puede entrar sin una orden judicial"),
        ("📋", "Pida ver la orden por la ventana"),
        ("🤐", "Diga: 'Estoy ejerciendo mi derecho a permanecer en silencio'"),
      ]
    }
  }

  var keyPhrases: [(String, String)] {
    switch currentLanguage {
    case .english:
      return [
        ("🤐", "I am exercising my right to remain silent."),
        ("⚖️", "I want to speak to a lawyer."),
        ("📋", "I do not consent to a search."),
        ("🚪", "Please show me the warrant."),
        ("❌", "I do not consent to this interview."),
        ("📝", "I will not sign anything without a lawyer."),
      ]
    case .spanish:
      return [
        ("🤐", "Estoy ejerciendo mi derecho a permanecer en silencio."),
        ("⚖️", "Quiero hablar con un abogado."),
        ("📋", "No doy consentimiento para una búsqueda."),
        ("🚪", "Por favor muéstreme la orden judicial."),
        ("❌", "No doy consentimiento para esta entrevista."),
        ("📝", "No firmaré nada sin un abogado."),
      ]
    }
  }

  var hotlines: [(String, String, String)] {
    [
      ("ACLU", "212-549-2500", "aclu.org"),
      ("United We Dream", "1-844-363-1423", "unitedwedream.org"),
      ("NILC", "213-639-3900", "nilc.org"),
      ("ICE Detainee Locator", "1-888-351-4024", "locator.ice.gov"),
    ]
  }

  var whatNotToDo: [String] {
    switch currentLanguage {
    case .english:
      return [
        "❌ Do NOT run or resist",
        "❌ Do NOT lie or give false documents",
        "❌ Do NOT sign anything you don't understand",
        "❌ Do NOT open the door without seeing a warrant",
        "❌ Do NOT answer questions without a lawyer",
      ]
    case .spanish:
      return [
        "❌ NO corra ni resista",
        "❌ NO mienta ni dé documentos falsos",
        "❌ NO firme nada que no entienda",
        "❌ NO abra la puerta sin ver una orden judicial",
        "❌ NO conteste preguntas sin un abogado",
      ]
    }
  }
}

// MARK: - Emergency Contact Model

struct EmergencyContact: Identifiable, Codable {
  let id: UUID
  var name: String
  var phone: String
  var relationship: String
  var isLawyer: Bool

  init(id: UUID = UUID(), name: String, phone: String, relationship: String, isLawyer: Bool = false)
  {
    self.id = id
    self.name = name
    self.phone = phone
    self.relationship = relationship
    self.isLawyer = isLawyer
  }
}

// MARK: - ICE Emergency View

struct ICEEmergencyView: View {
  @ObservedObject var manager = ICEEmergencyManager.shared
  @Environment(\.dismiss) private var dismiss
  @State private var selectedTab = 0

  var body: some View {
    NavigationStack {
      ZStack {
        Color.red.opacity(0.1).ignoresSafeArea()

        VStack(spacing: 0) {
          // Language Toggle
          Picker("Language", selection: $manager.currentLanguage) {
            ForEach(ICEEmergencyManager.EmergencyLanguage.allCases, id: \.self) { lang in
              Text(lang.rawValue).tag(lang)
            }
          }
          .pickerStyle(.segmented)
          .padding()

          // Tab Selector
          HStack(spacing: 0) {
            TabButton(
              title: manager.currentLanguage == .english ? "Rights" : "Derechos",
              isSelected: selectedTab == 0
            ) { selectedTab = 0 }
            TabButton(
              title: manager.currentLanguage == .english ? "Phrases" : "Frases",
              isSelected: selectedTab == 1
            ) { selectedTab = 1 }
            TabButton(
              title: manager.currentLanguage == .english ? "Contacts" : "Contactos",
              isSelected: selectedTab == 2
            ) { selectedTab = 2 }
            TabButton(
              title: manager.currentLanguage == .english ? "Hotlines" : "Líneas",
              isSelected: selectedTab == 3
            ) { selectedTab = 3 }
          }
          .background(Color.black.opacity(0.3))

          // Content
          TabView(selection: $selectedTab) {
            rightsTab.tag(0)
            phrasesTab.tag(1)
            contactsTab.tag(2)
            hotlinesTab.tag(3)
          }
          .tabViewStyle(.page(indexDisplayMode: .never))
        }
      }
      .navigationTitle("🚨 ICE Emergency")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button(action: { dismiss() }) {
            Image(systemName: "xmark.circle.fill")
              .foregroundStyle(.white)
          }
        }
      }
    }
  }

  private var rightsTab: some View {
    ScrollView {
      VStack(spacing: 12) {
        Text(manager.currentLanguage == .english ? "🛡️ KNOW YOUR RIGHTS" : "🛡️ CONOZCA SUS DERECHOS")
          .font(.headline)
          .foregroundStyle(.white)
          .padding(.top)

        ForEach(manager.rights, id: \.1) { right in
          HStack(spacing: 12) {
            Text(right.0)
              .font(.title2)
            Text(right.1)
              .font(.body)
              .foregroundStyle(.white)
            Spacer()
          }
          .padding()
          .background(Color.white.opacity(0.1))
          .cornerRadius(12)
        }

        // What NOT to do
        VStack(alignment: .leading, spacing: 8) {
          Text(manager.currentLanguage == .english ? "⚠️ WHAT NOT TO DO" : "⚠️ QUÉ NO HACER")
            .font(.headline)
            .foregroundStyle(.red)
            .padding(.top)

          ForEach(manager.whatNotToDo, id: \.self) { item in
            Text(item)
              .font(.subheadline)
              .foregroundStyle(.white.opacity(0.9))
          }
        }
        .padding()
        .background(Color.red.opacity(0.2))
        .cornerRadius(12)
      }
      .padding()
    }
  }

  private var phrasesTab: some View {
    ScrollView {
      VStack(spacing: 12) {
        Text(manager.currentLanguage == .english ? "💬 KEY PHRASES" : "💬 FRASES CLAVE")
          .font(.headline)
          .foregroundStyle(.white)
          .padding(.top)

        ForEach(manager.keyPhrases, id: \.1) { phrase in
          VStack(alignment: .leading, spacing: 8) {
            HStack {
              Text(phrase.0)
              Spacer()
            }
            Text(phrase.1)
              .font(.title3)
              .fontWeight(.semibold)
              .foregroundStyle(.white)
          }
          .padding()
          .background(Color.white.opacity(0.1))
          .cornerRadius(12)
        }
      }
      .padding()
    }
  }

  private var contactsTab: some View {
    ScrollView {
      VStack(spacing: 12) {
        Text(
          manager.currentLanguage == .english ? "📞 EMERGENCY CONTACTS" : "📞 CONTACTOS DE EMERGENCIA"
        )
        .font(.headline)
        .foregroundStyle(.white)
        .padding(.top)

        if manager.emergencyContacts.isEmpty {
          Text(
            manager.currentLanguage == .english
              ? "No contacts added. Add contacts in Settings."
              : "No hay contactos. Agregue contactos en Configuración."
          )
          .foregroundStyle(.white.opacity(0.6))
          .padding()
        } else {
          ForEach(manager.emergencyContacts) { contact in
            HStack {
              VStack(alignment: .leading) {
                Text(contact.name)
                  .font(.headline)
                  .foregroundStyle(.white)
                Text(contact.relationship)
                  .font(.caption)
                  .foregroundStyle(.white.opacity(0.6))
              }
              Spacer()

              // Call Button
              Button(action: {
                if let url = URL(string: "tel://\(contact.phone)") {
                  UIApplication.shared.open(url)
                }
              }) {
                Image(systemName: "phone.fill")
                  .foregroundStyle(.green)
                  .padding(12)
                  .background(Color.green.opacity(0.2))
                  .clipShape(Circle())
              }

              // SMS Button
              Button(action: {
                if let url = URL(string: "sms://\(contact.phone)") {
                  UIApplication.shared.open(url)
                }
              }) {
                Image(systemName: "message.fill")
                  .foregroundStyle(.blue)
                  .padding(12)
                  .background(Color.blue.opacity(0.2))
                  .clipShape(Circle())
              }
            }
            .padding()
            .background(Color.white.opacity(0.1))
            .cornerRadius(12)
          }
        }
      }
      .padding()
    }
  }

  private var hotlinesTab: some View {
    ScrollView {
      VStack(spacing: 12) {
        Text(manager.currentLanguage == .english ? "☎️ HOTLINES" : "☎️ LÍNEAS DE AYUDA")
          .font(.headline)
          .foregroundStyle(.white)
          .padding(.top)

        ForEach(manager.hotlines, id: \.0) { hotline in
          HStack {
            VStack(alignment: .leading) {
              Text(hotline.0)
                .font(.headline)
                .foregroundStyle(.white)
              Text(hotline.2)
                .font(.caption)
                .foregroundStyle(.white.opacity(0.6))
            }
            Spacer()

            Button(action: {
              if let url = URL(string: "tel://\(hotline.1.replacingOccurrences(of: "-", with: ""))")
              {
                UIApplication.shared.open(url)
              }
            }) {
              Text(hotline.1)
                .font(.subheadline)
                .foregroundStyle(.green)
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(Color.green.opacity(0.2))
                .cornerRadius(8)
            }
          }
          .padding()
          .background(Color.white.opacity(0.1))
          .cornerRadius(12)
        }
      }
      .padding()
    }
  }
}

struct TabButton: View {
  let title: String
  let isSelected: Bool
  let action: () -> Void

  var body: some View {
    Button(action: action) {
      Text(title)
        .font(.caption)
        .fontWeight(isSelected ? .bold : .regular)
        .foregroundStyle(isSelected ? .white : .white.opacity(0.6))
        .frame(maxWidth: .infinity)
        .padding(.vertical, 12)
        .background(isSelected ? Color.red.opacity(0.5) : Color.clear)
    }
  }
}

// MARK: - Global Wrapper (Shake Detection + Floating Button)

struct ICEEmergencyGlobalWrapper: ViewModifier {
  @State private var showEmergency = false
  @State private var showFloatingButton = true
  @State private var buttonOffset: CGSize = .zero

  func body(content: Content) -> some View {
    ZStack {
      content

      // Floating Panic Button
      if showFloatingButton {
        VStack {
          Spacer()
          HStack {
            Spacer()
            Button(action: { showEmergency = true }) {
              Image(systemName: "exclamationmark.shield.fill")
                .font(.title2)
                .foregroundStyle(.white)
                .padding(16)
                .background(Color.red)
                .clipShape(Circle())
                .shadow(color: .red.opacity(0.5), radius: 10)
            }
            .offset(buttonOffset)
            .gesture(
              DragGesture()
                .onChanged { value in
                  buttonOffset = value.translation
                }
                .onEnded { _ in }
            )
            .padding(.trailing, 20)
            .padding(.bottom, 100)
          }
        }
      }
    }
    .onShake {
      showEmergency = true
    }
    .sheet(isPresented: $showEmergency) {
      ICEEmergencyView()
    }
  }
}

extension View {
  func iceEmergencyEnabled() -> some View {
    modifier(ICEEmergencyGlobalWrapper())
  }
}

// MARK: - Shake Detection

extension UIDevice {
  static let deviceDidShakeNotification = Notification.Name("deviceDidShakeNotification")
}

extension UIWindow {
  override open func motionEnded(_ motion: UIEvent.EventSubtype, with _: UIEvent?) {
    if motion == .motionShake {
      NotificationCenter.default.post(name: UIDevice.deviceDidShakeNotification, object: nil)
    }
  }
}

struct ShakeDetector: ViewModifier {
  let action: () -> Void

  func body(content: Content) -> some View {
    content
      .onReceive(NotificationCenter.default.publisher(for: UIDevice.deviceDidShakeNotification)) {
        _ in
        action()
      }
  }
}

extension View {
  func onShake(_ action: @escaping () -> Void) -> some View {
    modifier(ShakeDetector(action: action))
  }
}

// MARK: - Settings View

struct ICEEmergencySettingsView: View {
  @ObservedObject var manager = ICEEmergencyManager.shared
  @State private var showAddContact = false
  @State private var newName = ""
  @State private var newPhone = ""
  @State private var newRelationship = ""
  @State private var isLawyer = false

  var body: some View {
    List {
      Section(header: Text("Emergency Contacts")) {
        ForEach(manager.emergencyContacts) { contact in
          VStack(alignment: .leading) {
            HStack {
              Text(contact.name)
                .fontWeight(.semibold)
              if contact.isLawyer {
                Text("⚖️")
              }
            }
            Text(contact.phone)
              .font(.caption)
              .foregroundStyle(.secondary)
            Text(contact.relationship)
              .font(.caption2)
              .foregroundStyle(.secondary)
          }
        }
        .onDelete { indexSet in
          indexSet.forEach { manager.removeContact(at: $0) }
        }

        Button(action: { showAddContact = true }) {
          Label("Add Contact", systemImage: "plus.circle.fill")
        }
      }

      Section(header: Text("Quick Access")) {
        Toggle("Show Floating Button", isOn: .constant(true))
        Text("Shake phone twice to activate emergency mode")
          .font(.caption)
          .foregroundStyle(.secondary)
      }
    }
    .navigationTitle("ICE Settings")
    .sheet(isPresented: $showAddContact) {
      NavigationStack {
        Form {
          TextField("Name", text: $newName)
          TextField("Phone", text: $newPhone)
            .keyboardType(.phonePad)
          TextField("Relationship", text: $newRelationship)
          Toggle("Is Lawyer", isOn: $isLawyer)
        }
        .navigationTitle("Add Contact")
        .toolbar {
          ToolbarItem(placement: .navigationBarLeading) {
            Button("Cancel") { showAddContact = false }
          }
          ToolbarItem(placement: .navigationBarTrailing) {
            Button("Save") {
              let contact = EmergencyContact(
                name: newName,
                phone: newPhone,
                relationship: newRelationship,
                isLawyer: isLawyer
              )
              manager.addContact(contact)
              showAddContact = false
              newName = ""
              newPhone = ""
              newRelationship = ""
              isLawyer = false
            }
            .disabled(newName.isEmpty || newPhone.isEmpty)
          }
        }
      }
    }
  }
}

#Preview {
  ICEEmergencyView()
}
