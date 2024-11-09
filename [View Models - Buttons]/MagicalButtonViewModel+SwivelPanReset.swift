//
//  MagicalButtonViewModel+SwivelPanReset.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/7/24.
//

import Foundation

@Observable class MagicalButtonViewModelSwivelPanReset: MagicalButtonViewModel {
    
    override func handleClicked() {
        if let toolInterfaceViewModel = ApplicationController.shared.toolInterfaceViewModel {
            toolInterfaceViewModel.toolActionSwivelPanReset()
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
            print("[Deinit] MagicalTextIconButtonViewModelSwivelPanReset (Dealloc)")
        }
    }
}
