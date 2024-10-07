//
//  MagicalMainTabButtonViewModel.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/24/24.
//

import Foundation

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
        super.init(orientation: orientation,
                   //numberOfLines: mainTabButtonConfiguration.nameLabelNumberOfLines,
                   //iconPackMain: mainTabButtonConfiguration.iconPack,
                   //iconPackSecondary: nil,
                   isDarkModeEnabled: isDarkModeEnabled)
        
    }
}
