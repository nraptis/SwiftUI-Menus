//
//  MagicalCheckBoxViewModel+SwivelOrbitEnabled.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 6/23/24.
//

import Foundation

@Observable class MagicalCheckBoxViewModelSwivelOrbitEnabled: MagicalCheckBoxViewModel {
    
    override func refresh() {
        
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            if jiggleViewModel.isSwivelOrbitEnabled {
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
        print("MagicalCheckBoxViewModelSwivelOrbitEnabled => handleClicked()")
        if let toolInterfaceViewModel = ApplicationController.shared.toolInterfaceViewModel,
           let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            if toolInterfaceViewModel.isBlocked { return }
            
            if jiggleViewModel.isSwivelOrbitEnabled {
                jiggleViewModel.setSwivelOrbitEnabled(false)
            } else {
                jiggleViewModel.setSwivelOrbitEnabled(true)
            }
        }
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("MagicalCheckBoxViewModelSwivelOrbitEnabled - Dealloc")
        }
    }
}
