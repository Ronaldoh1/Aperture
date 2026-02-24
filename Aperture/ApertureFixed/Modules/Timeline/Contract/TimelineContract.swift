// TimelineContract.swift

import Foundation

protocol TimelineViewType: AnyObject {
    func displayLoading(_ message: String)
    func hideLoading()
    func displayError(_ message: String)
}

protocol TimelineInteractorType {
    func loadTimeline()
}

protocol TimelineInteractorOutputType: AnyObject {
    func didLoadTimeline()
    func didFail(error: Error)
}

protocol TimelinePresenterType: AnyObject {
    var view: TimelineViewType? { get set }
    var interactor: TimelineInteractorType? { get set }
    var router: TimelineRouterType? { get set }
    
    func viewDidLoad()
    func didSelectEra(_ era: TimelineEra)
}

protocol TimelineRouterType {
    func navigate(to route: TimelineRoute)
}
