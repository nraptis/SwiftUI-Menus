//
//  MagicalGreenButtonContent.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/2/24.
//

import SwiftUI

struct MagicalGreenButtonContent: View {
    
    @Environment(MagicalGreenButtonViewModel.self) var magicalViewModel
    
    let layoutSchemeFlavor: LayoutSchemeFlavor
    let isPressed: Bool
    let layoutWidth: Int
    let layoutHeight: Int
    
    var body: some View {
        
        let orientation = magicalViewModel.orientation
        let configuration = magicalViewModel.greenButtonConfiguration
        let isDarkMode = magicalViewModel.isDarkModeEnabled
        let isEnabled = magicalViewModel.isEnabled
        
        let numberOfLines = configuration.nameLabelNumberOfLines
        let textIcon = configuration.iconPack.getTextIcon(orientation: orientation,
                                                          layoutSchemeFlavor: layoutSchemeFlavor,
                                                          numberOfLines: numberOfLines,
                                                          isDarkMode: isDarkMode,
                                                          isEnabled: isEnabled)
        let line1 = configuration.nameLabelLine1
        let line2 = configuration.nameLabelLine2
        
        let nameLabelFont = GreenButtonLayout.getNameLabelFont(orientation: orientation,
                                                            flavor: layoutSchemeFlavor)
        let nameLabelVerticalSpacing = GreenButtonLayout.getNameLabelVerticalSpacing(orientation: orientation,
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
                if isEnabled {
                    nameLabelColor = ToolInterfaceTheme.primaryEnabledDark
                } else {
                    nameLabelColor = ToolInterfaceTheme.primaryDisabledDark
                }
            } else {
                if isEnabled {
                    nameLabelColor = ToolInterfaceTheme.primaryEnabledLight
                } else {
                    nameLabelColor = ToolInterfaceTheme.primaryDisabledLight
                }
            }
        }
        
        return HeroSlab(orientation: orientation,
                        layoutWidth: layoutWidth,
                        layoutHeight: layoutHeight,
                        isLong: true,
                        isPressed: isPressed,
                        textIcon: textIcon,
                        heroPaddingLeft: magicalViewModel.heroPaddingLeft,
                        heroPaddingRight: magicalViewModel.heroPaddingRight,
                        heroPaddingTopStacked: 0,
                        heroPaddingBottomStacked: 0,
                        heroSpacingLong: magicalViewModel.heroSpacing,
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
