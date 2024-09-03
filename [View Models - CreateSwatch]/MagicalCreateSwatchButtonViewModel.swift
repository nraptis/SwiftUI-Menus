//
//  MagicalCreateSwatchButtonViewModel.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/2/24.
//

import Foundation

@Observable class MagicalCreateSwatchButtonViewModel {
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("MagicalCreateSwatchButtonViewModel - Dealloc")
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
    let createSwatchButtonConfiguration: ToolInterfaceElementCreateSwatchButtonConfiguration
    init(orientation: Orientation, createSwatchButtonConfiguration: ToolInterfaceElementCreateSwatchButtonConfiguration) {
        self.orientation = orientation
        self.createSwatchButtonConfiguration = createSwatchButtonConfiguration
        isDarkModeEnabled = ApplicationController.isDarkModeEnabled
    }
}

class MagicalCreateSwatchButtonLayoutNode {
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("MagicalCreateSwatchButtonLayoutNode - Dealloc")
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
    
    let CreateSwatchButtonConfiguration: ToolInterfaceElementCreateSwatchButtonConfiguration
    init(CreateSwatchButtonConfiguration: ToolInterfaceElementCreateSwatchButtonConfiguration) {
        self.CreateSwatchButtonConfiguration = CreateSwatchButtonConfiguration
    }
    
    var nameLabelWidth = 0
    var iconWidth = 0
    
    func prepareForLayout(layoutSchemeFlavor: LayoutSchemeFlavor, textIcon: TextIconable) {
        iconWidth = textIcon.width
        switch layoutSchemeFlavor {
        case .long:
            nameLabelWidth = CreateSwatchButtonConfiguration.nameLabelWidthLarge
        case .stackedLarge:
            nameLabelWidth = CreateSwatchButtonConfiguration.nameLabelWidthLarge
        case .stackedMedium:
            nameLabelWidth = CreateSwatchButtonConfiguration.nameLabelWidthMedium
        case .stackedSmall:
            nameLabelWidth = CreateSwatchButtonConfiguration.nameLabelWidthSmall
        }
    }
    
    func getWidth(layoutSchemeFlavor: LayoutSchemeFlavor) -> Int {
        let width1 = nameLabelWidth + nameLabelPaddingLeft + nameLabelPaddingRight
        let width2 = iconWidth + iconPaddingLeft + iconPaddingRight
        return width1 + width2
    }
}
