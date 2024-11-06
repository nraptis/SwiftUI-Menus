//
//  MagicalEnterModeViewModel+GraphPage2.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/22/24.
//

import Foundation

@Observable class MagicalModeChangeViewModelGraphPage2Enter: MagicalModeChangeViewModel {
    
    override func handleClicked() {
        if let toolInterfaceViewModel = ApplicationController.shared.toolInterfaceViewModel {
            toolInterfaceViewModel.toolActionGraphPage2Enter()
        }
    }
    
    override func refresh() {
        refreshEnabled()
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[Deinit] MagicalModeChangeViewModelGraphPage2Enter (Dealloc)")
        }
    }
}
