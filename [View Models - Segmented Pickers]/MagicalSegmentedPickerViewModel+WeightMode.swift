//
//  MagicalSegmentedPickerViewModel+WeightMode.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/7/24.
//

import Foundation

@Observable class MagicalSegmentedPickerViewModelWeightMode: MagicalSegmentedPickerViewModel {
    
    override func handleSelectedIndex(_ index: Int) {
        if let jiggleViewController = ApplicationController.shared.jiggleViewController {
            if index == 0 { jiggleViewController.set(weightMode: .affine) }
            if index == 1 { jiggleViewController.set(weightMode: .points) }
        }
    }
    
    override func refresh() {
        if let jiggleDocument = ApplicationController.shared.jiggleDocument {
            switch jiggleDocument.weightMode {
            case .affine:
                selectedSegmentIndex = 0
            case .points:
                selectedSegmentIndex = 1
            }
        }
    }
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("MagicalSegmentedPickerViewModelWeightMode - Dealloc")
        }
    }
}
