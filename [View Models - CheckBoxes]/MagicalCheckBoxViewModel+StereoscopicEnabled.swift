//
//  MagicalCheckBoxViewModel+StereoscopicEnabled.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/9/24.
//

import Foundation

@Observable class MagicalCheckBoxViewModelStereoscopicEnabled: MagicalCheckBoxViewModel {
    
    override func refresh() {
        
        //
        // See if we should be checked...
        //
        
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            if jiggleViewModel.isStereoscopicEnabled {
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
        print("MagicalCheckBoxViewModelStereoscopicEnabled => handleClicked()")
        
        if let jiggleViewController = ApplicationController.shared.jiggleViewController {
            if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
                if jiggleViewModel.isStereoscopicEnabled {
                    jiggleViewController.stereoscopicExit()
                } else {
                    jiggleViewController.stereoscopicEnter()
                }
            }
        }
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("MagicalCheckBoxViewModelStereoscopicEnabled - Dealloc")
        }
    }
}
