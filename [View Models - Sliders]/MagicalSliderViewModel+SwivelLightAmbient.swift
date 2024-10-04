//
//  MagicalSliderViewModel+SwivelLightAmbient.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 6/24/24.
//

import Foundation

@Observable class MagicalSliderViewModelSwivelLightAmbient: MagicalSliderViewModel {
    
    override func refresh() {
        
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                refreshEnabled(value: selectedJiggle.bouncePowerAmount)
            } else {
                refreshDisabled()
            }
        }
        
        //refreshEnabled(value: DAMP)
        
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("MagicalSlider SwivelLightAmbient - Dealloc")
        }
    }
    
    override func handleSlideStarted(percent: CGFloat) {
        super.handleSlideStarted(percent: percent)
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            let value = sliderConfiguration.minimumValue + (sliderConfiguration.maximumValue - sliderConfiguration.minimumValue) * Float(percent)
            jiggleViewModel.notifySliderStartedSwivelLightAmbient(value: value)
        }
    }
    
    
    
    override func handleSlideUpdated(percent: CGFloat) {
        let value = sliderConfiguration.minimumValue + (sliderConfiguration.maximumValue - sliderConfiguration.minimumValue) * Float(percent)
        
        //DAMP = value
        
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
            
            //DAMP = DAMP_MIN + (DAMP_MAX - DAMP_MIN) * Float(percent)
            
            
            jiggleViewModel.notifySliderFinishedSwivelLightAmbient(value: value)
        }
    }
}
