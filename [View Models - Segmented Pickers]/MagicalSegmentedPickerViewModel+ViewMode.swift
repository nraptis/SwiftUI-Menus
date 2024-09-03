//
//  MagicalSegmentedPickerViewModel+ViewMode.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/11/24.
//

import Foundation

@Observable class MagicalSegmentedPickerViewModelViewMode: MagicalSegmentedPickerViewModel {
    
    override func handleSelectedIndex(_ index: Int) {
        print("MagicalSegmentedPickerViewModelViewMode ===> handleSelectedIndex(\(index))")
        
        if let jiggleViewController = ApplicationController.shared.jiggleViewController {
            if index == 0 { jiggleViewController.set(viewMode: .standard) }
            if index == 1 { jiggleViewController.set(viewMode: .loops) }
        }
    }
    
    override func refresh() {
        if let jiggleDocument = ApplicationController.shared.jiggleDocument {
            switch jiggleDocument.viewMode {
            case .standard:
                selectedSegmentIndex = 0
            case .loops:
                selectedSegmentIndex = 1
            }
        }
    }
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("MagicalSegmentedPickerViewModelViewMode - Dealloc")
        }
    }
}
