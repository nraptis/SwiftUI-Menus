//
//  MagicalSexyButtonViewModel+ResetAspectFill.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/2/24.
//

import Foundation

@Observable class MagicalSexyButtonViewModelResetAspectFill: MagicalSexyButtonViewModel {
    
    override func handleClicked() {
        if let imageImportViewController = ApplicationController.shared.imageImportViewController {
            imageImportViewController.clickResetAspectFill()
        }
    }
    
    override func refresh() {
        super.refresh()
        
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[Deinit] MagicalSexyButtonViewModelResetAspectFill (Dealloc)")
        }
    }
}
