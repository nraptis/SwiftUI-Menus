//
//  MagicalCheckBoxViewModel+GuideCentersEnabled.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/27/24.
//

import Foundation

@Observable class MagicalCheckBoxViewModelGuideCentersEnabled: MagicalCheckBoxViewModel {
    
    override func refresh() {
        
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            
            //
            // See if we should be checked...
            //
            
            if jiggleViewModel.jiggleDocument.isCreateGuideCentersModificationEnabled {
                if isChecked == false {
                    isChecked = true
                }
            } else {
                if isChecked == true {
                    isChecked = false
                }
            }
            
            //
            // See if we should be highlighted...
            //
            
            if jiggleViewModel.jiggleDocument.isCreateGuideCentersModificationEnabled {
                if isHighlighted == false {
                    isHighlighted = true
                }
            } else {
                if isHighlighted == true {
                    isHighlighted = false
                }
            }
            
            
            //
            // See if we should be enabled...
            //
            
            
        }
        
        if isEnabled == false {
            isEnabled = true
        }
        
    }
    
    override func handleClicked() {
        print("MagicalCheckBoxViewModelGuideCentersEnabled => handleClicked()")
        if let toolInterfaceViewModel = ApplicationController.shared.toolInterfaceViewModel,
           let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            
            if toolInterfaceViewModel.isBlocked {
                return
            }
            
            if jiggleViewModel.jiggleDocument.isCreateGuideCentersModificationEnabled {
                jiggleViewModel.createGuideCentersModificationDisable()
            } else {
                jiggleViewModel.createGuideCentersModificationEnable()
            }
        }
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("MagicalCheckBoxViewModelGuideCentersEnabled - Dealloc")
        }
    }
}
