//
//  MagicalModeChangeViewModel+LoopsPage1Enter.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/1/24.
//

import Foundation
import Foundation

@Observable class MagicalModeChangeViewModelLoopsPage1Enter: MagicalModeChangeViewModel {
    
    override func handleClicked() {
        if let toolInterfaceViewModel = ApplicationController.shared.toolInterfaceViewModel {
            toolInterfaceViewModel.toolActionLoopsPage1Enter()
        }
    }
    
    override func refresh() {
        refreshEnabled()
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[Deinit] MagicalModeChangeViewModelLoopsPage1Enter (Dealloc)")
        }
    }
}
