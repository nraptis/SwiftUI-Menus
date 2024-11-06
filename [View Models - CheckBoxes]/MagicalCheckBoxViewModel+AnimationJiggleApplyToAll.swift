//
//  MagicalCheckBoxViewModel+AnimationGrabApplyToAll.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/7/24.
//

import Foundation

@Observable class MagicalCheckBoxViewModelAnimationGrabApplyToAll: MagicalCheckBoxViewModel {
    
    override func refresh() {
        
        //
        // See if we should be checked...
        //
        
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            
            if jiggleViewModel.isAnySliderActive {
                refreshDisabled()
            } else {
                refreshEnabled()
            }
            
            if jiggleViewModel.isAnimationGrabAppliedToAll {
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
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            if jiggleViewModel.isAnimationGrabAppliedToAll {
                jiggleViewModel.setAnimationGrabAppliedToAll(false)
            } else {
                jiggleViewModel.setAnimationGrabAppliedToAll(true)
            }
        }
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("MagicalCheckBoxViewModelAnimationGrabApplyToAll - Dealloc")
        }
    }
}


