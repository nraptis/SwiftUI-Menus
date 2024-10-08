//
//  MagicalMainTabButtonViewModel.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/24/24.
//

import SwiftUI

@Observable class MagicalMainTabButtonViewModel: MagicalSegmentButtonViewModel {
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("MagicalMainTabButtonViewModel - Dealloc")
        }
    }
    
    let mainTabButtonConfiguration: ToolInterfaceElementMainTabButtonConfiguration
    @MainActor init(orientation: Orientation,
                    mainTabButtonConfiguration: ToolInterfaceElementMainTabButtonConfiguration,
                    isDarkModeEnabled: Bool) {
        self.mainTabButtonConfiguration = mainTabButtonConfiguration
        super.init(orientation: orientation, isDarkModeEnabled: isDarkModeEnabled)
        
    }
}
