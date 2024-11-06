//
//  MagicalSliderViewModel+ContinuousDuration.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/30/24.
//

import Foundation

@Observable class MagicalSliderViewModelContinuousDuration: MagicalSliderViewModel {
    
    override func refresh() {
        
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                
                if jiggleViewModel.getContinuousDraggingStatus() {
                    refreshDisabled(value: selectedJiggle.continuousDuration)
                    return
                }
                
                if jiggleViewModel.isSliderActiveBesides(thisSlider: .sliderContinuousDuration) {
                    refreshDisabled(value: selectedJiggle.continuousDuration)
                } else {
                    refreshEnabled(value: selectedJiggle.continuousDuration)
                }
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
            jiggleViewModel.notifySliderStartedContinuousDuration(value: value)
        }
    }
    
    override func handleSlideUpdated(percent: CGFloat) {
       
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            let value = sliderConfiguration.minimumValue + (sliderConfiguration.maximumValue - sliderConfiguration.minimumValue) * Float(percent)
            if jiggleViewModel.isAnimationContinuousAppliedToAll {
                let jiggleDocument = jiggleViewModel.jiggleDocument
                for jiggleIndex in 0..<jiggleDocument.jiggleCount {
                    let jiggle = jiggleDocument.jiggles[jiggleIndex]
                    jiggle.continuousDuration = value
                }
            } else {
                if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                    selectedJiggle.continuousDuration = value
                }
            }
            
            /*
            for jiggleIndex in 0..<jiggleViewModel.jiggleDocument.jiggleCount {
                let jiggle = jiggleViewModel.jiggleDocument.jiggles[jiggleIndex]
                jiggle.animationInstructionContinuous.continuousFrame = 0.0
            }
            */
            
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
                    jiggle.continuousDuration = value
                }
            } else {
                if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                    selectedJiggle.continuousDuration = value
                }
            }
            
            /*
            for jiggleIndex in 0..<jiggleViewModel.jiggleDocument.jiggleCount {
                let jiggle = jiggleViewModel.jiggleDocument.jiggles[jiggleIndex]
                jiggle.animationInstructionContinuous.continuousFrame = 0.0
            }
            */
            
            jiggleViewModel.notifySliderFinishedContinuousDuration(value: value)
        }
    }
    
}
