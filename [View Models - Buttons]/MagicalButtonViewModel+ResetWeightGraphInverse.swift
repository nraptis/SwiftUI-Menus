//
//  MagicalButtonViewModel+ResetWeightGraphInverse.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/7/24.
//

import Foundation

@Observable class MagicalButtonViewModelResetWeightGraphInverse: MagicalButtonViewModel {
    
    override func handleClicked() {
        if let toolInterfaceViewModel = ApplicationController.shared.toolInterfaceViewModel {
            toolInterfaceViewModel.toolActionResetWeightGraphInverse()
        }
    }
    
    override func refresh() {
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            
            if jiggleViewModel.isAnySliderActive {
                refreshDisabled()
                return
            }
            
            if jiggleViewModel.getGraphDraggingStatus() {
                refreshDisabled()
                return
            }

            refreshEnabled()
        }
        
        
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[Deinit] MagicalTextIconButtonViewModelResetWeightGraphInverse (Dealloc)")
        }
    }
}
