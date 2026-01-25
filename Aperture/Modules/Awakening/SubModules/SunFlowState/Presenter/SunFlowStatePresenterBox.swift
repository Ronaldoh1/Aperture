// SunFlowStatePresenterBox.swift

import SwiftUI
import Combine

final class SunFlowStatePresenterBox: ObservableObject {

    @Published var isPremium: Bool = false
    @Published var flowStates: [FlowState] = []
    @Published var triggers: [FlowTrigger] = []
    @Published var phases: [CircadianPhase] = []
    @Published var protocols: [FlowProtocol] = []
    @Published var blockers: [FlowBlocker] = []

    private let presenter: SunFlowStatePresenter

    init(presenter: SunFlowStatePresenter) {
        self.presenter = presenter
    }

    func viewDidLoad() {
        presenter.viewDidLoad()
    }

    func selectSection(_ section: FlowSection) {
        presenter.didSelectSection(section)
    }

    func selectFlowState(_ state: FlowState) {
        presenter.didSelectFlowState(state)
    }

    func selectTriggerCategory(_ category: TriggerCategory) {
        presenter.didSelectTriggerCategory(category)
    }

    func selectProtocol(_ proto: FlowProtocol) {
        presenter.didSelectProtocol(proto)
    }

    func tapUpgrade() {
        presenter.didTapUpgrade()
    }

}
