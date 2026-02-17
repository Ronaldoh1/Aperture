// LandingPresenterBox.swift

import Combine
import Foundation

final class LandingPresenterBox: ObservableObject {
  let presenter: any LandingPresenterType

  @Published var isLoading: Bool = false
  @Published var loadingMessage: String = ""
  @Published var error: PresenterError?

  private var cancellables = Set<AnyCancellable>()

  init(presenter: any LandingPresenterType) {
    self.presenter = presenter

    guard let concrete = presenter as? LandingPresenter else {
      return
    }

    concrete.$isLoading
      .receive(on: DispatchQueue.main)
      .assign(to: &$isLoading)

    concrete.$loadingMessage
      .receive(on: DispatchQueue.main)
      .assign(to: &$loadingMessage)

    concrete.$error
      .receive(on: DispatchQueue.main)
      .assign(to: &$error)
  }
}
