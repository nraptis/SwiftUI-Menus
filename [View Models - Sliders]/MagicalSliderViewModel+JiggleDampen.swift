//
//  MagicalSliderViewModel+JiggleDampen.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/23/24.
//

import Foundation

@Observable class MagicalSliderViewModelJiggleDampen: MagicalSliderViewModel {
    
    override func refresh() {
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                refreshEnabled(value: selectedJiggle.jiggleDampenAmount)
            } else {
                refreshDisabled()
            }
        }
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("MagicalSlider JiggleDampen - Dealloc")
        }
    }
    
    override func handleSlideStarted(percent: CGFloat) {
        super.handleSlideStarted(percent: percent)
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            let value = sliderConfiguration.minimumValue + (sliderConfiguration.maximumValue - sliderConfiguration.minimumValue) * Float(percent)
            jiggleViewModel.notifySliderStartedJiggleDampen(value: value)
        }
    }
    
    override func handleSlideUpdated(percent: CGFloat) {
        let value = sliderConfiguration.minimumValue + (sliderConfiguration.maximumValue - sliderConfiguration.minimumValue) * Float(percent)
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            if jiggleViewModel.isAnimationJiggleAppliedToAll {
                let jiggleDocument = jiggleViewModel.jiggleDocument
                for jiggleIndex in 0..<jiggleDocument.jiggleCount {
                    let jiggle = jiggleDocument.jiggles[jiggleIndex]
                    jiggle.jiggleDampenAmount = value
                }
            } else {
                if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                    selectedJiggle.jiggleDampenAmount = value
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
                if jiggleViewModel.isAnimationJiggleAppliedToAll {
                    
                    let jiggleDocument = jiggleViewModel.jiggleDocument
                    for jiggleIndex in 0..<jiggleDocument.jiggleCount {
                        let jiggle = jiggleDocument.jiggles[jiggleIndex]
                        jiggle.jiggleDampenAmount = value
                    }
                    
                } else {
                    if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                        selectedJiggle.jiggleDampenAmount = value
                    }
                }
            }
            jiggleViewModel.notifySliderFinishedJiggleDampen(value: value)
        }
    }
}
