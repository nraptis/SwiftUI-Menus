//
//  MagicalSexyButtonViewModel.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/3/24.
//

import SwiftUI

@Observable class MagicalSexyButtonViewModel: MagicalViewModel {
    
    override class func getLayoutScheme() -> LayoutScheme.Type {
        ButtonLayout.self
    }
    
    let sexyButtonConfiguration: ToolInterfaceElementButtonConfiguration
    @MainActor init(orientation: Orientation,
         sexyButtonConfiguration: ToolInterfaceElementButtonConfiguration) {
        self.sexyButtonConfiguration = sexyButtonConfiguration
        super.init(orientation: orientation)
    }
    
    @MainActor func handleClicked() {
        print("MagicalSexyButtonViewModel => handleClicked()")
    }
    
    override func refreshLayoutFrame() {
        
        let layoutSchemeFlavor = getLayoutSchemeFlavor()
        
        switch layoutSchemeFlavor {
        case .long:
            refreshLayoutFrameLong(nameLabelWidth: sexyButtonConfiguration.nameLabelWidthLong,
                                   numberOfLines: sexyButtonConfiguration.nameLabelNumberOfLines,
                                   valueLabelWidth: 0,
                                   extraGrowingElementWidthSqueezed: 0,
                                   extraGrowingElementWidthStandard: 0,
                                   extraGrowingElementWidthRelaxed: 0,
                                   iconPackMain: sexyButtonConfiguration.iconPack,
                                   iconPackSecondary: FramedLongIconLibrary.checkBoxSquare,
                                   iconPackTertiary: LooseConvertibleIconLibrary.testArrowLeft)
        case .stackedLarge:
            refreshLayoutFrameStacked(nameLabelWidth: sexyButtonConfiguration.nameLabelWidthStackedLarge,
                                      numberOfLines: sexyButtonConfiguration.nameLabelNumberOfLines,
                                      valueLabelWidth: 0,
                                      extraGrowingElementWidthSqueezed: 0,
                                      extraGrowingElementWidthStandard: 0,
                                      extraGrowingElementWidthRelaxed: 0,
                                      iconPackMain: sexyButtonConfiguration.iconPack,
                                      iconPackSecondary: FramedLongIconLibrary.checkBoxSquare,
                                      iconPackTertiary: LooseConvertibleIconLibrary.testArrowLeft)
        case .stackedMedium:
            refreshLayoutFrameStacked(nameLabelWidth: sexyButtonConfiguration.nameLabelWidthStackedMedium,
                                      numberOfLines: sexyButtonConfiguration.nameLabelNumberOfLines,
                                      valueLabelWidth: 0,
                                      extraGrowingElementWidthSqueezed: 0,
                                      extraGrowingElementWidthStandard: 0,
                                      extraGrowingElementWidthRelaxed: 0,
                                      iconPackMain: sexyButtonConfiguration.iconPack,
                                      iconPackSecondary: FramedLongIconLibrary.checkBoxSquare,
                                      iconPackTertiary: LooseConvertibleIconLibrary.testArrowLeft)
        case .stackedSmall:
            refreshLayoutFrameStacked(nameLabelWidth: sexyButtonConfiguration.nameLabelWidthStackedSmall,
                                      numberOfLines: sexyButtonConfiguration.nameLabelNumberOfLines,
                                      valueLabelWidth: 0,
                                      extraGrowingElementWidthSqueezed: 0,
                                      extraGrowingElementWidthStandard: 0,
                                      extraGrowingElementWidthRelaxed: 0,
                                      iconPackMain: sexyButtonConfiguration.iconPack,
                                      iconPackSecondary: FramedLongIconLibrary.checkBoxSquare,
                                      iconPackTertiary: LooseConvertibleIconLibrary.testArrowLeft)
        }
    }
}
