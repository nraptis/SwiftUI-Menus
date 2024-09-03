//
//  MagicalGreenButtonContent.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/2/24.
//

import SwiftUI

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
        
        let textIcon = configuration.getTextIcon(orientation: orientation,
                                                 layoutSchemeFlavor: .long,
                                                 isDarkMode: isDarkMode,
                                                 isEnabled: isEnabled)
        
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
                Color("green_button_fill_down") : Color("green_button_fill_up")))
            
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
