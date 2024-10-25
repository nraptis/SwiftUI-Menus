//
//  MagicalEnterModeViewModel+AnimationContinuousPage2.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/24/24.
//

import Foundation

@Observable class MagicalModeChangeViewModelAnimationContinuousPage2Enter: MagicalModeChangeViewModel {
    
    override func handleClicked() {
        if let toolInterfaceViewModel = ApplicationController.shared.toolInterfaceViewModel {
            toolInterfaceViewModel.toolActionAnimationContinuousPage2Enter()
        }
    }
    
    override func refresh() {
        refreshEnabled()
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[Deinit] MagicalModeChangeViewModelAnimationContinuousPage2Enter (Dealloc)")
        }
    }
}
