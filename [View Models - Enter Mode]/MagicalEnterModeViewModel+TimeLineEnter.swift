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
            print("[Deinit] MagicalModeChangeViewModelTimeLineEnter (Dealloc)")
        }
    }
}
