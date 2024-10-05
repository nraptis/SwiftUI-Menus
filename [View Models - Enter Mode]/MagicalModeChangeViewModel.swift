//
//  MagicalModeChangeViewModel.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/25/24.
//

import Foundation
import SwiftUI

@Observable class MagicalModeChangeViewModel: MagicalViewModel {
    
    override class func getLayoutScheme() -> LayoutScheme.Type {
        EnterModeLayout.self
    }
    
    var nameLabelPaddingLeft = 0
    var nameLabelPaddingRight = 0
    
    var iconPaddingLeft = 0
    var iconPaddingRight = 0
    
    var accentPaddingLeft = 0
    var accentPaddingRight = 0
    
    var universalPaddingLeft = 0
    var universalPaddingRight = 0
    
    var buttonUniversalPaddingLeft = 0
    var buttonUniversalPaddingRight = 0
    
    let modeChangeConfiguration: ToolInterfaceElementChangeModeConfiguration
    @MainActor init(orientation: Orientation,
         modeChangeConfiguration: ToolInterfaceElementChangeModeConfiguration) {
        self.modeChangeConfiguration = modeChangeConfiguration
        super.init(orientation: orientation)
    }
    
    func handleClicked() {
        print("MagicalModeChangeViewModel => handleClicked()")
    }
    
    override func refreshLayoutFrame() {
        let layoutSchemeFlavor = getLayoutSchemeFlavor()
        switch layoutSchemeFlavor {
        case .long:
            refreshLayoutFrameLong(nameLabelWidth: modeChangeConfiguration.nameLabelWidthLong,
                                   numberOfLines: modeChangeConfiguration.nameLabelNumberOfLines,
                                   iconPackMain: modeChangeConfiguration.iconPack,
                                   iconPackSecondary: modeChangeConfiguration.accentPack)
        case .stackedLarge:
            refreshLayoutFrameStacked(nameLabelWidth: modeChangeConfiguration.nameLabelWidthStackedLarge,
                                      numberOfLines: modeChangeConfiguration.nameLabelNumberOfLines,
                                      iconPackMain: modeChangeConfiguration.iconPack,
                                      iconPackSecondary: modeChangeConfiguration.accentPack)
        case .stackedMedium:
            refreshLayoutFrameStacked(nameLabelWidth: modeChangeConfiguration.nameLabelWidthStackedMedium,
                                      numberOfLines: modeChangeConfiguration.nameLabelNumberOfLines,
                                      iconPackMain: modeChangeConfiguration.iconPack,
                                      iconPackSecondary: modeChangeConfiguration.accentPack)
        case .stackedSmall:
            refreshLayoutFrameStacked(nameLabelWidth: modeChangeConfiguration.nameLabelWidthStackedSmall,
                                      numberOfLines: modeChangeConfiguration.nameLabelNumberOfLines,
                                      iconPackMain: modeChangeConfiguration.iconPack,
                                      iconPackSecondary: modeChangeConfiguration.accentPack)
        }
    }
}
