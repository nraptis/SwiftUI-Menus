//
//  MagicalCheckBoxViewModel+CreateJigglesDrawing.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/9/24.
//

import Foundation

@Observable class MagicalCheckBoxViewModelCreateJigglesDrawing: MagicalCheckBoxViewModel {
    
    override func refresh() {
        
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            
            //
            // See if we should be checked...
            //
            
            if jiggleViewModel.jiggleDocument.isCreateJiggleDrawingEnabled {
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
            
            if jiggleViewModel.jiggleDocument.isCreateJiggleDrawingEnabled {
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
            
            if jiggleViewModel.jiggleDocument.isCreateWeightRingsStandardEnabled {
                if isEnabled {
                    isEnabled = false
                }
                return
            }
            
            if jiggleViewModel.jiggleDocument.isCreateWeightRingsDrawingEnabled {
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
        print("MagicalCheckBoxViewModelCreateJigglesDrawing => handleClicked()")
        if let toolInterfaceViewModel = ApplicationController.shared.toolInterfaceViewModel,
           let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            
            if toolInterfaceViewModel.isBlocked { 
                return
            }
            
            if jiggleViewModel.jiggleDocument.isCreateJiggleDrawingEnabled {
                jiggleViewModel.createJiggleDrawingDisable()
            } else {
                jiggleViewModel.createJiggleDrawingEnable()
            }
        }
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("MagicalCheckBoxViewModelCreateJigglesDrawing - Dealloc")
        }
    }
}
