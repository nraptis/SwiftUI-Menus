//
//  MagicalExitModeContent.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/28/24.
//

import SwiftUI

struct MagicalExitModeContent: View {
    
    @Environment(MagicalModeChangeViewModel.self) var magicalViewModel
    
    let layoutSchemeFlavor: LayoutSchemeFlavor
    let isPressed: Bool
    let layoutWidth: Int
    let layoutHeight: Int
    
    var body: some View {
        
        let orientation = magicalViewModel.orientation
        let configuration = magicalViewModel.modeChangeConfiguration
        let isDarkMode = magicalViewModel.isDarkModeEnabled
        let isEnabled = magicalViewModel.isEnabled
        
        let isLong: Bool
        switch layoutSchemeFlavor {
        case .long:
            isLong = true
        default:
            isLong = false
        }
        
        let numberOfLines = configuration.nameLabelNumberOfLines
        let textIcon = configuration.iconPack.getTextIcon(orientation: orientation,
                                                          layoutSchemeFlavor: layoutSchemeFlavor,
                                                          numberOfLines: numberOfLines,
                                                          isDarkMode: isDarkMode,
                                                          isEnabled: isEnabled)
        let accentIcon = configuration.accentPack.getTextIcon(orientation: orientation,
                                                              layoutSchemeFlavor: .long,
                                                              numberOfLines: 0,
                                                              isDarkMode: isDarkMode,
                                                              isEnabled: isEnabled)
        
        let line1 = configuration.nameLabelLine1
        let line2 = configuration.nameLabelLine2
        
        let nameLabelFont = ExitModeLayout.getNameLabelFont(orientation: orientation,
                                                            flavor: layoutSchemeFlavor)
        let nameLabelVerticalSpacing = ExitModeLayout.getNameLabelVerticalSpacing(orientation: orientation,
                                                                                  flavor: layoutSchemeFlavor)
        
        let nameLabelWidth: Int
        switch layoutSchemeFlavor {
        case .long:
            nameLabelWidth = configuration.nameLabelWidthLong
        case .stackedLarge:
            nameLabelWidth = configuration.nameLabelWidthStackedLarge
        case .stackedMedium:
            nameLabelWidth = configuration.nameLabelWidthStackedMedium
        case .stackedSmall:
            nameLabelWidth = configuration.nameLabelWidthStackedSmall
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
        
        let heroPaddingTopStacked = ExitModeLayout.getHeroPaddingTopStacked(orientation: orientation,
                                                                            numberOfLines: numberOfLines)
        let heroPaddingBottomStacked = ExitModeLayout.getHeroPaddingBottomStacked(orientation: orientation,
                                                                                  numberOfLines: numberOfLines)
        
        let slaveWidth = accentIcon.width
        let slaveHeight = accentIcon.height
        let slaveContentWidth = accentIcon.width + magicalViewModel.slavePaddingLeft + magicalViewModel.slavePaddingRight
        
        return HStack(spacing: 0.0) {
            
#if INTERFACE_HINTS
            Spacer(minLength: 0.0)
                .frame(width: CGFloat(magicalViewModel.slavePaddingLeft), height: 24.0)
                .background(Color(red: 0.26, green: 0.78, blue: 0.54, opacity: 0.40))
#else
            Spacer(minLength: 0.0)
                .frame(width: CGFloat(magicalViewModel.slavePaddingLeft))
#endif
            
            IconBoxMainTab(icon: accentIcon,
                           iconWidth: slaveWidth,
                           iconHeight: slaveHeight,
                           iconPaddingLeft: 0,
                           iconPaddingRight: 0,
                           iconPaddingTop: 0)
            .opacity(isPressed ? 0.75 : 1.0)
            
#if INTERFACE_HINTS
            Spacer(minLength: 0.0)
                .frame(width: CGFloat(magicalViewModel.slavePaddingRight), height: 24.0)
                .background(Color(red: 0.31, green: 0.77, blue: 0.47, opacity: 0.70))
#else
            Spacer(minLength: 0.0)
                .frame(width: CGFloat(magicalViewModel.slavePaddingRight))
#endif
            
            HeroSlab(orientation: orientation,
                     layoutWidth: layoutWidth - slaveContentWidth,
                     layoutHeight: layoutHeight,
                     isLong: isLong,
                     isPressed: isPressed,
                     textIcon: textIcon,
                     heroPaddingLeft: magicalViewModel.heroPaddingLeft,
                     heroPaddingRight: magicalViewModel.heroPaddingRight,
                     heroPaddingTopStacked: heroPaddingTopStacked,
                     heroPaddingBottomStacked: heroPaddingBottomStacked,
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
#if INTERFACE_HINTS
        .overlay(Rectangle().stroke().foregroundStyle(
            LinearGradient(colors: [Color(red: 0.60, green: 0.60, blue: 0.90, opacity: 0.55),
                                    Color(red: 0.82, green: 0.57, blue: 0.41, opacity: 0.55)], startPoint: .leading, endPoint: .trailing)))
        .background(Rectangle().foregroundStyle(
            LinearGradient(colors: [Color(red: 0.82, green: 0.52, blue: 0.06, opacity: 0.35),
                                    Color(red: 0.90, green: 0.58, blue: 0.30, opacity: 0.35)], startPoint: .leading, endPoint: .trailing)))
#endif
        
        
    }
}
