//
//  MagicalCheckBoxViewModel+AnimationBounceApplyToAll.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/15/24.
//

import Foundation

@Observable class MagicalCheckBoxViewModelAnimationBounceApplyToAll: MagicalCheckBoxViewModel {
    
    override func refresh() {
        
        //
        // See if we should be checked...
        //
        
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            if jiggleViewModel.isAnimationBounceAppliedToAll {
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
        print("MagicalCheckBoxViewModelAnimationBounceApplyToAll => handleClicked()")
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            if jiggleViewModel.isAnimationBounceAppliedToAll {
                jiggleViewModel.setAnimationBounceAppliedToAll(false)
            } else {
                jiggleViewModel.setAnimationBounceAppliedToAll(true)
            }
        }
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("MagicalCheckBoxViewModelAnimationBounceApplyToAll - Dealloc")
        }
    }
}
