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
            if magicalButtonViewModel.isEnabled {
                color = ToolInterfaceTheme.primaryUnselectedEnabledDark
            } else {
                color = ToolInterfaceTheme.primaryUnselectedDisabledDark
            }
        } else {
            if magicalButtonViewModel.isEnabled {
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
            if magicalButtonViewModel.isEnabled {
                color = ToolInterfaceTheme.contextUnderlayHighlightedEnabledDark
            } else {
                color = ToolInterfaceTheme.contextUnderlayDisabledDark
            }
        } else {
            if magicalButtonViewModel.isEnabled {
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
        return HStack(spacing: 0.0) {
#if INTERFACE_HINTS
            Spacer()
                .frame(width: CGFloat(magicalViewModel.outsideBoxPaddingLeft), height: 24.0)
                .background(Color(red: 0.99, green: 0.03, blue: 0.98, opacity: 0.40))
#else
            Spacer()
                .frame(width: CGFloat(magicalViewModel.outsideBoxPaddingLeft))
#endif
            
            VStack(spacing: 0.0) {
                
#if INTERFACE_HINTS
                Spacer()
                    .frame(width: 24.0, height: CGFloat(outsideBoxPaddingTop))
                    .background(Color(red: 0.74, green: 0.39, blue: 0.19, opacity: 0.40))
#else
                Spacer()
                    .frame(height: CGFloat(outsideBoxPaddingTop))
#endif
                MagicalCreateSwatchSegmentContent(layoutSchemeFlavor: layoutSchemeFlavor,
                                                     layoutHeight: contentLayoutHeight,
                                                     isPressed: isPressed)
#if INTERFACE_HINTS
                Spacer()
                    .frame(width: 24.0, height: CGFloat(outsideBoxPaddingBottom))
                    .background(Color(red: 0.88, green: 0.88, blue: 0.67, opacity: 0.40))
#else
                Spacer()
                    .frame(height: CGFloat(outsideBoxPaddingBottom))
#endif
                
            }
#if INTERFACE_HINTS
            Spacer()
                .frame(width: CGFloat(magicalViewModel.outsideBoxPaddingRight), height: 24.0)
                .background(Color(red: 0.86, green: 0.00, blue: 0.63, opacity: 0.40))
#else
            Spacer()
            .frame(width: CGFloat(magicalViewModel.outsideBoxPaddingRight))
#endif
        }
    }
}


/*
import SwiftUI

struct MagicalCreateSwatchSegmentButtonButtonStyle: ButtonStyle {
    
    @Environment(MagicalCreateSwatchViewModel.self) var magicalCreateSwatchViewModel: MagicalCreateSwatchViewModel
    @Environment(MagicalCreateSwatchButtonViewModel.self) var magicalCreateSwatchButtonViewModel: MagicalCreateSwatchButtonViewModel
    let index: Int
    let isDarkMode: Bool
    let isEnabled: Bool
    let orientation: Orientation
    let layoutSchemeFlavor: LayoutSchemeFlavor
    let segmentedPickerPosition: SegmentedPickerPosition
    let universalPaddingTop: Int
    let universalPaddingBottom: Int
    
    func makeBody(configuration: Configuration) -> some View {
        return ZStack {
            bodyContent(isPressed: configuration.isPressed)
                .transaction { transaction in
                    transaction.animation = nil
                }
        }
        .frame(width: CGFloat(magicalCreateSwatchButtonViewModel.width),
               height: CGFloat(magicalCreateSwatchViewModel.layoutHeight))
    }
    
    func bodyContent(isPressed: Bool) -> some View {
        return HStack(spacing: 0.0) {
            MagicalCreateSwatchSegmentContent(index: index,
                                              isDarkMode: isDarkMode,
                                              isEnabled: isEnabled,
                                              isPressed: isPressed,
                                              orientation: orientation,
                                              layoutSchemeFlavor: layoutSchemeFlavor,
                                              universalPaddingTop: universalPaddingTop,
                                              universalPaddingBottom: universalPaddingBottom)
            
        }
        .frame(width: CGFloat(magicalCreateSwatchButtonViewModel.width),
               height: CGFloat(magicalCreateSwatchViewModel.layoutHeight))
        .background(getFillRect(isPressed: isPressed))
        .background(getStrokeRect(isPressed: isPressed))
    }
    
    func getStrokeRect(isPressed: Bool) -> some View {
        
        let cornerRadius = CreateSwatchLayout.getCornerRadius(orientation: orientation)
        let lineThickness = CreateSwatchLayout.getLineThickness(orientation: orientation)
        
        let color: Color
        if isDarkMode {
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
        
        let unevenRoundedRectangle: UnevenRoundedRectangle
        switch segmentedPickerPosition {
        case .bookendLeft:
            let radii = RectangleCornerRadii(topLeading: CGFloat(cornerRadius),
                                             bottomLeading: CGFloat(cornerRadius),
                                             bottomTrailing: 0.0,
                                             topTrailing: 0.0)
            unevenRoundedRectangle = UnevenRoundedRectangle(cornerRadii: radii)
        case .middle:
            let radii = RectangleCornerRadii(topLeading: 0.0,
                                             bottomLeading: 0.0,
                                             bottomTrailing: 0.0,
                                             topTrailing: 0.0)
            unevenRoundedRectangle = UnevenRoundedRectangle(cornerRadii: radii)
        case .bookendRight:
            let radii = RectangleCornerRadii(topLeading: 0.0,
                                             bottomLeading: 0.0,
                                             bottomTrailing: CGFloat(cornerRadius),
                                             topTrailing: CGFloat(cornerRadius))
            unevenRoundedRectangle = UnevenRoundedRectangle(cornerRadii: radii)
        }
        
        let height = magicalCreateSwatchViewModel.layoutHeight - (universalPaddingTop + universalPaddingBottom)
        
        return HStack(spacing: 0.0) {
            unevenRoundedRectangle
                .stroke(style: StrokeStyle(lineWidth: CGFloat(lineThickness)))
        }
        .frame(width: CGFloat(magicalCreateSwatchButtonViewModel.width),
               height: CGFloat(height))
        .foregroundStyle(color)
    }
    
    func getFillRect(isPressed: Bool) -> some View {
        
        let cornerRadius = CreateSwatchLayout.getCornerRadius(orientation: orientation)
        let unevenRoundedRectangle: UnevenRoundedRectangle
        switch segmentedPickerPosition {
        case .bookendLeft:
            let radii = RectangleCornerRadii(topLeading: CGFloat(cornerRadius),
                                             bottomLeading: CGFloat(cornerRadius),
                                             bottomTrailing: 0.0,
                                             topTrailing: 0.0)
            unevenRoundedRectangle = UnevenRoundedRectangle(cornerRadii: radii)
        case .middle:
            let radii = RectangleCornerRadii(topLeading: 0.0,
                                             bottomLeading: 0.0,
                                             bottomTrailing: 0.0,
                                             topTrailing: 0.0)
            unevenRoundedRectangle = UnevenRoundedRectangle(cornerRadii: radii)
        case .bookendRight:
            let radii = RectangleCornerRadii(topLeading: 0.0,
                                             bottomLeading: 0.0,
                                             bottomTrailing: CGFloat(cornerRadius),
                                             topTrailing: CGFloat(cornerRadius))
            unevenRoundedRectangle = UnevenRoundedRectangle(cornerRadii: radii)
        }
        
        var height = magicalCreateSwatchViewModel.layoutHeight
        height -= universalPaddingTop
        height -= universalPaddingBottom
        
        let color: Color
        if isDarkMode {
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
        
        return HStack(spacing: 0.0) {
            unevenRoundedRectangle
        }
        .frame(width: CGFloat(magicalCreateSwatchButtonViewModel.width),
               height: CGFloat(height))
        .foregroundStyle(color)
    }
    
}
*/
