//
//  MagicalMainTabSegmentContent.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/24/24.
//

import SwiftUI

struct MagicalMainTabSegmentContent: View {
    
    @Environment(MagicalMainTabViewModel.self) var magicalViewModel
    @Environment(MagicalMainTabButtonViewModel.self) var magicalButtonViewModel
    
    let layoutSchemeFlavor: LayoutSchemeFlavor
    let layoutHeight: Int
    let isSelected: Bool
    let isPressed: Bool
    
    var body: some View {
        
        let layoutWidth = magicalButtonViewModel.layoutWidth
        let orientation = magicalViewModel.orientation
        let configuration = magicalButtonViewModel.mainTabButtonConfiguration
        let isDarkMode = magicalViewModel.isDarkModeEnabled
        let isEnabled = magicalButtonViewModel.isEnabled && magicalViewModel.isEnabled
        
        let numberOfLines = configuration.nameLabelNumberOfLines
        let textIcon = configuration.iconPack.getTextIcon(orientation: orientation,
                                                          layoutSchemeFlavor: layoutSchemeFlavor,
                                                          numberOfLines: numberOfLines,
                                                          isDarkMode: isDarkMode,
                                                          isEnabled: isEnabled)
        
        let testArrowLeft = FramedLongIconLibrary.testArrowLeft.getTextIcon(orientation: orientation,
                                                                            layoutSchemeFlavor: .long,
                                                                            numberOfLines: 0,
                                                                            isDarkMode: isDarkMode,
                                                                            isEnabled: isEnabled)
        
        let testArrowRight = FramedLongIconLibrary.testArrowRight.getTextIcon(orientation: orientation,
                                                                              layoutSchemeFlavor: .long,
                                                                              numberOfLines: 0,
                                                                              isDarkMode: isDarkMode,
                                                                              isEnabled: isEnabled)
        
        let line1 = configuration.nameLabelLine1
        let line2 = configuration.nameLabelLine2
        
        let nameLabelFont = MainTabLayout.getNameLabelFont(orientation: orientation,
                                                           flavor: layoutSchemeFlavor)
        let nameLabelVerticalSpacing = MainTabLayout.getNameLabelVerticalSpacing(orientation: orientation,
                                                                                 flavor: layoutSchemeFlavor)
        
        let nameLabelWidth: Int
        switch layoutSchemeFlavor {
        case .long, .stackedLarge:
            nameLabelWidth = configuration.nameLabelWidthLarge
        case .stackedMedium:
            nameLabelWidth = configuration.nameLabelWidthMedium
        case .stackedSmall:
            nameLabelWidth = configuration.nameLabelWidthSmall
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
                if isSelected {
                    if isEnabled {
                        nameLabelColor = ToolInterfaceTheme.primaryEnabledDark
                    } else {
                        nameLabelColor = ToolInterfaceTheme.primaryDisabledDark
                    }
                } else {
                    if isEnabled {
                        nameLabelColor = ToolInterfaceTheme.primaryUnselectedEnabledDark
                    } else {
                        nameLabelColor = ToolInterfaceTheme.primaryUnselectedDisabledDark
                    }
                }
            } else {
                if isSelected {
                    if isEnabled {
                        nameLabelColor = ToolInterfaceTheme.primaryEnabledLight
                    } else {
                        nameLabelColor = ToolInterfaceTheme.primaryDisabledLight
                    }
                } else {
                    if isEnabled {
                        nameLabelColor = ToolInterfaceTheme.primaryUnselectedEnabledLight
                    } else {
                        nameLabelColor = ToolInterfaceTheme.primaryUnselectedDisabledLight
                    }
                }
            }
        }
        
        let slaveWidth = testArrowLeft.width
        let slaveHeight = testArrowLeft.height
        let slaveContentWidth = testArrowLeft.width + magicalButtonViewModel.slavePaddingLeft + magicalButtonViewModel.slavePaddingRight
        
        
        let accentWidth = testArrowRight.width
        let accentHeight = testArrowRight.height
        let accentContentWidth = testArrowRight.width + magicalButtonViewModel.accentPaddingLeft + magicalButtonViewModel.accentPaddingRight
        
        let heroPaddingTopStacked = MainTabLayout.getHeroPaddingTopStacked(orientation: orientation)
        let heroPaddingBottomStacked = MainTabLayout.getHeroPaddingBottomStacked(orientation: orientation)
        
        return HStack(spacing: 0.0) {
            HeroSlab(orientation: orientation,
                     layoutWidth: layoutWidth - slaveContentWidth - accentContentWidth,
                     layoutHeight: layoutHeight,
                     isLong: true,
                     isPressed: isPressed,
                     textIcon: textIcon,
                     heroPaddingLeft: magicalButtonViewModel.heroPaddingLeft,
                     heroPaddingRight: magicalButtonViewModel.heroPaddingRight,
                     heroPaddingTopStacked: heroPaddingTopStacked,
                     heroPaddingBottomStacked: heroPaddingBottomStacked,
                     heroSpacingLong: magicalButtonViewModel.heroSpacing,
                     line1: line1,
                     line2: line2,
                     numberOfLines: numberOfLines,
                     nameLabelVerticalSpacing: nameLabelVerticalSpacing,
                     nameLabelFont: nameLabelFont,
                     nameLabelWidth: nameLabelWidth,
                     lineHeight: lineHeight,
                     nameLabelColor: nameLabelColor)
            
            
#if INTERFACE_HINTS
            Spacer()
                .frame(width: CGFloat(magicalButtonViewModel.slavePaddingLeft), height: 24.0)
                .background(Color(red: 0.35, green: 0.61, blue: 0.81, opacity: 0.40))
#else
            Spacer()
                .frame(width: CGFloat(magicalButtonViewModel.slavePaddingLeft))
#endif
            
            IconBoxMainTab(icon: testArrowLeft,
                           iconWidth: slaveWidth,
                           iconHeight: slaveHeight,
                           iconPaddingLeft: 0,
                           iconPaddingRight: 0,
                           iconPaddingTop: 0)
            
#if INTERFACE_HINTS
            Spacer()
                .frame(width: CGFloat(magicalButtonViewModel.slavePaddingRight), height: 24.0)
                .background(Color(red: 0.47, green: 0.87, blue: 0.16, opacity: 0.70))
#else
            Spacer()
                .frame(width: CGFloat(magicalButtonViewModel.slavePaddingRight))
#endif
            
            
#if INTERFACE_HINTS
            Spacer()
                .frame(width: CGFloat(magicalButtonViewModel.accentPaddingLeft), height: 24.0)
                .background(Color(red: 0.35, green: 0.61, blue: 0.81, opacity: 0.40))
#else
            Spacer()
                .frame(width: CGFloat(magicalButtonViewModel.accentPaddingLeft))
#endif
            
            IconBoxMainTab(icon: testArrowRight,
                           iconWidth: accentWidth,
                           iconHeight: accentHeight,
                           iconPaddingLeft: 0,
                           iconPaddingRight: 0,
                           iconPaddingTop: 0)
            
#if INTERFACE_HINTS
            Spacer()
                .frame(width: CGFloat(magicalButtonViewModel.accentPaddingRight), height: 24.0)
                .background(Color(red: 0.47, green: 0.87, blue: 0.16, opacity: 0.70))
#else
            Spacer()
                .frame(width: CGFloat(magicalButtonViewModel.accentPaddingRight))
#endif
            
        }
    }
}
