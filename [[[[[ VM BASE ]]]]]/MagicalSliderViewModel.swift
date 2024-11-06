//
//  MagicalSliderViewModel.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/21/24.
//

import SwiftUI

@Observable class MagicalSliderViewModel: MagicalViewModel {
    
    override class func getLayoutScheme() -> LayoutScheme.Type {
        SliderLayout.self
    }
    
    @ObservationIgnored var percent = CGFloat(0.0)
    
    @MainActor var valueString = "|"
    
    @MainActor var thumbMinimumX: CGFloat = 0.0
    @MainActor var thumbMaximumX: CGFloat = 100.0
    @MainActor var thumbOffsetX = CGFloat(0.0)
    
    let sliderConfiguration: ToolInterfaceElementSliderConfiguration
    @MainActor init(orientation: Orientation,
                    sliderConfiguration: ToolInterfaceElementSliderConfiguration) {
        
        self.sliderConfiguration = sliderConfiguration
        super.init(orientation: orientation)
        valueString = getValueString()
    }
    
    @MainActor func handleSlideStarted(percent: CGFloat) {
        self.percent = CGFloat(percent)
        valueString = getValueString()
    }
    
    @MainActor func handleSlideUpdated(percent: CGFloat) {
        self.percent = percent
        valueString = getValueString()
    }
    
    @MainActor func handleSlideFinished(percent: CGFloat) {
        self.percent = percent
        valueString = getValueString()
    }
    
    @MainActor func refreshEnabled(value: Float) {
        let delta = (sliderConfiguration.maximumValue - sliderConfiguration.minimumValue)
        if delta > Math.epsilon {
            var _percent = CGFloat((value - sliderConfiguration.minimumValue) / delta)
            if _percent < 0.0 { _percent = 0.0 }
            if _percent > 1.0 { _percent = 1.0 }
            
            thumbOffsetX = thumbMinimumX + (thumbMaximumX - thumbMinimumX) * _percent
            percent = _percent
            valueString = getValueString()
        }
        refreshEnabled()
    }
    
    @MainActor func refreshDisabled(value: Float) {
        let delta = (sliderConfiguration.maximumValue - sliderConfiguration.minimumValue)
        if delta > Math.epsilon {
            var _percent = CGFloat((value - sliderConfiguration.minimumValue) / delta)
            if _percent < 0.0 { _percent = 0.0 }
            if _percent > 1.0 { _percent = 1.0 }
            
            thumbOffsetX = thumbMinimumX + (thumbMaximumX - thumbMinimumX) * _percent
            percent = _percent
            valueString = getValueString()
        }
        refreshDisabled()
    }
    
    @MainActor private func getValueString() -> String {
        let value = sliderConfiguration.minimumValue + (sliderConfiguration.maximumValue - sliderConfiguration.minimumValue) * Float(percent)
        let formatString = "%.\(sliderConfiguration.valueDecimalCount)f"
        return String(format: formatString, value)
    }
    
    override func refreshLayoutFrame() {
        
        let layoutSchemeFlavor = getLayoutSchemeFlavor()
        
        let extraWidthStandard = SliderLayout.getExtraWidthStandard(orientation: orientation)
        let preferredMinimumBarWidth = SliderLayout.getPreferredMinimumBarWidth(orientation: orientation, widthCategory: .stretch)

        switch layoutSchemeFlavor {
        case .long, .stackedLarge:
            refreshLayoutFrameLong(nameLabelWidth: sliderConfiguration.layoutNameLabelWidthLarge,
                                   numberOfLines: sliderConfiguration.nameLabelNumberOfLines,
                                   valueLabelWidth: sliderConfiguration.valueLabelWidthLarge,
                                   extraGrowingElementWidthSqueezed: preferredMinimumBarWidth,
                                   extraGrowingElementWidthStandard: preferredMinimumBarWidth + extraWidthStandard,
                                   extraGrowingElementWidthRelaxed: 100_000_000,
                                   iconPackMain: ApplicationController.blankTextIconPack,
                                   iconPackSecondary: nil,
                                   iconPackTertiary: nil)
        case .stackedMedium:
            refreshLayoutFrameLong(nameLabelWidth: sliderConfiguration.layoutNameLabelWidthMedium,
                                   numberOfLines: sliderConfiguration.nameLabelNumberOfLines,
                                   valueLabelWidth: sliderConfiguration.valueLabelWidthMedium,
                                   extraGrowingElementWidthSqueezed: preferredMinimumBarWidth,
                                   extraGrowingElementWidthStandard: preferredMinimumBarWidth + extraWidthStandard,
                                   extraGrowingElementWidthRelaxed: 100_000_000,
                                   iconPackMain: ApplicationController.blankTextIconPack,
                                   iconPackSecondary: nil,
                                   iconPackTertiary: nil)
        case .stackedSmall:
            refreshLayoutFrameLong(nameLabelWidth: sliderConfiguration.layoutNameLabelWidthSmall,
                                   numberOfLines: sliderConfiguration.nameLabelNumberOfLines,
                                   valueLabelWidth: sliderConfiguration.valueLabelWidthSmall,
                                   extraGrowingElementWidthSqueezed: preferredMinimumBarWidth,
                                   extraGrowingElementWidthStandard: preferredMinimumBarWidth + extraWidthStandard,
                                   extraGrowingElementWidthRelaxed: 100_000_000,
                                   iconPackMain: ApplicationController.blankTextIconPack,
                                   iconPackSecondary: nil,
                                   iconPackTertiary: nil)
        }
        
        let thumbDiameter = SliderLayout.getThumbDiameterStroke(orientation: orientation)
        thumbMaximumX = CGFloat(extraGrowingElementWidth - thumbDiameter)
        thumbOffsetX = thumbMinimumX + (thumbMaximumX - thumbMinimumX) * percent
        
    }
}
