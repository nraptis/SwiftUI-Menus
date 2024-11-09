//
//  MagicalButtonViewModel+TimeLineDupeAll.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/17/24.
//

import Foundation

@Observable class MagicalButtonViewModelTimeLineDupeAll: MagicalButtonViewModel {
    
    override func handleClicked() {
        if let toolInterfaceViewModel = ApplicationController.shared.toolInterfaceViewModel {
            toolInterfaceViewModel.toolActionTimeLineDupeAll()
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
            print("[Deinit] MagicalTextIconButtonViewModelTimeLineDupeAll (Dealloc)")
        }
    }
}
