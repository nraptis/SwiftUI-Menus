//
//  MagicalCreateSwatchButtonViewModel.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/2/24.
//

import SwiftUI

@Observable class MagicalCreateSwatchButtonViewModel: MagicalSegmentButtonViewModel {
    
    let createSwatchButtonConfiguration: ToolInterfaceElementCreateSwatchButtonConfiguration
    @MainActor init(orientation: Orientation,
                    createSwatchButtonConfiguration: ToolInterfaceElementCreateSwatchButtonConfiguration,
                    isDarkModeEnabled: Bool) {
        self.createSwatchButtonConfiguration = createSwatchButtonConfiguration
        super.init(orientation: orientation,
                   isDarkModeEnabled: isDarkModeEnabled)
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("MagicalCreateSwatchButtonViewModel - Dealloc")
        }
    }
}
