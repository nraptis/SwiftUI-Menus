//
//  MagicalCreateSwatchSegmentContent.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/2/24.
//

import SwiftUI

struct MagicalCreateSwatchSegmentContent: View {
    
    @Environment(MagicalCreateSwatchViewModel.self) var magicalCreateSwatchViewModel: MagicalCreateSwatchViewModel
    @Environment(MagicalCreateSwatchButtonViewModel.self) var magicalCreateSwatchButtonViewModel: MagicalCreateSwatchButtonViewModel
    let index: Int
    let isSelected: Bool
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
        let nameLabelPaddingBottom = CreateSwatchLayout.getNameLabelPaddingBottom(orientation: orientation,
                                                                                flavor: layoutSchemeFlavor,
                                                                                numberOfLines: numberOfLines)
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
                if isSelected {
                    if isEnabled {
                        color = ToolInterfaceTheme.primaryEnabledDark
                    } else {
                        color = ToolInterfaceTheme.primaryDisabledDark
                    }
                } else {
                    if isEnabled {
                        color = ToolInterfaceTheme.primaryUnselectedEnabledDark
                    } else {
                        color = ToolInterfaceTheme.primaryUnselectedDisabledDark
                    }
                }
            } else {
                if isSelected {
                    if isEnabled {
                        color = ToolInterfaceTheme.primaryEnabledLight
                    } else {
                        color = ToolInterfaceTheme.primaryDisabledLight
                    }
                } else {
                    if isEnabled {
                        color = ToolInterfaceTheme.primaryUnselectedEnabledLight
                    } else {
                        color = ToolInterfaceTheme.primaryUnselectedDisabledLight
                    }
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
                            IconBoxMainTab(icon: textIcon,
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
