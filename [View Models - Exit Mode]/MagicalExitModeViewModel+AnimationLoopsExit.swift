//
//  MagicalExitModeViewModel+AnimationLoopsExit.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/10/24.
//

import Foundation

@Observable class MagicalExitModeViewModelAnimationLoopsExit: MagicalExitModeViewModel {
    
    override func handleClicked() {
        if let toolInterfaceViewModel = ApplicationController.shared.toolInterfaceViewModel {
            toolInterfaceViewModel.toolActionAnimationLoopsExit()
        }
    }
    
    override func refresh() {
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            switch jiggleViewModel.jiggleDocument.creatorMode {
            case .none:
                refreshEnabled()
            default:
                refreshDisabled()
            }
        }
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[Deinit] MagicalExitModeViewModelAnimationLoopsExit (Dealloc)")
        }
    }
}
