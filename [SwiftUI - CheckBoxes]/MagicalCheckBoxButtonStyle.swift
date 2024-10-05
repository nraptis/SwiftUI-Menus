//
//  MagicalCheckBoxButtonStyle.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 4/3/24.
//

import SwiftUI

struct MagicalCheckBoxButtonStyle: ButtonStyle {
    
    @Environment(MagicalCheckBoxViewModel.self) var magicalCheckBoxViewModel: MagicalCheckBoxViewModel
    
    let orientation: Orientation
    let layoutSchemeFlavor: LayoutSchemeFlavor
    let universalPaddingTop: Int
    let universalPaddingBottom: Int
    let isChecked: Bool
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
               height: CGFloat(magicalCheckBoxViewModel.layoutHeight))
        
    }
    
    func bodyContent(isPressed: Bool) -> some View {
        return HStack(spacing: 0.0) {
            MagicalCheckBoxContent(orientation: orientation,
                                   layoutSchemeFlavor: layoutSchemeFlavor,
                                   isPressed: isPressed,
                                   isChecked: isChecked,
                                   isEnabled: isEnabled,
                                   isDarkMode: isDarkMode,
                                   universalPaddingTop: universalPaddingTop,
                                   universalPaddingBottom: universalPaddingBottom,
                                   layoutWidth: layoutWidth)
        }
        .frame(width: CGFloat(layoutWidth),
               height: CGFloat(magicalCheckBoxViewModel.layoutHeight))
        .background(getStrokeRect(isPressed: isPressed))
        .background(getFillRect(isPressed: isPressed))
        
    }
    
    func getStrokeRect(isPressed: Bool) -> some View {
        
        let cornerRadius = OLDOLDCheckBoxLayout.getCornerRadius(orientation: orientation)
        let lineThickness = OLDOLDCheckBoxLayout.getLineThickness(orientation: orientation)
        
        let color: Color
        if isPressed {
            if isEnabled {
                color = ToolInterfaceTheme.primaryDownEnabled
            } else {
                color = ToolInterfaceTheme.primaryDownDisabled
            }
        } else {
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
        }
        
        let height = magicalCheckBoxViewModel.layoutHeight - (universalPaddingTop + universalPaddingBottom)
        
        return HStack(spacing: 0.0) {
            RoundedRectangle(cornerRadius: CGFloat(cornerRadius))
                .stroke(style: StrokeStyle(lineWidth: CGFloat(lineThickness)))
        }
        .frame(width: CGFloat(layoutWidth),
               height: CGFloat(height))
        .foregroundStyle(color)
        /*
        return HStack(spacing: 0.0) {
            RoundedRectangle(cornerRadius: CGFloat(cornerRadius))
                .stroke(style: StrokeStyle(lineWidth: CGFloat(lineThickness)))
        }
        .frame(width: CGFloat(layoutWidth),
               height: CGFloat(height))
        .foregroundStyle(color)
        */
    }
    
    func getFillRect(isPressed: Bool) -> some View {
        
        let cornerRadius = OLDOLDCheckBoxLayout.getCornerRadius(orientation: orientation)
        var height = magicalCheckBoxViewModel.layoutHeight
        height -= universalPaddingTop
        height -= universalPaddingBottom
        
        let color: Color
        if isDarkMode {
            if isEnabled {
                if isPressed {
                    color = ToolInterfaceTheme.contextUnderlayDownEnabledDark
                } else {
                    if isChecked {
                        color = ToolInterfaceTheme.contextUnderlayHighlightedEnabledDark
                    } else {
                        color = ToolInterfaceTheme.contextUnderlayEnabledDark
                    }
                }
            } else {
                if isPressed {
                    color = ToolInterfaceTheme.contextUnderlayDownDisabledDark
                } else {
                    if isChecked {
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
                    if isChecked {
                        color = ToolInterfaceTheme.contextUnderlayHighlightedEnabledLight
                    } else {
                        color = ToolInterfaceTheme.contextUnderlayEnabledLight
                    }
                }
            } else {
                if isPressed {
                    color = ToolInterfaceTheme.contextUnderlayDownDisabledLight
                } else {
                    if isChecked {
                        color = ToolInterfaceTheme.contextUnderlayHighlightedDisabledLight
                    } else {
                        color = ToolInterfaceTheme.contextUnderlayDisabledLight
                    }
                }
            }
        }
        
        return HStack(spacing: 0.0) {
            RoundedRectangle(cornerRadius: CGFloat(cornerRadius))
        }
        .frame(width: CGFloat(layoutWidth),
               height: CGFloat(height))
        .foregroundStyle(color)
        /*
        return HStack(spacing: 0.0) {
            RoundedRectangle(cornerRadius: CGFloat(cornerRadius))
                .stroke(style: StrokeStyle(lineWidth: CGFloat(lineThickness)))
        }
        .frame(width: CGFloat(layoutWidth),
               height: CGFloat(height))
        .foregroundStyle(color)
        
        return HStack(spacing: 0.0) {
            
        }
        .frame(width: CGFloat(layoutWidth),
               height: CGFloat(height))
        .foregroundStyle(color)
        */
    }
    /*
    func getStrokeRect(isPressed: Bool) -> some View {
        let cornerRadius = OLDOLDCheckBoxLayout.getCornerRadiusOuter(orientation: orientation)
        let width = layoutWidth
        let height = magicalCheckBoxViewModel.layoutHeight - (universalPaddingTop + universalPaddingBottom)
        return RoundedRectangle(cornerRadius: CGFloat(cornerRadius))
            .frame(width: CGFloat(width), height: CGFloat(height))
            .foregroundStyle(ToolInterfaceTheme.gray500)
    }
    
    func getFillRect(isPressed: Bool) -> some View {
        
        let lineThickness = OLDOLDCheckBoxLayout.getLineThickness(orientation: orientation)
        let cornerRadius = OLDOLDCheckBoxLayout.getCornerRadiusInner(orientation: orientation)

        let color: Color
        if isPressed {
            color = ToolInterfaceTheme.gray200.opacity(0.75)
        } else {
            color = ToolInterfaceTheme.gray200
        }
        
        let width = layoutWidth - (lineThickness + lineThickness)
        let height = magicalCheckBoxViewModel.layoutHeight - (lineThickness + lineThickness + universalPaddingTop + universalPaddingBottom)
        
        return RoundedRectangle(cornerRadius: CGFloat(cornerRadius))
            .frame(width: CGFloat(width),
                   height: CGFloat(height))
            .foregroundStyle(color)
    }
    */
}
