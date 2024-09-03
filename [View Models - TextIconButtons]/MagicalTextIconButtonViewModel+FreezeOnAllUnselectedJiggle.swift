//
//  MagicalTextIconButtonViewModel+FreezeOnAllUnselectedJiggle.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 6/21/24.
//

import Foundation

@Observable class MagicalTextIconButtonViewModelFreezeOnAllUnselectedJiggle: MagicalTextIconButtonViewModel {
    
    override func handleClicked() {
        if let toolInterfaceViewModel = ApplicationController.shared.toolInterfaceViewModel {
            toolInterfaceViewModel.toolActionFreezeOnAllUnselectedJiggle()
        }
    }
    
    override func refresh() {
        super.refresh()
        
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[Deinit] MagicalTextIconButtonViewModelFreezeOnAllUnselectedJiggle (Dealloc)")
        }
    }
}
