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
        
        let nameLabelWidth = configuration.nameLabelWidth
        
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

/*

struct MagicalGreenButtonContent: View {
    
    @Environment(MagicalGreenButtonViewModel.self) var magicalGreenButtonViewModel: MagicalGreenButtonViewModel
    
    let orientation: Orientation
    let isPressed: Bool
    let universalPaddingTop: Int
    let universalPaddingBottom: Int
    let layoutWidth: Int
    
    var body: some View {
        
        let configuration = magicalGreenButtonViewModel.greenButtonConfiguration
        let isDarkMode = magicalGreenButtonViewModel.isDarkModeEnabled
        let isEnabled = magicalGreenButtonViewModel.isEnabled
        
        let textIcon = configuration.iconPack.getTextIcon(orientation: Orientation.landscape, layoutSchemeFlavor: .long, numberOfLines: 1, isDarkMode: true, isEnabled: false)
        
        let line1 = configuration.nameLabelLine1
        let line2 = configuration.nameLabelLine2
        
        let numberOfLines = configuration.nameLabelNumberOfLines
        
        let nameLabelFont = GreenButtonLayout.getNameLabelFont(orientation: orientation,
                                                               flavor: .long)
        let nameLabelPaddingBottom = GreenButtonLayout.getNameLabelPaddingBottom(orientation: orientation,
                                                                                 flavor: .long,
                                                                                 numberOfLines: numberOfLines)
        let nameLabelPaddingLeft = magicalGreenButtonViewModel.nameLabelPaddingLeft
        let nameLabelPaddingRight = magicalGreenButtonViewModel.nameLabelPaddingRight
        let nameLabelVerticalSpacing = GreenButtonLayout.getNameLabelVerticalSpacing(orientation: orientation,
                                                                                     flavor: .long)
        
        let nameLabelTextWidth = configuration.nameLabelWidth
        
        let lineHeight = ToolInterfaceTheme.getLineHeight(font: nameLabelFont)
        let nameLabelWidth = nameLabelTextWidth + nameLabelPaddingLeft + nameLabelPaddingRight
        
        let iconWidth = textIcon.width
        let iconHeight = textIcon.height
        
        let iconPaddingLeft = magicalGreenButtonViewModel.iconPaddingLeft
        let iconPaddingRight = magicalGreenButtonViewModel.iconPaddingRight
        let iconPaddingTop = GreenButtonLayout.getIconPaddingTop(orientation: orientation,
                                                                 flavor: .long,
                                                                 numberOfLines: numberOfLines)
        
        let contentHeight = magicalGreenButtonViewModel.layoutHeight - (universalPaddingTop + universalPaddingBottom)
        
        let color = magicalGreenButtonViewModel.getTextAndIconColor(isPressed: isPressed,
                                                                    isDarkModeEnabled: magicalGreenButtonViewModel.isDarkModeEnabled)
        
        let cornerRadius = GreenButtonLayout.getCornerRadiusOuter(orientation: magicalGreenButtonViewModel.orientation)
        
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
                    IconBox(icon: textIcon,
                            iconWidth: iconWidth,
                            iconHeight: iconHeight,
                            iconPaddingLeft: iconPaddingLeft,
                            iconPaddingRight: iconPaddingRight,
                            iconPaddingTop: iconPaddingTop,
                            color: color)
                }
            }
            .frame(height: CGFloat(contentHeight))
            .background(RoundedRectangle(cornerRadius: CGFloat(cornerRadius)).foregroundStyle(
                isPressed ?
                ToolInterfaceTheme.greenButtonFill : ToolInterfaceTheme.greenButtonFillDown))
            
            
            
            
#if INTERFACE_HINTS
            Spacer()
                .frame(width: 24.0, height: CGFloat(universalPaddingBottom))
                .background(Color(red: 0.65, green: 0.85, blue: 0.75, opacity: 0.40))
#else
            Spacer()
                .frame(height: CGFloat(universalPaddingBottom))
#endif
            
        }
        .frame(width: CGFloat(layoutWidth),
               height: CGFloat(magicalGreenButtonViewModel.layoutHeight))
        
    }
}
*/
