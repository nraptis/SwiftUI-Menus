//
//  MagicalViewModelSegmented.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/5/24.
//

import SwiftUI

@Observable class MagicalViewModelSegmented: MagicalViewModel {
    
    @MainActor var selectedSegmentIndex = 0
    
    @MainActor let segmentButtonViewModels: [MagicalSegmentButtonViewModel]
    @MainActor init(orientation: Orientation,
                    segmentButtonViewModels: [MagicalSegmentButtonViewModel]) {
        self.segmentButtonViewModels = segmentButtonViewModels
        super.init(orientation: orientation)
    }
    
    override func setDarkModeEnabled(isDarkModeEnabled: Bool) {
        super.setDarkModeEnabled(isDarkModeEnabled: isDarkModeEnabled)
        for segmentButtonViewModel in segmentButtonViewModels {
            segmentButtonViewModel.setDarkModeEnabled(isDarkModeEnabled: isDarkModeEnabled)
        }
    }
    
    @MainActor func handleSelectedIndex(_ index: Int) {
        print("MagicalViewModelSegmented => handleSelectedIndex(\(index))")
    }
    
    @MainActor func refreshLayoutFrameStacked(infoList: [SEGMENT_LAYOUT_INFO]) {
        
        let G_L = GENERIC_SEGMENT_LAYOUT.computeStacked(layoutSchemeType: SegmentedPickerLayout.self,
                                                        layoutWidth: layoutWidth,
                                                        orientation: orientation,
                                                        infoList: infoList,
                                                        attemptEqualWidthsForAllButtons: true,
                                                        neighborTypeLeft: toolNode.neighborTypeLeft,
                                                        neighborTypeRight: toolNode.neighborTypeRight)
        
        if outsideBoxPaddingLeft != G_L.globalLayout.outsideBoxPaddingLeft {
            outsideBoxPaddingLeft = G_L.globalLayout.outsideBoxPaddingLeft
        }
        
        if outsideBoxPaddingRight != G_L.globalLayout.outsideBoxPaddingRight {
            outsideBoxPaddingRight = G_L.globalLayout.outsideBoxPaddingRight
        }
        
        var index = 0
        var buttonX = 0
        while (index < segmentButtonViewModels.count) && (index < G_L.buttonLayouts.count) {
            let info = infoList[index]
            let buttonLayout = G_L.buttonLayouts[index]
            let buttonViewModel = segmentButtonViewModels[index]
            
            if buttonViewModel.heroPaddingLeft != buttonLayout.heroPaddingLeft {
                buttonViewModel.heroPaddingLeft = buttonLayout.heroPaddingLeft
            }
            
            if buttonViewModel.heroPaddingRight != buttonLayout.heroPaddingRight {
                buttonViewModel.heroPaddingRight = buttonLayout.heroPaddingRight
            }
            
            if buttonViewModel.slavePaddingLeft != buttonLayout.slavePaddingLeft {
                buttonViewModel.slavePaddingLeft = buttonLayout.slavePaddingLeft
            }
            
            if buttonViewModel.slavePaddingRight != buttonLayout.slavePaddingRight {
                buttonViewModel.slavePaddingRight = buttonLayout.slavePaddingRight
            }
            
            if buttonViewModel.accentPaddingLeft != buttonLayout.accentPaddingLeft {
                buttonViewModel.accentPaddingLeft = buttonLayout.accentPaddingLeft
            }
            
            if buttonViewModel.accentPaddingRight != buttonLayout.accentPaddingRight {
                buttonViewModel.accentPaddingRight = buttonLayout.accentPaddingRight
            }
            
            let nameLabelWidth = info.nameLabelWidth
            let numberOfLines = info.numberOfLines
            let iconMain = info.iconPackMain.getTextIcon(orientation: orientation,
                                                         layoutSchemeFlavor: .stackedLarge,
                                                         numberOfLines: numberOfLines,
                                                         isDarkMode: false,
                                                         isEnabled: true)
            let iconMainWidth = iconMain.width
            let iconSecondaryWidth: Int
            if let iconPackSecondary = info.iconPackSecondary {
                let iconSecondary = iconPackSecondary.getTextIcon(orientation: orientation,
                                                                  layoutSchemeFlavor: .long,
                                                                  numberOfLines: 0,
                                                                  isDarkMode: false,
                                                                  isEnabled: true)
                iconSecondaryWidth = iconSecondary.width
            } else {
                iconSecondaryWidth = 0
            }
            let iconTertiaryWidth: Int
            if let iconPackTertiary = info.iconPackTertiary {
                let iconTertiary = iconPackTertiary.getTextIcon(orientation: orientation,
                                                                layoutSchemeFlavor: .long,
                                                                numberOfLines: 0,
                                                                isDarkMode: false,
                                                                isEnabled: true)
                iconTertiaryWidth = iconTertiary.width
            } else {
                iconTertiaryWidth = 0
            }
            
            let heroWidth = max(nameLabelWidth, iconMainWidth)
            
            var buttonWidth = 0
            buttonWidth += buttonLayout.heroPaddingLeft
            buttonWidth += heroWidth
            buttonWidth += buttonLayout.heroPaddingRight
            buttonWidth += buttonLayout.slavePaddingLeft
            buttonWidth += iconSecondaryWidth
            buttonWidth += buttonLayout.slavePaddingRight
            
            buttonWidth += buttonLayout.accentPaddingLeft
            buttonWidth += iconTertiaryWidth
            buttonWidth += buttonLayout.accentPaddingRight
            
            
            if buttonViewModel.layoutX != buttonX {
                buttonViewModel.layoutX = buttonX
            }
            if buttonViewModel.layoutWidth != buttonWidth {
                buttonViewModel.layoutWidth = buttonWidth
            }
            
            buttonX += buttonWidth
            
            index += 1
        }
    }
    
    @MainActor func refreshLayoutFrameLong(infoList: [SEGMENT_LAYOUT_INFO]) {
        
        let G_L = GENERIC_SEGMENT_LAYOUT.computeLong(layoutSchemeType: SegmentedPickerLayout.self,
                                                     layoutWidth: layoutWidth,
                                                     orientation: orientation,
                                                     infoList: infoList,
                                                     attemptEqualWidthsForAllButtons: true,
                                                     neighborTypeLeft: toolNode.neighborTypeLeft,
                                                     neighborTypeRight: toolNode.neighborTypeRight)
        
        if outsideBoxPaddingLeft != G_L.globalLayout.outsideBoxPaddingLeft {
            outsideBoxPaddingLeft = G_L.globalLayout.outsideBoxPaddingLeft
        }
        
        if outsideBoxPaddingRight != G_L.globalLayout.outsideBoxPaddingRight {
            outsideBoxPaddingRight = G_L.globalLayout.outsideBoxPaddingRight
        }
        
        var buttonX = 0
        var index = 0
        while (index < segmentButtonViewModels.count) && (index < G_L.buttonLayouts.count) {
            let info = infoList[index]
            let buttonLayout = G_L.buttonLayouts[index]
            let buttonViewModel = segmentButtonViewModels[index]
            
            if buttonViewModel.heroPaddingLeft != buttonLayout.heroPaddingLeft {
                buttonViewModel.heroPaddingLeft = buttonLayout.heroPaddingLeft
            }
            
            if buttonViewModel.heroPaddingRight != buttonLayout.heroPaddingRight {
                buttonViewModel.heroPaddingRight = buttonLayout.heroPaddingRight
            }
            
            if buttonViewModel.slavePaddingLeft != buttonLayout.slavePaddingLeft {
                buttonViewModel.slavePaddingLeft = buttonLayout.slavePaddingLeft
            }
            
            if buttonViewModel.slavePaddingRight != buttonLayout.slavePaddingRight {
                buttonViewModel.slavePaddingRight = buttonLayout.slavePaddingRight
            }
            
            if buttonViewModel.accentPaddingLeft != buttonLayout.accentPaddingLeft {
                buttonViewModel.accentPaddingLeft = buttonLayout.accentPaddingLeft
            }
            
            if buttonViewModel.accentPaddingRight != buttonLayout.accentPaddingRight {
                buttonViewModel.accentPaddingRight = buttonLayout.accentPaddingRight
            }
            
            if buttonViewModel.heroSpacing != buttonLayout.heroSpacing {
                buttonViewModel.heroSpacing = buttonLayout.heroSpacing
            }
            
            let nameLabelWidth = info.nameLabelWidth
            let numberOfLines = info.numberOfLines
            let iconMain = info.iconPackMain.getTextIcon(orientation: orientation,
                                                         layoutSchemeFlavor: .long,
                                                         numberOfLines: numberOfLines,
                                                         isDarkMode: false,
                                                         isEnabled: true)
            let iconMainWidth = iconMain.width
            let iconSecondaryWidth: Int
            if let iconPackSecondary = info.iconPackSecondary {
                let iconSecondary = iconPackSecondary.getTextIcon(orientation: orientation,
                                                                  layoutSchemeFlavor: .long,
                                                                  numberOfLines: 0,
                                                                  isDarkMode: false,
                                                                  isEnabled: true)
                iconSecondaryWidth = iconSecondary.width
            } else {
                iconSecondaryWidth = 0
            }
            
            let iconTertiaryWidth: Int
            if let iconPackTertiary = info.iconPackTertiary {
                let iconTertiary = iconPackTertiary.getTextIcon(orientation: orientation,
                                                                layoutSchemeFlavor: .long,
                                                                numberOfLines: 0,
                                                                isDarkMode: false,
                                                                isEnabled: true)
                iconTertiaryWidth = iconTertiary.width
            } else {
                iconTertiaryWidth = 0
            }
            
            let heroWidth = nameLabelWidth + iconMainWidth
            var buttonWidth = 0
            buttonWidth += buttonLayout.heroPaddingLeft
            buttonWidth += heroWidth
            buttonWidth += buttonLayout.heroSpacing
            buttonWidth += buttonLayout.heroPaddingRight
            buttonWidth += buttonLayout.slavePaddingLeft
            buttonWidth += iconSecondaryWidth
            buttonWidth += buttonLayout.slavePaddingRight
            buttonWidth += buttonLayout.accentPaddingLeft
            buttonWidth += iconTertiaryWidth
            buttonWidth += buttonLayout.accentPaddingRight
            
            if buttonViewModel.layoutX != buttonX {
                buttonViewModel.layoutX = buttonX
            }
            if buttonViewModel.layoutWidth != buttonWidth {
                buttonViewModel.layoutWidth = buttonWidth
            }
            
            buttonX += buttonWidth
            
            index += 1
        }
    }
}
