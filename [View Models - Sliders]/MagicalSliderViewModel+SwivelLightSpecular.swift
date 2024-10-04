//
//  MagicalSliderViewModel+SwivelLightSpecular.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 6/24/24.
//

import Foundation

@Observable class MagicalSliderViewModelSwivelLightSpecular: MagicalSliderViewModel {
    
    override func refresh() {
        
        //refreshEnabled(value: DOWNSTEP)
        
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                refreshEnabled(value: selectedJiggle.bouncePowerAmount)
            } else {
                refreshDisabled()
            }
        }
        
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("MagicalSlider SwivelLightSpecular - Dealloc")
        }
    }
    
    override func handleSlideStarted(percent: CGFloat) {
        super.handleSlideStarted(percent: percent)
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            let value = sliderConfiguration.minimumValue + (sliderConfiguration.maximumValue - sliderConfiguration.minimumValue) * Float(percent)
            jiggleViewModel.notifySliderStartedSwivelLightSpecular(value: value)
        }
    }
    
    override func handleSlideUpdated(percent: CGFloat) {
        let value = sliderConfiguration.minimumValue + (sliderConfiguration.maximumValue - sliderConfiguration.minimumValue) * Float(percent)
        
        //DOWNSTEP = value
        
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
            jiggleViewModel.notifySliderFinishedSwivelLightSpecular(value: value)
        }
    }
}
