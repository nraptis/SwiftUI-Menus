//
//  MagicalButtonContent.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/3/24.
//

import SwiftUI

struct MagicalButtonContent: View {
    
    @Environment(MagicalButtonViewModel.self) var magicalViewModel
    
    let layoutSchemeFlavor: LayoutSchemeFlavor
    let isPressed: Bool
    let layoutWidth: Int
    let layoutHeight: Int
    
    var body: some View {
        
        let orientation = magicalViewModel.orientation
        let configuration = magicalViewModel.buttonConfiguration
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
        
        var testArrowLeft: (any TextIconable)?
        if ApplicationController.isPurchased {
            testArrowLeft = FramedLongIconLibrary.uncoloredLock.getTextIcon(orientation: orientation,
                                                                   layoutSchemeFlavor: .long,
                                                                   numberOfLines: 0,
                                                                   isDarkMode: isDarkMode,
                                                                   isEnabled: isEnabled)
        }
        
        
        
        let line1 = configuration.nameLabelLine1
        let line2 = configuration.nameLabelLine2
        
        let nameLabelFont = ButtonLayout.getNameLabelFont(orientation: orientation,
                                                          flavor: layoutSchemeFlavor)
        let nameLabelVerticalSpacing = ButtonLayout.getNameLabelVerticalSpacing(orientation: orientation,
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
        
        let heroPaddingTopStacked = ButtonLayout.getHeroPaddingTopStacked(orientation: orientation, numberOfLines: numberOfLines)
        let heroPaddingBottomStacked = ButtonLayout.getHeroPaddingBottomStacked(orientation: orientation, numberOfLines: numberOfLines)
        
        var accentWidth = 0
        var accentHeight = 0
        var accentContentWidth = 0
        
        if let testArrowLeft = testArrowLeft {
            accentWidth = testArrowLeft.width
            accentHeight = testArrowLeft.height
            accentContentWidth = testArrowLeft.width + magicalViewModel.accentPaddingLeft + magicalViewModel.accentPaddingRight
            
        }
        
        return HStack(spacing: 0.0) {
            HeroSlab(orientation: orientation,
                     layoutWidth: layoutWidth - accentContentWidth,
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
            
            if let testArrowLeft = testArrowLeft {
#if INTERFACE_HINTS
                Spacer(minLength: 0.0)
                    .frame(width: CGFloat(magicalViewModel.accentPaddingLeft), height: 24.0)
                    .background(Color(red: 0.35, green: 0.61, blue: 0.81, opacity: 0.40))
#else
                Spacer(minLength: 0.0)
                    .frame(width: CGFloat(magicalViewModel.accentPaddingLeft))
#endif
                
                IconBoxMainTab(icon: testArrowLeft,
                               iconWidth: accentWidth,
                               iconHeight: accentHeight,
                               iconPaddingLeft: 0,
                               iconPaddingRight: 0,
                               iconPaddingTop: 0)
                
#if INTERFACE_HINTS
                Spacer(minLength: 0.0)
                    .frame(width: CGFloat(magicalViewModel.accentPaddingRight), height: 24.0)
                    .background(Color(red: 0.47, green: 0.87, blue: 0.16, opacity: 0.70))
#else
                Spacer(minLength: 0.0)
                    .frame(width: CGFloat(magicalViewModel.accentPaddingRight))
#endif
                
            }
            
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
