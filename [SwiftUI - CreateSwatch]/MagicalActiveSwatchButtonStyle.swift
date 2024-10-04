//
//  MagicalActiveSwatchButtonStyle.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/3/24.
//

import SwiftUI

struct MagicalActiveSwatchButtonStyle: ButtonStyle {
    
    @Environment(MagicalCreateSwatchViewModel.self) var magicalCreateSwatchViewModel: MagicalCreateSwatchViewModel
    let orientation: Orientation
    let layoutSchemeFlavor: LayoutSchemeFlavor
    let buttonViewModel: MagicalCreateSwatchButtonViewModel
    let universalPaddingTop: Int
    let universalPaddingBottom: Int
    let isEnabled: Bool
    let isDarkMode: Bool
    let layoutWidth: Int
    func makeBody(configuration: Configuration) -> some View {
        return ZStack {
            bodyContent(isPressed: configuration.isPressed)
                .transaction { transaction in
                    transaction.animation = nil
                }
        }
        .frame(width: CGFloat(layoutWidth),
               height: CGFloat(magicalCreateSwatchViewModel.layoutHeight))
    }
    
    func bodyContent(isPressed: Bool) -> some View {
        let universalPaddingLeft = buttonViewModel.universalPaddingLeft
        let layoutWidthMinusPadding = layoutWidth - universalPaddingLeft
        return HStack(spacing: 0.0) {
            Spacer()
                .frame(width: CGFloat(universalPaddingLeft))
            MagicalActiveSwatchButtonContent(orientation: orientation,
                                             layoutSchemeFlavor: layoutSchemeFlavor,
                                             buttonViewModel: buttonViewModel,
                                             isPressed: isPressed,
                                             isEnabled: isEnabled,
                                             isDarkMode: isDarkMode,
                                             universalPaddingTop: universalPaddingTop,
                                             universalPaddingBottom: universalPaddingBottom,
                                             layoutWidth: layoutWidthMinusPadding)
        }
        .frame(width: CGFloat(layoutWidth),
               height: CGFloat(magicalCreateSwatchViewModel.layoutHeight))
        .background(getStrokeRect(isPressed: isPressed))
        .background(getFillRect(isPressed: isPressed))
    }
    
    func getStrokeRect(isPressed: Bool) -> some View {
        
        let cornerRadius = CreateSwatchLayout.getCornerRadius(orientation: orientation)
        let lineThickness = CreateSwatchLayout.getLineThickness(orientation: orientation)
        
        let color: Color
        if isDarkMode {
            if isPressed {
                color = ToolInterfaceTheme.createSwatchActiveBorderPressedDark
            } else {
                color = ToolInterfaceTheme.createSwatchActiveBorderDark
            }
        } else {
            if isPressed {
                color = ToolInterfaceTheme.createSwatchActiveBorderPressedLight
            } else {
                color = ToolInterfaceTheme.createSwatchActiveBorderLight
            }
        }
        
        let height = magicalCreateSwatchViewModel.layoutHeight - (universalPaddingTop + universalPaddingBottom)
        return HStack(spacing: 0.0) {
            RoundedRectangle(cornerRadius: CGFloat(cornerRadius))
                .stroke(style: StrokeStyle(lineWidth: CGFloat(lineThickness)))
        }
        .frame(width: CGFloat(layoutWidth),
               height: CGFloat(height))
        .foregroundStyle(color)
    }
    
    func getFillRect(isPressed: Bool) -> some View {
        
        let cornerRadius = CreateSwatchLayout.getCornerRadius(orientation: orientation)
        var height = magicalCreateSwatchViewModel.layoutHeight
        height -= universalPaddingTop
        height -= universalPaddingBottom
        
        let color: Color
        if isDarkMode {
            if isPressed {
                color = ToolInterfaceTheme.createSwatchActiveBackgroundPressedDark
            } else {
                color = ToolInterfaceTheme.createSwatchActiveBackgroundDark
            }
        } else {
            if isPressed {
                color = ToolInterfaceTheme.createSwatchActiveBackgroundPressedLight
            } else {
                color = ToolInterfaceTheme.createSwatchActiveBackgroundLight
            }
        }
        
        return HStack(spacing: 0.0) {
            RoundedRectangle(cornerRadius: CGFloat(cornerRadius))
        }
        .frame(width: CGFloat(layoutWidth),
               height: CGFloat(height))
        .foregroundStyle(color)
    }
}
