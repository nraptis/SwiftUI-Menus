//
//  MagicalButtonViewModel+ContinuousContinuousInvertRotation.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 11/7/24.
//

import Foundation

@Observable class MagicalButtonViewModelContinuousInvertRotation: MagicalButtonViewModel {
    
    override func handleClicked() {
        if let toolInterfaceViewModel = ApplicationController.shared.toolInterfaceViewModel {
            toolInterfaceViewModel.toolActionContinuousInvertRotation()
        }
    }
    
    override func refresh() {
        refreshEnabled()
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[Deinit] MagicalButtonViewModelContinuousInvertRotation (Dealloc)")
        }
    }
}
