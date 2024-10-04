//
//  MagicalCheckBoxViewModel+ZoomEnabled.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/9/24.
//

import Foundation

@Observable class MagicalCheckBoxViewModelZoomEnabled: MagicalCheckBoxViewModel {
    
    override func refresh() {
        
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            if jiggleViewModel.isZoomEnabled {
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
        print("MagicalCheckBoxViewModelZoomEnabled => handleClicked()")
        if let jiggleViewController = ApplicationController.shared.jiggleViewController,
           let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            if jiggleViewModel.isZoomEnabled {
                jiggleViewController.zoomExit()
            } else {
                jiggleViewController.zoomEnter()
            }
        }
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("MagicalCheckBoxViewModelZoomEnabled - Dealloc")
        }
    }
}
