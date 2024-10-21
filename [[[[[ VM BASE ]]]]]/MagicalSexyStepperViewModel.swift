//
//  MagicalStepperViewModel.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/13/24.
//

import SwiftUI

@Observable class MagicalStepperViewModel: MagicalViewModel {
    
    override class func getLayoutScheme() -> LayoutScheme.Type {
        StepperLayout.self
    }
    
    @MainActor var valueString = "|"
    
    @MainActor var isIncrementEnabled = true
    @MainActor var isDecrementEnabled = true
    
    let stepperConfiguration: ToolInterfaceElementStepperConfiguration
    @MainActor init(orientation: Orientation,
         stepperConfiguration: ToolInterfaceElementStepperConfiguration) {
        self.stepperConfiguration = stepperConfiguration
        super.init(orientation: orientation)
    }
    
    @MainActor func handleIncrement() {
        print("MagicalStepperViewModel => handleIncrement()")
    }
    
    @MainActor func handleDecrement() {
        print("MagicalStepperViewModel => handleDecrement()")
    }
    
    @MainActor func refreshValueString(_ valueString: String) {
        if self.valueString != valueString {
            self.valueString = valueString
        }
    }
    
    @MainActor func refreshIncrementEnabled(_ isIncrementEnabled: Bool) {
        if self.isIncrementEnabled != isIncrementEnabled {
            self.isIncrementEnabled = isIncrementEnabled
        }
    }
    
    @MainActor func refreshDecrementEnabled(_ isDecrementEnabled: Bool) {
        if self.isDecrementEnabled != isDecrementEnabled {
            self.isDecrementEnabled = isDecrementEnabled
        }
    }
    
    override func refreshLayoutFrame() {
        let layoutSchemeFlavor = getLayoutSchemeFlavor()
        switch layoutSchemeFlavor {
        case .long:
            refreshLayoutFrameLong(nameLabelWidth: stepperConfiguration.nameLabelWidthLong,
                                   numberOfLines: stepperConfiguration.nameLabelNumberOfLines,
                                   valueLabelWidth: stepperConfiguration.valueLabelWidthLarge,
                                   extraGrowingElementWidthSqueezed: 0,
                                   extraGrowingElementWidthStandard: 0,
                                   extraGrowingElementWidthRelaxed: 0,
                                   iconPackMain: stepperConfiguration.iconPack,
                                   iconPackSecondary: stepperConfiguration.incrementPack,
                                   iconPackTertiary: stepperConfiguration.decrementPack)
        case .stackedLarge:
            refreshLayoutFrameStacked(nameLabelWidth: stepperConfiguration.nameLabelWidthStackedLarge,
                                      numberOfLines: stepperConfiguration.nameLabelNumberOfLines,
                                      valueLabelWidth: stepperConfiguration.valueLabelWidthLarge,
                                      extraGrowingElementWidthSqueezed: 0,
                                      extraGrowingElementWidthStandard: 0,
                                      extraGrowingElementWidthRelaxed: 0,
                                      iconPackMain: stepperConfiguration.iconPack,
                                      iconPackSecondary: stepperConfiguration.incrementPack,
                                      iconPackTertiary: stepperConfiguration.decrementPack)
        case .stackedMedium:
            refreshLayoutFrameStacked(nameLabelWidth: stepperConfiguration.nameLabelWidthStackedMedium,
                                      numberOfLines: stepperConfiguration.nameLabelNumberOfLines,
                                      valueLabelWidth: stepperConfiguration.valueLabelWidthMedium,
                                      extraGrowingElementWidthSqueezed: 0,
                                      extraGrowingElementWidthStandard: 0,
                                      extraGrowingElementWidthRelaxed: 0,
                                      iconPackMain: stepperConfiguration.iconPack,
                                      iconPackSecondary: stepperConfiguration.incrementPack,
                                      iconPackTertiary: stepperConfiguration.decrementPack)
        case .stackedSmall:
            refreshLayoutFrameStacked(nameLabelWidth: stepperConfiguration.nameLabelWidthStackedSmall,
                                      numberOfLines: stepperConfiguration.nameLabelNumberOfLines,
                                      valueLabelWidth: stepperConfiguration.valueLabelWidthSmall,
                                      extraGrowingElementWidthSqueezed: 0,
                                      extraGrowingElementWidthStandard: 0,
                                      extraGrowingElementWidthRelaxed: 0,
                                      iconPackMain: stepperConfiguration.iconPack,
                                      iconPackSecondary: stepperConfiguration.incrementPack,
                                      iconPackTertiary: stepperConfiguration.decrementPack)
        }
        
    }
    
}
