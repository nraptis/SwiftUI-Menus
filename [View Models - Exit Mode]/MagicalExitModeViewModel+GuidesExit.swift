//
//  MagicalExitModeViewModel+GuidesExit.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/26/24.
//

import Foundation
//
//  MagicalExitModeViewModel+Guides.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/25/24.
//

import Foundation

@Observable class MagicalExitModeViewModelGuidesExit: MagicalExitModeViewModel {
    
    override func handleClicked() {
        if let toolInterfaceViewModel = ApplicationController.shared.toolInterfaceViewModel {
            toolInterfaceViewModel.toolActionGuidesExit()
        }
    }
    
    override func refresh() {
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                refreshEnabled()
            } else {
                refreshDisabled()
            }
        }
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[Deinit] MagicalExitModeViewModelGuidesExit (Dealloc)")
        }
    }
}
