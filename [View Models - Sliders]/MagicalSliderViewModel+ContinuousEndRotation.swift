//
//  MagicalSliderViewModel+ContinuousEndRotation.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/30/24.
//

import Foundation

@Observable class MagicalSliderViewModelContinuousEndRotation: MagicalSliderViewModel {
    
    override func refresh() {
        
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                
                if jiggleViewModel.getContinuousDraggingStatus() {
                    refreshDisabled(value: selectedJiggle.continuousEndRotation)
                    return
                }
                
                if jiggleViewModel.isSliderActiveBesides(thisSlider: .sliderContinuousEndRotation) {
                    refreshDisabled(value: selectedJiggle.continuousEndRotation)
                } else {
                    refreshEnabled(value: selectedJiggle.continuousEndRotation)
                }
            } else {
                refreshDisabled()
            }
        }
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("MagicalSlider ContinuousEndRotation - Dealloc")
        }
    }
    
    override func handleSlideStarted(percent: CGFloat) {
        super.handleSlideStarted(percent: percent)
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            let value = sliderConfiguration.minimumValue + (sliderConfiguration.maximumValue - sliderConfiguration.minimumValue) * Float(percent)
            jiggleViewModel.notifySliderStartedContinuousEndRotation(value: value)
        }
    }
    
    override func handleSlideUpdated(percent: CGFloat) {
       
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            let value = sliderConfiguration.minimumValue + (sliderConfiguration.maximumValue - sliderConfiguration.minimumValue) * Float(percent)
            if jiggleViewModel.isAnimationContinuousAppliedToAll {
                let jiggleDocument = jiggleViewModel.jiggleDocument
                for jiggleIndex in 0..<jiggleDocument.jiggleCount {
                    let jiggle = jiggleDocument.jiggles[jiggleIndex]
                    jiggle.continuousEndRotation = value
                }
            } else {
                if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                    selectedJiggle.continuousEndRotation = value
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
                    jiggle.continuousEndRotation = value
                }
            } else {
                if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                    selectedJiggle.continuousEndRotation = value
                }
            }
            jiggleViewModel.notifySliderFinishedContinuousEndRotation(value: value)
        }
    }
    
}