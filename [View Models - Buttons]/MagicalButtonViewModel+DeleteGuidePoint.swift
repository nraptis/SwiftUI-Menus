//
//  MagicalButtonViewModel+DeleteGuidePoint.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/3/24.
//

import Foundation

@Observable class MagicalButtonViewModelDeleteGuidePoint: MagicalButtonViewModel {
    
    override func handleClicked() {
        if let toolInterfaceViewModel = ApplicationController.shared.toolInterfaceViewModel {
            toolInterfaceViewModel.toolActionDeleteGuidePoint()
        }
    }
    
    override func refresh() {
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            switch jiggleViewModel.jiggleDocument.creatorMode {
            case .none:
                if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                    if selectedJiggle.getSelectedGuide() !== nil {
                        refreshEnabled()
                    } else {
                        refreshDisabled()
                    }
                } else {
                    refreshDisabled()
                }
            default:
                refreshDisabled()
            }
        }
        
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[Deinit] MagicalTextIconButtonViewModelDeleteGuidePoint (Dealloc)")
        }
    }
}
