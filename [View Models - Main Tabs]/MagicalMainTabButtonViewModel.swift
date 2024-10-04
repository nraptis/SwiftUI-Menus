//
//  MagicalMainTabButtonViewModel.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/24/24.
//

import Foundation

@Observable class MagicalMainTabButtonViewModel {
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("MagicalMainTabButtonViewModel - Dealloc")
        }
    }
    
    @MainActor var nameLabelPaddingLeft = 0
    @MainActor var nameLabelPaddingRight = 0
    
    @MainActor var iconPaddingLeft = 0
    @MainActor var iconPaddingRight = 0
    
    @MainActor var universalPaddingLeft = 0
    @MainActor var universalPaddingRight = 0
    
    @MainActor var x = 0
    @MainActor var y = 0
    @MainActor var width = 128
    
    @MainActor private(set) var isDarkModeEnabled = false
    @MainActor func setDarkModeEnabled(isDarkModeEnabled: Bool) {
        if isDarkModeEnabled != self.isDarkModeEnabled {
            self.isDarkModeEnabled = isDarkModeEnabled
        }
    }
    
    let orientation: Orientation
    let mainTabButtonConfiguration: ToolInterfaceElementMainTabButtonConfiguration
    @MainActor init(orientation: Orientation, mainTabButtonConfiguration: ToolInterfaceElementMainTabButtonConfiguration) {
        self.orientation = orientation
        self.mainTabButtonConfiguration = mainTabButtonConfiguration
        isDarkModeEnabled = ApplicationController.isDarkModeEnabled
    }
}

class MagicalMainTabButtonLayoutNode {
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("MagicalMainTabButtonLayoutNode - Dealloc")
        }
    }
    
    @MainActor var nameLabelPaddingLeft = 0
    @MainActor var nameLabelPaddingRight = 0
    
    @MainActor var iconPaddingLeft = 0
    @MainActor var iconPaddingRight = 0
    
    @MainActor var universalPaddingLeft = 0
    @MainActor var universalPaddingRight = 0
    
    @MainActor var x = 0
    @MainActor var y = 0
    @MainActor var width = 128
    
    let mainTabButtonConfiguration: ToolInterfaceElementMainTabButtonConfiguration
    @MainActor init(mainTabButtonConfiguration: ToolInterfaceElementMainTabButtonConfiguration) {
        self.mainTabButtonConfiguration = mainTabButtonConfiguration
    }
    
    @MainActor var nameLabelWidth = 0
    @MainActor var iconWidth = 0
    
    @MainActor func prepareForLayout(layoutSchemeFlavor: LayoutSchemeFlavor, textIcon: TextIconable) {
        iconWidth = textIcon.width
        switch layoutSchemeFlavor {
        case .long:
            nameLabelWidth = mainTabButtonConfiguration.nameLabelWidthLarge
        case .stackedLarge:
            nameLabelWidth = mainTabButtonConfiguration.nameLabelWidthLarge
        case .stackedMedium:
            nameLabelWidth = mainTabButtonConfiguration.nameLabelWidthMedium
        case .stackedSmall:
            nameLabelWidth = mainTabButtonConfiguration.nameLabelWidthSmall
        }
    }
    
    @MainActor func getWidth(layoutSchemeFlavor: LayoutSchemeFlavor) -> Int {
        let width1 = nameLabelWidth + nameLabelPaddingLeft + nameLabelPaddingRight
        let width2 = iconWidth + iconPaddingLeft + iconPaddingRight
        return width1 + width2
    }
}
