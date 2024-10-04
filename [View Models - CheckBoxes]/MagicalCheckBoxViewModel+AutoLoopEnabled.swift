//
//  MagicalCheckBoxViewModel+AutoLoopEnabled.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/9/24.
//

import Foundation

@Observable class MagicalCheckBoxViewModelAutoLoopEnabled: MagicalCheckBoxViewModel {
    
    override func refresh() {
        
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            /*
            if jiggleViewModel.isAutoLoopEnabled {
                if isChecked == false {
                    isChecked = true
                }
            } else {
                if isChecked == true {
                    isChecked = false
                }
            }
            */
        }
        
        //
        // See if we should be enabled...
        //
        
        isEnabled = true
    }
    
    override func handleClicked() {
        print("MagicalCheckBoxViewModelAutoLoopEnabled => handleClicked()")
        
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            if let jiggleViewController = jiggleViewModel.jiggleViewController {
                //if jiggleViewModel.isAutoLoopEnabled {
                    //jiggleViewController.autoLoopExit()
                //} else {
                    //jiggleViewController.autoLoopEnter()
                //}
            }
        }
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("MagicalCheckBoxViewModelAutoLoopEnabled - Dealloc")
        }
    }
}
