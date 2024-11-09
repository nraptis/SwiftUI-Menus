//
//  MagicalButtonViewModel+SelectNextGuidePoint.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/26/24.
//

import Foundation

@Observable class MagicalButtonViewModelSelectNextGuidePoint: MagicalButtonViewModel {
    
    override func handleClicked() {
        if let toolInterfaceViewModel = ApplicationController.shared.toolInterfaceViewModel {
            toolInterfaceViewModel.toolActionSelectNextGuidePoint()
        }
    }
    
    override func refresh() {
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            let jiggleDocument = jiggleViewModel.jiggleDocument
            let unfrozenGuideCount = jiggleDocument.countUnfrozenGuides()
            if unfrozenGuideCount > 0 {
                refreshEnabled()
            } else {
                refreshDisabled()
            }
        }
        
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[Deinit] MagicalTextIconButtonViewModelSelectNextGuidePoint (Dealloc)")
        }
    }
}
