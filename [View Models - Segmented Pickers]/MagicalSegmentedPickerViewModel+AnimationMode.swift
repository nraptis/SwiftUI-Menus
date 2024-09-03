//
//  MagicalSegmentedPickerViewModel+AnimationMode.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/7/24.
//

import Foundation

@Observable class MagicalSegmentedPickerViewModelAnimationMode: MagicalSegmentedPickerViewModel {
    
    override func handleSelectedIndex(_ index: Int) {
        print("MagicalSegmentedPickerViewModelAnimationMode ===> handleSelectedIndex(\(index))")
        
        if let jiggleViewController = ApplicationController.shared.jiggleViewController {
            if index == 0 { jiggleViewController.set(animationMode: .bounce) }
            if index == 1 { jiggleViewController.set(animationMode: .wobble) }
            if index == 2 { jiggleViewController.set(animationMode: .twist) }
        }
    }
    
    override func refresh() {
        if let jiggleDocument = ApplicationController.shared.jiggleDocument {
            switch jiggleDocument.animationMode {
            case .bounce:
                selectedSegmentIndex = 0
            case .wobble:
                selectedSegmentIndex = 1
            case .twist:
                selectedSegmentIndex = 2
            }
        }
    }
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("MagicalSegmentedPickerViewModelAnimationMode - Dealloc")
        }
    }
}
