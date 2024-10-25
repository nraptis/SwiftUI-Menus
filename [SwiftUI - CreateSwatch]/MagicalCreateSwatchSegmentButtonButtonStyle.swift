//
//  MagicalCreateSwatchSegmentButtonButtonStyle.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/2/24.
//

import SwiftUI

struct MagicalCreateSwatchSegmentButtonButtonStyle: ButtonStyle {
    
    @Environment(MagicalCreateSwatchViewModel.self) var magicalViewModel
    @Environment(MagicalCreateSwatchButtonViewModel.self) var magicalButtonViewModel
    let layoutSchemeFlavor: LayoutSchemeFlavor
    let outsideBoxPaddingTop: Int
    let outsideBoxPaddingBottom: Int
    let position: SegmentedPickerPosition
    let isEnabled: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        return ZStack {
            
            getBox(isPressed: configuration.isPressed)
            bodyContent(isPressed: configuration.isPressed)
            
        }
        .frame(width: CGFloat(magicalButtonViewModel.layoutWidth),
               height: CGFloat(magicalViewModel.layoutHeight))
        .transaction { transaction in
            transaction.animation = nil
        }
    }
    
    func getBox(isPressed: Bool) -> some View {
        let boxWidth = magicalButtonViewModel.layoutWidth
        let boxHeight = magicalViewModel.layoutHeight - outsideBoxPaddingTop - outsideBoxPaddingBottom
        return VStack(spacing: 0.0) {
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
    }
    
    func getShape() -> some Shape {
        let cornerRadius = CreateSwatchLayout.getCornerRadius(orientation: magicalViewModel.orientation)
        switch position {
        case .bookendLeft:
            let radii = RectangleCornerRadii(topLeading: CGFloat(cornerRadius),
                                             bottomLeading: CGFloat(cornerRadius),
                                             bottomTrailing: 0.0,
                                             topTrailing: 0.0)
            return UnevenRoundedRectangle(cornerRadii: radii)
        case .middle:
            let radii = RectangleCornerRadii(topLeading: 0.0,
                                             bottomLeading: 0.0,
                                             bottomTrailing: 0.0,
                                             topTrailing: 0.0)
            return UnevenRoundedRectangle(cornerRadii: radii)
        case .bookendRight:
            let radii = RectangleCornerRadii(topLeading: 0.0,
                                             bottomLeading: 0.0,
                                             bottomTrailing: CGFloat(cornerRadius),
                                             topTrailing: CGFloat(cornerRadius))
            return UnevenRoundedRectangle(cornerRadii: radii)
        }
    }
    
    func getStrokeRect(isPressed: Bool) -> some View {
        let lineThickness = CreateSwatchLayout.getLineThickness(orientation: magicalViewModel.orientation)
        let color: Color
        if magicalViewModel.isDarkModeEnabled {
            if isEnabled {
                color = ToolInterfaceTheme.primaryUnselectedEnabledDark
            } else {
                color = ToolInterfaceTheme.primaryUnselectedDisabledDark
            }
        } else {
            if isEnabled {
                color = ToolInterfaceTheme.primaryUnselectedEnabledLight
            } else {
                color = ToolInterfaceTheme.primaryUnselectedDisabledLight
            }
        }
        return getShape()
            .stroke(style: StrokeStyle(lineWidth: CGFloat(lineThickness)))
            .foregroundStyle(color)
    }
    
    func getFillRect(isPressed: Bool) -> some View {
        let color: Color
        if magicalViewModel.isDarkModeEnabled {
            if isEnabled {
                color = ToolInterfaceTheme.contextUnderlayHighlightedEnabledDark
            } else {
                color = ToolInterfaceTheme.contextUnderlayDisabledDark
            }
        } else {
            if isEnabled {
                color = ToolInterfaceTheme.contextUnderlayHighlightedEnabledLight
            } else {
                color = ToolInterfaceTheme.contextUnderlayDisabledLight
            }
        }
        
        return getShape()
            .foregroundStyle(color)
    }
    
    func bodyContent(isPressed: Bool) -> some View {
        let contentLayoutHeight = magicalViewModel.layoutHeight - outsideBoxPaddingTop - outsideBoxPaddingBottom
        return VStack(spacing: 0.0) {
            
#if INTERFACE_HINTS
            Spacer(minLength: 0.0)
                .frame(width: 24.0, height: CGFloat(outsideBoxPaddingTop))
                .background(Color(red: 0.74, green: 0.39, blue: 0.19, opacity: 0.40))
#else
            Spacer(minLength: 0.0)
                .frame(height: CGFloat(outsideBoxPaddingTop))
#endif
            MagicalCreateSwatchSegmentContent(layoutSchemeFlavor: layoutSchemeFlavor,
                                              layoutHeight: contentLayoutHeight,
                                              isPressed: isPressed,
                                              isEnabled: isEnabled)
#if INTERFACE_HINTS
            Spacer(minLength: 0.0)
                .frame(width: 24.0, height: CGFloat(outsideBoxPaddingBottom))
                .background(Color(red: 0.88, green: 0.88, blue: 0.67, opacity: 0.40))
#else
            Spacer(minLength: 0.0)
                .frame(height: CGFloat(outsideBoxPaddingBottom))
#endif
            
        }
        
    }
}
