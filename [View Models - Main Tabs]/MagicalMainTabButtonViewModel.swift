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
    
    var nameLabelPaddingLeft = 0
    var nameLabelPaddingRight = 0
    
    var iconPaddingLeft = 0
    var iconPaddingRight = 0
    
    var universalPaddingLeft = 0
    var universalPaddingRight = 0
    
    var x = 0
    var y = 0
    var width = 128
    
    private(set) var isDarkModeEnabled = false
    func setDarkModeEnabled(isDarkModeEnabled: Bool) {
        if isDarkModeEnabled != self.isDarkModeEnabled {
            self.isDarkModeEnabled = isDarkModeEnabled
        }
    }
    
    let orientation: Orientation
    let mainTabButtonConfiguration: ToolInterfaceElementMainTabButtonConfiguration
    init(orientation: Orientation, mainTabButtonConfiguration: ToolInterfaceElementMainTabButtonConfiguration) {
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
    
    var nameLabelPaddingLeft = 0
    var nameLabelPaddingRight = 0
    
    var iconPaddingLeft = 0
    var iconPaddingRight = 0
    
    var universalPaddingLeft = 0
    var universalPaddingRight = 0
    
    var x = 0
    var y = 0
    var width = 128
    
    let mainTabButtonConfiguration: ToolInterfaceElementMainTabButtonConfiguration
    init(mainTabButtonConfiguration: ToolInterfaceElementMainTabButtonConfiguration) {
        self.mainTabButtonConfiguration = mainTabButtonConfiguration
    }
    
    var nameLabelWidth = 0
    var iconWidth = 0
    
    func prepareForLayout(layoutSchemeFlavor: LayoutSchemeFlavor, textIcon: TextIconable) {
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
    
    func getWidth(layoutSchemeFlavor: LayoutSchemeFlavor) -> Int {
        let width1 = nameLabelWidth + nameLabelPaddingLeft + nameLabelPaddingRight
        let width2 = iconWidth + iconPaddingLeft + iconPaddingRight
        return width1 + width2
    }
}
