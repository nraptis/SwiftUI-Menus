//
//  MagicalButtonViewModel+TimeLineDampen.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/24/24.
//

import Foundation

@Observable class MagicalButtonViewModelTimeLineDampen: MagicalButtonViewModel {
    
    override func handleClicked() {
        if let toolInterfaceViewModel = ApplicationController.shared.toolInterfaceViewModel {
            toolInterfaceViewModel.toolActionTimeLineDampen()
        }
    }
    
    override func refresh() {
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            switch jiggleViewModel.jiggleDocument.creatorMode {
            case .none:
                if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
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
            print("[Deinit] MagicalTextIconButtonViewModelTimeLineDampen (Dealloc)")
        }
    }
}
