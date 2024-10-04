//
//  MagicalCheckBoxViewModel+AdjustJiggleCentersEnabled.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/22/24.
//

import Foundation

@Observable class MagicalCheckBoxViewModelJiggleCentersEnabled: MagicalCheckBoxViewModel {
    
    override func refresh() {
        
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            
            //
            // See if we should be checked...
            //
            
            if jiggleViewModel.jiggleDocument.creatorMode == .moveJiggleCenter {
                if isChecked == false {
                    isChecked = true
                }
            } else {
                if isChecked == true {
                    isChecked = false
                }
            }
            
        }
        
        if isEnabled == false {
            isEnabled = true
        }
        
    }
    
    override func handleClicked() {
        print("MagicalCheckBoxViewModelJiggleCentersEnabled => handleClicked()")
        if let toolInterfaceViewModel = ApplicationController.shared.toolInterfaceViewModel,
           let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            
            if toolInterfaceViewModel.isBlocked {
                return
            }
            
            if jiggleViewModel.jiggleDocument.creatorMode == .moveJiggleCenter {
                jiggleViewModel.setCreatorMode(.none)
            } else {
                jiggleViewModel.setCreatorMode(.moveJiggleCenter)
            }
            
        }
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("MagicalCheckBoxViewModelJiggleCentersEnabled - Dealloc")
        }
    }
}
