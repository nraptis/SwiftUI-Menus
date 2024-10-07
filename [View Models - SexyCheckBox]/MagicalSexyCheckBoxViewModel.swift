//
//  MagicalSexyCheckBoxViewModel.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/3/24.
//

import Foundation
import SwiftUI

@Observable class MagicalSexyCheckBoxViewModel: MagicalViewModel {
    
    override class func getLayoutScheme() -> LayoutScheme.Type {
        CheckBoxLayout.self
    }
    
    @MainActor var isChecked = false
    
    let sexyCheckBoxConfiguration: ToolInterfaceElementSexyCheckBoxConfiguration
    @MainActor init(orientation: Orientation,
         sexyCheckBoxConfiguration: ToolInterfaceElementSexyCheckBoxConfiguration) {
        self.sexyCheckBoxConfiguration = sexyCheckBoxConfiguration
        super.init(orientation: orientation)
    }
    
    @MainActor func handleClicked() {
        print("MagicalExitModeViewModel => handleClicked()")
    }
    
    override func refreshLayoutFrame() {
        let layoutSchemeFlavor = getLayoutSchemeFlavor()
        switch layoutSchemeFlavor {
        case .long:
            refreshLayoutFrameLong(nameLabelWidth: sexyCheckBoxConfiguration.nameLabelWidthLong,
                                   numberOfLines: sexyCheckBoxConfiguration.nameLabelNumberOfLines,
                                   iconPackMain: sexyCheckBoxConfiguration.iconPack,
                                   iconPackSecondary: FramedLongIconLibrary.checkBoxSquare)
        case .stackedLarge:
            refreshLayoutFrameStacked(nameLabelWidth: sexyCheckBoxConfiguration.nameLabelWidthStackedLarge,
                                      numberOfLines: sexyCheckBoxConfiguration.nameLabelNumberOfLines,
                                      iconPackMain: sexyCheckBoxConfiguration.iconPack,
                                      iconPackSecondary: FramedLongIconLibrary.checkBoxSquare)
        case .stackedMedium:
            refreshLayoutFrameStacked(nameLabelWidth: sexyCheckBoxConfiguration.nameLabelWidthStackedMedium,
                                      numberOfLines: sexyCheckBoxConfiguration.nameLabelNumberOfLines,
                                      iconPackMain: sexyCheckBoxConfiguration.iconPack,
                                      iconPackSecondary: FramedLongIconLibrary.checkBoxSquare)
        case .stackedSmall:
            refreshLayoutFrameStacked(nameLabelWidth: sexyCheckBoxConfiguration.nameLabelWidthStackedSmall,
                                      numberOfLines: sexyCheckBoxConfiguration.nameLabelNumberOfLines,
                                      iconPackMain: sexyCheckBoxConfiguration.iconPack,
                                      iconPackSecondary: FramedLongIconLibrary.checkBoxSquare)
        }
    }
}
