//
//  MagicalButtonViewModel+ContinuousResetSwoop.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/31/24.
//

import Foundation

@Observable class MagicalButtonViewModelContinuousResetSwoop: MagicalButtonViewModel {
    
    override func handleClicked() {
        if let toolInterfaceViewModel = ApplicationController.shared.toolInterfaceViewModel {
            toolInterfaceViewModel.toolActionContinuousResetSwoop()
        }
    }
    
    override func refresh() {
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            
            if jiggleViewModel.getContinuousDraggingStatus() {
                refreshDisabled()
                return
            }
            
            if jiggleViewModel.isAnySliderActive {
                refreshDisabled()
                return
            }
            
            if jiggleViewModel.getSelectedJiggle() !== nil {
                refreshEnabled()
            } else if jiggleViewModel.isAnimationContinuousAppliedToAll {
                refreshEnabled()
            } else {
                refreshDisabled()
            }
        }
        
        super.refresh()
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[Deinit] MagicalButtonViewModelContinuousResetSwoop (Dealloc)")
        }
    }
}
