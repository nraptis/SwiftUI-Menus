//
//  MagicalSexyStepperContents.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/13/24.
//

import SwiftUI

struct MagicalSexyStepperContent: View {
    
    @Environment(MagicalSexyStepperViewModel.self) var magicalViewModel
    
    let layoutSchemeFlavor: LayoutSchemeFlavor
    let layoutWidth: Int
    let layoutHeight: Int
    
    var body: some View {
        
        let orientation = magicalViewModel.orientation
        let configuration = magicalViewModel.sexyStepperConfiguration
        let isDarkMode = magicalViewModel.isDarkModeEnabled
        let isEnabled = magicalViewModel.isEnabled
        
        let valueLabelFont = SexyStepperLayout.getValueLabelFont(orientation: orientation, flavor: layoutSchemeFlavor)
        
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
        
        let incrementIcon = configuration.incrementPack.getTextIcon(orientation: orientation,
                                                                    layoutSchemeFlavor: .long,
                                                                    numberOfLines: 0,
                                                                    isDarkMode: isDarkMode,
                                                                    isEnabled: (isEnabled && magicalViewModel.isIncrementEnabled))
        
        let decrementIcon = FramedLongIconLibrary.testArrowLeft.getTextIcon(orientation: orientation,
                                                                            layoutSchemeFlavor: .long,
                                                                            numberOfLines: 0,
                                                                            isDarkMode: isDarkMode,
                                                                            isEnabled: (isEnabled && magicalViewModel.isDecrementEnabled))
        
        let line1 = configuration.nameLabelLine1
        let line2 = configuration.nameLabelLine2
        
        let nameLabelFont = SexyStepperLayout.getNameLabelFont(orientation: orientation,
                                                          flavor: layoutSchemeFlavor)
        let nameLabelVerticalSpacing = SexyStepperLayout.getNameLabelVerticalSpacing(orientation: orientation,
                                                                                flavor: layoutSchemeFlavor)
        
        let nameLabelWidth: Int
        let valueLabelWidth: Int
        switch layoutSchemeFlavor {
        case .long:
            nameLabelWidth = configuration.nameLabelWidthLong
            valueLabelWidth = configuration.valueLabelWidthLarge
        case .stackedLarge:
            nameLabelWidth = configuration.nameLabelWidthStackedLarge
            valueLabelWidth = configuration.valueLabelWidthLarge
        case .stackedMedium:
            nameLabelWidth = configuration.nameLabelWidthStackedMedium
            valueLabelWidth = configuration.valueLabelWidthMedium
        case .stackedSmall:
            nameLabelWidth = configuration.nameLabelWidthStackedSmall
            valueLabelWidth = configuration.valueLabelWidthSmall
        }
        
        let lineHeight = ToolInterfaceTheme.getLineHeight(font: nameLabelFont)
        
        let textColor: Color
        if magicalViewModel.isDarkModeEnabled {
            if magicalViewModel.isEnabled {
                textColor = ToolInterfaceTheme.primaryEnabledDark
            } else {
                textColor = ToolInterfaceTheme.primaryDisabledDark
            }
        } else {
            if magicalViewModel.isEnabled {
                textColor = ToolInterfaceTheme.primaryEnabledLight
            } else {
                textColor = ToolInterfaceTheme.primaryDisabledLight
            }
        }
        
        let heroPaddingTopStacked = SexyStepperLayout.getHeroPaddingTopStacked(orientation: orientation)
        let heroPaddingBottomStacked = SexyStepperLayout.getHeroPaddingBottomStacked(orientation: orientation)
        
        let incrementWidth = incrementIcon.width
        let incrementHeight = incrementIcon.height
        let incrementContentWidth = incrementIcon.width + magicalViewModel.slavePaddingLeft + magicalViewModel.slavePaddingRight
        
        let decrementWidth = decrementIcon.width
        let decrementHeight = decrementIcon.height
        let decrementContentWidth = decrementIcon.width + magicalViewModel.accentPaddingLeft + magicalViewModel.accentPaddingRight
        
        let valueContentWith = valueLabelWidth + magicalViewModel.valuePaddingLeft + magicalViewModel.valuePaddingRight
        
        return HStack(spacing: 0.0) {
            HeroSlab(orientation: orientation,
                     layoutWidth: layoutWidth - incrementContentWidth - decrementContentWidth - valueContentWith,
                     layoutHeight: layoutHeight,
                     isLong: isLong,
                     isPressed: false,
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
                     nameLabelColor: textColor)
            
#if INTERFACE_HINTS
            Spacer()
                .frame(width: CGFloat(magicalViewModel.slavePaddingLeft), height: 24.0)
                .background(Color(red: 0.35, green: 0.61, blue: 0.81, opacity: 0.40))
#else
            Spacer()
                .frame(width: CGFloat(magicalViewModel.slavePaddingLeft))
#endif
            
            Button {
                magicalViewModel.handleDecrement()
            } label: {
                IconBoxMainTab(icon: decrementIcon,
                               iconWidth: decrementWidth,
                               iconHeight: decrementHeight,
                               iconPaddingLeft: 0,
                               iconPaddingRight: 0,
                               iconPaddingTop: 0)
            }
            .disabled(!isEnabled || !magicalViewModel.isDecrementEnabled)
            
#if INTERFACE_HINTS
            Spacer()
                .frame(width: CGFloat(magicalViewModel.slavePaddingRight), height: 24.0)
                .background(Color(red: 0.47, green: 0.87, blue: 0.16, opacity: 0.70))
#else
            Spacer()
                .frame(width: CGFloat(magicalViewModel.slavePaddingRight))
#endif
            
            
            HStack(spacing: 0.0) {
                
                
#if INTERFACE_HINTS
                Spacer()
                    .frame(width: CGFloat(magicalViewModel.valuePaddingLeft), height: 12.0)
                    .background(Color(red: 0.98, green: 0.65, blue: 0.125, opacity: 0.5))
#else
                Spacer()
                    .frame(width: CGFloat(magicalViewModel.valuePaddingLeft))
#endif
                
                ZStack() {
                    Text(magicalViewModel.valueString)
                        .font(Font(valueLabelFont))
                        .fixedSize(horizontal: true, vertical: false)
                        .foregroundColor(textColor)
                    
                }
                .frame(width: CGFloat(valueLabelWidth),
                      height: CGFloat(layoutHeight))
#if INTERFACE_HINTS
                .overlay(Rectangle().stroke().foregroundStyle(
                    LinearGradient(colors: [Color(red: 0.96, green: 0.45, blue: 0.45, opacity: 0.85),
                                            Color(red: 0.96, green: 0.78, blue: 0.45, opacity: 0.85)], startPoint: .leading, endPoint: .trailing)))
                .background(Rectangle().foregroundStyle(Color(red: 0.85, green: 0.45, blue: 0.85, opacity: 0.65)))
#endif
                
#if INTERFACE_HINTS
                Spacer()
                    .frame(width: CGFloat(magicalViewModel.valuePaddingRight), height: 12.0)
                    .background(Color(red: 0.98, green: 0.65, blue: 0.125, opacity: 0.5))
#else
                Spacer()
                    .frame(width: CGFloat(magicalViewModel.valuePaddingRight))
#endif
                
                
            }
            .frame(width: CGFloat(valueContentWith),
                   height: CGFloat(layoutHeight))
#if INTERFACE_HINTS
            .overlay(Rectangle().stroke().foregroundStyle(
                LinearGradient(colors: [Color(red: 0.96, green: 0.45, blue: 0.45, opacity: 0.85),
                                        Color(red: 0.96, green: 0.78, blue: 0.45, opacity: 0.85)], startPoint: .leading, endPoint: .trailing)))
            .background(Rectangle().foregroundStyle(
                LinearGradient(colors: [Color(red: 0.55, green: 0.98, blue: 0.25, opacity: 0.15),
                                        Color(red: 0.45, green: 0.45, blue: 0.98, opacity: 0.15)], startPoint: .leading, endPoint: .trailing)))
#endif
            
#if INTERFACE_HINTS
            Spacer()
                .frame(width: CGFloat(magicalViewModel.accentPaddingLeft), height: 24.0)
                .background(Color(red: 0.35, green: 0.61, blue: 0.81, opacity: 0.40))
#else
            Spacer()
                .frame(width: CGFloat(magicalViewModel.accentPaddingLeft))
#endif
            
            Button {
                magicalViewModel.handleIncrement()
            } label: {
                IconBoxMainTab(icon: incrementIcon,
                               iconWidth: incrementWidth,
                               iconHeight: incrementHeight,
                               iconPaddingLeft: 0,
                               iconPaddingRight: 0,
                               iconPaddingTop: 0)
            }
            .disabled(!isEnabled || !magicalViewModel.isIncrementEnabled)
            
#if INTERFACE_HINTS
            Spacer()
                .frame(width: CGFloat(magicalViewModel.accentPaddingRight), height: 24.0)
                .background(Color(red: 0.47, green: 0.87, blue: 0.16, opacity: 0.70))
#else
            Spacer()
                .frame(width: CGFloat(magicalViewModel.accentPaddingRight))
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

