// LandingInteractor.swift

import Combine
import Foundation

final class LandingInteractor: LandingInteractorType {
  weak var output: LandingInteractorOutputType?

  private var cancellables = Set<AnyCancellable>()

  init() {
    // Add service dependencies here when needed
  }

  func loadContent() {
    print("🟢 LandingInteractor: Loading content")
    // TODO: Implement content loading logic
    output?.didLoadContent()
  }
}
