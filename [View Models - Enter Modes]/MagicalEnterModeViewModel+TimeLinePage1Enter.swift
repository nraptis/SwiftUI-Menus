//
//  MagicalEnterModeViewModel+TimeLinePage1Enter.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 11/1/24.
//

import Foundation

@Observable class MagicalModeChangeViewModelTimeLinePage1Enter: MagicalModeChangeViewModel {
    
    override func handleClicked() {
        if let toolInterfaceViewModel = ApplicationController.shared.toolInterfaceViewModel {
            toolInterfaceViewModel.toolActionTimeLinePage1Enter()
        }
    }
    
    override func refresh() {
        
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            
            if jiggleViewModel.getTimeLineDraggingStatus() {
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
            print("[Deinit] MagicalModeChangeViewModelTimeLinePage1Enter (Dealloc)")
        }
    }
}