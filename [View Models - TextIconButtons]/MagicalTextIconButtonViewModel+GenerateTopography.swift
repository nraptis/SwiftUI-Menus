//
//  MagicalTextIconButtonViewModel+GenerateTopography.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 6/17/24.
//

import Foundation

@Observable class MagicalTextIconButtonViewModelGenerateTopography: MagicalTextIconButtonViewModel {
    
    override func handleClicked() {
        if let toolInterfaceViewModel = ApplicationController.shared.toolInterfaceViewModel {
            toolInterfaceViewModel.toolActionGenerateTopography()
        }
    }
    
    override func refresh() {
        super.refresh()
        
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[Deinit] MagicalTextIconButtonViewModelGenerateTopography (Dealloc)")
        }
    }
}
