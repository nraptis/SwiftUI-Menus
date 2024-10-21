//
//  MagicalButtonViewModel+RotateGuideRight.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/30/24.
//

import Foundation

@Observable class MagicalButtonViewModelRotateGuideRight: MagicalButtonViewModel {
    
    override func handleClicked() {
        if let toolInterfaceViewModel = ApplicationController.shared.toolInterfaceViewModel {
            toolInterfaceViewModel.toolActionRotateGuideRight()
        }
    }
    
    override func refresh() {
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            switch jiggleViewModel.jiggleDocument.creatorMode {
            case .none:
                if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                    if let selectedGuide = selectedJiggle.getSelectedGuide() {
                        refreshEnabled()
                    } else {
                        refreshDisabled()
                    }
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
            print("[Deinit] MagicalTextIconButtonViewModelRotateGuideRight (Dealloc)")
        }
    }
}
