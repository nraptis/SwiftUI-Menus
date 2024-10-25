//
//  MagicalExitModeViewModel+AnimationContinuousPage2.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/24/24.
//

import Foundation


@Observable class MagicalExitModeViewModelAnimationContinuousPage2Exit: MagicalModeChangeViewModel {
    
    override func handleClicked() {
        if let toolInterfaceViewModel = ApplicationController.shared.toolInterfaceViewModel {
            toolInterfaceViewModel.toolActionAnimationContinuousPage2Exit()
        }
    }
    
    override func refresh() {
        refreshEnabled()
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[Deinit] MagicalExitModeViewModelAnimationContinuousPage2Exit (Dealloc)")
        }
    }
}
