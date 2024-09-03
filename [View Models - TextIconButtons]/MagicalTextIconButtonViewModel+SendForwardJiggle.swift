//
//  MagicalTextIconButtonViewModel+SendForwardJiggle.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/5/24.
//

import Foundation

@Observable class MagicalTextIconButtonViewModelSendForwardJiggle: MagicalTextIconButtonViewModel {
    
    override func handleClicked() {
        if let toolInterfaceViewModel = ApplicationController.shared.toolInterfaceViewModel {
            toolInterfaceViewModel.toolActionSendForwardJiggle()
        }
    }
    
    override func refresh() {
        super.refresh()
        
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[Deinit] MagicalTextIconButtonViewModelSendForwardJiggle (Dealloc)")
        }
    }
}
