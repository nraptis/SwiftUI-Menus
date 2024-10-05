//
//  MagicalSexyButtonViewModel.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/3/24.
//

import Foundation
import SwiftUI

@Observable class MagicalSexyButtonViewModel: MagicalViewModel {
    
    override class func getLayoutScheme() -> LayoutScheme.Type {
        ButtonLayout.self
    }
    
    //@MainActor var nameLabelPaddingLeft = 0
    //@MainActor var nameLabelPaddingRight = 0
    
    //@MainActor var iconPaddingLeft = 0
    //@MainActor var iconPaddingRight = 0
    
    //@MainActor var universalPaddingLeft = 0
    //@MainActor var universalPaddingRight = 0
    
    let sexyButtonConfiguration: ToolInterfaceElementButtonConfiguration
    @MainActor init(orientation: Orientation,
         sexyButtonConfiguration: ToolInterfaceElementButtonConfiguration) {
        self.sexyButtonConfiguration = sexyButtonConfiguration
        super.init(orientation: orientation)
    }
    
    func handleClicked() {
        print("MagicalSexyButtonViewModel => handleClicked()")
    }
    
    override func refreshLayoutFrame() {
        
        let layoutSchemeFlavor = getLayoutSchemeFlavor()
        
        switch layoutSchemeFlavor {
        case .long:
            refreshLayoutFrameLong(nameLabelWidth: sexyButtonConfiguration.nameLabelWidthLong,
                                   numberOfLines: sexyButtonConfiguration.nameLabelNumberOfLines,
                                   iconPackMain: sexyButtonConfiguration.iconPack,
                                   iconPackSecondary: nil)
        case .stackedLarge:
            refreshLayoutFrameStacked(nameLabelWidth: sexyButtonConfiguration.nameLabelWidthStackedLarge,
                                      numberOfLines: sexyButtonConfiguration.nameLabelNumberOfLines,
                                      iconPackMain: sexyButtonConfiguration.iconPack,
                                      iconPackSecondary: nil)
        case .stackedMedium:
            refreshLayoutFrameStacked(nameLabelWidth: sexyButtonConfiguration.nameLabelWidthStackedMedium,
                                      numberOfLines: sexyButtonConfiguration.nameLabelNumberOfLines,
                                      iconPackMain: sexyButtonConfiguration.iconPack,
                                      iconPackSecondary: nil)
        case .stackedSmall:
            refreshLayoutFrameStacked(nameLabelWidth: sexyButtonConfiguration.nameLabelWidthStackedSmall,
                                      numberOfLines: sexyButtonConfiguration.nameLabelNumberOfLines,
                                      iconPackMain: sexyButtonConfiguration.iconPack,
                                      iconPackSecondary: nil)
        }
    }
}
