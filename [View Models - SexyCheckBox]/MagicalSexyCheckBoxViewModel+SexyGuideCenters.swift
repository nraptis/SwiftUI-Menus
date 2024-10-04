//
//  MagicalSexyCheckBoxViewModel+SexyGuideCenters.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/25/24.
//

import Foundation

@Observable class MagicalSexyCheckBoxViewModelGuideCenters: MagicalSexyCheckBoxViewModel {
    
    override func refresh() {
        
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            if jiggleViewModel.jiggleDocument.creatorMode == .moveGuideCenter {
                if isChecked == false {
                    isChecked = true
                }
            } else {
                if isChecked == true {
                    isChecked = false
                }
            }
        }
        
        //
        // See if we should be enabled...
        //
        
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            switch jiggleViewModel.jiggleDocument.creatorMode {
            case .none, .moveGuideCenter:
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
            
            if jiggleViewModel.jiggleDocument.creatorMode == .moveGuideCenter {
                jiggleViewModel.setCreatorMode(.none)
            } else {
                jiggleViewModel.setCreatorMode(.moveGuideCenter)
            }
        }
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("MagicalSexyCheckBoxViewModelSexyGuideCenters - Dealloc")
        }
    }
}
