//
//  MagicalCheckBoxViewModel+RecordAudioEnabled.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/7/24.
//

import Foundation

@Observable class MagicalCheckBoxViewModelRecordAudioEnabled: MagicalCheckBoxViewModel {
    
    override func refresh() {

        //
        // See if we should be enabled...
        //
        
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            switch jiggleViewModel.jiggleDocument.creatorMode {
            case .none:
                refreshEnabled()
            default:
                refreshDisabled()
            }
        }
    }
    
    override func handleClicked() {
        if let toolInterfaceViewModel = ApplicationController.shared.toolInterfaceViewModel,
           let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            
            if toolInterfaceViewModel.isBlocked {
                return
            }
        }
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("MagicalCheckBoxViewModelRecordAudioEnabled - Dealloc")
        }
    }
}
