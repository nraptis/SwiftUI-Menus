//
//  MagicalCheckBoxViewModel+AnimationJiggleApplyToAll.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/15/24.
//

import Foundation

@Observable class MagicalCheckBoxViewModelAnimationJiggleApplyToAll: MagicalCheckBoxViewModel {
    
    override func refresh() {
        
        //
        // See if we should be checked...
        //
        
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            if jiggleViewModel.isAnimationJiggleAppliedToAll {
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
        print("MagicalCheckBoxViewModelAnimationJiggleApplyToAll => handleClicked()")
        
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            if jiggleViewModel.isAnimationJiggleAppliedToAll {
                jiggleViewModel.setAnimationJiggleAppliedToAll(false)
            } else {
                jiggleViewModel.setAnimationJiggleAppliedToAll(true)
            }
        }
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("MagicalCheckBoxViewModelAnimationJiggleApplyToAll - Dealloc")
        }
    }
}
