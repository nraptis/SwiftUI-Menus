//
//  MagicalSegmentedPickerViewModel+EditMode.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/25/24.
//

import Foundation

@Observable class MagicalSegmentedPickerViewModelEditMode: MagicalSegmentedPickerViewModel {
    
    override func refresh() {
        
        if let jiggleDocument = ApplicationController.shared.jiggleDocument {
            switch jiggleDocument.editMode {
            case .jiggles:
                selectedSegmentIndex = 0
            case .points:
                selectedSegmentIndex = 1
            }
        }
        
        if !isEnabled {
            isEnabled = true
        }
        
    }
    
    override func handleSelectedIndex(_ index: Int) {
        if let jiggleViewController = ApplicationController.shared.jiggleViewController {
            if index == 0 { jiggleViewController.set(editMode: .jiggles) }
            if index == 1 { jiggleViewController.set(editMode: .points) }
        }
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("MagicalSegmentedPickerViewModelEditMode - Dealloc")
        }
    }
}
