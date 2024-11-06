//
//  MagicalSexyCheckBoxViewModel+AnimationContinuousApplyToAll.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/30/24.
//

import Foundation

@Observable class MagicalCheckBoxViewModelAnimationContinuousApplyToAll: MagicalCheckBoxViewModel {
    
    override func refresh() {
        
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            
            if jiggleViewModel.getContinuousDraggingStatus() {
                refreshDisabled()
            } else if jiggleViewModel.isAnySliderActive {
                refreshDisabled()
            } else {
                refreshEnabled()
            }
            
            if jiggleViewModel.isAnimationContinuousAppliedToAll {
                if isChecked == false {
                    isChecked = true
                }
            } else {
                if isChecked == true {
                    isChecked = false
                }
            }
        }
    }
    
    override func handleClicked() {
        if let toolInterfaceViewModel = ApplicationController.shared.toolInterfaceViewModel,
           let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            
            if toolInterfaceViewModel.isBlocked {
                return
            }
            
            jiggleViewModel.setAnimationContinuousAppliedToAll(!isChecked)
        }
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("MagicalCheckBoxViewModelAnimationLoopApplyToAll - Dealloc")
        }
    }
}
