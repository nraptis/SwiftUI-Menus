//
//  MagicalSexyButtonViewModel+ImageImportBack.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/2/24.
//

import Foundation

@Observable class MagicalSexyButtonViewModelImageImportBack: MagicalSexyButtonViewModel {
    
    override func handleClicked() {
        ApplicationController.rootViewModel.pushToMainMenu(animated: true, reversed: true)
    }
    
    override func refresh() {
        super.refresh()
        
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[Deinit] MagicalSexyButtonViewModelImageImportBack (Dealloc)")
        }
    }
}
