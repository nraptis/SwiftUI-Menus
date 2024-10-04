//
//  MagicalSexyButtonViewModel+TimeLineInvertV.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/22/24.
//

import Foundation

@Observable class MagicalSexyButtonViewModelTimeLineInvertV: MagicalSexyButtonViewModel {
    
    
    override func handleClicked() {
        if let toolInterfaceViewModel = ApplicationController.shared.toolInterfaceViewModel {
            toolInterfaceViewModel.toolActionTimeLineInvertV()
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
            print("[Deinit] MagicalTextIconButtonViewModelTimeLineInvertV (Dealloc)")
        }
    }
}