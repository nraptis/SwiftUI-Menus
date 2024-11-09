//
//  MagicalButtonViewModel+RotateJiggleRight.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/10/24.
//

import Foundation

@Observable class MagicalButtonViewModelRotateJiggleRight: MagicalButtonViewModel {
    
    override func handleClicked() {
        if let toolInterfaceViewModel = ApplicationController.shared.toolInterfaceViewModel {
            toolInterfaceViewModel.toolActionRotateJiggleRight()
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
        
        
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[Deinit] MagicalTextIconButtonViewModelRotateJiggleRight (Dealloc)")
        }
    }
}
