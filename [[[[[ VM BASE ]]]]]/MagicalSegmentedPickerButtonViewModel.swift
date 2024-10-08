//
//  MagicalSegmentedPickerButtonViewModel.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 4/1/24.
//

import SwiftUI

@Observable class MagicalSegmentedPickerButtonViewModel: MagicalSegmentButtonViewModel {
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("MagicalSegmentedPickerButtonViewModel - Dealloc")
        }
    }
    
    let segmentedPickerButtonConfiguration: ToolInterfaceElementSegmentedPickerButtonConfiguration
    @MainActor init(orientation: Orientation,
                    segmentedPickerButtonConfiguration: ToolInterfaceElementSegmentedPickerButtonConfiguration,
                    isDarkModeEnabled: Bool) {
        self.segmentedPickerButtonConfiguration = segmentedPickerButtonConfiguration
        super.init(orientation: orientation, isDarkModeEnabled: isDarkModeEnabled)
        
    }
}
