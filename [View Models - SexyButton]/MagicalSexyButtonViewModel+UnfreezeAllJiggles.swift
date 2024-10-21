//
//  MagicalButtonViewModel+UnfreezeAllJiggles.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/2/24.
//

import Foundation

@Observable class MagicalButtonViewModelUnfreezeAllJiggles: MagicalButtonViewModel {
    
    override func handleClicked() {
        if let toolInterfaceViewModel = ApplicationController.shared.toolInterfaceViewModel {
            toolInterfaceViewModel.toolActionUnfreezeAllJiggles()
        }
    }
    
    override func refresh() {
        
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            switch jiggleViewModel.jiggleDocument.creatorMode {
            case .none:
                let jiggleDocument = jiggleViewModel.jiggleDocument
                let frozenJiggleCount = jiggleDocument.countFrozenJiggles()
                if frozenJiggleCount > 0 {
                    refreshEnabled()
                } else {
                    refreshDisabled()
                }
            default:
                refreshDisabled()
            }
        }

        super.refresh()
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[Deinit] MagicalTextIconButtonViewModelUnfreezeAllJiggles (Dealloc)")
        }
    }
}
