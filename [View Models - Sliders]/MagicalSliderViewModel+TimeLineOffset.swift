//
//  MagicalSliderViewModel+TimeLineOffset.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/24/24.
//

import Foundation

@Observable class MagicalSliderViewModelTimeLineOffset: MagicalSliderViewModel {
    
    override func refresh() {
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                refreshEnabled(value: selectedJiggle.timeLine.selectedSwatch.timeOffset)
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
            jiggleViewModel.notifySliderStartedTimeLineDuration(value: value)
        }
    }
    
    override func handleSlideUpdated(percent: CGFloat) {
        let value = sliderConfiguration.minimumValue + (sliderConfiguration.maximumValue - sliderConfiguration.minimumValue) * Float(percent)
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                if jiggleViewModel.isAnimationBounceAppliedToAll {
                    let jiggleDocument = jiggleViewModel.jiggleDocument
                    switch selectedJiggle.timeLine.selectedSwatch.swatch {
                    case .x:
                        for jiggleIndex in 0..<jiggleDocument.jiggleCount {
                            let jiggle = jiggleDocument.jiggles[jiggleIndex]
                            jiggle.timeLine.swatchPositionX.timeOffset = value
                        }
                    case .y:
                        for jiggleIndex in 0..<jiggleDocument.jiggleCount {
                            let jiggle = jiggleDocument.jiggles[jiggleIndex]
                            jiggle.timeLine.swatchPositionY.timeOffset = value
                        }
                    case .scale:
                        for jiggleIndex in 0..<jiggleDocument.jiggleCount {
                            let jiggle = jiggleDocument.jiggles[jiggleIndex]
                            jiggle.timeLine.swatchScale.timeOffset = value
                        }
                    case .rotation:
                        for jiggleIndex in 0..<jiggleDocument.jiggleCount {
                            let jiggle = jiggleDocument.jiggles[jiggleIndex]
                            jiggle.timeLine.swatchRotation.timeOffset = value
                        }
                    }
                } else {
                    selectedJiggle.timeLine.selectedSwatch.timeOffset = value
                }
            }
        }
        super.handleSlideUpdated(percent: percent)
    }
    
    override func handleSlideFinished(percent: CGFloat) {
        super.handleSlideFinished(percent: percent)
        let value = sliderConfiguration.minimumValue + (sliderConfiguration.maximumValue - sliderConfiguration.minimumValue) * Float(percent)
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                if jiggleViewModel.isAnimationBounceAppliedToAll {
                    let jiggleDocument = jiggleViewModel.jiggleDocument
                    switch selectedJiggle.timeLine.selectedSwatch.swatch {
                    case .x:
                        for jiggleIndex in 0..<jiggleDocument.jiggleCount {
                            let jiggle = jiggleDocument.jiggles[jiggleIndex]
                            jiggle.timeLine.swatchPositionX.timeOffset = value
                        }
                    case .y:
                        for jiggleIndex in 0..<jiggleDocument.jiggleCount {
                            let jiggle = jiggleDocument.jiggles[jiggleIndex]
                            jiggle.timeLine.swatchPositionY.timeOffset = value
                        }
                    case .scale:
                        for jiggleIndex in 0..<jiggleDocument.jiggleCount {
                            let jiggle = jiggleDocument.jiggles[jiggleIndex]
                            jiggle.timeLine.swatchScale.timeOffset = value
                        }
                    case .rotation:
                        for jiggleIndex in 0..<jiggleDocument.jiggleCount {
                            let jiggle = jiggleDocument.jiggles[jiggleIndex]
                            jiggle.timeLine.swatchRotation.timeOffset = value
                        }
                    }
                } else {
                    selectedJiggle.timeLine.selectedSwatch.timeOffset = value
                }
            }
            jiggleViewModel.notifySliderFinishedTimeLineDuration(value: value)
        }
    }
    
    
    
}
