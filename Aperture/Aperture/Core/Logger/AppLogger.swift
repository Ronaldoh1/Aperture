import Foundation
import OSLog

#if DEBUG
  import SwiftyBeaver
#endif

// MARK: - Log Levels

public enum AppLogLevel: String {
  case debug
  case info
  case notice
  case warning
  case error
  case fault
}

// MARK: - Logging Protocol (so DI and tests stay clean)

public protocol AppLogging {
  func log(
    _ level: AppLogLevel,
    _ message: String,
    category: String,
    file: String,
    function: String,
    line: Int,
    metadata: [String: String]?
  )

  func debug(
    _ message: String, category: String, metadata: [String: String]?, file: String,
    function: String, line: Int)
  func info(
    _ message: String, category: String, metadata: [String: String]?, file: String,
    function: String, line: Int)
  func notice(
    _ message: String, category: String, metadata: [String: String]?, file: String,
    function: String, line: Int)
  func warning(
    _ message: String, category: String, metadata: [String: String]?, file: String,
    function: String, line: Int)
  func error(
    _ message: String, category: String, metadata: [String: String]?, file: String,
    function: String, line: Int)
  func fault(
    _ message: String, category: String, metadata: [String: String]?, file: String,
    function: String, line: Int)
}

// MARK: - App Logger (OSLog always, SwiftyBeaver in Debug)

public final class AppLogger: AppLogging {
  public static let shared = AppLogger(subsystem: Bundle.main.bundleIdentifier ?? "Aperture")

  private let subsystem: String
  private var oslogCache: [String: Logger] = [:]
  private let lock = NSLock()

  public init(subsystem: String) {
    self.subsystem = subsystem

    #if DEBUG
      // Configure SwiftyBeaver once
      let console = ConsoleDestination()
      console.minLevel = .debug
      console.asynchronously = true
      SwiftyBeaver.addDestination(console)
    #endif
  }

  // MARK: - API

  public func log(
    _ level: AppLogLevel,
    _ message: String,
    category: String,
    file: String = #fileID,
    function: String = #function,
    line: Int = #line,
    metadata: [String: String]? = nil
  ) {
    let logger = osLogger(category: category)
    let prefix = "\(shortFile(file)):\(line) \(function)"
    let meta = formatMetadata(metadata)

    // OSLog supports privacy controls, keep metadata non sensitive.
    let full = meta.isEmpty ? "\(prefix) | \(message)" : "\(prefix) | \(message) | \(meta)"

    switch level {
    case .debug:
      logger.debug("\(full, privacy: .public)")
    case .info:
      logger.info("\(full, privacy: .public)")
    case .notice:
      logger.notice("\(full, privacy: .public)")
    case .warning:
      logger.warning("\(full, privacy: .public)")
    case .error:
      logger.error("\(full, privacy: .public)")
    case .fault:
      logger.fault("\(full, privacy: .public)")
    }

    #if DEBUG
      // SwiftyBeaver for dev ergonomics
      switch level {
      case .debug:
        SwiftyBeaver.debug(full)
      case .info:
        SwiftyBeaver.info(full)
      case .notice:
        SwiftyBeaver.info("NOTICE | \(full)")
      case .warning:
        SwiftyBeaver.warning(full)
      case .error:
        SwiftyBeaver.error(full)
      case .fault:
        SwiftyBeaver.error("FAULT | \(full)")
      }
    #endif
  }

  // MARK: - Convenience

  public func debug(
    _ message: String, category: String = "General", metadata: [String: String]? = nil,
    file: String = #fileID, function: String = #function, line: Int = #line
  ) {
    log(
      .debug, message, category: category, file: file, function: function, line: line,
      metadata: metadata)
  }

  public func info(
    _ message: String, category: String = "General", metadata: [String: String]? = nil,
    file: String = #fileID, function: String = #function, line: Int = #line
  ) {
    log(
      .info, message, category: category, file: file, function: function, line: line,
      metadata: metadata)
  }

  public func notice(
    _ message: String, category: String = "General", metadata: [String: String]? = nil,
    file: String = #fileID, function: String = #function, line: Int = #line
  ) {
    log(
      .notice, message, category: category, file: file, function: function, line: line,
      metadata: metadata)
  }

  public func warning(
    _ message: String, category: String = "General", metadata: [String: String]? = nil,
    file: String = #fileID, function: String = #function, line: Int = #line
  ) {
    log(
      .warning, message, category: category, file: file, function: function, line: line,
      metadata: metadata)
  }

  public func error(
    _ message: String, category: String = "General", metadata: [String: String]? = nil,
    file: String = #fileID, function: String = #function, line: Int = #line
  ) {
    log(
      .error, message, category: category, file: file, function: function, line: line,
      metadata: metadata)
  }

  public func fault(
    _ message: String, category: String = "General", metadata: [String: String]? = nil,
    file: String = #fileID, function: String = #function, line: Int = #line
  ) {
    log(
      .fault, message, category: category, file: file, function: function, line: line,
      metadata: metadata)
  }

  // MARK: - Internals

  private func osLogger(category: String) -> Logger {
    lock.lock()
    defer { lock.unlock() }

    if let cached = oslogCache[category] { return cached }
    let logger = Logger(subsystem: subsystem, category: category)
    oslogCache[category] = logger
    return logger
  }

  private func shortFile(_ file: String) -> String {
    // #fileID is usually "Module/File.swift", keep it readable
    return file
  }

  private func formatMetadata(_ metadata: [String: String]?) -> String {
    guard let metadata, !metadata.isEmpty else { return "" }
    return
      metadata
      .sorted { $0.key < $1.key }
      .map { "\($0.key)=\($0.value)" }
      .joined(separator: " ")
  }
}
