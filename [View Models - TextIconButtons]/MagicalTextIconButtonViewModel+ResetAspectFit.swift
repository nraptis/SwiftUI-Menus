//
//  MagicalSexyButtonViewModel+ResetAspectFit.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/2/24.
//

import Foundation

@Observable class MagicalSexyButtonViewModelResetAspectFit: MagicalSexyButtonViewModel {
    
    override func handleClicked() {
        if let imageImportViewController = ApplicationController.shared.imageImportViewController {
            imageImportViewController.clickResetAspectFit()
        }
    }
    
    override func refresh() {
        super.refresh()
        
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[Deinit] MagicalSexyButtonViewModelResetAspectFit (Dealloc)")
        }
    }
}
