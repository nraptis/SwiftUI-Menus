//
//  MagicalButtonViewModel+SelectPreviousJiggle.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/26/24.
//

import Foundation

@Observable class MagicalButtonViewModelSelectPreviousJiggle: MagicalButtonViewModel {
    
    override func handleClicked() {
        if let toolInterfaceViewModel = ApplicationController.shared.toolInterfaceViewModel {
            toolInterfaceViewModel.toolActionSelectPreviousJiggle()
        }
    }
    
    override func refresh() {
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            switch jiggleViewModel.jiggleDocument.creatorMode {
            case .none:
                let jiggleDocument = jiggleViewModel.jiggleDocument
                let unfrozenJiggleCount = jiggleDocument.countUnfrozenJiggles()
                if unfrozenJiggleCount > 1 {
                    refreshEnabled()
                } else if unfrozenJiggleCount == 1 {
                    if jiggleDocument.getSelectedJiggle() === nil {
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
            print("[Deinit] MagicalTextIconButtonViewModelSelectPreviousJiggle (Dealloc)")
        }
    }
}
