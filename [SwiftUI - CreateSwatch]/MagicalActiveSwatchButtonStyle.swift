//
//  MagicalActiveSwatchButtonStyle.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/3/24.
//

import SwiftUI

struct MagicalActiveSwatchButtonStyle: ButtonStyle {
    
    @Environment(MagicalCreateSwatchViewModel.self) var magicalViewModel
    let activeButtonViewModel: MagicalSegmentButtonViewModel
    let activeButtonConfiguration: ToolInterfaceElementCreateSwatchButtonConfiguration
    let firstButtonViewModel: MagicalSegmentButtonViewModel
    let layoutSchemeFlavor: LayoutSchemeFlavor
    let layoutWidth: Int
    let outsideBoxPaddingTop: Int
    let outsideBoxPaddingBottom: Int
    let isEnabled: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        return ZStack {
            
            getBox(isPressed: configuration.isPressed)
            bodyContent(isPressed: configuration.isPressed)
        }
        .frame(width: CGFloat(layoutWidth),
               height: CGFloat(magicalViewModel.layoutHeight))
        .transaction { transaction in
            transaction.animation = nil
        }
    }
    
    func getBox(isPressed: Bool) -> some View {
        let boxHeight = magicalViewModel.layoutHeight - outsideBoxPaddingTop - outsideBoxPaddingBottom
        return HStack(spacing: 0.0) {
            VStack(spacing: 0.0) {
                Spacer(minLength: 0.0)
                    .frame(height: CGFloat(outsideBoxPaddingTop))
                ZStack {
                    
                }
                .frame(width: CGFloat(layoutWidth),
                       height: CGFloat(boxHeight))
                .background(getStrokeRect(isPressed: isPressed))
                .background(getFillRect(isPressed: isPressed))
                
                Spacer(minLength: 0.0)
                    .frame(height: CGFloat(outsideBoxPaddingBottom))
            }
        }
    }
    
    func getStrokeRect(isPressed: Bool) -> some View {
        
        let orientation = magicalViewModel.orientation
        let cornerRadius = CreateSwatchLayout.getCornerRadius(orientation: orientation)
        let lineThickness = CreateSwatchLayout.getLineThickness(orientation: orientation)
        let color: Color
        if magicalViewModel.isDarkModeEnabled {
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
        return RoundedRectangle(cornerRadius: CGFloat(cornerRadius))
            .stroke(style: StrokeStyle(lineWidth: CGFloat(lineThickness)))
            .foregroundStyle(color)
    }
    
    func getFillRect(isPressed: Bool) -> some View {
        let orientation = magicalViewModel.orientation
        let cornerRadius = CreateSwatchLayout.getCornerRadius(orientation: orientation)
        let color: Color
        if magicalViewModel.isDarkModeEnabled {
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
        return RoundedRectangle(cornerRadius: CGFloat(cornerRadius))
            .foregroundStyle(color)
    }
    
    func bodyContent(isPressed: Bool) -> some View {
        
        let contentLayoutHeight = magicalViewModel.layoutHeight - outsideBoxPaddingTop - outsideBoxPaddingBottom
        
        return VStack(spacing: 0.0) {
            
#if INTERFACE_HINTS
            Spacer(minLength: 0.0)
                .frame(width: 24.0, height: CGFloat(outsideBoxPaddingTop))
                .background(Color(red: 0.25, green: 0.45, blue: 0.15, opacity: 0.40))
#else
            Spacer(minLength: 0.0)
                .frame(height: CGFloat(outsideBoxPaddingTop))
#endif
            
            MagicalActiveSwatchButtonContent(activeButtonViewModel: activeButtonViewModel,
                                             activeButtonConfiguration: activeButtonConfiguration,
                                             firstButtonViewModel: firstButtonViewModel,
                                             layoutSchemeFlavor: layoutSchemeFlavor,
                                             isPressed: isPressed,
                                             isEnabled: isEnabled,
                                             layoutWidth: layoutWidth,
                                             layoutHeight: contentLayoutHeight)
            
#if INTERFACE_HINTS
            Spacer(minLength: 0.0)
                .frame(width: 24.0, height: CGFloat(outsideBoxPaddingBottom))
                .background(Color(red: 0.25, green: 0.45, blue: 0.15, opacity: 0.40))
#else
            Spacer(minLength: 0.0)
                .frame(height: CGFloat(outsideBoxPaddingBottom))
#endif
            
        }
    }
}
