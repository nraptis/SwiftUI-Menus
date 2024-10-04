//
//  MagicalCheckBoxViewModel+DarkModeEnabled.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/20/24.
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
        
        isEnabled = true
    }
    
    override func handleClicked() {
        print("MagicalCheckBoxViewModelDarkModeEnabled => handleClicked()")
        
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
            print("MagicalCheckBoxViewModelDarkModeEnabled - Dealloc")
        }
    }
}
