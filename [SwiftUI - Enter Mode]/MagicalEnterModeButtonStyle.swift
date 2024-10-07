//
//  MagicalEnterModeButtonStyle.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/25/24.
//

import SwiftUI

struct MagicalEnterModeButtonStyle: ButtonStyle {
    
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
            Spacer()
                .frame(width: CGFloat(magicalViewModel.outsideBoxPaddingLeft))
            
            VStack(spacing: 0.0) {
                Spacer()
                    .frame(height: CGFloat(outsideBoxPaddingTop))
                ZStack {
                    
                }
                .frame(width: CGFloat(boxWidth),
                       height: CGFloat(boxHeight))
                .background(getStrokeRect(isPressed: isPressed))
                .background(getFillRect(isPressed: isPressed))
                
                Spacer()
                    .frame(height: CGFloat(outsideBoxPaddingBottom))
            }
            
            Spacer()
                .frame(width: CGFloat(magicalViewModel.outsideBoxPaddingRight))
        }
    }
    
    func getStrokeRect(isPressed: Bool) -> some View {
        
        let orientation = magicalViewModel.orientation
        let isEnabled = magicalViewModel.isEnabled
        let cornerRadius = EnterModeLayout.getCornerRadius(orientation: orientation)
        let lineThickness = EnterModeLayout.getLineThickness(orientation: orientation)
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
        let cornerRadius = EnterModeLayout.getCornerRadius(orientation: orientation)
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
            Spacer()
                .frame(width: CGFloat(magicalViewModel.outsideBoxPaddingLeft), height: 24.0)
                .background(Color(red: 0.15, green: 0.95, blue: 0.55, opacity: 0.40))
#else
            Spacer()
                .frame(width: CGFloat(magicalViewModel.outsideBoxPaddingLeft))
#endif
            
            VStack(spacing: 0.0) {
                
#if INTERFACE_HINTS
                Spacer()
                    .frame(width: 24.0, height: CGFloat(outsideBoxPaddingTop))
                    .background(Color(red: 0.61, green: 0.12, blue: 0.82, opacity: 0.40))
#else
                Spacer()
                    .frame(height: CGFloat(outsideBoxPaddingTop))
#endif
                
                MagicalEnterModeContent(layoutSchemeFlavor: layoutSchemeFlavor,
                                        isPressed: isPressed,
                                        layoutWidth: contentLayoutWidth,
                                        layoutHeight: contentLayoutHeight)
                
#if INTERFACE_HINTS
                Spacer()
                    .frame(width: 24.0, height: CGFloat(outsideBoxPaddingBottom))
                    .background(Color(red: 0.71, green: 0.43, blue: 0.67, opacity: 0.40))
#else
                Spacer()
                    .frame(height: CGFloat(outsideBoxPaddingBottom))
#endif
                
            }
#if INTERFACE_HINTS
            Spacer()
                .frame(width: CGFloat(magicalViewModel.outsideBoxPaddingRight), height: 24.0)
                .background(Color(red: 0.36, green: 0.93, blue: 0.49, opacity: 0.40))
#else
            Spacer()
                .frame(width: CGFloat(magicalViewModel.outsideBoxPaddingRight))
#endif
        }
    }
}
