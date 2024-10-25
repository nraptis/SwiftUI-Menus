//
//  JiggleViewController+ToolActionPhaseSliceSetDarkModeEnabled.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 7/5/24.
//

import Foundation

extension JiggleViewController {
    func toolActionConsumePhaseSliceSetDarkModeEnabled(_ slice: ToolActionPhaseSliceSetDarkModeEnabled) {
        ApplicationController.isDarkModeEnabled = slice.isDarkModeEnabled
        
        // Move to brickmode
        toolInterfaceViewModel.handleDarkModeDidChange()
        handleDarkModeDidChange()
        
        ApplicationController.shared.configSave()
        jiggleViewModel.killDragAll()
        
    }
}
