//
//  MagicalSexyButtonViewModel+SwivelRotateReset.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/7/24.
//

import Foundation

@Observable class MagicalSexyButtonViewModelSwivelRotateReset: MagicalSexyButtonViewModel {
    
    override func handleClicked() {
        if let toolInterfaceViewModel = ApplicationController.shared.toolInterfaceViewModel {
            toolInterfaceViewModel.toolActionSwivelRotateReset()
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
        
        super.refresh()
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[Deinit] MagicalTextIconButtonViewModelSwivelRotateReset (Dealloc)")
        }
    }
}