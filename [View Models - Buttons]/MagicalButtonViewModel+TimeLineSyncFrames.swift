//
//  MagicalButtonViewModel+TimeLineSyncFrames.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/31/24.
//

import Foundation

@Observable class MagicalButtonViewModelTimeLineSyncFrames: MagicalButtonViewModel {
    
    override func handleClicked() {
        if let toolInterfaceViewModel = ApplicationController.shared.toolInterfaceViewModel {
            toolInterfaceViewModel.toolActionTimeLineSyncFrames()
        }
    }
    
    override func refresh() {
        refreshEnabled()
        super.refresh()
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[Deinit] MagicalTextIconButtonViewModelTimeLineSyncFrames (Dealloc)")
        }
    }
}
