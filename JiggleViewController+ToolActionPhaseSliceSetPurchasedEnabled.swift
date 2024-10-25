//
//  JiggleViewController+ToolActionPhaseSliceSetPurchasedEnabled.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/9/24.
//

import Foundation
import Foundation

extension JiggleViewController {
    func toolActionConsumePhaseSliceSetPurchasedEnabled(_ slice: ToolActionPhaseSliceSetPurchasedEnabled) {
        ApplicationController.isPurchased = slice.isPurchased
        
        print("$$$$ #### $$$$ #### $$$$")
        
        print("$$$$ ==> \(ApplicationController.isPurchased)")
        
        print("$$$$ #### $$$$ #### $$$$")
        
        handlePurchasedDidChange()
        
        ApplicationController.shared.configSave()
        jiggleViewModel.killDragAll()
        
    }
}
