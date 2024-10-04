//
//  MagicalSexyButtonViewModel+FlipGuideH.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/30/24.
//

import Foundation

@Observable class MagicalSexyButtonViewModelFlipGuideH: MagicalSexyButtonViewModel {
    
    override func handleClicked() {
        if let toolInterfaceViewModel = ApplicationController.shared.toolInterfaceViewModel {
            toolInterfaceViewModel.toolActionFlipGuideH()
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
        
        super.refresh()
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[Deinit] MagicalTextIconButtonViewModelFlipGuideH (Dealloc)")
        }
    }
}
