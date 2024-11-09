//
//  MagicalButtonViewModel+ResetWeightGraphInverseDampened.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/7/24.
//

import Foundation

@Observable class MagicalButtonViewModelResetWeightGraphInverseDampened: MagicalButtonViewModel {
    
    override func handleClicked() {
        if let toolInterfaceViewModel = ApplicationController.shared.toolInterfaceViewModel {
            toolInterfaceViewModel.toolActionResetWeightGraphInverseDampened()
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
            print("[Deinit] MagicalTextIconButtonViewModelResetWeightGraphInverseDampened (Dealloc)")
        }
    }
}
