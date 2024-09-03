//
//  MagicalCheckBoxViewModel+AnimationTwistApplyToAll.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/15/24.
//

import Foundation


@Observable class MagicalCheckBoxViewModelAnimationTwistApplyToAll: MagicalCheckBoxViewModel {
    
    override func refresh() {
        
        //
        // See if we should be checked...
        //
        
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            if jiggleViewModel.isAnimationTwistAppliedToAll {
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
        
        finishRefreshEnableCheckForAllCreateModes()
    }
    
    override func handleClicked() {
        print("MagicalCheckBoxViewModelAnimationTwistApplyToAll => handleClicked()")
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            if jiggleViewModel.isAnimationTwistAppliedToAll {
                jiggleViewModel.setAnimationTwistAppliedToAll(false)
            } else {
                jiggleViewModel.setAnimationTwistAppliedToAll(true)
            }
        }
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("MagicalCheckBoxViewModelAnimationTwistApplyToAll - Dealloc")
        }
    }
}
