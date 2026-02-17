// TimelinePresenterBox.swift

import Combine
import Foundation

final class TimelinePresenterBox: ObservableObject {
  let presenter: any TimelinePresenterType

  @Published var isLoading: Bool = false
  @Published var loadingMessage: String = ""
  @Published var error: PresenterError?
  @Published var eras: [TimelineEra] = []
  @Published var selectedInterval: TimelineJumpInterval = .century

  private var cancellables = Set<AnyCancellable>()

  init(presenter: any TimelinePresenterType) {
    self.presenter = presenter

    guard let concrete = presenter as? TimelinePresenter else {
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

    concrete.$eras
      .receive(on: DispatchQueue.main)
      .assign(to: &$eras)

    concrete.$selectedInterval
      .receive(on: DispatchQueue.main)
      .assign(to: &$selectedInterval)
  }
}
