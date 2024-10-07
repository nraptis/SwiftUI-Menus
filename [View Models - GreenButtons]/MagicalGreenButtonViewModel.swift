//
//  MagicalGreenButtonViewModel.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/2/24.
//

import Foundation
import SwiftUI

@Observable class MagicalGreenButtonViewModel: MagicalViewModel {
    
    override class func getLayoutScheme() -> LayoutScheme.Type {
        GreenButtonLayout.self
    }
    
    //var nameLabelPaddingLeft = 0
    //var nameLabelPaddingRight = 0
    
    //var iconPaddingLeft = 0
    //var iconPaddingRight = 0
    
    //var universalPaddingLeft = 0
    //var universalPaddingRight = 0
    
    let greenButtonConfiguration: ToolInterfaceElementGreenButtonConfiguration
    @MainActor init(orientation: Orientation,
                    greenButtonConfiguration: ToolInterfaceElementGreenButtonConfiguration) {
        self.greenButtonConfiguration = greenButtonConfiguration
        super.init(orientation: orientation)
    }
    
    func handleClicked() {
        print("MagicalGreenButtonViewModel => handleClicked()")
    }
    
    override func refreshLayoutFrame() {
        let layoutSchemeFlavor = getLayoutSchemeFlavor()
        switch layoutSchemeFlavor {
        case .long, .stackedLarge:
            refreshLayoutFrameLong(nameLabelWidth: greenButtonConfiguration.nameLabelWidthLarge,
                                   numberOfLines: greenButtonConfiguration.nameLabelNumberOfLines,
                                   iconPackMain: greenButtonConfiguration.iconPack,
                                   iconPackSecondary: nil)
        case .stackedMedium:
            refreshLayoutFrameLong(nameLabelWidth: greenButtonConfiguration.nameLabelWidthMedium,
                                   numberOfLines: greenButtonConfiguration.nameLabelNumberOfLines,
                                   iconPackMain: greenButtonConfiguration.iconPack,
                                   iconPackSecondary: nil)
        case .stackedSmall:
            refreshLayoutFrameLong(nameLabelWidth: greenButtonConfiguration.nameLabelWidthSmall,
                                   numberOfLines: greenButtonConfiguration.nameLabelNumberOfLines,
                                   iconPackMain: greenButtonConfiguration.iconPack,
                                   iconPackSecondary: nil)
        }
    }
}
