//
//  MagicalSexyCheckBoxViewModel+SexyDarkMode.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/25/24.
//

import Foundation

@Observable class MagicalSexyCheckBoxViewModelDarkMode: MagicalSexyCheckBoxViewModel {
    
    override func refresh() {
        
        if ApplicationController.isDarkModeEnabled {
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
        print("MagicalSexyCheckBoxViewModelDarkModeEnabled => handleClicked()")
        
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
            print("MagicalSexyCheckBoxViewModelDarkModeEnabled - Dealloc")
        }
    }
}
