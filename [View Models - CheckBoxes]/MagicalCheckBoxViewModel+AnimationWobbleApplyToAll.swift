//
//  MagicalCheckBoxViewModel+AnimationWobbleApplyToAll.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/15/24.
//

import Foundation

@Observable class MagicalCheckBoxViewModelAnimationWobbleApplyToAll: MagicalCheckBoxViewModel {
    
    override func refresh() {
        
        //
        // See if we should be checked...
        //
        
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            if jiggleViewModel.isAnimationWobbleAppliedToAll {
                if isChecked == false {
                    isChecked = true
                }
            } else {
                if isChecked == true {
                    isChecked = false
                }
            }
        }
        
        //
        // See if we should be enabled...
        //
        
        if isEnabled == false {
            isEnabled = true
        }
    }
    
    override func handleClicked() {
        print("MagicalCheckBoxViewModelAnimationWobbleApplyToAll => handleClicked()")
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            if jiggleViewModel.isAnimationWobbleAppliedToAll {
                jiggleViewModel.setAnimationWobbleAppliedToAll(false)
            } else {
                jiggleViewModel.setAnimationWobbleAppliedToAll(true)
            }
        }
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("MagicalCheckBoxViewModelAnimationWobbleApplyToAll - Dealloc")
        }
    }
}
