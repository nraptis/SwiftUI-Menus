//
//  MagicalButtonViewModel+DeleteJigglePoint.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/3/24.
//

import Foundation

@Observable class MagicalButtonViewModelDeleteJigglePoint: MagicalButtonViewModel {
    
    override func handleClicked() {
        if let toolInterfaceViewModel = ApplicationController.shared.toolInterfaceViewModel {
            toolInterfaceViewModel.toolActionDeleteJigglePoint()
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
            print("[Deinit] MagicalTextIconButtonViewModelDeleteJigglePoint (Dealloc)")
        }
    }
}
