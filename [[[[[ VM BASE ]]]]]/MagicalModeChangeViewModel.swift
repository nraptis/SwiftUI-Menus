//
//  MagicalModeChangeViewModel.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/25/24.
//

import SwiftUI

@Observable class MagicalModeChangeViewModel: MagicalViewModel {
    
    override class func getLayoutScheme() -> LayoutScheme.Type {
        EnterModeLayout.self
    }

    let modeChangeConfiguration: ToolInterfaceElementChangeModeConfiguration
    @MainActor init(orientation: Orientation,
         modeChangeConfiguration: ToolInterfaceElementChangeModeConfiguration) {
        self.modeChangeConfiguration = modeChangeConfiguration
        super.init(orientation: orientation)
    }
    
    @MainActor func handleClicked() {
        print("MagicalModeChangeViewModel => handleClicked()")
    }
    
    override func refreshLayoutFrame() {
        let layoutSchemeFlavor = getLayoutSchemeFlavor()
        switch layoutSchemeFlavor {
        case .long:
            refreshLayoutFrameLong(nameLabelWidth: modeChangeConfiguration.nameLabelWidthLong,
                                   numberOfLines: modeChangeConfiguration.nameLabelNumberOfLines,
                                   valueLabelWidth: 0,
                                   extraGrowingElementWidthSqueezed: 0,
                                   extraGrowingElementWidthStandard: 0,
                                   extraGrowingElementWidthRelaxed: 0,
                                   iconPackMain: modeChangeConfiguration.iconPack,
                                   iconPackSecondary: modeChangeConfiguration.accentPack,
                                   iconPackTertiary: nil)
        case .stackedLarge:
            refreshLayoutFrameStacked(nameLabelWidth: modeChangeConfiguration.nameLabelWidthStackedLarge,
                                      numberOfLines: modeChangeConfiguration.nameLabelNumberOfLines,
                                      valueLabelWidth: 0,
                                      extraGrowingElementWidthSqueezed: 0,
                                      extraGrowingElementWidthStandard: 0,
                                      extraGrowingElementWidthRelaxed: 0,
                                      iconPackMain: modeChangeConfiguration.iconPack,
                                      iconPackSecondary: modeChangeConfiguration.accentPack,
                                      iconPackTertiary: nil)
        case .stackedMedium:
            refreshLayoutFrameStacked(nameLabelWidth: modeChangeConfiguration.nameLabelWidthStackedMedium,
                                      numberOfLines: modeChangeConfiguration.nameLabelNumberOfLines,
                                      valueLabelWidth: 0,
                                      extraGrowingElementWidthSqueezed: 0,
                                      extraGrowingElementWidthStandard: 0,
                                      extraGrowingElementWidthRelaxed: 0,
                                      iconPackMain: modeChangeConfiguration.iconPack,
                                      iconPackSecondary: modeChangeConfiguration.accentPack,
                                      iconPackTertiary: nil)
        case .stackedSmall:
            refreshLayoutFrameStacked(nameLabelWidth: modeChangeConfiguration.nameLabelWidthStackedSmall,
                                      numberOfLines: modeChangeConfiguration.nameLabelNumberOfLines,
                                      valueLabelWidth: 0,
                                      extraGrowingElementWidthSqueezed: 0,
                                      extraGrowingElementWidthStandard: 0,
                                      extraGrowingElementWidthRelaxed: 0,
                                      iconPackMain: modeChangeConfiguration.iconPack,
                                      iconPackSecondary: modeChangeConfiguration.accentPack,
                                      iconPackTertiary: nil)
        }
    }
}
