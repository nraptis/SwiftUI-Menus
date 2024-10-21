//
//  MagicalButtonViewModel.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/3/24.
//

import SwiftUI

@Observable class MagicalButtonViewModel: MagicalViewModel {
    
    override class func getLayoutScheme() -> LayoutScheme.Type {
        ButtonLayout.self
    }
    
    let buttonConfiguration: ToolInterfaceElementButtonConfiguration
    @MainActor init(orientation: Orientation,
         buttonConfiguration: ToolInterfaceElementButtonConfiguration) {
        self.buttonConfiguration = buttonConfiguration
        super.init(orientation: orientation)
    }
    
    @MainActor func handleClicked() {
        print("MagicalButtonViewModel => handleClicked()")
    }
    
    override func refreshLayoutFrame() {
        
        let layoutSchemeFlavor = getLayoutSchemeFlavor()
        
        let iconPackTertiary = ApplicationController.isPurchased ? FramedLongIconLibrary.uncoloredLock : nil
        
        switch layoutSchemeFlavor {
        case .long:
            refreshLayoutFrameLong(nameLabelWidth: buttonConfiguration.nameLabelWidthLong,
                                   numberOfLines: buttonConfiguration.nameLabelNumberOfLines,
                                   valueLabelWidth: 0,
                                   extraGrowingElementWidthSqueezed: 0,
                                   extraGrowingElementWidthStandard: 0,
                                   extraGrowingElementWidthRelaxed: 0,
                                   iconPackMain: buttonConfiguration.iconPack,
                                   iconPackSecondary: nil,
                                   iconPackTertiary: iconPackTertiary)
        case .stackedLarge:
            refreshLayoutFrameStacked(nameLabelWidth: buttonConfiguration.nameLabelWidthStackedLarge,
                                      numberOfLines: buttonConfiguration.nameLabelNumberOfLines,
                                      valueLabelWidth: 0,
                                      extraGrowingElementWidthSqueezed: 0,
                                      extraGrowingElementWidthStandard: 0,
                                      extraGrowingElementWidthRelaxed: 0,
                                      iconPackMain: buttonConfiguration.iconPack,
                                      iconPackSecondary: nil,
                                      iconPackTertiary: iconPackTertiary)
        case .stackedMedium:
            refreshLayoutFrameStacked(nameLabelWidth: buttonConfiguration.nameLabelWidthStackedMedium,
                                      numberOfLines: buttonConfiguration.nameLabelNumberOfLines,
                                      valueLabelWidth: 0,
                                      extraGrowingElementWidthSqueezed: 0,
                                      extraGrowingElementWidthStandard: 0,
                                      extraGrowingElementWidthRelaxed: 0,
                                      iconPackMain: buttonConfiguration.iconPack,
                                      iconPackSecondary: nil,
                                      iconPackTertiary: iconPackTertiary)
        case .stackedSmall:
            refreshLayoutFrameStacked(nameLabelWidth: buttonConfiguration.nameLabelWidthStackedSmall,
                                      numberOfLines: buttonConfiguration.nameLabelNumberOfLines,
                                      valueLabelWidth: 0,
                                      extraGrowingElementWidthSqueezed: 0,
                                      extraGrowingElementWidthStandard: 0,
                                      extraGrowingElementWidthRelaxed: 0,
                                      iconPackMain: buttonConfiguration.iconPack,
                                      iconPackSecondary: nil,
                                      iconPackTertiary: iconPackTertiary)
        }
    }
}
