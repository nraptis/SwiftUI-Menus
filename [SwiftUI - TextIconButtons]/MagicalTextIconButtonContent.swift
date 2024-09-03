//
//  MagicalTextIconButtonContent.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 4/5/24.
//

import SwiftUI

struct MagicalTextIconButtonContent: View {
    
    @Environment(MagicalTextIconButtonViewModel.self) var magicalTextIconButtonViewModel: MagicalTextIconButtonViewModel
    
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
        
        let configuration = magicalTextIconButtonViewModel.textIconButtonConfiguration
        let isDarkMode = magicalTextIconButtonViewModel.isDarkModeEnabled
        let textIcon = configuration.getTextIcon(orientation: orientation,
                                                 layoutSchemeFlavor: layoutSchemeFlavor,
                                                 isDarkMode: isDarkMode,
                                                 isEnabled: isEnabled)
        
        let line1 = configuration.nameLabelLine1
        let line2 = configuration.nameLabelLine2
        
        let numberOfLines = configuration.nameLabelNumberOfLines
        
        let nameLabelFont = TextIconButtonLayout.getNameLabelFont(orientation: orientation,
                                                                  flavor: layoutSchemeFlavor)
        let nameLabelPaddingBottom = TextIconButtonLayout.getNameLabelPaddingBottom(orientation: orientation,
                                                                                    flavor: layoutSchemeFlavor,
                                                                                    numberOfLines: numberOfLines)
        let nameLabelPaddingLeft = magicalTextIconButtonViewModel.nameLabelPaddingLeft
        let nameLabelPaddingRight = magicalTextIconButtonViewModel.nameLabelPaddingRight
        let nameLabelVerticalSpacing = TextIconButtonLayout.getNameLabelVerticalSpacing(orientation: orientation,
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
        
        let iconWidth = textIcon.width
        let iconHeight = textIcon.height
        
        let iconPaddingLeft = magicalTextIconButtonViewModel.iconPaddingLeft
        let iconPaddingRight = magicalTextIconButtonViewModel.iconPaddingRight
        let iconPaddingTop = TextIconButtonLayout.getIconPaddingTop(orientation: orientation,
                                                                    flavor: layoutSchemeFlavor,
                                                                    numberOfLines: numberOfLines)
        
        let contentHeight = magicalTextIconButtonViewModel.layoutHeight - (universalPaddingTop + universalPaddingBottom)
        
        let contextPaddingTop = TextIconButtonLayout.getContextPaddingTop(orientation: orientation)
        let contextPaddingBottom = TextIconButtonLayout.getContextPaddingBottom(orientation: orientation)
        let contextCornerRadius = TextIconButtonLayout.getContextCornerRadius(orientation: orientation)
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
                        switch layoutSchemeFlavor {
                        case .long:
                            HStack(spacing: 0.0) {
                                IconBox(icon: textIcon,
                                        iconWidth: iconWidth,
                                        iconHeight: iconHeight,
                                        iconPaddingLeft: iconPaddingLeft,
                                        iconPaddingRight: iconPaddingRight,
                                        iconPaddingTop: iconPaddingTop,
                                        color: color)
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
                            }
                        case .stackedLarge, .stackedMedium, .stackedSmall:
                            
                            ZStack {
                                VStack(spacing: 0.0) {
                                    IconBox(icon: textIcon,
                                            iconWidth: iconWidth,
                                            iconHeight: iconHeight,
                                            iconPaddingLeft: iconPaddingLeft,
                                            iconPaddingRight: iconPaddingRight,
                                            iconPaddingTop: iconPaddingTop,
                                            color: color)
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
               height: CGFloat(magicalTextIconButtonViewModel.layoutHeight))
    }
}

