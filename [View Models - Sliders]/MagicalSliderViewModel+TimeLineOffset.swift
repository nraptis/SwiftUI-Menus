//
//  MagicalSliderViewModel+TimeLineFrameOffset.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/24/24.
//

import Foundation

@Observable class MagicalSliderViewModelTimeLineFrameOffset: MagicalSliderViewModel {
    
    override func refresh() {
        
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                let selectedSwatch = selectedJiggle.timeLine.getSelectedSwatch(swatch: jiggleViewModel.timeLineSelectedSwatch)
                
                if jiggleViewModel.getTimeLineDraggingStatus() {
                    refreshDisabled(value: selectedSwatch.frameOffset)
                    return
                }
                
                if jiggleViewModel.isSliderActiveBesides(thisSlider: .sliderTimeLineFrameOffset) {
                    refreshDisabled(value: selectedSwatch.frameOffset)
                    return
                }
                
                refreshEnabled(value: selectedSwatch.frameOffset)
                
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
            jiggleViewModel.notifySliderStartedTimeLineFrameOffset(value: value)
        }
    }
    
    override func handleSlideUpdated(percent: CGFloat) {
        let value = sliderConfiguration.minimumValue + (sliderConfiguration.maximumValue - sliderConfiguration.minimumValue) * Float(percent)
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                if jiggleViewModel.isAnimationLoopsAppliedToAll {
                    let jiggleDocument = jiggleViewModel.jiggleDocument
                    
                    switch jiggleViewModel.timeLineSelectedSwatch {
                    case .x:
                        for jiggleIndex in 0..<jiggleDocument.jiggleCount {
                            let jiggle = jiggleDocument.jiggles[jiggleIndex]
                            jiggle.timeLine.swatchPositionX.frameOffset = value
                        }
                    case .y:
                        for jiggleIndex in 0..<jiggleDocument.jiggleCount {
                            let jiggle = jiggleDocument.jiggles[jiggleIndex]
                            jiggle.timeLine.swatchPositionY.frameOffset = value
                        }
                    case .scale:
                        for jiggleIndex in 0..<jiggleDocument.jiggleCount {
                            let jiggle = jiggleDocument.jiggles[jiggleIndex]
                            jiggle.timeLine.swatchScale.frameOffset = value
                        }
                    case .rotation:
                        for jiggleIndex in 0..<jiggleDocument.jiggleCount {
                            let jiggle = jiggleDocument.jiggles[jiggleIndex]
                            jiggle.timeLine.swatchRotation.frameOffset = value
                        }
                    }
                } else {
                    let selectedSwatch = selectedJiggle.timeLine.getSelectedSwatch(swatch: jiggleViewModel.timeLineSelectedSwatch)
                    selectedSwatch.frameOffset = value
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
                if jiggleViewModel.isAnimationLoopsAppliedToAll {
                    let jiggleDocument = jiggleViewModel.jiggleDocument
                    switch jiggleViewModel.timeLineSelectedSwatch {
                    case .x:
                        for jiggleIndex in 0..<jiggleDocument.jiggleCount {
                            let jiggle = jiggleDocument.jiggles[jiggleIndex]
                            jiggle.timeLine.swatchPositionX.frameOffset = value
                        }
                    case .y:
                        for jiggleIndex in 0..<jiggleDocument.jiggleCount {
                            let jiggle = jiggleDocument.jiggles[jiggleIndex]
                            jiggle.timeLine.swatchPositionY.frameOffset = value
                        }
                    case .scale:
                        for jiggleIndex in 0..<jiggleDocument.jiggleCount {
                            let jiggle = jiggleDocument.jiggles[jiggleIndex]
                            jiggle.timeLine.swatchScale.frameOffset = value
                        }
                    case .rotation:
                        for jiggleIndex in 0..<jiggleDocument.jiggleCount {
                            let jiggle = jiggleDocument.jiggles[jiggleIndex]
                            jiggle.timeLine.swatchRotation.frameOffset = value
                        }
                    }
                } else {
                    let selectedSwatch = selectedJiggle.timeLine.getSelectedSwatch(swatch: jiggleViewModel.timeLineSelectedSwatch)
                    selectedSwatch.frameOffset = value
                }
            }
            jiggleViewModel.notifySliderFinishedTimeLineFrameOffset(value: value)
            
        }
    }
}
