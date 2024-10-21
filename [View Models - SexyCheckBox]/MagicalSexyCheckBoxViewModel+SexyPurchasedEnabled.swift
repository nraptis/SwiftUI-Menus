//
//  MagicalCheckBoxViewModel+SexyPurchasedEnabled.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/8/24.
//

import Foundation

@Observable class MagicalCheckBoxViewModelPurchasedEnabled: MagicalCheckBoxViewModel {
    
    override func refresh() {
        
        if ApplicationController.isPurchased {
            if isChecked == false {
                isChecked = true
                print("Datk Mode Become CHECKED")
            }
        } else {
            if isChecked == true {
                isChecked = false
                print("Datk Mode Become NOCHECKED")
            }
        }
        
        //
        // See if we should be enabled...
        //
        
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            switch jiggleViewModel.jiggleDocument.creatorMode {
            case .none:
                refreshEnabled()
            default:
                refreshDisabled()
            }
        }
    }
    
    override func handleClicked() {
        print("MagicalCheckBoxViewModelPurchasedEnabledEnabled => handleClicked()")
        
        if let jiggleViewController = ApplicationController.shared.jiggleViewController {
            if ApplicationController.isPurchased {
                jiggleViewController.purchasedGo(isEnabled: false)
            } else {
                jiggleViewController.purchasedGo(isEnabled: true)
            }
        }
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("MagicalCheckBoxViewModelPurchasedEnabledEnabled - Dealloc")
        }
    }
}
