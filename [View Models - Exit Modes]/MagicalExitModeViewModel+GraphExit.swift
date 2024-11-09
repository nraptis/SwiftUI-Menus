//
//  MagicalExitModeViewModel+GraphExit.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/26/24.
//

import Foundation
//
//  MagicalExitModeViewModel+Graph.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/25/24.
//

import Foundation

@Observable class MagicalExitModeViewModelGraphExit: MagicalModeChangeViewModel {
    
    override func handleClicked() {
        if let toolInterfaceViewModel = ApplicationController.shared.toolInterfaceViewModel {
            toolInterfaceViewModel.toolActionGraphExit()
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
            print("[Deinit] MagicalExitModeViewModelGraphExit (Dealloc)")
        }
    }
}
