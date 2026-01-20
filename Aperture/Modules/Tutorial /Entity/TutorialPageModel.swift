//
//  TutorialEntity.swift
//  Aperture
//
//  Created by Ronald Hernandez on 1/18/26.
//

import SwiftUI

import Foundation

struct TutorialPageModel: Identifiable, Equatable {

    let id = UUID()
    let title: String
    let subtitle: String
    let systemImage: String

}

struct TutorialViewModel: Equatable {

    let pages: [TutorialPageModel]
    let index: Int
    let isLast: Bool
    let primaryButtonTitle: String
    let secondaryButtonTitle: String

}
