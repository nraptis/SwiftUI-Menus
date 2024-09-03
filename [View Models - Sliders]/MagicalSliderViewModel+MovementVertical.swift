//
//  MagicalSliderViewModel+MovementVertical.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 6/24/24.
//

import Foundation

@Observable class MagicalSliderViewModelMovementVertical: MagicalSliderViewModel {
    
    override func refresh() {
        /*
        if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
            refreshEnabled(value: selectedJiggle.bouncePower)
        } else {
            refreshDisabled()
        }
        */
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("MagicalSlider MovementVertical - Dealloc")
        }
    }
    
    override func handleSlideStarted(percent: CGFloat) {
        super.handleSlideStarted(percent: percent)
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            let value = sliderConfiguration.minimumValue + (sliderConfiguration.maximumValue - sliderConfiguration.minimumValue) * Float(percent)
            jiggleViewModel.notifySliderStartedMovementVertical(value: value)
        }
    }
    
    override func handleSlideUpdated(percent: CGFloat) {
        let value = sliderConfiguration.minimumValue + (sliderConfiguration.maximumValue - sliderConfiguration.minimumValue) * Float(percent)
        /*
        if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
            
            selectedJiggle.bouncePower = value
        }
        */
        super.handleSlideUpdated(percent: percent)
    }
    
    override func handleSlideFinished(percent: CGFloat) {
        super.handleSlideFinished(percent: percent)
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            let value = sliderConfiguration.minimumValue + (sliderConfiguration.maximumValue - sliderConfiguration.minimumValue) * Float(percent)
            /*
             
             if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
             selectedJiggle.bouncePower = value
             }
             
             */
            jiggleViewModel.notifySliderFinishedMovementVertical(value: value)
        }
    }
}
