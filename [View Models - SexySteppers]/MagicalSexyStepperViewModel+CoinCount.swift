//
//  MagicalSexyStepperViewModel+CoinCount.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/7/24.
//

import Foundation


@Observable class MagicalSexyStepperViewModelCoinCount: MagicalSexyStepperViewModel {
    
    override func handleIncrement() {
        print("MagicalSexyStepperViewModel => handleIncrement()")
        if let toolInterfaceViewModel = ApplicationController.shared.toolInterfaceViewModel {
            refresh()
        }
    }
    
    override func handleDecrement() {
        print("MagicalSexyStepperViewModel => handleDecrement()")
        if let toolInterfaceViewModel = ApplicationController.shared.toolInterfaceViewModel {
            refresh()
        }
    }
    
    override func refresh() {
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                let selectedSwatch = selectedJiggle.timeLine.selectedSwatch

                refreshEnabled()
                refreshDecrementEnabled(true)
                
                refreshIncrementEnabled(false)
                
            } else {
                refreshDisabled()
                refreshDecrementEnabled(true)
                
                refreshIncrementEnabled(false)
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
