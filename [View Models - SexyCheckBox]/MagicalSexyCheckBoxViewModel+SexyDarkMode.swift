//
//  MagicalCheckBoxViewModel+SexyDarkMode.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/25/24.
//

import Foundation

@Observable class MagicalCheckBoxViewModelDarkModeEnabled: MagicalCheckBoxViewModel {
    
    override func refresh() {
        
        if ApplicationController.isDarkModeEnabled {
            if isChecked == false {
                isChecked = true
            }
        } else {
            if isChecked == true {
                isChecked = false
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
        print("MagicalCheckBoxViewModelDarkModeEnabledEnabled => handleClicked()")
        
        if let jiggleViewController = ApplicationController.shared.jiggleViewController {
            if ApplicationController.isDarkModeEnabled {
                jiggleViewController.darkModeGo(isEnabled: false)
            } else {
                jiggleViewController.darkModeGo(isEnabled: true)
            }
        }
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("MagicalCheckBoxViewModelDarkModeEnabledEnabled - Dealloc")
        }
    }
}
