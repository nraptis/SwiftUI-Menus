//
//  MagicalSegmentButtonViewModel.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/5/24.
//

import Foundation
import Foundation
import Foundation
import Observation
import SwiftUI

@Observable class MagicalSegmentButtonViewModel {
    
    @ObservationIgnored let nameLabelWidth: Int
    @ObservationIgnored let numberOfLines: Int
    @ObservationIgnored let iconPackMain: (any TextIconPackable)
    @ObservationIgnored let iconPackSecondary: (any TextIconPackable)?
    
    @MainActor init(nameLabelWidth: Int,
                    numberOfLines: Int,
                    iconPackMain: any TextIconPackable,
                    iconPackSecondary: (any TextIconPackable)?,
                    isDarkModeEnabled: Bool) {
        self.nameLabelWidth = nameLabelWidth
        self.numberOfLines = numberOfLines
        self.iconPackMain = iconPackMain
        self.iconPackSecondary = iconPackSecondary
        self.isDarkModeEnabled = isDarkModeEnabled
    }
    
    @MainActor var x = 0
    @MainActor var y = 0
    @MainActor var width = 128
    
    @MainActor var slavePaddingLeft = 0
    @MainActor var slavePaddingRight = 0
    
    @MainActor var heroPaddingLeft = 0
    @MainActor var heroPaddingRight = 0
    
    @MainActor var heroSpacing = 0
    
    @MainActor var isEnabled = true
    
    @MainActor var layoutX = 0
    @MainActor var layoutY = 0
    @MainActor var layoutWidth = 320
    @MainActor var layoutHeight = 44
    
    @MainActor private(set) var isDarkModeEnabled = false
    @MainActor func setDarkModeEnabled(isDarkModeEnabled: Bool) {
        if isDarkModeEnabled != self.isDarkModeEnabled {
            self.isDarkModeEnabled = isDarkModeEnabled
        }
    }
    
    
    
}
