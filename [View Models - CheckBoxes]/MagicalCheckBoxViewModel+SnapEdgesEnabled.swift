//
//  MagicalCheckBoxViewModel+SnapEdgesEnabled.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/2/24.
//

import Foundation

@Observable class MagicalCheckBoxViewModelSnapEdgesEnabled: MagicalSexyCheckBoxViewModel {
    
    override func refresh() {
        if let imageImportViewController = ApplicationController.shared.imageImportViewController {
            if imageImportViewController.snapToEdges {
                if isChecked == false {
                    isChecked = true
                }
            } else {
                if isChecked == true {
                    isChecked = false
                }
            }
        }
    }
    
    override func handleClicked() {
        if let imageImportViewController = ApplicationController.shared.imageImportViewController {
            if isChecked == false {
                isChecked = true
                imageImportViewController.snapToEdges = true
            } else {
                isChecked = false
                imageImportViewController.snapToEdges = false
            }
        }
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("MagicalCheckBoxViewModelSnapEdgesEnabled - Dealloc")
        }
    }
}
