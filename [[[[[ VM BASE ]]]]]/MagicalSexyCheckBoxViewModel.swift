//
//  MagicalSexyCheckBoxViewModel.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/3/24.
//

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
    
    @MainActor func refreshChecked() {
        if isChecked == false {
            isChecked = true
        }
    }
    
    @MainActor func refreshUnchecked() {
        if isChecked == true {
            isChecked = false
        }
    }
    
    override func refreshLayoutFrame() {
        let layoutSchemeFlavor = getLayoutSchemeFlavor()
        switch layoutSchemeFlavor {
        case .long:
            refreshLayoutFrameLong(nameLabelWidth: sexyCheckBoxConfiguration.nameLabelWidthLong,
                                   numberOfLines: sexyCheckBoxConfiguration.nameLabelNumberOfLines,
                                   valueLabelWidth: 0,
                                   extraGrowingElementWidthSqueezed: 0,
                                   extraGrowingElementWidthStandard: 0,
                                   extraGrowingElementWidthRelaxed: 0,
                                   iconPackMain: sexyCheckBoxConfiguration.iconPack,
                                   iconPackSecondary: FramedLongIconLibrary.checkBoxSquare,
                                   iconPackTertiary: nil)
        case .stackedLarge:
            refreshLayoutFrameStacked(nameLabelWidth: sexyCheckBoxConfiguration.nameLabelWidthStackedLarge,
                                      numberOfLines: sexyCheckBoxConfiguration.nameLabelNumberOfLines,
                                      valueLabelWidth: 0,
                                      extraGrowingElementWidthSqueezed: 0,
                                      extraGrowingElementWidthStandard: 0,
                                      extraGrowingElementWidthRelaxed: 0,
                                      iconPackMain: sexyCheckBoxConfiguration.iconPack,
                                      iconPackSecondary: FramedLongIconLibrary.checkBoxSquare,
                                      iconPackTertiary: nil)
        case .stackedMedium:
            refreshLayoutFrameStacked(nameLabelWidth: sexyCheckBoxConfiguration.nameLabelWidthStackedMedium,
                                      numberOfLines: sexyCheckBoxConfiguration.nameLabelNumberOfLines,
                                      valueLabelWidth: 0,
                                      extraGrowingElementWidthSqueezed: 0,
                                      extraGrowingElementWidthStandard: 0,
                                      extraGrowingElementWidthRelaxed: 0,
                                      iconPackMain: sexyCheckBoxConfiguration.iconPack,
                                      iconPackSecondary: FramedLongIconLibrary.checkBoxSquare,
                                      iconPackTertiary: nil)
        case .stackedSmall:
            refreshLayoutFrameStacked(nameLabelWidth: sexyCheckBoxConfiguration.nameLabelWidthStackedSmall,
                                      numberOfLines: sexyCheckBoxConfiguration.nameLabelNumberOfLines,
                                      valueLabelWidth: 0,
                                      extraGrowingElementWidthSqueezed: 0,
                                      extraGrowingElementWidthStandard: 0,
                                      extraGrowingElementWidthRelaxed: 0,
                                      iconPackMain: sexyCheckBoxConfiguration.iconPack,
                                      iconPackSecondary: FramedLongIconLibrary.checkBoxSquare,
                                      iconPackTertiary: nil)
        }
    }
}
