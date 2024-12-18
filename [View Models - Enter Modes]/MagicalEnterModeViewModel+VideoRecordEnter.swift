//
//  MagicalModeChangeViewModel+VideoRecordEnter.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/10/24.
//

import Foundation

@Observable class MagicalModeChangeViewModelVideoRecordEnter: MagicalModeChangeViewModel {
    
    override func handleClicked() {
        if let toolInterfaceViewModel = ApplicationController.shared.toolInterfaceViewModel {
            toolInterfaceViewModel.toolActionVideoRecordEnter()
        }
    }
    
    override func refresh() {
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            
            if jiggleViewModel.getContinuousDraggingStatus() {
                refreshDisabled()
                return
            }
            
            if jiggleViewModel.getTimeLineDraggingStatus() {
                refreshDisabled()
                return
            }
            
            if jiggleViewModel.isAnySliderActive {
                refreshDisabled()
                return
            }

            refreshEnabled()
        }
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[Deinit] MagicalModeChangeViewModelVideoRecordEnter (Dealloc)")
        }
    }
}
