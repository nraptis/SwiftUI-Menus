//
//  MagicalExitModeViewModel+TimeLinePage2.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/18/24.
//

import Foundation

@Observable class MagicalExitModeViewModelTimeLinePage2Exit: MagicalModeChangeViewModel {
    
    override func handleClicked() {
        if let toolInterfaceViewModel = ApplicationController.shared.toolInterfaceViewModel {
            toolInterfaceViewModel.toolActionTimeLinePage2Exit()
        }
    }
    
    override func refresh() {
        refreshEnabled()
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[Deinit] MagicalExitModeViewModelTimeLinePage2Exit (Dealloc)")
        }
    }
}
