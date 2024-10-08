//
//  MagicalSegmentedPickerViewModel+AnimationMode.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/7/24.
//

import Foundation

@Observable class MagicalSegmentedPickerViewModelAnimationMode: MagicalSegmentedPickerViewModel {
        
    override func refresh() {
        if let jiggleDocument = ApplicationController.shared.jiggleDocument {
            /*
            switch jiggleDocument.animationMode {
            case .bounce:
                selectedSegmentIndex = 0
            case .wobble:
                selectedSegmentIndex = 1
            case .twist:
                selectedSegmentIndex = 2
            }
            */
        }
    }
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("MagicalSegmentedPickerViewModelAnimationMode - Dealloc")
        }
    }
}
