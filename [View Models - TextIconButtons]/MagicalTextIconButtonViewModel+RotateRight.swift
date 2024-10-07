//
//  MagicalSexyButtonViewModel+RotateRight.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/1/24.
//

import Foundation

@Observable class MagicalSexyButtonViewModelRotateRight: MagicalSexyButtonViewModel {
    
    override func handleClicked() {
        if let imageImportViewController = ApplicationController.shared.imageImportViewController {
            imageImportViewController.clickRotateRight()
        }
    }
    
    override func refresh() {
        super.refresh()
        
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[Deinit] MagicalSexyButtonViewModelRotateRight (Dealloc)")
        }
    }
}
