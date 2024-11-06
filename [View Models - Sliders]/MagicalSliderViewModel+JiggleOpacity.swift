//
//  MagicalSliderViewModel+JiggleOpacity.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/21/24.
//

import Foundation

@Observable class MagicalSliderViewModelJiggleOpacity: MagicalSliderViewModel {
    
    override func refresh() {
        refreshEnabled(value: ApplicationController.jiggleOpacity)
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("MagicalSlider JiggleOpacity - Dealloc")
        }
    }
    
    override func handleSlideStarted(percent: CGFloat) {
        super.handleSlideStarted(percent: percent)
    }
    
    override func handleSlideUpdated(percent: CGFloat) {
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            let value = sliderConfiguration.minimumValue + (sliderConfiguration.maximumValue - sliderConfiguration.minimumValue) * Float(percent)
            jiggleViewModel.setJiggleOpacity(value)
        }
        super.handleSlideUpdated(percent: percent)
    }
    
    override func handleSlideFinished(percent: CGFloat) {
        super.handleSlideFinished(percent: percent)
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            let value = sliderConfiguration.minimumValue + (sliderConfiguration.maximumValue - sliderConfiguration.minimumValue) * Float(percent)
            jiggleViewModel.setJiggleOpacity(value)
        }
        ApplicationController.shared.configSave()
    }
}
