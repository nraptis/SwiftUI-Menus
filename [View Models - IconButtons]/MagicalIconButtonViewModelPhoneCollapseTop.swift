//
//  MagicalIconButtonViewModelExpand.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 4/5/24.
//

import Foundation

@Observable class MagicalIconButtonViewModelPhoneCollapseTop: MagicalIconButtonViewModel {
    
    override func handleClicked() {
        print("MagicalIconButtonViewModelPhoneCollapseTop => handleClicked()")
        if let toolInterfaceViewModel = ApplicationController.shared.toolInterfaceViewModel {
            print("DISABLED... NOT USI ANY MOR")
            //toolInterfaceViewModel.toolActionPhoneCollapseTopMenu()
            toolInterfaceViewModel.toolActionPhoneToggleTopMenu()
        }
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("MagicalIconButtonViewModelPhoneCollapseTop - Dealloc")
        }
    }
    
}
