//
//  MagicalEnterModeViewModel+ContinuousPage2Enter.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 11/1/24.
//

import Foundation

@Observable class MagicalModeChangeViewModelContinuousPage2Enter: MagicalModeChangeViewModel {
    
    override func handleClicked() {
        if let toolInterfaceViewModel = ApplicationController.shared.toolInterfaceViewModel {
            toolInterfaceViewModel.toolActionContinuousPage2Enter()
        }
    }
    
    override func refresh() {
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            
            if jiggleViewModel.getContinuousDraggingStatus() {
                refreshDisabled()
            } else if jiggleViewModel.isAnySliderActive {
                refreshDisabled()
            } else {
                refreshEnabled()
            }
        }
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[Deinit] MagicalModeChangeViewModelContinuousPage2Enter (Dealloc)")
        }
    }
}
