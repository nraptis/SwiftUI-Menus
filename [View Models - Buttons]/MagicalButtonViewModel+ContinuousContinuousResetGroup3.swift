//
//  MagicalButtonViewModel+ContinuousContinuousResetGroup3.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 11/7/24.
//

import Foundation

@Observable class MagicalButtonViewModelContinuousResetGroup3: MagicalButtonViewModel {
    
    override func handleClicked() {
        if let toolInterfaceViewModel = ApplicationController.shared.toolInterfaceViewModel {
            toolInterfaceViewModel.toolActionContinuousResetGroup3()
        }
    }
    
    override func refresh() {
        refreshEnabled()
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[Deinit] MagicalButtonViewModelContinuousResetGroup3 (Dealloc)")
        }
    }
}
