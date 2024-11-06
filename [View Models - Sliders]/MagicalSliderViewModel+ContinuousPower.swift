//
//  MagicalSliderViewModel+ContinuousPower.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/30/24.
//

import Foundation

@Observable class MagicalSliderViewModelContinuousPower: MagicalSliderViewModel {
    
    override func refresh() {
        
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                
                if jiggleViewModel.getContinuousDraggingStatus() {
                    refreshDisabled(value: selectedJiggle.continuousPower)
                    return
                }
                
                if jiggleViewModel.isSliderActiveBesides(thisSlider: .sliderContinuousPower) {
                    refreshDisabled(value: selectedJiggle.continuousPower)
                } else {
                    refreshEnabled(value: selectedJiggle.continuousPower)
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
            jiggleViewModel.notifySliderStartedContinuousPower(value: value)
        }
    }
    
    override func handleSlideUpdated(percent: CGFloat) {
       
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            let value = sliderConfiguration.minimumValue + (sliderConfiguration.maximumValue - sliderConfiguration.minimumValue) * Float(percent)
            if jiggleViewModel.isAnimationContinuousAppliedToAll {
                let jiggleDocument = jiggleViewModel.jiggleDocument
                for jiggleIndex in 0..<jiggleDocument.jiggleCount {
                    let jiggle = jiggleDocument.jiggles[jiggleIndex]
                    jiggle.continuousPower = value
                }
            } else {
                if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                    selectedJiggle.continuousPower = value
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
                    jiggle.continuousPower = value
                }
            } else {
                if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                    selectedJiggle.continuousPower = value
                }
            }
            jiggleViewModel.notifySliderFinishedContinuousPower(value: value)
        }
    }
    
}
