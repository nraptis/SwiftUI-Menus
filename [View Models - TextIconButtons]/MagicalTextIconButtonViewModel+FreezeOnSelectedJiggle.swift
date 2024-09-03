//
//  MagicalTextIconButtonViewModel+FreezeOnSelectedJiggle.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/5/24.
//

import Foundation

@Observable class MagicalTextIconButtonViewModelFreezeOnSelectedJiggle: MagicalTextIconButtonViewModel {
    
    override func handleClicked() {
        if let toolInterfaceViewModel = ApplicationController.shared.toolInterfaceViewModel {
            toolInterfaceViewModel.toolActionFreezeOnSelectedJiggle()
        }
    }
    
    override func refresh() {
        super.refresh()
        
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            if jiggleViewModel.getSelectedJiggle() !== nil {
                refreshEnabled()
            } else {
                refreshDisabled()
            }
        }
        
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[Deinit] MagicalTextIconButtonViewModelFreezeOnSelectedJiggle (Dealloc)")
        }
    }
}
