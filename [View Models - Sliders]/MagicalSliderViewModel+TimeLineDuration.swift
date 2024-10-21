//
//  MagicalSliderViewModel+TimelineDuration.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/17/24.
//

import Foundation

@Observable class MagicalSliderViewModelTimeLineDuration: MagicalSliderViewModel {
    
    override func refresh() {
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                refreshEnabled(value: selectedJiggle.timeLine.animationDuration)
            } else {
                refreshDisabled()
            }
        }
        
        //minimumValue: AnimationInstructionLoops.minTime,
        //maximumValue: AnimationInstructionLoops.maxTime,
        
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
            jiggleViewModel.notifySliderStartedTimeLineOffset(value: value)
        }
    }
    
    override func handleSlideUpdated(percent: CGFloat) {
        let value = sliderConfiguration.minimumValue + (sliderConfiguration.maximumValue - sliderConfiguration.minimumValue) * Float(percent)
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            if jiggleViewModel.isAnimationLoopsAppliedToAll {
                let jiggleDocument = jiggleViewModel.jiggleDocument
                for jiggleIndex in 0..<jiggleDocument.jiggleCount {
                    let jiggle = jiggleDocument.jiggles[jiggleIndex]
                    jiggle.timeLine.animationDuration = value
                }
            } else {
                if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                    selectedJiggle.timeLine.animationDuration = value
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
                if jiggleViewModel.isAnimationLoopsAppliedToAll {
                    
                    let jiggleDocument = jiggleViewModel.jiggleDocument
                    for jiggleIndex in 0..<jiggleDocument.jiggleCount {
                        let jiggle = jiggleDocument.jiggles[jiggleIndex]
                        jiggle.timeLine.animationDuration = value
                    }
                    
                } else {
                    if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                        selectedJiggle.timeLine.animationDuration = value
                    }
                }
            }
            jiggleViewModel.notifySliderFinishedTimeLineOffset(value: value)
        }
    }
    
}
