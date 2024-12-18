//
//  MagicalExitModeButtonStyle.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/28/24.
//

import SwiftUI

struct MagicalExitModeButtonStyle: ButtonStyle {
    
    @Environment(MagicalModeChangeViewModel.self) var magicalViewModel
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
        let cornerRadius = ExitModeLayout.getCornerRadius(orientation: orientation)
        let lineThickness = ExitModeLayout.getLineThickness(orientation: orientation)
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
        let cornerRadius = ExitModeLayout.getCornerRadius(orientation: orientation)
        let color: Color
        if magicalViewModel.isDarkModeEnabled {
            if isEnabled {
                if isPressed {
                    color = ToolInterfaceTheme.contextUnderlayDownEnabledDark
                } else {
                    color = ToolInterfaceTheme.contextUnderlayHighlightedEnabledDark
                }
            } else {
                if isPressed {
                    color = ToolInterfaceTheme.contextUnderlayDownDisabledDark
                } else {
                    color = ToolInterfaceTheme.contextUnderlayHighlightedDisabledDark
                }
            }
        } else {
            if isEnabled {
                if isPressed {
                    color = ToolInterfaceTheme.contextUnderlayDownEnabledLight
                } else {
                    color = ToolInterfaceTheme.contextUnderlayHighlightedEnabledLight
                }
            } else {
                if isPressed {
                    color = ToolInterfaceTheme.contextUnderlayDownDisabledLight
                } else {
                    color = ToolInterfaceTheme.contextUnderlayHighlightedDisabledLight
                }
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
                .background(Color(red: 0.65, green: 0.655, blue: 0.155, opacity: 0.40))
#else
            Spacer(minLength: 0.0)
                .frame(width: CGFloat(magicalViewModel.outsideBoxPaddingLeft))
#endif
            
            VStack(spacing: 0.0) {
                
#if INTERFACE_HINTS
                Spacer(minLength: 0.0)
                    .frame(width: 24.0, height: CGFloat(outsideBoxPaddingTop))
                    .background(Color(red: 0.90, green: 0.67, blue: 0.45, opacity: 0.40))
#else
                Spacer(minLength: 0.0)
                    .frame(height: CGFloat(outsideBoxPaddingTop))
#endif
                
                MagicalExitModeContent(layoutSchemeFlavor: layoutSchemeFlavor,
                                       isPressed: isPressed,
                                       layoutWidth: contentLayoutWidth,
                                       layoutHeight: contentLayoutHeight)
                
#if INTERFACE_HINTS
                Spacer(minLength: 0.0)
                    .frame(width: 24.0, height: CGFloat(outsideBoxPaddingBottom))
                    .background(Color(red: 0.93, green: 0.21, blue: 0.26, opacity: 0.40))
#else
                Spacer(minLength: 0.0)
                    .frame(height: CGFloat(outsideBoxPaddingBottom))
#endif
                
            }
#if INTERFACE_HINTS
            Spacer(minLength: 0.0)
                .frame(width: CGFloat(magicalViewModel.outsideBoxPaddingRight), height: 24.0)
                .background(Color(red: 0.58, green: 0.367, blue: 0.91, opacity: 0.40))
#else
            Spacer(minLength: 0.0)
                .frame(width: CGFloat(magicalViewModel.outsideBoxPaddingRight))
#endif
        }
    }
}
