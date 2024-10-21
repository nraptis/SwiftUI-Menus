//
//  MagicalActiveSwatchButtonContent.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/3/24.
//

import SwiftUI

struct MagicalActiveSwatchButtonContent: View {
    
    @Environment(MagicalCreateSwatchViewModel.self) var magicalViewModel
    
    let activeButtonViewModel: MagicalSegmentButtonViewModel
    let activeButtonConfiguration: ToolInterfaceElementCreateSwatchButtonConfiguration
    let firstButtonViewModel: MagicalSegmentButtonViewModel
    let layoutSchemeFlavor: LayoutSchemeFlavor
    let isPressed: Bool
    let isEnabled: Bool
    let layoutWidth: Int
    let layoutHeight: Int
    
    var body: some View {
        
        let orientation = magicalViewModel.orientation
        let isDarkMode = magicalViewModel.isDarkModeEnabled
        let numberOfLines = activeButtonConfiguration.nameLabelNumberOfLines
        let textIcon = activeButtonConfiguration.iconPack.getTextIcon(orientation: orientation,
                                                                      layoutSchemeFlavor: .long,
                                                                      numberOfLines: numberOfLines,
                                                                      isDarkMode: isDarkMode,
                                                                      isEnabled: isEnabled)
        let checkBoxSquare = FramedLongIconLibrary.checkBoxSquare.getTextIcon(orientation: orientation,
                                                                              layoutSchemeFlavor: .long,
                                                                              numberOfLines: 0,
                                                                              isDarkMode: isDarkMode,
                                                                              isEnabled: isEnabled)
        let checkBoxCheck = FramedLongIconLibrary.checkBoxCheck.getTextIcon(orientation: orientation,
                                                                            layoutSchemeFlavor: .long,
                                                                            numberOfLines: 0,
                                                                            isDarkMode: isDarkMode,
                                                                            isEnabled: isEnabled)
        let line1 = activeButtonConfiguration.nameLabelLine1
        let line2 = activeButtonConfiguration.nameLabelLine2
        let nameLabelFont = CreateSwatchLayout.getNameLabelFont(orientation: orientation,
                                                                flavor: layoutSchemeFlavor)
        let nameLabelVerticalSpacing = CreateSwatchLayout.getNameLabelVerticalSpacing(orientation: orientation,
                                                                                      flavor: layoutSchemeFlavor)
        let nameLabelWidth: Int
        switch layoutSchemeFlavor {
        case .long, .stackedLarge:
            nameLabelWidth = activeButtonConfiguration.nameLabelWidthLarge
        case .stackedMedium:
            nameLabelWidth = activeButtonConfiguration.nameLabelWidthMedium
        case .stackedSmall:
            nameLabelWidth = activeButtonConfiguration.nameLabelWidthSmall
        }
        
        let lineHeight = ToolInterfaceTheme.getLineHeight(font: nameLabelFont)
        let nameLabelColor: Color
        if isDarkMode {
            if isPressed {
                nameLabelColor = ToolInterfaceTheme.createSwatchActiveCheckStrokePressedDark
            } else {
                nameLabelColor = ToolInterfaceTheme.createSwatchActiveCheckStrokeDark
            }
        } else {
            if isPressed {
                nameLabelColor = ToolInterfaceTheme.createSwatchActiveCheckStrokePressedLight
            } else {
                nameLabelColor = ToolInterfaceTheme.createSwatchActiveCheckStrokeLight
            }
        }
        
        let heroPaddingTopStacked = CreateSwatchLayout.getHeroPaddingTopStacked(orientation: orientation,
                                                                                numberOfLines: numberOfLines)
        let heroPaddingBottomStacked = CreateSwatchLayout.getHeroPaddingBottomStacked(orientation: orientation,
                                                                                      numberOfLines: numberOfLines)
        
        let slaveWidth = checkBoxSquare.width
        let slaveHeight = checkBoxSquare.height
        let checkWidth = checkBoxCheck.width
        let checkHeight = checkBoxCheck.height
        let slavePaddingRight = CheckBoxLayout.getSlavePaddingRight(orientation: orientation,
                                                                    squeeze: .standard)
        let slaveContentWidth = slaveWidth + slavePaddingRight
        return HStack(spacing: 0.0) {
            HeroSlab(orientation: orientation,
                     layoutWidth: layoutWidth - slaveContentWidth,
                     layoutHeight: layoutHeight,
                     isLong: true,
                     isPressed: isPressed,
                     textIcon: textIcon,
                     heroPaddingLeft: firstButtonViewModel.heroPaddingLeft,
                     heroPaddingRight: firstButtonViewModel.heroPaddingRight,
                     heroPaddingTopStacked: heroPaddingTopStacked,
                     heroPaddingBottomStacked: heroPaddingBottomStacked,
                     heroSpacingLong: firstButtonViewModel.heroSpacing,
                     line1: line1,
                     line2: line2,
                     numberOfLines: numberOfLines,
                     nameLabelVerticalSpacing: nameLabelVerticalSpacing,
                     nameLabelFont: nameLabelFont,
                     nameLabelWidth: nameLabelWidth,
                     lineHeight: lineHeight,
                     nameLabelColor: nameLabelColor)
            
            Spacer(minLength: 0.0)
            ZStack {
                IconBoxMainTab(icon: checkBoxSquare,
                               iconWidth: slaveWidth,
                               iconHeight: slaveHeight,
                               iconPaddingLeft: 0,
                               iconPaddingRight: 0,
                               iconPaddingTop: 0)
                IconBoxMainTab(icon: checkBoxCheck,
                               iconWidth: checkWidth,
                               iconHeight: checkHeight,
                               iconPaddingLeft: 0,
                               iconPaddingRight: 0,
                               iconPaddingTop: 0)
            }
            .frame(width: CGFloat(slaveWidth), height: CGFloat(slaveHeight))
            .compositingGroup()
            .opacity(isPressed ? 0.75 : 1.0)
            
#if INTERFACE_HINTS
            Spacer()
                .frame(width: CGFloat(slavePaddingRight), height: 24.0)
                .background(Color(red: 0.47, green: 0.87, blue: 0.16, opacity: 0.70))
#else
            Spacer()
                .frame(width: CGFloat(slavePaddingRight))
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
