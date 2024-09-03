//
//  MagicalMainTabSegmentButtonButtonStyle.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/24/24.
//

import SwiftUI

struct MagicalMainTabSegmentButtonButtonStyle: ButtonStyle {
    
    @Environment(MagicalMainTabViewModel.self) var magicalMainTabViewModel: MagicalMainTabViewModel
    @Environment(MagicalMainTabButtonViewModel.self) var magicalMainTabButtonViewModel: MagicalMainTabButtonViewModel
    let index: Int
    let isSelected: Bool
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
        .frame(width: CGFloat(magicalMainTabButtonViewModel.width),
               height: CGFloat(magicalMainTabViewModel.layoutHeight))
    }
    
    func bodyContent(isPressed: Bool) -> some View {
        return HStack(spacing: 0.0) {
            MagicalMainTabSegmentContent(index: index,
                                                        isSelected: isSelected,
                                                        isDarkMode: isDarkMode,
                                                        isEnabled: isEnabled,
                                                        isPressed: isPressed,
                                                        orientation: orientation,
                                                        layoutSchemeFlavor: layoutSchemeFlavor,
                                                        universalPaddingTop: universalPaddingTop,
                                                        universalPaddingBottom: universalPaddingBottom)
            
        }
        .frame(width: CGFloat(magicalMainTabButtonViewModel.width),
               height: CGFloat(magicalMainTabViewModel.layoutHeight))
        .background(getFillRect(isPressed: isPressed))
        .background(getStrokeRect(isPressed: isPressed))
    }
    
    func getStrokeRect(isPressed: Bool) -> some View {
        
        let cornerRadius = MainTabLayout.getCornerRadius(orientation: orientation)
        let lineThickness = MainTabLayout.getLineThickness(orientation: orientation)
        
        let color: Color
        if isDarkMode {
            color = ToolInterfaceTheme.primaryEnabledDark
        } else {
            color = ToolInterfaceTheme.primaryEnabledLight
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
        
        let height = magicalMainTabViewModel.layoutHeight - (universalPaddingTop + universalPaddingBottom)
        
        return HStack(spacing: 0.0) {
            unevenRoundedRectangle
                .stroke(style: StrokeStyle(lineWidth: CGFloat(lineThickness)))
        }
        .frame(width: CGFloat(magicalMainTabButtonViewModel.width),
               height: CGFloat(height))
        .foregroundStyle(color)
    }
    
    func getFillRect(isPressed: Bool) -> some View {
        
        let cornerRadius = MainTabLayout.getCornerRadius(orientation: orientation)
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
        
        var height = magicalMainTabViewModel.layoutHeight
        height -= universalPaddingTop
        height -= universalPaddingBottom
        
        let color: Color
        if isDarkMode {
            
                if isPressed {
                    color = ToolInterfaceTheme.contextUnderlayDownDisabledDark
                } else {
                    if isSelected {
                        color = ToolInterfaceTheme.contextUnderlayHighlightedDisabledDark
                    } else {
                        color = ToolInterfaceTheme.contextUnderlayDisabledDark
                    }
                }
            
        } else {
            
                if isPressed {
                    color = ToolInterfaceTheme.contextUnderlayDownDisabledLight
                } else {
                    if isSelected {
                        color = ToolInterfaceTheme.contextUnderlayHighlightedDisabledLight
                    } else {
                        color = ToolInterfaceTheme.contextUnderlayDisabledLight
                    }
                }
            
        }
        
        return HStack(spacing: 0.0) {
            unevenRoundedRectangle
        }
        .frame(width: CGFloat(magicalMainTabButtonViewModel.width),
               height: CGFloat(height))
        .foregroundStyle(color)
    }
    
}
