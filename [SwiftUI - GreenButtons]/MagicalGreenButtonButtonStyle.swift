//
//  MagicalGreenButtonButtonStyle.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/2/24.
//

import SwiftUI

struct MagicalGreenButtonButtonStyle: ButtonStyle {
    
    @Environment(MagicalGreenButtonViewModel.self) var magicalViewModel
    let layoutSchemeFlavor: LayoutSchemeFlavor
    let outsideBoxPaddingTop: Int
    let outsideBoxPaddingBottom: Int
    func makeBody(configuration: Configuration) -> some View {
        return ZStack {
            
            getBox(isPressed: configuration.isPressed)
            bodyContent(isPressed: configuration.isPressed)
        }
        .frame(width: CGFloat(magicalViewModel.layoutWidth),
               height: CGFloat(magicalViewModel.layoutHeight))
        .transaction { transaction in
            transaction.animation = nil
        }
    }
    
    func getBox(isPressed: Bool) -> some View {
        
        let boxWidth = magicalViewModel.layoutWidth - magicalViewModel.outsideBoxPaddingLeft - magicalViewModel.outsideBoxPaddingRight
        let boxHeight = magicalViewModel.layoutHeight - outsideBoxPaddingTop - outsideBoxPaddingBottom
        
        return HStack(spacing: 0.0) {
            Spacer(minLength: 0.0)
                .frame(width: CGFloat(magicalViewModel.outsideBoxPaddingLeft))
            
            VStack(spacing: 0.0) {
                Spacer(minLength: 0.0)
                    .frame(height: CGFloat(outsideBoxPaddingTop))
                ZStack {
                    
                }
                .frame(width: CGFloat(boxWidth),
                       height: CGFloat(boxHeight))
                .background(getStrokeRect(isPressed: isPressed))
                .background(getFillRect(isPressed: isPressed))
                
                Spacer(minLength: 0.0)
                    .frame(height: CGFloat(outsideBoxPaddingBottom))
            }
            
            Spacer(minLength: 0.0)
                .frame(width: CGFloat(magicalViewModel.outsideBoxPaddingRight))
        }
    }
    
    func getStrokeRect(isPressed: Bool) -> some View {
        
        let orientation = magicalViewModel.orientation
        let isEnabled = magicalViewModel.isEnabled
        let cornerRadius = GreenButtonLayout.getCornerRadius(orientation: orientation)
        let lineThickness = GreenButtonLayout.getLineThickness(orientation: orientation)
        let color: Color
        if isPressed {
            if isEnabled {
                color = ToolInterfaceTheme.primaryDownEnabled
            } else {
                color = ToolInterfaceTheme.primaryDownDisabled
            }
        } else {
            if magicalViewModel.isDarkModeEnabled {
                if isEnabled {
                    color = ToolInterfaceTheme.primaryEnabledDark
                } else {
                    color = ToolInterfaceTheme.primaryDisabledDark
                }
            } else {
                if isEnabled {
                    color = ToolInterfaceTheme.primaryEnabledLight
                } else {
                    color = ToolInterfaceTheme.primaryDisabledLight
                }
            }
        }
        
        return RoundedRectangle(cornerRadius: CGFloat(cornerRadius))
            .stroke(style: StrokeStyle(lineWidth: CGFloat(lineThickness)))
            .foregroundStyle(color)
    }
    
    func getFillRect(isPressed: Bool) -> some View {
        let orientation = magicalViewModel.orientation
        let isEnabled = magicalViewModel.isEnabled
        let cornerRadius = GreenButtonLayout.getCornerRadius(orientation: orientation)
        let color: Color
        
        if isEnabled {
            if isPressed {
                color = ToolInterfaceTheme.greenButtonFillDown
            } else {
                color = ToolInterfaceTheme.greenButtonFill
            }
        } else {
            if isPressed {
                color = ToolInterfaceTheme.greenButtonFillDownDisabled
            } else {
                color = ToolInterfaceTheme.greenButtonFillDisabled
            }
        }
        
        
        return RoundedRectangle(cornerRadius: CGFloat(cornerRadius))
            .foregroundStyle(color)
    }
    
    func bodyContent(isPressed: Bool) -> some View {
        
        let contentLayoutWidth = magicalViewModel.layoutWidth - magicalViewModel.outsideBoxPaddingLeft - magicalViewModel.outsideBoxPaddingRight
        let contentLayoutHeight = magicalViewModel.layoutHeight - outsideBoxPaddingTop - outsideBoxPaddingBottom
        
        return HStack(spacing: 0.0) {
#if INTERFACE_HINTS
            Spacer(minLength: 0.0)
                .frame(width: CGFloat(magicalViewModel.outsideBoxPaddingLeft), height: 24.0)
                .background(Color(red: 0.99, green: 0.03, blue: 0.98, opacity: 0.40))
#else
            Spacer(minLength: 0.0)
                .frame(width: CGFloat(magicalViewModel.outsideBoxPaddingLeft))
#endif
            
            VStack(spacing: 0.0) {
                
#if INTERFACE_HINTS
                Spacer(minLength: 0.0)
                    .frame(width: 24.0, height: CGFloat(outsideBoxPaddingTop))
                    .background(Color(red: 0.74, green: 0.39, blue: 0.19, opacity: 0.40))
#else
                Spacer(minLength: 0.0)
                    .frame(height: CGFloat(outsideBoxPaddingTop))
#endif
                
                MagicalGreenButtonContent(layoutSchemeFlavor: layoutSchemeFlavor,
                                          isPressed: isPressed,
                                          layoutWidth: contentLayoutWidth,
                                          layoutHeight: contentLayoutHeight)
                
#if INTERFACE_HINTS
                Spacer(minLength: 0.0)
                    .frame(width: 24.0, height: CGFloat(outsideBoxPaddingBottom))
                    .background(Color(red: 0.88, green: 0.88, blue: 0.67, opacity: 0.40))
#else
                Spacer(minLength: 0.0)
                    .frame(height: CGFloat(outsideBoxPaddingBottom))
#endif
                
            }
#if INTERFACE_HINTS
            Spacer(minLength: 0.0)
                .frame(width: CGFloat(magicalViewModel.outsideBoxPaddingRight), height: 24.0)
                .background(Color(red: 0.86, green: 0.90, blue: 0.63, opacity: 0.40))
#else
            Spacer(minLength: 0.0)
                .frame(width: CGFloat(magicalViewModel.outsideBoxPaddingRight))
#endif
        }
    }
}
