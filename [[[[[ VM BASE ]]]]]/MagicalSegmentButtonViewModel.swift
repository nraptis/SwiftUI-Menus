//
//  MagicalSegmentButtonViewModel.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/5/24.
//

import SwiftUI

@Observable class MagicalSegmentButtonViewModel {

    let orientation: Orientation
    @MainActor init(orientation: Orientation, isDarkModeEnabled: Bool) {
        self.orientation = orientation
        self.isDarkModeEnabled = isDarkModeEnabled
    }
    
    @MainActor var accentPaddingLeft = 0
    @MainActor var accentPaddingRight = 0
    
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
    
    @MainActor func refreshDisabled() {
        if isEnabled == true {
            isEnabled = false
        }
    }
    
    @MainActor func refreshEnabled() {
        if isEnabled == false {
            isEnabled = true
        }
    }
    
}
