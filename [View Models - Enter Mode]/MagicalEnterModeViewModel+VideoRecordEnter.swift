//
//  MagicalEnterModeViewModel+VideoRecordEnter.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/10/24.
//

import Foundation

@Observable class MagicalEnterModeViewModelVideoRecordEnter: MagicalEnterModeViewModel {
    
    override func handleClicked() {
        if let toolInterfaceViewModel = ApplicationController.shared.toolInterfaceViewModel {
            toolInterfaceViewModel.toolActionVideoRecordEnter()
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
            print("[Deinit] MagicalEnterModeViewModelVideoRecordEnter (Dealloc)")
        }
    }
}
