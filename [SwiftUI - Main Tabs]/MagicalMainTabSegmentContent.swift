//
//  MagicalMainTabSegmentContent.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/24/24.
//

import SwiftUI

struct MagicalMainTabSegmentContent: View {
    
    @Environment(MagicalMainTabViewModel.self) var magicalViewModel
    @Environment(MagicalMainTabButtonViewModel.self) var magicalButtonViewModel
    
    let layoutSchemeFlavor: LayoutSchemeFlavor
    let layoutHeight: Int
    let isSelected: Bool
    let isPressed: Bool
    let isEnabled: Bool
    
    var body: some View {
        
        let layoutWidth = magicalButtonViewModel.layoutWidth
        let orientation = magicalViewModel.orientation
        let configuration = magicalButtonViewModel.mainTabButtonConfiguration
        let isDarkMode = magicalViewModel.isDarkModeEnabled
        
        let numberOfLines = configuration.nameLabelNumberOfLines
        let textIcon = configuration.iconPack.getTextIcon(orientation: orientation,
                                                          layoutSchemeFlavor: layoutSchemeFlavor,
                                                          numberOfLines: numberOfLines,
                                                          isDarkMode: isDarkMode,
                                                          isEnabled: isEnabled)
        
        let line1 = configuration.nameLabelLine1
        let line2 = configuration.nameLabelLine2
        
        let nameLabelFont = MainTabLayout.getNameLabelFont(orientation: orientation,
                                                           flavor: layoutSchemeFlavor)
        let nameLabelVerticalSpacing = MainTabLayout.getNameLabelVerticalSpacing(orientation: orientation,
                                                                                 flavor: layoutSchemeFlavor)
        
        let nameLabelWidth: Int
        switch layoutSchemeFlavor {
        case .long, .stackedLarge:
            nameLabelWidth = configuration.nameLabelWidthLarge
        case .stackedMedium:
            nameLabelWidth = configuration.nameLabelWidthMedium
        case .stackedSmall:
            nameLabelWidth = configuration.nameLabelWidthSmall
        }
        
        let lineHeight = ToolInterfaceTheme.getLineHeight(font: nameLabelFont)
        
        let nameLabelColor: Color
        if isPressed {
            if isEnabled {
                nameLabelColor = ToolInterfaceTheme.primaryDownEnabled
            } else {
                nameLabelColor = ToolInterfaceTheme.primaryDownDisabled
            }
        } else {
            
            if isDarkMode {
                if isSelected {
                    if isEnabled {
                        nameLabelColor = ToolInterfaceTheme.primaryEnabledDark
                    } else {
                        nameLabelColor = ToolInterfaceTheme.primaryDisabledDark
                    }
                } else {
                    if isEnabled {
                        nameLabelColor = ToolInterfaceTheme.primaryUnselectedEnabledDark
                    } else {
                        nameLabelColor = ToolInterfaceTheme.primaryUnselectedDisabledDark
                    }
                }
            } else {
                if isSelected {
                    if isEnabled {
                        nameLabelColor = ToolInterfaceTheme.primaryEnabledLight
                    } else {
                        nameLabelColor = ToolInterfaceTheme.primaryDisabledLight
                    }
                } else {
                    if isEnabled {
                        nameLabelColor = ToolInterfaceTheme.primaryUnselectedEnabledLight
                    } else {
                        nameLabelColor = ToolInterfaceTheme.primaryUnselectedDisabledLight
                    }
                }
            }
        }
        
        let heroPaddingTopStacked = MainTabLayout.getHeroPaddingTopStacked(orientation: orientation,
                                                                           numberOfLines: numberOfLines)
        let heroPaddingBottomStacked = MainTabLayout.getHeroPaddingBottomStacked(orientation: orientation,
                                                                                 numberOfLines: numberOfLines)
        
        return HeroSlab(orientation: orientation,
                        layoutWidth: layoutWidth,
                        layoutHeight: layoutHeight,
                        isLong: true,
                        isPressed: isPressed,
                        textIcon: textIcon,
                        heroPaddingLeft: magicalButtonViewModel.heroPaddingLeft,
                        heroPaddingRight: magicalButtonViewModel.heroPaddingRight,
                        heroPaddingTopStacked: heroPaddingTopStacked,
                        heroPaddingBottomStacked: heroPaddingBottomStacked,
                        heroSpacingLong: magicalButtonViewModel.heroSpacing,
                        line1: line1,
                        line2: line2,
                        numberOfLines: numberOfLines,
                        nameLabelVerticalSpacing: nameLabelVerticalSpacing,
                        nameLabelFont: nameLabelFont,
                        nameLabelWidth: nameLabelWidth,
                        lineHeight: lineHeight,
                        nameLabelColor: nameLabelColor)
    }
}
