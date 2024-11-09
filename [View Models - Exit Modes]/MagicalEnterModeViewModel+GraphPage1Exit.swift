//
//  MagicalEnterModeViewModel+GraphPage1Exit.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 11/6/24.
//

import Foundation

@Observable class MagicalExitModeViewModelGraphPage1Exit: MagicalModeChangeViewModel {
    
    override func handleClicked() {
        if let toolInterfaceViewModel = ApplicationController.shared.toolInterfaceViewModel {
            toolInterfaceViewModel.toolActionGraphPage1Exit()
        }
    }
    
    override func refresh() {
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            if jiggleViewModel.getGraphDraggingStatus() {
                refreshDisabled()
            } else if jiggleViewModel.isAnySliderActive {
                refreshDisabled()
            } else {
                refreshEnabled()
            }
        }
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[Deinit] MagicalExitModeViewModelGraphPage1Exit (Dealloc)")
        }
    }
}
