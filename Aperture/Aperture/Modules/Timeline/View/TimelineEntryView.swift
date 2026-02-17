// TimelineEntryView.swift

import SwiftUI
import Swinject

struct TimelineEntryView: View {
  private let presenter: TimelinePresenterType

  init(container: Container, onRoute: @escaping (TimelineRoute) -> Void) {
    print("🟡 TimelineEntryView: Starting initialization")

    let router = TimelineRouter(onRoute: onRoute)
    container.register(TimelineRouterType.self) { _ in router }
    print("🟡 TimelineEntryView: Router registered")

    presenter = container.resolve(TimelinePresenterType.self)!
    print("🟡 TimelineEntryView: Presenter resolved")

    _ = container.resolve(TimelineInteractorType.self)!
    print(
      "🟡 TimelineEntryView: Interactor wired, interactor is \(presenter.interactor != nil ? "set ✓" : "NIL ❌")"
    )
  }

  var body: some View {
    TimelineView(presenter: presenter)
  }
}
