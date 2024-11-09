//
//  MagicalButtonViewModel+TimeLineResetDivot.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 11/5/24.
//

import Foundation

@Observable class MagicalButtonViewModelTimeLineResetDivot: MagicalButtonViewModel {
    
    override func handleClicked() {
        if let toolInterfaceViewModel = ApplicationController.shared.toolInterfaceViewModel {
            toolInterfaceViewModel.toolActionTimeLineResetDivot()
        }
    }
    
    override func refresh() {
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            if jiggleViewModel.getTimeLineDraggingStatus() {
                refreshDisabled()
            } else if jiggleViewModel.isAnySliderActive {
                refreshDisabled()
            } else if jiggleViewModel.getSelectedJiggle() === nil {
                refreshDisabled()
            } else {
                refreshEnabled()
            }
        }
        
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[Deinit] MagicalTextIconButtonViewModelTimeLineResetDivot (Dealloc)")
        }
    }
}
