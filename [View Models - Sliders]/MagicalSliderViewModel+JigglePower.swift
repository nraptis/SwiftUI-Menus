//
//  MagicalSliderViewModel+JigglePower.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 6/24/24.
//

import Foundation

@Observable class MagicalSliderViewModelJigglePower: MagicalSliderViewModel {
    
    override func refresh() {
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                refreshEnabled(value: selectedJiggle.jigglePowerAmount)
            } else {
                refreshDisabled()
            }
        }
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("MagicalSlider JigglePower - Dealloc")
        }
    }
    
    override func handleSlideStarted(percent: CGFloat) {
        super.handleSlideStarted(percent: percent)
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            let value = sliderConfiguration.minimumValue + (sliderConfiguration.maximumValue - sliderConfiguration.minimumValue) * Float(percent)
            jiggleViewModel.notifySliderStartedJigglePower(value: value)
        }
    }
    
    override func handleSlideUpdated(percent: CGFloat) {
        let value = sliderConfiguration.minimumValue + (sliderConfiguration.maximumValue - sliderConfiguration.minimumValue) * Float(percent)
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            if jiggleViewModel.isAnimationGrabAppliedToAll {
                let jiggleDocument = jiggleViewModel.jiggleDocument
                for jiggleIndex in 0..<jiggleDocument.jiggleCount {
                    let jiggle = jiggleDocument.jiggles[jiggleIndex]
                    jiggle.jigglePowerAmount = value
                }
            } else {
                if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                    selectedJiggle.jigglePowerAmount = value
                }
            }
        }
        super.handleSlideUpdated(percent: percent)
    }
    
    override func handleSlideFinished(percent: CGFloat) {
        super.handleSlideFinished(percent: percent)
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            let value = sliderConfiguration.minimumValue + (sliderConfiguration.maximumValue - sliderConfiguration.minimumValue) * Float(percent)
            if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
                if jiggleViewModel.isAnimationGrabAppliedToAll {
                    
                    let jiggleDocument = jiggleViewModel.jiggleDocument
                    for jiggleIndex in 0..<jiggleDocument.jiggleCount {
                        let jiggle = jiggleDocument.jiggles[jiggleIndex]
                        jiggle.jigglePowerAmount = value
                    }
                    
                } else {
                    if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                        selectedJiggle.jigglePowerAmount = value
                    }
                }
            }
            jiggleViewModel.notifySliderFinishedJigglePower(value: value)
        }
    }
}
