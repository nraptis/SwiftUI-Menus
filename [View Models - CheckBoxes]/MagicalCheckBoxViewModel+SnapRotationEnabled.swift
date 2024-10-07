//
//  MagicalCheckBoxViewModel+SnapRotationEnabled.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/2/24.
//

import Foundation

@Observable class MagicalCheckBoxViewModelSnapRotationEnabled: MagicalSexyCheckBoxViewModel {
    
    override func refresh() {
        if let imageImportViewController = ApplicationController.shared.imageImportViewController {
            if imageImportViewController.snapToRotations {
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
                imageImportViewController.snapToRotations = true
            } else {
                isChecked = false
                imageImportViewController.snapToRotations = false
            }
        }
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("MagicalCheckBoxViewModelSnapRotationEnabled - Dealloc")
        }
    }
}
