//
//  MagicalButtonViewModel+ContinuousSyncFrames.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/31/24.
//

import Foundation

@Observable class MagicalButtonViewModelContinuousSyncFrames: MagicalButtonViewModel {
    
    override func handleClicked() {
        if let toolInterfaceViewModel = ApplicationController.shared.toolInterfaceViewModel {
            toolInterfaceViewModel.toolActionContinuousSyncFrames()
        }
    }
    
    override func refresh() {
        refreshEnabled()
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[Deinit] MagicalButtonViewModelContinuousSyncFrames (Dealloc)")
        }
    }
}
