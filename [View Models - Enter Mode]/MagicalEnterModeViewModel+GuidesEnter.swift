//
//  MagicalEnterModeViewModel+Guides.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/25/24.
//

import Foundation

@Observable class MagicalEnterModeViewModelGuidesEnter: MagicalEnterModeViewModel {
    
    override func handleClicked() {
        if let toolInterfaceViewModel = ApplicationController.shared.toolInterfaceViewModel {
            toolInterfaceViewModel.toolActionGuidesEnter()
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
            print("[Deinit] MagicalEnterModeViewModelGuidesEnter (Dealloc)")
        }
    }
}
