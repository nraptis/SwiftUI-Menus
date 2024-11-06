//
//  MagicalSexyCheckBoxViewModel+ContinuousDisableGrab.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/31/24.
//

import Foundation

@Observable class MagicalCheckBoxViewModelContinuousDisableGrab: MagicalCheckBoxViewModel {
    
    override func refresh() {
        
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            let jiggleDocument = jiggleViewModel.jiggleDocument
            if jiggleDocument.isContinuousDisableGrabEnabled {
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
        
        refreshEnabled()
    }
    
    override func handleClicked() {
        print("MagicalCheckBoxViewModelContinuousDisableGrabEnabled => handleClicked()")
        
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            let jiggleDocument = jiggleViewModel.jiggleDocument
            if jiggleDocument.isContinuousDisableGrabEnabled {
                jiggleViewModel.setContinuousDisableGrab(isEnabled: false)
            } else {
                jiggleViewModel.setContinuousDisableGrab(isEnabled: true)
            }
        }
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("MagicalCheckBoxViewModelContinuousDisableGrabEnabled - Dealloc")
        }
    }
}
