//
//  MagicalButtonViewModel+ZoomReset.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/27/24.
//

import Foundation

@Observable class MagicalButtonViewModelZoomReset: MagicalButtonViewModel {
    
    override func handleClicked() {
        if let toolInterfaceViewModel = ApplicationController.shared.toolInterfaceViewModel {
            toolInterfaceViewModel.toolActionZoomReset()
        }
    }
    
    override func refresh() {
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            let jiggleDocument = jiggleViewModel.jiggleDocument
            let unfrozenJiggleCount = jiggleDocument.countUnfrozenJiggles()
            if unfrozenJiggleCount > 0 {
                refreshEnabled()
            } else {
                refreshDisabled()
            }
        }
        super.refresh()
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[Deinit] MagicalTextIconButtonViewModelZoomReset (Dealloc)")
        }
    }
}
