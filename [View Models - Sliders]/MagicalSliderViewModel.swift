//
//  MagicalSliderViewModel.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/21/24.
//

import Foundation
import SwiftUI

@Observable class MagicalSliderViewModel: MagicalViewModel {
    
    override class func getLayoutScheme() -> LayoutScheme.Type {
        SliderLayout.self
    }
    
    @MainActor var percent = CGFloat(0.0)
    @MainActor var thumbMinimumX: CGFloat = 0.0
    @MainActor var thumbMaximumX: CGFloat = 100.0
    @MainActor var thumbOffsetX = CGFloat(0.0)
    
    //@MainActor var valueLabelPaddingLeft = 0
    //@MainActor var valueLabelPaddingRight = 0
    
    //@MainActor var universalPaddingLeft = 0
    //@MainActor var universalPaddingRight = 0
    
    @MainActor var sliderBoxWidth = 0
    
    let sliderConfiguration: ToolInterfaceElementSliderConfiguration
    @MainActor init(orientation: Orientation,
                    sliderConfiguration: ToolInterfaceElementSliderConfiguration) {
        
        self.sliderConfiguration = sliderConfiguration
        super.init(orientation: orientation)
    }
    
    @MainActor func handleSlideStarted(percent: CGFloat) {
        self.percent = CGFloat(percent)
    }
    
    @MainActor func handleSlideUpdated(percent: CGFloat) {
        self.percent = percent
    }
    
    @MainActor func handleSlideFinished(percent: CGFloat) {
        self.percent = percent
    }
    
    @MainActor func refreshEnabled(value: Float) {
        let delta = (sliderConfiguration.maximumValue - sliderConfiguration.minimumValue)
        if delta > Math.epsilon {
            var _percent = CGFloat((value - sliderConfiguration.minimumValue) / delta)
            if _percent < 0.0 { _percent = 0.0 }
            if _percent > 1.0 { _percent = 1.0 }
            
            
            thumbOffsetX = thumbMinimumX + (thumbMaximumX - thumbMinimumX) * _percent
            percent = _percent
        }
        refreshEnabled()
    }
    
    @MainActor func getValueString() -> String {
        let value = sliderConfiguration.minimumValue + (sliderConfiguration.maximumValue - sliderConfiguration.minimumValue) * Float(percent)
        let formatString = "%.\(sliderConfiguration.valueDecimalCount)f"
        return String(format: formatString, value)
    }
    
    override func refreshLayoutFrame() {
        
        let layoutSchemeFlavor = getLayoutSchemeFlavor()
        
        let nameLabelTextWidth: Int
        let valueLabelTextWidth: Int
        switch layoutSchemeFlavor {
        case .long, .stackedLarge:
            nameLabelTextWidth = sliderConfiguration.layoutNameLabelWidthLarge
            valueLabelTextWidth = sliderConfiguration.valueLabelWidthLarge
        case .stackedMedium:
            nameLabelTextWidth = sliderConfiguration.layoutNameLabelWidthMedium
            valueLabelTextWidth = sliderConfiguration.valueLabelWidthMedium
        case .stackedSmall:
            nameLabelTextWidth = sliderConfiguration.layoutNameLabelWidthSmall
            valueLabelTextWidth = sliderConfiguration.valueLabelWidthSmall
        }
        
        let outsideBoxPaddingLeftSqueezed = SliderLayout.getOutsideBoxPaddingLeftLong(orientation: orientation,
                                                                                      squeeze: .squeezed,
                                                                                      neighborTypeLeft: neighborTypeLeft,
                                                                                      neighborTypeRight: neighborTypeRight)
        let outsideBoxPaddingLeftStandard = SliderLayout.getOutsideBoxPaddingLeftLong(orientation: orientation,
                                                                                      squeeze: .standard,
                                                                                      neighborTypeLeft: neighborTypeLeft,
                                                                                      neighborTypeRight: neighborTypeRight)
        let outsideBoxPaddingLeftRelaxed = SliderLayout.getOutsideBoxPaddingLeftLong(orientation: orientation,
                                                                                     squeeze: .relaxed,
                                                                                     neighborTypeLeft: neighborTypeLeft,
                                                                                     neighborTypeRight: neighborTypeRight)
        
        let outsideBoxPaddingRightSqueezed = SliderLayout.getOutsideBoxPaddingRightLong(orientation: orientation,
                                                                                        squeeze: .squeezed,
                                                                                        neighborTypeLeft: neighborTypeLeft,
                                                                                        neighborTypeRight: neighborTypeRight)
        let outsideBoxPaddingRightStandard = SliderLayout.getOutsideBoxPaddingRightLong(orientation: orientation,
                                                                                        squeeze: .standard,
                                                                                        neighborTypeLeft: neighborTypeLeft,
                                                                                        neighborTypeRight: neighborTypeRight)
        let outsideBoxPaddingRightRelaxed = SliderLayout.getOutsideBoxPaddingRightLong(orientation: orientation,
                                                                                       squeeze: .relaxed,
                                                                                       neighborTypeLeft: neighborTypeLeft,
                                                                                       neighborTypeRight: neighborTypeRight)
        
        var _outsideBoxPaddingLeft = outsideBoxPaddingLeftSqueezed
        var _outsideBoxPaddingRight = outsideBoxPaddingRightSqueezed
        
        let heroPaddingLeftSqueezed = SliderLayout.getHeroPaddingLeftLong(orientation: orientation,
                                                                          squeeze: .squeezed)
        let heroPaddingLeftStandard = SliderLayout.getHeroPaddingLeftLong(orientation: orientation,
                                                                          squeeze: .standard)
        let heroPaddingLeftRelaxed = SliderLayout.getHeroPaddingLeftLong(orientation: orientation,
                                                                         squeeze: .relaxed)
        
        let heroPaddingRightSqueezed = SliderLayout.getHeroPaddingRightLong(orientation: orientation,
                                                                            squeeze: .squeezed)
        let heroPaddingRightStandard = SliderLayout.getHeroPaddingRightLong(orientation: orientation,
                                                                            squeeze: .standard)
        let heroPaddingRightRelaxed = SliderLayout.getHeroPaddingRightLong(orientation: orientation,
                                                                           squeeze: .relaxed)
        
        var _heroPaddingLeft = heroPaddingLeftSqueezed
        var _heroPaddingRight = heroPaddingRightSqueezed
        
        let slavePaddingLeftSqueezed = SliderLayout.getSlavePaddingLeftLong(orientation: orientation,
                                                                            squeeze: .squeezed)
        let slavePaddingLeftStandard = SliderLayout.getSlavePaddingLeftLong(orientation: orientation,
                                                                            squeeze: .standard)
        let slavePaddingLeftRelaxed = SliderLayout.getSlavePaddingLeftLong(orientation: orientation,
                                                                           squeeze: .relaxed)
        
        let slavePaddingRightSqueezed = SliderLayout.getSlavePaddingRightLong(orientation: orientation,
                                                                              squeeze: .squeezed)
        let slavePaddingRightStandard = SliderLayout.getSlavePaddingRightLong(orientation: orientation,
                                                                              squeeze: .standard)
        let slavePaddingRightRelaxed = SliderLayout.getSlavePaddingRightLong(orientation: orientation,
                                                                             squeeze: .relaxed)
        
        var _slavePaddingLeft = slavePaddingLeftSqueezed
        var _slavePaddingRight = slavePaddingRightSqueezed
        
        
        var _sliderBoxWidth = 0
        
        let totalWidth = layoutWidth
        
        var consumed = 0
        consumed += outsideBoxPaddingLeftSqueezed
        consumed += outsideBoxPaddingRightSqueezed
        
        consumed += nameLabelTextWidth
        consumed += heroPaddingLeftSqueezed
        consumed += heroPaddingRightSqueezed
        
        consumed += valueLabelTextWidth
        consumed += slavePaddingLeftSqueezed
        consumed += slavePaddingRightSqueezed
        
        let preferredMinimumBarWidth = SliderLayout.getPreferredMinimumBarWidth(orientation: orientation,
                                                                                widthCategory: sliderConfiguration.widthCategory)
        
        var howMuchCanSliderBarGrowForMinimumWidth = min(preferredMinimumBarWidth, (totalWidth - consumed))
        
        consumed += howMuchCanSliderBarGrowForMinimumWidth
        _sliderBoxWidth += howMuchCanSliderBarGrowForMinimumWidth
        
        
        var isLooping = true
        while isLooping {
            isLooping = false
            
            if (consumed < totalWidth) && (_outsideBoxPaddingLeft < outsideBoxPaddingLeftStandard) {
                consumed += 1
                _outsideBoxPaddingLeft += 1
                isLooping = true
            }
            if (consumed < totalWidth) && (_outsideBoxPaddingRight < outsideBoxPaddingRightStandard) {
                consumed += 1
                _outsideBoxPaddingRight += 1
                isLooping = true
            }
            if (consumed < totalWidth) && (_heroPaddingLeft < heroPaddingLeftStandard) {
                consumed += 1
                _heroPaddingLeft += 1
                isLooping = true
            }
            if (consumed < totalWidth) && (_heroPaddingRight < heroPaddingRightStandard) {
                consumed += 1
                _heroPaddingRight += 1
                isLooping = true
            }
            if (consumed < totalWidth) && (_slavePaddingLeft < slavePaddingLeftStandard) {
                consumed += 1
                _slavePaddingLeft += 1
                isLooping = true
            }
            if (consumed < totalWidth) && (_slavePaddingRight < slavePaddingRightStandard) {
                consumed += 1
                _slavePaddingRight += 1
                isLooping = true
            }
        }
        
        isLooping = true
        while isLooping {
            isLooping = false
            
            if (consumed < totalWidth) && (_outsideBoxPaddingLeft < outsideBoxPaddingLeftRelaxed) {
                consumed += 1
                _outsideBoxPaddingLeft += 1
                isLooping = true
            }
            if (consumed < totalWidth) && (_outsideBoxPaddingRight < outsideBoxPaddingRightRelaxed) {
                consumed += 1
                _outsideBoxPaddingRight += 1
                isLooping = true
            }
            if (consumed < totalWidth) && (_heroPaddingLeft < heroPaddingLeftRelaxed) {
                consumed += 1
                _heroPaddingLeft += 1
                isLooping = true
            }
            if (consumed < totalWidth) && (_heroPaddingRight < heroPaddingRightRelaxed) {
                consumed += 1
                _heroPaddingRight += 1
                isLooping = true
            }
            if (consumed < totalWidth) && (_slavePaddingLeft < slavePaddingLeftRelaxed) {
                consumed += 1
                _slavePaddingLeft += 1
                isLooping = true
            }
            if (consumed < totalWidth) && (_slavePaddingRight < slavePaddingRightRelaxed) {
                consumed += 1
                _slavePaddingRight += 1
                isLooping = true
            }
        }
        
        if consumed < totalWidth {
            _sliderBoxWidth += (totalWidth - consumed)
        }
        
        sliderBoxWidth = _sliderBoxWidth
        
        outsideBoxPaddingLeft = _outsideBoxPaddingLeft
        outsideBoxPaddingRight = _outsideBoxPaddingRight
        
        heroPaddingLeft = _heroPaddingLeft
        heroPaddingRight = _heroPaddingRight
        
        slavePaddingLeft = _slavePaddingLeft
        slavePaddingRight = _slavePaddingRight
        
        let thumbDiameter = SliderLayout.getThumbDiameterStroke(orientation: orientation)
        
        thumbMinimumX = CGFloat(0.0)
        thumbMaximumX = CGFloat(sliderBoxWidth - thumbDiameter)
        
        thumbOffsetX = thumbMinimumX + (thumbMaximumX - thumbMinimumX) * percent
        
    }
}
