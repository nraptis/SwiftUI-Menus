//
//  MagicalSexyStepperViewModel.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/13/24.
//

import SwiftUI

@Observable class MagicalSexyStepperViewModel: MagicalViewModel {
    
    override class func getLayoutScheme() -> LayoutScheme.Type {
        SexyStepperLayout.self
    }
    
    @MainActor var valueString = "|"
    
    @MainActor var isIncrementEnabled = true
    @MainActor var isDecrementEnabled = true
    
    let sexyStepperConfiguration: ToolInterfaceElementSexyStepperConfiguration
    @MainActor init(orientation: Orientation,
         sexyStepperConfiguration: ToolInterfaceElementSexyStepperConfiguration) {
        self.sexyStepperConfiguration = sexyStepperConfiguration
        super.init(orientation: orientation)
    }
    
    @MainActor func handleIncrement() {
        print("MagicalSexyStepperViewModel => handleIncrement()")
    }
    
    @MainActor func handleDecrement() {
        print("MagicalSexyStepperViewModel => handleDecrement()")
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
            refreshLayoutFrameLong(nameLabelWidth: sexyStepperConfiguration.nameLabelWidthLong,
                                   numberOfLines: sexyStepperConfiguration.nameLabelNumberOfLines,
                                   valueLabelWidth: sexyStepperConfiguration.valueLabelWidthLarge,
                                   extraGrowingElementWidthSqueezed: 0,
                                   extraGrowingElementWidthStandard: 0,
                                   extraGrowingElementWidthRelaxed: 0,
                                   iconPackMain: sexyStepperConfiguration.iconPack,
                                   iconPackSecondary: sexyStepperConfiguration.incrementPack,
                                   iconPackTertiary: sexyStepperConfiguration.decrementPack)
        case .stackedLarge:
            refreshLayoutFrameStacked(nameLabelWidth: sexyStepperConfiguration.nameLabelWidthStackedLarge,
                                      numberOfLines: sexyStepperConfiguration.nameLabelNumberOfLines,
                                      valueLabelWidth: sexyStepperConfiguration.valueLabelWidthLarge,
                                      extraGrowingElementWidthSqueezed: 0,
                                      extraGrowingElementWidthStandard: 0,
                                      extraGrowingElementWidthRelaxed: 0,
                                      iconPackMain: sexyStepperConfiguration.iconPack,
                                      iconPackSecondary: sexyStepperConfiguration.incrementPack,
                                      iconPackTertiary: sexyStepperConfiguration.decrementPack)
        case .stackedMedium:
            refreshLayoutFrameStacked(nameLabelWidth: sexyStepperConfiguration.nameLabelWidthStackedMedium,
                                      numberOfLines: sexyStepperConfiguration.nameLabelNumberOfLines,
                                      valueLabelWidth: sexyStepperConfiguration.valueLabelWidthMedium,
                                      extraGrowingElementWidthSqueezed: 0,
                                      extraGrowingElementWidthStandard: 0,
                                      extraGrowingElementWidthRelaxed: 0,
                                      iconPackMain: sexyStepperConfiguration.iconPack,
                                      iconPackSecondary: sexyStepperConfiguration.incrementPack,
                                      iconPackTertiary: sexyStepperConfiguration.decrementPack)
        case .stackedSmall:
            refreshLayoutFrameStacked(nameLabelWidth: sexyStepperConfiguration.nameLabelWidthStackedSmall,
                                      numberOfLines: sexyStepperConfiguration.nameLabelNumberOfLines,
                                      valueLabelWidth: sexyStepperConfiguration.valueLabelWidthSmall,
                                      extraGrowingElementWidthSqueezed: 0,
                                      extraGrowingElementWidthStandard: 0,
                                      extraGrowingElementWidthRelaxed: 0,
                                      iconPackMain: sexyStepperConfiguration.iconPack,
                                      iconPackSecondary: sexyStepperConfiguration.incrementPack,
                                      iconPackTertiary: sexyStepperConfiguration.decrementPack)
        }
        
    }
    
}
