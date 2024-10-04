//
//  MagicalEnterModeViewModel+LoopsPage1Enter.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/1/24.
//

import Foundation
import Foundation

@Observable class MagicalEnterModeViewModelLoopsPage1Enter: MagicalEnterModeViewModel {
    
    override func handleClicked() {
        if let toolInterfaceViewModel = ApplicationController.shared.toolInterfaceViewModel {
            toolInterfaceViewModel.toolActionLoopsPage1Enter()
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
            print("[Deinit] MagicalEnterModeViewModelLoopsPage1Enter (Dealloc)")
        }
    }
}
