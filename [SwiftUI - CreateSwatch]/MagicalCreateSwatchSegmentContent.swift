//
//  MagicalCreateSwatchSegmentContent.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/2/24.
//

import SwiftUI

struct MagicalCreateSwatchSegmentContent: View {
    
    @Environment(MagicalCreateSwatchViewModel.self) var magicalViewModel
    @Environment(MagicalCreateSwatchButtonViewModel.self) var magicalButtonViewModel
    
    let layoutSchemeFlavor: LayoutSchemeFlavor
    let layoutHeight: Int
    let isPressed: Bool
    
    var body: some View {
        
        let layoutWidth = magicalButtonViewModel.layoutWidth
        let orientation = magicalViewModel.orientation
        let configuration = magicalButtonViewModel.createSwatchButtonConfiguration
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
        
        let nameLabelFont = CreateSwatchLayout.getNameLabelFont(orientation: orientation,
                                                          flavor: layoutSchemeFlavor)
        let nameLabelVerticalSpacing = CreateSwatchLayout.getNameLabelVerticalSpacing(orientation: orientation,
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
        
        let heroPaddingTopStacked = CreateSwatchLayout.getHeroPaddingTopStacked(orientation: orientation)
        let heroPaddingBottomStacked = CreateSwatchLayout.getHeroPaddingBottomStacked(orientation: orientation)
        
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

/*
import SwiftUI

struct MagicalCreateSwatchSegmentContent: View {
    
    @Environment(MagicalCreateSwatchViewModel.self) var magicalCreateSwatchViewModel: MagicalCreateSwatchViewModel
    @Environment(MagicalCreateSwatchButtonViewModel.self) var magicalCreateSwatchButtonViewModel: MagicalCreateSwatchButtonViewModel
    let index: Int
    let isDarkMode: Bool
    let isEnabled: Bool
    let isPressed: Bool
    let orientation: Orientation
    let layoutSchemeFlavor: LayoutSchemeFlavor
    let universalPaddingTop: Int
    let universalPaddingBottom: Int
    var body: some View {
        
        let configuration = magicalCreateSwatchButtonViewModel.createSwatchButtonConfiguration
        let textIcon = configuration.getTextIcon(orientation: orientation,
                                                 layoutSchemeFlavor: layoutSchemeFlavor,
                                                 isDarkMode: isDarkMode,
                                                 isEnabled: isEnabled)
        
        let universalPaddingLeft = magicalCreateSwatchButtonViewModel.universalPaddingLeft
        let universalPaddingRight = magicalCreateSwatchButtonViewModel.universalPaddingRight
        
        let line1 = configuration.nameLabelLine1
        let line2 = configuration.nameLabelLine2
        
        let numberOfLines = magicalCreateSwatchButtonViewModel.createSwatchButtonConfiguration.nameLabelNumberOfLines
        
        let iconWidth = textIcon.width
        let iconHeight = textIcon.height
        
        let nameLabelFont = CreateSwatchLayout.getNameLabelFont(orientation: orientation,
                                                                  flavor: layoutSchemeFlavor)
        
        let nameLabelPaddingLeft = magicalCreateSwatchButtonViewModel.nameLabelPaddingLeft
        let nameLabelPaddingRight = magicalCreateSwatchButtonViewModel.nameLabelPaddingRight
        let nameLabelVerticalSpacing = CreateSwatchLayout.getNameLabelVerticalSpacing(orientation: orientation,
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
        
        let iconPaddingLeft = magicalCreateSwatchButtonViewModel.iconPaddingLeft
        let iconPaddingRight = magicalCreateSwatchButtonViewModel.iconPaddingRight
        let iconPaddingTop = CreateSwatchLayout.getIconPaddingTop(orientation: orientation,
                                                            flavor: layoutSchemeFlavor,
                                                            numberOfLines: numberOfLines)
        
        let contentHeight = magicalCreateSwatchViewModel.layoutHeight - (universalPaddingTop + universalPaddingBottom)
        
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
        
        return VStack(spacing: 0.0) {

#if INTERFACE_HINTS
            Spacer()
                .frame(width: 24.0, height: CGFloat(universalPaddingTop))
                .background(Color(red: 0.85, green: 0.65, blue: 0.55, opacity: 0.40))
#else
            Spacer()
                .frame(height: CGFloat(universalPaddingTop))
#endif
            
            ZStack {
                HStack(spacing: 0.0) {
                
#if INTERFACE_HINTS
                    Spacer()
                        .frame(width: CGFloat(universalPaddingLeft), height: 28.0)
                        .background(Color(red: 0.85, green: 0.45, blue: 0.65, opacity: 0.40))
#else
                    Spacer()
                        .frame(width: CGFloat(universalPaddingLeft))
#endif
                
                    ZStack {
                        HStack(spacing: 0.0) {
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
                            IconBoxCreateSwatch(icon: textIcon,
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
                        .frame(width: CGFloat(universalPaddingRight), height: 28.0)
                        .background(Color(red: 1.0, green: 0.25, blue: 0.75, opacity: 0.40))
#else
                    Spacer()
                        .frame(width: CGFloat(universalPaddingRight))
#endif
                
                }
                
            }
            .frame(height: CGFloat(contentHeight))

#if INTERFACE_HINTS
            Spacer()
                .frame(width: 24.0, height: CGFloat(universalPaddingBottom))
                .background(Color(red: 0.65, green: 0.85, blue: 0.75, opacity: 0.40))
#else
            Spacer()
                .frame(height: CGFloat(universalPaddingBottom))
#endif
            
        }
        .frame(width: CGFloat(magicalCreateSwatchButtonViewModel.width),
               height: CGFloat(magicalCreateSwatchViewModel.layoutHeight))
    }
}
*/
