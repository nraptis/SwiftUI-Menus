//
//  MagicalSexyCheckBoxViewModel+AnimationBounceApplyToAll.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/7/24.
//

import Foundation

@Observable class MagicalSexyCheckBoxViewModelAnimationBounceApplyToAll: MagicalSexyCheckBoxViewModel {
    
    override func refresh() {
        
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            /*
            if jiggleViewModel.jiggleDocument.creatorMode == .moveJiggleCenter {
                if isChecked == false {
                    isChecked = true
                }
            } else {
                if isChecked == true {
                    isChecked = false
                }
            }
            */
        }
        
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
            /*
            if jiggleViewModel.jiggleDocument.creatorMode == .moveJiggleCenter {
                jiggleViewModel.setCreatorMode(.none)
            } else {
                jiggleViewModel.setCreatorMode(.moveJiggleCenter)
            }
            */
        }
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("MagicalSexyCheckBoxViewModelAnimationBounceApplyToAll - Dealloc")
        }
    }
}
