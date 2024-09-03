//
//  MagicalTextIconButtonViewModel+PhoneCollapseTopMenu.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/5/24.
//

import Foundation

@Observable class MagicalTextIconButtonViewModelPhoneCollapseTopMenu: MagicalTextIconButtonViewModel {
    
    override func handleClicked() {
        if let toolInterfaceViewModel = ApplicationController.shared.toolInterfaceViewModel {
            
            print("DISABLED... NOT USI ANY MOR")
            //toolInterfaceViewModel.toolActionPhoneCollapseTopMenu()
            toolInterfaceViewModel.toolActionPhoneToggleTopMenu()
        }
    }
    
    override func refresh() {
        super.refresh()
        
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[Deinit] MagicalTextIconButtonViewModelPhoneCollapseTopMenu (Dealloc)")
        }
    }
}
