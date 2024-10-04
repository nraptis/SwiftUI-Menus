//
//  MagicalEnterModeViewModel+AnimationContinuousEnter.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/1/24.
//

import Foundation

@Observable class MagicalEnterModeViewModelAnimationContinuousEnter: MagicalEnterModeViewModel {
    
    override func handleClicked() {
        if let toolInterfaceViewModel = ApplicationController.shared.toolInterfaceViewModel {
            toolInterfaceViewModel.toolActionAnimationContinuousEnter()
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
            print("[Deinit] MagicalEnterModeViewModelAnimationContinuousEnter (Dealloc)")
        }
    }
}
