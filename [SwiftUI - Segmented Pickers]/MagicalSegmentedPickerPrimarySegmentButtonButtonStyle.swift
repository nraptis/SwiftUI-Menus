//
//  MagicalSegmentedPickerPrimarySegmentButtonButtonStyle.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 4/2/24.
//

import Foundation
import SwiftUI

struct MagicalSegmentedPickerPrimarySegmentButtonButtonStyle: ButtonStyle {
    
    @Environment(MagicalSegmentedPickerViewModel.self) var magicalSegmentedPickerViewModel: MagicalSegmentedPickerViewModel
    @Environment(MagicalSegmentedPickerButtonViewModel.self) var magicalSegmentedPickerButtonViewModel: MagicalSegmentedPickerButtonViewModel
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
        .frame(width: CGFloat(magicalSegmentedPickerButtonViewModel.width),
               height: CGFloat(magicalSegmentedPickerViewModel.layoutHeight))
    }
    
    func bodyContent(isPressed: Bool) -> some View {
        return HStack(spacing: 0.0) {
            MagicalSegmentedPickerPrimarySegmentContent(index: index,
                                                        isSelected: isSelected,
                                                        isDarkMode: isDarkMode,
                                                        isEnabled: isEnabled,
                                                        isPressed: isPressed,
                                                        orientation: orientation,
                                                        layoutSchemeFlavor: layoutSchemeFlavor,
                                                        universalPaddingTop: universalPaddingTop,
                                                        universalPaddingBottom: universalPaddingBottom)
            
        }
        .frame(width: CGFloat(magicalSegmentedPickerButtonViewModel.width),
               height: CGFloat(magicalSegmentedPickerViewModel.layoutHeight))
        .background(getFillRect(isPressed: isPressed))
        .background(getStrokeRect(isPressed: isPressed))
    }
    
    func getStrokeRect(isPressed: Bool) -> some View {
        
        let cornerRadius = SegmentedPickerLayout.getCornerRadius(orientation: orientation)
        let lineThickness = SegmentedPickerLayout.getLineThickness(orientation: orientation)
        
        let color: Color
        if isDarkMode {
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
        
        let height = magicalSegmentedPickerViewModel.layoutHeight - (universalPaddingTop + universalPaddingBottom)
        
        
        
        return HStack(spacing: 0.0) {
            unevenRoundedRectangle
                .stroke(style: StrokeStyle(lineWidth: CGFloat(lineThickness)))
        }
        .frame(width: CGFloat(magicalSegmentedPickerButtonViewModel.width),
               height: CGFloat(height))
        .foregroundStyle(color)
    }
    
    func getFillRect(isPressed: Bool) -> some View {
        
        let cornerRadius = SegmentedPickerLayout.getCornerRadius(orientation: orientation)
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
        
        var height = magicalSegmentedPickerViewModel.layoutHeight
        height -= universalPaddingTop
        height -= universalPaddingBottom
        
        let color: Color
        if isDarkMode {
            if isEnabled {
                if isPressed {
                    color = ToolInterfaceTheme.contextUnderlayDownEnabledDark
                } else {
                    if isSelected {
                        color = ToolInterfaceTheme.contextUnderlayHighlightedEnabledDark
                    } else {
                        color = ToolInterfaceTheme.contextUnderlayEnabledDark
                    }
                }
            } else {
                if isPressed {
                    color = ToolInterfaceTheme.contextUnderlayDownDisabledDark
                } else {
                    if isSelected {
                        color = ToolInterfaceTheme.contextUnderlayHighlightedDisabledDark
                    } else {
                        color = ToolInterfaceTheme.contextUnderlayDisabledDark
                    }
                }
            }
        } else {
            if isEnabled {
                if isPressed {
                    color = ToolInterfaceTheme.contextUnderlayDownEnabledLight
                } else {
                    if isSelected {
                        color = ToolInterfaceTheme.contextUnderlayHighlightedEnabledLight
                    } else {
                        color = ToolInterfaceTheme.contextUnderlayEnabledLight
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
        }
        
        return HStack(spacing: 0.0) {
            unevenRoundedRectangle
        }
        .frame(width: CGFloat(magicalSegmentedPickerButtonViewModel.width),
               height: CGFloat(height))
        .foregroundStyle(color)
    }
    
    /*
    func getStrokeRect(isPressed: Bool) -> some View {
        
        let cornerRadius = SegmentedPickerLayout.getCornerRadiusOuter(orientation: orientation)
        
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
        
        let height = magicalSegmentedPickerViewModel.layoutHeight - (universalPaddingTop + universalPaddingBottom)
        
        return HStack(spacing: 0.0) {
            unevenRoundedRectangle
        }
        .frame(width: CGFloat(magicalSegmentedPickerButtonViewModel.width),
               height: CGFloat(height))
        .foregroundStyle(ToolInterfaceTheme.gray500)
    }
    
    func getFillRect(isPressed: Bool) -> some View {
        
        let lineThickness = SegmentedPickerLayout.getLineThickness(orientation: orientation)
        
        let cornerRadius = SegmentedPickerLayout.getCornerRadiusInner(orientation: orientation)
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
        
        
        var spacingLeft = 0
        var spacingRight = 0
        
        switch segmentedPickerPosition {
        case .bookendLeft:
            if lineThickness == 1 {
                spacingLeft = 1
                spacingRight = 0
            } else {
                spacingLeft = 2
                spacingRight = 1
            }
        case .middle:
            if lineThickness == 1 {
                spacingLeft = 1
                spacingRight = 0
            } else {
                spacingLeft = 1
                spacingRight = 1
            }
        case .bookendRight:
            if lineThickness == 1 {
                spacingLeft = 1
                spacingRight = 1
            } else {
                spacingLeft = 1
                spacingRight = 2
            }
        }
        
        var height = magicalSegmentedPickerViewModel.layoutHeight
        height -= universalPaddingTop
        height -= universalPaddingBottom
        height -= lineThickness
        height -= lineThickness
        
        let color: Color
        if magicalSegmentedPickerViewModel.isDarkModeEnabled {
            if magicalSegmentedPickerViewModel.isEnabled {
                if isSelected {
                    color = ToolInterfaceTheme.contextUnderlayHighlightedEnabledDark
                } else {
                    color = ToolInterfaceTheme.contextUnderlayEnabledDark
                }
            } else {
                if magicalSegmentedPickerViewModel.isHighlighted {
                    color = ToolInterfaceTheme.contextUnderlayHighlightedDisabledDark
                } else {
                    color = ToolInterfaceTheme.contextUnderlayDisabledDark
                }
            }
        } else {
            if magicalSegmentedPickerViewModel.isEnabled {
                if isSelected {
                    color = ToolInterfaceTheme.contextUnderlayHighlightedEnabledLight
                } else {
                    color = ToolInterfaceTheme.contextUnderlayEnabledLight
                }
            } else {
                if magicalSegmentedPickerViewModel.isHighlighted {
                    color = ToolInterfaceTheme.contextUnderlayHighlightedDisabledLight
                } else {
                    color = ToolInterfaceTheme.contextUnderlayDisabledLight
                }
            }
        }
        
        return HStack(spacing: 0.0) {

#if INTERFACE_HINTS
            Spacer()
                .frame(width: CGFloat(spacingLeft), height: 18.0)
                .background(Color(red: 0.65, green: 1.0, blue: 0.35, opacity: 0.40))
#else
            Spacer()
                .frame(width: CGFloat(spacingLeft))
#endif
            
            unevenRoundedRectangle
            
#if INTERFACE_HINTS
            Spacer()
                .frame(width: CGFloat(spacingRight), height: 18.0)
                .background(Color(red: 0.65, green: 1.0, blue: 0.35, opacity: 0.40))
#else
            Spacer()
                .frame(width: CGFloat(spacingRight))
#endif
            
        }
        .frame(width: CGFloat(magicalSegmentedPickerButtonViewModel.width),
               height: CGFloat(height))
        .foregroundStyle(color)
    }
    */
}
