//
//  MagicalEnterModeContent.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/25/24.
//

import SwiftUI

struct MagicalEnterModeContent: View {
    
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
        
        let nameLabelFont = EnterModeLayout.getNameLabelFont(orientation: orientation,
                                                            flavor: layoutSchemeFlavor)
        let nameLabelVerticalSpacing = EnterModeLayout.getNameLabelVerticalSpacing(orientation: orientation,
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
        
        let heroPaddingTopStacked = EnterModeLayout.getHeroPaddingTopStacked(orientation: orientation)
        let heroPaddingBottomStacked = EnterModeLayout.getHeroPaddingBottomStacked(orientation: orientation)
        
        let slaveWidth = accentIcon.width
        let slaveHeight = accentIcon.height
        let slaveContentWidth = accentIcon.width + magicalViewModel.slavePaddingLeft + magicalViewModel.slavePaddingRight
        
        return HStack(spacing: 0.0) {
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
            
#if INTERFACE_HINTS
            Spacer()
                .frame(width: CGFloat(magicalViewModel.slavePaddingLeft), height: 24.0)
                .background(Color(red: 0.60, green: 0.50, blue: 0.90, opacity: 0.40))
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
                .background(Color(red: 0.57, green: 0.42, blue: 0.71, opacity: 0.70))
#else
            Spacer()
                .frame(width: CGFloat(magicalViewModel.slavePaddingRight))
#endif
            
        }
#if INTERFACE_HINTS
        .overlay(Rectangle().stroke().foregroundStyle(
            LinearGradient(colors: [Color(red: 0.38, green: 0.44, blue: 0.66, opacity: 0.65),
                                    Color(red: 0.38, green: 0.79, blue: 0.22, opacity: 0.65)], startPoint: .leading, endPoint: .trailing)))
        .background(Rectangle().foregroundStyle(
            LinearGradient(colors: [Color(red: 0.33, green: 0.88, blue: 0.55, opacity: 0.25),
                                    Color(red: 0.91, green: 0.18, blue: 0.77, opacity: 0.25)], startPoint: .leading, endPoint: .trailing)))
#endif
        
        
    }
}

/*
import SwiftUI

struct MagicalEnterModeContent: View {
    
    @Environment(MagicalModeChangeViewModel.self) var magicalEnterModeViewModel: MagicalModeChangeViewModel
    
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
        
        let configuration = magicalEnterModeViewModel.modeChangeConfiguration
        
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
        
        let nameLabelFont = EnterModeLayout.getNameLabelFont(orientation: orientation,
                                                             flavor: layoutSchemeFlavor)
        
        let nameLabelPaddingLeft = magicalEnterModeViewModel.nameLabelPaddingLeft
        let nameLabelPaddingRight = magicalEnterModeViewModel.nameLabelPaddingRight
        let nameLabelVerticalSpacing = EnterModeLayout.getNameLabelVerticalSpacing(orientation: orientation,
                                                                                   flavor: layoutSchemeFlavor)
        
        let nameLabelTextWidth: Int
        switch layoutSchemeFlavor {
        case .long:
            nameLabelTextWidth = configuration.nameLabelWidthStackedLarge
        case .stackedLarge:
            nameLabelTextWidth = configuration.nameLabelWidthStackedLarge
        case .stackedMedium:
            nameLabelTextWidth = configuration.nameLabelWidthStackedLarge // TODO page pvoe
        case .stackedSmall:
            nameLabelTextWidth = configuration.nameLabelWidthStackedLarge
        }
        
        let lineHeight = ToolInterfaceTheme.getLineHeight(font: nameLabelFont)
        let nameLabelWidth = nameLabelTextWidth + nameLabelPaddingLeft + nameLabelPaddingRight
        
        let iconWidth = icon.width
        let iconHeight = icon.height
        
        let iconPaddingLeft = magicalEnterModeViewModel.iconPaddingLeft
        let iconPaddingRight = magicalEnterModeViewModel.iconPaddingRight
        let iconPaddingTop = EnterModeLayout.getIconPaddingTop(orientation: orientation,
                                                               flavor: layoutSchemeFlavor,
                                                               numberOfLines: numberOfLines)
        
        let accentWidth = accent.width
        let accentHeight = accent.height
        
        let accentPaddingLeft = magicalEnterModeViewModel.accentPaddingLeft
        let accentPaddingRight = magicalEnterModeViewModel.accentPaddingRight
        let accentPaddingTop = 0
        
        let contentHeight = magicalEnterModeViewModel.layoutHeight - (universalPaddingTop + universalPaddingBottom)
        
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
        
        let buttonUniversalPaddingLeft = magicalEnterModeViewModel.buttonUniversalPaddingLeft
        let buttonUniversalPaddingRight = magicalEnterModeViewModel.buttonUniversalPaddingRight
        
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
                            IconBoxMainTab(icon: icon,
                                           iconWidth: iconWidth,
                                           iconHeight: iconHeight,
                                           iconPaddingLeft: iconPaddingLeft,
                                           iconPaddingRight: iconPaddingRight,
                                           iconPaddingTop: iconPaddingTop)
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
                            IconBoxMainTab(icon: accent,
                                           iconWidth: accentWidth,
                                           iconHeight: accentHeight,
                                           iconPaddingLeft: accentPaddingLeft,
                                           iconPaddingRight: accentPaddingRight,
                                           iconPaddingTop: accentPaddingTop)
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
               height: CGFloat(magicalEnterModeViewModel.layoutHeight))
    }
}
*/
