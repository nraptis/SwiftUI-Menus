//
//  MagicalSexyCheckBoxContent.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/3/24.
//

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
        
        let nameLabelFont = SexyCheckBoxLayout.getNameLabelFont(orientation: orientation,
                                                             flavor: layoutSchemeFlavor)
        
        let nameLabelPaddingLeft = magicalSexyCheckBoxViewModel.nameLabelPaddingLeft
        let nameLabelPaddingRight = magicalSexyCheckBoxViewModel.nameLabelPaddingRight
        let nameLabelVerticalSpacing = SexyCheckBoxLayout.getNameLabelVerticalSpacing(orientation: orientation,
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
        
        let iconPaddingLeft = magicalSexyCheckBoxViewModel.iconPaddingLeft
        let iconPaddingRight = magicalSexyCheckBoxViewModel.iconPaddingRight
        let iconPaddingTop = SexyCheckBoxLayout.getIconPaddingTop(orientation: orientation,
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
