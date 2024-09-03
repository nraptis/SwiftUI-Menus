//
//  MagicalTextIconButtonViewModel+RotateJiggleLeft.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/26/24.
//

import Foundation

@Observable class MagicalTextIconButtonViewModelRotateJiggleLeft: MagicalTextIconButtonViewModel {
    
    override func handleClicked() {
        if let toolInterfaceViewModel = ApplicationController.shared.toolInterfaceViewModel {
            toolInterfaceViewModel.toolActionRotateJiggleLeft()
        }
    }
    
    override func refresh() {
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            if jiggleViewModel.getSelectedJiggle() === nil {
                refreshDisabled()
            } else {
                refreshEnabled()
            }
        }
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[Deinit] MagicalTextIconButtonViewModelRotateJiggleLeft (Dealloc)")
        }
    }
}
