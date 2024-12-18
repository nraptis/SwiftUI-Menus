//
//  MagicalStepperViewModel+GemCount.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/7/24.
//

import Foundation


@Observable class MagicalStepperViewModelGemCount: MagicalStepperViewModel {
    
    override func handleIncrement() {
        print("MagicalStepperViewModel => handleIncrement()")
        if let toolInterfaceViewModel = ApplicationController.shared.toolInterfaceViewModel {
            refresh()
        }
    }
    
    override func handleDecrement() {
        print("MagicalStepperViewModel => handleDecrement()")
        if let toolInterfaceViewModel = ApplicationController.shared.toolInterfaceViewModel {
            refresh()
        }
    }
    
    override func refresh() {
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                
                refreshEnabled()
                refreshDecrementEnabled(false)
                
                refreshIncrementEnabled(true)
                
            } else {
                refreshDisabled()
                refreshDecrementEnabled(false)
                
                refreshIncrementEnabled(true)
            }
            valueString = "\(Int.random(in: 0...100))"
        }
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[Deinit] MagicalModeChangeViewModelGuidesEnter (Dealloc)")
        }
    }
}
