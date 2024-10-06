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
        
        let heroPaddingTopStacked = ExitModeLayout.getHeroPaddingTopStacked(orientation: orientation)
        let heroPaddingBottomStacked = ExitModeLayout.getHeroPaddingBottomStacked(orientation: orientation)
        
        let slaveWidth = accentIcon.width
        let slaveHeight = accentIcon.height
        let slaveContentWidth = accentIcon.width + magicalViewModel.slavePaddingLeft + magicalViewModel.slavePaddingRight
        
        return HStack(spacing: 0.0) {
            
#if INTERFACE_HINTS
            Spacer()
                .frame(width: CGFloat(magicalViewModel.slavePaddingLeft), height: 24.0)
                .background(Color(red: 0.26, green: 0.78, blue: 0.54, opacity: 0.40))
#else
            Spacer()
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
            Spacer()
                .frame(width: CGFloat(magicalViewModel.slavePaddingRight), height: 24.0)
                .background(Color(red: 0.31, green: 0.77, blue: 0.47, opacity: 0.70))
#else
            Spacer()
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

/*
import SwiftUI

struct MagicalExitModeContent: View {
    
    @Environment(MagicalExitModeViewModel.self) var magicalExitModeViewModel: MagicalExitModeViewModel
    
    let orientation: Orientation
    let layoutSchemeFlavor: LayoutSchemeFlavor
    let isPressed: Bool
    let isDarkMode: Bool
    let isEnabled: Bool
    let universalPaddingLeft: Int
    let universalPaddingRight: Int
    let universalPaddingTop: Int
    let universalPaddingBottom: Int
    let layoutWidth: Int
    
    var body: some View {
        
        let configuration = magicalExitModeViewModel.exitModeConfiguration
        
        let icon = configuration.iconPack.getTextIcon(orientation: orientation,
                                                      layoutSchemeFlavor: layoutSchemeFlavor,
                                                      numberOfLines: configuration.nameLabelNumberOfLines,
                                                      isDarkMode: isDarkMode,
                                                      isEnabled: isEnabled)
        
        let accent = configuration.accentPack.getTextIcon(orientation: orientation,
                                                          layoutSchemeFlavor: layoutSchemeFlavor,
                                                          numberOfLines: configuration.nameLabelNumberOfLines,
                                                          isDarkMode: isDarkMode,
                                                          isEnabled: isEnabled)
        
        
        let line1 = configuration.nameLabelLine1
        let line2 = configuration.nameLabelLine2
        
        let numberOfLines = configuration.nameLabelNumberOfLines
        
        let nameLabelFont = ExitModeLayout.getNameLabelFont(orientation: orientation,
                                                             flavor: layoutSchemeFlavor)
        
        let nameLabelPaddingLeft = magicalExitModeViewModel.nameLabelPaddingLeft
        let nameLabelPaddingRight = magicalExitModeViewModel.nameLabelPaddingRight
        let nameLabelVerticalSpacing = ExitModeLayout.getNameLabelVerticalSpacing(orientation: orientation,
                                                                                   flavor: layoutSchemeFlavor)
        
        let nameLabelTextWidth: Int
        switch layoutSchemeFlavor {
        case .long:
            nameLabelTextWidth = configuration.nameLabelWidthLarge
        case .stackedLarge:
            nameLabelTextWidth = configuration.nameLabelWidthLarge
        case .stackedMedium:
            nameLabelTextWidth = configuration.nameLabelWidthMedium
        case .stackedSmall:
            nameLabelTextWidth = configuration.nameLabelWidthSmall
        }
        
        let lineHeight = ToolInterfaceTheme.getLineHeight(font: nameLabelFont)
        let nameLabelWidth = nameLabelTextWidth + nameLabelPaddingLeft + nameLabelPaddingRight
        
        let iconWidth = icon.width
        let iconHeight = icon.height
        
        let iconPaddingLeft = magicalExitModeViewModel.iconPaddingLeft
        let iconPaddingRight = magicalExitModeViewModel.iconPaddingRight
        let iconPaddingTop = ExitModeLayout.getIconPaddingTop(orientation: orientation,
                                                               flavor: layoutSchemeFlavor,
                                                               numberOfLines: numberOfLines)
        
        let accentWidth = accent.width
        let accentHeight = accent.height
        
        let accentPaddingLeft = magicalExitModeViewModel.accentPaddingLeft
        let accentPaddingRight = magicalExitModeViewModel.accentPaddingRight
        let accentPaddingTop = 0
        
        let contentHeight = magicalExitModeViewModel.layoutHeight - (universalPaddingTop + universalPaddingBottom)
        
        let color: Color
        
        if isPressed {
            if isEnabled {
                color = ToolInterfaceTheme.primaryDownEnabled
            } else {
                color = ToolInterfaceTheme.primaryDownDisabled
            }
        } else {
            
            if isDarkMode {
                if isEnabled {
                    color = ToolInterfaceTheme.primaryEnabledDark
                } else {
                    color = ToolInterfaceTheme.primaryDisabledDark
                }
            } else {
                if isEnabled {
                    color = ToolInterfaceTheme.primaryEnabledLight
                } else {
                    color = ToolInterfaceTheme.primaryDisabledLight
                }
            }
        }
        
        let buttonUniversalPaddingLeft = magicalExitModeViewModel.buttonUniversalPaddingLeft
        let buttonUniversalPaddingRight = magicalExitModeViewModel.buttonUniversalPaddingRight
        
        return ZStack {
            
            VStack(spacing: 0.0) {
                
#if INTERFACE_HINTS
                Spacer()
                    .frame(width: 24.0, height: CGFloat(universalPaddingTop))
                    .background(Color(red: 0.85, green: 0.65, blue: 0.55, opacity: 0.40))
#else
                Spacer()
                    .frame(height: CGFloat(universalPaddingTop))
#endif
                
                HStack(spacing: 0.0) {
#if INTERFACE_HINTS
                    Spacer()
                        .frame(width: CGFloat(universalPaddingLeft), height: 28.0)
                        .background(Color(red: 1.0, green: 0.0, blue: 1.0, opacity: 0.7))
#else
                    Spacer()
                        .frame(width: CGFloat(universalPaddingLeft))
                    
#endif
                    
#if INTERFACE_HINTS
                    Spacer()
                        .frame(width: CGFloat(buttonUniversalPaddingLeft), height: 28.0)
                        .background(Color(red: 0.0, green: 1.0, blue: 0.0, opacity: 0.7))
#else
                    Spacer()
                        .frame(width: CGFloat(buttonUniversalPaddingLeft))
                    
#endif
                    
                    ZStack {
                        HStack(spacing: 0.0) {
                            IconBoxMainTab(icon: accent,
                                           iconWidth: accentWidth,
                                           iconHeight: accentHeight,
                                           iconPaddingLeft: accentPaddingLeft,
                                           iconPaddingRight: accentPaddingRight,
                                           iconPaddingTop: accentPaddingTop)
                            
                            LabelBox(line1: line1,
                                     line2: line2,
                                     numberOfLines: numberOfLines,
                                     width: nameLabelWidth,
                                     paddingLeft: nameLabelPaddingLeft,
                                     paddingRight: nameLabelPaddingRight,
                                     paddingBottom: 0,
                                     lineHeight: lineHeight,
                                     spacingVertical: nameLabelVerticalSpacing,
                                     font: nameLabelFont,
                                     color: color)
                            
                            IconBoxMainTab(icon: icon,
                                           iconWidth: iconWidth,
                                           iconHeight: iconHeight,
                                           iconPaddingLeft: iconPaddingLeft,
                                           iconPaddingRight: iconPaddingRight,
                                           iconPaddingTop: iconPaddingTop)
                        }
                    }
                    .frame(height: CGFloat(contentHeight))
                    
#if INTERFACE_HINTS
                    Spacer()
                        .frame(width: CGFloat(buttonUniversalPaddingRight), height: 28.0)
                        .background(Color(red: 0.6, green: 0.76, blue: 0.25, opacity: 0.7))
#else
                    Spacer()
                        .frame(width: CGFloat(buttonUniversalPaddingRight))
                    
#endif
                    
#if INTERFACE_HINTS
                    Spacer()
                        .frame(width: CGFloat(universalPaddingRight), height: 28.0)
                        .background(Color(red: 1.0, green: 0.75, blue: 0.25, opacity: 0.40))
#else
                    Spacer()
                        .frame(width: CGFloat(universalPaddingRight))
#endif
                }
                

                
#if INTERFACE_HINTS
                Spacer()
                    .frame(width: 24.0, height: CGFloat(universalPaddingBottom))
                    .background(Color(red: 0.65, green: 0.85, blue: 0.75, opacity: 0.40))
#else
                Spacer()
                    .frame(height: CGFloat(universalPaddingBottom))
#endif
                
            }
        }
        .frame(width: CGFloat(layoutWidth),
               height: CGFloat(magicalExitModeViewModel.layoutHeight))
    }
}
*/
