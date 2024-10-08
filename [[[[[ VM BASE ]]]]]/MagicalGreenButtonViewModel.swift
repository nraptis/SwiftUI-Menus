//
//  MagicalGreenButtonViewModel.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/2/24.
//

import SwiftUI

@Observable class MagicalGreenButtonViewModel: MagicalViewModel {
    
    override class func getLayoutScheme() -> LayoutScheme.Type {
        GreenButtonLayout.self
    }
    
    let greenButtonConfiguration: ToolInterfaceElementGreenButtonConfiguration
    @MainActor init(orientation: Orientation,
                    greenButtonConfiguration: ToolInterfaceElementGreenButtonConfiguration) {
        self.greenButtonConfiguration = greenButtonConfiguration
        super.init(orientation: orientation)
    }
    
    @MainActor func handleClicked() {
        print("MagicalGreenButtonViewModel => handleClicked()")
    }
    
    override func refreshLayoutFrame() {
        let layoutSchemeFlavor = getLayoutSchemeFlavor()
        switch layoutSchemeFlavor {
        case .long, .stackedLarge:
            refreshLayoutFrameLong(nameLabelWidth: greenButtonConfiguration.nameLabelWidthLarge,
                                   numberOfLines: greenButtonConfiguration.nameLabelNumberOfLines,
                                   valueLabelWidth: 0,
                                   extraGrowingElementWidthSqueezed: 0,
                                   extraGrowingElementWidthStandard: 0,
                                   extraGrowingElementWidthRelaxed: 0,
                                   iconPackMain: greenButtonConfiguration.iconPack,
                                   iconPackSecondary: nil,
                                   iconPackTertiary: nil)
        case .stackedMedium:
            refreshLayoutFrameLong(nameLabelWidth: greenButtonConfiguration.nameLabelWidthMedium,
                                   numberOfLines: greenButtonConfiguration.nameLabelNumberOfLines,
                                   valueLabelWidth: 0,
                                   extraGrowingElementWidthSqueezed: 0,
                                   extraGrowingElementWidthStandard: 0,
                                   extraGrowingElementWidthRelaxed: 0,
                                   iconPackMain: greenButtonConfiguration.iconPack,
                                   iconPackSecondary: nil,
                                   iconPackTertiary: nil)
        case .stackedSmall:
            refreshLayoutFrameLong(nameLabelWidth: greenButtonConfiguration.nameLabelWidthSmall,
                                   numberOfLines: greenButtonConfiguration.nameLabelNumberOfLines,
                                   valueLabelWidth: 0,
                                   extraGrowingElementWidthSqueezed: 0,
                                   extraGrowingElementWidthStandard: 0,
                                   extraGrowingElementWidthRelaxed: 0,
                                   iconPackMain: greenButtonConfiguration.iconPack,
                                   iconPackSecondary: nil,
                                   iconPackTertiary: nil)
        }
    }
}
