//
//  MagicalCheckBoxViewModel+WeightCurveGraphEnabled.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/9/24.
//

import Foundation

@Observable class MagicalCheckBoxViewModelWeightCurveGraphEnabled: MagicalCheckBoxViewModel {
    
    override func refresh() {
        
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            if jiggleViewModel.isGraphEnabled {
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
        print("MagicalCheckBoxViewModelWeightCurveGraphEnabled => handleClicked()")
        
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            if let jiggleViewController = jiggleViewModel.jiggleViewController {
                if jiggleViewModel.isGraphEnabled {
                    jiggleViewController.graphExit()
                } else {
                    jiggleViewController.graphEnter()
                }
            }
        }
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("MagicalCheckBoxViewModelWeightCurveGraphEnabled - Dealloc")
        }
    }
}
