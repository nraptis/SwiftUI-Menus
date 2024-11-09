//
//  MagicalButtonViewModel+SelectPreviousGuide.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/26/24.
//

import Foundation

@Observable class MagicalButtonViewModelSelectPreviousGuide: MagicalButtonViewModel {
    
    override func handleClicked() {
        if let toolInterfaceViewModel = ApplicationController.shared.toolInterfaceViewModel {
            toolInterfaceViewModel.toolActionSelectPreviousGuide()
        }
    }
    
    override func refresh() {
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            switch jiggleViewModel.jiggleDocument.creatorMode {
            case .none:
                let jiggleDocument = jiggleViewModel.jiggleDocument
                let unfrozenGuideCount = jiggleDocument.countUnfrozenGuides()
                if unfrozenGuideCount > 1 {
                    refreshEnabled()
                } else if unfrozenGuideCount == 1 {
                    if jiggleDocument.getSelectedGuide() === nil {
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
            print("[Deinit] MagicalButtonViewModelSelectPreviousGuide (Dealloc)")
        }
    }
}
