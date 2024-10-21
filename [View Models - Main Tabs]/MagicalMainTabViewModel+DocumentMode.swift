//
//  MagicalMainTabViewModel+DocumentMode.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/24/24.
//

import Foundation

@Observable class MagicalMainTabViewModelDocumentMode: MagicalMainTabViewModel {
    
    override func refresh() {
        
        if let jiggleDocument = ApplicationController.shared.jiggleDocument {
            switch jiggleDocument.documentMode {
            case .view:
                selectedSegmentIndex = 0
            case .edit:
                selectedSegmentIndex = 1
            }
        }
        
        if !isEnabled {
            isEnabled = true
        }
    }
    
    override func handleSelectedIndex(_ index: Int) {
        if let jiggleViewController = ApplicationController.shared.jiggleViewController {
            if index == 0 { jiggleViewController.set(documentMode: .view) }
            if index == 1 { jiggleViewController.set(documentMode: .edit) }
        }
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("MagicalMainTabViewModelDocumentMode - Dealloc")
        }
    }
}
