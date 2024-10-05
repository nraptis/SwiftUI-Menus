//
//  MagicalSexyCheckBoxContent.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/3/24.
//

import SwiftUI

struct MagicalSexyCheckBoxContent: View {
    
    @Environment(MagicalSexyCheckBoxViewModel.self) var magicalViewModel
    
    let layoutSchemeFlavor: LayoutSchemeFlavor
    let isPressed: Bool
    let layoutWidth: Int
    let layoutHeight: Int
    
    var body: some View {
        
        let orientation = magicalViewModel.orientation
        let configuration = magicalViewModel.sexyCheckBoxConfiguration
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
        let checkBoxSquare = MagicalSexyCheckBoxViewModel.checkBoxSquare.getTextIcon(orientation: orientation,
                                                                                     layoutSchemeFlavor: .long,
                                                                                     numberOfLines: 0,
                                                                                     isDarkMode: isDarkMode,
                                                                                     isEnabled: isEnabled)
        
        let checkBoxCheck = MagicalSexyCheckBoxViewModel.checkBoxCheck.getTextIcon(orientation: orientation,
                                                                                   layoutSchemeFlavor: .long,
                                                                                   numberOfLines: 0,
                                                                                   isDarkMode: isDarkMode,
                                                                                   isEnabled: isEnabled)
        
        let line1 = configuration.nameLabelLine1
        let line2 = configuration.nameLabelLine2
        
        let nameLabelFont = CheckBoxLayout.getNameLabelFont(orientation: orientation,
                                                            flavor: layoutSchemeFlavor)
        let nameLabelVerticalSpacing = CheckBoxLayout.getNameLabelVerticalSpacing(orientation: orientation,
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
        
        let heroPaddingTopStacked = CheckBoxLayout.getHeroPaddingTopStacked(orientation: orientation)
        let heroPaddingBottomStacked = CheckBoxLayout.getHeroPaddingBottomStacked(orientation: orientation)
        
        let slaveWidth = checkBoxSquare.width
        let slaveHeight = checkBoxSquare.height
        let slaveContentWidth = checkBoxSquare.width + magicalViewModel.slavePaddingLeft + magicalViewModel.slavePaddingRight
        
        
        let checkWidth = checkBoxCheck.width
        let checkHeight = checkBoxCheck.height
        
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
                .background(Color(red: 0.35, green: 0.61, blue: 0.81, opacity: 0.40))
#else
            Spacer()
                .frame(width: CGFloat(magicalViewModel.slavePaddingLeft))
#endif
            
            ZStack {
                IconBoxMainTab(icon: checkBoxSquare,
                               iconWidth: slaveWidth,
                               iconHeight: slaveHeight,
                               iconPaddingLeft: 0,
                               iconPaddingRight: 0,
                               iconPaddingTop: 0)
                if magicalViewModel.isChecked {
                    IconBoxMainTab(icon: checkBoxCheck,
                                   iconWidth: checkWidth,
                                   iconHeight: checkHeight,
                                   iconPaddingLeft: 0,
                                   iconPaddingRight: 0,
                                   iconPaddingTop: 0)
                }
            }
            .compositingGroup()
            .opacity(isPressed ? 0.75 : 1.0)
            
#if INTERFACE_HINTS
            Spacer()
                .frame(width: CGFloat(magicalViewModel.slavePaddingRight), height: 24.0)
                .background(Color(red: 0.47, green: 0.87, blue: 0.16, opacity: 0.70))
#else
            Spacer()
                .frame(width: CGFloat(magicalViewModel.slavePaddingRight))
#endif
            
        }
#if INTERFACE_HINTS
        .overlay(Rectangle().stroke().foregroundStyle(
            LinearGradient(colors: [Color(red: 0.57, green: 0.28, blue: 0.61, opacity: 0.65),
                                    Color(red: 0.65, green: 0.89, blue: 0.91, opacity: 0.65)], startPoint: .leading, endPoint: .trailing)))
        .background(Rectangle().foregroundStyle(
            LinearGradient(colors: [Color(red: 0.45, green: 0.48, blue: 0.52, opacity: 0.25),
                                    Color(red: 0.05, green: 0.99, blue: 0.70, opacity: 0.25)], startPoint: .leading, endPoint: .trailing)))
#endif
        
        
    }
}

/*
import SwiftUI

struct MagicalSexyCheckBoxContent: View {
    
    @Environment(MagicalSexyCheckBoxViewModel.self) var magicalSexyCheckBoxViewModel: MagicalSexyCheckBoxViewModel
    
    let orientation: Orientation
    let layoutSchemeFlavor: LayoutSchemeFlavor
    let isPressed: Bool
    let isDarkMode: Bool
    let isEnabled: Bool
    let isChecked: Bool
    let universalPaddingLeft: Int
    let universalPaddingRight: Int
    let universalPaddingTop: Int
    let universalPaddingBottom: Int
    let layoutWidth: Int
    
    var body: some View {
        
        let configuration = magicalSexyCheckBoxViewModel.sexyCheckBoxConfiguration
        
        let icon = configuration.iconPack.getTextIcon(orientation: orientation,
                                                      layoutSchemeFlavor: layoutSchemeFlavor,
                                                      numberOfLines: configuration.nameLabelNumberOfLines,
                                                      isDarkMode: isDarkMode,
                                                      isEnabled: isEnabled)
        
        let checkBoxSquare = MagicalSexyCheckBoxViewModel.checkBoxSquare.getTextIcon(orientation: orientation,
                                                                                     layoutSchemeFlavor: layoutSchemeFlavor,
                                                                                     numberOfLines: configuration.nameLabelNumberOfLines,
                                                                                     isDarkMode: isDarkMode,
                                                                                     isEnabled: isEnabled)
        let checkBoxCheck = MagicalSexyCheckBoxViewModel.checkBoxCheck.getTextIcon(orientation: orientation,
                                                                                   layoutSchemeFlavor: layoutSchemeFlavor,
                                                                                   numberOfLines: configuration.nameLabelNumberOfLines,
                                                                                   isDarkMode: isDarkMode,
                                                                                   isEnabled: isEnabled)
        
        
        let line1 = configuration.nameLabelLine1
        let line2 = configuration.nameLabelLine2
        
        let numberOfLines = configuration.nameLabelNumberOfLines
        
        let nameLabelFont = CheckBoxLayout.getNameLabelFont(orientation: orientation,
                                                             flavor: layoutSchemeFlavor)
        
        let nameLabelPaddingLeft = magicalSexyCheckBoxViewModel.nameLabelPaddingLeft
        let nameLabelPaddingRight = magicalSexyCheckBoxViewModel.nameLabelPaddingRight
        let nameLabelVerticalSpacing = CheckBoxLayout.getNameLabelVerticalSpacing(orientation: orientation,
                                                                                   flavor: layoutSchemeFlavor)
        
        let nameLabelTextWidth: Int
        switch layoutSchemeFlavor {
        case .long:
            nameLabelTextWidth = configuration.nameLabelWidthLong
        case .stackedLarge:
            nameLabelTextWidth = configuration.nameLabelWidthStackedLarge
        case .stackedMedium:
            nameLabelTextWidth = configuration.nameLabelWidthStackedMedium
        case .stackedSmall:
            nameLabelTextWidth = configuration.nameLabelWidthStackedSmall
        }
        
        let lineHeight = ToolInterfaceTheme.getLineHeight(font: nameLabelFont)
        let nameLabelWidth = nameLabelTextWidth + nameLabelPaddingLeft + nameLabelPaddingRight
        
        let iconWidth = icon.width
        let iconHeight = icon.height
        
        let iconPaddingLeft = magicalSexyCheckBoxViewModel.iconPaddingLeft
        let iconPaddingRight = magicalSexyCheckBoxViewModel.iconPaddingRight
        let iconPaddingTop = CheckBoxLayout.getIconPaddingTop(orientation: orientation,
                                                               flavor: layoutSchemeFlavor,
                                                               numberOfLines: numberOfLines)
        
        let checkBoxSquareWidth = checkBoxSquare.width
        let checkBoxSquareHeight = checkBoxSquare.height
        
        let checkBoxPaddingLeft = magicalSexyCheckBoxViewModel.checkBoxPaddingLeft
        let checkBoxPaddingRight = magicalSexyCheckBoxViewModel.checkBoxPaddingRight
        let checkBoxPaddingTop = 0
        
        let checkBoxCheckWidth = checkBoxCheck.width
        let checkBoxCheckHeight = checkBoxCheck.height
        
        
        let contentHeight = magicalSexyCheckBoxViewModel.layoutHeight - (universalPaddingTop + universalPaddingBottom)
        
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
        
        let buttonUniversalPaddingLeft = magicalSexyCheckBoxViewModel.buttonUniversalPaddingLeft
        let buttonUniversalPaddingRight = magicalSexyCheckBoxViewModel.buttonUniversalPaddingRight
        
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
                            
                            ZStack {
                                IconBoxMainTab(icon: checkBoxSquare,
                                               iconWidth: checkBoxSquareWidth,
                                               iconHeight: checkBoxSquareHeight,
                                               iconPaddingLeft: checkBoxPaddingLeft,
                                               iconPaddingRight: checkBoxPaddingRight,
                                               iconPaddingTop: checkBoxPaddingTop)
                                if isChecked {
                                    IconBoxMainTab(icon: checkBoxCheck,
                                                   iconWidth: checkBoxCheckWidth,
                                                   iconHeight: checkBoxCheckHeight,
                                                   iconPaddingLeft: checkBoxPaddingLeft,
                                                   iconPaddingRight: checkBoxPaddingRight,
                                                   iconPaddingTop: checkBoxPaddingTop)
                                }
                                
                            }
                            .frame(width: CGFloat(checkBoxSquareWidth + checkBoxPaddingLeft + checkBoxPaddingRight),
                                   height: CGFloat(checkBoxSquareHeight + checkBoxPaddingTop))
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
               height: CGFloat(magicalSexyCheckBoxViewModel.layoutHeight))
    }
}
*/
