//
//  MagicalActiveSwatchButtonContent.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/3/24.
//

import Foundation
import SwiftUI

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
