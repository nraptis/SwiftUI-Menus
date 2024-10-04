//
//  MagicalSexyStepperContents.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/13/24.
//

import SwiftUI

//struct MagicalSexyStepperContents: View {

struct MagicalSexyStepperContent: View {
    
    @Environment(MagicalSexyStepperViewModel.self) var magicalSexyStepperViewModel: MagicalSexyStepperViewModel
    
    let orientation: Orientation
    let layoutSchemeFlavor: LayoutSchemeFlavor
    let isDarkMode: Bool
    let isEnabled: Bool
    let isIncrementEnabled: Bool
    let isDecrementEnabled: Bool
    
    let universalPaddingLeft: Int
    let universalPaddingRight: Int
    let universalPaddingTop: Int
    let universalPaddingBottom: Int
    let layoutWidth: Int
    let valueString: String
    
    var body: some View {
        
        let configuration = magicalSexyStepperViewModel.sexyStepperConfiguration
        
        let icon = configuration.iconPack.getTextIcon(orientation: orientation,
                                                      layoutSchemeFlavor: layoutSchemeFlavor,
                                                      numberOfLines: configuration.nameLabelNumberOfLines,
                                                      isDarkMode: isDarkMode,
                                                      isEnabled: isEnabled)
        
        let increment = configuration.incrementPack.getTextIcon(orientation: orientation,
                                                                layoutSchemeFlavor: layoutSchemeFlavor,
                                                                numberOfLines: configuration.nameLabelNumberOfLines,
                                                                isDarkMode: isDarkMode,
                                                                isEnabled: isEnabled && isIncrementEnabled)
        
        let decrement = configuration.decrementPack.getTextIcon(orientation: orientation,
                                                                layoutSchemeFlavor: layoutSchemeFlavor,
                                                                numberOfLines: configuration.nameLabelNumberOfLines,
                                                                isDarkMode: isDarkMode,
                                                                isEnabled: isEnabled && isDecrementEnabled)
        
        
        let line1 = configuration.nameLabelLine1
        let line2 = configuration.nameLabelLine2
        
        let nameLabelNumberOfLines = configuration.nameLabelNumberOfLines
        
        let nameLabelFont = SexyStepperLayout.getNameLabelFont(orientation: orientation,
                                                               flavor: layoutSchemeFlavor)
        
        let nameLabelPaddingLeft = magicalSexyStepperViewModel.nameLabelPaddingLeft
        let nameLabelPaddingRight = magicalSexyStepperViewModel.nameLabelPaddingRight
        let nameLabelVerticalSpacing = SexyStepperLayout.getNameLabelVerticalSpacing(orientation: orientation,
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
        
        let nameLabelLineHeight = ToolInterfaceTheme.getLineHeight(font: nameLabelFont)
        let nameLabelWidth = nameLabelTextWidth + nameLabelPaddingLeft + nameLabelPaddingRight
        
        
        let valueLabelNumberOfLines = 1
        
        let valueLabelFont = SexyStepperLayout.getValueLabelFont(orientation: orientation,
                                                                 flavor: layoutSchemeFlavor)
        
        
        
        
        let valueLabelPaddingLeft = magicalSexyStepperViewModel.valueLabelPaddingLeft
        let valueLabelPaddingRight = magicalSexyStepperViewModel.valueLabelPaddingRight
        let valueLabelVerticalSpacing = 0
        
        let valueLabelTextWidth: Int
        switch layoutSchemeFlavor {
        case .long:
            valueLabelTextWidth = configuration.valueLabelWidthLarge
        case .stackedLarge:
            valueLabelTextWidth = configuration.valueLabelWidthLarge
        case .stackedMedium:
            valueLabelTextWidth = configuration.valueLabelWidthMedium
        case .stackedSmall:
            valueLabelTextWidth = configuration.valueLabelWidthSmall
        }
        
        let valueLabelLineHeight = ToolInterfaceTheme.getLineHeight(font: valueLabelFont)
        let valueLabelWidth = valueLabelTextWidth + valueLabelPaddingLeft + valueLabelPaddingRight
        
        
        let iconWidth = icon.width
        let iconHeight = icon.height
        
        let iconPaddingLeft = magicalSexyStepperViewModel.iconPaddingLeft
        let iconPaddingRight = magicalSexyStepperViewModel.iconPaddingRight
        let iconPaddingTop = SexyStepperLayout.getIconPaddingTop(orientation: orientation,
                                                                 flavor: layoutSchemeFlavor,
                                                                 numberOfLines: nameLabelNumberOfLines)
        
        let incrementWidth = increment.width
        let incrementHeight = increment.height
        
        let incrementPaddingLeft = magicalSexyStepperViewModel.incrementPaddingLeft
        let incrementPaddingRight = magicalSexyStepperViewModel.incrementPaddingRight
        let incrementPaddingTop = 0
        
        let decrementWidth = decrement.width
        let decrementHeight = decrement.height
        
        let decrementPaddingLeft = magicalSexyStepperViewModel.decrementPaddingLeft
        let decrementPaddingRight = magicalSexyStepperViewModel.decrementPaddingRight
        let decrementPaddingTop = 0
        
        let contentHeight = magicalSexyStepperViewModel.layoutHeight - (universalPaddingTop + universalPaddingBottom)
        
        let color: Color
        
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
        
        
        let buttonUniversalPaddingLeft = magicalSexyStepperViewModel.buttonUniversalPaddingLeft
        let buttonUniversalPaddingRight = magicalSexyStepperViewModel.buttonUniversalPaddingRight
        
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
                                     numberOfLines: nameLabelNumberOfLines,
                                     width: nameLabelWidth,
                                     paddingLeft: nameLabelPaddingLeft,
                                     paddingRight: nameLabelPaddingRight,
                                     paddingBottom: 0,
                                     lineHeight: nameLabelLineHeight,
                                     spacingVertical: nameLabelVerticalSpacing,
                                     font: nameLabelFont,
                                     color: color)
                            
                            Button {
                                magicalSexyStepperViewModel.handleDecrement()
                            } label: {
                                IconBoxMainTab(icon: decrement,
                                               iconWidth: decrementWidth,
                                               iconHeight: decrementHeight,
                                               iconPaddingLeft: decrementPaddingLeft,
                                               iconPaddingRight: decrementPaddingRight,
                                               iconPaddingTop: decrementPaddingTop)
                            }
                            .disabled(!isEnabled || !isDecrementEnabled)
                            
                            
                            
                            LabelBox(line1: valueString,
                                     line2: nil,
                                     numberOfLines: valueLabelNumberOfLines,
                                     width: valueLabelWidth,
                                     paddingLeft: valueLabelPaddingLeft,
                                     paddingRight: valueLabelPaddingRight,
                                     paddingBottom: 0,
                                     lineHeight: valueLabelLineHeight,
                                     spacingVertical: valueLabelVerticalSpacing,
                                     font: valueLabelFont,
                                     color: color)
                            
                            Button {
                                magicalSexyStepperViewModel.handleIncrement()
                            } label: {
                                IconBoxMainTab(icon: increment,
                                               iconWidth: incrementWidth,
                                               iconHeight: incrementHeight,
                                               iconPaddingLeft: incrementPaddingLeft,
                                               iconPaddingRight: incrementPaddingRight,
                                               iconPaddingTop: incrementPaddingTop)
                            }
                            .disabled(!isEnabled || !isIncrementEnabled)
                            
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
               height: CGFloat(magicalSexyStepperViewModel.layoutHeight))
    }
}
