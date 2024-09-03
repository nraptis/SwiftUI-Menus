//
//  MagicalSexyButtonContent.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/3/24.
//

import SwiftUI

struct MagicalSexyButtonContent: View {
    
    @Environment(MagicalSexyButtonViewModel.self) var magicalSexyButtonViewModel: MagicalSexyButtonViewModel
    
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
        
        let configuration = magicalSexyButtonViewModel.sexyButtonConfiguration
        let isDarkMode = magicalSexyButtonViewModel.isDarkModeEnabled
        let textIcon = configuration.getTextIcon(orientation: orientation,
                                                 layoutSchemeFlavor: layoutSchemeFlavor,
                                                 isDarkMode: isDarkMode,
                                                 isEnabled: isEnabled)
        
        let line1 = configuration.nameLabelLine1
        let line2 = configuration.nameLabelLine2
        
        let numberOfLines = configuration.nameLabelNumberOfLines
        
        let nameLabelFont = SexyButtonLayout.getNameLabelFont(orientation: orientation,
                                                                  flavor: layoutSchemeFlavor)
        let nameLabelPaddingBottom = SexyButtonLayout.getNameLabelPaddingBottom(orientation: orientation,
                                                                                    flavor: layoutSchemeFlavor,
                                                                                    numberOfLines: numberOfLines)
        let nameLabelPaddingLeft = magicalSexyButtonViewModel.nameLabelPaddingLeft
        let nameLabelPaddingRight = magicalSexyButtonViewModel.nameLabelPaddingRight
        let nameLabelVerticalSpacing = SexyButtonLayout.getNameLabelVerticalSpacing(orientation: orientation,
                                                                                        flavor: layoutSchemeFlavor)
        
        let nameLabelTextWidth: Int
        switch layoutSchemeFlavor {
        case .stackedLarge, .long:
            nameLabelTextWidth = configuration.nameLabelWidthLarge
        case .stackedMedium:
            nameLabelTextWidth = configuration.nameLabelWidthMedium
        case .stackedSmall:
            nameLabelTextWidth = configuration.nameLabelWidthSmall
        }
        
        let lineHeight = ToolInterfaceTheme.getLineHeight(font: nameLabelFont)
        let nameLabelWidth = nameLabelTextWidth + nameLabelPaddingLeft + nameLabelPaddingRight
        
        let iconWidth = textIcon.width
        let iconHeight = textIcon.height
        
        let iconPaddingLeft = magicalSexyButtonViewModel.iconPaddingLeft
        let iconPaddingRight = magicalSexyButtonViewModel.iconPaddingRight
        let iconPaddingTop = SexyButtonLayout.getIconPaddingTop(orientation: orientation,
                                                                    flavor: layoutSchemeFlavor,
                                                                    numberOfLines: numberOfLines)
        
        let contentHeight = magicalSexyButtonViewModel.layoutHeight - (universalPaddingTop + universalPaddingBottom)
        
        let contextPaddingTop = SexyButtonLayout.getContextPaddingTop(orientation: orientation)
        let contextPaddingBottom = SexyButtonLayout.getContextPaddingBottom(orientation: orientation)
        let contextCornerRadius = SexyButtonLayout.getContextCornerRadius(orientation: orientation)
        var contextPaddingLeft: Int
        var contextPaddingRight: Int
        if Device.isPad {
            contextPaddingLeft = 2
            contextPaddingRight = 2
        } else {
            contextPaddingLeft = 1
            contextPaddingRight = 1
        }
        
        let contextColor: Color
        if isDarkMode {
            contextColor = ToolInterfaceTheme.contextUnderlayEnabledDark
        } else {
            contextColor = ToolInterfaceTheme.contextUnderlayEnabledLight
        }
        
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
        
        return ZStack {
            if isPressed {
                HStack(spacing: 0.0) {
                    Spacer()
                        .frame(width: CGFloat(contextPaddingLeft))
                    VStack(spacing: 0.0) {
                        Spacer()
                            .frame(height: CGFloat(contextPaddingTop))
                        RoundedRectangle(cornerRadius: CGFloat(contextCornerRadius))
                            .foregroundColor(contextColor)
                        Spacer()
                            .frame(height: CGFloat(contextPaddingBottom))
                    }
                    Spacer()
                        .frame(width: CGFloat(contextPaddingRight))
                }
            }
            
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
                        .background(Color(red: 0.45, green: 0.85, blue: 0.65, opacity: 0.40))
#else
                    Spacer()
                        .frame(width: CGFloat(universalPaddingLeft))
                    
#endif
                    
                    ZStack {
                        ZStack {
                            VStack(spacing: 0.0) {
                                IconBoxMainTab(icon: textIcon,
                                               iconWidth: iconWidth,
                                               iconHeight: iconHeight,
                                               iconPaddingLeft: iconPaddingLeft,
                                               iconPaddingRight: iconPaddingRight,
                                               iconPaddingTop: iconPaddingTop)
                                Spacer(minLength: 0.0)
                            }
                            VStack(spacing: 0.0) {
                                Spacer(minLength: 0.0)
                                LabelBox(line1: line1,
                                         line2: line2,
                                         numberOfLines: numberOfLines,
                                         width: nameLabelWidth,
                                         paddingLeft: nameLabelPaddingLeft,
                                         paddingRight: nameLabelPaddingRight,
                                         paddingBottom: nameLabelPaddingBottom,
                                         lineHeight: lineHeight,
                                         spacingVertical: nameLabelVerticalSpacing,
                                         font: nameLabelFont,
                                         color: color)
                            }
                        }
                        
                    }
                    .frame(height: CGFloat(contentHeight))
                    
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
               height: CGFloat(magicalSexyButtonViewModel.layoutHeight))
    }
}

