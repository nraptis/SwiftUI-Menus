//
//  MagicalMainTabViewModel+DocumentMode.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/24/24.
//

import Foundation

@Observable class MagicalMainTabViewModelDocumentMode: MagicalMainTabViewModel {
    
    override func refresh() {
        
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            if jiggleViewModel.jiggleDocument.isCreatePointsEnabled {
                refreshDisabled()
            } else {
                refreshEnabled()
            }
        }
        
        if let jiggleDocument = ApplicationController.shared.jiggleDocument {
            switch jiggleDocument.documentMode {
            case .__VIEW:
                selectedSegmentIndex = 0
            case .__EDIT:
                selectedSegmentIndex = 1
            }
        }
    }
    
    override func handleSelectedIndex(_ index: Int) {
        if let jiggleViewController = ApplicationController.shared.jiggleViewController {
            if index == 0 { jiggleViewController.set(documentMode: .__VIEW) }
            if index == 1 { jiggleViewController.set(documentMode: .__EDIT) }
        }
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("MagicalMainTabViewModelDocumentMode - Dealloc")
        }
    }
}
