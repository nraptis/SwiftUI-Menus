//
//  MagicalSliderViewModel+ContinuousEndScale.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/30/24.
//

import Foundation

@Observable class MagicalSliderViewModelContinuousEndScale: MagicalSliderViewModel {
    
    override func refresh() {
        
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                
                if jiggleViewModel.getContinuousDraggingStatus() {
                    refreshDisabled(value: selectedJiggle.continuousEndScale)
                    return
                }
                
                if jiggleViewModel.isSliderActiveBesides(thisSlider: .sliderContinuousEndScale) {
                    refreshDisabled(value: selectedJiggle.continuousEndScale)
                } else {
                    refreshEnabled(value: selectedJiggle.continuousEndScale)
                }
            } else {
                refreshDisabled()
            }
        }
        
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("MagicalSlider ContinuousEndScale - Dealloc")
        }
    }
    
    override func handleSlideStarted(percent: CGFloat) {
        super.handleSlideStarted(percent: percent)
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            let value = sliderConfiguration.minimumValue + (sliderConfiguration.maximumValue - sliderConfiguration.minimumValue) * Float(percent)
            jiggleViewModel.notifySliderStartedContinuousEndScale(value: value)
        }
    }
    
    override func handleSlideUpdated(percent: CGFloat) {
       
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            let value = sliderConfiguration.minimumValue + (sliderConfiguration.maximumValue - sliderConfiguration.minimumValue) * Float(percent)
            if jiggleViewModel.isAnimationContinuousAppliedToAll {
                let jiggleDocument = jiggleViewModel.jiggleDocument
                for jiggleIndex in 0..<jiggleDocument.jiggleCount {
                    let jiggle = jiggleDocument.jiggles[jiggleIndex]
                    jiggle.continuousEndScale = value
                }
            } else {
                if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                    selectedJiggle.continuousEndScale = value
                }
            }
        }
        super.handleSlideUpdated(percent: percent)
    }
    
    override func handleSlideFinished(percent: CGFloat) {
        super.handleSlideFinished(percent: percent)
        
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            let value = sliderConfiguration.minimumValue + (sliderConfiguration.maximumValue - sliderConfiguration.minimumValue) * Float(percent)
            if jiggleViewModel.isAnimationContinuousAppliedToAll {
                let jiggleDocument = jiggleViewModel.jiggleDocument
                for jiggleIndex in 0..<jiggleDocument.jiggleCount {
                    let jiggle = jiggleDocument.jiggles[jiggleIndex]
                    jiggle.continuousEndScale = value
                }
            } else {
                if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                    selectedJiggle.continuousEndScale = value
                }
            }
            jiggleViewModel.notifySliderFinishedContinuousEndScale(value: value)
        }
    }
    
}
