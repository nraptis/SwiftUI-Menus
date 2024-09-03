//
//  MagicalTextIconButtonViewModel+SendBackJiggle.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/5/24.
//

import Foundation

@Observable class MagicalTextIconButtonViewModelSendBackJiggle: MagicalTextIconButtonViewModel {
    
    override func handleClicked() {
        if let toolInterfaceViewModel = ApplicationController.shared.toolInterfaceViewModel {
            toolInterfaceViewModel.toolActionSendBackJiggle()
        }
    }
    
    override func refresh() {
        super.refresh()
        
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[Deinit] MagicalTextIconButtonViewModelSendBackJiggle (Dealloc)")
        }
    }
}
