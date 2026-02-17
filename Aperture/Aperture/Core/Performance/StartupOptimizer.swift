// StartupOptimizer.swift
// Aperture
//
// Startup Optimization System
// Target: Cold start <500ms, First paint <200ms, Warm start <100ms

import Foundation
import SwiftUI
import os.log

// MARK: - Startup Phases

enum StartupPhase: String, CaseIterable {
  case preMain = "Pre-Main"  // Before main() runs
  case appInit = "App Init"  // ApertureApp init
  case sceneSetup = "Scene Setup"  // WindowGroup creation
  case viewLoad = "View Load"  // First view appears
  case dataLoad = "Data Load"  // Initial data fetch
  case ready = "Ready"  // Fully interactive

  var order: Int {
    switch self {
    case .preMain: return 0
    case .appInit: return 1
    case .sceneSetup: return 2
    case .viewLoad: return 3
    case .dataLoad: return 4
    case .ready: return 5
    }
  }
}

// MARK: - Startup Metrics

@MainActor
final class StartupOptimizer: ObservableObject {
  static let shared = StartupOptimizer()

  // MARK: - Metrics Storage

  private var phaseTimings: [StartupPhase: CFAbsoluteTime] = [:]
  private var startTime: CFAbsoluteTime = 0

  @Published var currentPhase: StartupPhase = .preMain
  @Published var isStartupComplete = false
  @Published var totalStartupTime: TimeInterval = 0

  private let logger = Logger(subsystem: "com.sunflow.aperture", category: "Startup")

  // MARK: - Phase Tracking

  func markPhaseStart(_ phase: StartupPhase) {
    if startTime == 0 {
      startTime = CFAbsoluteTimeGetCurrent()
    }

    phaseTimings[phase] = CFAbsoluteTimeGetCurrent()
    currentPhase = phase

    logger.info("📱 Startup: \(phase.rawValue) started")
  }

  func markPhaseComplete(_ phase: StartupPhase) {
    guard let phaseStart = phaseTimings[phase] else { return }

    let duration = CFAbsoluteTimeGetCurrent() - phaseStart
    let durationMs = Int(duration * 1000)

    logger.info("✅ Startup: \(phase.rawValue) completed in \(durationMs)ms")

    if phase == .ready {
      completeStartup()
    }
  }

  private func completeStartup() {
    totalStartupTime = CFAbsoluteTimeGetCurrent() - startTime
    isStartupComplete = true

    let totalMs = Int(totalStartupTime * 1000)
    logger.info("🚀 Startup complete in \(totalMs)ms")

    // Log to analytics (when implemented)
    logStartupMetrics()
  }

  // MARK: - Analytics

  private func logStartupMetrics() {
    #if DEBUG
      print("═══════════════════════════════════════")
      print("STARTUP PERFORMANCE REPORT")
      print("═══════════════════════════════════════")
      print("Total Time: \(Int(totalStartupTime * 1000))ms")
      print("")

      var lastTime = startTime
      for phase in StartupPhase.allCases {
        if let phaseTime = phaseTimings[phase] {
          let delta = Int((phaseTime - lastTime) * 1000)
          print("\(phase.rawValue): +\(delta)ms")
          lastTime = phaseTime
        }
      }
      print("═══════════════════════════════════════")
    #endif
  }

  // MARK: - Optimization Helpers

  /// Defer heavy work until after startup
  func deferUntilReady(_ work: @escaping () async -> Void) {
    Task { @MainActor in
      // Wait for startup to complete
      while !isStartupComplete {
        try? await Task.sleep(nanoseconds: 50_000_000)  // 50ms
      }

      // Add small delay to ensure UI is responsive
      try? await Task.sleep(nanoseconds: 100_000_000)  // 100ms

      await work()
    }
  }

  /// Schedule low-priority work for idle time
  func scheduleIdleWork(_ work: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
      work()
    }
  }
}

// MARK: - Lazy Loading Manager

@MainActor
final class LazyLoadManager: ObservableObject {
  static let shared = LazyLoadManager()

  /// Track what's been loaded
  private var loadedModules: Set<String> = []

  /// Check if a module has been loaded
  func isLoaded(_ module: String) -> Bool {
    loadedModules.contains(module)
  }

  /// Mark a module as loaded
  func markLoaded(_ module: String) {
    loadedModules.insert(module)
  }

  /// Preload critical modules
  func preloadCritical() async {
    // Only preload what's needed for first screen
    // Everything else loads on-demand
  }
}

// MARK: - Cache Warming

@MainActor
final class CacheWarmer {
  static let shared = CacheWarmer()

  private let defaults = UserDefaults.standard

  /// Warm caches for faster subsequent loads
  func warmCaches() {
    StartupOptimizer.shared.deferUntilReady {
      await self.warmUserPreferences()
      await self.warmRecentCourses()
      await self.warmDragonState()
    }
  }

  private func warmUserPreferences() async {
    // Load user preferences into memory
    _ = defaults.bool(forKey: "onboarding_complete")
    _ = defaults.string(forKey: "user_archetype")
    _ = defaults.integer(forKey: "dragon_level")
  }

  private func warmRecentCourses() async {
    // Pre-fetch recent course progress
    _ = defaults.array(forKey: "recent_courses")
  }

  private func warmDragonState() async {
    // Load dragon companion state
    _ = defaults.data(forKey: "dragon_companion")
  }
}

// MARK: - Startup View Modifier

struct StartupPhaseModifier: ViewModifier {
  let phase: StartupPhase

  func body(content: Content) -> some View {
    content
      .onAppear {
        Task { @MainActor in
          StartupOptimizer.shared.markPhaseStart(phase)
        }
      }
      .task {
        StartupOptimizer.shared.markPhaseComplete(phase)
      }
  }
}

extension View {
  func trackStartupPhase(_ phase: StartupPhase) -> some View {
    modifier(StartupPhaseModifier(phase: phase))
  }
}

// MARK: - Optimized App Launch

/// Use this in your App struct
enum OptimizedAppLaunch {
  static func configure() {
    // Mark app init phase
    Task { @MainActor in
      StartupOptimizer.shared.markPhaseStart(.appInit)
    }

    // Disable unnecessary logging in release
    #if !DEBUG
      UserDefaults.standard.set(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
    #endif

    // Pre-warm URLSession
    URLSession.shared.configuration.urlCache?.removeAllCachedResponses()

    // Configure for fast launch
    configureForFastLaunch()
  }

  private static func configureForFastLaunch() {
    // Reduce animation duration during startup
    // UIView.setAnimationsEnabled(false) // Uncomment if needed

    // Defer heavy initialization
    Task { @MainActor in
      StartupOptimizer.shared.deferUntilReady {
        // Heavy work here
        await performDeferredSetup()
      }
    }
  }

  private static func performDeferredSetup() async {
    // Analytics setup
    // Remote config fetch
    // Background data sync
    // Cache warming
    await CacheWarmer.shared.warmCaches()
  }
}

// MARK: - Splash Screen Optimization

struct OptimizedSplashScreen: View {
  @StateObject private var startup = StartupOptimizer.shared
  @State private var showContent = false

  var body: some View {
    ZStack {
      // Background
      Color(hex: "#0a0a1a")
        .ignoresSafeArea()

      if showContent {
        // Main content appears
        ContentPlaceholder()
          .transition(.opacity)
      } else {
        // Minimal splash - just logo
        SplashLogo()
      }
    }
    .onAppear {
      // Minimal delay for splash
      DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
        withAnimation(.easeOut(duration: 0.2)) {
          showContent = true
        }

        Task { @MainActor in
          StartupOptimizer.shared.markPhaseComplete(.viewLoad)
          StartupOptimizer.shared.markPhaseStart(.dataLoad)
        }
      }
    }
  }
}

private struct SplashLogo: View {
  var body: some View {
    VStack(spacing: 16) {
      Image(systemName: "eye.circle.fill")
        .font(.system(size: 80))
        .foregroundStyle(
          LinearGradient(
            colors: [Color(hex: "#7C4DFF"), Color(hex: "#E040FB")],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
          )
        )

      Text("APERTURE")
        .font(.system(size: 28, weight: .bold, design: .rounded))
        .foregroundColor(.white)
        .tracking(4)
    }
  }
}

private struct ContentPlaceholder: View {
  var body: some View {
    // Replace with actual root view
    Text("Content Loaded")
      .foregroundColor(.white)
  }
}

// MARK: - Memory Optimization

final class MemoryOptimizer {
  static let shared = MemoryOptimizer()

  /// Clear caches when memory warning received
  func handleMemoryWarning() {
    // Clear image caches
    URLCache.shared.removeAllCachedResponses()

    // Clear any custom caches
    // ImageCache.shared.clear()

    // Trigger garbage collection hint
    // Note: Swift doesn't have explicit GC, but we can nil out large objects
  }

  /// Setup memory warning observer
  func setupMemoryWarningObserver() {
    NotificationCenter.default.addObserver(
      forName: UIApplication.didReceiveMemoryWarningNotification,
      object: nil,
      queue: .main
    ) { [weak self] _ in
      self?.handleMemoryWarning()
    }
  }
}

// MARK: - Performance Monitoring

#if DEBUG
  struct PerformanceOverlay: View {
    @StateObject private var startup = StartupOptimizer.shared
    @State private var fps: Int = 60
    @State private var memory: String = "0 MB"

    var body: some View {
      VStack(alignment: .leading, spacing: 4) {
        Text("Startup: \(Int(startup.totalStartupTime * 1000))ms")
        Text("Phase: \(startup.currentPhase.rawValue)")
        Text("FPS: \(fps)")
        Text("Memory: \(memory)")
      }
      .font(.system(size: 10, design: .monospaced))
      .foregroundColor(.green)
      .padding(8)
      .background(Color.black.opacity(0.7))
      .cornerRadius(8)
      .onAppear {
        startMonitoring()
      }
    }

    private func startMonitoring() {
      Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
        // Update memory
        var info = mach_task_basic_info()
        var count = mach_msg_type_number_t(MemoryLayout<mach_task_basic_info>.size) / 4
        let result = withUnsafeMutablePointer(to: &info) {
          $0.withMemoryRebound(to: integer_t.self, capacity: 1) {
            task_info(mach_task_self_, task_flavor_t(MACH_TASK_BASIC_INFO), $0, &count)
          }
        }

        if result == KERN_SUCCESS {
          let usedMB = Double(info.resident_size) / 1024 / 1024
          memory = String(format: "%.1f MB", usedMB)
        }
      }
    }
  }
#endif
