//
//  MagicalIconButtonViewModelCollapse.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 4/5/24.
//

import Foundation

@Observable class MagicalIconButtonViewModelPhoneCollapseBottom: MagicalIconButtonViewModel {
    
    override func handleClicked() {
        print("MagicalIconButtonViewModelPhoneCollapseBottom => handleClicked()")
        if let toolInterfaceViewModel = ApplicationController.shared.toolInterfaceViewModel {
            print("DISABLED... NOT USI ANY MOR")
            //toolInterfaceViewModel.toolActionPhoneCollapseTopMenu()
            toolInterfaceViewModel.toolActionPhoneToggleBottomMenu()
        }
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("MagicalIconButtonViewModelPhoneCollapseBottom - Dealloc")
        }
    }
}
