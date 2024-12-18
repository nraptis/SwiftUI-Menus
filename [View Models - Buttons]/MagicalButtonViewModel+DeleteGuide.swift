//
//  MagicalButtonViewModel+DeleteGuide.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/3/24.
//

import Foundation

@Observable class MagicalButtonViewModelDeleteGuide: MagicalButtonViewModel {
    
    override func handleClicked() {
        if let toolInterfaceViewModel = ApplicationController.shared.toolInterfaceViewModel {
            toolInterfaceViewModel.toolActionDeleteGuide()
        }
    }
    
    override func refresh() {
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            switch jiggleViewModel.jiggleDocument.creatorMode {
            case .none:
                if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                    if selectedJiggle.getSelectedGuide() !== nil {
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
        
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[Deinit] MagicalTextIconButtonViewModelDeleteGuide (Dealloc)")
        }
    }
}
