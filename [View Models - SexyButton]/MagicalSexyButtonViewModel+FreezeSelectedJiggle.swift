//
//  MagicalSexyButtonViewModel+FreezeSelectedJiggle.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/2/24.
//

import Foundation

@Observable class MagicalSexyButtonViewModelFreezeSelectedJiggle: MagicalSexyButtonViewModel {
    
    override func handleClicked() {
        if let toolInterfaceViewModel = ApplicationController.shared.toolInterfaceViewModel {
            toolInterfaceViewModel.toolActionFreezeSelectedJiggle()
        }
    }
    
    override func refresh() {
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            switch jiggleViewModel.jiggleDocument.creatorMode {
            case .none:
                if jiggleViewModel.getSelectedJiggle() === nil {
                    refreshDisabled()
                } else {
                    refreshEnabled()
                }
            default:
                refreshDisabled()
            }
        }
        
        super.refresh()
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[Deinit] MagicalTextIconButtonViewModelFreezeSelectedJiggle (Dealloc)")
        }
    }
}
