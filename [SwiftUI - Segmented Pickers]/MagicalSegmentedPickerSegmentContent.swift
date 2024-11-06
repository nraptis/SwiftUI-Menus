//
//  MagicalSegmentedPickerSegmentContent.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/24/24.
//

import SwiftUI

struct MagicalSegmentedPickerSegmentContent: View {
    
    @Environment(MagicalSegmentedPickerViewModel.self) var magicalViewModel
    @Environment(MagicalSegmentedPickerButtonViewModel.self) var magicalButtonViewModel
    
    let layoutSchemeFlavor: LayoutSchemeFlavor
    let layoutHeight: Int
    let isSelected: Bool
    let isPressed: Bool
    let isEnabled: Bool
    
    var body: some View {
        
        let layoutWidth = magicalButtonViewModel.layoutWidth
        let orientation = magicalViewModel.orientation
        let configuration = magicalButtonViewModel.segmentedPickerButtonConfiguration
        let isDarkMode = magicalViewModel.isDarkModeEnabled
        
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
        
        let checkBoxSquare = FramedLongIconLibrary.checkBoxSquare.getTextIcon(orientation: orientation,
                                                                              layoutSchemeFlavor: .long,
                                                                              numberOfLines: 0,
                                                                              isDarkMode: isDarkMode,
                                                                              isEnabled: isEnabled)
        
        let testArrowLeft = FramedLongIconLibrary.testArrowRight.getTextIcon(orientation: orientation,
                                                                             layoutSchemeFlavor: .long,
                                                                             numberOfLines: 0,
                                                                             isDarkMode: isDarkMode,
                                                                             isEnabled: isEnabled)
        
        let line1 = configuration.nameLabelLine1
        let line2 = configuration.nameLabelLine2
        
        let nameLabelFont = SegmentedPickerLayout.getNameLabelFont(orientation: orientation,
                                                                   flavor: layoutSchemeFlavor)
        let nameLabelVerticalSpacing = SegmentedPickerLayout.getNameLabelVerticalSpacing(orientation: orientation,
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
        
        let heroPaddingTopStacked = SegmentedPickerLayout.getHeroPaddingTopStacked(orientation: orientation,
                                                                                   numberOfLines: numberOfLines)
        let heroPaddingBottomStacked = SegmentedPickerLayout.getHeroPaddingBottomStacked(orientation: orientation,
                                                                                         numberOfLines: numberOfLines)
        
        //let slaveWidth = checkBoxSquare.width
        //let slaveHeight = checkBoxSquare.height
        //let slaveContentWidth = checkBoxSquare.width + magicalButtonViewModel.slavePaddingLeft + magicalButtonViewModel.slavePaddingRight
        
        //let accentWidth = testArrowLeft.width
        //let accentHeight = testArrowLeft.height
        //let accentContentWidth = testArrowLeft.width + magicalButtonViewModel.accentPaddingLeft + magicalButtonViewModel.accentPaddingRight
        
        var computedHeroWidth = 0
        switch layoutSchemeFlavor {
        case .long:
            computedHeroWidth += textIcon.width
            computedHeroWidth += nameLabelWidth
            computedHeroWidth += magicalButtonViewModel.heroSpacing
        default:
            computedHeroWidth += max(textIcon.width, nameLabelWidth)
        }
        computedHeroWidth += magicalButtonViewModel.heroPaddingLeft
        computedHeroWidth += magicalButtonViewModel.heroPaddingRight
        
        
        return HStack(spacing: 0.0) {
            HeroSlab(orientation: orientation,
                     layoutWidth: layoutWidth,// - slaveContentWidth - accentContentWidth,
                     layoutHeight: layoutHeight,
                     isLong: isLong,
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
            
            /*
#if INTERFACE_HINTS
            Spacer(minLength: 0.0)
                .frame(width: CGFloat(magicalButtonViewModel.slavePaddingLeft), height: 24.0)
                .background(Color(red: 0.35, green: 0.61, blue: 0.81, opacity: 0.40))
#else
            Spacer(minLength: 0.0)
                .frame(width: CGFloat(magicalButtonViewModel.slavePaddingLeft))
#endif
            
            IconBoxMainTab(icon: checkBoxSquare,
                           iconWidth: slaveWidth,
                           iconHeight: slaveHeight,
                           iconPaddingLeft: 0,
                           iconPaddingRight: 0,
                           iconPaddingTop: 0)
            
#if INTERFACE_HINTS
            Spacer(minLength: 0.0)
                .frame(width: CGFloat(magicalButtonViewModel.slavePaddingRight), height: 24.0)
                .background(Color(red: 0.47, green: 0.87, blue: 0.16, opacity: 0.70))
#else
            Spacer(minLength: 0.0)
                .frame(width: CGFloat(magicalButtonViewModel.slavePaddingRight))
#endif
            
            
#if INTERFACE_HINTS
            Spacer(minLength: 0.0)
                .frame(width: CGFloat(magicalButtonViewModel.accentPaddingLeft), height: 24.0)
                .background(Color(red: 0.35, green: 0.61, blue: 0.81, opacity: 0.40))
#else
            Spacer(minLength: 0.0)
                .frame(width: CGFloat(magicalButtonViewModel.accentPaddingLeft))
#endif
            
            IconBoxMainTab(icon: testArrowLeft,
                           iconWidth: accentWidth,
                           iconHeight: accentHeight,
                           iconPaddingLeft: 0,
                           iconPaddingRight: 0,
                           iconPaddingTop: 0)
            
#if INTERFACE_HINTS
            Spacer(minLength: 0.0)
                .frame(width: CGFloat(magicalButtonViewModel.accentPaddingRight), height: 24.0)
                .background(Color(red: 0.47, green: 0.87, blue: 0.16, opacity: 0.70))
#else
            Spacer(minLength: 0.0)
                .frame(width: CGFloat(magicalButtonViewModel.accentPaddingRight))
#endif
            */
            
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
