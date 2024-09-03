//
//  MagicalCheckBoxViewModel+CreateWeightRingsStandard.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/9/24.
//

import Foundation

@Observable class MagicalCheckBoxViewModelCreateWeightRingsStandard: MagicalCheckBoxViewModel {
    
    override func refresh() {
        
        //
        // See if we should be checked...
        //
        
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            if jiggleViewModel.jiggleDocument.isCreateWeightRingsStandardEnabled {
                if isChecked == false {
                    isChecked = true
                }
                if isHighlighted == false {
                    isHighlighted = true
                }
            } else {
                if isChecked == true {
                    isChecked = false
                }
                if isHighlighted == true {
                    isHighlighted = false
                }
            }
            
            //
            // See if we should be enabled...
            //
            
            if jiggleViewModel.jiggleDocument.isCreateJiggleStandardEnabled {
                if isEnabled {
                    isEnabled = false
                }
                return
            }
            
            if jiggleViewModel.jiggleDocument.isCreateJiggleDrawingEnabled {
                if isEnabled {
                    isEnabled = false
                }
                return
            }
            
            if jiggleViewModel.jiggleDocument.isCreatePointsEnabled {
                if isEnabled {
                    isEnabled = false
                }
                return
            }
            
            if jiggleViewModel.jiggleDocument.isRemovePointsEnabled {
                if isEnabled {
                    isEnabled = false
                }
                return
            }
            
            if jiggleViewModel.jiggleDocument.isCreateWeightRingPointsEnabled {
                if isEnabled {
                    isEnabled = false
                }
                return
            }
            
            if jiggleViewModel.jiggleDocument.isRemoveWeightRingPointsEnabled {
                if isEnabled {
                    isEnabled = false
                }
                return
            }
        }
        
        if isEnabled == false {
            isEnabled = true
        }
    }
    
    override func handleClicked() {
        print("MagicalCheckBoxViewModelCreateWeightRingsStandard => handleClicked()")
        
        if let toolInterfaceViewModel = ApplicationController.shared.toolInterfaceViewModel,
           let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            if toolInterfaceViewModel.isBlocked { return }
            
            if jiggleViewModel.jiggleDocument.isCreateWeightRingsStandardEnabled {
                jiggleViewModel.createWeightRingsStandardDisable()
            } else {
                jiggleViewModel.createWeightRingsStandardEnable()
            }
        }
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("MagicalCheckBoxViewModelCreateWeightRingsStandard - Dealloc")
        }
    }
}
