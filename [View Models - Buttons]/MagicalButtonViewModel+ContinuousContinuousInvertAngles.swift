//
//  MagicalButtonViewModel+ContinuousContinuousInvertAngles.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 11/7/24.
//

import Foundation

@Observable class MagicalButtonViewModelContinuousInvertAngles: MagicalButtonViewModel {
    
    override func handleClicked() {
        if let toolInterfaceViewModel = ApplicationController.shared.toolInterfaceViewModel {
            toolInterfaceViewModel.toolActionContinuousInvertAngles()
        }
    }
    
    override func refresh() {
        refreshEnabled()
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[Deinit] MagicalButtonViewModelContinuousInvertAngles (Dealloc)")
        }
    }
}
