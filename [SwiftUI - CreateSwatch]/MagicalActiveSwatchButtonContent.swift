//
//  MagicalActiveSwatchButtonContent.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/3/24.
//

import SwiftUI

struct MagicalCreateSwatchContent: View {
    
    @Environment(MagicalCreateSwatchViewModel.self) var magicalViewModel
    
    let activeButtonViewModel: MagicalSegmentButtonViewModel
    let activeButtonConfiguration: ToolInterfaceElementCreateSwatchButtonConfiguration
    let firstButtonViewModel: MagicalSegmentButtonViewModel
    
    let layoutSchemeFlavor: LayoutSchemeFlavor
    let isPressed: Bool
    let layoutWidth: Int
    let layoutHeight: Int
    
    var body: some View {
        
        let orientation = magicalViewModel.orientation
        let isDarkMode = magicalViewModel.isDarkModeEnabled
        let isEnabled = magicalViewModel.isEnabled
        
        let isLong: Bool
        switch layoutSchemeFlavor {
        case .long:
            isLong = true
        default:
            isLong = false
        }
        
        let numberOfLines = activeButtonConfiguration.nameLabelNumberOfLines
        let textIcon = activeButtonConfiguration.iconPack.getTextIcon(orientation: orientation,
                                                                      layoutSchemeFlavor: layoutSchemeFlavor,
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
        
        let heroPaddingTopStacked = CreateSwatchLayout.getHeroPaddingTopStacked(orientation: orientation)
        let heroPaddingBottomStacked = CreateSwatchLayout.getHeroPaddingBottomStacked(orientation: orientation)
        
        let slaveWidth = checkBoxSquare.width
        let slaveHeight = checkBoxSquare.height
        
        let checkWidth = checkBoxCheck.width
        let checkHeight = checkBoxCheck.height
        
        let checkBoxPadding = CheckBoxLayout.getSlavePaddingRightLong(orientation: orientation,
                                                                      squeeze: .relaxed)
        
        //let heroWidth = 
        
        return ZStack {
            HeroSlab(orientation: orientation,
                     layoutWidth: layoutWidth,
                     layoutHeight: layoutHeight,
                     isLong: isLong,
                     isPressed: isPressed,
                     textIcon: textIcon,
                     heroPaddingLeft: firstButtonViewModel.heroPaddingLeft,
                     heroPaddingRight: activeButtonViewModel.heroPaddingRight,
                     heroPaddingTopStacked: heroPaddingTopStacked,
                     heroPaddingBottomStacked: heroPaddingBottomStacked,
                     heroSpacingLong: activeButtonViewModel.heroSpacing,
                     line1: line1,
                     line2: line2,
                     numberOfLines: numberOfLines,
                     nameLabelVerticalSpacing: nameLabelVerticalSpacing,
                     nameLabelFont: nameLabelFont,
                     nameLabelWidth: nameLabelWidth,
                     lineHeight: lineHeight,
                     nameLabelColor: nameLabelColor)
            .background(Color.red)

            HStack(spacing: 0.0) {
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
                    .frame(width: CGFloat(checkBoxPadding), height: 24.0)
                    .background(Color(red: 0.47, green: 0.87, blue: 0.16, opacity: 0.70))
#else
                Spacer()
                    .frame(width: CGFloat(checkBoxPadding))
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


/*
struct MagicalActiveSwatchButtonContent: View {
    
    @Environment(MagicalCreateSwatchViewModel.self) var magicalCreateSwatchViewModel: MagicalCreateSwatchViewModel
    
    let orientation: Orientation
    let layoutSchemeFlavor: LayoutSchemeFlavor
    let buttonViewModel: MagicalCreateSwatchButtonViewModel
    let isPressed: Bool
    let isEnabled: Bool
    let isDarkMode: Bool
    let universalPaddingTop: Int
    let universalPaddingBottom: Int
    let layoutWidth: Int
    var body: some View {
        
        let configuration = buttonViewModel.createSwatchButtonConfiguration
        
        let textIcon = configuration.getTextIcon(orientation: orientation,
                                                 layoutSchemeFlavor: layoutSchemeFlavor,
                                                 isDarkMode: isDarkMode,
                                                 isEnabled: isEnabled)
        
        let buttonUniversalPaddingLeft = buttonViewModel.universalPaddingLeft
        let buttonUniversalPaddingRight = buttonViewModel.universalPaddingRight
        
        let line1 = configuration.nameLabelLine1
        let line2 = configuration.nameLabelLine2
        
        let numberOfLines = configuration.nameLabelNumberOfLines
        
        let iconWidth = textIcon.width
        let iconHeight = textIcon.height
        
        let nameLabelFont = CreateSwatchLayout.getNameLabelFont(orientation: orientation,
                                                                  flavor: layoutSchemeFlavor)
        
        let nameLabelPaddingLeft = buttonViewModel.nameLabelPaddingLeft
        let nameLabelPaddingRight = buttonViewModel.nameLabelPaddingRight
        let nameLabelVerticalSpacing = CreateSwatchLayout.getNameLabelVerticalSpacing(orientation: orientation,
                                                                                  flavor: layoutSchemeFlavor)
        
        let nameLabelTextWidth: Int
        switch layoutSchemeFlavor {
        case .stackedLarge, .long:
            nameLabelTextWidth = configuration.nameLabelWidthLarge
        case .stackedMedium:
            nameLabelTextWidth = configuration.nameLabelWidthMedium
        case .stackedSmall:
            nameLabelTextWidth = configuration.nameLabelWidthSmall
        }
        
        let lineHeight = ToolInterfaceTheme.getLineHeight(font: nameLabelFont)
        let nameLabelWidth = nameLabelTextWidth + nameLabelPaddingLeft + nameLabelPaddingRight
        
        let iconPaddingLeft = buttonViewModel.iconPaddingLeft
        let iconPaddingRight = buttonViewModel.iconPaddingRight
        let iconPaddingTop = CreateSwatchLayout.getIconPaddingTop(orientation: orientation,
                                                              flavor: layoutSchemeFlavor,
                                                              numberOfLines: numberOfLines)
        
        let checkBoxWidth = CreateSwatchLayout.getCheckBoxWidth(orientation: orientation,
                                                                flavor: layoutSchemeFlavor,
                                                                squeeze: .standard)
        let checkBoxHeight = checkBoxWidth
        
        let checkBoxPaddingRight = CreateSwatchLayout.getCheckBoxPaddingRight(orientation: orientation,
                                                                              flavor: layoutSchemeFlavor,
                                                                              squeeze: .standard)
        
        let contentHeight = magicalCreateSwatchViewModel.layoutHeight - (universalPaddingTop + universalPaddingBottom)
        
        let color: Color
        if isDarkMode {
            if isPressed {
                color = ToolInterfaceTheme.createSwatchActivePrimaryPressedDark
            } else {
                color = ToolInterfaceTheme.createSwatchActivePrimaryDark
            }
        } else {
            if isPressed {
                color = ToolInterfaceTheme.createSwatchActivePrimaryPressedLight
            } else {
                color = ToolInterfaceTheme.createSwatchActivePrimaryLight
            }
        }
        
        return VStack(spacing: 0.0) {
            
#if INTERFACE_HINTS
            Spacer()
                .frame(width: 24.0, height: CGFloat(universalPaddingTop))
                .background(Color(red: 045, green: 0.25, blue: 0.85, opacity: 0.40))
#else
            Spacer()
                .frame(height: CGFloat(universalPaddingTop))
#endif
            
            HStack(spacing: 0.0) {
#if INTERFACE_HINTS
                Spacer()
                    .frame(width: CGFloat(buttonUniversalPaddingLeft), height: 28.0)
                    .background(Color(red: 0.35, green: 085, blue: 0.65, opacity: 0.40))
#else
                Spacer()
                    .frame(width: CGFloat(buttonUniversalPaddingLeft))
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
                        IconBoxMainTab(icon: textIcon,
                                iconWidth: iconWidth,
                                iconHeight: iconHeight,
                                iconPaddingLeft: iconPaddingLeft,
                                iconPaddingRight: iconPaddingRight,
                                iconPaddingTop: iconPaddingTop)
                            .opacity(isPressed ? 0.7 : 1.0)
                        
                    }
                    
                }
                .frame(height: CGFloat(contentHeight))
                
#if INTERFACE_HINTS
                Spacer()
                    .frame(width: CGFloat(buttonUniversalPaddingRight), height: 28.0)
                    .background(Color(red: 0.65, green: 0.95, blue: 0.25, opacity: 0.40))
#else
                Spacer()
                    .frame(width: CGFloat(buttonUniversalPaddingRight))
#endif
                
                Spacer()
                
                getCheckBox(width: checkBoxWidth, height: checkBoxHeight)
                
#if INTERFACE_HINTS
            Spacer()
                .frame(width: CGFloat(checkBoxPaddingRight), height: 28.0)
                .background(Color(red: 0.65, green: 0.45, blue: 0.35, opacity: 0.40))
#else
            Spacer()
                .frame(width: CGFloat(checkBoxPaddingRight))
#endif
            }
            
#if INTERFACE_HINTS
            Spacer()
                .frame(width: 24.0, height: CGFloat(universalPaddingBottom))
                .background(Color(red: 0.55, green: 0.825, blue: 0.385, opacity: 0.50))
#else
            Spacer()
                .frame(height: CGFloat(universalPaddingBottom))
#endif
            
        }
        .frame(width: CGFloat(layoutWidth),
               height: CGFloat(magicalCreateSwatchViewModel.layoutHeight))
    }
    
    func getCheckBox(width: Int, height: Int) -> some View {
        
        let color: Color
        if isDarkMode {
            if isPressed {
                color = ToolInterfaceTheme.createSwatchActiveCheckStrokePressedDark
            } else {
                color = ToolInterfaceTheme.createSwatchActiveCheckStrokeDark
            }
        } else {
            if isPressed {
                color = ToolInterfaceTheme.createSwatchActiveCheckStrokePressedLight
            } else {
                color = ToolInterfaceTheme.createSwatchActiveCheckStrokeLight
            }
        }
        
        var scrunch: CGFloat
        if Device.isPad {
            scrunch = 8.0
        } else {
            scrunch = 4.0
        }
        
        return ZStack {
            GeometryReader() { geometry in
                ZStack {
                    ShapeView(width: geometry.size.width - scrunch,
                              height: geometry.size.height - scrunch,
                              path: Style.checkMark(width: geometry.size.width - scrunch,
                                                    height: geometry.size.height - scrunch),
                              color: color)
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
            }
            
        }
        .frame(width: CGFloat(width),
               height: CGFloat(height))
        
        .background(getCheckBoxStrokeRect(isPressed: isPressed, width: width, height: height))
        .background(getCheckBoxFillRect(isPressed: isPressed, width: width, height: height))
        
    }
    
    func getCheckBoxStrokeRect(isPressed: Bool, width: Int, height: Int) -> some View {
        let cornerRadius = CreateSwatchLayout.getCheckBoxCornerRadius(orientation: orientation)
        let lineThickness = CreateSwatchLayout.getCheckBoxLineThickness(orientation: orientation)
        
        let color: Color
        if isDarkMode {
            if isPressed {
                color = ToolInterfaceTheme.createSwatchActiveCheckStrokePressedDark
            } else {
                color = ToolInterfaceTheme.createSwatchActiveCheckStrokeDark
            }
        } else {
            if isPressed {
                color = ToolInterfaceTheme.createSwatchActiveCheckStrokePressedLight
            } else {
                color = ToolInterfaceTheme.createSwatchActiveCheckStrokeLight
            }
        }
        
        return HStack(spacing: 0.0) {
            RoundedRectangle(cornerRadius: CGFloat(cornerRadius))
                .stroke(style: StrokeStyle(lineWidth: CGFloat(lineThickness)))
        }
        .frame(width: CGFloat(width),
               height: CGFloat(height))
        .foregroundStyle(color)
    }
    
    func getCheckBoxFillRect(isPressed: Bool, width: Int, height: Int) -> some View {
        
        let cornerRadius = CreateSwatchLayout.getCheckBoxCornerRadius(orientation: orientation)
        
        let color: Color
        if isDarkMode {
            if isPressed {
                color = ToolInterfaceTheme.createSwatchActiveCheckBackgroundPressedDark
            } else {
                color = ToolInterfaceTheme.createSwatchActiveCheckBackgroundDark
            }
        } else {
            if isPressed {
                color = ToolInterfaceTheme.createSwatchActiveCheckBackgroundPressedLight
            } else {
                color = ToolInterfaceTheme.createSwatchActiveCheckBackgroundLight
            }
        }
        
        return HStack(spacing: 0.0) {
            RoundedRectangle(cornerRadius: CGFloat(cornerRadius))
        }
        .frame(width: CGFloat(width),
               height: CGFloat(height))
        .foregroundStyle(color)
    }
    
}
*/
