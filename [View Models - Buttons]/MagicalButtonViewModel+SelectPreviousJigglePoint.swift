//
//  MagicalButtonViewModel+SelectPreviousJigglePoint.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/26/24.
//

import Foundation

@Observable class MagicalButtonViewModelSelectPreviousJigglePoint: MagicalButtonViewModel {
    
    override func handleClicked() {
        if let toolInterfaceViewModel = ApplicationController.shared.toolInterfaceViewModel {
            toolInterfaceViewModel.toolActionSelectPreviousJigglePoint()
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
        
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[Deinit] MagicalTextIconButtonViewModelSelectPreviousJigglePoint (Dealloc)")
        }
    }
}
