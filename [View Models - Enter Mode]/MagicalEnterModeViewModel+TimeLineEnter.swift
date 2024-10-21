//
//  MagicalModeChangeViewModel+TimeLineEnter.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/11/24.
//

import Foundation

@Observable class MagicalModeChangeViewModelTimeLineEnter: MagicalModeChangeViewModel {
    
    override func handleClicked() {
        if let toolInterfaceViewModel = ApplicationController.shared.toolInterfaceViewModel {
            toolInterfaceViewModel.toolActionTimeLineEnter()
        }
    }
    
    override func refresh() {
        refreshEnabled()
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[Deinit] MagicalModeChangeViewModelTimeLineEnter (Dealloc)")
        }
    }
}
