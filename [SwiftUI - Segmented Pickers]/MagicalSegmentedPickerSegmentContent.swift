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
    
    var body: some View {
        
        let layoutWidth = magicalButtonViewModel.layoutWidth
        let orientation = magicalViewModel.orientation
        let configuration = magicalButtonViewModel.segmentedPickerButtonConfiguration
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
        
        let heroPaddingTopStacked = ButtonLayout.getHeroPaddingTopStacked(orientation: orientation)
        let heroPaddingBottomStacked = ButtonLayout.getHeroPaddingBottomStacked(orientation: orientation)
        
        return HeroSlab(orientation: orientation,
                        layoutWidth: layoutWidth,
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
    }
}

/*
struct MagicalSegmentedPickerSegmentContent: View {
    
    @Environment(MagicalSegmentedPickerViewModel.self) var magicalSegmentedPickerViewModel: MagicalSegmentedPickerViewModel
    @Environment(MagicalSegmentedPickerButtonViewModel.self) var magicalSegmentedPickerButtonViewModel: MagicalSegmentedPickerButtonViewModel
    let index: Int
    let isSelected: Bool
    let isDarkMode: Bool
    let isEnabled: Bool
    let isPressed: Bool
    let orientation: Orientation
    let layoutSchemeFlavor: LayoutSchemeFlavor
    let universalPaddingTop: Int
    let universalPaddingBottom: Int
    var body: some View {
        
        let numberOfLines = magicalSegmentedPickerButtonViewModel.segmentedPickerButtonConfiguration.nameLabelNumberOfLines
        let configuration = magicalSegmentedPickerButtonViewModel.segmentedPickerButtonConfiguration
        let textIcon = configuration.iconPack.getTextIcon(orientation: magicalSegmentedPickerViewModel.orientation,
                                                          layoutSchemeFlavor: layoutSchemeFlavor,
                                                          numberOfLines: numberOfLines,
                                                          isDarkMode: isDarkMode,
                                                          isEnabled: isEnabled)
        
        let universalPaddingLeft = magicalSegmentedPickerButtonViewModel.universalPaddingLeft
        let universalPaddingRight = magicalSegmentedPickerButtonViewModel.universalPaddingRight
        
        let line1 = configuration.nameLabelLine1
        let line2 = configuration.nameLabelLine2
        
        
        
        let iconWidth = textIcon.width
        let iconHeight = textIcon.height
        
        let nameLabelFont = SegmentedPickerLayout.getNameLabelFont(orientation: orientation,
                                                                  flavor: layoutSchemeFlavor)
        let nameLabelPaddingBottom = SegmentedPickerLayout.getNameLabelPaddingBottom(orientation: orientation,
                                                                                flavor: layoutSchemeFlavor,
                                                                                numberOfLines: numberOfLines)
        let nameLabelPaddingLeft = magicalSegmentedPickerButtonViewModel.nameLabelPaddingLeft
        let nameLabelPaddingRight = magicalSegmentedPickerButtonViewModel.nameLabelPaddingRight
        let nameLabelVerticalSpacing = SegmentedPickerLayout.getNameLabelVerticalSpacing(orientation: orientation,
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
        
        let iconPaddingLeft = magicalSegmentedPickerButtonViewModel.iconPaddingLeft
        let iconPaddingRight = magicalSegmentedPickerButtonViewModel.iconPaddingRight
        let iconPaddingTop = SegmentedPickerLayout.getIconPaddingTop(orientation: orientation,
                                                            flavor: layoutSchemeFlavor,
                                                            numberOfLines: numberOfLines)
        
        let contentHeight = magicalSegmentedPickerViewModel.layoutHeight - (universalPaddingTop + universalPaddingBottom)
        
        
        let color: Color
        
        if isPressed {
            if isEnabled {
                color = ToolInterfaceTheme.primaryDownEnabled
            } else {
                color = ToolInterfaceTheme.primaryDownDisabled
            }
        } else {
            
            if isDarkMode {
                if isSelected {
                    if isEnabled {
                        color = ToolInterfaceTheme.primaryEnabledDark
                    } else {
                        color = ToolInterfaceTheme.primaryDisabledDark
                    }
                } else {
                    if isEnabled {
                        color = ToolInterfaceTheme.primaryUnselectedEnabledDark
                    } else {
                        color = ToolInterfaceTheme.primaryUnselectedDisabledDark
                    }
                }
            } else {
                if isSelected {
                    if isEnabled {
                        color = ToolInterfaceTheme.primaryEnabledLight
                    } else {
                        color = ToolInterfaceTheme.primaryDisabledLight
                    }
                } else {
                    if isEnabled {
                        color = ToolInterfaceTheme.primaryUnselectedEnabledLight
                    } else {
                        color = ToolInterfaceTheme.primaryUnselectedDisabledLight
                    }
                }
            }
        }
        
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
                
#if INTERFACE_HINTS
                    Spacer()
                        .frame(width: CGFloat(universalPaddingLeft), height: 28.0)
                        .background(Color(red: 0.85, green: 0.45, blue: 0.65, opacity: 0.40))
#else
                    Spacer()
                        .frame(width: CGFloat(universalPaddingLeft))
#endif
                
                    ZStack {
                        switch layoutSchemeFlavor {
                        case .long:
                            HStack(spacing: 0.0) {
                                IconBoxMainTab(icon: textIcon,
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
                            }
                        case .stackedLarge, .stackedMedium, .stackedSmall:
                            
                            ZStack {
                                VStack(spacing: 0.0) {
                                    IconBoxMainTab(icon: textIcon,
                                            iconWidth: iconWidth,
                                            iconHeight: iconHeight,
                                            iconPaddingLeft: iconPaddingLeft,
                                            iconPaddingRight: iconPaddingRight,
                                            iconPaddingTop: iconPaddingTop)
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
                        .background(Color(red: 1.0, green: 0.25, blue: 0.75, opacity: 0.40))
#else
                    Spacer()
                        .frame(width: CGFloat(universalPaddingRight))
#endif
                
                }
                
            }
            .frame(height: CGFloat(contentHeight))

#if INTERFACE_HINTS
            Spacer()
                .frame(width: 24.0, height: CGFloat(universalPaddingBottom))
                .background(Color(red: 0.65, green: 0.85, blue: 0.75, opacity: 0.40))
#else
            Spacer()
                .frame(height: CGFloat(universalPaddingBottom))
#endif
            
        }
        .frame(width: CGFloat(magicalSegmentedPickerButtonViewModel.layoutWidth),
               height: CGFloat(magicalSegmentedPickerViewModel.layoutHeight))
    }
}
*/

