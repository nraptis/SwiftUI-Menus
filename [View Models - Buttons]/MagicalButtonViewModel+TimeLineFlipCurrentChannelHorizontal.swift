//
//  MagicalButtonViewModel+TimeLineFlipCurrentChannelHorizontal.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 11/6/24.
//

import Foundation

@Observable class MagicalButtonViewModelTimeLineFlipCurrentChannelHorizontal: MagicalButtonViewModel {
    
    override func handleClicked() {
        if let toolInterfaceViewModel = ApplicationController.shared.toolInterfaceViewModel {
            toolInterfaceViewModel.toolActionTimeLineFlipCurrentChannelHorizontal()
        }
    }
    
    override func refresh() {
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            if jiggleViewModel.getTimeLineDraggingStatus() {
                refreshDisabled()
            } else if jiggleViewModel.isAnySliderActive {
                refreshDisabled()
            } else if jiggleViewModel.getSelectedJiggle() === nil {
                refreshDisabled()
            } else {
                refreshEnabled()
            }
        }
        
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[Deinit] MagicalTextIconButtonViewModelTimeLineFlipCurrentChannelHorizontal (Dealloc)")
        }
    }
}
