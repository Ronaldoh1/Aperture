// PersistenceController.swift
// Core Data stack with iCloud CloudKit sync
// Data persists across installs via user's iCloud account

import CloudKit
import CoreData

class PersistenceController: ObservableObject {
  static let shared = PersistenceController()

  // MARK: - Container

  let container: NSPersistentCloudKitContainer

  /// For previews/testing
  static var preview: PersistenceController = .init(inMemory: true)
  // Add sample data for previews

  // MARK: - Init

  init(inMemory: Bool = false) {
    container = NSPersistentCloudKitContainer(name: "SunFlowModel")

    // Configure for iCloud sync
    guard let description = container.persistentStoreDescriptions.first else {
      fatalError("No persistent store description found")
    }

    if inMemory {
      description.url = URL(fileURLWithPath: "/dev/null")
    }

    // Enable CloudKit sync
    description.cloudKitContainerOptions = NSPersistentCloudKitContainerOptions(
      containerIdentifier: "iCloud.com.sunflow.reignited"
    )

    // Enable remote change notifications
    description.setOption(
      true as NSNumber, forKey: NSPersistentStoreRemoteChangeNotificationPostOptionKey)

    // Enable history tracking for sync
    description.setOption(true as NSNumber, forKey: NSPersistentHistoryTrackingKey)

    container.loadPersistentStores { storeDescription, error in
      if let error = error as NSError? {
        // In production, handle this gracefully
        print("❌ Core Data failed to load: \(error), \(error.userInfo)")
      } else {
        print("✅ Core Data loaded: \(storeDescription)")
      }
    }

    // Merge policy - remote wins for conflicts
    container.viewContext.automaticallyMergesChangesFromParent = true
    container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy

    // Listen for remote changes
    setupRemoteChangeNotification()
  }

  // MARK: - Remote Change Handling

  private func setupRemoteChangeNotification() {
    NotificationCenter.default.addObserver(
      self,
      selector: #selector(handleRemoteChange),
      name: .NSPersistentStoreRemoteChange,
      object: container.persistentStoreCoordinator
    )
  }

  @objc private func handleRemoteChange(_: Notification) {
    print("🌐 iCloud sync: Remote change received")
    // Post notification for UI to refresh
    DispatchQueue.main.async {
      NotificationCenter.default.post(name: .dataDidSyncFromCloud, object: nil)
    }
  }

  // MARK: - Context

  var viewContext: NSManagedObjectContext {
    container.viewContext
  }

  func newBackgroundContext() -> NSManagedObjectContext {
    container.newBackgroundContext()
  }

  // MARK: - Save

  func save() {
    let context = container.viewContext

    guard context.hasChanges else { return }

    do {
      try context.save()
      print("✅ Core Data saved successfully")
    } catch {
      print("❌ Core Data save error: \(error)")
    }
  }

  // MARK: - Fetch

  func fetch<T: NSManagedObject>(
    _ type: T.Type, predicate: NSPredicate? = nil, sortDescriptors: [NSSortDescriptor]? = nil
  ) -> [T] {
    let request = NSFetchRequest<T>(entityName: String(describing: type))
    request.predicate = predicate
    request.sortDescriptors = sortDescriptors

    do {
      return try viewContext.fetch(request)
    } catch {
      print("❌ Fetch error: \(error)")
      return []
    }
  }

  // MARK: - Delete

  func delete(_ object: NSManagedObject) {
    viewContext.delete(object)
    save()
  }

  func deleteAll<T: NSManagedObject>(_ type: T.Type) {
    let request = NSFetchRequest<NSFetchRequestResult>(entityName: String(describing: type))
    let deleteRequest = NSBatchDeleteRequest(fetchRequest: request)

    do {
      try viewContext.execute(deleteRequest)
      save()
    } catch {
      print("❌ Batch delete error: \(error)")
    }
  }
}

// MARK: - Notifications

extension Notification.Name {
  static let dataDidSyncFromCloud = Notification.Name("dataDidSyncFromCloud")
}

// MARK: - iCloud Status Check

extension PersistenceController {
  var isCloudEnabled: Bool {
    FileManager.default.ubiquityIdentityToken != nil
  }

  func checkCloudStatus() -> CloudStatus {
    guard FileManager.default.ubiquityIdentityToken != nil else {
      return .notSignedIn
    }

    // Check if iCloud is available
    if FileManager.default.url(forUbiquityContainerIdentifier: nil) != nil {
      return .available
    }

    return .restricted
  }

  enum CloudStatus {
    case available
    case notSignedIn
    case restricted

    var message: String {
      switch self {
      case .available:
        return "✅ iCloud sync enabled. Your progress syncs across all your devices."
      case .notSignedIn:
        return "⚠️ Sign into iCloud in Settings to sync your progress across devices."
      case .restricted:
        return "⚠️ iCloud is restricted. Data will only be stored locally."
      }
    }
  }
}
