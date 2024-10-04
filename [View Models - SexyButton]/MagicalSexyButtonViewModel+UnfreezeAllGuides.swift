//
//  MagicalSexyButtonViewModel+UnfreezeAllGuides.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/2/24.
//

import Foundation

@Observable class MagicalSexyButtonViewModelUnfreezeAllGuides: MagicalSexyButtonViewModel {
    
    override func handleClicked() {
        if let toolInterfaceViewModel = ApplicationController.shared.toolInterfaceViewModel {
            toolInterfaceViewModel.toolActionUnfreezeAllGuides()
        }
    }
    
    override func refresh() {
        
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            switch jiggleViewModel.jiggleDocument.creatorMode {
            case .none:
                let jiggleDocument = jiggleViewModel.jiggleDocument
                let frozenGuideCount = jiggleDocument.countFrozenGuides()
                if frozenGuideCount > 0 {
                    refreshEnabled()
                } else {
                    refreshDisabled()
                }
            default:
                refreshDisabled()
            }
        }
        
        super.refresh()
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[Deinit] MagicalTextIconButtonViewModelUnfreezeAllGuides (Dealloc)")
        }
    }
}
