//
//  MagicalCheckBoxViewModel.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/3/24.
//

import SwiftUI

@Observable class MagicalCheckBoxViewModel: MagicalViewModel {
    
    override class func getLayoutScheme() -> LayoutScheme.Type {
        CheckBoxLayout.self
    }
    
    @MainActor var isChecked = false
    
    let checkBoxConfiguration: ToolInterfaceElementCheckBoxConfiguration
    @MainActor init(orientation: Orientation,
         checkBoxConfiguration: ToolInterfaceElementCheckBoxConfiguration) {
        self.checkBoxConfiguration = checkBoxConfiguration
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
            refreshLayoutFrameLong(nameLabelWidth: checkBoxConfiguration.nameLabelWidthLong,
                                   numberOfLines: checkBoxConfiguration.nameLabelNumberOfLines,
                                   valueLabelWidth: 0,
                                   extraGrowingElementWidthSqueezed: 0,
                                   extraGrowingElementWidthStandard: 0,
                                   extraGrowingElementWidthRelaxed: 0,
                                   iconPackMain: checkBoxConfiguration.iconPack,
                                   iconPackSecondary: FramedLongIconLibrary.checkBoxSquare,
                                   iconPackTertiary: nil)
        case .stackedLarge:
            refreshLayoutFrameStacked(nameLabelWidth: checkBoxConfiguration.nameLabelWidthStackedLarge,
                                      numberOfLines: checkBoxConfiguration.nameLabelNumberOfLines,
                                      valueLabelWidth: 0,
                                      extraGrowingElementWidthSqueezed: 0,
                                      extraGrowingElementWidthStandard: 0,
                                      extraGrowingElementWidthRelaxed: 0,
                                      iconPackMain: checkBoxConfiguration.iconPack,
                                      iconPackSecondary: FramedLongIconLibrary.checkBoxSquare,
                                      iconPackTertiary: nil)
        case .stackedMedium:
            refreshLayoutFrameStacked(nameLabelWidth: checkBoxConfiguration.nameLabelWidthStackedMedium,
                                      numberOfLines: checkBoxConfiguration.nameLabelNumberOfLines,
                                      valueLabelWidth: 0,
                                      extraGrowingElementWidthSqueezed: 0,
                                      extraGrowingElementWidthStandard: 0,
                                      extraGrowingElementWidthRelaxed: 0,
                                      iconPackMain: checkBoxConfiguration.iconPack,
                                      iconPackSecondary: FramedLongIconLibrary.checkBoxSquare,
                                      iconPackTertiary: nil)
        case .stackedSmall:
            refreshLayoutFrameStacked(nameLabelWidth: checkBoxConfiguration.nameLabelWidthStackedSmall,
                                      numberOfLines: checkBoxConfiguration.nameLabelNumberOfLines,
                                      valueLabelWidth: 0,
                                      extraGrowingElementWidthSqueezed: 0,
                                      extraGrowingElementWidthStandard: 0,
                                      extraGrowingElementWidthRelaxed: 0,
                                      iconPackMain: checkBoxConfiguration.iconPack,
                                      iconPackSecondary: FramedLongIconLibrary.checkBoxSquare,
                                      iconPackTertiary: nil)
        }
    }
}
