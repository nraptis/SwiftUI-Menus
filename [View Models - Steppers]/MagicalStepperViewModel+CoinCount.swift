//
//  MagicalStepperViewModel+CoinCount.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/7/24.
//

import Foundation


@Observable class MagicalStepperViewModelCoinCount: MagicalStepperViewModel {
    
    override func handleIncrement() {
        print("MagicalStepperViewModel => handleIncrement()")
        if let toolInterfaceViewModel = ApplicationController.shared.toolInterfaceViewModel {
            refresh()
        }
    }
    
    override func handleDecrement() {
        print("MagicalStepperViewModel => handleDecrement()")
        refresh()
    }
    
    override func refresh() {
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                
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
